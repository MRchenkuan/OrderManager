#-*- coding: UTF-8 -*-
# Create your views here.
import time
from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render_to_response
from jxc.models import CUSTOM, ITEM_TYPE, ORDER_Detail, ORDER, ORDER_OWNER, MSG_BOARD, STD_Item, STD_GOODSINFO,STD_PRICE,STD_STORAGE,IMG_OWNER
import os
import random
from django.db import transaction
from decorators import *
import Image
from PublicTools import reSizeImg


@login_identify
def welcome(request):
    return render_to_response('home.html')

@login_identify
def costomlist(request):
    list = CUSTOM.objects.all()
    return render_to_response('customlist.html', {'customlist': list})

@login_identify
def itemTpyelist(request):
    list = ITEM_TYPE.objects.all()
    return render_to_response('itemtypelist.html', {'itemtpyelist': list})

@login_identify
def recordpage(request):
    ITEMLIST = ITEM_TYPE.objects.all()
    OWERLIST = ORDER_OWNER.objects.all()
    Dict = {'itemtpyelist': ITEMLIST, 'owners': OWERLIST}
    return render_to_response('record.html', {'Dict': Dict})

@login_identify
def submit(request):
    if request.method == 'POST':
        #基本信息
        cust_name = request.POST.getlist('cust_name')
        #gender=request.POST.getlist('gender')
        phone = request.POST.getlist('phone')
        #comment=request.POST.getlist('comment')

        #订单信息
        address = request.POST.getlist('address')
        bookdate = request.POST.getlist('bookdate')
        deliverydate = request.POST.getlist('deliverydate')
        sum = request.POST.getlist('sum')
        paid = request.POST.getlist('paid')
        debt = request.POST.getlist('debt')
        orderowner = request.POST.getlist('orderOwner')
        delivered = 'N'
        if debt[0] == "0":
            paidoff = "Y"
        else:
            paidoff = "N"
        #订单明细 复数
        itemnameS = request.POST.getlist('itemname')
        #itemtypeS=request.POST.getlist('itemtype')
        itempriceS = request.POST.getlist('itemprice')
        numberS = request.POST.getlist('number')

        #订单项目数
        itemnum = len(request.POST.getlist('itemname'))

        if (CUSTOM.objects.filter(custom_phone=phone[0])):
            print "custom created"
            custom = CUSTOM.objects.filter(custom_phone=phone[0])[0]  #filter返回的都是list
            print custom
        else:
            print "custom creating..."
            custom = CUSTOM(
                custom_name=cust_name[0],  #custom_gender=gender[0],
                custom_phone=phone[0],
                custom_adress=address[0],  #custom_comment=comment[0],
            )
            custom.save()

        order = ORDER(
            user_id=custom,
            addr=address[0],
            bookdate=bookdate[0],
            deliveredate=deliverydate[0],
            sum=sum[0],
            paid=paid[0],
            debt=debt[0],
            owner=orderowner[0],
            paidoff=paidoff,
            delivered=delivered
        )
        order.save()

        for i in range(0, itemnum):
            order_detail = ORDER_Detail(
                order_id=order,  #item_type=itemtypeS[i],
                item_name=itemnameS[i] + ' ',
                item_price=itempriceS[i],
                item_num=numberS[i],
                std_price=0
            )
            order_detail.save()

        #return HttpResponse("提交失败！请返回重试<input type='button' value='转到订单录入' onclick=\"location='../../record/'\" style=\"width:15%; height:40px\"/>")
        return HttpResponse(
            "<input type='button' value='提交成功，再录一条' onclick=\"location='../../record/'\" style=\"width:15%; height:40px\"/>")


#牛逼到爆的list构造工具
@login_identify
def orderlist(request):
    toPage = request.GET.get('toPage', '0')
    pageSize = 20
    #customs = CUSTOM.objects.all()
    list = []
    try:
        QuerySet = request.GET['QuerySet']
    except:
        #print u"request.GET'QuerySet'错误,所以QuerySet自动设为Activity，有时间可以改正，通过 'pereiod' in request.method=='GET'"
        QuerySet = "Activity"
    if QuerySet == 'Activity':
        allOrders = ORDER.objects.exclude(delivered='Y', paidoff='Y').order_by('-bookdate')
    elif QuerySet == 'undelivered':
        allOrders = ORDER.objects.filter(delivered='N').order_by('-bookdate')
    elif QuerySet == 'unpaidoff':
        allOrders = ORDER.objects.filter(paidoff='N').order_by('-bookdate')
    elif QuerySet == 'all':
        allOrders = ORDER.objects.all().order_by('-bookdate')[int(toPage) * pageSize:(int(toPage) + 1) * pageSize]
    else:
        allOrders = ORDER.objects.exclude(delivered='Y', paidoff='Y').order_by('-bookdate')

    for order in allOrders:
        orders = {}  #建立一个字典
        items = []  #建立一个list
        order_details = ORDER_Detail.objects.filter(order_id=order)
        for eachItem in order_details:
            item = {}  #建立一个字典
            item['name'] = eachItem.item_name
            item['number'] = eachItem.item_num
            if eachItem.std_price == 0:
                item['price'] = eachItem.item_price
            else:
                item['price'] = eachItem.item_price
            items.append(item)  #向items list中添加所有的项目
        orders['items'] = items
        orders['custom_name'] = order.user_id.custom_name
        orders['order_id'] = order
        orders['order_bookdate'] = order.bookdate
        orders['order_price'] = order.sum
        orders['owner'] = ORDER_OWNER.objects.filter(owner_code=order.owner)[0].owner_name  #关联取值
        orders['paidoff'] = order.paidoff
        orders['delivered'] = order.delivered
        orders['debt'] = order.debt
        list.append(orders)
    return render_to_response('orderlist.html', {'list': list, 'nowpage': toPage, 'pagesize': pageSize})


#订单查询工具  input orderId
@login_identify
def orderVeiwer(request):
    if request.method == 'GET':
        orderId = request.GET['orderId']
        print orderId
        order = {}  #建立一个字典
        items = []  #建立一个list
        orderDetails = ORDER.objects.filter(id=orderId)  #获取的数据对象是一个列表？
        orderAndDetails = ORDER_Detail.objects.filter(order_id=orderId)
        order['totlePrice'] = 0
        for eachItem in orderAndDetails:  #构建一条订单
            item = {}  #建立一个字典
            item['name'] = eachItem.item_name
            item['number'] = eachItem.item_num
            if eachItem.std_price == 0 or not eachItem.std_price:
                item['price'] = eachItem.item_price
            else:
                item['price'] = eachItem.std_price
            item['sumprice'] = item['number'] * item['price']
            order['totlePrice'] = order['totlePrice'] + item['sumprice']
            items.append(item)  #向items list中添加所有的项目
        order['items'] = items
        order['order_addr'] = orderDetails[0].addr
        order['order_updatetime'] = orderDetails[0].updatetime
        order['custom_name'] = CUSTOM.objects.get(id=orderDetails[0].user_id.id).custom_name  #通过外键关联取值
        order['custom_phone'] = CUSTOM.objects.get(id=orderDetails[0].user_id.id).custom_phone  #通过外键关联取值
        order['order_id'] = orderDetails[0]
        order['order_bookdate'] = orderDetails[0].bookdate
        order['order_deliveredate'] = orderDetails[0].deliveredate
        order['final_price'] = orderDetails[0].sum
        order['paid'] = orderDetails[0].paid
        order['debt'] = orderDetails[0].debt
        order['final_price'] = orderDetails[0].sum
        order['owner'] = ORDER_OWNER.objects.get(owner_code=orderDetails[0].owner).owner_name  #多重关联取值
        order['paidoff'] = orderDetails[0].paidoff
        order['delivered'] = orderDetails[0].delivered
        return render_to_response('orderDisply.html', {'order': order})


#顾客录单时检查
@login_identify
def checkcustomer(request):
    if request.method == 'GET':
        try:
            phone = request.GET['phone']
            cust = CUSTOM.objects.filter(custom_phone=phone)[0]
        except:
            cust = False
        print cust
        if cust:
            custname = cust.custom_name
            custid = cust.id
            print custid
            order = ORDER.objects.filter(user_id=custid)[0]
            bookdate = order.bookdate
            bookdate = bookdate.strftime('%Y-%m-%d')
            sum = order.sum
            responseTXT = u'顾客存在！\n\n     该顾客叫做：%s，曾在%s 购买了 %s 元的商品\n\n请复核订单再确定录入。' % (custname, bookdate, sum)
            print responseTXT
            return HttpResponse(responseTXT)
        else:
            return HttpResponse('201')


#留言板方法
@login_identify
def messageBoard(request):
    if request.method == 'GET':
        toPage = 0
        pageSize = 20
        try:
            toPage = request.GET['PageNumb'] - 1
            print toPage
        except:
            print "toPage exception..."
            toPage = 0
            print toPage
        try:
            msgObjs = MSG_BOARD.objects.all().order_by('-msgcreatetime')[toPage * pageSize:(toPage + 1) * pageSize]
            print msgObjs[0].msgcontent
        except:
            pass
        return render_to_response('message.html', {'msgObjs': msgObjs})
    if request.method == "POST":
        try:
            msgcontent = request.POST['content']
        except:
            return render_to_response('message.html')
        if request.POST['msgWriteName']:
            msgWriteName = request.POST['msgWriteName']
        else:
            msgWriteName = '游客'
        msg = MSG_BOARD(
            msgcontent=msgcontent,
            msgcreater=msgWriteName,
        )
        msg.save()
        toPage = 0
        pageSize = 20
        msgObjs = MSG_BOARD.objects.all().order_by('-msgcreatetime')[toPage * pageSize:(toPage + 1) * pageSize]
        return render_to_response('message.html', {'msgObjs': msgObjs})


#地理位置
@login_identify
def custlocation(request):
    Orderlocations = ORDER.objects.all()
    print Orderlocations
    return render_to_response('custlocation.html', {'Orderlocations': Orderlocations})


#订单状态
def changeStatus(request):
    if request.POST.get('delivered') and request.POST.get('orderid'):
        print request.POST.get('delivered')
        print request.POST.get('orderid')
        order = ORDER.objects.filter(id=request.POST.get('orderid'))[0]
        order.delivered = 'Y'
        order.save()
        return HttpResponse('200')

    if request.POST.get('paidoff') and request.POST.get('orderid'):
        print request.POST.get('paidoff')
        print request.POST.get('orderid')
        order = ORDER.objects.filter(id=request.POST.get('orderid'))[0]
        print order.paidoff
        order.paidoff = 'Y'
        order.save()
        return HttpResponse('200')


#报表分析
@login_identify
def report(request):
    if request.method == 'GET':
        orders = ORDER.objects.all().order_by('-bookdate')
        #print orders
        daysum = {}
        monthsum = {}
        list = {}
        totlesumAll = 0
        ordercount = len(ORDER.objects.all())  #订单总数

        for order in orders:
            bookday = order.bookdate.strftime('%Y-%m-%d')  #格式化订单日期
            bookmonth = order.bookdate.strftime('%Y年%m月份')  #格式化订单月份
            totlesumAll += order.sum  #计算所取订单的总和

            if monthsum.has_key(bookmonth):  #判断是否存在月份值
                monthsum[bookmonth][1] += order.sum  #月流水计算
                monthsum[bookmonth][0] += 1  #月流订单量
            else:
                monthsum[bookmonth] = [1, order.sum]

            if daysum.has_key(bookday):  #判断是否存在日期值
                daysum[bookday][1] += order.sum  #日流水计算
                daysum[bookday][0] += 1  #日订单量
            else:
                daysum[bookday] = [1, order.sum]
            #print daysum

        list['daysum'] = sorted(daysum.iteritems(), key=lambda d: d[0])
        list['monthsum'] = sorted(monthsum.iteritems(), key=lambda d: d[0])
        list['totlesumAll'] = [ordercount, totlesumAll]

        #print list['monthsum']
        print 1
        return render_to_response('report.html', {'list': list})


#绩效计算器
@login_identify
def performance(request):
    orders = ORDER.objects.filter()

    monthDic = {}
    perRate = 0.005  #提成率
    revenue = 0  #奖金基数
    bonus = lambda x, y: x * y  #奖金计算方式
    if 'pereiod' in request.GET:
        print request.GET
        return HttpResponse(u'接收到参数:' + request.GET['pereiod'])

    else:
        for order in orders:
            staffname = ORDER_OWNER.objects.filter(owner_code=order.owner)[0].owner_name
            if monthDic.has_key(staffname):
                monthDic[staffname]['bonus'] += order.sum * perRate
                monthDic[staffname]['revenue'] += order.sum
            else:
                monthDic[staffname] = {'name': staffname, 'revenue': (revenue + order.sum),
                                       'perRate': '%s%%' % (perRate * 100),
                                       'bonus': bonus(perRate, (order.sum + revenue))}
        print monthDic.values()
        list = monthDic.values()
        return render_to_response('performance.html', {'monthDic': list})


#价格同步中心主页
@login_identify
def pricedetermination(request):
    orderdetail = ORDER_Detail.objects.filter(corrected='N')
    #orderdetail=ORDER_Detail.objects.raw('select * from jxc_ORDER_Detail where corrected=\'N\'')
    #print orderdetail
    itemlist = []
    for obj in orderdetail:
        priceitem = {}
        priceitem['id'] = obj.id
        priceitem['fullname'] = obj.item_name
        #priceitem['type']=obj.item_type
        priceitem['name'] = obj.item_name.split(' ')[0]
        priceitem['price'] = obj.item_price
        priceitem['standard'] = ''.join(obj.item_name.split(' ')[1:])
        itemlist.append(priceitem)
        #print itemlist
        #obj.item_name=obj.item_name.split(' ')[0]
        #print obj.item_name
    return render_to_response('pricedetermination.html', {'itemlist': itemlist, 'count': len(itemlist)})


#检验重复
def itemIsInList(item, itemlist):
    for eachitem in itemlist:
        if eachitem['name'] == item:
            return True
    return False


#标准化
@login_identify
def standardization(request):
    print 'yes'
    if request.POST.get('fullname'):
        fullname = request.POST.get('fullname')
    else:
        fullname = 'null'

    if request.POST.get('id'):
        id = request.POST.get('id')
    else:
        id = 'null'

    if request.POST.get('name'):
        name = request.POST.get('name')
    else:
        name = 'null'

    if request.POST.get('standard'):
        standard = request.POST.get('standard')
    else:
        standard = 'null'

    if request.POST.get('price'):
        price = request.POST.get('price')
    else:
        price = 0
    print id

    slipname = name + ' '

    #标准化项目表
    stdItem = STD_Item(
        STD_name=slipname,
        STD_price=price,
        standard=standard,
    )
    stdItem.save()


    #print slipname
    ordtails = ORDER_Detail.objects.filter(id=id)
    #print ordtails
    for ordtail in ordtails:
        ordtail.std_price = price
        ordtail.stdid = stdItem.id
        ordtail.item_class = name
        ordtail.item_standard = standard
        ordtail.corrected = 'Y'
        ordtail.save()
        print ordtail

    return render_to_response('pricedetermination.html')


#个人简历
@login_identify
def resume(request):
    return render_to_response('resume.html')

#货物部署情况
@login_identify
def deploy(request):
    if 'shopid' in request.GET:
        shopid = request.GET.get('shopid')
        goodsInShop=STD_STORAGE.objects.filter(storage=shopid).order_by('-updatetime')
    else:
        goodsInShop=STD_STORAGE.objects.all()
    sofa_list = []
    bed_list = []
    desk_list = []
    taofang_list = []
    other_list = []
    for good in goodsInShop:
        goodid = good.STD_GOODS_ID
        goodCount = good.stoke
        goodinfo = STD_GOODSINFO.objects.filter(id=goodid)
        goodimgs = IMG_OWNER.objects.filter(goodsid=goodid)
        print len(goodimgs)
        print goodid,good,goodimgs
        goodurllist=[]
        for goodimg in goodimgs:
            goodurl = goodimg.goodUrl+'/thumbs/'+goodimg.name
            goodurllist.append(goodurl)
        goodprice = STD_PRICE.objects.filter(STD_GOODS_ID=goodid)
        goodtype = goodinfo[0].type
        goodstd=goodinfo[0].standard.replace(u'，',',')#货物规格字符串，将中文逗号替换为英文逗号
        goodstd=goodstd.split(',')#货物规格列表#产地，生产年月，尺寸，颜色，用料，注意事项

        goodobject = {
            'goodid':goodid,
            'GOODIMGURLS':goodurllist,
            'GOODNAME':goodinfo[0].name,
            'GOODCOUNT':goodCount,
            'GOODSTD':goodstd,
            'GOODPRICE':goodprice[0].price,
            'goodtype':goodtype,
            'goodlocation':good.storage
        }
        if goodobject['goodtype']=='sofa':
            sofa_list.append(goodobject)
        elif goodobject['goodtype']=='bed':
            bed_list.append(goodobject)
        elif goodobject['goodtype']=='taofang':
            taofang_list.append(goodobject)
        elif goodobject['goodtype']=='desk':
            desk_list.append(goodobject)
        else:
            other_list.append(goodobject)
    return render_to_response('deploy.html',{'sofalist':sofa_list,'bedlist':bed_list,'taofanglist':taofang_list,'desklist':desk_list,'other':other_list})

#商品信息上传
@login_identify
@transaction.commit_manually
def goodsInfoUpload(request):
    if request.method=='POST':
        try:
            INFO = request.POST

            #商品信息保存
            goodInfo=STD_GOODSINFO(
                name=INFO.get('goodname'),
                type=INFO.get('goodType'),
                standard=INFO.get('standard'),
                productedBy=INFO.get('product')
            )
            goodInfo.save()

            #商品价格保存
            price = STD_PRICE(
                STD_GOODS_ID = goodInfo.id,
                price = int(INFO.get('goodprice')),
                priceHistory = 0
            )
            price.save()

            #库存信息保存
            storage = STD_STORAGE(
                STD_GOODS_ID = goodInfo.id,
                storage = INFO.get('tostorage'),
                fromStorage = INFO.get('fromstorage'),
                stoke = INFO.get('stoke')
            )
            storage.save()

            #图片信息保存
            for img in request.FILES.getlist('imgFile'):
                file_obj = img
                file_name = str(time.time())[0:10]+str(random.randint(0,100000))+'.jpg'
                #图片的物理相对路径与网页上显示的路径
                file_full_path = './imageBed/'+INFO.get('goodType')+'/'
                file_html_path = '/imageBed/'+INFO.get('goodType')+'/'
                #图片完整路径名
                file_full_name=file_full_path+file_name
                #缩略图物理相对路径与网页显示路径
                thumbs_full_path='./imageBed/'+INFO.get('goodType')+'/thumbs/'
                thumbs_html_path='/imageBed/'+INFO.get('goodType')+'/thumbs/'

                image = IMG_OWNER(
                    name = file_name,
                    goodsid = goodInfo,
                    goodUrl = file_html_path
                )
                image.save()

                #图片固化
                uploadimg = Image.open(file_obj)
                #生成图片
                resizedImg = uploadimg.resize((1400,900), Image.ANTIALIAS)
                thumbs=uploadimg.resize((280,190), Image.ANTIALIAS)


                if not os.path.exists(file_full_path):
                    os.mkdir(file_full_path)
                if not os.path.exists(thumbs_full_path):
                    os.mkdir(thumbs_full_path)
                resizedImg.save(file_full_path+file_name,quality=100)
                thumbs.save(thumbs_full_path+file_name,quality=100)
                print '原图',type(resizedImg)
                print '缩略图类型：',type(thumbs)

        except:
            os.remove(file_full_name)
            os.remove(thumbs_full_path)
            transaction.rollback()
            return render_to_response('goodsUpload.html',{'imgurl':'提交出现异常'})
        else:
            transaction.commit()
            return render_to_response('goodsUpload.html',{'imgurl':thumbs_html_path+file_name})

    elif request.method=='GET':
        if 'shopid' in request.GET:
            shopid=request.GET.get('shopid')
            return render_to_response('goodsUpload.html',{'shopid':shopid})
    return render_to_response('goodsUpload.html')

#商品展示
@login_identify
def goodDisplay(request):
    if request.method == 'GET' and 'goodid' in request.GET:
        goodid = request.GET.get('goodid')
        goodinfo = STD_GOODSINFO.objects.filter(id=goodid)[0]
        goodimgs = IMG_OWNER.objects.filter(goodsid=goodid)
        goodstorages = STD_STORAGE.objects.filter(STD_GOODS_ID=goodid)
        return render_to_response('goodisplay.html',{'goodinfo':goodinfo,'goodimgs':goodimgs,'goodstorages':goodstorages})
    else:
        return render_to_response('goodisplay.html')

#系统登录
def login(request):
    u = request.POST.get('username')
    p = request.POST.get('password')
    reference = request.POST.get('reference')

    if u=='ckadol' and p=='ckadol':
        response = HttpResponseRedirect(reference)
        response.set_cookie("sessionid",request.session.session_key)
        return response
    else:
        response = HttpResponseRedirect('/login/')
        return response