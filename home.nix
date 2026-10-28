{ pkgs, ... }:
{
  home.stateVersion = "26.05";
  programs.git.enable = true;

  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-sway#nixos";
  };

  home.packages = with pkgs; [
    #common
    ghostty
    ripgrep
    fd
    tree-sitter

    #js ts
    bun
    typescript-language-server
    vtsls
    prettier
    nodejs
    pnpm
    tailwindcss-language-server

    #python
    python3
    uv
    ruff
    pyright

    #c / c++
    gcc
    gnumake
    cmake
    gdb
    clang-tools # clangd + clang-format
    pkg-config
    bear # generate compile_commands.json buat clangd

    # lua (buat edit config nvchad)
    lua-language-server
  ];
  # config shell with zsh
  programs.zsh = {

    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "robbyrussell";
    };
  };

}
