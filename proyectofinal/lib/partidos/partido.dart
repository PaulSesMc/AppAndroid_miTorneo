class Partido {
  final int? id_partido;
  final int? id_equipo_l;
  final int? id_partido_v;
  final String fecha_hora;
  final int? score_equipo_l;
  final int? score_equipo_v;
  final int? ganador;
  final int? estatus;
  final String local;
  final String logo_l;
  final String visitante;
  final String logo_v;

  Partido(
      this.id_partido,
      this.id_equipo_l,
      this.id_partido_v,
      this.fecha_hora,
      this.score_equipo_l,
      this.score_equipo_v,
      this.ganador,
      this.estatus,
      this.local,
      this.logo_l,
      this.visitante,
      this.logo_v);

  factory Partido.fromMap(Map<String, dynamic> json) {
    return Partido(
        json['id_partido'],
        json['id_equipo_l'],
        json['id_partido_v'],
        json['fecha_hora'],
        json['score_equipo_l'],
        json['score_equipo_v'],
        json['ganador'],
        json['estatus'],
        json['local'],
        json['logo_l'],
        json['visitante'],
        json['logo_v']);
  }
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
        json['id_partido'],
        json['id_equipo_l'],
        json['id_partido_v'],
        json['fecha_hora'],
        json['score_equipo_l'],
        json['score_equipo_v'],
        json['ganador'],
        json['estatus'],
        json['local'],
        json['logo_l'],
        json['visitante'],
        json['logo_v']);
  }
}
