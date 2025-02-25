module storageModule 'br:bicepstoragemodule.azurecr.io/storage:v1' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: 'st${uniqueString(resourceGroup().id)}'
    location: 'eastus'
  }
}
