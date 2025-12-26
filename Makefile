ROOT  := /home/Ody/projects/msh
BUILD := $(ROOT)/build
INC   := -I $(ROOT)/src/helpers

msh: $(BUILD)/main.o $(BUILD)/input.o
	@echo "Linking msh"
	gcc $(BUILD)/main.o $(BUILD)/input.o -o $(BUILD)/msh
	@echo "Successfully Linked"

$(BUILD)/main.o: $(ROOT)/src/main.c
	@echo "Compiling the main file"
	@mkdir -p $(BUILD)
	gcc -c $(ROOT)/src/main.c $(INC) -o $(BUILD)/main.o
	@echo "Successfully Compiled main"

$(BUILD)/input.o: $(ROOT)/src/helpers/input.c
	@echo "Compiling the input file"
	@mkdir -p $(BUILD)
	gcc -c $(ROOT)/src/helpers/input.c $(INC) -o $(BUILD)/input.o
	@echo "Successfully Compiled input"

clean:
	@echo "Cleaning"
	rm -f $(BUILD)/main.o $(BUILD)/input.o $(BUILD)/msh
	@echo "Successfully Cleaned"
