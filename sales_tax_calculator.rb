# class to calculate Sales-Tax for a shop
class SalesTaxCalculator
  def initialize
    @orders = []
    @order = ' '
    @total_price = 0.00
    @total_tax = 0.00
  end

  def start
    puts 'Please enter Your Order. Just press Enter to submit.'
    take_order 
    order_summary
  end

  private

  def take_order
    @order = gets.chomp
    return if @order.empty?

    break_order
    calculate_tax
    add_to_orders
  end

  def calculate_tax
    exempt = ['chocolate', 'chocolates', 'food', 'book', 'pills', 'medicine', 'medicines']
    tax = 0.00

    tax += 0.1 * @price if (@words_of_order&exempt).empty?
    tax += (0.05 * @price * 20).ceil/20.0 if @words_of_order.include? 'imported'

    @total_tax += tax
    @price += tax
    @total_price += @price
  end

  def break_order
    order_array = @order.split(' at ')
    @words_of_order = order_array[0].split(' ')

    quantity = @words_of_order[0].to_i
    @price = (order_array[1].to_f) * quantity
  end

  def add_to_orders
    @words_of_order.push(':')
    @words_of_order.push('%.02f' % @price)

    @orders.push(@words_of_order.join(' '))
    take_order
  end

  def order_summary
    @orders.push("Sales Taxes : #{'%.02f' % @total_tax}")
    @orders.push("Total : #{'%.02f' % @total_price}")

    puts 'Your order Summary :'
    @orders.each {|order| puts order }
  end
end

calculator = SalesTaxCalculator.new
calculator.start