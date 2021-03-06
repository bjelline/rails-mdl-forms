require 'timecop'
require 'mocha/mini_test'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActionView::TestCase

  setup :setup_test_fixture

  def setup_test_fixture
    @user = User.new(email: 'steve@example.com', password: 'secret', comments: 'my comment')
    @builder = MdlForm::FormBuilder.new(:user, @user, self, {})
    @horizontal_builder = MdlForm::FormBuilder.new(:user, @user, self, { layout: :horizontal, label_col: "col-sm-2", control_col: "col-sm-10" })
    I18n.backend.store_translations(:en, {activerecord: {help: {user: {password: "A good password should be at least six characters long"}}}})
  end

end