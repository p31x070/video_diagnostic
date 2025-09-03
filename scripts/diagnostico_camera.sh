#!/bin/bash
# Script de diagnóstico de câmeras USB no Ubuntu
# Salva resultado em diagnostico_camera.log

LOG="diagnostico_camera_$(date +%Y%m%d_%H%M%S).log"

echo "=== Diagnóstico de Câmeras USB no Ubuntu ===" | tee "$LOG"
echo "Data: $(date)" | tee -a "$LOG"
echo "Máquina: $(hostnamectl hostname)" | tee -a "$LOG"
echo "Kernel: $(uname -r)" | tee -a "$LOG"
echo "Distribuição:" | tee -a "$LOG"
lsb_release -a 2>/dev/null | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Dispositivos USB conectados (lsusb) ===" | tee -a "$LOG"
lsusb | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Dispositivos de vídeo (ls /dev/video*) ===" | tee -a "$LOG"
ls -lh /dev/video* 2>/dev/null | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Dispositivos detectados pelo v4l2-ctl ===" | tee -a "$LOG"
command -v v4l2-ctl >/dev/null && v4l2-ctl --list-devices 2>&1 | tee -a "$LOG" || echo "v4l2-ctl não instalado" | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Últimas mensagens do kernel sobre USB (dmesg | grep usb) ===" | tee -a "$LOG"
dmesg | grep -i usb | tail -n 50 | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Logs recentes do PipeWire (journalctl) ===" | tee -a "$LOG"
journalctl --user -u pipewire --no-pager -n 50 | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Grupos do usuário atual ===" | tee -a "$LOG"
groups | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Teste rápido: processos de vídeo em uso ===" | tee -a "$LOG"
lsof /dev/video* 2>/dev/null | tee -a "$LOG"
echo "" | tee -a "$LOG"

echo "=== Diagnóstico concluído. Arquivo salvo em $LOG ===" | tee -a "$LOG"

# Carregar variáveis de configuração
source ../config/config.env

if [ "$ENABLE_AUTO_FIX" = true ]; then
  echo "" | tee -a "$LOG"
  echo "=== Iniciando Correção Automática ===" | tee -a "$LOG"
  ./fix_camera.sh | tee -a "$LOG"
  echo "=== Correção Automática Concluída ===" | tee -a "$LOG"
fi
