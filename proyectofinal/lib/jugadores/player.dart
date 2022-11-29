class Player {
  final int id_jugador;
  final int id_equipo;
  final String nombre;
  final int numero;
  final int edad;
  final int puntos;
  final int asistencias;
  final int rebotes;
  final int juegos_jugados;

  Player(this.id_jugador, this.id_equipo, this.nombre, this.numero, this.edad,
      this.puntos, this.asistencias, this.rebotes, this.juegos_jugados);

  factory Player.fromMap(Map<String, dynamic> json) {
    return Player(
        json['id_jugador'],
        json['id_equipo'],
        json['nombre'],
        json['numero'],
        json['edad'],
        json['puntos'],
        json['asistencias'],
        json['rebotes'],
        json['juegos_jugados']);
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        json['id_jugador'],
        json['id_equipo'],
        json['nombre'],
        json['numero'],
        json['edad'],
        json['puntos'],
        json['asistencias'],
        json['rebotes'],
        json['juegos_jugados']);
  }
}
