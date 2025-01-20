const fs = require('fs');

const countStudents = (path) => {
try {
  const data = fs.readFileSync(path, 'utf8').trim().split('\n');
  const students = data.slice(1).filter((line) => line.length > 0);
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
