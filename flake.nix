{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
          };
        in {
          devShell = pkgs.mkShell rec {

            buildInputs = with pkgs; [
              pipenv
              zlib

              autoconf
              binutils
              curl
              freeglut
              git
              gitRepo
              gnumake
              gnupg
              gperf
              # libGLU_combined
              # linuxPackages.nvidia_x11
              m4
              ncurses5
              procps
              stdenv.cc
              unzip
              utillinux
              xorg.libX11
              xorg.libXext
              xorg.libXi
              xorg.libXmu
              xorg.libXrandr
              xorg.libXv
              zlib
            ];

            shellHook = ''
              export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
              export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"

              # export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
              # export EXTRA_CCFLAGS="-I/usr/include"
            '';

          };
        }
      );
}
