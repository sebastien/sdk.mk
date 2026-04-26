.PHONY: sh-check
sh-check: sh-audit ## Lints shell sources

.PHONY: sh-audit
sh-audit: $(SH_AUDIT_SOURCES) $(call use_cli,shellcheck) ## Audits shell sources with shellcheck
	@$(call rule_pre_cmd)
	@if [ -n "$(strip $(SH_AUDIT_SOURCES))" ]; then \
		echo "$(call fmt_action,Auditing: $(words $(SH_AUDIT_SOURCES)) SH file(s))"; \
		$(call shell_try,$(SHELLCHECK) $(SHELLCHECK_OPTS) $(SH_AUDIT_SOURCES),Unable to audit shell sources); \
	fi
	$(call rule_post_cmd,$^)

.PHONY: sh-fmt
sh-fmt: $(SH_AUDIT_SOURCES) $(call use_cli,shfmt) ## Fixes/formats shell sources
	@$(call rule_pre_cmd)
	@if [ -n "$(strip $(SH_AUDIT_SOURCES))" ]; then \
		echo "$(call fmt_action,Fixing: $(words $(SH_AUDIT_SOURCES)) SH file(s))"; \
		$(call shell_try,$(SHFMT) $(SHFMT_OPTS) $(SH_AUDIT_SOURCES),Unable to format shell sources); \
	fi
	$(call rule_post_cmd,$^)

# EOF
