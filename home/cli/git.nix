{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "soongfs";
        email = "soongfs04@gmail.com";
      };
      init.defaultBranch = "master";
      pull.rebase = true;
    };
  };
}
