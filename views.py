from django.http import HttpResponse
import datetime
from jxc.models import CUSTOM
from django.shortcuts import render_to_response

def hello(request):
    now = datetime.datetime.now()
    html = "<html><body><h3>Hello World!</h3>It is now %s </body></html>" % now
    return HttpResponse(html)
	
def costomlist(request):
	list=CUSTOM.objects.all()
	return render_to_response('customlist.html',{'customlist':list})