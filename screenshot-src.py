



"""
Documentation comments are detected in Python docstrings with the PythonImproved package installed
"""

from django.views.decorators.http import require_GET, require_POST
from app.decorators import response_body_json

class User(object):
    def __init__(self):
        pass

@require_GET
@response_body_json(
    methods = ['GET'],
    demand  = ['user']
)
def user_login(request, response, user, body=None):
    if request.method == 'GET':
        print 'this %(derogatory)s user is an idiot (name = %s)' % user.get_name()
        return response.succeeded(data={ 'user': user.get_json_obj(), })
    else:
        assert False, 'Error: You have reached an impossible condition.  Keep an eye out for agents.'

