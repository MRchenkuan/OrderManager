from django.contrib import admin
from site0.jxc.models import CUSTOM,ORDER,ORDER_Detail,ITEM_TYPE,ORDER_OWNER
#FILE_CHARSET = 'utf-8'
#DEFAULT_CHARSET = 'utf-8'
#自定义显示列
class CUSTOMA(admin.ModelAdmin):
	#pass
	list_display = ('custom_name','custom_phone','custom_gender','custom_adress','custom_comment','updatetime')
	search_fields = ('custom_name','custom_phone') 
	
class ORDERA(admin.ModelAdmin):
	list_display = ('user_id','addr','sum','paid','debt','bookdate','deliveredate')

class ORDER_DetailA(admin.ModelAdmin):
	list_display = (
		'order_id',
		'item_type',
		'item_name',
		'item_price',
		'item_num',
	)

class ITEM_TYPEA(admin.ModelAdmin):
	list_display =(
		'tpye_code',
		'tpye_name',
	)
	
class ORDER_OWNERA(admin.ModelAdmin):
	list_display =(
		'owner_code',
		'owner_name',
	)
	
admin.site.register(CUSTOM,CUSTOMA)
admin.site.register(ORDER,ORDERA)
admin.site.register(ORDER_Detail,ORDER_DetailA)
admin.site.register(ITEM_TYPE,ITEM_TYPEA)
admin.site.register(ORDER_OWNER,ORDER_OWNERA)



#    list_display = ('product_name','price','stock','create_date')#自定义显示列
#    search_fields = ('product_name','price')#搜索字段
#    list_filter = ('create_date',) #右边小窗过滤器
#    date_hierarchy = 'create_date' #对一个日期型字段进行层次划分
#    ordering = ('-create_date',)#列表排序字段
#    fields  = ('product_name','stock','price','create_date',)#定义表单字段的顺序，默认安装模型中定义顺序