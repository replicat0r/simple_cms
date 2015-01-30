class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  # validates_length_of :permalink, :maximum => 0..255
  validates_uniqueness_of(:permalink)

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |pages|
        csv << pages.attributes.values_at(*column_names)
      end
    end

  end


end
