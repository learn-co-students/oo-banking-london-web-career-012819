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
    #if execute_transaction == true
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
