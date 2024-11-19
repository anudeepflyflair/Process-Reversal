resource "aws_dynamodb_table" "transactions_table" {
  name           = "${var.project}-TransactionLedgerTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "transactionId"
  range_key      = "timestamp"
 
  attribute {
    name = "transactionId"
    type = "S"
  }
 
  attribute {
    name = "timestamp"
    type = "S"
  }
 
  attribute {
    name = "amount"
    type = "N"
  }
 
  attribute {
    name = "currency"
    type = "S"
  }
 
  attribute {
    name = "status"
    type = "S"
  }
 
  attribute {
    name = "paymentProcessorResponse"
    type = "S"
  }
 
  attribute {
    name = "paymentMethod"
    type = "S"
  }
 
  attribute {
    name = "payerId"
    type = "S"
  }
 
  attribute {
    name = "metadata"
    type = "M"
  }
 
  attribute {
    name = "linkedTransactionId"
    type = "S"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-TransactionLedgerTable"
  }
}


#audit trail table
resource "aws_dynamodb_table" "audit_trail_table" {
  name           = "${var.project}-ReversalAuditTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "reversalAuditId"
  range_key      = "timestamp"
 
  attribute {
    name = "reversalAuditId"
    type = "S"
  }
 
  attribute {
    name = "timestamp"
    type = "S"
  }
 
  attribute {
    name = "initiator"
    type = "S"
  }
 
  attribute {
    name = "transactionId"
    type = "S"
  }
 
  attribute {
    name = "reversalId"
    type = "S"
  }
 
  attribute {
    name = "amount"
    type = "N"
  }
 
  attribute {
    name = "currency"
    type = "S"
  }
 
  attribute {
    name = "status"
    type = "S"
  }
 
  attribute {
    name = "reason"
    type = "S"
  }
 
  attribute {
    name = "metadata"
    type = "M"
  }
 
  attribute {
    name = "actionDetails"
    type = "M"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-ReversalAuditTable"
  }
}