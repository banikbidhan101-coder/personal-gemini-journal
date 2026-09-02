GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
REGION=us-central1
gcloud config set project $GOOGLE_CLOUD_PROJECT
gcloud config set run/region $REGION
gcloud services enable --project $GOOGLE_CLOUD_PROJECT   run.googleapis.com   cloudbuild.googleapis.com   artifactregistry.googleapis.com   sheets.googleapis.com   aiplatform.googleapis.com
git clone https://github.com/GoogleCloudPlatform/cloud-run-microservices-demo.git
cd coffee-shop-assistant
GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
REGION=us-central1
gcloud config set project $GOOGLE_CLOUD_PROJECT
gcloud config set run/region $REGION
gcloud services enable --project $GOOGLE_CLOUD_PROJECT   run.googleapis.com   cloudbuild.googleapis.com   artifactregistry.googleapis.com   sheets.googleapis.com   aiplatform.googleapis.com
gcloud projects list
gcloud config set project $(gcloud projects list --format="value(projectId)" | head -n 1)
gcloud config set project $(gcloud asset search-all-resources --query="assetType:cloudresourcemanager.googleapis.com/Project" --format="value(name)" | head -n 1 | cut -d'/' -f5)
gcloud projects list --sort-by=projectId
gcloud projects create coffee-agent-$RANDOM --set-as-default
GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
REGION=us-central1
gcloud config set run/region $REGION
gcloud services enable --project $GOOGLE_CLOUD_PROJECT   run.googleapis.com   cloudbuild.googleapis.com   artifactregistry.googleapis.com   sheets.googleapis.com   aiplatform.googleapis.com
gcloud beta billing projects link $(gcloud config get-value project) --billing-account=$(gcloud beta billing accounts list --format="value(name)" | head -n 1)
GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
REGION=us-central1
gcloud config set run/region $REGION
gcloud services enable --project $GOOGLE_CLOUD_PROJECT   run.googleapis.com   cloudbuild.googleapis.com   artifactregistry.googleapis.com   sheets.googleapis.com   aiplatform.googleapis.com
git clone https://github.com/GoogleCloudPlatform/generative-ai.git
cd generative-ai/gemini/sample-apps/coffee-shop-assistant
cd generative-ai/gemini
cd sample-apps/coffee-shop-assistant && ls -la
cd sample-apps/gemini-coffee-shop-assistant && ls -la
ls -la sample-apps
cd swot-agent && pip install -r requirements.txt
cd sample-apps/swot-agent && pip install -r requirements.txt
gcloud config set project coffee-agent-23470
gcloud services enable aiplatform.googleapis.com run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com
gcloud billing accounts list
gcloud billing projects link coffee-agent-23470 --billing-account=01117F-1C3F12-3D41AX
gcloud config set project YOUR_QWIKLABS_PROJECT_ID
gcloud config set project genai-track1-app
gcloud services enable aiplatform.googleapis.com run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com
gcloud billing projects link genai-track1-app --billing-account=01117F-1C3F12-3D41AX
gcloud beta billing projects link genai-track1-app --billing-account=01117F-1C3F12-3D41AX
mkdir personal-gemini-journal && cd personal-gemini-journal
touch server.js
const express = require('express');
const app = express();
app.get('/', (req, res) => {
});
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
});
npm init -y
npm install express
npm install @google/genai
node server.js
cd personal-gemini-journal
node server.js
echo -n "AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ" | gcloud secrets create gemini-api-key --data-file=-
cat .env
cd personal-gemini-journalcd personal-gemini-journal && echo "GEMINI_API_KEY=AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ" > .env
cd personal-gemini-journal && echo "GEMINI_API_KEY=AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ" > .env
npm install dotenv
node server.js
npm pkg set type="module"
cd personal-gemini-journal
node server.js
curl -X POST http://localhost:8080/journal -H "Content-Type: application/json" -d '{"entry": "Today was a tough day, but I managed to finish setting up my project."}'
cat << 'EOF' > server.js
import 'dotenv/config';
import express from 'express';
import { GoogleGenAI } from '@google/genai';

const app = express();
const port = process.env.PORT || 8080;

app.use(express.json());

const ai = new GoogleGenAI();

app.get('/', (req, res) => {
  res.send('Personal Gemini Journal Server is running!');
});

app.post('/journal', async (req, res) => {
  try {
    const { entry } = req.body;
    
    if (!entry) {
      return res.status(400).json({ error: 'Journal entry is required' });
    }

    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: `You are a supportive, insightful personal journal assistant. Read this journal entry and provide a brief, thoughtful reflection, encouraging words, or constructive perspective: "${entry}"`,
    });

    res.json({ reflection: response.text });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Something went wrong talking to Gemini' });
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
EOF

node server.js
cd personal-gemini-journal
npm install dotenv
cd personal-gemini-journal
npm install dotenv
npm install @google/genai
npm pkg set type="module"
cat << 'EOF' > server.js
import 'dotenv/config';
import express from 'express';
import { GoogleGenAI } from '@google/genai';

const app = express();
const port = process.env.PORT || 8080;

app.use(express.json());

const ai = new GoogleGenAI();

app.get('/', (req, res) => {
  res.send('Personal Gemini Journal Server is running!');
});

app.post('/journal', async (req, res) => {
  try {
    const { entry } = req.body;
    
    if (!entry) {
      return res.status(400).json({ error: 'Journal entry is required' });
    }

    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: `You are a supportive, insightful personal journal assistant. Read this journal entry and provide a brief, thoughtful reflection, encouraging words, or constructive perspective: "${entry}"`,
    });

    res.json({ reflection: response.text });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Something went wrong talking to Gemini' });
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
EOF

curl -X POST http://localhost:8080/journal -H "Content-Type: application/json" -d '{"entry": "Today I finally set up my own Node.js server to talk to Gemini, and it feels amazing to see it running!"}'
export GEMINI_API_KEY="AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ"
cd ~/personal-gemini-journal
echo 'GEMINI_API_KEY=AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ' > .env
node server.js
curl -X POST http://localhost:8080/journal -H "Content-Type: application/json" -d '{"entry": "Today I finally set up my own Node.js server to talk to Gemini, and it feels amazing to see it running!"}'
echo "GEMINI_API_KEY=AQ.Ab8RN6KPJyWIUB_ccOfQvPb-WkF4ArTy0U0qdbcGozZVOyEFFQ" > .env
curl -X POST http://localhost:8080/journal -H "Content-Type: application/json" -d '{"entry": "Today I finally set up my own Node.js server to talk to Gemini, and it feels amazing to see it running!"}'
sed -i "s/gemini-2.5-flash/gemini-3.6-flash/g" server.js
curl -X POST http://localhost:8080/journal -H "Content-Type: application/json" -d '{"entry": "Today I finally set up my own Node.js server to talk to Gemini, and it feels amazing to see it running!"}'
ls
git init
