# scp_remoto
Script utilizado para transferir arquivo para uma lista de servidores remotos

Como utilizar:

1 - Edite o arquivo server_list.txt e adicione a lista de servidores que deseja transferir o arquivo.

2 - Execute o script scp-remoto.sh: ./scp-remoto.sh

3 - Inicialmente será solicitado informar o nome do arquivo que será transferido (Informe o nome do arquivo com o caminho completo dos diretórios até o arquivo)
Ex.:
Inform the file name (with full path) of file to transfer:
/tmp/arquivo.txt

4 - Será solicitado o nome do ID remoto
Ex.:
Inform the remote user id:
root

5 - Por padrão, o arquivo será transferido para o /tmp do servidor remoto

6 - Após ser informado o nome do arquivo e o nome do ID a transferência do arquivo será iniciada.

6.1 - Caso a transferencia seja concluida com sucesso, temos a seguinte mensagem:
Ex.:
Server: servidor1.abc.xzy
SUCCESS.: File /tmp/arquivo.txt transferred successfully to servidor1.abc.xzy

6.2 - Caso ocorra algum erro durante a transferência, temos a seguinte mensagem:
Ex.:
Server: servidor1.abc.xzy
ERROR.: File /tmp/arquivo.txt wasn't transferred. Please contact the System Admin.
