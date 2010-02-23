# -*- coding: utf-8 -*-

app_name = "ack"
session_class = "user_session"
user_class = "user"
# app_name = ask("\nQual o nome do seu aplicativo?")
# session_class = ask("\nOlá, como se deve chamar seu model de sessão (ex 'user_session')?")
# user_class = ask("\nComo eu devo chamar seu modelo pra usuário (ex 'user')?")

run "echo TODO > README"
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'postgres', :lib => 'postgres'
gem 'rspec', :source => "http://gems.github.com", :lib => false
gem 'rspec-rails', :source => "http://gems.github.com", :lib => false
gem 'cucumber', :lib => false
gem 'cucumber-rails', :lib => false
gem 'igniter', :lib => false
gem 'webrat', :lib => false
gem "bmabey-email_spec", :source => "http://gems.github.com", :lib => "email_spec"

gem "giraffesoft-resource_controller", :source => "http://gems.github.com", :lib => "resource_controller"
gem 'binarylogic-authlogic', :lib => "authlogic", :source => 'http://gems.github.com'

# potential pitfall, installing haml gem after haml-edge can break system specially when doing gem upgrade
gem "haml-edge", :lib => 'haml'
gem 'searchlogic'
gem 'color-tools', :lib => false #required by sassafras which gave an error at template runtime
gem "teejayvanslyke-sassafras", :lib => 'sassafras', :source => "http://gems.github.com"
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
gem 'RedCloth', :lib => 'redcloth'
gem 'justinfrench-formtastic', :lib => 'formtastic', :source => 'http://gems.github.com'
gem 'kch-ya2yaml', :lib => 'ya2yaml'
gem 'brazilian-rails'
gem 'nakajima-fixjour', :source => "http://gems.github.com", :lib => "fixjour"
rake "gems:install", :sudo => true

# plugin "less-for-rails", :git => "git://github.com/augustl/less-for-rails.git"
generate :formtastic
run 'rm public/javascripts/*'
plugin "jrails", :git => "git://github.com/aaronchi/jrails.git"
plugin "translate", :git => "git://github.com/newsdesk/translate.git"
route "Translate::Routes.translation_ui(map) if RAILS_ENV != \"production\""
plugin "flash-message-conductor", :git => "git://github.com/planetargon/flash-message-conductor.git"

initializer "load_brazilian_rails_I18n.rb", <<-CODE
require 'brazilian-rails'
require 'brI18n'
CODE

generate :rspec
generate :cucumber
file("features/step_definitions/webrat_pt.rb") do
%q{
  # encoding: utf-8

  require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

  Dado /^que eu estou em (.+)$/ do |page_name|
    Given %{I am on #{page_name}}
  end
  Dado /^que eu estou na (.+)$/ do |page_name|
    Given %{I am on #{page_name}}
  end

  Quando /^eu vou para (.+)$/ do |page_name|
    When %{I go to #{page_name}}
  end

  Quando /^eu aperto "([^\"]*)"$/ do |button|
    When %{I press "#{button}"}
  end

  Quando /^eu clicar "([^\"]*)"$/ do |link|
    When %{I follow "#{link}"}
  end

  Quando /^eu clicar em "([^\"]*)"$/ do |link|
    When %{I follow "#{link}"}
  end

  Quando /^eu clico em "([^\"]*)"$/ do |link|
    save_and_open_page
    When %{I follow "#{link}"}
  end

  Quando /^eu clicar "([^\"]*)" dentro de "([^\"]*)"$/ do |link, parent|
    When %{I follow "#{link}" within "#{parent}"}
  end

  Quando /^eu preencho "([^\"]*)" com "([^\"]*)"$/ do |field, value|
    When %{I fill in "#{field}" with "#{value}"}
  end
  Quando /^eu preencher "([^\"]*)" com "([^\"]*)"$/ do |field, value|
    When %{I fill in "#{field}" with "#{value}"}
  end

  Quando /^eu preencho "([^\"]*)" para "([^\"]*)"$/ do |value, field|
    When %{I fill in "#{value}" for "#{field}"}
  end

  Quando /^eu preencho o seguinte:$/ do |fields|
    When %{I fill in the following:}, fields
  end

  Quando /^eu seleciono "([^\"]*)" de "([^\"]*)"$/ do |value, field|
    When %{I select "#{value}" from "#{field}"}
  end

  Quando /^eu seleciono "([^\"]*)" como a data e a hora$/ do |time|
    When %{I select "#{time}" as the date and time}
  end

  Quando /^eu seleciono "([^\"]*)" como a data e a hora "([^\"]*)"$/ do |datetime, datetime_label|
    When %{I select "#{datetime}" as the "#{datetime_label}" date and time}
  end

  Quando /^eu seleciono "([^\"]*)" como a hora$/ do |time|
    When %{I select "#{time}" as the time}
  end

  Quando /^eu seleciono "([^\"]*)" como a hora "([^\"]*)"$/ do |time, time_label|
    When %{I select "#{time}" as the "#{time_label}" time}
  end

  Quando /^eu seleciono "([^\"]*)" como a data$/ do |date|
    When %{I select "#{date}" as the date}
  end

  Quando /^eu seleciono "([^\"]*)" como a data "([^\"]*)"$/ do |date, date_label|
    When %{I select "#{date}" as the "#{date_label}" date}
  end

  Quando /^eu seleciono "([^\"]*)" como "([^\"]*)"$/ do |date, date_label|
    When %{I select "#{date}" as the "#{date_label}" date}
  end

  Quando /^eu marco "([^\"]*)"$/ do |field|
    When %{I check "#{field}"}
  end

  Quando /^eu desmarco "([^\"]*)"$/ do |field|
    When %{I uncheck "#{field}"}
  end

  Quando /^eu escolho "([^\"]*)"$/ do |field|
    When %{I choose "#{field}"}
  end

  Quando /^eu anexo o arquivo em "([^\"]*)" a "([^\"]*)"$/ do |path, field|
    When %{I attach the file "#{path}" to "#{field}"}
  end

  Então /^eu devo ver "([^\"]*)"$/ do |text|
    Then %{I should see "#{text}"}
  end

  Então /^eu devo ver "([^\"]*)" dentro de "([^\"]*)"$/ do |text, selector|
    Then %{I should see "#{text}" within "#{selector}"}
  end

  Então /^eu devo ver \/([^\/]*)\/$/ do |regexp|
    Then %{I should see /#{regexp}/}
  end

  Então /^eu devo ver \/([^\/]*)\/ dentro de "([^\"]*)"$/ do |regexp, selector|
    Then %{I should see /#{regexp}/ within "#{selector}"}
  end

  Então /^eu não devo ver "([^\"]*)"$/ do |text|
    Then %{I should not see "#{text}"}
  end

  Então /^eu não devo ver "([^\"]*)" dentro de "([^\"]*)"$/ do |text, selector|
    Then %{I should not see "#{text}" within "#{selector}"}
  end

  Então /^eu não devo ver \/([^\/]*)\/$/ do |regexp|
    Then %{I should not see /#{regexp}/}
  end

  Então /^eu não devo ver \/([^\/]*)\/ dentro de "([^\"]*)"$/ do |regexp, selector|
    Then %{I should not see /#{regexp}/ within "#{selector}"}
  end

  Então /^o campo "([^\"]*)" deve conter "([^\"]*)"$/ do |field, value|
    Then %{the "#{field}" field should contain "#{value}"}
  end

  Então /^o campo "([^\"]*)" não deve conter "([^\"]*)"$/ do |field, value|
    Then %{the "#{field}" field should not contain "#{value}"}
  end

  Então /^o checkbox "([^\"]*)" deve estar marcado$/ do |label|
    Then %{the "#{label}" checkbox should be checked}
  end

  Então /^o checkbox "([^\"]*)" não deve estar marcado$/ do |label|
    Then %{the "#{label}" checkbox should not be checked}
  end

  Então /^eu devo estar na (.+)$/ do |page_name|
    Then %{I should be on #{page_name}}
  end

  Então /^eu devo estar em (.+)$/ do |page_name|
    Then %{I should be on #{page_name}}
  end


  Então /^mostre-me a página$/ do
    Then %{show me the page}
  end

}
end

run "rm public/index.html"

run "git clone git://github.com/davemerwin/960-grid-system.git"
run "mkdir public/stylesheets/960gs"
run "cp 960-grid-system/code/css/*.css public/stylesheets/960gs"
run "rm -rf 960-grid-system"
run "git clone git://github.com/activestylus/formtastic-sass.git"
run 'haml --rails ./'
run 'mkdir public/stylesheets/sass'
run "cp formtastic-sass/*.sass public/stylesheets/sass/"
run "rm -rf formtastic-sass"
run "./script/generate formtastic"
run "rm public/stylesheets/formtastic.css"
file("public/stylesheets/sass/master.sass") do
  <<-EOF
@import formtastic_base
form.formtastic
  +float-form-right(800px,500px,200px,6px,"buttons-left")

  EOF
end
run "mkdir assets"

run "rm -rf test"
run "mkdir spec/factories"
file("spec/factories/factory.rb") do
  <<-FILE
require 'factory_girl'
  FILE
end

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
assets/*
.idea
.generators
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
git :add => "."
git :commit => "-m 'Initial commit'"
run "rm config/database.yml"
file("config/database.yml") do
  <<-EOF
development:
  adapter: postgresql
  encoding: utf8
  database: #{app_name}_dev
  username: root
  password:
test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000
production:
  adapter: postgresql
  encoding: utf8
  database: #{app_name}_prod
  username: root
  password:
cucumber:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

  EOF
end
run "cp config/database.yml config/example_database.yml"

rake "db:create"

generate :session, session_class
generate :scaffold_resource, (session_class + "s")
route "map.login 'login', :controller => '#{session_class.pluralize}', :action => 'new'"
route "map.logout 'logout', :controller => '#{session_class.pluralize}', :action => 'destroy'"

file("app/views/layouts/application.html.haml") do
  <<-EOF
!!! Strict
%html{ "xml:lang" => "en", :lang => "en", :xmlns => "http://www.w3.org/1999/xhtml" }
  %head
    %meta{ :content => "text/html; charset=utf-8", "http-equiv" => "Content-Type" }
    %title
      = @title ||= "#{app_name}"
    = stylesheet_link_tag "960gs/reset", :media => "screen, projection"
    = stylesheet_link_tag "960gs/960", :media => "screen, projection"
    = stylesheet_link_tag "960gs/text", :media => "screen, projection"
    = stylesheet_link_tag "master"
    = javascript_include_tag :defaults
  %body
    .container_16
      = render_flash_messages
      = yield

  EOF
end
# file("public/javascripts/application.js") do
#   <<-EOF
# $(document).ready(function () {
#   $('#form').addClass('float-right');});
#   EOF
# end

file("config/locales/pt_BR.yml") do
  <<-EOF
pt-BR:
  save: "Salvar"
  login: "Logar"
  signup: "Inscrever"
  reset_password: "Recuperar senha"
  change_password: "Alterar senha"
  edit_account: "Editar conta"
  user_form: "Formulário do usuário"
  password_success_update: "Senha atualizada com sucesso"
  account_created: "Sua conta foi criada. Por favor cheque seu email para as instruções de ativação!"
  email_confirm_account: "Você deve receber um email para confirmar sua conta. Por favor clique no link para ativá-la."
  EOF
end

file("app/views/#{session_class.pluralize}/new.html.haml") do
  <<-EOF
%h1
  Login
#form{:class => 'float-right'}= render :partial => 'form'

  EOF
end
file("app/views/#{session_class.pluralize}/_form.html.haml") do
  <<-EOF
- semantic_form_for(@#{session_class}, :url => #{session_class}_path ) do |f|
  = error_messages_for "@#{session_class}", :object => @#{session_class}
  - f.inputs :name => "\#{t(:login)}" do
    = f.input :email
    = f.input :password, :as => :password
    = f.input :remember_me, :as => :boolean
  - f.buttons :class => 'buttons' do
    = f.submit "\#{t(:login)}"

  EOF
end

file("app/controllers/#{session_class.pluralize}_controller.rb") do
  <<-EOF
class #{session_class.camelize.pluralize}Controller < ResourceController::Singleton
  create.success.wants.html { redirect_to #{user_class}_path(current_#{user_class}.id) }
  create.failure.wants.html { render :action => "new" }
  create do
    success.wants.html { redirect_to user_path(current_user) }
    success.flash(t(:email_confirm_account))
    failure.wants.html { render :action => "new" }
  end
  destroy.wants.html { redirect_to root_path }

  private
  def object
    @object ||= #{session_class.camelize}.find
  end
end
  EOF
end

route "map.resource :#{session_class}, :member => {:destroy => :any}"

generate :scaffold_resource, "#{user_class}", "email:string", "crypted_password:string", "password_salt:string", "persistence_token:string", "single_access_token:string", "perishable_token:string", "last_login_at:datetime", "active:boolean"

file("app/models/#{user_class}.rb") do
  <<-EOF
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  acts_as_authentic

  def to_params
    self.id
  end

  def activate!
   self.active = true
   save!
  end

  def signup(params)
    self.email = params[:email]
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    save_without_session_maintenance
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end

end
  EOF
end

file("app/controllers/#{user_class.pluralize}_controller.rb") do
  <<-EOF
class #{user_class.camelize.pluralize}Controller < ResourceController::Base
  before_filter :load_#{user_class}_using_perishable_token, :only => [:activate]
  before_filter :require_#{user_class}, :only => [:show, :update, :edit, :destroy]
  before_filter :require_no_#{user_class}, :only => [:new, :create]

  def create
    @#{user_class} = #{user_class.camelize}.new

    if @#{user_class}.signup(params[:#{user_class}])
      @#{user_class}.deliver_activation_instructions!
      add_notice t(:account_created)
      redirect_to new_#{session_class}_path
    else
      render :action => :new
    end
  end

  def activate
    if @#{user_class}.activate!
      @#{user_class}.deliver_activation_confirmation!
      add_notice "Your account has been activated."
      redirect_to #{user_class}_path(@#{user_class})
    else
      add_error "Unable to active your account, please try again. If this error persists, contact support."
      render :action => :new
    end
  end

  destroy.success.wants.html { redirect_to new_user_path }

end
  EOF
end

file("spec/controllers/#{user_class.pluralize}_controller_spec.rb") do
  <<-EOF
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe #{user_class.camelize.pluralize}Controller do
  before(:each) { activate_authlogic }

  describe "handling GET /#{user_class.pluralize}/new" do

    before(:each) do
      @#{user_class} = valid_#{user_class}
      #{user_class.camelize}.stub!(:new).and_return(@#{user_class})
      logout
    end

    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render new template" do
      do_get
      response.should render_template('new')
    end

    it "should create an new user" do
      #{user_class.camelize}.should_receive(:new).and_return(@#{user_class})
      do_get
    end

    it "should not save the new #{user_class}" do
      @#{user_class}.should_not_receive(:save)
      do_get
    end

    it "should assign the new #{user_class} for the view" do
      do_get
      assigns[:#{user_class}].should equal(@#{user_class})
    end
  end

  describe "handling GET /users/1/edit" do

    before(:each) do
      login
      @#{user_class} = valid_#{user_class}
      #{user_class.camelize}.stub!(:find).and_return(@#{user_class})
    end

    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end

    it "should find the user requested" do
      #{user_class.camelize}.should_receive(:find).and_return(@#{user_class})
      do_get
    end

    it "should assign the found #{user_class.camelize.pluralize} for the view" do
      do_get
      assigns[:#{user_class}].should equal(@#{user_class})
    end
  end

  describe "handling POST /#{user_class.pluralize}" do

    before(:each) do
      @#{user_class} = valid_#{user_class}
      #{user_class.camelize}.stub!(:new).and_return(@#{user_class})
      @#{user_class}.stub!(:signup).and_return true
    end

    describe "with successful save" do
      def do_post
        post :create, :#{user_class} => {}
      end

      it "should create a new #{user_class}" do
        #{user_class.camelize}.should_receive(:new).and_return(@#{user_class})
        @#{user_class}.should_receive(:signup).and_return(true)
        do_post
      end

    end

    describe "with failed save" do

      def do_post
        @#{user_class}.should_receive(:signup).and_return(false)
        post :create, :#{user_class} => {}
      end

      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end

    end
  end

  describe "handling DELETE /#{user_class.pluralize}/1" do

    before(:each) do
      @#{user_class} = valid_#{user_class}
      @#{user_class}.save
      #{user_class.camelize}.stub!(:find).and_return(@#{user_class})
      login
    end

    def do_delete
      delete :destroy, :id => @#{user_class}.id
    end

    it "should call destroy on the found user" do
      @#{user_class}.should_receive(:destroy).and_return(true)
      do_delete
    end

    it "should redirect to the users list" do
      do_delete
      response.should redirect_to(new_#{user_class}_url)
    end
  end
end

  EOF
end

file("spec/models/user_spec.rb") do
  <<-EOF
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe #{user_class.camelize} do
  before(:each) do
    @#{user_class} = valid_#{user_class}
  end

  it "should be valid" do
    @#{user_class}.should be_valid
  end

  context "signup" do
    before(:each) do
      @valid_attributes = {:email => "some@email.com",
                           :password => "password",
                           :password_confirmation => "password"}
    end

    it "should set email and passwords" do
      @#{user_class}.should_receive(:email=).with("some@email.com")
      @#{user_class}.should_receive(:password=).with("password")
      @#{user_class}.should_receive(:password_confirmation=).with("password")
      @#{user_class}.signup(@valid_attributes)
    end
    it "should save without session maintenance" do
      @#{user_class}.should_receive(:save_without_session_maintenance)
      @#{user_class}.signup(@valid_attributes)
    end
  end

end

  EOF
end

file("app/views/#{user_class.pluralize}/new.html.haml") do
  <<-EOF
%h1
  = t(:signup)
#form{:class => 'float-right'}= render :partial => 'form'
  EOF
end

file("app/views/#{user_class.pluralize}/edit.html.haml") do
  <<-EOF
%h1
  = t(:edit_account)
#form{:class => 'float-right'}= render :partial => 'form'
  EOF
end

file("app/views/#{user_class.pluralize}/_form.html.haml") do
  <<-EOF
- semantic_form_for(@#{user_class}, :url => #{user_class.pluralize}_path) do |f|
  = error_messages_for 'user', :object => @#{user_class}
  - f.inputs :name => "\#{t(:user_form)}" do
    = f.input :email
    = f.input :password, :as => :password
    = f.input :password_confirmation, :as => :password
  - f.buttons :class => 'buttons' do
    = f.submit "\#{t(:save)}"

  EOF
end
run("rm app/views/#{user_class.pluralize}/index.html.erb")

route "map.resources :#{user_class.pluralize}, :collection => {:activate => :get}"
route "map.root :controller => 'users', :action => 'new'"

generate :rspec_controller, "password_resets", "new", "edit"
route "map.resource :password_reset"

file('app/controllers/password_resets_controller.rb') do
  <<-EOF
class PasswordResetsController < ApplicationController
  before_filter :load_#{user_class}_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_#{user_class}

  def new
    @#{user_class} = #{user_class.camelize}.new
  end

  def create
    @#{user_class} = #{user_class.camelize}.find_by_email(params[:#{user_class}][:email])
    if @#{user_class}
      @#{user_class}.deliver_password_reset_instructions!
      add_notice "Instructions to reset your password have been emailed to you. Please check your email."
      redirect_to root_url
    else
      add_error "No #{user_class} was found with that email address"
      @#{user_class} = #{user_class.camelize}.new
      render :action => :new
    end
  end

  def edit

  end

  def update
    @#{user_class}.password = params[:#{user_class}][:password]
    @#{user_class}.password_confirmation = params[:#{user_class}][:password_confirmation]
    if @#{user_class}.save
      add_notice t(:password_success_update)
      redirect_to #{user_class}_path(@#{user_class})
    else
      add_error "Unable to update your password, try again."
      render :action => :edit
    end
  end

end

  EOF
end

file("app/views/password_resets/new.html.haml") do
  <<-EOF
%h1
  = t(:reset_password)
- semantic_form_for(@#{user_class}, :url => password_reset_path) do |f|
  = error_messages_for '#{user_class}', :object => @#{user_class}
  - f.inputs do
    = f.input :email
  - f.buttons :class => 'buttons' do
    = f.submit(t(:reset_password))

  EOF
end

file("app/views/password_resets/edit.html.haml") do
  <<-EOF
%h1
  = t(:change_password)
- semantic_form_for(@#{user_class},:url => password_reset_path(:id => @user.perishable_token),:html => { :method => :put }) do |f|
  = error_messages_for '#{user_class}', :object => @#{user_class}
  - f.inputs do
    = f.input :password, :as => :password
    = f.input :password_confirmation, :as => :password
  - f.buttons :class => 'buttons' do
    = f.submit t(:change_password)

  EOF
end

file("spec/controllers/password_resets_controller_spec.rb") do
  <<-EOF
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PasswordResetsController do
  describe "handling POST /password_resets" do
    before(:each) do
      activate_authlogic
      @#{user_class} = valid_#{user_class}
      @#{user_class}.save
    end

    def do_post
      post :create, :#{user_class} => {:email => @#{user_class}.email}
    end

    context "if a #{user_class.camelize} exists" do
      before(:each) do
        #{user_class.camelize}.stub!(:find_by_email).and_return @#{user_class}
      end

      it "should send password reset instructions" do
        @#{user_class}.should_receive(:deliver_password_reset_instructions!)
        do_post
      end

      it "should redirect to root url" do
        do_post
        response.should redirect_to root_url
      end
    end

    context "if a #{user_class.camelize} doesn't exist" do
      before(:each) do
        #{user_class.camelize}.stub!(:find_by_email).and_return nil
      end

      it "should render new action" do
        do_post
        response.should render_template "new"
      end
    end

  end

  describe "handling PUT to /password_resets/" do
    before(:each) do
      @#{user_class} = valid_#{user_class}
      @#{user_class}.save
      #{user_class.camelize}.stub!(:find_using_perishable_token).and_return @#{user_class}
    end

    def do_put
      put :update, :#{user_class} => {:password => "password", :password_confirmation => "password"}
    end

    it "should update the #{user_class.pluralize} password" do
      @#{user_class}.should_receive(:password=).with('password')
      @#{user_class}.should_receive(:password_confirmation=).with('password')
      do_put
    end

    it "should redirect to #{user_class} url" do
      do_put
      response.should redirect_to(#{user_class}_url(@#{user_class}))
    end

  end
end

  EOF
end

file('app/models/notifier.rb') do
  <<-EOF
class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "#{app_name} Notifier"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(:id => user.perishable_token)
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "#{app_name} Notifier"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_users_url(:id => user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "#{app_name} Notifier"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

end

  EOF
end

file("app/views/notifier/password_reset_instructions.erb") do
  <<-EOF
A request to reset your password has been made.
If you did not make this request, simply ignore this email.
If you did make this request just click the link below:

<%= link_to "Reset Password", @edit_password_reset_url %>

If the above URL does not work try copying and pasting it into your browser.
If you continue to have problem please feel free to contact us.
  EOF
end

file("app/views/notifier/activation_instructions.erb") do
  <<-EOF
Thank you for creating an account! Click the url below to activate your account!

<%= @account_activation_url %>

If the above URL does not work try copying and pasting it into your browser. If you continue to have problem, please feel free to contact us.

  EOF
end

file("app/views/notifier/activation_confirmation.erb") do
  <<-EOF
Your account has been activated.

<%= @root_url %>

If the above URL does not work try copying and pasting it into your browser. If you continue to have problem, please feel free to contact us.
  EOF
end

file("app/controllers/application_controller.rb") do
  <<-EOF
class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  before_filter :activate_authlogic
  helper_method :current_#{session_class},
                :current_#{user_class},
                :require_#{user_class},
                :require_#{user_class},
                :load_#{user_class}_using_perishable_token,
                :redirect_back_or_default

  private
    def current_#{session_class}
      return @current_#{session_class} if defined?(@current_#{session_class})
      @current_#{session_class} = #{session_class.camelize}.find
    end

    def current_#{user_class}
      return @current_#{user_class} if defined?(@current_#{user_class})
      @current_user = current_#{session_class} && current_#{session_class}.#{user_class}
    end

    def require_#{user_class}
      unless current_#{user_class}
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_#{session_class}_url
        return false
      end
    end

    def require_no_#{user_class}
      if current_#{user_class}
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to user_path(current_user)
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def load_#{user_class}_using_perishable_token
      @#{user_class} = #{user_class.camelize}.find_using_perishable_token(params[:id])
      unless @#{user_class}
        flash[:notice] = "We're sorry, but we could not locate your account. " +
        "If you are having issues try copying and pasting the URL " +
        "from your email into your browser."
        redirect_to root_url
      end
    end
end
  EOF
end
run("rm -rf spec/views/*")

rake "db:migrate"
git :add => "."
git :commit => "-m 'Adding Authlogic code'"

run("mkdir spec/support")
file("spec/support/fixjour_builders.rb") do
  <<-EOF
Fixjour do
  define_builder(#{user_class.camelize}) do |klass, overrides|
    klass.new
  end
end

include Fixjour
  EOF
end

file("spec/support/authlogic_helpers.rb") do
  <<-EOF
module AuthlogicHelperMethods

  def valid_user(overrides={})
    options = {:email => "valid@email.com", :password => "password", :password_confirmation => "password"}
    user = new_user(options)
  end

  def current_#{user_class}(stubs = {})
    @current_#{user_class} ||= valid_#{user_class}(stubs)
  end

  def current_#{session_class}(stubs = {}, #{user_class}_stubs = {})
    @current_#{session_class} ||= mock_model(#{session_class.camelize}, {:user => current_#{user_class}(#{user_class}_stubs)}.merge(stubs))
  end

  def login(#{session_class}_stubs = {}, #{user_class}_stubs = {})
    #{session_class.camelize}.stub!(:find).and_return(current_#{session_class}(#{session_class}_stubs, #{user_class}_stubs))
  end

  def logout
    @#{session_class} = nil
  end

end
  EOF
end

file("spec/spec_helper.rb") do
  <<-EOF
# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/autorun'
require 'spec/rails'
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
require 'authlogic/test_case'
#require File.dirname(__FILE__) + "/factories"

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.include(Fixjour)
  config.include(AuthlogicHelperMethods)
end

  EOF
end

git :add => "."
git :commit => "-m 'Adding test builders and helpers'"

file("features/autenticacao.feature") do
  <<-EOF
# language: pt
Funcionalidade: Autenticação
  Para que as pessoas usem meu aplicativo
  Como um desenvolvedor
  Eu quero prover:- registrar, logar, ativar e resetar a senha
  Cenário: registrar
    Dado que eu estou na página de registro de usuário
    E eu sou um novo usuário
    Quando eu preencher "user[email]" com "some@email.com"
    E eu preencher "Password" com "password"
    E eu preencher "user[password_confirmation]" com "password"
    E eu aperto "Salvar"
    Então eu devo ver "Sua conta foi criada. Por favor cheque seu email para as instruções de ativação!"
    E eu devo estar em new_user_session
    Quando eu abrir o email
    E eu clicar no primeiro link do email
    Então eu devo estar na página de login
  Cenário: Logar
    Dado que eu sou um usuário existente
    E que eu estou em new_user_session
    Quando eu preencher "user_session[email]" com "valid@email.com"
    E eu preencher "user_session[password]" com "password"
    E eu aperto "Logar"
    Então eu devo estar na página da minha conta
  Cenário: Resetando a senha
    Dado que eu sou um usuário existente
    E que eu estou em new_password_reset
    Quando eu preencho "user[email]" com "valid@email.com"
    E eu aperto "Recuperar senha"
    Então eu devo ver "Instructions"
    Quando eu abro o email
    E eu clico no primeiro link do email
    E eu preencho "Password" com "soccer"
    E eu preencho "Password confirmation" com "soccer"
    E eu aperto "Alterar senha"
    Então eu devo estar na página da minha conta
    E eu devo ver "Senha atualizada com sucesso"
  EOF
end

file("features/authentication.feature") do
  <<-EOF
Feature: Authentication
  In order to have people use my application
  As a developer
  I want to provide sign up, login, activation and password resetting

  Scenario: Signing Up
    Given I am on new_user
    And I am a new user
    When I fill in "user[email]" with "valid@email.com"
    And I fill in "user[password]" with "password"
    And I fill in "user[password_confirmation]" with "password"
    And I press "Salvar"
    Then I should see "Your account has been created. Please check your e-mail for your account activation instructions!"
    And I should be on new_user_session
    When I open the email
    And I click the first link in the email
    Then I should be on the login page

  Scenario: Logging In
    Given I am an existing user
    And I am on new_user_session
    When I fill in "user_session[email]" with "valid@email.com"
    And I fill in "user_session[password]" with "password"
    And I press "Logar"
    Then I should be on my account page

  Scenario: Scenario: Resetting my password
    Given I am an existing user
    And I am on new_password_reset
    When I fill in "user[email]" with "valid@email.com"
    And I press "Recuperar senha"
    Then I should see "Instructions"
    When I open the email
    And I click the first link in the email
    And I fill in "Password" with "soccer"
    And I fill in "Password confirmation" with "soccer"
    And I press "Alterar senha"
    Then I should be on my account page
    And I should see "Password successfully updated"

  EOF
end

file("features/step_definitions/authentication_steps.rb") do
  <<-EOF
Given /^I am an existing user$/ do
  @user = valid_user(:email => "valid@email.com", :password => "password", :password_confirmation => "password")
  @user.save
  @user.activate!
end

Given /^I am a new user$/ do
  @user = new_user(:email => "some@email.com")
end

Given /^I requested a password reset$/ do
  @user.reset_perishable_token!
end

Dado /^eu sou um novo usuário$/ do
  @user = new_user(:email => "some@email.com")
end

Dado /^que eu sou um usuário existente$/ do
  @user = valid_user(:email => "valid@email.com", :password => "password", :password_confirmation => "password")
  @user.save
  @user.activate!
end


  EOF
end

file("features/support/env.rb") do
  <<-EOF
# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
require 'cucumber/formatter/unicode'
# Comment out the next line if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'factory_girl'
require 'webrat'
Webrat.configure do |config|
  config.mode = :rails
end

require 'webrat/core/matchers'
require 'email_spec/cucumber'

require File.expand_path(File.dirname(__FILE__) +'/../../spec/support/fixjour_builders.rb')
World(Fixjour)
require File.expand_path(File.dirname(__FILE__) +'/../../spec/support/authlogic_helpers.rb')
World(AuthlogicHelperMethods)
Dir.glob(File.join(File.dirname(__FILE__), '../factories/*.rb')).each {|f| require f }

  EOF
end

file("features/support/paths.rb") do
%q{
  module NavigationHelpers
   def path_to(page_name)
     case page_name

       when /the homepage/
         '/'
       when /my account page/
         user_path(User.last.id)
       when /new_user_session/
         new_user_session_path()
       when /my password reset page/
         edit_password_reset_path(:id => User.last.perishable_token)
       when /the login page/
         new_user_session_path
       when /página da minha conta/
         user_path(User.last.id)
       when /página de login/
         new_user_session_path
       when /página de registro de usuário/
         new_user_path
       else
         begin
           eval(page_name+'_path')
         rescue
           raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                   "Now, go and add a mapping in #{__FILE__}"
         end
     end
   end
  end

  World(NavigationHelpers)

}
end

file("features/step_definitions/utility_steps.rb") do
  <<-EOF
Then /^I save and open page$/ do
  save_and_open_page
end

Então /^eu salvo e abro a página$/ do
  save_and_open_page
end
  EOF
end
file("features/step_definitions/email_steps_pt.rb") do
  <<-EOF
module EmailHelpers
  def current_email_address
    # Replace with your a way to find your current email. e.g @current_user.email
    # last_email_address will return the last email address used by email spec to find an email.
    # Note that last_email_address will be reset after each Scenario.
    last_email_address || (@current_user && @current_user.email) || (@user && @user.email) || "valid@email.com"
  end
end

World(EmailHelpers)

Quando /^eu sigo "([^"]*?)" no email$/ do |link|
  visit_in_email(link)
end

Quando /^(?:I|they|eu) clico no primeiro link do email$/ do
  click_first_link_in_email
end
Quando /^eu clicar no primeiro link do email$/ do
  click_first_link_in_email
end

Quando /^(?:I|they|eu|"([^"]*?)") abro o email$/ do |address|
  open_email(address)
end
Quando /^(?:I|they|eu|"([^"]*?)") abrir o email$/ do |address|
  open_email(address)
end
  EOF
end

generate "email_spec"

git :add => "."
git :commit => "-m 'Cucumber features for authentication'"

footer = <<-FOOTER

###################################
# Rails App Template by the science department (BJ Clark)
# http://www.scidept.com && http://bjclark.me
#
# Features: Full BDD suite with working specs and features. JQuery. Authlogic with activation and password recovery. Custom form builder, just include css file into layour for full effect. Resource_Controller for sahara worthy controllers.
#
# Last Steps:
# 1. Set up any acl you would like in your controllers. Check out the Authlogic tutorials for examples.
# 2. Edit the url host name in Notifier.rb or your emails won't work.

# 3. Edit the #current_email_address method in features/step_definitions/email_steps.rb
# 4. rake spec && rake features
# 5. Profit!
###################################

FOOTER

puts footer

