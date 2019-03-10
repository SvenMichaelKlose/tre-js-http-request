# HTTP request for tré (JavaScript target)

```lisp
(HTTP-REQUEST URL ALIST &KEY (ONRESULT NIL) (ONERROR NIL))
```

POSTs with UTF-8 encoding.  Switches to asynchronuous mode when
callback ONRESULT has been specified.
