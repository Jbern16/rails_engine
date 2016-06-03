class FormatterService

  def self.revenue(revenue)
    Hash.new(total_revenue: revenue)
  end
end
