class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, :presence => true)
  before_save(:capitalize_band)

  private

  define_method(:capitalize_band) do
    names = []
    self.name.split(" ").each() do |name|
      names.push(name.capitalize())
    end
    self.name = names.join(" ")
  end
end
