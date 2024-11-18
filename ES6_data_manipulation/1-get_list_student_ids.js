// 1-get_list_student_ids.js
export default function getListStudentIds(arrayOfStudents) {
  if (!Array.isArray(arrayOfStudents)) return [];
  return arrayOfStudents.map((student) => student.id);
}
