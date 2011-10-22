
execute "make textmate bundles directory" do
  command "mkdir -p '#{WS_HOME}/Library/Application Support/TextMate/Bundles'"
  user WS_USER
  not_if { File.exists?("#{WS_HOME}/Library/Application Support/TextMate/Bundles") }
end

execute "clear out the existing RSpec Bundle if it's there" do
  command "rm -rf '#{WS_HOME}/Library/Application Support/TextMate/Bundles/RSpec.tmbundle'"
end

execute "install RSpec Bundle" do
  command "git clone git://github.com/rspec/rspec-tmbundle.git \"#{WS_HOME}/Library/Application Support/TextMate/Bundles/RSpec.tmbundle\""
end

execute "clear out the existing CTags Bundle if it's there" do
  command "rm -rf '#{WS_HOME}/Library/Application Support/TextMate/Bundles/ctags.tmbundle'"
end

execute "install CTags Bundle" do
  command "git clone https://github.com/textmate/ctags.tmbundle.git \"#{WS_HOME}/Library/Application Support/TextMate/Bundles/CTags.tmbundle\""
end

execute "reload TextMate" do
  command "osascript -e 'tell app \"TextMate\" to reload bundles'"
end

