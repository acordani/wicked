# Gem Wicked



## On va partir sur le mister cocktail du wagon. Et on va essayer de créer ces cocktails en plusieurs formulaires

### Premiere étape la création des fichiers

- rails new wicked -T --database=postgresql
- rake db:create
- git init
- git add .
- git commit -m "rails new"
- hub create
- git push origin master

- On va dans gemfiles et das la partie dev, on ajoute la gem 'better_errors' et la gem 'binding_of_caller'.
- Et on ajoute la gem 'wicked'

Puis on fait un bundle install

rails g model Cocktail name:string ingredient1:string ingredient2:string ingredient3:string preparation:text

rake db:migrate

Puis on determine les validations des differentes étapes dans le model: cocktail.rb

```ruby
class Cocktail < ActiveRecord::Base

  attr_accessor :form_step

  cattr_accessor :form_steps do
    %w(name ingredient description verify)
  end

  with_options :if => -> { required_for_step?(:name) } do |step|
    step.validates :name, :presence => true

  end

  with_options :if => -> { required_for_step?(:ingredient) } do |step|
    step.validates :ingredient1, :presence => true
    step.validates :ingredient2, :presence => true
    step.validates :ingredient3, :presence => true
  end

  with_options :if => -> { required_for_step?(:description) } do |step|
    step.validates :description, :presence => true
  end



  private
    def required_for_step?(step)
      # All fields are required if no form step is present
      return true if form_step.nil?

      # All fields from previous steps are required if the
      # step parameter appears before or we are on the current step
      self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
    end
end
```

On determine les routes
```ruby
Rails.application.routes.draw do

  resources :cocktails
end
```

rails g controller cocktails

On met en place les gems pour bootstrap:
```ruby
gem 'bootstrap-sass', '~> 3.3.1'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'simple_form'
```
Puis
```
$ bundle install
$ rails generate simple_form:install --bootstrap
```
puis on va sur le repo github du wagon

lewagon/rails-stylesheets

Et on copie les codes ;-)

pour la page index de Cocktail, on utilise le [tableau bootstrap](http://getbootstrap.com/css/#tables)




