const http = require('http');
const { readFile } = require('fs').promises;

const countStudents = async (path) => {
  try {
    const data = await readFile(path, 'utf8');
    const lines = data.trim().split('\n');
    const students = lines.slice(1).filter((line) => line.length > 0);
    const fields = {};
    let output = '';

    students.forEach((student) => {
      const [firstName, , , field] = student.split(',');
      if (!fields[field]) fields[field] = { count: 0, names: [] };
      fields[field].count += 1;
      fields[field].names.push(firstName);
    });

    output += `Number of students: ${students.length}\n`;
    const entries = Object.entries(fields);
    entries.forEach(([field, data], index) => {
      output += `Number of students in ${field}: ${data.count}. List: ${data.names.join(', ')}`;
      if (index < entries.length - 1) output += '\n';
    });
    return output;
  } catch (error) {
    throw new Error('Cannot load the database');
  }
};

const app = http.createServer(async (req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });

  if (req.url === '/') {
    res.end('Hello Holberton School!');
  } else if (req.url === '/students') {
    try {
      const data = await countStudents(process.argv[2]);
      res.end(`This is the list of our students\n${data}`);
    } catch (error) {
      res.end('This is the list of our students\nCannot load the database');
    }
  }
});

app.listen(1245);

module.exports = app;
