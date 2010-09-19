require 'svm'
class Predictor
  def initialize
    svm_args = Rails.cache.read('svm_args')
    unless svm_args.present?
      svm_args = {'labes'=>Recipe.svm_labes, 'data'=>Recipe.svm_data}
      Rails.cache.write('svm_args',
                        svm_args,
                        :unless_exist => true,
                        :expires_in => ApplicationSettings::SVM_CACHE_EXPIRE)
    end

    problem = Problem.new(svm_args['labes'],
                          svm_args['data'])

    param   = Parameter.new(:kernel_type => LINEAR, :C => 10)
    @model  = Model.new(problem, param)
  end

  def execute_based_on(arr)
    @model.predict(arr)
  end
end
