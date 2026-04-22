# Makefile Convention

Follow these templates:

## Configuration (config.mk)

```makefile
# File: {name}/config.mk
# {description}

# -----------------------------------------------------------------------------
#
# CONFIGURATION
#
# -----------------------------------------------------------------------------

# --
# {Variable description}
MYMODULE_VARNAME ?= default_value

# -----------------------------------------------------------------------------
#
# ENVIRONMENT
#
# -----------------------------------------------------------------------------

# NOTE: Variables to be exported in the shell environment
ENV_PATH := $(MYMODULE_BIN):$(PATH)

# -----------------------------------------------------------------------------
#
# REGISTRATION
#
# -----------------------------------------------------------------------------

# NOTE: Append to global SDK collections
PREP_ALL += mymodule-prep
BUILD_ALL += mymodule-build
```

## Rules (rules.mk)

```makefile
# File: {name}/rules.mk
# {description}

# -----------------------------------------------------------------------------
#
# RULES
#
# -----------------------------------------------------------------------------

.PHONY: mymodule-prep
mymodule-prep: ## {Rule description for help}
	@$(call rule_pre_cmd)
	$(call shell_try,command to run)
	@$(call rule_post_cmd)

# NOTE: Use file-based rules whenever possible for incremental builds
$(PATH_BUILD)/mymodule/%.out: $(PATH_SRC)/mymodule/%.in
	@$(call rule_pre_cmd)
	$(CMD) processor -o $@ $<
	@$(call rule_post_cmd)
```

## Library (lib.mk)

```makefile
# File: {name}/lib.mk
# {description}

# Function: mymodule_func
# {Description}
# $1 -- {Parameter 1}
mymodule_func = $(filter-out $1,$(MYMODULE_LIST))

# Multi-line macro
define mymodule_macro
	@echo "Doing something with $1"
	$(call some_other_func,$2)
endef
```

Naming:
- Global variables: `UPPER_CASE`
- Prefix everything with the module name (e.g., `MYMODULE_`, `mymodule-`, `mymodule_`)
- Functions/Macros: `snake_case`
- Rule targets: `kebab-case`
- Internal/Task-specific variables (in `foreach` etc.): Single uppercase letters `$(foreach V,$(LIST),$V)`

Structure:
- `config.mk`: Variables, environment, and registration to global phases
- `rules.mk`: Phony targets and file-based build rules
- `lib.mk`: Reusable functions and macros

Documentation:
- Use `##` for rules that should appear in `make help`
- Short docstrings for variables and functions
- Group related items with separator blocks

Behaviour:
- Always use `@$(call rule_pre_cmd)` at the start of a rule's recipe
- Always use `@$(call rule_post_cmd)` at the end of a rule's recipe
- Use `$(call shell_try,...)` or `$(call shell_create_if,...)` for shell operations within recipes
- Prefer file-based dependencies over `.PHONY` targets for performance
- Respect `NO_COLOR` and use provided color variables for output
