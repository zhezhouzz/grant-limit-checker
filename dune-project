(lang dune 3.10)
(name grant-limit-checker)
(generate_opam_files true)

(package
 (name grant-limit-checker)
 (synopsis "Formally verified Chinese research grant limit checker")
 (depends
  (ocaml (>= 5.1))
  (dune (>= 3.10))
  (rocq-core (>= 9.0))
  (rocq-stdlib (>= 9.0))
  js_of_ocaml
  js_of_ocaml-ppx))
