class Team {
  final int id;
  final String nombre;
  final int puntos_favor;
  final int puntos_contra;
  final int juegos_jugados;
  final int juegos_ganados;
  final int juegos_perdidos;
  final String logo;

  Team(
      this.id,
      this.nombre,
      this.puntos_favor,
      this.puntos_contra,
      this.juegos_jugados,
      this.juegos_ganados,
      this.juegos_perdidos,
      this.logo);
  factory Team.fromMap(Map<String, dynamic> json) {
    return Team(
        json['id_equipo'],
        json['nombre'],
        json['puntos_favor'],
        json['puntos_contra'],
        json['juegos_jugados'],
        json['juegos_ganados'],
        json['juegos_perdidos'],
        json['logo']);
  }
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        json['id_equipo'],
        json['nombre'],
        json['puntos_favor'],
        json['puntos_contra'],
        json['juegos_jugados'],
        json['juegos_ganados'],
        json['juegos_perdidos'],
        json['logo']);
  }
}
