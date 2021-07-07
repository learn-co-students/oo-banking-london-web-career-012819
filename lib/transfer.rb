class Transfer

attr_accessor :status
attr_reader :sender, :receiver, :amount

 def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
 end

 def valid?
  sender.valid? && receiver.valid? && self.status == "pending" && sender.balance >= @amount
 end

 def execute_transaction
   if self.valid?
     receiver.balance += @amount
     sender.balance -= @amount
        self.status = "complete"
   else
      self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end

 def reverse_transfer
   if self.execute_transaction
     receiver.balance -= @amount
     sender.balance += @amount
    self.status = "reversed"
   end
 end
end
