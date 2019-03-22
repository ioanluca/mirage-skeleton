open Mirage

let handler =
  let packages = [package "cohttp-mirage"] in
  foreign
    ~packages
    "Idrcond.Main" (conduit @-> job)

let () =
  register "conduit_server" [ handler $ conduit_direct (generic_stackv4 default_network) ]
