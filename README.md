# Evolução das aplicações

Board de acompanhamento das aplicações de Logística, com documentação por funcionalidade guardada no Supabase.

## Arquivos
- `index.html` — o board.
- `config.js` — URL e chave pública do Supabase, e links da planilha.
- `supabase-setup.sql` — cria a tabela e o bucket de documentos.

## 1. Supabase (uma vez)
1. SQL Editor › New query › cole `supabase-setup.sql` › Run.
2. Authentication › Sign In / Providers › Email: deixe ativo e **desative "Allow new users to sign up"**.
3. Authentication › Users › Add user › Create new user: cadastre e-mail e senha de cada pessoa (marque "Auto Confirm User").
4. Project Settings › API: copie **Project URL** e **anon public key** para o `config.js`.

## 2. GitHub Pages
1. No repositório: Add file › Upload files › envie os três arquivos para a raiz › Commit.
2. Settings › Pages › Build and deployment › Source: *Deploy from a branch* › Branch: `main` / `(root)` › Save.
3. Em 1–2 minutos o endereço aparece no topo da página de Pages.

## Atualizar
- Nova versão do board: substitua só o `index.html`.
- Trocar chaves ou planilha: edite o `config.js` direto no GitHub.

## Observações
- Documentos ficam vinculados ao **nome da aplicação** e à aba. Se renomear uma aplicação, os documentos anteriores deixam de aparecer nela.
- Limite padrão de 50 MB por arquivo (plano gratuito do Supabase).
- A chave *anon* é pública por natureza; a proteção vem do login e das regras criadas no SQL.
