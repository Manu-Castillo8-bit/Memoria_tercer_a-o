-- NEXUS · Configuración de Supabase (ejecutar una sola vez en SQL Editor)

-- 1) Tabla de módulos: cada módulo completo vive en la columna "data" (JSON)
create table if not exists public.modulos (
  id text primary key,
  orden int not null default 0,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.modulos enable row level security;

-- Cualquiera puede LEER (para que la página pública funcione)
drop policy if exists "modulos_lectura_publica" on public.modulos;
create policy "modulos_lectura_publica" on public.modulos
  for select using (true);

-- Solo usuarios con sesión iniciada pueden ESCRIBIR
drop policy if exists "modulos_escritura_admin" on public.modulos;
create policy "modulos_escritura_admin" on public.modulos
  for all to authenticated using (true) with check (true);

-- 2) Bucket público para imágenes
insert into storage.buckets (id, name, public)
values ('evidencias', 'evidencias', true)
on conflict (id) do nothing;

drop policy if exists "evidencias_lectura" on storage.objects;
create policy "evidencias_lectura" on storage.objects
  for select using (bucket_id = 'evidencias');

drop policy if exists "evidencias_subir" on storage.objects;
create policy "evidencias_subir" on storage.objects
  for insert to authenticated with check (bucket_id = 'evidencias');

drop policy if exists "evidencias_editar" on storage.objects;
create policy "evidencias_editar" on storage.objects
  for update to authenticated using (bucket_id = 'evidencias');

drop policy if exists "evidencias_borrar" on storage.objects;
create policy "evidencias_borrar" on storage.objects
  for delete to authenticated using (bucket_id = 'evidencias');

-- 3) IMPORTANTE: en Authentication → Providers → Email desactiva "Allow new users to sign up"
--    y crea tu usuario administrador a mano en Authentication → Users → Add user.
--    Así solo tú (y quien tú crees) puede editar.
