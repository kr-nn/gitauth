{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [ pkgs.coreutils ];

  shellHook = ''
    export PATH="$PWD/result/bin:$PATH"
  '';

  packages = [
    (pkgs.writeShellScriptBin "gitauth" (builtins.readFile ./gitauth))
  ];
}
