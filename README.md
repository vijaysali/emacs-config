## Enabling init

Any of the language environment initializers can be enabled or
disabled as below. 
To enable:  

    ln -sf init-available/init-erlang.el init-enabled/init-erlang.el

To disable:

    rm init-enabled/init-erlang.el

## Setup OCaml

    brew install opam
    opam switch 4.01.0
    opam install merlin ocp-indent utop

## Setup Distel and Erlang
