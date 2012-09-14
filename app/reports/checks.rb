class Checks < Prawn::Document
  
  def to_pdf(starting_check, cash_by)
    counter = starting_check
    font "Courier"
    
    entrants = Entrant.all_with_wins#.specific_with_wins(["224","500","210","330","212","100","107","108","323"])

    if entrants.any?
      id = entrants.last.id
      
      entrants.each do |entrant|

        font_size 10
        move_down 40 # move down

        text "<font size='12'>THIS CHECK <u>MUST</u> BE CASHED BY <b>#{cash_by}</b>        <b>CHECK #{counter}</b></font>", :inline_format => true
        
        move_down 253 # move down
        
        # print amount of money
        if entrant.wins_total*1.00 > 100.00
          text "#{currency_to_words(entrant.wins_total*1.00)}                  #{Date.today}        $#{Money.new(entrant.wins_total*100.00)}"
        else
          text "#{currency_to_words(entrant.wins_total*1.00)}                        #{Date.today}         $#{Money.new(entrant.wins_total*100.00)}"
        end
        
        move_down 50 # move down
        
        # print address
        text "#{entrant.full_name}"
        text "#{entrant.address_line_1}"
        unless entrant.address_line_2.blank? # only print line 2 if not blank
          text "#{entrant.address_line_2}"
        end
        text "#{entrant.address_city}, #{entrant.address_state} #{entrant.address_zip_code}"
        
        move_down 97 # move down
        font_size 7
        
        table = []
        table << ["Category", "Prize", "Amount"]
        entrant.wins.each do |w|
          table << ["#{w.category.name_with_department}", "#{w.prize.name}", "#{w.prize.amount}"]
        end
        
        table(table, :width => 480, :cell_style => {:padding => [2, 2, 2, 2]})
        
        unless entrant.id == id
          start_new_page(:layout => :portrait, :margin => 60)
        end
        
        counter = counter + 1
      end
    end
      
    render
  end
    
  def currency_to_words(amount)
    currency = amount.to_s.split('.')
    dollars = Linguistics::EN.numwords(currency[0])
    cents = "#{currency[1]}/100"
    "#{dollars.split(" ").each{|word| word.capitalize!}.join(" ")} Dollars and #{cents}"
  end
  
end