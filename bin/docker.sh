 if [ "$1" = "compose" ]; then
   shift  # Remove the "compose" argument
   if command -v docker-compose >/dev/null 2>&1; then
     command docker-compose "$@"
   else
     command docker compose "$@"
   fi
 else
   command docker "$@"
 fi
