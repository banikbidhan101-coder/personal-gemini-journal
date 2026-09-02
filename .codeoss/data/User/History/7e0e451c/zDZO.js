import 'dotenv/config';
import express from 'express';
import { GoogleGenAI } from '@google/genai';

const app = express();
const port = process.env.PORT || 8080;

app.use(express.json());

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

app.get('/', (req, res) => {
  res.send('Personal Gemini Journal Server is running!');
  });

  app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
    });
    