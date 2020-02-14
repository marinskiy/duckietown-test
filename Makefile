all: build check-forward check-backward clean

image_name=duckietown_test:1
container_name=duckietown_test_cont_1
results_path = "$(CURDIR)/results/"

build:
	docker build . -t $(image_name)
check-forward:
	docker run --name $(container_name) -v $(results_path):/gym-duckietown/results/ -e False $(image_name)
	docker stop $(container_name)
	docker rm $(container_name)
check-backward:
	docker run --name $(container_name) -v $(results_path):/gym-duckietown/results/ -e True $(image_name)
	docker stop $(container_name)
	docker rm $(container_name)
clean:
	docker rmi $(image_name)
