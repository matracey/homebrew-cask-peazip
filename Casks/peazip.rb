cask "peazip" do
  arch arm: "aarch64", intel: "x86_64"

  version "9.8.0"
  sha256 arm:   "5fba1cc7f69f1a445e7fea04fbf07e28e23189d7ba301451da3d49368e6c77c1",
         intel: "ccb608ea543ba29dc6b992537d144475ab21f68ec03abd8a78b728cf0aaebf5e"

  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg",
      verified: "github.com/peazip/PeaZip/"
  name "PeaZip"
  desc "Free Zip / Unzip software and Rar file extractor. Cross-platform file and archive manager."
  homepage "https://peazip.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "peazip.app"

  caveats <<~EOS
    1. You may need to run the following command to use PeaZip.app (*):

      xattr -dr com.apple.quarantine /Applications/peazip.app

    2. As PeaZip's compiled binaries are unsigned, they will ask for permission to access certain paths on your machine the first time. On most macOS system versions it is sufficient to respond "OK" once to the system's permission request.      

    (*) If the system shows the error message "peazip.app is damaged and can’t be opened. You should move it to the Trash" or "peazip.app cannot be opened because the developer cannot be verified" the first time you run PeaZip, it simply means Safari has applied the "quarantine" attribute to the downloaded app package. Those warning messages are issue because the application's binaries are not signed (M1 version is simply ad-hoc signed, Intel version is not signed): to fix the error open the Terminal and run the aforementioned xattr command.
    
  EOS

end
