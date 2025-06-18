#set page(columns: 1)
#set text(lang: "pt", region: "br")
#show link: set text(fill: rgb(0, 0, 190, 255))
#set quote(block: true)
#align(center)[
  #image("void_logo.png", width: 30%)
]

= Void Linux
== O sistema operacional Void

O #link("https://voidlinux.org/")[*Void Linux*] é um sistema operacional, descrito como um sistema operacional de uso geral, baseado no _kernel_ monolítico #footnote[Tipo de _kernel_ (núcleo) onde todos os serviços principais do sistema rodam no mesmo espaço de memória (espaço de _kernel_).] do Linux. É uma distribuição #footnote[Muitas vezes chamadas de 'distros', as distribuições Linux são sistemas operacionais que inclui o _kernel_ Linux para fornecer suas funcionalidades principais de núcleo.]<k1> de Linux independente, desenvolvida completamente por voluntários, sem se basear nem derivar de outra distribuição existente. @void

A distribuição #footnote(<k1>) Void possui diversas características e funcionalidades que a distinguem das demais distribuições Linux, como o uso do gerenciador de pacotes *XBPS* (_X Binary Package System_), que foi projetado e implementado do zero e conta com seus próprios repositórios, apoio e suporte para as implementações da biblioteca padrão do C #footnote[Frequentemente abreviado como libc, aqui se referem as implementações da biblioteca padrão da linguagem de programação C, seguindo a especificação do padrão ISO C, sobre a API de chamadas de sistema do Linux.] #link("https://musl.libc.org/")[*musl*] (ou *musl libc*) e #link("https://www.gnu.org/software/libc/")[*glibc*] (ou *GNU libc*), o uso do #link("https://smarden.org/runit/")[*runit*] #footnote[O runit é um sistema de inicialização e gerenciamento de serviços para sistemas Unix-like, que inicia, supervisiona e finaliza processos. @runit] no papel de sistema de inicialização e supervisor de serviços, um sistema de atualizações contínuas com foco em estabilidade ("*stable rolling-release*"") e compilação de pacotes através do construtor de pacotes XBPS, o *xbps-src*. #footnote[O xbps-src também foi escrito do zero, e é capaz de ser usado para compilar software em ambientes isolados sem exigir root, com suporte a _cross-compilation_ e múltiplas bibliotecas C.] @void @void-docs

Em Abril de 2025, o Void Linux mantém um #link("https://github.com/void-linux/void-packages")[repositório oficial no GitHub] com milhares de pacotes, incluindo pacotes _"nonfree"_ e _multilib_, com 2.695 mil estrelas e 1.343 colaboradores. O #link("https://github.com/void-linux/xbps")[repositório do XBPS] por sua vez conta com 875 estrelas e 59 colaboradores. A comunidade do Void Linux é ativa e está presente em vários lugares da internet, como o subreddit oficial r/voidlinux, que conta com 16.156 membros inscritos e o canal de IRC `#voidlinux` na rede #link("https://libera.chat/")[Libera.Chat]. @void @void-packages @git-xbps


== História e histórico de desenvolvimento

Void Linux foi criado em 2008 por Juan Romero Pardines#footnote[Conhecido como 'xtraeme'.], um ex-desenvolvedor do #link("https://www.netbsd.org/")[NetBSD], e surgiu inicialmente como um ambiente de testes para o gerenciador de pacotes XBPS, desenvolvido do zero para a distribuição. @linux-magazine

A distro oferece um sistema enxuto e modular, privilegiando ferramentas próprias (como o XBPS) e dando aos usuários maior controle sobre as configurações. Como distro de lançamento contínuo, o Void recebe atualizações constantes sem necessidade de reinstalação periódica, garantindo que os binários acompanhem sempre as versões mais recentes das aplicações. @void-docs @linux-magazine

Ao longo dos anos, o desenvolvimento do Void Linux passou por marcos importantes. Em 2014, por exemplo, a equipe optou por abandonar o *systemd*#footnote[Systemd é um sistema de init usado em várias distribuições Linux, responsável por inicializar o sistema, gerenciar serviços em segundo plano e controlar o estado geral do sistema, com foco em paralelismo e dependências entre processos.] em favor do *runit* como sistema de inicialização principal @void-docs, reforçando o objetivo de manter o sistema leve e fácil de auditar.

Naquela mesma época, o Void tornou-se a primeira distribuição Linux a usar o #link("https://www.libressl.org/")[*LibreSSL*] como biblioteca de criptografia padrão, substituindo o #link("https://www.openssl.org/")[*OpenSSL*]. @void-distrowatch No entanto, em 2021 a equipe anunciou oficialmente o retorno ao OpenSSL (efetivado em 5 de março de 2021) devido à complexidade de manter patches necessários para o LibreSSL. @void-openssl Esses ajustes refletiram a filosofia prática do projeto: adotar tecnologias enxutas, mas reverter mudanças que compliquem o suporte a softwares amplamente usados. A cada lançamento, o Void também incorpora melhorias de compatibilidade (como suporte completo a arquiteturas *ARM*#footnote[ARM é uma arquitetura de processador de 32 bits, comum em dispositivos móveis e embarcados.] e *ARM64*#footnote[ARM64 (ou AArch64) é a versão de 64 bits da arquitetura ARM, usada em dispositivos mais modernos, oferecendo melhor desempenho e suporte a mais memória.]) e mantém builds nativos através do sistema *xbps-src*, inspirado nas coleções de ports do BSD.

Atualmente, o Void Linux segue como um projeto de comunidade com desenvolvedores voluntários. O projeto sobrevive graças ao esforço conjunto de líderes de infraestrutura, manutenção de pacotes e documentação, todos atuando em tempo livre e decidindo coletivamente os rumos do desenvolvimento. @void-docs @linux-magazine

Em 2018, o projeto enfrentou uma crise organizacional quando o mantenedor original desapareceu, forçando a equipe a *recriar a organização no GitHub* e realocar domínios para manter o controle do repositório. @void-moving @void-issues Esse episódio reforçou a estrutura colaborativa: decisões importantes agora são tomadas por consenso entre os principais contribuidores. Apesar dos desafios organizacionais, o Void Linux tem recebido elogios por sua agilidade e design minimalista -- por exemplo, chegou a aparecer entre as distribuições *mais bem cotadas no DistroWatch*, mantendo bom nível de estabilidade para uso diário. @void-distrowatch

Mesmo sendo o fruto do trabalho de centenas de colaboradores voluntários, o próprio projeto Void dá crédito a um certo número de patrocinadores, tanto indivíduos como organizaçõesm, que tornam possível a compilação de pacotes e imagens de sistema, que providenciam hospedagem e disponibilização além de terem que monitorar e manter essa infraestrutura. @void-sponsors

== Gerenciador de serviços e sistema de inicialização runit

Diferentemente da maioria das distribuições Linux modernas, o Void Linux utiliza o runit como sistema de inicialização (_init_) e para a supervisão de serviços. @void-docs O runit é uma suíte de inicialização Unix minimalista, criada por *Gerrit Pape*, que organiza o boot em três estágios: _inicialização única do sistema_, _execução contínua de serviços_ e _desligamento_. Na prática, ao entrar no _Stage 2_ o runit executa o programa `runsvdir`, que escaneia diretórios de serviços e os inicia simultaneamente, resultando em um boot rápido e determinístico. Esse design segmentado contribui para a confiabilidade e agilidade do Void: o código executado como processo 1 (`PID 1`) é *muito pequeno*, o que facilita auditoria e reduz pontos únicos de falha. Os _“runlevels”_ são gerenciados pelas ferramentas internas do runit (`runsvdir` e `runsvchdir`), e o sistema resolve automaticamente dependências simples entre serviços durante a inicialização. @runit

Cada serviço no Void sob runit *é representado por um diretório dedicado* dentro de `/etc/sv/` (ou `/var/service/`). Esse diretório deve conter obrigatoriamente um script executável chamado `run`, que inicia o serviço em primeiro plano. Opcionalmente, podem existir outros arquivos nesse diretório: um `check` para testar se o serviço está ativo, um `finish` para procedimentos de parada, um arquivo `conf` com variáveis de ambiente e um subdiretório `log` para logs dedicados. Ao habilitar um serviço (por exemplo, criando um link simbólico em `/var/service/`), o runit automaticamente cria uma pasta `supervise` na primeira execução, começando a monitorar o processo. Com esse esquema, cada reinicialização de serviço ocorre em um ambiente consistente e isolado, e o runit mantém um _pipeline_ de logs ativo enquanto o serviço estiver em execução. @void-docs

Caso seja necessário desligar ou reinicializar o sistema, o runit interrompe todos os serviços supervisionados e executa o _Stage 3_ (`/etc/runit/3`), que finaliza tarefas do sistema e realiza o _halt_ ou _reboot_. @runit

== Comparação entre glibc e musl

As bibliotecas C são componentes centrais de qualquer sistema Linux. A *GNU C Library* é a implementação mais difundida, usada por padrão na maioria das distribuições populares (*Debian*, *Ubuntu*, *Fedora* etc.). @chainguard-glibc-musl Criada em 1988 sob a licença LGPL#sym.copyleft, a glibc fornece extensões específicas do GNU e optimizações que melhoram o desempenho em tempo de execução. @chainguard-glibc-musl Em contrapartida, o musl é uma alternativa lançada em 2011 com *licença MIT* (mais permissiva), concebida para ser simples, eficiente em recursos e estritamente compatível com padrões POSIX. @chainguard-glibc-musl @void-docs

Em vez de incorporar várias extensões de plataforma, o musl mantém uma base de código enxuta e estruturada para oferecer correção e segurança, tornando o sistema geralmente mais fácil de auditar e resulta em binários menores. @chainguard-glibc-musl

Na prática, escolher entre glibc e musl traz diferenças em *compatibilidade e performance*. A glibc possui um conjunto rico de funcionalidades. Por exemplo, suporta _lazy binding_ de bibliotecas (carregamento sob demanda), robustos recursos de _threading_ e extensões de plataforma (como otimizações para arquiteturas específicas). Com isso, muitos softwares comerciais e drivers proprietários (como o *CUDA da NVIDIA*) só oferecem suporte oficial em sistemas glibc. @chainguard-glibc-musl @void-docs

Em contrapartida, compilação com musl tende a produzir executáveis menores e conclui builds mais rapidamente, embora em alguns cenários de uso intensivo de recursos o desempenho em tempo de execução possa ser ligeiramente inferior. Além disso, devido ao tamanho do glibc, ele consome mais memória e tem tempos de compilação mais longos do que o musl, mas se beneficia de ferramentas adicionais (_sanitizers_, etc.) não presentes no musl. @chainguard-glibc-musl

O Void Linux destaca-se por oferecer *suporte oficial a ambas as bibliotecas C*: é possível instalar o sistema base utilizando glibc ou musl, conforme a preferência do usuário. Na prática, todos os pacotes compatíveis estão disponíveis nas versões glibc e musl, permitindo alternar quando necessário. @void-docs

Uma instalação baseada em musl tende a resultar em um sistema final de _footprint_ menor (devido aos binários compactos) e inicialização potencialmente mais rápida, mantendo funcionalidades equivalentes às de uma instalação glibc. @chainguard-glibc-musl @void-docs No entanto, vale lembrar que o *musl segue estritamente os padrões POSIX e não inclui extensões próprias do GNU*, por isso, certos softwares podem exigir ajustes para compilar ou funcionar corretamente em musl. @void-docs

Adicionalmente, alguns programas proprietários não suportam musl (como os drivers oficiais da NVIDIA) @void-docs, o que pode influenciar a escolha da libc em sistemas que dependem desse tipo de software.

== O sistema de pacotes XBPS

O *XBPS* (_X Binary Package System_) é o *gerenciador de pacotes nativo do Void Linux*, criado inteiramente do zero pela equipe do Void. @void De licença #link("https://opensource.org/license/bsd-2-clause")[BSD simplificada (2 cláusulas)], o XBPS foi desenvolvido internamente e não é um fork de outro sistema existente. @void Ele é *extremamente rápido* e permite instalar, atualizar e remover software de forma ágil. @void-xbps

Os pacotes binários do Void são pré-compilados e assinados; alternativamente, o usuário pode optar por compilar um pacote a partir do código-fonte, usando a #link("https://github.com/void-linux/void-packages")[coleção de pacotes-fonte XBPS]. Segundo o site oficial,

#quote(
  attribution: <git-xbps>,
)[o sistema de pacotes do Void permite instalar, atualizar e remover software rapidamente; o software é fornecido em pacotes binários ou pode ser construído diretamente de fontes.]

Durante a instalação ou remoção de pacotes, o XBPS realiza *checagens de integridade*, identificando bibliotecas compartilhadas incompatíveis e verificando dependências para evitar quebras acidentais no sistema. @git-xbps

Os usuários interagem com o XBPS por meio de várias ferramentas de linha de comando. Entre os principais comandos estão:

#table(
  columns: (auto, auto),
  align: horizon,
  stroke: none,
  // stroke: (x, y) => (
  //   left: if x > 0 { 0pt } else { 1pt + black },
  //   top: if y > 0 { 0pt } else { 1pt + black },
  //   right: { 1pt + black },
  //   bottom: { 1pt + black },
  // ),
  fill: (x, y) => if y == 0 { luma(190) } else if calc.odd(y) { luma(235) },
  table.header([Comando], [Descrição]),
  `xbps-query`,
  [pesquisa e exibe informações sobre pacotes instalados localmente ou disponíveis nos repositórios configurados.],

  `xbps-install`, [instala ou atualiza pacotes binários e sincroniza os índices dos repositórios.],
  `xbps-remove`, [remove pacotes instalados do sistema (incluindo pacotes órfãos e arquivos em cache).],
  `xbps-reconfigure`,
  [reexecuta scripts de configuração de pacotes já instalados,
    útil para reconfigurar software após alterações em arquivos de configuração.],

  `xbps-alternatives`,
  [gerencia o sistema de alternativas (semelhante ao update-alternatives do Debian), permitindo que múltiplos pacotes forneçam implementações diferentes de um mesmo recurso comum.],

  `xbps-pkgdb`, [verifica e corrige problemas no banco de dados de pacotes local.],
  `xbps-rindex`,
  [cria ou atualiza repositórios locais de pacotes binários a partir de diretórios já populados, útil para criar espelhos offline.],
)

Além desses comandos, o usuário pode personalizar repositórios oficiais editando arquivos `.conf` em `/etc/xbps.d/` ou `/usr/share/xbps.d/`. O XBPS lida nativamente com múltiplas arquiteturas (*x86_64*, *ARM*, etc.) e suporta tanto o glibc quanto o musl como bibliotecas C.

O código-fonte do XBPS está disponível no #link("https://github.com/void-linux/xbps")[repositório oficial do GitHub], onde pode-se acompanhar seu desenvolvimento e contribuições da comunidade.

#pagebreak()

== Rolling release?

O Void Linux adota o modelo _rolling release_#footnote("Termo em inglês que indica que o sistema recebe atualizações constantes sem lançamentos de versão numérica periódica.") (ou lançamento contínuo). Isso significa que não existem versões pontuais pré-definidas do sistema#footnote[Como, por exemplo, a distro Ubuntu que é lançada em versões pontuais como Ubuntu 24.04.2 LTS (Noble Numbat), Ubuntu 22.04.5 LTS (Jammy Jellyfish), Ubuntu 20.04.6 LTS (Focal Fossa), etc.]; em vez disso, o usuário mantém o Void sempre atualizado com as últimas versões dos pacotes disponibilizados nos repositórios. @void

Segundo a documentação oficial, o Void é

#quote(attribution: <void>)[uma distribuição independente, de lançamento contínuo (_rolling release_), desenvolvida do zero com foco na estabilidade em vez do _bleeding edge_#footnote[Do inglês, lit. "borda sangrenta" ou fig. "vanguarda", o termo se refere a uma categoria de tecnologia de ponta que, por serem muito novas, apresentam riscos e baixa confiabilidade.].] Em outras palavras, apesar de receber atualizações frequentes, o Void prioriza a confiabilidade: as mudanças são testadas e distribuídas de forma a minimizar impactos, evitando pacotes de código-fonte instáveis.

No site oficial do Void, essa filosofia aparece sob o lema “_Stable rolling release_”. Ou seja, o Void se concentra em ser estável em vez de sempre ter o software mais recente. A recomendação é “instale uma vez, atualize rotineiramente e com segurança” . Graças ao seu sistema de build contínuo, sempre que um desenvolvedor comita alterações no repositório “void-packages”, novas versões binárias dos pacotes são imediatamente construídas e enviadas para os espelhos oficiais. Isso permite que o usuário receba atualizações atuais e seguras quase em tempo real, sem precisar reinstalar o sistema, mantendo-o moderno sem comprometer a estabilidade.

O modelo rolling release do Void garante um fluxo contínuo de atualizações de segurança e de recursos, diferentemente de distribuições baseadas em lançamentos pontuais. Para o usuário final, isso significa manter o sistema atualizado simplesmente executando `xbps-install -Su` periodicamente, sem necessidade de “migração de versão” no estilo de grandes lançamentos a cada ano.

== xbps-src

O xbps-src é o sistema de compilação (_build system_) de pacotes-fonte do Void Linux. Integrado ao repositório void-packages (#link("void-linux/void-packages", "https://github.com/void-linux/void-packages")), ele permite *construir pacotes diretamente das fontes* usando templates específicos.

Provavelmente inspirado em sistemas como o #link("https://docs.freebsd.org/en/books/handbook/ports/#ports-using")[ports de BSD], o xbps-src foi escrito do zero e é uma das principais forças do Void. De acordo com o _Handbook_,
#quote(
  attribution: <void-docs>,
)[você pode usar o xbps-src no repositório void-packages para construir pacotes (incluindo os restritos) a partir de templates.]

Em outras palavras, o Void oferece um único repositório de templates (`srcpkgs/`) contendo os metadados necessários (origem, patches, dependências) para compilação de cada pacote; o xbps-src orquestra o processo de compilação com base nesses templates. @void-packages

Todo o processo de _build_ do xbps-src é feito em contêineres isolados: ele utiliza chroots baseados nos namespaces do Linux para montar um ambiente limpo para cada compilação, garantindo que nenhum binário do sistema host seja usado inadvertidamente. @xbps-src-usage

Por exemplo, ele cria um `rootfs` temporário baseado no glibc (ou no musl, conforme desejado) e executa a compilação lá. Dessa forma, não é necessário privilégio de root para compilar pacotes; o usuário comum consegue gerar o pacote binário completo em segurança. @void-packages

Além disso, o xbps-src suporta compilação cruzada: é possível compilar pacotes para arquiteturas diferentes da atual. Ao final do processo, o resultado é um pacote `.xbps` que pode ser instalado normalmente pelo `xbps-install` ou disponibilizado em um repositório local.

== Gerenciamento de memória e dispositivos

TO-DO.

// #pagebreak()
#bibliography("bib.yml", style: "the-institution-of-engineering-and-technology")
// #bibliography("bib.yml", style: "associacao-brasileira-de-normas-tecnicas")

// = Trabalho de Sistemas Operacionais

// == Objetivo

// Estudar o sistema operacional em relação aos tópicos da ementa:
// 1. O histórico, o conceito e os tipos de sistemas operacionais. x
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
