NB. Apple silicon variadic pass arguments on stack
NB. fill all unused registers with dummy

3 : 0''
if. ('arm64'-:9!:56'cpu') *. UNAME-:'Darwin' do.
  setopt_variadic=: 6#<0
  curl_easy_setopt=: ((dquote libcurl), ' curl_easy_setopt > i x i x x x x x x x ') & (15!:0)
  curl_easy_setopt_str=: ((dquote libcurl), ' curl_easy_setopt > i x i x x x x x x *c ') & (15!:0)
else.
  setopt_variadic=: ''
  curl_easy_setopt_str=: ((dquote libcurl), ' curl_easy_setopt > i x i *c ') & (15!:0)
end.
''
)

cocurrent 'base'
