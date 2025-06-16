class ComparisonController < ApplicationController
  def judge 
    input1 = params[:day1]
    input2 = params[:day2]

    unless valid_number?(input1) && valid_number?(input2)
      @result = '数値のみ入力してください'
      @quote = ''
      return
    end

    @day1 = input1.to_f
    @day2 = input2.to_f
    @difference = (@day2 - @day1).round(1)

    if @day2 < @day1
      @result = '良い感じです！'
      @image = 'thin_golira.png'
      quotes = [
      'よく頑張ったな！次は筋トレだ！',
      'その調子！水を多めに飲むといいぞ！',
      'やるやん！筋肉ゴリラの道も近い！'
      ]
    elsif @day2 > @day1
      @result = '見直しましょう...'
      @image = 'fat_golira.png'
      quotes = [
      'また増えてるぞ！今日もお菓子食べたろ？',
      '寝る前のラーメン、バレてるぞ',
      'まずは生活リズムを整えよう！'
    ]
    else
      @result = '変化はありません'
      @image = 'rails.svg'
      quotes = [
      '停滞期かな？焦らずいこう！',
      '変化がなくても落ち込むな！',
      '現状維持も立派な成果だ！'
    ]
    end
    
    @quote = quotes.sample
  end

  private

  # def valid_number?(str)
  #   return false if str.nil? || str.strip.empty? #何も入ってなかったらfalseを返す
  #   #マイナス値の場合はfalseを返す
  #   Float(str)
  #   return true
  # rescue ArgumentError
  #   false
  # end
  

  # def valid_number?(str) 
  #   if str.nil? || str.empty?
  #     false
  #   else
  #     number = Float(str) #自分で変数を考えて入れるのはまだ難しい
  #     number >= 0
  #   end
  # rescue ArgumentError
  #   false
  # end
  
  
  # 引数strのclassがIntegerもしくはFloatならtrueになるように修正
  
  def valid_number?(str)
    puts str.inspect
    str = str.to_f
    
    if str == 0.0
      false
    else
      true
    end

    #削除項目
    # if str.nil? || str.empty?
    #   false
    # end
    # if str.class == Integer || str.class == Float
    #   true
    # end
  end

end
