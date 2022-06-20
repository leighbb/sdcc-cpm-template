# Here begins the actual creation of destination files
libraries: $(LIB_DIR)/cpm.lib $(LIB_DIR)/crt0.rel

libraries-clean:
	rm -f $(BIN_DIR)/*.rel

$(LIB_DIR)/cpm.lib:				\
		$(LIB_DIR)/cpmbdos.rel		\
		$(LIB_DIR)/cpm_sysfunc.rel	\
		$(LIB_DIR)/putchar.rel
	$(CAR) -rsc $@ $^

$(LIB_DIR)/cpm_sysfunc.rel: $(SYSLIB_SRC_DIR)/cpm_sysfunc.c
	$(CCC) $(CCC_FLAGS) -o $@ $^

$(LIB_DIR)/putchar.rel: $(SYSLIB_SRC_DIR)/putchar.c
	$(CCC) $(CCC_FLAGS) -o $@ $^

$(LIB_DIR)/cpmbdos.rel:	$(SRC_DIR)/cpm/cpmbdos.c
	$(CCC) $(CCC_FLAGS) -o $@ $^

$(LIB_DIR)/crt0.rel: $(CPM_SRC_DIR)/crt0.s
	$(CAS) $(CAS_FLAGS) $@ $^
