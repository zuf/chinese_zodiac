class ChineseZodiac

  YEARS_DATA = {}

  def self.animal_sign(date)
    if YEARS_DATA.empty?
      initialize_years
    end

    date = date.to_date
    year = date.year

    year_data = YEARS_DATA[year]

    unless year_data
      raise "Date should be specified between #{@first_date} and #{@last_date} : #{date}"
    end

    start_of_year = year_data[:start_of_year]
    if date < start_of_year
       year_data = YEARS_DATA[year - 1]
       if year_data.nil?
         raise "No data available for datum earlier than #{@first_date} : #{date}"
       end
      # else: specified gregorian date greater or equal to start of chinese year 
      # so chinese year will always end at the next gregorian year and
      # current year_data is appropriate
    end

    sign_key = year_data[:animal_sign]
    I18n.t "chinese_zodiac.#{sign_key}"
  end

  private

  def self.initialize_years
    years_file = File.join(File.dirname(__FILE__), '..', 'csv', 'years.csv')   

    #CSV.foreach(years_file, :headers => true) do |row|
    CSV.open(years_file, 'r') do |row|      
      year = row[0].to_i

      day_month = row[1]
      edge_date = "#{day_month} #{year}"
      start_of_year = Date.strptime(edge_date, "%d %b %Y").to_date
      YEARS_DATA[year] = { :year => year, :start_of_year => start_of_year, :animal_sign => row[2]}
    end

    years = YEARS_DATA.keys
    years.sort!

    @first_date = YEARS_DATA[years.first][:start_of_year]
    @last_date = YEARS_DATA[years.last][:start_of_year]
  end
end
