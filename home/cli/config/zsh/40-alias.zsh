if command -v eza >/dev/null 2>&1; then
  alias l='command eza -F'
  alias la='command eza -a'
  alias ll='command eza -alF --group-directories-first --git'
  alias lt='command eza -T'
else
  alias l='command ls -CF'
  alias la='command ls -A'
  alias ll='command ls -alF'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat='command bat'
fi

