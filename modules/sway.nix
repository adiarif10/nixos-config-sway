{ pkgs, ... }: {
  programs.sway.enable = true;
  environment.systemPackages = with pkgs; [
   waybar wofi mako grim slurp
  ];
}
