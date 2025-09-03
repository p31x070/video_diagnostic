
## 📄 README.md


# USB Camera Diagnostics for Ubuntu

Este projeto fornece ferramentas em **Bash** para diagnosticar e solucionar problemas de câmeras USB no Ubuntu/Linux.  
O objetivo é ter uma base sólida de coleta de informações para detectar falhas comuns em **drivers**, **PipeWire**, **V4L2** e **permissões de acesso**.

## 📂 Estrutura do Repositório

```

.
├── logs        # Arquivos de saída com resultados dos diagnósticos
├── scripts     # Scripts de coleta e futuras automações de correção
└── README.md   # Este arquivo

````

## 🚀 Como usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/usb-camera-diagnostics.git
   cd usb-camera-diagnostics
````

2. Dê permissão de execução para os scripts:

   ```bash
   chmod +x scripts/*.sh
   ```

3. Execute o script de diagnóstico:

   ```bash
   ./scripts/diagnostico_camera.sh
   ```

4. O resultado será salvo em `logs/diagnostico_camera_YYYYMMDD_HHMMSS.log`.

---

## 📋 Plano de Ação

### Etapa 1 – Diagnóstico

* Verificar se o dispositivo USB é reconhecido (`lsusb`, `dmesg`).
* Listar dispositivos de vídeo (`/dev/video*`, `v4l2-ctl`).
* Coletar logs do PipeWire e Kernel.
* Validar grupos e permissões do usuário.

### Etapa 2 – Correção Inicial

* Reiniciar serviços relacionados (`pipewire`, `udev`).
* Recarregar módulos (`uvcvideo`).
* Garantir que o usuário esteja no grupo `video`.
* Automatizar a restauração na inicialização se necessário.

### Etapa 3 – Expansão do Projeto

* Criar um **script de correção automática**.
* Adicionar testes para diferentes distribuições (Debian, Fedora).
* Gerar relatório em **Markdown/HTML** para facilitar compartilhamento.
* Adicionar CI/CD para validar alterações no repositório.

---

## 🔧 Configuração

Crie um arquivo `config/config.env` para personalizações, como:

```bash
LOG_DIR="./logs"
ENABLE_AUTO_FIX=true
```

Esse arquivo permitirá ajustar o comportamento sem editar diretamente os scripts.

---

## 🧭 Próximos Passos

* [ ] Integrar com `gemini-cli` para automação do fluxo.
* [ ] Adicionar script de correção automática.
* [ ] Publicar como pacote simples instalável no GitHub.

---

````

---

## 📄 GEMINI_proto.md

Esse arquivo descreve o **estado inicial do agente** e as tarefas que ele deve guiar quando rodarmos `gemini init`.

```markdown
# GEMINI Proto – USB Camera Diagnostics Project

## 🎯 Objetivo
Fornecer um agente capaz de **coletar, analisar e sugerir correções** para problemas com câmeras USB no Ubuntu.  
O `gemini-cli` deve guiar o processo de diagnóstico e aplicar soluções automatizadas quando configurado.

---

## 🗂 Estrutura esperada
````

.
├── logs/
├── scripts/
├── config/
│   └── config.env   # Variáveis de configuração
└── README.md

````

---

## 🔑 Funções principais do agente

1. **Coleta de informações**
   - Executar `scripts/diagnostico_camera.sh`.
   - Salvar saída em `logs/`.

2. **Análise do diagnóstico**
   - Identificar se o problema é de hardware (não detectado no `lsusb`) ou software (PipeWire, drivers, permissões).
   - Gerar resumo em Markdown.

3. **Correção (opcional, configurável em `config.env`)**
   - Reiniciar serviços (`pipewire`, `udev`).
   - Recarregar módulos (`uvcvideo`).
   - Ajustar grupos do usuário (`video`).
   - Registrar ações no log.

---

## ⚙️ Configuração
O arquivo `config/config.env` controla o comportamento:
```bash
# Diretório de logs
LOG_DIR="./logs"

# Ativar correção automática
ENABLE_AUTO_FIX=false

# Número de linhas de log a coletar do journal
LOG_TAIL=50
````

---

## 🚀 Fluxo de Trabalho

1. **Init** (`gemini init`)

   * Configurar ambiente inicial
   * Criar `config/config.env`
   * Garantir permissões de execução em `scripts/`

2. **Diagnóstico**

   * Rodar script e coletar informações
   * Salvar em `logs/`

3. **Análise**

   * Gerar resumo amigável em Markdown
   * Exibir sugestões ao usuário

4. **Correção (se habilitada)**

   * Executar rotinas de fix automatizado
   * Confirmar se câmera foi reconhecida

5. **Relatório Final**

   * Criar `logs/report_TIMESTAMP.md`
   * Detalhar diagnóstico + correções aplicadas

---

## 📌 Próximas Expansões

* Suporte multi-distro (Fedora, Debian).
* Teste automatizado em CI/CD.
* Relatório visual em HTML.
* Geração de issues automáticas no GitHub ao encontrar erros críticos.

```

---

👉 Minha sugestão: no próximo passo criamos também o **`config/config.env`** inicial com variáveis padrão, assim você já terá o setup completo para `git push` no GitHub.  

Quer que eu já te entregue esse `config.env` inicial junto com um **primeiro script de correção automática** (`fix_camera.sh`)?
```
