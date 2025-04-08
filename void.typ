#set text(lang: "pt", region: "br")
// #set footnote(numbering: "1")
#show link: set text(fill: rgb(0, 0, 190, 255))

#align(center)[
  #image("void_logo.png", width: 30%)
]
= Void Linux
== O sistema operacional Void

O #link("https://voidlinux.org/")[*Void Linux*] é um sistema operacional,
descrito como um sistema operacional de uso geral, baseado no _kernel_
monolítico #footnote[Tipo de _kernel_ (núcleo) onde todos os serviços principais
do sistema rodam no mesmo espaço de memória (espaço de _kernel_).] do Linux. É
uma distribuição #footnote[Muitas vezes chamadas de 'distros', as distribuições
Linux são sistemas operacionais que inclui o _kernel_ Linux para fornecer suas
funcionalidades principais de núcleo.]<k1> de Linux independente, desenvolvida
completamente por voluntários, sem se basear nem derivar de outra distribuição
existente. @void

A distribuição #footnote(<k1>) Void possui diversas características e
funcionalidades que a distinguem das demais distribuições Linux, como o uso do
gerenciador de pacotes *XBPS* (_X Binary Package System_), que foi projetado e
implementado do zero e conta com seus próprios repositórios, apoio e suporte
para as implementações da biblioteca padrão do C #footnote[Frequentemente
abreviado como libc, aqui se referem as implementações da biblioteca padrão da
linguagem de programação C, seguindo a especificação do padrão ISO C, sobre a
API de chamadas de sistema do Linux.] #link("https://musl.libc.org/")[*musl*]
(ou *musl libc*) e #link("https://www.gnu.org/software/libc/")[*glibc*] (ou *GNU
libc*), o uso do #link("https://smarden.org/runit/")[*runit*] #footnote[O runit
é um sistema de inicialização e gerenciamento de serviços para sistemas
Unix-like, que inicia, supervisiona e finaliza processos. @runit] no papel de
sistema de inicialização e supervisor de serviços, um sistema de atualizações
contínuas com foco em estabilidade ("*stable rolling-release*"") e compilação de
pacotes através do construtor de pacotes XBPS, o *xbps-src*. #footnote[O
xbps-src também foi escrito do zero, e é capaz de ser usado para compilar
software em ambientes isolados sem exigir root, com suporte a
_cross-compilation_ e múltiplas bibliotecas C.] @void @void-docs

Em Abril de 2025, o Void Linux mantém um
#link("https://github.com/void-linux/void-packages")[repositório oficial no
GitHub] com milhares de pacotes, incluindo pacotes _"nonfree"_ e _multilib_, com
2.695 mil estrelas e 1.343 colaboradores. O
#link("https://github.com/void-linux/xbps")[repositório do XBPS] por sua vez
conta com 875 estrelas e 59 colaboradores. A comunidade do Void Linux é ativa e
está presente em vários lugares da internet, como o subreddit oficial
r/voidlinux, que conta com 16.156 membros inscritos e o canal de IRC
`#voidlinux` na rede #link("https://libera.chat/")[Libera.Chat]. @void
@void-packages @void-xbps


== História e histórico de desenvolvimento

== Gerenciador de serviços e sistema de inicialização runit

== O sistema de pacotes XBPS

== glibc vs. musl

== Rolling release?

== xbps-src



#pagebreak()
#bibliography("bib.yml", style: "the-institution-of-engineering-and-technology")
// #bibliography("bib.yml", style: "associacao-brasileira-de-normas-tecnicas")

// = Trabalho de Sistemas Operacionais

// == Objetivo

// Estudar o sistema operacional em relação aos tópicos da ementa:
// 1. O histórico, o conceito e os tipos de sistemas operacionais.
// 2. A estrutura de sistemas operacionais.
// 3. Gerenciamento de memória.
// 4. Memória virtual.
// 5. Conceito de processo.
// 6. Gerência de processador: escalonamento de processos, monoprocessamento e multiprocessamento.
// 7. Concorrência e sincronização de processos.
// 8. Alocação de recursos e deadlocks.
// 9. Gerenciamento de arquivos.
// 10. Gerenciamento de dispositivos de entrada/saída.

// #set heading(numbering: "1.1)")

// = Void Linux

// == Histórico, Conceito e Tipo

// #pagebreak()
// @void @void-docs @prolinuxde @void-distrowatch @salute @distrowatch-weekly
