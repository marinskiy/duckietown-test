all: build run clean

image_name=duckietown_test:1
container_name=duckietown_test_cont_1
results_path = "$(CURDIR)/results/"

build:
	docker build . -t $(image_name)
run:
	docker run --name $(container_name) -v $(results_path):/gym-duckietown/results/ $(image_name)
clean:
	docker stop $(container_name)
	docker rm $(container_name)
	docker rmi $(image_name)
