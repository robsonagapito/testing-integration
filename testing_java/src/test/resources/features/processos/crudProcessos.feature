#language: pt
  @run
  Funcionalidade: Realizando um simples CRUD na classe de processo.

    Cenário de Fundo:
      Dado que o usuário está na página de processos

    Cenário: Simples POST com todos os campos preenchidos corretamente
      E o usuário informa no campo "vara" o valor "2"
      E o usuário informa no campo "numero_processo" o valor "12314"
      E o usuário informa no campo "natureza" o valor "Guarda"
      E o usuário informa no campo "partes" o valor "Alberto x Alberta"
      E o usuário informa no campo "urgente" o valor "S"
      E o usuário informa no campo "arbitramento" o valor "N"
      E o usuário informa no campo "assistente_social" o valor "Robson Agapito"
      E o usuário informa no campo "data_entrada" o valor "2020-02-12"
      E o usuário informa no campo "data_saida" o valor "2020-02-20"
      E o usuário informa no campo "data_agendamento" o valor "2020-02-13"
      E o usuário informa no campo "status" o valor "Aguardando entrevista"
      E o usuário informa no campo "observacao" o valor "Nada a declarar"
      Quando o usuário clicar em salvar
      Então o usuário deveria receber uma mensagem de "salvo com sucesso"
      E o usuário dever ver o campo "vara" com valor "2"

    Esquema do Cenário: Simples GET com todos os campos preenchidos corretamente
      E o usuário gostaria de visualizar o processo com id <id>
      Quando o usuário clicar em visualizar
      Então o usuário deveria receber uma mensagem de "<mensagem>"

      Exemplos:
      | id   | mensagem       |
      |7     | sucesso        |
      |321332| não encontrado |

    Cenário: Simples PUT com todos os campos preenchidos corretamente
      E o usuário gostaria de visualizar o processo com id 7
      E o usuário informa no campo "vara" o valor "8"
      E o usuário informa no campo "numero_processo" o valor "12314"
      E o usuário informa no campo "natureza" o valor "Guarda"
      E o usuário informa no campo "partes" o valor "Alberto x Alberta"
      E o usuário informa no campo "urgente" o valor "S"
      E o usuário informa no campo "arbitramento" o valor "N"
      E o usuário informa no campo "assistente_social" o valor "Robson Agapito"
      E o usuário informa no campo "data_entrada" o valor "2020-02-12"
      E o usuário informa no campo "data_saida" o valor "2020-02-20"
      E o usuário informa no campo "data_agendamento" o valor "2020-02-13"
      E o usuário informa no campo "status" o valor "Aguardando entrevista"
      E o usuário informa no campo "observacao" o valor "Nada a declarar"
      Quando o usuário clicar em atualizar
      Então o usuário deveria receber uma mensagem de "sucesso"
      E o usuário dever ver o campo "vara" com valor "8"

    Cenário: Simples DELETE com todos os campos preenchidos corretamente
      E o usuário informa no campo "vara" o valor "2"
      E o usuário informa no campo "numero_processo" o valor "12314"
      E o usuário informa no campo "natureza" o valor "Guarda"
      E o usuário informa no campo "partes" o valor "Alberto x Alberta"
      E o usuário informa no campo "urgente" o valor "S"
      E o usuário informa no campo "arbitramento" o valor "N"
      E o usuário informa no campo "assistente_social" o valor "Robson Agapito"
      E o usuário informa no campo "data_entrada" o valor "2020-02-12"
      E o usuário informa no campo "data_saida" o valor "2020-02-20"
      E o usuário informa no campo "data_agendamento" o valor "2020-02-13"
      E o usuário informa no campo "status" o valor "Aguardando entrevista"
      E o usuário informa no campo "observacao" o valor "Nada a declarar"
      E o usuário clicar em salvar
      Quando o usuário clicar em deletar
      E o usuário clicar em visualizar
      Então o usuário deveria receber uma mensagem de "não encontrado"