{pkgs, ...}: let
  bosl = pkgs.fetchFromGitHub {
    repo = "BOSL";
    owner = "revarbat";
    rev = "4ce427a8a38786e5f74b728c1e33d9fe7d4904d2";
    hash = "sha256-24vqGt0TPe09K1WTP8fDX2Wx4MlsDnigzx7Ha0mXCOg=";
  };
  bosl2 = pkgs.fetchFromGitHub {
    repo = "BOSL2";
    owner = "BelfrySCAD";
    rev = "0f09d1fac976099f824e4fce705362ebe240b161";
    hash = "sha256-UuEsUcytWmoua2ksNsBSNrY6CIVsftY8zBlgqQQk5rM=";
  };
  libraries = pkgs.runCommand "openscad-libraries" {} ''
    mkdir $out
    mkdir $out/bosl
    mkdir $out/bosl2
    cp ${bosl}/*.scad $out/bosl
    cp ${bosl2}/*.scad $out/bosl2
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
