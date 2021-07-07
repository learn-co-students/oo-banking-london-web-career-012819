class Transfer
  attr_accessor :receiver, :status, :amount
  attr_reader :sender

  def initialize(sender,receiver,amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = amount
 end

 def valid?
     if (@sender.valid? && @receiver.valid?)
      true
     else
      false
     end
 end

  def execute_transaction

    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif (@sender.balance > @amount && @status == "pending")
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

   def reverse_transfer

     if @status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
     end
  end
end



  # @balance
  # @status

  # 1. we need a sender account
  # 2. we need a reciever account
  # 3. we need to use balance
  # 4. we need to use status
  #5. sender must have money in the account
  # 6. sender sends money to receiver
  # 7. when you send money your account goes down
  # 8. when you receive money your account goes up
