const fs = require('fs').promises;

const countStudents = async (path) => {
  try {
    const data = await fs.readFile(path, 'utf8');
    const lines = data.trim().split('\n');
    const students = lines.slice(1).filter((line) => line.length > 0);
    const fields = {};

    students.forEach((student) => {
      const [firstName, , , field] = student.split(',');
      if (!fields[field]) fields[field] = { count: 0, names: [] };
      fields[field].count += 1;
      fields[field].names.push(firstName);
    });

    console.log(`Number of students: ${students.length}`);
    for (const [field, data] of Object.entries(fields)) {
      console.log(`Number of students in ${field}: ${data.count}. List: ${data.names.join(', ')}`);
    }
  } catch (error) {
    throw new Error('Cannot load the database');
  }
};

module.exports = countStudents;
