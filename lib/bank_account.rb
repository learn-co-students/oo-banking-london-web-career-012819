class BankAccount

    attr_reader :name #can't be changed, we use attr_reader everytime something cannot be changed but can be accessed or read within the class
    attr_accessor :balance, :status #can be changed and can be accessed within the class, we use attr every time we want to have the flecibiliy  to change it from within the class

  def initialize(name) #here we have assigned a new instance of the name of the account, the bank balance and the status, so the attributes
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(balance)
    @balance += balance
    # @balance += balance is another way of writing this
  end

  def  display_balance
    return "Your balance is $#{self.balance}."
    #this is referencing the account balance which is self.balance
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end #close account is a method that gives a  closed status when it is called and we use self to initiate it.
end

#self and @ is doing the same thing, where you have an @ you do not need a self
