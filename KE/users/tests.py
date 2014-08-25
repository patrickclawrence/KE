from django.test import TestCase
import datetime
from django.contrib.auth.models import User
from tastypie.test import ResourceTestCase
from users.models import User
from tastypie.utils.timezone import now

# Create your tests here.


class UserResourceTest(ResourceTestCase):
    fixtures = ['test_entries.json']
    
    def setUp(self):
        super(UserResourceTest, self).setUp()

        # Create a user.
        self.username = 'funkyMonkey'
        self.password = 'banana'
        self.user = User.objects.create_user(self.username, 'daniel@example.com', self.password)

        # Fetch the ``battleUser`` object we'll use in testing.
        self.user_1 = Entry.objects.get(firstName='TestUser1')

        # We also build a detail URI, since we will be using it all over.
        # DRY, baby. DRY.
        self.detail_url = '/api/v1/battleuser/{0}/'.format(self.user_1.pk)

        # The data we'll send on POST requests. Again, because we'll use it
        # frequently (enough).
        self.post_data = {
            'user': '/api/v1/battleuser/{0}/'.format(self.user.pk),
            'firstName' : 'TestUser1',
            'lastName' : 'TestUser1',
            'nickName' : 'TestUser1',
            'wins' : 3,
            'losses' : 4,
            'winStreak' : 2
            'created' : now()
            'last_seen' : now()
        }
    def get_credentials(self):
            return self.create_basic(username=self.username, password=self.password)


    def test_get_list_unauthorzied(self):
        self.assertHttpUnauthorized(self.api_client.get('/api/v1/entries/', format='json'))

 def test_get_list_json(self):
        resp = self.api_client.get('/api/v1/battleuser/', format='json', authentication=self.get_credentials())
        self.assertValidJSONResponse(resp)

        # Scope out the data for correctness.
        self.assertEqual(len(self.deserialize(resp)['objects']), 12)
        # Here, we're checking an entire structure for the expected data.
        self.assertEqual(self.deserialize(resp)['objects'][0], {
            'pk': str(self.entry_1.pk),
            'user': '/api/v1/user/{0}/'.format(self.user.pk),
            'title': 'First post',
            'slug': 'first-post',
            'created': '2012-05-01T19:13:42',
            'resource_uri': '/api/v1/entry/{0}/'.format(self.entry_1.pk)
        })

