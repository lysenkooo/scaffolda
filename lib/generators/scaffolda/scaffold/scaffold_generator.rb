require 'rails/generators/erb/scaffold/scaffold_generator'

module Scaffolda
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path('../templates', __FILE__)

      def copy_view_files
        available_views.each do |filename|
          template filename, File.join('app/views', controller_file_path, filename)
        end

        template '_row.html.erb', File.join('app/views', controller_file_path, "_#{singular_table_name}.html.erb")

        shared_templates.each do |filename|
          template 'shared/' + filename, File.join('app/views/shared', filename)
        end

        copy_file '../helpers/scaffolda_helper.rb', 'app/helpers/scaffolda_helper.rb'
        copy_file '../js/scaffolda.js.coffee', 'app/assets/javascripts/scaffolda.js.coffee'
      end

      protected

      def available_views
        %w(index.html.erb index.js.erb edit.html.erb show.html.erb new.html.erb _form.html.erb _head.html.erb)
      end

      def shared_templates
        %w(_errors.html.erb _search.html.erb)
      end
    end
  end
end
