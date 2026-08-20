alter table public.v3_progress
  add column if not exists sort_order integer;
