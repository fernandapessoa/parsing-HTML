# HTML Parsing Script

## Descrição

Este script realiza o parsing de um arquivo HTML, buscando todos os links (href) presentes no arquivo e resolvendo os IPs dos domínios. O resultado é exibido em uma tabela numerada, com o domínio e o respectivo endereço IP.

## Requisitos

- Sistema operacional Linux/Unix.
- Ferramentas necessárias: `wget`, `host`, `grep`, `sed`, `awk`, `nl`, `sort`, `uniq`.

## Instalação

1. Clone ou baixe o script para seu diretório local.
2. Acesse o diretório onde o script foi salvo.

## Permissões

Antes de executar o script, você deve garantir que ele tenha permissão de execução. Para isso, rode o seguinte comando no terminal:

```bash
chmod +x parsinghtml.sh
```

## Modo de Uso

Após dar permissão de execução, você pode rodar o script da seguinte forma:

```bash
./parsinghtml.sh [URL]
```
