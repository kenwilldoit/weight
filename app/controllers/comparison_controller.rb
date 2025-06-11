class ComparisonController < ApplicationController
  def judge 
    input1 = params[:day1]
    input2 = params[:day2]

    unless valid_number?(input1) && valid_number?(input2)
      @result = '数値のみ入力してください'
      return
    end

    @day1 = input1.to_f
    @day2 = input2.to_f

    if @day2 < @day1
      @result = '良い感じです！'
      @image = 'thin_golira.png'
    elsif @day2 > @day1
      @result = '見直しましょう...'
      @image = 'fat_golira.png'
    else
      @result = '変化はありません'
      @image = 'rails.svg'
    end
  end

  private

  def valid_number?(str)
    return false if str.nil? || str.strip.empty?
    Float(str)
    true
  rescue ArgumentError
    false
  end
end
