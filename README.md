# KeyToLearn
<!-- Primeiro nome que botei era StudyKeyFlow, que a abreviação SKF também dava pra entender ShortcutKeysFlo. Era um nome ok, mas quis trocar, troquei quando estava finalizando esse readme 02:42 18/09/23. https://pandao.github.io/editor.md/en.html site ajuda a escrever markdown, com preview.-->

<!--Comment in .MD https://gist.github.com/jonikarppinen/47dc8c1d7ab7e911f4c9 -->
<!-- .MD cheatsheet https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet -->

Este plugin em lua para o [Xournal++](https://github.com/xournalpp/xournalpp "Xournal++") adiciona diversas de combinações de teclas que são rapidamente acessíveis com a mão esquerda, principalmente sem a necessidade de teclas modificadoras, com apenas o Shift que não é muito usado como atalho no programa normal.

## Instalação
A instalação consiste em colocar os arquivos disponibilizados em suas respectivas pastas.

Com base no recurso [Xournal++ → Guide → File locations](https://xournalpp.github.io/guide/file-locations/ "Xournal++ → Guide → File locations"), será preciso acessar as pastas de [Shared resources](https://xournalpp.github.io/guide/file-locations/#shared-resources-folder "Shared resources") e de [Config](https://xournalpp.github.io/guide/file-locations/#config-folder "Config").

### Plugin
Na pasta `.\share\xournalpp\plugins` adicione a pasta do plugin **SKeysFlow**.

### Page template
Na pasta `.\share\xournalpp\ui` adicione o arquivo **pagetemplate.ini**. Com o arquivo `.ini` na pasta correta, para usar os templates de **pagina Light ou Dark**, presentes na pasta `LoadPageTemplate`, é preciso abrir o aplicativo, clicar no menu **_Journal → Configure Page Template → Load from file_**, selecionar o template e reabrir o Xournal++. Por fim, para ter trocar entre a cor preta ou branca como principal (Atalho = Tecla 1), é preciso ir no menu **_View → Toolbars_**, e selecionar **KeyToLearn Toolbar Light Mode** ou **Dark Mode**.   

### Toolbar, paleta de cores e settings
Na pasta `.\AppData\Local\xournalpp` adicione o arquivo **palette.gpl**, **settings.xml** e **toolbar.ini**.

#### Settings
Nas settings que eu disponibilizei, além das minha configurações padrões de caneta, tema e outros, também tem mudança do `snapGridSize` para conseguir usar o template da pagina com a grade certa. O padrão dos formatos de pagina `format = graph` é `<property name="snapGridSize" value="14.17"/>` , e esse valor deve ser mudado para `<property name="snapGridSize" value="10"/>`

### Fontes
As principais fontes usadas são a [Strawberry Muffins](https://www.dafont.com/pt/strawberry-muffins.font?back=theme "Strawberry Muffins") e Times New Roman, normamente usadas em 6 ou 5 pt para ficar do mesmo tamanho da minha escrita.  Na pasta de **fontes** tem algumas outras fontes alternativas que parecem escritas a mão com as imagens delas em uso, acredito que todas contem caracteres com acentos e "ç".

## Recursos
Para fazer o plugin e todas as outras mudanças de template e configurações foi usado o repositorio do Xournal++ para pesquisar tudo que eu posso alterar e entender como alterar. A seguir tem os links que mais me ajudaram.

### Para o plugin
- [Guia de plugins.](https://xournalpp.github.io/guide/plugins/plugins/")
	Guia de plugins da pagina principal do Xournal, que também contem outras informações importantes. 

- [Issue: Configurable shortcuts/keybindings
](https://github.com/xournalpp/xournalpp/issues/919)
	Thread com 100 comentarios falando bastante sobre construção de plugins para atalhos

- [Segmento de código da função `Control::actionPerformed`](https://github.com/xournalpp/xournalpp/blob/c07654780933929a92e9187ad0dc44a80fb04cc7/src/core/control/Control.cpp#L360-L950)
	Onde é configurado as todas funcões que da pra usar com `app.uiAction`.

- [Lua api para os plugins no xournal](https://github.com/xournalpp/xournalpp/blob/7b6d84956d6bbe8615b2123c64dd0cac80afb81a/src/core/plugin/luapi_application.h)
	 API do Xournalpp para os plugin. Contem exemplos de uso, como na linha 968.

- [Segmento de código na lua api, linha 1723](https://github.com/xournalpp/xournalpp/blob/7b6d84956d6bbe8615b2123c64dd0cac80afb81a/src/core/plugin/luapi_application.h#L1723-L1750)
	Contem todas as funções que podem ser usadas.

- [Plugins instalados com o programa](https://github.com/xournalpp/xournalpp/tree/master/plugins)
	Podem ser usados de referência.

- [CHANGELOG](https://github.com/xournalpp/xournalpp/blob/8caa0bc7cace73c524ae02c1f08475b0c92800c6/CHANGELOG.md?plain=1#L241)
	Para saber as mudanças e para verificar se há novas funções que podem ser incluídas ou removidas, caso já tenham sido adicionadas ao programa principal.

- [Plugin vi-xournalpp do Raw Bacon](https://github.com/raw-bacon/vi-xournalpp)
	Posso usar de referencia caso queira fazer alguma mais complexo.

- [Pen thicknesses customization](https://github.com/xournalpp/xournalpp/discussions/4920)
	Caso eu queria mexer com pen thicknesses customizada é preciso recompilar o programa.

- [Função `app.msgbox` foi descontinuada, substituida por `app.openDialog`.](https://github.com/xournalpp/xournalpp/discussions/5100)

### Para o template de pagina
- [Issue: options to adjust format of paper background](https://github.com/xournalpp/xournalpp/issues/2137#issuecomment-799956788)
	Todas configurações (ou quase todas) do pagetemplate comentadas pelo Rolandlo.

### Para a toolbar
- As barras de ferramentas podem ser configuradas escrevendo no arquivo **toolbar.ini** ou graficamente, dentro do aplicativo. O próprio arquivo **toolbar.ini** possui todas as funções comentadas, mas é recomendável utilizá-lo caso ocorra algum bug, já que a configuração direta no aplicativo é mais fácil. Lembre-se de que a janela de personalização da barra de ferramentas utiliza a paleta de cores **palette.gpl**, logo, é melhor que esse arquivo esteja na pasta antes de configurar a barra de ferramentas.

### Outros sites usados
- [Cor HEX pra RGB.](https://www.rapidtables.com/convert/color/hex-to-rgb.html "Cor HEX pra RGB")
- [Color Picker do google.](https://g.co/kgs/ufCdTF "Color Picker do google")
- [Converter pt to inches e vice e versa.](https://www.convertunits.com/from/pt/to/inch "Converter pt to inches")
- [Keyboard Shortcut Map Maker.](https://archie-adams.github.io/keyboard-shortcut-map-maker/)

## To-do
- Ver se tem como fazer outro plugin que inverte a cor de todas as imagens e os traços de preto e off white. Para ter mais flexibilidade quando fizer documentos em Dark Mode e passar pra Light se quiser imprimir. Talvez usando `getStrokes` funcione, mas não sei exatamente o que essa função faz.
- Fazer funções para adicionar setas e outras desenho de marcação usando `addStrokes`. [Uso de `addStrokes` em plotagem de funções matematicas](https://github.com/xournalpp/xournalpp/pull/3811). Uma alternativa seria adicionado imagens com fundo transparente.
- ...