(in-l10n http-request)

(def-l10n en connection-error () "Connection error: ")
(def-l10n de connection-error () "Verbindungsfehler: ")

(fn http-request-error (req url params)
  (error (+ (l10n connection-error)
            req.status ", URL: " url " response: " req.response-text " params: " params)))
