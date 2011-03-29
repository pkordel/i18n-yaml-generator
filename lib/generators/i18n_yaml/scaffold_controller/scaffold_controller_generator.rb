module I18nYaml
  module Generators #:nodoc:
    class ScaffoldControllerGenerator < Rails::Generators::NamedBase #:nodoc:
      include Rails::Generators::ResourceHelpers
      include I18nYamlGenerator::Helpers
      class_option :commented, :default => Rails.application.config.i18n_yaml_generator.commented

      def views_i18n_yaml_file
        titles_hash = {
          'index'  => { 'title' => "#{human_name.pluralize}" },
          'show'   => { 'title' => human_name },
          'edit'   => { 'title' => "Editing #{human_name}" },
          'new'    => { 'title' => "New #{human_name}" }
        }

        flash_hash = {
          'create' => {
            'notice' => '%{resource_name} was successfully created.'
          },
          'update' => {
            'notice' => '%{resource_name} was successfully updated.'
          },
          'destroy' => {
            'notice' => '%{resource_name} was successfully deleted.',
            'alert' => '%{resource_name} could not be deleted.'
          }
        }

        scope_array = controller_i18n_scope.split('.')
        
        I18n.available_locales.each do |locale|
          hash_for_yaml = {}
          
          hash_for_yaml.deep_merge! wrap_hash(titles_hash, scope_array)
          hash_for_yaml.deep_merge! wrap_hash(flash_hash, %w(flash) + scope_array)

          yaml_content = { locale.to_s => hash_for_yaml }.to_yaml

          destination_path = File.join('config/locales/views/', "#{controller_file_path}.#{locale}.yml")
          create_file destination_path, options.commented ? comment_yaml_body(yaml_content) : yaml_content
        end
      end

    end
  end
end



