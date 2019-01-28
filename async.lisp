(fn http-request-async (response-callback url params error-callback)
  (with (req       (new *x-m-l-http-request)
         listener  [0 & (== 4 req.ready-state)
                        (? (== 200 req.status)
                           (funcall response-callback req.response-text)
                           (funcall error-callback req url params))])
    (= req.onreadystatechange listener)
    (req.open "POST" url t)
    (set-utf8-request req)
    (req.send params)))
