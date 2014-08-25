from django.conf.urls import patterns, include, url
from django.contrib import admin
from users.api import BattleUserResource, BattleLogResource
from tastypie.api import Api


api = Api(api_name='v1')
api.register(BattleLogResource())
api.register(BattleUserResource())

admin.autodiscover()

urlpatterns = patterns('',
                       # Examples:
                       # url(r'^$', 'KE.views.home', name='home'),
                       # url(r'^blog/', include('blog.urls')),
                       url(r'^', include(api.urls)),
                       url(r'^admin/', include(admin.site.urls)),
                       )
