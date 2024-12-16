# idx-template.nix
{pkgs}: {
  packages = [
    # Enable "node", "npm" and "npx" in the bootstrap script below.
    # Note, this is NOT the list of packages available to the workspace once
    # it's created. Those go in .idx/dev.nix
    pkgs.php82
    pkgs.php82Packages.composer
  ];

}