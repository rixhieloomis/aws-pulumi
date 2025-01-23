param staccount1 string
param location string = 'East US'
resource staccount 'Microsoft.Storage/storageAccounts@2022-09-01'={
  name: staccount1
  kind: 'BlobStorage'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  properties:{
    accessTier: 'Cool'
  }
}

output staccountName string = staccount.name
output staccountLocation string = staccount.location
output staccountSku string = staccount.sku.name
