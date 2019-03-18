open Mirage

let main =
  foreign
    ~packages:[package "duration"; package "salut"]
    "Salut.Unmodul" (time @-> job)

let () =
  register "hello" [main $ default_time]
