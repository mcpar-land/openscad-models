{pkgs, ...}: let
  bosl = pkgs.fetchFromGitHub {
    repo = "BOSL";
    owner = "revarbat";
    rev = "4ce427a8a38786e5f74b728c1e33d9fe7d4904d2";
    hash = "sha256-24vqGt0TPe09K1WTP8fDX2Wx4MlsDnigzx7Ha0mXCOg=";
  };
  libraries = pkgs.runCommand "openscad-libraries" {} ''
    mkdir $out
    mkdir $out/bosl
    cp ${bosl}/*.scad $out/bosl
  '';
in {
  packages = with pkgs; [
    openscad-unstable
    openscad-lsp
  ];

  enterShell = ''
    export OPENSCADPATH="${libraries}"
  '';
}
