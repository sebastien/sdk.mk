# File: Logging
# A shell logging library

LIB_COLORS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/lib-colors.sh"
# shellcheck source=/dev/null
source "$LIB_COLORS_PATH"

# -----------------------------------------------------------------------------
#
# LOGGING
#
# -----------------------------------------------------------------------------

# Function: action ARG…
# Logs an action
function log_action {
	echo " → $@${RESET}" >&2
}

function log_raw {
	echo "$@${RESET}" >&2
}

# Function: message ARG…
# Logs a message
function log_message {
	echo "${GRAY} … $*${RESET}" >&2
}

function log_result {
	echo "${GREEN} ✔ $*${RESET}" >&2
}

function log_tip {
	echo "${CYAN} ✱ $*${RESET}" >&2
}

function log_error {
	echo "${RED}ERR ${BOLD}$*${RESET}" >&2
}

function log_warning {
	echo "${ORANGE}WRN ${BOLD}$*${RESET}" >&2
}

function fmt_location {
	local out=""
	local name
	# Get the last index of the array
	local n=$((${#FUNCNAME[@]} - 1))
	# Iterate over the array in reverse order
	for ((i = n; i >= 1; i--)); do
		name="${FUNCNAME[i]}"
		if [ -z "$out" ]; then
			out="$name"
		else
			out="$name ← $out"
		fi
	done
	echo -n "$out"
}

# EOF
