
execute "make textmate bundles directory" do
  command "mkdir -p '#{WS_HOME}/Library/Application Support/TextMate/Bundles'"
  user WS_USER
  not_if { File.exists?("#{WS_HOME}/Library/Application Support/TextMate/Bundles") }
end

execute "clear out the existing RSpec bundle if it's there" do
  command "rm -rf '#{WS_HOME}/Library/Application Support/TextMate/Bundles/RSpec.tmbundle'"
end

execute "install RSpec bundle" do
  command "git clone #{node["rspec_bundle_src"]}  \"#{WS_HOME}/Library/Application Support/TextMate/Bundles/RSpec.tmbundle\""
  user WS_USER
end

execute "clear out the existing CTags bundle if it's there" do
  command "rm -rf '#{WS_HOME}/Library/Application Support/TextMate/Bundles/ctags.tmbundle'"
end

execute "install CTags bundle" do
  command "git clone #{node["ctags_bundle_src"]}  \"#{WS_HOME}/Library/Application Support/TextMate/Bundles/CTags.tmbundle\""
  user WS_USER
end

execute "reload TextMate" do
  command "osascript -e 'tell app \"TextMate\" to reload bundles'"
end

