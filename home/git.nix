{ ... }:

let
  canks = {
    name = "Canks";
    email = "canks.official@gmail.com";
    signingKey = "78B9097234BDFB9A";
  };

  gitDefaultConfig = {
    contents = {
      user = canks;
      init = {
        defaultBranch = "master";
      };
    };
  };
in
{
  programs = {
    git = {
      enable = true;
      userName = canks.name;
      userEmail = canks.email;

      signing = {
        key = canks.signingKey;
        signByDefault = true;
        gpgPath = "gpg";
      };

      ignores = [
        "*~"
        ".DS_Store"
        "*.swp"
      ];

      aliases = {
        st = "status";
        co = "checkout";
        cb = "checkout -b";
        rb = "rebase";
        rba = "rebase --abort";
        rbc = "rebase --continue";
        rbi = "rebase -i";
        pf = "push --force-with-lease";
        undo = "reset --soft HEAD~";
      };

      diff-so-fancy.enable = true;

      includes = [
        gitDefaultConfig

        {
          condition = "gitdir:~/.config/nixpkgs/";
          contents.commit.gpgSign = false;
        }
      ];
    };
  };
}
