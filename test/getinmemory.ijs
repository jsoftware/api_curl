NB. write to memory

load 'api/curl'
coinsert 'jcurl'

cdcallback=: 3 : 0
y=. 15!:17''
if. 4=#y do. writedata y end.
)

writedata=: 3 : 0
'data size nmemb userp'=. y
rsize=. size*nmemb
name=. 'data_',":userp
(name)=: name~, memr data,0,rsize,2
rsize
)

getinmemory=: 3 : 0
f=. [: 15!:13 (IFWIN#'+') , ' x' $~ +:@>:
data_1=: ''
curl_global_init <CURL_GLOBAL_ALL
curl=. curl_easy_init ''
if. curl do.
  res=. curl_easy_setopt_str curl; CURLOPT_URL; setopt_variadic, <'https://example.com'
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_setopt curl; CURLOPT_FOLLOWLOCATION; setopt_variadic, <1
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_setopt curl; CURLOPT_WRITEFUNCTION; setopt_variadic, <(f 4)
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_setopt curl; CURLOPT_WRITEDATA; setopt_variadic, <1
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_perform <curl
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  curl_easy_cleanup <curl
end.
curl_global_cleanup''
''
)
getinmemory''
echo data_1
