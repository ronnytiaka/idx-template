# .idx/dev.nix
{pkgs, ...}: {
  channel = "stable-24.05";
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
  ];
  services.mysql = {
  enable = true;
  package = pkgs.mariadb;
  };
  idx = {
    extensions = [
      "cweijan.vscode-mysql-client2"
      "esbenp.prettier-vscode"
      "stef-k.laravel-goto-controller"
      "onecentlin.laravel-blade"
      "shufo.vscode-blade-formatter"
      "oderwat.indent-rainbow"
      "idleberg.hopscotch"
      "cweijan.dbclient-jdbc"
    ];
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Open editors for the following files by default, if they exist.
        # The last file in the list will be focused.
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
        # Include other scripts here, as needed, for example:
        # installDependencies = "npm install";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        run-server = "php artisan serve";
      };
    };
    # Enable previews and customize configuration
    previews = { 
        enable = true;
            previews = {
                web = {
                    command = [
                    "php"
                    "artisan"
                    "queue:work"
                    ];
                    manager = "web";
                    # Optionally, specify a directory that contains your web app
                    # cwd = "app/client";
                };
            };
     };
  };
}