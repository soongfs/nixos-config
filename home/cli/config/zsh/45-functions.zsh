venv() {
  if [[ -f .venv/bin/activate ]]; then
    source ".venv/bin/activate"
    [[ -n $VIRTUAL_ENV ]] && print "Activated: ${VIRTUAL_ENV:t}"
  else
    print -u2 "No virtualenv found (.venv)."
    return 1
  fi
}

venv-off() {
  if typeset -f deactivate >/dev/null; then
    deactivate
  else
    print -u2 "No active virtualenv."
    return 1
  fi
}

proxy() {
  local proxy_url="http://172.22.64.1:7897"

  case "${1:-status}" in
    on)
      export http_proxy="$proxy_url"
      export https_proxy="$proxy_url"
      export all_proxy="$proxy_url"
      export HTTP_PROXY="$proxy_url"
      export HTTPS_PROXY="$proxy_url"
      export ALL_PROXY="$proxy_url"
      print "Proxy ON: $proxy_url"
      ;;
    off)
      unset http_proxy https_proxy all_proxy
      unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
      print "Proxy OFF"
      ;;
    status)
      if [[ -n "${http_proxy:-}" || -n "${https_proxy:-}" || -n "${all_proxy:-}" ]]; then
        print "Proxy is ON"
        print "  http_proxy=$http_proxy"
        print "  https_proxy=$https_proxy"
        print "  all_proxy=$all_proxy"
      else
        print "Proxy is OFF"
      fi
      ;;
    *)
      print -u2 "Usage: proxy {on|off|status}"
      return 2
      ;;
  esac
}

iptest() {
  curl https://ipinfo.io
}

