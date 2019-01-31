require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :last

  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @last = @amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
        @sender.balance += @last
        @receiver.balance -= @last
        @status = "reversed"
    end
  end

end
