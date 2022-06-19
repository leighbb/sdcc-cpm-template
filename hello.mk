REPLACE_TAG=REPLACE_ME_PLEASE

hello:	$(BIN_DIR)/generic.arf

hello-clean:
	rm -f $(BIN_DIR)/*.com
	rm -f $(BIN_DIR)/*.ihx
	rm -f $(BIN_DIR)/*.arf

$(BIN_DIR)/generic.arf:	
	$(QUIET)$(ECHO) Generating generic.arf
	$(QUIET)$(ECHO) -mjx > $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -i $(BIN_DIR)/$(REPLACE_TAG).ihx >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -k $(COMPILER_LIBS) >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -l $(ARCH) >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -k $(LIB_DIR) >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -l cpm >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) $(LIB_DIR)/cpm0.rel >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) $(BIN_DIR)/$(REPLACE_TAG).rel >> $(BIN_DIR)/generic.arf
	$(QUIET)$(ECHO) -e >> $(BIN_DIR)/generic.arf
