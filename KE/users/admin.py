from django.contrib import admin
from users.models import BattleUser, BattleLog 


admin.site.register(BattleLog)
admin.site.register(BattleUser)
