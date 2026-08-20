-- v3_candidates: 候補者マスタ
create table if not exists public.v3_candidates (
  id uuid primary key default gen_random_uuid(),
  candidate_code text not null unique,
  name text not null,
  election_name text,
  updated_at timestamptz not null default now()
);

-- v3_progress: 広報物ごとの進捗
create table if not exists public.v3_progress (
  id uuid primary key default gen_random_uuid(),
  candidate_id uuid not null references public.v3_candidates(id) on delete cascade,
  period text not null,
  item_name text not null,
  required boolean not null default true,
  status text not null,
  updated_at timestamptz not null default now(),
  unique (candidate_id, period, item_name)
);

create index if not exists v3_progress_candidate_id_idx on public.v3_progress(candidate_id);
