# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class RequiredTagsExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/required_tags"
  
  extension_config do |config|
    config.extension 'taggable'
  end
  
  def activate
    # tab 'Content' do
    #   add_item "Required Tags", "/admin/required_tags", :after => "Pages"
    # end
    
  end
end
