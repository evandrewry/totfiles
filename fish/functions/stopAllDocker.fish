function stopAllDocker
	docker stop (docker ps -a -q)
end
