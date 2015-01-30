class Landlord < ActiveRecord::Base
def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    puts row
    landlord = find_by_id(row["id"]) || new
    puts landlord
    puts landlord.attribute_names()
    puts row.to_hash.slice(*landlord.attribute_names())
    landlord.attributes = row.to_hash.slice(*landlord.attribute_names())
    puts '====='
    puts landlord.attributes
    landlord.save!
  end
end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
