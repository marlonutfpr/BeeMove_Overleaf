# BeeMove — artigo para o Multimedia Tools and Applications

Manuscrito do artigo sobre o BeeMove, a ferramenta de análise de caminhamento de
abelhas com customização do detector por active learning. Revista-alvo:
**Multimedia Tools and Applications** (Springer), submissão de artigo original.

O código e os experimentos ficam no repositório de pesquisa (`bee-tracker`) e no
app (`bee-move`); este repositório guarda só o texto.

## Estrutura

| Caminho | O que é |
|---|---|
| `main.tex` | O manuscrito, em um arquivo só (o template pede isso) |
| `references.bib` | Referências conferidas pelo DOI na Crossref |
| `figures/FigN.tex` | Fontes TikZ das figuras (diagramas) |
| `figures/FigN.pdf` | As figuras compiladas, **versionadas**: o Overleaf não compila `figures/*.tex` |
| `sn-jnl.cls`, `sn-basic.bst` | Template oficial da Springer Nature (versão 3.1, dez/2024) |
| `notes/` | Notas de trabalho: índice das referências, crítica do revisor simulado, rascunhos |
| `tools/Dockerfile` | TeX Live para compilar localmente |

## Regras do MTAP já aplicadas

- Template da Springer Nature com `sn-basic` e a opção `Numbered`: citações
  numéricas entre colchetes, como as instruções pedem.
- Resumo de 150 a 250 palavras; 4 a 6 palavras-chave.
- Revisão simples-cega: os nomes dos autores ficam no manuscrito.
- Seção "Statements and Declarations" antes das referências (financiamento,
  conflito de interesses, ética, dados, código, contribuições).
- Figuras com nome `FigN`, letras sem serifa, padrões em vez de cores para
  distinguir elementos (acessibilidade).
- O uso de modelos de linguagem além de revisão de texto precisa ser declarado no
  método: há um `\todo` para isso nas declarações.

## Marcadores no texto

- `\todo{...}` (vermelho): algo que os autores precisam preencher ou decidir.
- `\result{...}` (azul): número que depende do benchmark rodado no laboratório.

Antes de submeter, `make todos` deve mostrar zero.

## Compilar

No Overleaf: importe o repositório do GitHub e compile `main.tex` com pdfLaTeX.

Localmente, com Docker:

```bash
make image   # uma vez: TeX Live medium + pacotes do template
make         # figuras e main.pdf
```

Ao editar uma figura (`figures/FigN.tex`), rode `make figures` e versione o PDF
gerado, senão o Overleaf continua mostrando a versão anterior.
