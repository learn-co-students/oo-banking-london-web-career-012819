class BankAccount

attr_accessor :balance, :status
attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    @balance += num
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    @status = "closed"
  end

 def valid?
     balance > 0 && status == "open"
   end
end



# BankAccount
#   #initialize
#     can initialize a Bank Account (FAILED - 1)
#     initializes with a name (FAILED - 2)
#     always initializes with balance of 1000 (FAILED - 3)
#     always initializes with a status of 'open' (FAILED - 4)
