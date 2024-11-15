export default class Building {
  constructor(sqft) {
    if (typeof sqft !== 'number') throw new TypeError('sqft must be a number');
    this._sqft = sqft;

    // Vérifie si la classe qui étend Building a implémenté evacuationWarningMessage
    if (this.constructor !== Building
          && !this.evacuationWarningMessage) {
      throw new Error('Class extending Building must override evacuationWarningMessage');
    }
  }

  get sqft() {
    return this._sqft;
  }
}
