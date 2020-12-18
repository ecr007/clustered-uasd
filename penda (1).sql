--
-- Estructura de tabla para la tabla cuentas
--

CREATE TABLE cuentas (
  id bigint UNSIGNED NOT NULL,
  socio_id bigint UNSIGNED NOT NULL,
  numero bigint NOT NULL,
  balance decimal(10,2) NOT NULL DEFAULT '0.00',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla cuentas_transacciones
--

CREATE TABLE cuentas_transacciones (
  id bigint UNSIGNED NOT NULL,
  cuenta_id bigint UNSIGNED NOT NULL,
  tipo_transaccion_id bigint UNSIGNED NOT NULL,
  monto decimal(10,2) NOT NULL DEFAULT '0.00',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla prestamos
--

CREATE TABLE prestamos (
  id bigint UNSIGNED NOT NULL,
  socio_id bigint UNSIGNED NOT NULL,
  numero bigint NOT NULL,
  balance_sin_intereses decimal(10,2) NOT NULL DEFAULT '0.00',
  balance_inicial decimal(10,2) NOT NULL DEFAULT '0.00',
  balance decimal(10,2) NOT NULL DEFAULT '0.00',
  tasa decimal(10,2) NOT NULL,
  cuotas_restantes int NOT NULL DEFAULT '0',
  monto_cuota decimal(10,2) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT '0',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla prestamos_transacciones
--

CREATE TABLE prestamos_transacciones (
  id bigint UNSIGNED NOT NULL,
  prestamo_id bigint UNSIGNED NOT NULL,
  tipo_transaccion_id bigint UNSIGNED NOT NULL,
  monto decimal(10,2) NOT NULL DEFAULT '0.00',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla roles
--

CREATE TABLE roles (
  id bigint UNSIGNED NOT NULL,
  nombre varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  slug varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuarios_roles
--

CREATE TABLE usuarios_roles (
  role_id bigint UNSIGNED NOT NULL,
  user_id bigint UNSIGNED NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla socios
--

CREATE TABLE socios (
  id bigint UNSIGNED NOT NULL,
  nombre varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  apellido varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  cedula varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  telefono varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  celular varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  provincia int NOT NULL,
  municipio int NOT NULL,
  direccion varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla tipo_transacciones
--

CREATE TABLE tipo_transacciones (
  id bigint UNSIGNED NOT NULL,
  nombre varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  operacion varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuarios
--

CREATE TABLE usuarios (
  id bigint UNSIGNED NOT NULL,
  status tinyint(1) NOT NULL DEFAULT '0',
  nombre varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  slug varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  email varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  cedula varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  password varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Indices de la tabla cuentas
--
ALTER TABLE cuentas
  ADD PRIMARY KEY (id),
  ADD KEY cuentas_socio_id_foreign (socio_id);

--
-- Indices de la tabla cuentas_transacciones
--
ALTER TABLE cuentas_transacciones
  ADD PRIMARY KEY (id),
  ADD KEY cuentas_transacciones_cuenta_id_foreign (cuenta_id),
  ADD KEY cuentas_transacciones_tipo_transaccion_id_foreign (tipo_transaccion_id);

--
-- Indices de la tabla prestamos
--
ALTER TABLE prestamos
  ADD PRIMARY KEY (id),
  ADD KEY prestamos_socio_id_foreign (socio_id);

--
-- Indices de la tabla prestamos_transacciones
--
ALTER TABLE prestamos_transacciones
  ADD PRIMARY KEY (id),
  ADD KEY prestamos_transacciones_prestamo_id_foreign (prestamo_id),
  ADD KEY prestamos_transacciones_tipo_transaccion_id_foreign (tipo_transaccion_id);

--
-- Indices de la tabla roles
--
ALTER TABLE roles
  ADD PRIMARY KEY (id);

--
-- Indices de la tabla usuarios_roles
--
ALTER TABLE usuarios_roles
  ADD PRIMARY KEY (role_id,user_id),
  ADD KEY usuarios_roles_user_id_foreign (user_id);

--
-- Indices de la tabla socios
--
ALTER TABLE socios
  ADD PRIMARY KEY (id);

--
-- Indices de la tabla tipo_transacciones
--
ALTER TABLE tipo_transacciones
  ADD PRIMARY KEY (id);

--
-- Indices de la tabla usuarios
--
ALTER TABLE usuarios
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY usuarios_email_unique (email),
  ADD UNIQUE KEY usuarios_api_token_unique (api_token);

--
-- AUTO_INCREMENT de la tabla cuentas
--
ALTER TABLE cuentas
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla cuentas_transacciones
--
ALTER TABLE cuentas_transacciones
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla prestamos
--
ALTER TABLE prestamos
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla prestamos_transacciones
--
ALTER TABLE prestamos_transacciones
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla roles
--
ALTER TABLE roles
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla socios
--
ALTER TABLE socios
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla tipo_transacciones
--
ALTER TABLE tipo_transacciones
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla usuarios
--
ALTER TABLE usuarios
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla cuentas
--
ALTER TABLE cuentas
  ADD CONSTRAINT cuentas_socio_id_foreign FOREIGN KEY (socio_id) REFERENCES socios (id) ON DELETE CASCADE;

--
-- Filtros para la tabla cuentas_transacciones
--
ALTER TABLE cuentas_transacciones
  ADD CONSTRAINT cuentas_transacciones_cuenta_id_foreign FOREIGN KEY (cuenta_id) REFERENCES cuentas (id) ON DELETE CASCADE,
  ADD CONSTRAINT cuentas_transacciones_tipo_transaccion_id_foreign FOREIGN KEY (tipo_transaccion_id) REFERENCES tipo_transacciones (id) ON DELETE CASCADE;

--
-- Filtros para la tabla prestamos_transacciones
--
ALTER TABLE prestamos_transacciones
  ADD CONSTRAINT prestamos_transacciones_prestamo_id_foreign FOREIGN KEY (prestamo_id) REFERENCES prestamos (id) ON DELETE CASCADE,
  ADD CONSTRAINT prestamos_transacciones_tipo_transaccion_id_foreign FOREIGN KEY (tipo_transaccion_id) REFERENCES tipo_transacciones (id) ON DELETE CASCADE;

--
-- Filtros para la tabla usuarios_roles
--
ALTER TABLE usuarios_roles
  ADD CONSTRAINT usuarios_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
  ADD CONSTRAINT usuarios_roles_user_id_foreign FOREIGN KEY (user_id) REFERENCES usuarios (id) ON DELETE CASCADE;
COMMIT;