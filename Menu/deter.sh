# Obtener el PID del proceso
pid=$(ps aux | grep 'ssh -o StrictHostKeyChecking=no -R yoursubdomain.serveo.net:80:127.0.0.1:8000 serveo.net' | grep -v grep | awk '{print $2}')

# Verificar si se encontró un PID
if [ -n "$pid" ]; then
  # Detener el proceso utilizando el PID
  kill $pid
  echo "Proceso detenido."
else
  echo "No se encontró el proceso."
fi
