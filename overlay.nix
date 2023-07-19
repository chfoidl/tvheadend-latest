self: super: {
  tvheadend-latest = super.tvheadend.overrideAttrs (oldAttrs: rec {
    version = "unstable-2023-06-25";

    src = super.fetchFromGitHub {
      owner = "tvheadend";
      repo = "tvheadend";
      rev = "14298acb6a8e3a83ed1091fab1f3a924077ddfea";
      sha256 = "sha256-7GFhJcZor1AvbGubXygVcyUxyyY8JooialgpaHTBKkU=";
    };

    buildInputs = super.tvheadend.buildInputs ++ [
      super.libva
      super.libdvbcsa
      super.libvpx
      super.libopus
      super.x264
      super.x265
    ];

    # Existing patch for 4.2 is not needed for the current 4.3.x version.
    patches = [];

    # Make sure to update version in tvheadend.
    preConfigure = super.tvheadend.preConfigure + ''
      echo ${version} > rpm/version
    '';
  });
}

