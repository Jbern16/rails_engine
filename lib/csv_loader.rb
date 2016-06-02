require 'csv'

class CsvLoader
  def initialize(file, model)
    CSV.foreach("#{Rails.root}/db/data/#{file}.csv", headers: true) do |row|
      model.create(row.to_h)
    end
  end
end
