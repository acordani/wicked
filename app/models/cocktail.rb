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

