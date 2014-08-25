from django.db import models
from tastypie.utils.timezone import now

"""
 Class BattleUser
 
 A user model used to represent a player in varitety of Battle type games  

"""
class BattleUser(models.Model):

    firstName = models.CharField(max_length=100)
    lastName = models.CharField(max_length=100)
    nickName = models.CharField(max_length=100)
    wins = models.IntegerField(default=0)
    losses = models.IntegerField(default=0)
    winStreak = models.IntegerField(default=0)
    created = models.DateTimeField(default=now)
    last_seen = models.DateTimeField(default=now)


    def __unicode__(self): 
        return "Battle User " + self.firstName + " " + self.lastName

"""
 Class BattleLog

 A log used to represent a previous battle. 

"""
class BattleLog(models.Model):

    attacker = models.ForeignKey(BattleUser, related_name='attacker')
    defender = models.ForeignKey(BattleUser, related_name='defender')
    winner = models.ForeignKey(BattleUser, related_name='winner')
    start = models.DateTimeField(default=now)
    end = models.DateTimeField(default=now)

