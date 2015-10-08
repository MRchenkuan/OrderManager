import os
import sys
import django.core.handlers.wsgi
sys.path.append(r'H:/web/site0')
sys.path.append(r'H:/web')
os.environ['DJANGO_SETTINGS_MODULE']='site0.settings'
application=django.core.handlers.wsgi.WSGIHandler()
