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

