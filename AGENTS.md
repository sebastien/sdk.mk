# SDK Agent Guidelines

## Build Commands
- `make` - Default build (runs BUILD_ALL)
- `make build` - Builds all outputs in BUILD_ALL
- `make prep` - Installs dependencies & prepares environment
- `make run` - Runs the project and dependencies
- `make dist` - Creates distributions
- `make clean` - Removes build, run, and dist directories
- `make help` - Shows available rules and phases
- `make help-vars` - Shows configuration variables

## Test Commands
- `make test` - Runs tests (implementation pending)
- Test framework not yet implemented - follow build phase pattern: `test(-*)`

## Code Style
### Makefile Conventions
- Global variables: `UPPER_CASE`
- Environment variables: `VARNAME?=DEFAULT`
- Functions: `snake_case` (callable via `$(call function_name,…)`)
- Parameters: Single uppercase letters `$(foreach V,A B C,$V)`
- Tasks: `kebab-case`, suffix with `--` for params (`deploy--account=123`) or `@` for env (`deploy@staging`)

### Coding Principles
- Be concise, write compact code
- Comments only to clarify intent
- Prefer functional over imperative
- Write short docstrings for all elements
- Favor standard library, minimize third-party dependencies
- Define interfaces for third-party libraries

### Project Structure
- `src/$LANG/*` - Sources by language
- `build/$COMPONENT/$REVISION/*` - Build artifacts
- `dist/$REVISION/*` - Distribution artifacts
- `run/bin` - CLI binaries
- `run/{share,man,lib}` - Supporting files

## Development Commands
- `make shell` - Opens environment shell
- `make live-<target>` - Auto-rebuild on file changes
- `make print-VARNAME` - Shows variable value
- `make def-VARNAME` - Shows variable definition

## Shell Commands
- `src/sh/install.sh` - Installs SDK dependencies
- `src/sh/std.prompt.sh` - Configures the shell prompt
- `src/sh/lib.sh` - Library for loading shell modules
- `src/sh/lib-colors.sh` - Color definitions for shell output

## Makefile Features
- **Core Configuration**: `src/mk/sdk.mk` - Core Makefile configuration
- **Standard Configuration**: `src/mk/sdk/std/config.mk` - Standard configuration variables
- **Standard Rules**: `src/mk/sdk/std/rules.mk` - Standard build rules and targets
- **Standard Library**: `src/mk/sdk/std/lib.mk` - Standard library functions
- **Color Definitions**: `src/mk/sdk/std/colors.mk` - Color definitions for Makefile output
- **Preparation Rules**: `src/mk/sdk/prep/rules.mk` - Preparation rules
- **Preparation Configuration**: `src/mk/sdk/prep/config.mk` - Preparation configuration
- **Python Rules**: `src/mk/sdk/py/rules.mk` - Python-specific rules
- **Python Configuration**: `src/mk/sdk/py/config.mk` - Python-specific configuration
- **JavaScript Rules**: `src/mk/sdk/js/rules.mk` - JavaScript-specific rules
- **JavaScript Configuration**: `src/mk/sdk/js/config.mk` - JavaScript-specific configuration
- **Web Rules**: `src/mk/sdk/www/rules.mk` - Web-specific rules
- **Web Configuration**: `src/mk/sdk/www/config.mk` - Web-specific configuration
- **Secrets Management Rules**: `src/mk/sdk/secrets/rules.mk` - Secrets management rules
- **Secrets Management Configuration**: `src/mk/sdk/secrets/config.mk` - Secrets management configuration
- **Mise Configuration**: `src/mk/sdk/mise/config.mk` - Mise configuration
- **Mise Rules**: `src/mk/sdk/mise/rules.mk` - Mise-specific rules
- **GitHub Rules**: `src/mk/sdk/github/rules.mk` - GitHub-specific rules
- **GitHub Configuration**: `src/mk/sdk/github/config.mk` - GitHub-specific configuration
- **Cloudflare Rules**: `src/mk/sdk/cloudflare/rules.mk` - Cloudflare-specific rules
- **Cloudflare Configuration**: `src/mk/sdk/cloudflare/config.mk` - Cloudflare-specific configuration
- **Application Deployment Rules**: `src/mk/sdk/appdeploy/rules.mk` - Application deployment rules
- **Application Deployment Configuration**: `src/mk/sdk/appdeploy/config.mk` - Application deployment configuration
