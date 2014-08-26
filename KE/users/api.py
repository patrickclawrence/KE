from tastypie.resources import ModelResource,  ALL, ALL_WITH_RELATIONS
from users.models import BattleUser, BattleLog
from tastypie.authentication import BasicAuthentication
from tastypie.authorization import Authorization
from tastypie import fields
from tastypie.resources import csrf_exempt
from tastypie.exceptions import BadRequest, ApiFieldError, ImmediateHttpResponse
from tastypie.http import HttpBadRequest
from tastypie.utils.timezone import now
import logging
from django.conf import settings
from types import *
from django.utils.cache import patch_cache_control

# Get an instance of a logger
logger = logging.getLogger('users')


class ErrorModelResource(ModelResource):
    """
        Class ErrorModelResource

        Extend the ModelResource class to introduce custom error handling for this application

    """
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
                data = {'error': 'true', 'time': now(), 'message': e.args[0]}
                logger.error(data)
                return self.error_response(request, data, response_class=HttpBadRequest)
            except ImmediateHttpResponse as e:
                data = {"error": 'true', 'time': now(), 'msg': e._response.reason_phrase}
                logger.error(data)
                return self.error_response(request, data, response_class=HttpBadRequest)
            except Exception as e:
                if hasattr(e, 'response'):
                    return e.response

                # A real, non-expected exception.
                # Handle the case where the full traceback is more helpful
                # than the serialized error.
                if settings.DEBUG and getattr(settings, 'TASTYPIE_FULL_DEBUG', False):
                    raise

                # Re-raise the error to get a proper traceback when the error
                # happend during a test case
                if request.META.get('SERVER_NAME') == 'testserver':
                    raise

                # Server an error
                return self._handle_500(request, e)
        return wrapper


class BattleUserResource(ErrorModelResource):
    """
     Class BattleUserResource

     Expose an api for the battle user models

    """
    class Meta:
        always_return_data = True
        queryset = BattleUser.objects.all()
        resource_name = 'battleUser'
        authorization = Authorization()
        authentication = BasicAuthentication()
        allowed_methods = ['get', 'post', 'put', 'delete']
        filtering = {
            'nickName': ALL,
            'lastName': ALL
        }

    def dehydrate(self, bundle):
        logger.error(bundle.data)
        request = bundle.request or HttpRequest
        d = {
            'error': False,
            'time': now()
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


class BattleLogResource(ErrorModelResource):
    """
     Class BattleLogResource

     Expose a api for the battle log model
    """
    attacker = fields.ForeignKey(BattleUserResource, 'attacker')
    defender = fields.ForeignKey(BattleUserResource, 'defender')
    winner = fields.ForeignKey(BattleUserResource, 'winner')

    class Meta:
        always_return_data = True
        queryset = BattleLog.objects.all()
        resource_name = 'battles'
        authorization = Authorization()
        authentication = BasicAuthentication()
        allowed_methods = ['get', 'post']
        filtering = {
            'start': ['exact', 'lt', 'lte', 'gte', 'gt']
        }
