-- Rode uma vez no Supabase: SQL Editor › New query › colar › Run.

create table if not exists public.documentos (
  id uuid primary key default gen_random_uuid(),
  aba text not null check (aba in ('dev', 'sub')),
  aplicacao text not null,
  nome_arquivo text not null,
  caminho text not null unique,
  tamanho bigint,
  tipo text,
  enviado_por text,
  criado_em timestamptz not null default now()
);
create index if not exists documentos_aplicacao_idx on public.documentos (aba, aplicacao);

alter table public.documentos enable row level security;
create policy "documentos: leitura autenticada" on public.documentos for select to authenticated using (true);
create policy "documentos: envio autenticado" on public.documentos for insert to authenticated with check (true);
create policy "documentos: exclusão autenticada" on public.documentos for delete to authenticated using (true);

insert into storage.buckets (id, name, public)
values ('documentos', 'documentos', false)
on conflict (id) do nothing;

create policy "arquivos: leitura autenticada" on storage.objects for select to authenticated using (bucket_id = 'documentos');
create policy "arquivos: envio autenticado" on storage.objects for insert to authenticated with check (bucket_id = 'documentos');
create policy "arquivos: exclusão autenticada" on storage.objects for delete to authenticated using (bucket_id = 'documentos');
