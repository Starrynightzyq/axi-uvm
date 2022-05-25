## 
## -------------------------------------------------------------
##    Copyright 2010-2011 Synopsys, Inc.
##    All Rights Reserved Worldwide
## 
##    Licensed under the Apache License, Version 2.0 (the
##    "License"); you may not use this file except in
##    compliance with the License.  You may obtain a copy of
##    the License at
## 
##        http://www.apache.org/licenses/LICENSE-2.0
## 
##    Unless required by applicable law or agreed to in
##    writing, software distributed under the License is
##    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
##    CONDITIONS OF ANY KIND, either express or implied.  See
##    the License for the specific language governing
##    permissions and limitations under the License.
## -------------------------------------------------------------
## 

PARAMS_STRING ?= id-5_addr-32_data-8_len-8
PARAMSFILE    = $(PARAMS_PKGS_DIR)/params_pkg_$(PARAMS_STRING).sv
RTLFILES      = ../rtl/axi_pkg.sv ../rtl/axi_if.sv
TBFILES       = ../rtl/axi_uvm_pkg.sv ../tb/tb.sv
# UVM_HOME      = /opt/mentor/modelsim/2020.4/modeltech/verilog_src/uvm-1.1d

# default: go big or go home 
transactions ?= 200
#Set SEED=0 for stable/consistent runs like pre-commit checks
SEED ?=random
UVM_TESTNAME ?= axi_pipelined_reads_test
LOG_DIR      = logs
PARAMS_PKGS_DIR = params_pkgs
PARAMS_PKGS_TEMPLATE = params_pkg.sv_TMPL

export LD_LIBRARY_PATH=${VERDI_HOME}/share/PLI/VCS/LINUX64

include $(UVM_HOME)/examples/Makefile.vcs

VCS += -full64 \
	   -cpp /usr/local/gcc-4.8.5/bin/g++-4.8.5 \
	   -cc /usr/local/gcc-4.8.5/bin/gcc-4.8.5 \
	   -fsdb \
	   -lca -kdb

CHECK = \
	@$(TEST) \( `grep -c 'UVM_ERROR :    $(N_ERRS)' $(LOG_DIR)/*` -eq 1 \) -a \
		 \( `grep -c 'UVM_FATAL :    $(N_FATALS)' $(LOG_DIR)/*` -eq 1 \)

all: params_pkgs comp run

params_pkgs:
	./gen_params_pkg.py --template $(PARAMS_PKGS_TEMPLATE) --outputdir=$(PARAMS_PKGS_DIR)

comp:
	$(VCS) +incdir+`pwd`/../tb \
		+incdir+`pwd`/../rtl \
		$(PARAMSFILE) $(RTLFILES) $(TBFILES) \
		../rtl/DMATopAXI_AXIL_AXI.v

sim: $(COVERAGE_DIR) $(LOG_DIR)
	$(SIMV) +UVM_TESTNAME=$(UVM_TESTNAME) \
	   -l $(LOG_DIR)/$(UVM_TESTNAME)_$(PARAMS_STRING).log \
	   +transactions=$(transactions) \
	   -sv_seed $(SEED)

run: sim
	@echo "Checking logs for UVM errors"
	$(CHECK)

wave:
	verdi -elab simv.daidir/kdb \
		-nologo \
		-ssf dump.fsdb &

distclean: clean
	-rm -rf *.fsdb
	-rm -rf novas*
	-rm -rf verdiLog
	-rm -rf coverage
	-rm -fr work $(LOG_DIR) $(COVERAGE_DIR) covhtmlreport coverage.ucdb dump.vcd  transcript  uvm_dpi  uvm.lib $(PARAMS_PKGS_DIR)

$(LOG_DIR):
	mkdir -p $(LOG_DIR)

$(COVERAGE_DIR):
	mkdir -p $(COVERAGE_DIR)
