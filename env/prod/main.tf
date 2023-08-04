module "Producao" {
    source        = "../../infra"
    name          = "producao"
    descricao     = "aplicacao-de-producao"
    max           = 3
    maquina       = "t2.micro" 
    ambiente      = "ambiente-de-producao" 
}