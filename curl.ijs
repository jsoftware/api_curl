NB. libcurl api

3 : 0''
select. UNAME
case. 'Linux' do.
  libcurl=: 'libcurl.so.4.8.0'
case. 'Win' do.
  libcurl=: 'libcurl.dll'
case. 'Darwin' do.
  libcurl=: 'libcurl.dylib'
case. do.
  libcurl=: 'libcurl.so'
end.
)

curl_easy_cleanup=: (libcurl, ' curl_easy_cleanup > n x') & (15!:0)
curl_easy_init=: (libcurl, ' curl_easy_init > x') & (15!:0)
curl_easy_perform=: (libcurl, ' curl_easy_perform > i x') & (15!:0)
curl_easy_strerror=: (libcurl, ' curl_easy_strerror > x i') & (15!:0)
curl_global_cleanup=: (libcurl, ' curl_global_cleanup n') & (15!:0)
curl_global_init=: (libcurl, ' curl_global_init i x') & (15!:0)

3 : 0''
if. ('arm64'-:9!:56'cpu') *. UNAME-:'Darwin' do.
  setopt_variadic=: 6#<0
  curl_easy_setopt=: (libcurl, ' curl_easy_setopt > i x i x x x x x x x') & (15!:0)
  curl_easy_setopt_str=: (libcurl, ' curl_easy_setopt > i x i x x x x x x *c') & (15!:0)
else.
  setopt_variadic=: ''
  curl_easy_setopt=: (libcurl, ' curl_easy_setopt > i x i x') & (15!:0)
  curl_easy_setopt_str=: (libcurl, ' curl_easy_setopt > i x i *c') & (15!:0)
end.
''
)

CURLE_OK=: 0
CURL_GLOBAL_ALL=: 3
CURLOPT_FOLLOWLOCATION=: 52
CURLOPT_URL=: 10002
CURLOPT_USERAGENT=: 10018
CURLOPT_WRITEDATA=: 10001
CURLOPT_WRITEFUNCTION=: 20011

