from django.db import models

#用户表
class CUSTOM(models.Model):
    custom_name = models.CharField(max_length=30)
    custom_phone = models.CharField(max_length=11)
    custom_gender = models.CharField(max_length=1, choices=(('M', '男人'), ('F', u'女人')))
    custom_adress = models.CharField(max_length=50)
    custom_comment = models.CharField(max_length=50)
    updatetime = models.DateField(auto_now=True)

    def __unicode__(self):
        return u'%s' % (self.id)

    class Admin:
        pass


#订单表
class ORDER(models.Model):
    user_id = models.ForeignKey(CUSTOM)
    bookdate = models.DateTimeField()
    deliveredate = models.DateField()
    sum = models.IntegerField(max_length=20)
    paid = models.IntegerField(max_length=20)
    debt = models.IntegerField(max_length=20)
    updatetime = models.DateField(auto_now=True)
    addr = models.CharField(max_length=60)
    owner = models.CharField(max_length=20)
    delivered = models.CharField(max_length=10)
    paidoff = models.CharField(max_length=10)

    def __unicode__(self):
        return u'%s' % (self.id)

    class Admin:
        pass


#商品分类表
class ITEM_TYPE(models.Model):
    tpye_code = models.CharField(max_length=20)
    tpye_name = models.CharField(max_length=30)

    def __unicode__(self):
        return u'%s %s' % (self.tpye_code, self.tpye_name)

    class Admin:
        pass


#订单归属表
class ORDER_OWNER(models.Model):
    owner_code = models.CharField(max_length=20)
    owner_name = models.CharField(max_length=30)

    def __unicode__(self):
        return u'%s' % (self.owner_code)

    class Admin:
        pass


#订单明细表
class ORDER_Detail(models.Model):
    order_id = models.ForeignKey(ORDER)
    stdid = models.IntegerField(max_length=20)
    item_type = models.CharField(max_length=30)
    item_name = models.CharField(max_length=30)
    item_price = models.IntegerField(max_length=20)
    std_price = models.IntegerField(max_length=20)
    item_num = models.IntegerField(max_length=20)
    item_class = models.CharField(max_length=512)
    item_standard = models.CharField(max_length=1024)
    corrected = models.CharField(max_length=5)

    def __unicode__(self):
        return u'%s %s %s' % (self.order_id, self.id, self.item_price)

    class Admin:
        pass


#货品标准化
class STD_Item(models.Model):
    STD_type = models.CharField(max_length=30)
    STD_name = models.CharField(max_length=30)
    STD_price = models.IntegerField(max_length=20)
    PRC_price = models.IntegerField(max_length=20)
    standard = models.CharField(max_length=1024)
    updatetime = models.DateField(auto_now=True)

    def __unicode__(self):
        return u'%s' % (self.STD_name)

    class Admin:
        pass

#留言表
class MSG_BOARD(models.Model):
    msgcontent = models.CharField(max_length=2048)
    msgcreater = models.CharField(max_length=30)
    msgcreatetime = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return u'%s' % (self.msgcontent)

    class Admin:
        pass

#库存表
class STD_STORAGE(models.Model):
    #商品ID
    STD_GOODS_ID=models.CharField(max_length=15)
    #所在仓库号
    storage=models.CharField(max_length=15)
    #来源仓库
    fromStorage=models.CharField(max_length=15)
    #库存量
    stoke=models.IntegerField(max_length=10)
    #更新时间
    updatetime = models.DateTimeField(auto_now=True)


#商品信息表
class STD_GOODSINFO(models.Model):
    #商品名
    name=models.CharField(max_length=30)
    #商品分类
    type=models.CharField(max_length=20)
    #规格
    standard=models.CharField(max_length=2048)
    #产地
    productedBy=models.CharField(max_length=512)
    #更新时间
    updatetime=models.DateTimeField(auto_now=True)

#标准价格表
class STD_PRICE(models.Model):
    #商品ID
    STD_GOODS_ID=models.CharField(max_length=15)
    #商品标准价
    price=models.IntegerField(max_length=20)
    #历史价格
    priceHistory=models.CharField(max_length=128)
    #更新时间
    updatetime=models.DateTimeField(auto_now=True)

#图片归属表
class IMG_OWNER(models.Model):
    #图片名
    name=models.CharField(max_length=512)
    #归属商品
    goodsid=models.ForeignKey(STD_GOODSINFO)
    #图片相对地址
    goodUrl=models.CharField(max_length=2048)
    #更新时间
    updatetime=models.DateTimeField(auto_now=True)