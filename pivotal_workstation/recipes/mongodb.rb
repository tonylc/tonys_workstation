include_recipe "pivotal_workstation::homebrew"

unless brew_installed? "mongodb"
  brew_install "mongodb"

  directory "/Users/#{WS_USER}/Library/LaunchAgents" do
    owner WS_USER
    action :create
  end

  execute "copy mongodb plist to ~/Library/LaunchAgents" do
    command "cp `brew --prefix mongodb`/org.mongodb.mongod.plist #{WS_HOME}/Library/LaunchAgents/"
    user WS_USER
  end

  execute "load the mongodb plist into the mac daemon startup thing" do
    command "launchctl load -w #{WS_HOME}/Library/LaunchAgents/org.mongodb.mongod.plist"
    user WS_USER
  end
end
