local targetID = 123 -- ROBLOX ID GOES THERE
local Char = script.Parent
wait()
function GetName()
	local ID = tonumber(targetID)
	local Name = game.Players:GetNameFromUserIdAsync(ID)
	return Name
end
wait(1)
for i,q in pairs(Char:GetDescendants()) do
	if (q:IsA('Decal') and q.Name ~= 'face') or q:IsA('CharacterMesh') or q:IsA('Accessory') or q:IsA('Shirt') or q:IsA('Pants') or q:IsA('CylinderMesh') or q:IsA('BlockMesh') or q:IsA('ShirtGraphic') or (q:IsA('SpecialMesh') and q.Name ~= 'OriginalMesh') and (q.Parent and q.Parent.Name ~= 'Handle') and (q.Parent and q.Parent.Name ~= 'Head') and (q.Parent and q.Parent.Parent and not q.Parent.Parent:IsA('Tool')) then
		q:Destroy() 
	end
end
local info = game:GetService('Players'):GetCharacterAppearanceInfoAsync(targetID)
for i,q in pairs(Char:GetDescendants()) do
	if (q:IsA('Decal') and q.Name ~= 'face') or q:IsA('CharacterMesh') or q:IsA('Accessory') or q:IsA('Shirt') or q:IsA('Pants') then
		q:Destroy() 
	end
end
Char.Humanoid.DisplayName = GetName()
for key,table in pairs(info) do
	if key == 'assets' then
		for ke,item in pairs(table) do
			for k,it in pairs(item) do
				if k == 'id' and it ~= nil then
					local model = game:GetService("InsertService"):LoadAsset(it)
					for _,child in pairs(model:GetChildren()) do
						if child:IsA('Accessory') or child:IsA('Pants') or child:IsA('Shirt') then
							child.Parent = Char
						elseif child:IsA('Decal') then
							if Char.Head:findFirstChild('face') then
								Char.Head.face:Destroy()
							end
							child.Parent = Char.Head
						elseif child:IsA('ShirtGraphic') then
							child.Parent = Char
						elseif child:IsA('Folder') then
							for i,s in pairs(child:GetChildren()) do
								if s:IsA('CharacterMesh') then
									s.Parent = Char
								end
							end
						elseif child:IsA('SpecialMesh') or child:IsA('BlockMesh') or child:IsA('CylinderMesh') then
							if Char.Head:findFirstChild('Mesh') then
								Char.Head.Mesh:Destroy()
							end
							child.Parent = Char.Head
						end
					end
				end
			end
		end
elseif key == 'bodyColors' then
for Part,Col in pairs(table) do
if Part == 'torsoColorId' then
Char.Torso.BrickColor = BrickColor.new(Col)
elseif Part == 'rightArmColorId' then
Char['Right Arm'].BrickColor = BrickColor.new(Col)
elseif Part == 'leftArmColorId' then
Char['Left Arm'].BrickColor = BrickColor.new(Col)
elseif Part == 'rightLegColorId' then
Char['Right Leg'].BrickColor = BrickColor.new(Col)
elseif Part == 'leftLegColorId' then
Char['Left Leg'].BrickColor = BrickColor.new(Col)
elseif Part == 'headColorId' then
Char.Head.BrickColor = BrickColor.new(Col)
end
end
end
end
