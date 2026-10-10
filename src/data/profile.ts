const location = 'remote only';

export const profile = {
  // Identity
  name: 'Alex',
  get fullName() {
    return `${this.name} ${this.familyNames[0]}`;
  },
  familyNames: [
    'Márquez',
    'Pérez',
    'Muñíz',
    'Díaz',
    'Puras',
    'Thaureaux',
    'Fagúndo',
    'Rivera',
  ],
  handle: 'parcha',
  pronouns: 'they/m // elle/él',
  tagline:
    'GENERALIST COMPUTER SCIENTIST · SOFTWARE ENGINEER · SOFTWARE ARCHITECT · FORMAL SEMANTICIST · MATHS & COMPUTER SCIENCE RESEARCHER',
  // Availability
  jobTitle: 'Senior Software Engineer',
  location,
  availability: `open to senior software engineering roles — ${location}`,
  // Contact
  email: 'alex@etud.io',
  github: 'https://github.com/parcha',
  gitlab: 'https://gitlab.com/parcha',
  linkedin: 'https://www.linkedin.com/in/alexmarquezperez',
  resume: 'https://resume.etud.io',
};
