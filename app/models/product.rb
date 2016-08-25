class Product < ActiveRecord::Base
  searchable do
    text :name
    text :description
  #text :comments do
  #  comments.map(&:content)
  #end
  #time :created_at
  #string :publish_month
  end

	def self.import file
		sheet = open_sheet(file)
		sheet.default_sheet = sheet.sheets[0]
		header = sheet.row(1).collect(&:strip)
		(2..sheet.last_row).each do |i|
          row = Hash[[header,sheet.row(i)].transpose]
          Product.create! row.to_hash
         # product.attributes = row.to_hash.slice(*accessible_attributes)
         # product.save!
        end
	end

    def self.open_sheet(file)
        case File.extname(file.original_filename)
          when ".csv" then  Roo::Csv.new(file.path)
          when ".xls" then  Roo::Excel.new(file.path)
          when ".xlsx" then  Roo::Excelx.new(file.path)
          else raise "Error EN TIPO DE ARCHIVO #{file.original_filename}"
         end	
    end
end