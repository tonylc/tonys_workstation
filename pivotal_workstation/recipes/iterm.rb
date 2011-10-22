unless File.exists?('/Applications/iterm.app')

  remote_file "/tmp/iterm.zip" do
    source node["iterm_zip"]
    mode "0644"
  end

  execute "unzip iterm.zip" do
    command "unzip /tmp/iterm.zip -d /Applications"
    user WS_USER
  end

  execute "delete iterm.zip" do
    command "rm -rf /tmp/iterm.zip"
  end

end
