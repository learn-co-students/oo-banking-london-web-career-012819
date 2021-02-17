
class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    self.status = "open"
  end

  def deposit(money_paid)
    @balance += money_paid  #Another way for it to work
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
