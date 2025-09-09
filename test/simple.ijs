NB. write to stdout

load 'api/curl'
coinsert 'jcurl'

simple=: 3 : 0
curl=. curl_easy_init ''
if. curl do.
  res=. curl_easy_setopt_str curl; CURLOPT_URL; setopt_variadic, <'https://example.com'
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_setopt curl; CURLOPT_FOLLOWLOCATION; setopt_variadic, <1
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  res=. curl_easy_perform <curl
  if. res~:CURLE_OK do. echo memr 0 _1,~ curl_easy_strerror <res end.
  curl_easy_cleanup <curl
end.
''
)
simple''
