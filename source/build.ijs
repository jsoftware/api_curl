NB. build.ijs

mkdir_j_ jpath '~Addons/api/curl/test'
mkdir_j_ jpath '~addons/api/curl/test'

writesourcex_jp_ '~Addons/api/curl/source';'~Addons/api/curl/curl.ijs'

(jpath '~addons/api/curl/curl.ijs') (fcopynew ::0:) jpath '~Addons/api/curl/curl.ijs'

f=. 3 : 0
(jpath '~Addons/api/curl/',y) fcopynew jpath '~Addons/api/curl/',y
(jpath '~addons/api/curl/',y) (fcopynew ::0:) jpath '~Addons/api/curl/',y
)

f 'manifest.ijs'
f 'readme.txt'
f 'test/getinmemory.ijs'
f 'test/simple.ijs'
