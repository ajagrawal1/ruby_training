# class to calculate Sales-Tax for a shop
class SalesTaxCalculator
  @@NON_TAXABLE_PRODUCTS = ['chocolate', 'chocolates', 'food', 'book', 'pills', 'medicine', 'medicines']
  @@SALES_TAX_RATE = 10
  @@IMPORT_TAX_RATE = 5

  def initialize
    @orders = []
    @order = ' '
    @total_price = 0.00
    @total_tax = 0.00
    @tax_percent = 0.00
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
    return unless @order.include? 'at'
    break_order
    check_taxable
    calculate_tax
    add_to_orders
  end

  def calculate_tax
    tax = (@tax_percent * @price * 20).ceil / 20.0
    @total_tax += tax
    @price += tax
    @total_price += @price
  end

  def check_taxable
    tax_rate = 0
    tax_rate += @@SALES_TAX_RATE if (@words_of_order & @@NON_TAXABLE_PRODUCTS).empty?
    tax_rate += @@IMPORT_TAX_RATE if @words_of_order.include? 'imported'
    @tax_percent = tax_rate / 100.0
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
    if @order.empty?
      @orders.push("Sales Taxes : #{'%.02f' % @total_tax}")
      @orders.push("Total : #{'%.02f' % @total_price}")

      puts 'Your order Summary :'
      @orders.each {|order| puts order }
    else
      puts 'Invalid Input'
    end
  end
end

calculator = SalesTaxCalculator.new
calculator.start