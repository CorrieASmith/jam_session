class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:capitalize_venue)

  private

  define_method(:capitalize_venue) do
    names = []
    self.name.split(" ").each() do |name|
      names.push(name.capitalize())
    end
    self.name = names.join(" ")
  end
end
