/*
  # Create users table for form submissions

  1. New Tables
    - `form_submissions`
      - `id` (uuid, primary key)
      - `name` (text, required)
      - `email` (text, required) 
      - `created_at` (timestamp with timezone)

  2. Security
    - Enable RLS on form_submissions table
    - Add policy for inserting new submissions
    - Add policy for reading submissions
*/

CREATE TABLE IF NOT EXISTS form_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE form_submissions ENABLE ROW LEVEL SECURITY;

-- Allow anyone to insert new submissions
CREATE POLICY "Anyone can insert submissions"
  ON form_submissions
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Allow anyone to read submissions
CREATE POLICY "Anyone can read submissions"
  ON form_submissions
  FOR SELECT
  TO anon
  USING (true);
