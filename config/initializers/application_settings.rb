module ApplicationSettings
  DEFAULT_QUANTITIES = [2,3,4]
  SVM_CACHE_EXPIRE = 1.second   if Rails.env.test?
  SVM_CACHE_EXPIRE = 3.second   if Rails.env.development?
  SVM_CACHE_EXPIRE = 15.minutes if Rails.env.production?
end