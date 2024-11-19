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
    name = "linkedTransactionId"
    type = "S"
  }
 
  attribute {
    name = "metadata"
    type = "S"
  }
 
  attribute {
    name = "metadata_json"
    type = "S"
  }
 
  global_secondary_index {
    name           = "AmountIndex"
    hash_key       = "amount"
    range_key      = "currency"
    projection_type = "ALL"
  }
 
  global_secondary_index {
    name           = "StatusIndex"
    hash_key       = "status"
    projection_type = "ALL"
  }
 
  global_secondary_index {
    name           = "LinkedTransactionIdIndex"
    hash_key       = "linkedTransactionId"
    projection_type = "ALL"
  }
 
  global_secondary_index {
    name           = "MetadataIndex"
    hash_key       = "metadata"
    projection_type = "ALL"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-TransactionLedgerTable"
  }
}


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
    name = "metadata_json"
    type = "S"
  }
 
  attribute {
    name = "actionDetails"
    type = "M"
  }
 
  attribute {
    name = "actionDetails_json"
    type = "S"
  }
 
  global_secondary_index {
    name           = "AmountIndex"
    hash_key       = "amount"
    range_key      = "currency"
    projection_type = "KEYS_ONLY"
  }
 
  global_secondary_index {
    name           = "StatusIndex"
    hash_key       = "status"
    projection_type = "KEYS_ONLY"
  }
 
  global_secondary_index {
    name           = "TransactionIdIndex"
    hash_key       = "transactionId"
    projection_type = "KEYS_ONLY"
  }
 
  global_secondary_index {
    name           = "MetadataIndex"
    hash_key       = "metadata"
    projection_type = "KEYS_ONLY"
  }
 
  global_secondary_index {
    name           = "ActionDetailsIndex"
    hash_key       = "actionDetails"
    projection_type = "KEYS_ONLY"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-ReversalAuditTable"
  }
}
