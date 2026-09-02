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
