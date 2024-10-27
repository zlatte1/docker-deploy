import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  base: "/docker-deploy/", // Replace <REPO_NAME> with your actual GitHub repository name
});
