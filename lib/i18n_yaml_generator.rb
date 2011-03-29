module I18nYamlGenerator
  Configuration = Struct.new(:commented)

  class Railtie < ::Rails::Railtie
    config.i18n_yaml_generator = I18nYamlGenerator::Configuration.new(false)

    generators do
      require 'i18n_yaml_generator/helpers'
      require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
      require 'rails/generators/rails/model/model_generator'
      Rails::Generators::ModelGenerator.send(:hook_for, :i18n_yaml)
      Rails::Generators::ModelGenerator.send(:class_option, :i18n_yaml, :default => 'i18n_yaml')
      Rails::Generators::ScaffoldControllerGenerator.send(:hook_for, :i18n_yaml)
      Rails::Generators::ScaffoldControllerGenerator.send(:class_option, :i18n_yaml, :default => 'i18n_yaml')
    end
  end
end

