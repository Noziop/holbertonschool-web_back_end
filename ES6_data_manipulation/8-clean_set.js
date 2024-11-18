// 8-clean_set.js
export default function cleanSet(set, startString) {
  if (!startString || typeof startString !== 'string') return '';

  const filtered = [...set].filter((value) => value && value.startsWith(startString));

  return filtered
    .map((value) => value.slice(startString.length))
    .join('-');
}
