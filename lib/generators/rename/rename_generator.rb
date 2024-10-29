# frozen_string_literal: true

class RenameGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def reset_credentials
    remove_dir('config/credentials')
    remove_file('config/credentials.yml.enc')
    remove_file('config/master.key')
    rails_command('credentials:edit')
    rails_command('credentials:edit --environment production')
  end

  def rename_app
    gsub_file('config/application.rb', 'RailsTemplateApp', class_name)
  end

  def remove_this_generator
    remove_dir('lib/generators/rename')
  end
end
