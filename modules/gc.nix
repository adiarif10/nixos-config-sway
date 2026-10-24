{

  # ---------- Garbage collector ----------
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 30d";
  };

  # Dedupe file identik di /nix/store (hemat disk)
  nix.optimise.automatic = true;

  # Batasi jumlah generation di menu boot (partisi /boot EFI itu kecil, bisa penuh)
  boot.loader.systemd-boot.configurationLimit = 10;
}
