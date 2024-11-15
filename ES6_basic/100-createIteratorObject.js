export default function createIteratorObject(report) {
  return {
    * [Symbol.iterator]() {
      // On récupère tous les départements
      const departments = Object.values(report.allEmployees);

      // Pour chaque département
      for (const department of departments) {
        // Pour chaque employé du département
        for (const employee of department) {
          yield employee;
        }
      }
    },
  };
}
