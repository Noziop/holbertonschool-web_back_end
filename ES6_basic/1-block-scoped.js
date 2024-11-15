export default function taskBlock(trueOrFalse) {
  let task = false;
  let task2 = true;

  if (trueOrFalse) {
    task = true; // On modifie les variables existantes
    task2 = false; // au lieu d'en créer de nouvelles
  }

  return [task, task2];
}
