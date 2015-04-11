-- =============================================================
-- Copyright Roaming Gamer, LLC. 2009-2014 
-- =============================================================
-- 
-- =============================================================
local public = {}

----------------------------------------------------------------------
--								REQUIRES							--
----------------------------------------------------------------------
-- none

----------------------------------------------------------------------
--								DECLARATIONS						--
----------------------------------------------------------------------
-- Variables
local layers

-- Forward Declarations

-- Localizations
local mRand             = math.random
local getTimer          = system.getTimer
local pairs             = pairs

----------------------------------------------------------------------
--								DEFINITIONS							--
----------------------------------------------------------------------
-- Initialize module
function public.create( parent, params )	
	parent = parent or display.currentStage
	params = params or {}
	print("Creating render layers.")


	layers 				= display.newGroup()
	layers.underlay 	= display.newGroup()
	layers.world 		= display.newGroup()
	layers.content1 	= display.newGroup()
	layers.content2 	= display.newGroup()
	layers.content3 	= display.newGroup()
	layers.overlay 		= display.newGroup()


    parent:insert( layers )

	layers:insert( layers.underlay )
	layers:insert( layers.world )
	layers:insert( layers.overlay )

	layers.world:insert( layers.content1 )
	layers.world:insert( layers.content2 )
	layers.world:insert( layers.content3 )

	--[[ Final Layer Order (bottom-to-top)
	\
	|---\underlay
	|
	|---\world 
	|   |
	|	|---\content1 
	|	|
	|	|---\content2
	|	|
	|	|---\content3
	|
	|---\overlay
	]]

	return layers
end

-- Initialize module
function public.cleanup( )	
	print("Cleaning up wall module.")

	-- Destroy the layers parent group, all child groups, and all child objects in 
	-- one fell swoop!  Booya!
	--
	display.remove(layers)

	-- Clear local references to objects
	--	
	layers = nil
end

return public