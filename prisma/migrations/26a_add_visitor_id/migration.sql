-- Identity stitching (custom, based on PR #3825). Idempotent: may already exist
-- on databases where it was added manually.

-- AlterTable
ALTER TABLE "session" ADD COLUMN IF NOT EXISTS "visitor_id" VARCHAR(50);

-- CreateIndex
CREATE INDEX IF NOT EXISTS "session_website_id_visitor_id_idx" ON "session"("website_id", "visitor_id");
