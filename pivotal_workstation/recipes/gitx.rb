include_recipe "pivotal_workstation::user_owns_usr_local"

GITX_PATH = "/Applications/GitX.app"

unless File.exists?(GITX_PATH)

  remote_file "/tmp/gitx.zip" do
    source node["gitx_zip"]
    mode "0644"
  end

  execute "unzip gitx" do
    command "unzip /tmp/gitx.zip -d /Applications/"
    user WS_USER
  end

  directory "/tmp/GitX.app" do
    action :delete
    recursive true
  end
end
