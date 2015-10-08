from django.conf.urls.defaults import patterns, include, url
from django.conf.urls.defaults import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
                       url(r'^admin/', include(admin.site.urls)),
                       ('^hello/$', 'site0.views.hello'),
                       ('^$', 'site0.jxc.views.welcome'),
                       ('^login$', 'site0.jxc.views.login'),

                       ('^custom/$', 'site0.jxc.views.costomlist'),
                       ('^record/$', 'site0.jxc.views.recordpage'),
                       ('^record/Submit$', 'site0.jxc.views.submit'),
                       ('^orderDisply/$', 'site0.jxc.views.orderVeiwer'),
                       #	('^selection/$','site0.jxc.views.itemTpyelist'),
                       ('^orderlist/$', 'site0.jxc.views.orderlist'),
                       ('^custlocation/$', 'site0.jxc.views.custlocation'),
                       ('^messageBoard/$', 'site0.jxc.views.messageBoard'),  #留言板
                       ('^report/$', 'site0.jxc.views.report'),  #报表
                       ('^performance/$', 'site0.jxc.views.performance'),  #报表
                       ('^standardization/$', 'site0.jxc.views.standardization'),  #价格同步
                       ('^pricedetermination/$', 'site0.jxc.views.pricedetermination'),  #价格同步展示
                       ('^resume/$', 'site0.jxc.views.resume'),  #价格同步展示
                       ('^deploy/$', 'site0.jxc.views.deploy'),  #货物部署
                       ('^upload/$', 'site0.jxc.views.goodsInfoUpload'),  #商品信息上传
                       ('^goodDisplay/$', 'site0.jxc.views.goodDisplay'),  #商品详情展示

                       #ajax服务器
                       ('^record/checkcustomer/$', 'site0.jxc.views.checkcustomer'),  #顾客存在验证
                       ('^orderDisply/changeStatus/$', 'site0.jxc.views.changeStatus'),  #改变订单状态

                       (r'^js/(?P<path>.*)$', 'django.views.static.serve', {'document_root': './js'}),
                       (r'^images/(?P<path>.*)$', 'django.views.static.serve', {'document_root': './images'}),
                       (r'^css/(?P<path>.*)$', 'django.views.static.serve', {'document_root': './css'}),
                       (r'^imageBed/(?P<path>.*)$', 'django.views.static.serve', {'document_root': './imageBed'}),
)