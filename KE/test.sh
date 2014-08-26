
# Post a user
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"firstName":"piiioppa","lastName":"diddy","nickName":"pdiddy"}'  http://127.0.0.1:8000/v1/battleUser/

# Fetch all users
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET  http://127.0.0.1:8000/v1/battleUser/ 

# Fetch a user based on id 
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET  http://127.0.0.1:8000/v1/battleUser/1/

# Update a user
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X PUT -d '{"firstName":"piiidsodsppa","lastName":"dsdsdiasddy","nickName":"pdsdidasddy"}'  http://127.0.0.1:8000/v1/battleUser/1/

# DElete a user
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE   http://127.0.0.1:8000/v1/battleUser/1/ > output.txt

# Create a battle user
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"attacker" :  "/v1/battleUser/14/", "defender" :  "/v1/battleUser/1/", "winner" :  "/v1/battleUser/1/"}'   http://127.0.0.1:8000/v1/battles/

# Create a battle log 
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"attacker" :  "/v1/battleUser/14/", "defender" :  "/v1/battleUser/1/", "winner" :  "/v1/battleUser/1/"}'   http://127.0.0.1:8000/v1/battles/

# Fetch all battle logs
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://127.0.0.1:8000/v1/battles/

#Fetch a single battle log
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://127.0.0.1:8000/v1/battles/1/

# Update a battle log NOT ALLOWED
curl -v --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X PUT -d '{"attacker" :  "/v1/battleUser/14/", "defender" :  "/v1/battleUser/1/"}'  http://127.0.0.1:8000/v1/battles/

# grab a filtered user result
curl  --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://127.0.0.1:8000/v1/battlelog/?nickName=pdiddy

# grab a filtered battle log result
curl  --user patrick:patrick -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://127.0.0.1:8000/v1/battles/?start_gt=2011-05-20T00:46:38
