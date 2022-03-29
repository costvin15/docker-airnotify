import urllib

port = 8801

mongouser = "root"
mongopass = "pass"
mongohost = "localhost"
mongoport = "27017"
mongouri = "mongodb://" + mongouser + ":" + urllib.parse.quote(mongopass) + "@" + mongohost + ":" + mongoport + "/"

passwordsalt = 'd2o0n1g2s0h3e1n1g'
cookiesecret = 'airnotifiercookiesecret'
debug = False

masterdb = "airnotifier"
collectionprefix = "obj_"
dbprefix = ""
appprefix = "app_"
# sentrydsn = "https://xxxxxxx@sentry.io/xxxxxxx"
