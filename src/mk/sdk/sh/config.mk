SHFMT?=$(CMD) shfmt
SHELLCHECK?=$(CMD) shellcheck

SHFMT_OPTS?=-w -s -i 2
SHELLCHECK_OPTS?=

SH_SOURCES?=$(call file_find,$(PATH_SRC)/sh,*.sh)
SH_AUDIT_SOURCES?=$(strip $(SH_SOURCES) $(TESTS_SH))

CHECK_ALL+=$(if $(SH_AUDIT_SOURCES),sh-check)
AUDIT_ALL+=$(if $(SH_AUDIT_SOURCES),sh-audit)
FMT_ALL+=$(if $(SH_AUDIT_SOURCES),sh-fmt)

# EOF
