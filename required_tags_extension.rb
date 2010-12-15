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
    unless defined? admin.tag
      ## Radiant::AdminUI.send :include, RequiredTagsAdminUI
      Radiant::AdminUI.send :include, TaggableAdminUI
      admin.tag = Radiant::AdminUI.load_default_tag_regions
    end
    
    admin.tag.edit.add :form, "add_required_field", :after => "edit_name"
    # admin.tag.index.add :thead, "required_header", :before => "modify_header"
    # admin.tag.index.add :tbody, "required_cell", :before => "modify_cell"
  end
end
