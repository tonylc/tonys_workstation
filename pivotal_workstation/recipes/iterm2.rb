unless File.exists?('/Applications/iterm.app')

  remote_file "/tmp/iterm2.zip" do
    source node["iterm2_download_location"]
    mode "0644"
  end

  execute "unzip iterm2.zip" do
    command "unzip /tmp/iterm2.zip -d /Applications"
    user WS_USER
  end

  execute "delete iterm2.zip" do
    command "rm -rf /tmp/iterm2.zip"
  end

end
