all: build start stop clean

image_name=duckietown_test:1
container_name=duckietown_test_cont_1
results_path = "$(CURDIR)/results/"

build:
	docker build . -t $(image_name)
start:
	docker run --name $(container_name) -v $(results_path):/gym-duckietown/results/ $(image_name)

stop:
	docker stop $(container_name)
clean:
	docker rm $(container_name)
	docker rmi $(image_name)
