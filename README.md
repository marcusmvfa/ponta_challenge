# Ponta Flutter Challenge

Projeto desenvolvido para o processo seletivo da empresa Ponta.

# Descrição

O aplicativo consiste de apenas duas telas, uma para a listagem de fazendas e outra para a listagem de animais das mesmas.

# Listagem de Fazendas

Nesta tela é possível ver a lista de fazendas já cadastradas tendo como opção excluir uma determinada fazenda através
dos 3 botões verticais localizadas a direita do widget.
Ao clicar no botão "Adicionar Fazenda", é aberto um dialog onde o usuário irá inserir o nome da fazenda e salvar a mesma.
Ao salvar a nova fazenda, a lista é automaticamente atualizada com a nova informação.
Ao selecionar uma fazenda o usuário é redirecionado para a tela de listagem de animais.

# Listagem de Animais

Nesta tela encontram-se todos os animais cadastrados referentes a fazenda selecionada, tendo uma visão da quantidade total
de animais que estão cadastrados.
Ao clicar em "Adicionar novo animal", é aberto um dialog onde o usuário irá inserir a tag do referido animal, após salvar
a listagem de animais e o contador de animais é atualizado automaticamente.
Caso o usuário queira deletar algum animal, é necessário somente clicar no ícone da lixeira para excluí-lo.
Caso o usuário queira modificar as tags destes animais ele pode livremente ir modificando cada campo do referido animal
e ao terminar de realizar as alterações clicar em "Salvar Alterações" localizado na parte de baixo da tela. Assim, 
irá persistir todas as informações alteradas neste processo.

## Recursos Utilizados

Para este projeto foram utilizadas as seguintes ferramentas:
- [GetX: para gerenciamento de estados e navegação entre views](https://pub.dev/packages/get)
- [GetIt: para utilização de injeção de dependências](https://pub.dev/packages/get_it)
- [Hive: para gerir os dados localmente na aplicação](https://pub.dev/packages/hive)


Caso tenha alguma dúvida sobre o projeto ou como executá-lo, entre em contato pelo e-mail: marcuspa3@gmail.com