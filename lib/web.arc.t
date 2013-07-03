; written by Mark Heutsch and Brian J Rubinton

(require "lib/unit-test.arc")
(require "lib/web.arc")

(register-test
  '(suite "web.arc"
    (suite "parse url"
      ("test default resource"
        ((parse-url "www.google.com") 'resource)
        "http")

      ("test anchor is ignored"
        ((parse-url "www.google.com#anchor") 'host)
        "www.google.com")

      ("test path nesting is retained"
        ((parse-url "www.nytimes.com/global/asia/china/") 'path)
        "global/asia/china/")

      ("test url's port is retained"
        ((parse-url "localhost:8080") 'port)
        8080)
    
      ("test default url port"
        ((parse-url "www.google.com") 'port)
        80)

      ("test query is retained"
        ((parse-url "www.google.com/search?a=1&b=2&c=3") 'query)
        "a=1&b=2&c=3"))

    (suite "build request"
      ("test arglist argstr combination"
        (build-query "a=1&b=2&c=3" '(d 4 e 5 f 6))
        "a=1&b=2&c=3&d=4&e=5&f=6")

      ("test arglist only"
        (build-query "" '(d 4 e 5 f 6))
        "d=4&e=5&f=6")
      
      (suite "build header"
        ("test GET request uri"
          (build-uri ___)
          ___)
    
        ("test POST request uri"
          ()
          )
        
        ("test cookie encoding"
          (___ ___)
          ___))
      (suite "build body" 
        ("test GET request body"
          ()
          )

        ("test POST request body"
          ()
          )))

    (suite "send request")
    
    (suite "parse response")))
      
(run-all-tests)
