open Mirage

let main =
  foreign
    ~packages:[package "duration"; package "idrismirage"]
    "Idrismirage.Idrishello" (time @-> job)

let () =
  register "hello" [main $ default_time]
