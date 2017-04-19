class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input, is in the string @text. Variables that we will use.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    text_split_into_array_with_punctuation= @text.split
    text_split_into_array_without_punctuation= @text.downcase.gsub(/[^a-z0-9\s]/i, '')

    # text_split_into_array = @text.sub(",./';:", "").split
    # # text_split_into_array = text_split_into_array.downcase
    # text_without_characters = @text.sub(",./';:", "")
    #
    # text_without_space = text_without_characters.gsub(/\s+/, "")

    # punctuation_characters = @text.count ",./;':"
    # spaces = @text.count " "
    #
    # # word_count = text_split_into_array.count ",./;':"

    @word_count = text_split_into_array_without_punctuation.split.size
    @character_count_with_spaces = @text.size

    @character_count_without_spaces = @text.gsub(" ","").size

    @occurrences =  @text.downcase.gsub(/[^a-z0-9\s]/i,"").split.count(@special_word.downcase)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    monthly_rate=@apr/1200
    time_in_months=@years*12
    denominator=1-((1+monthly_rate))**-time_in_months

    # =(E5/12)*E7/(1-(1+(E5/12))^-(12*12))

    @monthly_payment=monthly_rate*@principal/denominator

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================


    @seconds = (@ending - @starting).to_i
    @minutes = ((@ending - @starting)/60).to_i
    @hours = @minutes/60.to_f
    @days = @hours/24.to_f
    @weeks = @days/7.to_f
    @years = @weeks/52.to_f


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================
    sum=0
    @sorted_numbers = @numbers.sort
    @count = @numbers.count
    @minimum = @numbers.min
    @maximum = @numbers.max
    @range = @numbers.max-@numbers.min

    middle=@count/2#.to_f
    if @count.even?
      median = (@numbers[middle]+@numbers[middle-1])/2
    elsif
      median = @numbers[middle]
    end
    @median = median
    @sum = @numbers.inject(0){|sum,x| sum+x}
    @mean = @sum/@count

    diff_element_mean = @numbers.map{|i| i-@mean.to_f}
    element_squared = diff_element_mean.map{|num| num **2}
    sum_squared = element_squared.inject(0){|sum,x| sum+x}

    @variance =(sum_squared/@count)
    @standard_deviation = (@variance**0.5).round(2)


    @mode = @numbers.uniq.max_by{|i| @numbers.count(i)}

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
