scriptId = 'nikhil.erin.sample'

function onForegroundWindowChange(app, title)
    wantActive = false
	activeApp = ""
	wantActive = string.match(title, "foobar2000")
	activeApp = "foobar2000"
	return wantActive	
end

function activeAppName()
    return activeApp
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end

function onPoseEdge(pose, edge)
if myo.getRoll() > .6 then
	myo.keyboard("i", "press", "alt")
elseif myo.getRoll() < .5 then
	myo.keyboard("o", "press", "alt")
end
if myo.getArm() == "right" then
        	if pose == "waveIn" then
            	myo.keyboard("leftbracket", "press", "win")
				sleep(50)
        	elseif pose == "waveOut" then
           		myo.keyboard("n", "press", "win")
				sleep(50)
			elseif pose == "fist" then
				if myo.getRoll() > .5 then
					myo.keyboard("o", "press", "alt")
				elseif myo.getRoll() < .45 then
					myo.keyboard("i", "press", "alt")
				else
					myo.keyboard("s", "press", "win")
				end	
			elseif pose == "thumbToPinky" then
           		myo.keyboard("s", "press", "alt")	
			end 
    end
end

function sleep(n)
  if n > 0 then 
	os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") 
  end
end

function onActiveChange(isActive)
    if not isActive then
        unlocked = false
    end
end
