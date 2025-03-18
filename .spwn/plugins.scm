(require-builtin steel/time)

; Set the current year
(define (info text) (string-replace text "{{ year }}" (local-time/now! "%Y")))

; Find module root
(define (cwd cwd)
  (define (search path)
    (if (string=? path "")
      #f
      (let ((registration-path (string-append path "/registration.php")))
        (if (is-file? registration-path)
          path
          (search (parent-name path))))))
  (let ((found (search cwd)))
    (if found
      found
      cwd)))
