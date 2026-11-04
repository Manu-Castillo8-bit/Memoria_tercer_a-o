/* NEXUS · Configuración de Supabase
   1) Crea un proyecto en https://supabase.com
   2) Ve a Project Settings → API y copia "Project URL" y la clave "anon public".
   3) Pégalas aquí. La clave anon es pública por diseño: la seguridad la dan las políticas (RLS) de supabase-setup.sql.
   NUNCA pegues aquí la clave "service_role". */
window.NEXUS_CONFIG = {
  SUPABASE_URL: "https://olqcdemlmtkazxgawuyi.supabase.co",
  SUPABASE_ANON_KEY: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9scWNkZW1sbXRrYXp4Z2F3dXlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTM3OTkzNjgsImV4cCI6MjEwOTM3NTM2OH0.a_hwroVuiPTMjdXR6AyRiQtQOVDkF70_CtYly55QDL0"
};