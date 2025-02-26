param resourceGroupName string
param location string = 'East US'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

output rgName string = rg.name
output rgLocation string = rg.location

