class Pokemon < ApplicationRecord

  has_and_belongs_to_many :types
  has_and_belongs_to_many :abilities
  has_one :stat

  validates :name, presence: true
  validates :species, presence: true

  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|pokemon| [model.name,model.year,model.trim,model.make_id] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
end
