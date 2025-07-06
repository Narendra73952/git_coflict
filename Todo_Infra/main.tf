module "resouce_group" {
  source                  = "../module/azurerm_resource_group"
  resource_group_name     = "rg-todo"
  resource_group_location = "east US"
}

module "virtual_network" {
  depends_on              = [module.resouce_group]
  source                  = "../Module/azurerm_virtual_network"
  virtual_network_name    = "vnet_todo"
  resource_group_name     = "rg-todo"
  resource_group_location = "east US"
  address_space           = ["10.0.0.0/16"]
}

module "subnet_frontend" {
  depends_on           = [module.virtual_network]
  source               = "../Module/azurerm_subnet"
  azurerm_subnet_name  = "subnet_frontend"
  resource_group_name  = "rg-todo"
  virtual_network_name = "vnet_todo"
  address_prefixes     = ["10.0.1.0/24"]
}

module "subnet_backend" {
  depends_on           = [module.virtual_network]
  source               = "../Module/azurerm_subnet"
  azurerm_subnet_name  = "subnet_backend"
  resource_group_name  = "rg-todo"
  virtual_network_name = "vnet_todo"
  address_prefixes     = ["10.0.2.0/24"]
}
 
module"public_ip_frontend" {
 source = "../Module/azurerm_ip_address"
 public_ip= "pip-todo-frontend"
 resource_group_name="rg-todo"
 resource_group_location="east US"
 allocation_method="statis"
}
 
module"public_ip_backend" {
  source = "../Module/azurerm_ip_address"
 public_ip= "pip-todo-backend"
 resource_group_name="rg-todo"
 resource_group_location="east US"
 allocation_method="statis"
} 
module"azurerm_sql_server"{
  source = "../Module/azurerm_qsl_server"
  mssql_server_name="mssql-server-todo"
  resource_group_name="rg-todo"
  resource_group_location="east US"
  version="13.2"
  administrator_login="sqlserver"
  administrator_login_password="Test12345678"
  minimum_tls_version="statis"
 }

 module"arurerm_qsl_databse"{
  source = "../Module/azurerm_sql_batabase"
  name="sqldatabasetodoapp"
  azurerm_mssql_server_id="saqss"
  collation  = "d1" 
  license_type="ok"
  max_size_gb="2gb"
sku_name= "okok"
 }

module "azurerm_virtual_machine" {
  source = "../module/arurerm_virtual_machine"
  public_ip="10.1.0.4"
  resource_group_name="rg-todo"
  frontend_subnet_id="aa"
  virtual_network_name="vnet-todo"
  nic_name="todonic"
  nic_location="east US"
  ip_private= "10.78.0.1"
  data.azurerm_subnet.subnet_id.id
  private_ip_address_allocation="192.0.0.83"
  data.azurerm_public_ip.pip.id
  vmtodo="frontendVM"
  size="1tb"
  adminuser="abctodo"
   adminuserpassword="Test12345678"
disable_password_authentication = false
network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
  caching_readwrite="good"
  storage_account_type="table"
    publisher = "todoPublisher"
    offer="todo-offer"
    sku="good"
    version="v12"







}
