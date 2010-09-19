require 'svm'
class Predictor
  def initialize
    problem = Problem.new(Recipe.svm_labes,
                          Recipe.svm_data)

    param   = Parameter.new(:kernel_type => LINEAR, :C => 10)
    @model  = Model.new(problem, param)
  end

  def execute_based_on(arr)
    @model.predict(arr)
  end
end
