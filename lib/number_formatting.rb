module NumberFormatting
  
  def currency_to_english(number, scale)
    
    if number < 0  #  No negative numbers.
      return 'Please enter a number that isn\'t negative.'
    end
    if number == 0
      return 'zero'
    end
  
    # check scale:
    
    if scale<0 or scale>1
      return 'scale out of range'
    end  
    
    # valid scales: 
    # 0) British (long scale) 
    # 1) American (short scale)
    
    numString = ''  #  This is the string we will return.
    
    onesPlace = ['one',  'two',  'three', 'four',     
                 'five', 'six',  'seven', 'eight',  'nine']
    tensPlace = ['ten',  'twenty', 'thirty', 'forty',  'fifty',
                 'sixty',   'seventy',   'eighty',   'ninety']
    teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 
                 'fifteen', 'sixteen', 'seventeen', 'eighteen', 
                 'nineteen']
    
    # short scale words
    
    expTens = [['b'],['tr'],['quadr'],['quint'],['sext'],
               ['sept'],['oct'],['non'],['dec'],['undec'],
               ['duodec'],['tredec'],['quattuordec'],['quindec'],
               ['sexdec'],['septendec'],
               ['octodec'],['novemdec'],['vigint']]
    
    # add short scale exponents and append "illion"'s!
  
    exp = 9
    
    expTens.each do |expTen|
    
      expTen[0] = expTen[0] + 'illion';
      expTen.push(exp)
      exp = exp + 3
    
    end
        
    if scale == 0 # British (long scale) 
                  # not using uncommon "milliard" (10**9)
    
      # convert exponents to long scale
      
      expTens.each do |expTen|
  
          expTen[1] = (expTen[1] - 3) * 2    
      
      end
      
    end
   
    # add words and exponents common to both scales
    
    expTens = [ ['hundred', 2], ['thousand', 3], ['million', 6] ] 
              #+ expTens
    expTens = expTens + [ ['googol', 100], ['centillion', 600] ]
  
    # rational.rb says googolplex i.e. 10**(10**100) => Infinity
   
    # unfortunatly now after the possible conversion to British 
    # long scale the expTens array is not in order. A googol's 
    # exponent is 100 which means it should be between 
    # sexdecillion and septendecillion.
  
    # let's simply sort the array every time in case other such 
    # ordering errors occur
  
    expTens.sort! { |x, y| x[1]<=>y[1] } # how easy was that! :)
    
    left  = number

    # handle hundreds and above
  
    expTens.reverse.each do |expTen|
  
        value = 10**expTen[1]
        write = left/value
        left  = left - write*value
        
        if write > 0
        
          exps = currency_to_english(write, scale)
          numString = numString + exps + ' ' + expTen[0]
  
          if left > 0
  
            if left < 100
              numString = numString + ' and '
            elsif
              numString = numString + ', '
            end
            
          end
          
        end
      
    end
    
    # handle teens
    
    write = left/10          #  How many tens left to write out?
    left  = left - write*10  #  Subtract off those tens.
    
    if write > 0
      if ((write == 1) and (left > 0))
        #  Since we can't write "tenty-two" instead of "twelve",
        #  we have to make a special exception for these.
        numString = numString + teenagers[left-1]
        #  The "-1" is because teenagers[3] is 'fourteen', 
        #  not 'thirteen'.
        
        #  Since we took care of the digit in the ones place
        #  already, we have nothing left to write.
        left = 0
      else
        numString = numString + tensPlace[write-1]
        #  The "-1" is because tensPlace[3] is 'forty', 
        #  not 'thirty'.
      end
      
      if left > 0
        #  So we don't write 'sixtyfour'...
        numString = numString + '-'
      end
    end
      
    # handle ones
    
    write = left  #  How many ones left to write out?
    left  = 0     #  Subtract off those ones.
    
    if write > 0
      numString = numString + onesPlace[write-1]
      #  The "-1" is because onesPlace[3] is 'four', not 'three'.
    end
    
    #  Now we just return "numString"...
    "#{numString.upcase} DOLLARS AND 00/100"
  end

end