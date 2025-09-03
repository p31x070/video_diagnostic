#!/bin/bash
# Script para correção de problemas com câmeras USB

# Carregar variáveis de configuração
source ../config/config.env

echo "=== Iniciando Correção Automática ==="

# Reiniciar PipeWire
echo "Reiniciando o serviço PipeWire..."
systemctl --user restart pipewire

# Reiniciar udev
echo "Reiniciando o serviço udev..."
sudo systemctl restart udev

# Recarregar módulo uvcvideo
echo "Recarregando o módulo uvcvideo..."
sudo modprobe -r uvcvideo
sudo modprobe uvcvideo

# Adicionar usuário ao grupo video
if ! groups | grep -q video; then
  echo "Adicionando o usuário ao grupo 'video'..."
  sudo usermod -aG video $USER
  echo "Por favor, reinicie a sessão para que as alterações de grupo tenham efeito."
fi

echo "=== Correção Automática Concluída ==="
