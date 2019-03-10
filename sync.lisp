(fn multipart-rand ()
  (string (+ 1000 (*math.floor (*math.random 8999)))))

(var *multipart-boundary* (base64-encode (apply #'+ (maptimes #'multipart-rand 4))))

(fn multipart-data (name data)
  (+ "--" *multipart-boundary* *terpri*
     "Content-disposition: form-data; name=\"" name "\"" *terpri*
     *terpri*
     data
     *terpri*
     "--" *multipart-boundary* "--" *terpri*))

(fn http-request (url name data error-callback)
  (!= (new *x-m-l-http-request)
    (!.open "POST" url nil)
    (!.set-request-header "Content-type" (+ "multipart/form-data; charset=UTF-8; boundary="
                                            *multipart-boundary*))
    (!.send (multipart-data name data))
    (| (== 200 !.status)
       (funcall error-callback ! url params))
    !.response-text))
