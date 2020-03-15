CREATE TABLE tbl_albumes_musicales (
    codigo_album_musical       INTEGER NOT NULL,
    codigo_grupos_o_artistas   INTEGER NOT NULL,
    nombre_album_musical       VARCHAR(300) NOT NULL,
    numero_canciones           INT,
    duracion_album             INT,
    fecha_creacion             DATE
);

ALTER TABLE tbl_albumes_musicales ADD CONSTRAINT tbl_albumes_musicales_pk PRIMARY KEY ( codigo_album_musical );

CREATE TABLE tbl_albumes_x_playlist (
    codigo_album_musical   INTEGER NOT NULL,
    codigo_playlist        INTEGER NOT NULL,
    fecha_anadio           DATE
);

ALTER TABLE tbl_albumes_x_playlist ADD CONSTRAINT tbl_albumes_x_playlist_pk PRIMARY KEY ( codigo_album_musical,
                                                                                          codigo_playlist );

CREATE TABLE tbl_anadir_biblioteca (
    codigo_anadir_biblioteca   INTEGER NOT NULL,
    codigo_usuario             INTEGER NOT NULL,
    codigo_playlist            INTEGER,
    codigo_grupos_o_artistas   INTEGER,
    codigo_album_musical       INTEGER,
    codigo_podcast             INTEGER,
    codigo_cancion_favorita    INTEGER
);

ALTER TABLE tbl_anadir_biblioteca ADD CONSTRAINT tbl_biblioteca_pk PRIMARY KEY ( codigo_anadir_biblioteca );

ALTER TABLE tbl_anadir_biblioteca ADD CONSTRAINT restriccion1 UNIQUE ( codigo_usuario,
                                                                       codigo_playlist );

ALTER TABLE tbl_anadir_biblioteca ADD CONSTRAINT restriccion2 UNIQUE ( codigo_usuario,
                                                                       codigo_grupos_o_artistas );

ALTER TABLE tbl_anadir_biblioteca ADD CONSTRAINT restriccion3 UNIQUE ( codigo_usuario,
                                                                       codigo_album_musical );

ALTER TABLE tbl_anadir_biblioteca ADD CONSTRAINT restriccion4 UNIQUE ( codigo_usuario,
                                                                       codigo_podcast );

CREATE TABLE tbl_canciones (
    codigo_cancion             INTEGER NOT NULL,
    codigo_grupos_o_artistas   INTEGER NOT NULL,
    codigo_album_musical       INTEGER NOT NULL,
    nombre_cancion             VARCHAR(300) NOT NULL,
    duracion_cancion           INT,
    peso_cancion               INT
);

ALTER TABLE tbl_canciones ADD CONSTRAINT tbl_canciones_pk PRIMARY KEY ( codigo_cancion );

CREATE TABLE tbl_canciones_favoritas (
    codigo_cancion_favorita       INTEGER NOT NULL,
    codigo_usuario_dio_favorito   INTEGER NOT NULL,
    codigo_cancion                INTEGER,
    codigo_lugar_anadio           INTEGER NOT NULL,
    fecha_anadio                  DATE
);

ALTER TABLE tbl_canciones_favoritas ADD CONSTRAINT tbl_me_gusta_pk PRIMARY KEY ( codigo_cancion_favorita );

ALTER TABLE tbl_canciones_favoritas ADD CONSTRAINT restriccion1v1 UNIQUE ( codigo_usuario_dio_favorito,
                                                                           codigo_cancion );

CREATE TABLE tbl_canciones_x_playlist (
    codigo_cancion    INTEGER NOT NULL,
    codigo_playlist   INTEGER NOT NULL,
    fecha_anadio      DATE
);

ALTER TABLE tbl_canciones_x_playlist ADD CONSTRAINT tbl_canciones_x_playlist_pk PRIMARY KEY ( codigo_cancion,
                                                                                              codigo_playlist );

CREATE TABLE tbl_categorias (
    codigo_categoria        INTEGER NOT NULL,
    nombre_categoria        VARCHAR(100) NOT NULL,
    descripcion_categoria   VARCHAR(500)
);

ALTER TABLE tbl_categorias ADD CONSTRAINT tbl_categorias_pk PRIMARY KEY ( codigo_categoria );

CREATE TABLE tbl_cola_reproduciendo (
    codigo_cola_reproduciendo   INTEGER NOT NULL,
    codigo_usuario              INTEGER NOT NULL,
    codigo_cancion              INTEGER NOT NULL,
    codigo_lugar                INTEGER NOT NULL
);

ALTER TABLE tbl_cola_reproduciendo ADD CONSTRAINT tbl_donde_se_escucha_pk PRIMARY KEY ( codigo_cola_reproduciendo );

CREATE TABLE tbl_conciertos (
    codigo_concierto            INTEGER NOT NULL,
    codigo_grupos_o_artistas    INTEGER NOT NULL,
    codigo_lugar                INTEGER NOT NULL,
    fecha_concierto             DATE,
    numero_tickes_disponibles   INT
);

ALTER TABLE tbl_conciertos ADD CONSTRAINT tbl_conciertos_pk PRIMARY KEY ( codigo_concierto );

CREATE TABLE tbl_datos_pago (
    codigo_datos_pago     INTEGER NOT NULL,
    codigo_tipo_tarjeta   INTEGER NOT NULL,
    codigo_metodo_pago    INTEGER NOT NULL,
    numero_tarjeta        INT,
    mes                   INT,
    anio                  INT,
    codigo_seguridad      INT
);

ALTER TABLE tbl_datos_pago ADD CONSTRAINT tbl_datos_pago_pk PRIMARY KEY ( codigo_datos_pago );

CREATE TABLE tbl_empresas_publicidad (
    codigo_empresa_publicidad   INTEGER NOT NULL,
    codigo_tipo_empresa         INTEGER NOT NULL,
    codigo_lugar_recide         INTEGER NOT NULL,
    nombre_empresa              VARCHAR(100) NOT NULL,
    correo_electronico          VARCHAR(100),
    telefono                    INT,
    descripcion_empresa         VARCHAR(500),
    pagina_web                  VARCHAR(100)
);

ALTER TABLE tbl_empresas_publicidad ADD CONSTRAINT tbl_empresas_publicidad_pk PRIMARY KEY ( codigo_empresa_publicidad );

CREATE TABLE tbl_episodios_podcast (
    codigo_episodio_podcast   INTEGER NOT NULL,
    codigo_podcast            INTEGER NOT NULL,
    titulo_episodio           VARCHAR(300) NOT NULL,
    descripcion_episodio      VARCHAR(500) NOT NULL,
    fecha_transmitio          DATE,
    duracion                  INT
);

ALTER TABLE tbl_episodios_podcast ADD CONSTRAINT tbl_episodios_podcast_pk PRIMARY KEY ( codigo_episodio_podcast );

CREATE TABLE tbl_estado_playlist (
    codigo_estado   INTEGER NOT NULL,
    nombre_estado   VARCHAR(100)
);

ALTER TABLE tbl_estado_playlist ADD CONSTRAINT tbl_estado_palylist_pk PRIMARY KEY ( codigo_estado );

CREATE TABLE tbl_genero (
    codigo_genero   INTEGER NOT NULL,
    nombre_genero   VARCHAR(300) NOT NULL
);

ALTER TABLE tbl_genero ADD CONSTRAINT tbl_genero_pk PRIMARY KEY ( codigo_genero );

CREATE TABLE tbl_genero_x_cancion (
    codigo_genero_musical   INTEGER NOT NULL,
    codigo_cancion          INTEGER NOT NULL
);

ALTER TABLE tbl_genero_x_cancion ADD CONSTRAINT tbl_genero_x_cancion_pk PRIMARY KEY ( codigo_genero_musical,
                                                                                      codigo_cancion );

CREATE TABLE tbl_generos_musicales (
    codigo_genero_musical        INTEGER NOT NULL,
    nombre_genero_musical        VARCHAR(100) NOT NULL,
    descripcion_genero           VARCHAR(300),
    fecha_que_se_anadio_genero   DATE
);

ALTER TABLE tbl_generos_musicales ADD CONSTRAINT tbl_generos_musicales_pk PRIMARY KEY ( codigo_genero_musical );

CREATE TABLE tbl_grupos_o_artistas (
    codigo_grupos_o_artistas   INTEGER NOT NULL,
    codigo_lugar_formo_nace    INTEGER NOT NULL,
    codigo_lugar_reside        INTEGER NOT NULL,
    nombre_grupo_o_artista     VARCHAR(300) NOT NULL,
    biografia                  VARCHAR(500),
    fecha_inicio               DATE,
    imagen                     VARCHAR(300)
);

ALTER TABLE tbl_grupos_o_artistas ADD CONSTRAINT tbl_grupos_musicales_pk PRIMARY KEY ( codigo_grupos_o_artistas );

CREATE TABLE tbl_grupos_x_genero (
    codigo_grupos_o_artistas   INTEGER NOT NULL,
    codigo_genero_musical      INTEGER NOT NULL
);

ALTER TABLE tbl_grupos_x_genero ADD CONSTRAINT tbl_grupos_x_genero_pk PRIMARY KEY ( codigo_grupos_o_artistas,
                                                                                    codigo_genero_musical );

CREATE TABLE tbl_historial_descargas (
    codigo_descarga   INTEGER NOT NULL,
    codigo_usuario    INTEGER NOT NULL,
    codigo_cancion    INTEGER,
    codigo_playlist   INTEGER,
    codigo_lugar      INTEGER NOT NULL,
    fecha_descargo    DATE
);

ALTER TABLE tbl_historial_descargas ADD CONSTRAINT tbl_canciones_descargadas_pk PRIMARY KEY ( codigo_descarga );

ALTER TABLE tbl_historial_descargas ADD CONSTRAINT restriccion1v2 UNIQUE ( codigo_usuario,
                                                                           codigo_cancion );

ALTER TABLE tbl_historial_descargas ADD CONSTRAINT restriccion2v1 UNIQUE ( codigo_usuario,
                                                                           codigo_playlist );

CREATE TABLE tbl_historial_reproduccion_50 (
    codigo_historial_reproduccion   INTEGER NOT NULL,
    codigo_cancion                  INTEGER NOT NULL,
    codigo_lugar_reproduce          INTEGER NOT NULL,
    codigo_usuario                  INTEGER NOT NULL
);

ALTER TABLE tbl_historial_reproduccion_50 ADD CONSTRAINT tbl_historial_reproduccion_pk PRIMARY KEY ( codigo_historial_reproduccion
);

CREATE TABLE tbl_lugares (
    codigo_lugar            INTEGER NOT NULL,
    codigo_tipo_lugar       INTEGER NOT NULL,
    codigo_lugar_padre      INTEGER,
    nombre_lugar            VARCHAR(300) NOT NULL,
    latitud                 VARCHAR(100),
    longitud                VARCHAR(100),
    extencion_territorial   VARCHAR(100)
);

ALTER TABLE tbl_lugares ADD CONSTRAINT tbl_lugares_pk PRIMARY KEY ( codigo_lugar );

CREATE TABLE tbl_lugares_x_proveedores (
    codigo_proveedor_servicio   INTEGER NOT NULL,
    codigo_lugar                INTEGER NOT NULL
);

ALTER TABLE tbl_lugares_x_proveedores ADD CONSTRAINT tbl_lugares_x_proveedores_pk PRIMARY KEY ( codigo_proveedor_servicio,
                                                                                                codigo_lugar );

CREATE TABLE tbl_marca_telefono_m (
    codigo_marca_telefono_m   INTEGER NOT NULL,
    nombre_marca_telefono_m   VARCHAR(300)
);

ALTER TABLE tbl_marca_telefono_m ADD CONSTRAINT tbl_marca_telefono_m_pk PRIMARY KEY ( codigo_marca_telefono_m );

CREATE TABLE tbl_marca_telefono_x_so (
    codigo_marca_telefono_m    INTEGER NOT NULL,
    codigo_sistema_operativo   INTEGER NOT NULL
);

ALTER TABLE tbl_marca_telefono_x_so ADD CONSTRAINT tbl_marca_telefono_x_so_pk PRIMARY KEY ( codigo_sistema_operativo,
                                                                                            codigo_marca_telefono_m );

CREATE TABLE tbl_metodo_pago (
    codigo_metodo_pago   INTEGER NOT NULL,
    nombre_metodo_pago   VARCHAR(100)
);

ALTER TABLE tbl_metodo_pago ADD CONSTRAINT tbl_metodo_pago_pk PRIMARY KEY ( codigo_metodo_pago );

CREATE TABLE tbl_planes_de_cuentas (
    codigo_planes_cuenta   INTEGER NOT NULL,
    nombre_plan            VARCHAR(300) NOT NULL
);

ALTER TABLE tbl_planes_de_cuentas ADD CONSTRAINT tbl_planes_de_cuentas_pk PRIMARY KEY ( codigo_planes_cuenta );

CREATE TABLE tbl_playlist (
    codigo_playlist       INTEGER NOT NULL,
    codigo_usuario_crea   INTEGER NOT NULL,
    codigo_estado         INTEGER NOT NULL,
    codigo_lugar_creo     INTEGER NOT NULL,
    nombre_playlist       VARCHAR(300) NOT NULL,
    fecha_creo            DATE,
    genero_playlist       VARCHAR(100)
);

ALTER TABLE tbl_playlist ADD CONSTRAINT tbl_palylist_pk PRIMARY KEY ( codigo_playlist );

CREATE TABLE tbl_podcast (
    codigo_podcast        INTEGER NOT NULL,
    codigo_categoria      INTEGER NOT NULL,
    nombre_podcast        VARCHAR(300) NOT NULL,
    descripcion_podcast   VARCHAR(500),
    fecha_creacion        DATE
);

ALTER TABLE tbl_podcast ADD CONSTRAINT tbl_podcast_pk PRIMARY KEY ( codigo_podcast );

CREATE TABLE tbl_proveedor_servicio_movil (
    codigo_proveedor_servicio   INTEGER NOT NULL,
    nombre_proveedor_servicio   VARCHAR(300)
);

ALTER TABLE tbl_proveedor_servicio_movil ADD CONSTRAINT tbl_proveedor_servicio_pk PRIMARY KEY ( codigo_proveedor_servicio );

CREATE TABLE tbl_publicidad (
    codigo_publicidad           INTEGER NOT NULL,
    codigo_empresa_publicidad   INTEGER NOT NULL,
    codigo_tipo_vizualizar_p    INTEGER NOT NULL
);

ALTER TABLE tbl_publicidad ADD CONSTRAINT tbl_publicidad_pk PRIMARY KEY ( codigo_publicidad );

CREATE TABLE tbl_publicidad_x_usuario (
    codigo_usuario      INTEGER NOT NULL,
    codigo_publicidad   INTEGER NOT NULL,
    fecha_mostro        DATE
);

ALTER TABLE tbl_publicidad_x_usuario ADD CONSTRAINT tbl_publicidad_x_usuario_pk PRIMARY KEY ( codigo_publicidad,
                                                                                              codigo_usuario );

CREATE TABLE tbl_radio (
    codigo_radio        INTEGER NOT NULL,
    nombre_radio        VARCHAR(100),
    fecha_inicio        DATE,
    descripcion_radio   VARCHAR(500)
);

ALTER TABLE tbl_radio ADD CONSTRAINT tbl_radio_pk PRIMARY KEY ( codigo_radio );

CREATE TABLE tbl_radio_x_canciones (
    codigo_cancion   INTEGER NOT NULL,
    codigo_radio     INTEGER NOT NULL
);

ALTER TABLE tbl_radio_x_canciones ADD CONSTRAINT tbl_radio_x_canciones_pk PRIMARY KEY ( codigo_cancion,
                                                                                        codigo_radio );

CREATE TABLE tbl_radio_x_usuario (
    codigo_usuario   INTEGER NOT NULL,
    codigo_radio     INTEGER NOT NULL
);

ALTER TABLE tbl_radio_x_usuario ADD CONSTRAINT tbl_radio_x_usuario_pk PRIMARY KEY ( codigo_radio,
                                                                                    codigo_usuario );

CREATE TABLE tbl_recibos_pago (
    codigo_recibo_pago    INTEGER NOT NULL,
    codigo_usuario        INTEGER NOT NULL,
    codigo_lugar_emite    INTEGER NOT NULL,
    codigo_datos_pago     INTEGER NOT NULL,
    fecha_emitio_recibo   DATE NOT NULL,
    monto_pagar           INT
);

ALTER TABLE tbl_recibos_pago ADD CONSTRAINT tbl_recibos_pago_pk PRIMARY KEY ( codigo_recibo_pago );

CREATE TABLE tbl_recomendaciones_sistema (
    codigo_recomendacion_sistema    INTEGER NOT NULL,
    codigo_historial_reproduccion   INTEGER NOT NULL,
    codigo_playlist                 INTEGER,
    codigo_album_musical            INTEGER,
    nombre_recomendacion            VARCHAR(300),
    fecha_emitio_recomendacion      DATE
);

ALTER TABLE tbl_recomendaciones_sistema ADD CONSTRAINT tbl_recomendaciones_pk PRIMARY KEY ( codigo_recomendacion_sistema );

CREATE TABLE tbl_redes_sociales (
    codigo_red_social   INTEGER NOT NULL,
    nombre_red_social   VARCHAR(100)
);

ALTER TABLE tbl_redes_sociales ADD CONSTRAINT "TBL_REDES-SOCIALES_PK" PRIMARY KEY ( codigo_red_social );

CREATE TABLE tbl_reportes (
    codigo_reporte             INTEGER NOT NULL,
    codigo_usuario             INTEGER NOT NULL,
    codigo_grupos_o_artistas   INTEGER NOT NULL,
    codigo_tipo_reporte        INTEGER NOT NULL,
    codigo_lugar_reporto       INTEGER NOT NULL,
    fecha_reporto              DATE NOT NULL
);

ALTER TABLE tbl_reportes ADD CONSTRAINT tbl_reportes_pk PRIMARY KEY ( codigo_reporte );

CREATE TABLE tbl_shares (
    codigo_share               INTEGER NOT NULL,
    codigo_usuario             INTEGER NOT NULL,
    codigo_red_social          INTEGER NOT NULL,
    codigo_cancion             INTEGER,
    codigo_playlist            INTEGER,
    codigo_album_musical       INTEGER,
    codigo_grupos_o_artistas   INTEGER,
    fecha_dio_share            DATE
);

ALTER TABLE tbl_shares ADD CONSTRAINT tbl_shares_pk PRIMARY KEY ( codigo_share );

CREATE TABLE tbl_sistemas_operativos (
    codigo_sistema_operativo   INTEGER NOT NULL,
    nombre_sistema_operativo   VARCHAR(300)
);

ALTER TABLE tbl_sistemas_operativos ADD CONSTRAINT tbl_sistemas_operativos_pk PRIMARY KEY ( codigo_sistema_operativo );

CREATE TABLE tbl_tarjeta_regalo (
    codigo_tarjeta_regalo   INTEGER NOT NULL,
    codigo_lugar            INTEGER NOT NULL,
    codigo_usuario          INTEGER NOT NULL,
    fecha_cajea             DATE,
    codigo_a_cajear         INT
);

ALTER TABLE tbl_tarjeta_regalo ADD CONSTRAINT tbl_tarjeta_regalo_pk PRIMARY KEY ( codigo_tarjeta_regalo );

CREATE TABLE tbl_tipo_empresa (
    codigo_tipo_empresa   INTEGER NOT NULL,
    nombre_tipo_empresa   VARCHAR(100)
);

ALTER TABLE tbl_tipo_empresa ADD CONSTRAINT tbl_tipo_empresa_pk PRIMARY KEY ( codigo_tipo_empresa );

CREATE TABLE tbl_tipo_lugar (
    codigo_tipo_lugar   INTEGER NOT NULL,
    nombre_tipo_lugar   VARCHAR(300) NOT NULL
);

ALTER TABLE tbl_tipo_lugar ADD CONSTRAINT tbl_tipo_lugar_pk PRIMARY KEY ( codigo_tipo_lugar );

CREATE TABLE tbl_tipo_reporte (
    codigo_tipo_reporte   INTEGER NOT NULL,
    nombre_tipo_reporte   VARCHAR(100)
);

ALTER TABLE tbl_tipo_reporte ADD CONSTRAINT tbl_tipo_reporte_pk PRIMARY KEY ( codigo_tipo_reporte );

CREATE TABLE tbl_tipo_tarjeta (
    codigo_tipo_tarjeta   INTEGER NOT NULL,
    nombre_tipo_targeta   VARCHAR(100)
);

ALTER TABLE tbl_tipo_tarjeta ADD CONSTRAINT tbl_tipo_tarjeta_pk PRIMARY KEY ( codigo_tipo_tarjeta );

CREATE TABLE tbl_tipo_usuario (
    codigo_tipo_usuario   INTEGER NOT NULL,
    nombre_tipo_usuario   VARCHAR(100)
);

ALTER TABLE tbl_tipo_usuario ADD CONSTRAINT tbl_tipo_usuario_pk PRIMARY KEY ( codigo_tipo_usuario );

CREATE TABLE tbl_tipo_vizualizar_publicidad (
    codigo_tipo_vizualizar_p       INTEGER NOT NULL,
    nombre_vizualizar_publicidad   VARCHAR(100)
);

ALTER TABLE tbl_tipo_vizualizar_publicidad ADD CONSTRAINT tbl_tipo_vizualizar_pub_pk PRIMARY KEY ( codigo_tipo_vizualizar_p );

CREATE TABLE tbl_usuario_x_genero_musical (
    codigo_usuario          INTEGER NOT NULL,
    codigo_genero_musical   INTEGER NOT NULL,
    fecha_anadio            DATE
);

ALTER TABLE tbl_usuario_x_genero_musical ADD CONSTRAINT tbl_usuario_x_genero_pk PRIMARY KEY ( codigo_genero_musical,
                                                                                              codigo_usuario );

CREATE TABLE tbl_usuario_x_podcast (
    codigo_usuario   INTEGER NOT NULL,
    codigo_podcast   INTEGER NOT NULL
);

ALTER TABLE tbl_usuario_x_podcast ADD CONSTRAINT tbl_usuario_x_podcast_pk PRIMARY KEY ( codigo_usuario,
                                                                                        codigo_podcast );

CREATE TABLE tbl_usuarios (
    codigo_usuario              INTEGER NOT NULL,
    codigo_genero               INTEGER NOT NULL,
    codigo_lugar_vive           INTEGER NOT NULL,
    codigo_marca_telefono_m     INTEGER,
    codigo_proveedor_servicio   INTEGER,
    codigo_tipo_usuario         INTEGER NOT NULL,
    codigo_planes_cuenta        INTEGER NOT NULL,
    nombre_completo             VARCHAR(300) NOT NULL,
    fecha_nacimiento            DATE,
    usuario_plataforma          VARCHAR(300) NOT NULL,
    correo_electronico          VARCHAR(300) NOT NULL,
    contrasena                  VARCHAR(300) NOT NULL,
    numero_telefono             INT
);

ALTER TABLE tbl_usuarios ADD CONSTRAINT tbl_usuarios_pk PRIMARY KEY ( codigo_usuario );

CREATE TABLE tbl_vinculo_aplicaciones (
    codigo_vinculo_aplicaciones   INTEGER NOT NULL,
    codigo_usuario                INTEGER,
    nombre_aplicacion_vinculo     VARCHAR(300)
);

ALTER TABLE tbl_vinculo_aplicaciones ADD CONSTRAINT tbl_vinculo_aplicaciones_pk PRIMARY KEY ( codigo_vinculo_aplicaciones );

CREATE TABLE tbl_vinculo_datos_rs (
    codigo_vinculo_datos_rs   INTEGER NOT NULL,
    codigo_red_social         INTEGER,
    codigo_usuario            INTEGER
);

ALTER TABLE tbl_vinculo_datos_rs ADD CONSTRAINT tbl_vinculo_datos_rs_pk PRIMARY KEY ( codigo_vinculo_datos_rs );

ALTER TABLE tbl_albumes_musicales
    ADD CONSTRAINT tbl_albumes_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_albumes_x_playlist
    ADD CONSTRAINT tbl_albumes_x_playlist_fk FOREIGN KEY ( codigo_album_musical )
        REFERENCES tbl_albumes_musicales ( codigo_album_musical );

ALTER TABLE tbl_albumes_x_playlist
    ADD CONSTRAINT tbl_albumes_x_playlist_fkv2 FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_bibliote_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_biblioteca_podcast_fk FOREIGN KEY ( codigo_podcast )
        REFERENCES tbl_podcast ( codigo_podcast );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_biblioteca_tbl_albu_fk FOREIGN KEY ( codigo_album_musical )
        REFERENCES tbl_albumes_musicales ( codigo_album_musical );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_biblioteca_tbl_favo_fk FOREIGN KEY ( codigo_cancion_favorita )
        REFERENCES tbl_canciones_favoritas ( codigo_cancion_favorita );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_biblioteca_tbl_playlist_fk FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_anadir_biblioteca
    ADD CONSTRAINT tbl_biblioteca_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_canciones
    ADD CONSTRAINT tbl_canciones_tbl_albumes_fk FOREIGN KEY ( codigo_album_musical )
        REFERENCES tbl_albumes_musicales ( codigo_album_musical );

ALTER TABLE tbl_canciones
    ADD CONSTRAINT tbl_canciones_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_canciones_x_playlist
    ADD CONSTRAINT tbl_canciones_x_playlist_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_canciones_x_playlist
    ADD CONSTRAINT tbl_canciones_x_playlist_fkv2 FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_conciertos
    ADD CONSTRAINT tbl_conciertos_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_conciertos
    ADD CONSTRAINT tbl_conciertos_tbl_lugares_fk FOREIGN KEY ( codigo_lugar )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_datos_pago
    ADD CONSTRAINT tbl_dat_pago_tipo_fk FOREIGN KEY ( codigo_tipo_tarjeta )
        REFERENCES tbl_tipo_tarjeta ( codigo_tipo_tarjeta );

ALTER TABLE tbl_empresas_publicidad
    ADD CONSTRAINT tbl_empresas_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_recide )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_episodios_podcast
    ADD CONSTRAINT tbl_episo_tbl_podcast_fk FOREIGN KEY ( codigo_podcast )
        REFERENCES tbl_podcast ( codigo_podcast );

ALTER TABLE tbl_canciones_favoritas
    ADD CONSTRAINT tbl_favoritas_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_anadio )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_genero_x_cancion
    ADD CONSTRAINT tbl_genero_x_cancion_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_genero_x_cancion
    ADD CONSTRAINT tbl_genero_x_cancion_fkv2 FOREIGN KEY ( codigo_genero_musical )
        REFERENCES tbl_generos_musicales ( codigo_genero_musical );

ALTER TABLE tbl_grupos_o_artistas
    ADD CONSTRAINT tbl_grupos_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_formo_nace )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_grupos_o_artistas
    ADD CONSTRAINT tbl_grupos_tbl_lugares_fkv2 FOREIGN KEY ( codigo_lugar_reside )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_grupos_x_genero
    ADD CONSTRAINT tbl_grupos_x_genero_fk FOREIGN KEY ( codigo_genero_musical )
        REFERENCES tbl_generos_musicales ( codigo_genero_musical );

ALTER TABLE tbl_grupos_x_genero
    ADD CONSTRAINT tbl_grupos_x_genero_fkv2 FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_historial_descargas
    ADD CONSTRAINT tbl_his_descargas_tbl_canc_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_historial_descargas
    ADD CONSTRAINT tbl_hist_desc_tbl_lugares_fk FOREIGN KEY ( codigo_lugar )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_historial_descargas
    ADD CONSTRAINT tbl_hist_desc_tbl_playlist_fk FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_historial_descargas
    ADD CONSTRAINT tbl_hist_desc_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_historial_reproduccion_50
    ADD CONSTRAINT tbl_hist_repro_tbl_cancio_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_historial_reproduccion_50
    ADD CONSTRAINT tbl_hist_repro_tbl_luga_fk FOREIGN KEY ( codigo_lugar_reproduce )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_historial_reproduccion_50
    ADD CONSTRAINT tbl_hist_repro_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT tbl_lugares_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_padre )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT tbl_lugares_tbl_tipo_lugar_fk FOREIGN KEY ( codigo_tipo_lugar )
        REFERENCES tbl_tipo_lugar ( codigo_tipo_lugar );

ALTER TABLE tbl_lugares_x_proveedores
    ADD CONSTRAINT tbl_lugares_x_proveedores_fk FOREIGN KEY ( codigo_lugar )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_lugares_x_proveedores
    ADD CONSTRAINT tbl_lugares_x_proveedores_fkv2 FOREIGN KEY ( codigo_proveedor_servicio )
        REFERENCES tbl_proveedor_servicio_movil ( codigo_proveedor_servicio );

ALTER TABLE tbl_marca_telefono_x_so
    ADD CONSTRAINT tbl_marca_telefono_x_so_fk FOREIGN KEY ( codigo_marca_telefono_m )
        REFERENCES tbl_marca_telefono_m ( codigo_marca_telefono_m );

ALTER TABLE tbl_marca_telefono_x_so
    ADD CONSTRAINT tbl_marca_telefono_x_so_fkv2 FOREIGN KEY ( codigo_sistema_operativo )
        REFERENCES tbl_sistemas_operativos ( codigo_sistema_operativo );

ALTER TABLE tbl_recibos_pago
    ADD CONSTRAINT tbl_pago_tbl_datos_fk FOREIGN KEY ( codigo_datos_pago )
        REFERENCES tbl_datos_pago ( codigo_datos_pago );

ALTER TABLE tbl_datos_pago
    ADD CONSTRAINT tbl_pago_tbl_met_pago_fk FOREIGN KEY ( codigo_metodo_pago )
        REFERENCES tbl_metodo_pago ( codigo_metodo_pago );

ALTER TABLE tbl_playlist
    ADD CONSTRAINT tbl_palylist_fk FOREIGN KEY ( codigo_estado )
        REFERENCES tbl_estado_playlist ( codigo_estado );

ALTER TABLE tbl_playlist
    ADD CONSTRAINT tbl_palylist_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_creo )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_playlist
    ADD CONSTRAINT tbl_palylist_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario_crea )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_podcast
    ADD CONSTRAINT tbl_podcast_tbl_categorias_fk FOREIGN KEY ( codigo_categoria )
        REFERENCES tbl_categorias ( codigo_categoria );

ALTER TABLE tbl_publicidad
    ADD CONSTRAINT tbl_publ_tipo_vizual_fk FOREIGN KEY ( codigo_tipo_vizualizar_p )
        REFERENCES tbl_tipo_vizualizar_publicidad ( codigo_tipo_vizualizar_p );

ALTER TABLE tbl_publicidad
    ADD CONSTRAINT tbl_public_tbl_empresas_fk FOREIGN KEY ( codigo_empresa_publicidad )
        REFERENCES tbl_empresas_publicidad ( codigo_empresa_publicidad );

ALTER TABLE tbl_empresas_publicidad
    ADD CONSTRAINT tbl_publicidad_tbl_tipo_fk FOREIGN KEY ( codigo_tipo_empresa )
        REFERENCES tbl_tipo_empresa ( codigo_tipo_empresa );

ALTER TABLE tbl_publicidad_x_usuario
    ADD CONSTRAINT tbl_publicidad_x_usuario_fk FOREIGN KEY ( codigo_publicidad )
        REFERENCES tbl_publicidad ( codigo_publicidad );

ALTER TABLE tbl_publicidad_x_usuario
    ADD CONSTRAINT tbl_publicidad_x_usuario_fkv2 FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_recibos_pago
    ADD CONSTRAINT tbl_r_pago_tbl_luga_fk FOREIGN KEY ( codigo_lugar_emite )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_radio_x_canciones
    ADD CONSTRAINT tbl_radio_x_canciones_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_radio_x_canciones
    ADD CONSTRAINT tbl_radio_x_canciones_fkv2 FOREIGN KEY ( codigo_radio )
        REFERENCES tbl_radio ( codigo_radio );

ALTER TABLE tbl_radio_x_usuario
    ADD CONSTRAINT tbl_radio_x_usuario_fk FOREIGN KEY ( codigo_radio )
        REFERENCES tbl_radio ( codigo_radio );

ALTER TABLE tbl_radio_x_usuario
    ADD CONSTRAINT tbl_radio_x_usuario_fkv2 FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_recibos_pago
    ADD CONSTRAINT tbl_reci_pago_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_recomendaciones_sistema
    ADD CONSTRAINT tbl_reco_tbl_hist_repr_fk FOREIGN KEY ( codigo_historial_reproduccion )
        REFERENCES tbl_historial_reproduccion_50 ( codigo_historial_reproduccion );

ALTER TABLE tbl_recomendaciones_sistema
    ADD CONSTRAINT tbl_recom_tbl_playlist_fk FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_recomendaciones_sistema
    ADD CONSTRAINT tbl_recome_tbl_album_fk FOREIGN KEY ( codigo_album_musical )
        REFERENCES tbl_albumes_musicales ( codigo_album_musical );

ALTER TABLE tbl_reportes
    ADD CONSTRAINT tbl_report_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_reportes
    ADD CONSTRAINT tbl_reportes_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_reporto )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_reportes
    ADD CONSTRAINT tbl_reportes_tbl_tipo_fk FOREIGN KEY ( codigo_tipo_reporte )
        REFERENCES tbl_tipo_reporte ( codigo_tipo_reporte );

ALTER TABLE tbl_reportes
    ADD CONSTRAINT tbl_reportes_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_cola_reproduciendo
    ADD CONSTRAINT tbl_repro_tbl_canciones_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_cola_reproduciendo
    ADD CONSTRAINT tbl_repro_tbl_lugares_fk FOREIGN KEY ( codigo_lugar )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_cola_reproduciendo
    ADD CONSTRAINT tbl_repro_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_canciones_favoritas
    ADD CONSTRAINT tbl_saves_tbl_canciones_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_canciones_favoritas
    ADD CONSTRAINT tbl_saves_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario_dio_favorito )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_album_fk FOREIGN KEY ( codigo_album_musical )
        REFERENCES tbl_albumes_musicales ( codigo_album_musical );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_cancio_fk FOREIGN KEY ( codigo_cancion )
        REFERENCES tbl_canciones ( codigo_cancion );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_grupos_fk FOREIGN KEY ( codigo_grupos_o_artistas )
        REFERENCES tbl_grupos_o_artistas ( codigo_grupos_o_artistas );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_playlist_fk FOREIGN KEY ( codigo_playlist )
        REFERENCES tbl_playlist ( codigo_playlist );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_redes_fk FOREIGN KEY ( codigo_red_social )
        REFERENCES tbl_redes_sociales ( codigo_red_social );

ALTER TABLE tbl_shares
    ADD CONSTRAINT tbl_shares_tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_tarjeta_regalo
    ADD CONSTRAINT tbl_tarj_reg_tbl_luga_fk FOREIGN KEY ( codigo_lugar )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_tarjeta_regalo
    ADD CONSTRAINT tbl_tarj_rega_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usu_tbl_proveedor_fk FOREIGN KEY ( codigo_proveedor_servicio )
        REFERENCES tbl_proveedor_servicio_movil ( codigo_proveedor_servicio );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuari_tbl_marca_fk FOREIGN KEY ( codigo_marca_telefono_m )
        REFERENCES tbl_marca_telefono_m ( codigo_marca_telefono_m );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuari_tbl_planes_fk FOREIGN KEY ( codigo_planes_cuenta )
        REFERENCES tbl_planes_de_cuentas ( codigo_planes_cuenta );

ALTER TABLE tbl_usuario_x_genero_musical
    ADD CONSTRAINT tbl_usuario_x_genero_m_fk FOREIGN KEY ( codigo_genero_musical )
        REFERENCES tbl_generos_musicales ( codigo_genero_musical );

ALTER TABLE tbl_usuario_x_genero_musical
    ADD CONSTRAINT tbl_usuario_x_genero_m_fkv2 FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_usuario_x_podcast
    ADD CONSTRAINT tbl_usuario_x_podcast_fk FOREIGN KEY ( codigo_podcast )
        REFERENCES tbl_podcast ( codigo_podcast );

ALTER TABLE tbl_usuario_x_podcast
    ADD CONSTRAINT tbl_usuario_x_podcast_fkv2 FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_tbl_genero_fk FOREIGN KEY ( codigo_genero )
        REFERENCES tbl_genero ( codigo_genero );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_tbl_lugares_fk FOREIGN KEY ( codigo_lugar_vive )
        REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_usuarios
    ADD CONSTRAINT tbl_usuarios_tbl_tipo_fk FOREIGN KEY ( codigo_tipo_usuario )
        REFERENCES tbl_tipo_usuario ( codigo_tipo_usuario );

ALTER TABLE tbl_vinculo_aplicaciones
    ADD CONSTRAINT tbl_vinculo_ap_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_vinculo_datos_rs
    ADD CONSTRAINT tbl_vinculo_tbl_redes_fk FOREIGN KEY ( codigo_red_social )
        REFERENCES tbl_redes_sociales ( codigo_red_social );

ALTER TABLE tbl_vinculo_datos_rs
    ADD CONSTRAINT tbl_vinculo_tbl_usu_fk FOREIGN KEY ( codigo_usuario )
        REFERENCES tbl_usuarios ( codigo_usuario );


ALTER TABLE TBL_CANCIONES ADD CANTIDAD_REPRODUCIDO INT;

ALTER TABLE TBL_CANCIONES ADD DIRECCION VARCHAR(200);

ALTER TABLE TBL_ALBUMES_MUSICALES ADD IMAGEN VARCHAR(200);
