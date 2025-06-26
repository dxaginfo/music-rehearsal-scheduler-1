const express = require('express');
const app = express();
app.get('/api/hello', (req, res) => {
  res.json({message: 'API running'});
});
app.listen(3001);
