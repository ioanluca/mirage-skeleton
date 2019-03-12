#!/bin/bash

malfunction cmx unikernel.mlf -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime

mv unikernel.cmi unikernel.cmx unikernel.o _build/

cp key_gen.ml main.ml unikernel.ml _build/

cd _build

pwd

ls 

ocamlfind ocamldep -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -modules main.ml > main.ml.depends 

ocamlfind ocamldep -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -modules key_gen.ml > key_gen.ml.depends 

ocamlfind ocamldep -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -modules unikernel.cmi > unikernel.ml.depends 

ocamlfind ocamlc -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o key_gen.cmo key_gen.ml 

# ocamlfind ocamlc -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o unikernel.cmo unikernel.ml 

ocamlfind ocamlc -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o main.cmo main.ml &&

ocamlfind ocamlopt -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o key_gen.cmx key_gen.ml 

# ocamlfind ocamlopt -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o unikernel.cmx unikernel.ml

ocamlfind ocamlopt -c -g -g -bin-annot -safe-string -principal -thread -strict-sequence -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix -w A-4-41-42-44 -o main.cmx main.ml 

ocamlfind ocamlopt -g -linkpkg -g -thread -package mirage-unix -package mirage-types-lwt -package mirage-types -package mirage-runtime -package mirage-logs -package mirage-clock-unix -package mirage-bootvar-unix -package lwt -package functoria-runtime -predicates mirage_unix key_gen.cmx unikernel.cmx main.cmx -o main.native
