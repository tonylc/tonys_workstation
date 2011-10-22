
execute "make textmate plugins directory" do
  command "mkdir -p '#{WS_HOME}/Library/Application Support/TextMate/PlugIns'"
  user WS_USER
  not_if { File.exists?("#{WS_HOME}/Library/Application Support/TextMate/PlugIns") }
end

execute "clear out the existing AckMate plugin if it's there" do
  command "rm -rf '#{WS_HOME}/Library/Application Support/TextMate/PlugIns/AckMate.tmplugin'"
end

remote_file "/tmp/ackmate.zip" do
  source node["ackmate_plugin_zip"]
  mode "0644"
end

execute "unzip ackmate.zip" do
  command "unzip /tmp/ackmate.zip -d '#{WS_HOME}/Library/Application Support/TextMate/PlugIns'"
  user WS_USER
end

bash "YOU NEED TO RESTART TEXTMATE" do
  code <<-EOS
  echo "YOU NEED TO RESTART TEXTMATE"
  EOS
end
