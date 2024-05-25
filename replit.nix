{ pkgs }: {
  deps = [
    pkgs.vim
    pkgs.timetrap
    pkgs.q
    pkgs.haskellPackages.wd
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}