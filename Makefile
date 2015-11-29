PORT := 9094

less:
	lessc static/css/style.less static/css/style.css

build:
	go build -o sibo.io

test: less build
	./sibo.io

run: stop build
	nohup ./sibo.io>/dev/null 2>&1 &

stop:
	-lsof -t -i:${PORT} | xargs kill

.PHONY: build, run, test
