module RequiredTagsAdminUI

 def self.included(base)
   base.class_eval do

      attr_accessor :tag
      alias_method :tags, :tag

      def load_default_regions_with_tags
        load_default_regions_without_tags
        @tag = load_default_tag_regions
      end

      alias_method_chain :load_default_regions, :tags

      protected

        def load_default_tag_regions
          returning OpenStruct.new do |tag|
            tag.edit = Radiant::AdminUI::RegionSet.new do |edit|
              edit.main.concat %w{edit_header edit_form}
              edit.form.concat %w{edit_name edit_required edit_description}
              edit.form_bottom.concat %w{edit_timestamp edit_buttons}
            end
            tag.show = Radiant::AdminUI::RegionSet.new do |show|
              show.main.concat %w{show_header show_pages}
            end
            tag.index = Radiant::AdminUI::RegionSet.new do |index|
              index.thead.concat %w{title_header description_header modify_header}
              # add back in -- usage_header
              index.tbody.concat %w{title_cell description_cell modify_cell}
              # add back in -- usage_cell
              index.bottom.concat %w{new_button}
            end
            tag.remove = tag.index
            tag.new = tag.edit
          end
        end
      
    end
  end
end