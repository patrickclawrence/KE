from tastypie.resources import ModelResource
from users.models import BattleUser, BattleLog
from tastypie.authentication import BasicAuthentication
from tastypie.authorization import Authorization
from tastypie import fields
from tastypie.resources import csrf_exempt
from tastypie.exceptions import BadRequest, ApiFieldError, ImmediateHttpResponse
from tastypie.http import HttpBadRequest
from tastypie.utils.timezone import now
import logging
from types import *

# Get an instance of a logger
logger = logging.getLogger('users')

"""
    Class ErrorModelResource

    Extend the ModelResource class to introduce custom error handling for this application

"""
class ErrorModelResource(ModelResource):
    
    def wrap_view(self, view):
        @csrf_exempt
        def wrapper(request, *args, **kwargs):
            try:
                callback = getattr(self, view)
                response = callback(request, *args, **kwargs)

                if request.is_ajax():
                    patch_cache_control(response, no_cache=True)
                return response
            except (BadRequest, ApiFieldError), e:
                data = {'error' : 'true', 'time': now(), 'message':e.args[0]}
                return self.error_response(request, data, response_class=HttpBadRequest)
            except ImmediateHttpResponse as e:
                data = {"error": 'true', 'time' : now(), 'msg': e._response.reason_phrase}
                return self.error_response(request, data, response_class=HttpBadRequest)
            except Exception as e:
                data = {"error": 'true', 'time' : now(), 'msg': 'Unknown Error hass occured.'}
                return self.error_response(request, data, response_class=HttpBadRequest)
        return wrapper

"""
 Class BattleUserResource

 Expose an api for the battle user models

"""

class BattleUserResource(ErrorModelResource):
    
    class Meta:
        always_return_data = True
        queryset = BattleUser.objects.all()
        resource_name = 'battleUser'
        authorization = Authorization()
        authentication = BasicAuthentication()
        allowed_methods = ['get', 'post', 'put', 'delete']
    

    def dehydrate(self, bundle):
        logger.error(bundle.data)
        request = bundle.request or HttpRequest
        d = {
            'error' : False,
            'time' : now()
        }
        if request.method.lower() == 'post':
            pass
            d['userId'] = bundle.data['id']
        elif request.method.lower() == 'put':
            pass
        else:
            d['user'] = bundle.data
        bundle.data = d

        return bundle

"""
 Class BattleLogResource

 Expose a api for the battle log model
"""

class BattleLogResource(ErrorModelResource):
    
    attacker = fields.ForeignKey(BattleUserResource, 'attacker')
    defender= fields.ForeignKey(BattleUserResource, 'defender')
    winner = fields.ForeignKey(BattleUserResource, 'winner')

    class Meta:
        always_return_data = True
        queryset = BattleLog.objects.all()
        resource_name = 'battles'
        authorization = Authorization()
        authentication = BasicAuthentication()
        allowed_methods = ['get', 'post']
    
