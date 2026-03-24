-- Run this once in your Supabase SQL editor (Dashboard → SQL Editor)
-- to create the table that stores the shared mind map state.

CREATE TABLE IF NOT EXISTS mind_map_state (
  id               TEXT        PRIMARY KEY,
  nodes            JSONB       NOT NULL DEFAULT '[]',
  edges            JSONB       NOT NULL DEFAULT '[]',
  user_connections JSONB       NOT NULL DEFAULT '[]',
  teammates        JSONB       NOT NULL DEFAULT '{}',
  user_types       JSONB       NOT NULL DEFAULT '{}',
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Allow all reads and writes (suitable for a trusted internal team tool).
-- If you want to restrict access, tighten these policies.
ALTER TABLE mind_map_state ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_read"  ON mind_map_state FOR SELECT USING (true);
CREATE POLICY "allow_write" ON mind_map_state FOR INSERT WITH CHECK (true);
CREATE POLICY "allow_update" ON mind_map_state FOR UPDATE USING (true);
