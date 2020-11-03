require "pry"




class CashRegister

    attr_reader :total, :discount
    attr_writer :total, :discount

    @@all = []

    def initialize (*discount)
        @total = 0
        @discount = discount.join.to_i
        @list = []
        @@all << self
        
    end

    def self.all
        @@all
    end

    def add_item(title, price, quantity=1)
        
        @total += price * quantity
        if quantity == 1
            @list << title
        elsif quantity > 1
            quantity.times do 
                @list << title 
            end
        end
    end

    def apply_discount
        if discount > 0
            percent = discount * 0.01
            discount_amount = total * percent 
            new_total = total - discount_amount.to_i
            @total = new_total
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @list
    end

    def void_last_transaction
        last = CashRegister.all.find do |register| 
            binding.pry
            register
        end
        @total - last
        binding.pry
    end




end




# binding.pry
0

