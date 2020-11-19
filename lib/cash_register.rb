require 'pry'
class CashRegister
    attr_reader :discount
    attr_accessor :total
    
    
    def initialize(discount = 20)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
        
    end

    def add_item(title,price, quantity = 1)
        self.total += price*quantity
        if quantity > 1
            @prices << price*quantity
            quantity.times do
                @items << title
            end
        else
            @items << title
            @prices << price
        end
    end

    def apply_discount()
        original_price = @total
        self.total = self.total*(100 - self.discount).to_f/100
        self.total == original_price ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        @items
    end 

    def void_last_transaction
        self.total = self.total - @prices.pop
        
        
        
    end
    

    

    


end
