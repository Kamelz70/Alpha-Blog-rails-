class Category < ApplicationRecord
  before_save {self.name=self.name.downcase}
  validates :name, presence: true,
                        uniqueness: {case_sensetive:false},
                        length: {minimum:3,maximum:25}

end
