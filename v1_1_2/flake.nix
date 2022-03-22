{
  description = ''BSON (Binary Json) serialization'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-bson-v1_1_2.flake = false;
  inputs.src-bson-v1_1_2.owner = "JohnAD";
  inputs.src-bson-v1_1_2.ref   = "v1_1_2";
  inputs.src-bson-v1_1_2.repo  = "bson";
  inputs.src-bson-v1_1_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-bson-v1_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-bson-v1_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}