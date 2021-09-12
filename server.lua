--Script desenvolvido por Madrugadão#1580
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {} 
Tunnel.bindInterface("madrugadao_rout_repairkit",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(15,25)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"mecanico.permissao") then
        return true
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and vRP.hasPermission(user_id,"mecanico.permissao") then
	if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("repairkit") <= vRP.getInventoryMaxWeight(user_id) then
		vRP.giveInventoryItem(user_id,"repairkit",1)
		quantidade[source] = nil
		return true
		end
	end
end
