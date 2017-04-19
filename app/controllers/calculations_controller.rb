class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input, is in the string @text. Variables that we will use.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    text_split_into_array_with_characters = @text.split
    text_split_into_array = @text.sub(",./';:", "").split



    # text_split_into_array = text_split_into_array.downcase
    text_without_characters = @text.sub(",./';:", "")

    text_without_space = text_without_characters.gsub(/\s+/, "")

    punctuation_characters = @text.count ",./;':"
    spaces = @text.count " "

    word_count = text_split_into_array.count ",./;':"

    @word_count = text_split_into_array.size
    # @word_count = text_split_into_array.size

    @character_count_with_spaces = @text.size

    @character_count_without_spaces = @text.gsub(" ","").size

    @occurrences =  @text.gsub(/[^a-z0-9\s]/i,"").split.count(@special_word.downcase)

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

    @seconds = "Replace this string with your answer."
    @minutes = "Replace this string with your answer."
    @hours = "Replace this string with your answer."
    @days = "Replace this string with your answer."
    @weeks = "Replace this string with your answer."
    @years = "Replace this string with your answer."

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

    @sorted_numbers = "Replace this string with your answer."

    @count = "Replace this string with your answer."

    @minimum = "Replace this string with your answer."

    @maximum = "Replace this string with your answer."

    @range = "Replace this string with your answer."

    @median = "Replace this string with your answer."

    @sum = "Replace this string with your answer."

    @mean = "Replace this string with your answer."

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
