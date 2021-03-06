IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Veterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veterinaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veterinaria] SET RECOVERY FULL 
GO
ALTER DATABASE [Veterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [Veterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veterinaria] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Veterinaria', N'ON'
GO
USE [Veterinaria]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[TelefonoFijo] [nvarchar](max) NOT NULL,
	[TelefonoMovil] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Documento] [nvarchar](max) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[IDCompraDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IDProducto] [int] NOT NULL,
	[IDCompra] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Costo] [money] NOT NULL,
 CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[IDCompraDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[IDConsulta] [int] IDENTITY(1,1) NOT NULL,
	[IDMascota] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Sintomas] [text] NOT NULL,
	[Diagnostico] [text] NOT NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[IDConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[IDMascota] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Raza] [nvarchar](max) NOT NULL,
	[Observaciones] [text] NOT NULL,
	[IDTipoMascota] [int] NOT NULL,
 CONSTRAINT [PK_Mascota] PRIMARY KEY CLUSTERED 
(
	[IDMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Costo] [money] NOT NULL,
	[Precio] [money] NOT NULL,
	[Inventario] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[TelefonoFijo] [nvarchar](max) NOT NULL,
	[TelefonoMovil] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Documento] [nvarchar](max) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IDReserva] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[IDMascota] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IDReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IDTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IDTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoMascota]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMascota](
	[IDTipoMascota] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoMascota] PRIMARY KEY CLUSTERED 
(
	[IDTipoMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vacunacion]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacunacion](
	[IDVacunacion] [int] IDENTITY(1,1) NOT NULL,
	[IDMascota] [int] NOT NULL,
	[FechaProgramada] [datetime] NOT NULL,
	[Vacuna] [nvarchar](max) NULL,
	[FechaAplicacda] [datetime] NULL,
 CONSTRAINT [PK_Vacunación] PRIMARY KEY CLUSTERED 
(
	[IDVacunacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[IDCliente] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 06/02/2015 9:34:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IDVentaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IDVenta] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Costo] [money] NOT NULL,
 CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDVentaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (1, N'Federico Andres', N'Montes Montes', N'2357896', N'3006407899', N'fede@hotmail.com', N'Calle 81 #67 54', N'1077648153', 1, N'Fede')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (2, N'Mario Carlos', N'Ruiz Morales', N'26451260', N'3001246789', N'ruiz10@gmail.com', N'Diagonal 45 #56 54', N'46729134', 1, N'Mario')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (3, N'Camilo Federico', N'Mendosa Palacio', N'4256780', N'3124567893', N'cami20@colombia.com', N'Carrera 67 #55 45', N'108872635', 2, N'Camilo')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (4, N'franco Juan', N'Devita Jimenes', N'4557891', N'3124569878', N'devita30@gmail.com', N'Carrera 56 #43 43', N'48723640', 4, N'Devita')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (5, N'Cesar Manuel', N'Adargue Correa', N'4257641', N'3047859621', N'adargue@hotmail.com', N'Circula 14 #45 45', N'784526123', 3, N'Cesar')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (7, N'Mariana Maria', N'Mendoza Grajales', N'4356789', N'3048756112', N'Mary@hotmail.com', N'Calle 1 #34 34', N'4569871236', 2, N'Mary')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (8, N'Manuela Andrea', N'Rivera Palacio', N'2356478', N'3057842365', N'rivera2020@gmail.com', N'Carrera 45 #45 67', N'8600456', 1, N'Manu')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (9, N'Paola Stefania', N'Bermudez Bermudez', N'2365478', N'3120456897', N'pao10@colombia.com', N'Calle 34 #34 56', N'136578951', 4, N'Pao')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (10, N'Marsela Angela', N'Otalvaro Catañeda', N'2365479', N'3014579256', N'otalvaro3@hotmail.com', N'Calle 45 #43 54', N'7252365897', 4, N'Marsela')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (11, N'Vanesa Eliza', N'Mejia Prada', N'5462789', N'3024578965', N'vanesa40@gmail.com', N'Carrer 50 #45 43', N'856231789', 4, N'Mejia')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (12, N'Carolay', N'Cardona', N'4568972', N'3057895631', N'caro@gmail.com', N'Calle 45#56 56', N'45789123', 1, N'carola')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (13, N'Sofia luz', N'Bermudes Guisao', N'2654132', N'3054821463', N'sofi@colombia.com', N'Calle 45#96 56', N'789562134', 4, N'Sofy')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (14, N'Angela', N'Catañeda Sanchez', N'4521368', N'3014579624', N'angela5030@gmail.com', N'cll 53 # 11 b 41', N'1088726543', 1, N'Angela')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (15, N'Natalia Vanesa', N'Patiño Perez', N'4251679', N'3001245624', N'naty11@colombia.com', N'cll 50 # 45 b 44', N'50236412', 1, N'Naty')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (16, N'Bibiana', N'Guisao Mendez', N'4245698', N'3120452314', N'bibi45gmail.com', N'cll 90 # 45 b 84', N'145256231', 2, N'Bibi')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (17, N'Teresa', N'Guerrero Garcez', N'2564123', N'3120456782', N'tere@hotmail.com', N'crr 40 # 45 b 44', N'45698721', 3, N'Tere')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (18, N'Eliza', N'Mejia Adargue ', N'2564125', N'3120456782', N'eli50@gmail.com', N'cll 50 # 80 ee 44', N'123654799', 2, N'Eli')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (19, N'Juan Santiago', N'Tordecilla', N'4561326', N'3210465875', N'jp10@hotmail.com', N'cll 20 # 33 b 44', N'456213577', 3, N'Juan')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (20, N'Mercedes', N'Jaramillo Zuluaga', N'4562137', N'3045789631', N'millo032@gmail.com', N'cll 33 # 45 b 44', N'78541266', 3, N'Mercedes')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (21, N'Ledys', N'Morales Pardo', N'6045123', N'3154589125', N'mora2014@hotmail.com', N'Sandiego', N'46796504', 1, N'Ledys')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (24, N'Maritza', N'Tordecilla Najera', N'4578963', N'3214582967', N'tode1000@gmail.com', N'Pajarito', N'45945321', 1, N'Marys')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (25, N'Santiago', N'Sanchez Lopez', N'4562378', N'3154983652', N'santysanchez@hotmail.com', N'Las Palmas', N'122456897', 2, N'Santy')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (27, N'Pedro', N'Mendez Moreno', N'4526137', N'3021457856', N'pedritomendez@gmail.com', N'Guayabal', N'542136794', 3, N'Pedro')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (29, N'Daniel ', N'Lagares Montes', N'4521369', N'3154578962', N'danieLM@colombia.com', N'La 20', N'42365789', 2, N'Dany')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (30, N'Hermes Dario', N'Sepulveda Ruiz', N'2654123', N'3124578963', N'dario10@gmail.com', N'Laseptima', N'824617526', 3, N'Ruiz')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (31, N'Dario Manuel', N'Prada Correa', N'2348520', N'3114562086', N'pradacorre@hotmail.com', N'Avenida Oriental', N'789564123', 4, N'Manuel')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (32, N'Juan', N'zuluaga', N'2334455', N'3004546790', N'', N'', N'98622480', 1, N'zulu')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (33, N'Berenice', N'caro', N'2647977', N'3113227752', N'', N'', N'49739708', 1, N'yeis')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (36, N'Satan', N'Emiliano', N'2334433', N'3004546790', N'soporte@infierno.org', N'El Averno', N'666', 1, N'satan')
INSERT [dbo].[Cliente] ([IDCliente], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Correo], [Direccion], [Documento], [IDTipoDocumento], [UserName]) VALUES (41, N'xxx', N'xxx', N'xxx', N'xxx', N'xxx', N'xxx', N'666', 1, N'Chucky')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([IDCompra], [IDProveedor], [Fecha]) VALUES (1, 1, CAST(0x0000A3B900732379 AS DateTime))
INSERT [dbo].[Compra] ([IDCompra], [IDProveedor], [Fecha]) VALUES (2, 10, CAST(0x0000A3C5007F9BBB AS DateTime))
INSERT [dbo].[Compra] ([IDCompra], [IDProveedor], [Fecha]) VALUES (3, 15, CAST(0x0000A3C50083BCE4 AS DateTime))
INSERT [dbo].[Compra] ([IDCompra], [IDProveedor], [Fecha]) VALUES (9, 25, CAST(0x0000A3AC00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Compra] OFF
SET IDENTITY_INSERT [dbo].[CompraDetalle] ON 

INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (1, 15, 1, N'Alpizse', 24, 54367.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (2, 17, 2, N'CorreaparaPerros', 10, 4678.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (3, 20, 3, N'	Mentol', 3, 345578.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (4, 27, 9, N'MaizParaPajaro', 15, 32156.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (5, 30, 3, N'Jeringas', 5, 10400.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (7, 23, 9, N'Arroz', 10, 7000.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (8, 31, 2, N'AguaMineral', 10, 3256.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (9, 28, 1, N'Cemillas', 5, 3459.0000)
INSERT [dbo].[CompraDetalle] ([IDCompraDetalle], [IDProducto], [IDCompra], [Descripcion], [Cantidad], [Costo]) VALUES (10, 21, 2, N'Bandas', 23, 45363.0000)
SET IDENTITY_INSERT [dbo].[CompraDetalle] OFF
SET IDENTITY_INSERT [dbo].[Mascota] ON 

INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (15, 5, N'fifi', CAST(0x0000A33F00000000 AS DateTime), N'labrador', N'bajo de peso', 2)
INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (16, 8, N'Marcos', CAST(0x0000A32500000000 AS DateTime), N'Colirrojo tizon', N'Muy gordo', 5)
INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (17, 10, N'luna', CAST(0x0000A2E200000000 AS DateTime), N'Cacatuas', N'Desidratado', 15)
INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (19, 3, N'Manuel', CAST(0x0000A2E500000000 AS DateTime), N'Leon Marino', N'Diavetes', 19)
INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (21, 7, N'fede', CAST(0x0000A32100000000 AS DateTime), N'Poni', N'Ematomas', 26)
INSERT [dbo].[Mascota] ([IDMascota], [IDCliente], [Nombre], [FechaNacimiento], [Raza], [Observaciones], [IDTipoMascota]) VALUES (22, 2, N'Maiana', CAST(0x0000A2C900000000 AS DateTime), N'pitbull', N'Desmatitis', 1)
SET IDENTITY_INSERT [dbo].[Mascota] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (1, N'Jabonperro', 24000.0000, 558976.0000, 200)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (2, N'Albendazol', 15000.0000, 34560.0000, 100)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (3, N'Ampicilina', 3244562.0000, 43216.0000, 150)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (4, N'Antipirina', 5436782.0000, 552345.0000, 100)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (5, N'ShanpooAntipulgas', 15230.0000, 23456.0000, 230)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (6, N'Kit de belleza', 35245.0000, 65238.0000, 180)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (7, N'Calcio', 25249.0000, 555560.0000, 350)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (8, N'VitaminaK', 3000.0000, 6458.0000, 300)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (9, N'Yodo - NEOBACTERIOL', 264357.0000, 58367.0000, 260)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (10, N'Cloxacilina', 43672.0000, 58967.0000, 200)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (11, N'Penicilina', 12540.0000, 24356.0000, 240)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (12, N'Collarecanino', 5342.0000, 67534.0000, 120)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (13, N'CepillosParaCaballos ', 3539.0000, 6458.0000, 165)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (14, N'CeillosParaleones', 4259.0000, 83245.0000, 99)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (15, N'Alpiste', 54367.0000, 8765.0000, 160)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (16, N'melaza', 4678.0000, 72345.0000, 80)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (17, N'CorreaparaPerros', 5730.0000, 6439.0000, 220)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (18, N'Hueso', 4321.0000, 53478.0000, 257)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (19, N'Espiramicina', 2456.0000, 4754.0000, 310)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (20, N'	Mentol', 3215.0000, 56432.0000, 246)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (21, N'Bandas', 3456.0000, 2346.0000, 140)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (22, N'Tijeras', 2562.0000, 5976.0000, 5678)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (23, N'JeringasDesechables', 4267.0000, 54329.0000, 238)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (24, N'GuantesDesechables', 2146.0000, 643298.0000, 140)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (25, N'Maiz', 1346.0000, 2456.0000, 220)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (26, N'Cebada', 2458.0000, 6548.0000, 50)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (27, N'MaizParaPajaroz', 56732.0000, 56678.0000, 208)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (28, N'Cemillas', 2876.0000, 5789.0000, 255)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (29, N'Arroz', 1360.0000, 1648.0000, 160)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (30, N'CarneParaLeones', 2416.0000, 3456.0000, 228)
INSERT [dbo].[Producto] ([IDProducto], [Descripcion], [Costo], [Precio], [Inventario]) VALUES (31, N'AguaMineral', 3567.0000, 5432.0000, 350)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (1, N'Carmen', N'Zuluaga', N'4513678', N'3124569875', N'Calle 47#56 56', N'carmen@hotmail.com', N'133467895', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (3, N'fernando', N'Ruiz', N'2454638', N'3021467892', N'Calle 45#56 14', N'ruiz10@gmail.com', N'254698785', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (6, N'Teresa', N'Moreno', N'542163', N'3012467998', N'Calle 45#56 14', N'tere@hotmail.com', N'45679243', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (7, N'Juan', N'Mendez', N'4512369', N'3212046579', N'Calle 95#56 56', N'mendez', N'54213697', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (9, N'Federico', N'Garcez', N'4562138', N'3120456789', N'calle 55 # 82 53', N'fede', N'45879354', 3)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (10, N'Luis', N'Tordecilla', N'5423654', N'3001246567', N'calle 65 # 2 73', N'luisto@colombia.com', N'45621388', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (11, N'Jhoana', N'Jimenez', N'5642135', N'3045213678', N'calle 92 # 8 73', N'jimenez@hotmail.com', N'45378912', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (12, N'Luisa', N'Lagares', N'4512382', N'3012468999', N'calle 55 # 82 53', N'lagares@colombia.com', N'45879365', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (13, N'Carlos', N'Valdez', N'4562312', N'3120456879', N'calle 85 # 82 53', N'Valdez@gmail.com', N'106675982', 3)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (14, N'Mario', N'Cepulveda', N'4578963', N'3114578966', N'calle 15 # 82 98', N'mario15@hotmail.com', N'1054679522', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (15, N'Carla', N'Monrroy', N'235671', N'3124571894', N'calle 78 # 65  97', N'cm10@gmail.com', N'52345674', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (17, N'Fernanda', N'Mendez', N'4527684', N'3215678975', N'calle 54 # 78 AA 86', N'ferme55@colombia.com', N'2345678734', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (18, N'Natalia', N'Patiño', N'4365789', N'3045467893', N'calle 65 # 75 EE 76', N'Nataly77@hotmail.com', N'107734569', 3)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (19, N'Cristian', N'Montes', N'2456780', N'3054321567', N'calle 45 # 99 E 86', N'montes10@gmail.com', N'122345678', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (21, N'Kevin', N'Najera', N'2543267', N'3214567291', N'tirado', N'titado', N'103345678', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (22, N'Patricia', N'Ospina', N'2579036', N'3152671158', N'pelado', N'ospina831@hotmail.com', N'43411589', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (23, N'Stiven', N'Buelba', N'2310033', N'3156237988', N'Mondao', N'Buelba67@gmail.com', N'1007453603', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (24, N'Xiomara', N'Sanchez', N'6037587', N'2105678432', N'Abandonada', N'xiomisanchez@hotmail.com', N'678945321', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (25, N'Edinson', N'Adarve', N'4420668', N'3005418765', N'Diamante', N'edi3000@colombia.com', N'98631339', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (26, N'LuzDary', N'Yepez', N'5822418', N'3105131435', N'Diamante', N'maluye74@hotmail.com', N'43745864', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (27, N'Mariso', N'Romero', N'2456123', N'3014526782', N'Estadio', N'romero500@gmail.com', N'49257631', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (28, N'Andres', N'Jiraldo', N'4265813', N'3002565487', N'Pajarito', N'anjira60@gmail.com', N'1267304827', 4)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (29, N'Manuel', N'Posada', N'6034258', N'3155642305', N'Sancristobal', N'posada300@hotmail.com', N'845123697', 2)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (30, N'Felipe', N'Gradados', N'6054123', N'3204562389', N'Las Veletas', N'felygra@colombia.com', N'42567923', 3)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (31, N'Berenice', N'caro', N'2647977', N'3113227752', N'isa@colombia.com', N'Robledo', N'49739708', 1)
INSERT [dbo].[Proveedor] ([IDProveedor], [Nombres], [Apellidos], [TelefonoFijo], [TelefonoMovil], [Direccion], [Correo], [Documento], [IDTipoDocumento]) VALUES (32, N'yeimis', N'garcia', N'2347779', N'3016406799', N'yeimis@colombia.com', N'Robledo', N'1066729153', 1)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (2, 1, 1, CAST(0x0000A33F00000000 AS DateTime), N'Peinada')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (3, 5, 2, CAST(0x0000A3C200000000 AS DateTime), N'Baño')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (4, 10, 3, CAST(0x0000A3F700000000 AS DateTime), N'Espulgada')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (5, 15, 4, CAST(0x0000A36000000000 AS DateTime), N'Arrego de uñas')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (6, 17, 5, CAST(0x0000A30B00000000 AS DateTime), N'Spa')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (7, 20, 6, CAST(0x0000A34300000000 AS DateTime), N'Cepillada')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (8, 22, 7, CAST(0x0000A39D00000000 AS DateTime), N'Lavado de pelo')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (9, 14, 8, CAST(0x0000A3F400000000 AS DateTime), N'Revicion de ojos')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (10, 25, 9, CAST(0x0000A32500000000 AS DateTime), N'Cortar Cola')
INSERT [dbo].[Reserva] ([IDReserva], [IDCliente], [IDMascota], [Fecha], [Descripcion]) VALUES (11, 5, 10, CAST(0x0000A2E600000000 AS DateTime), N'Spa de uñas')
SET IDENTITY_INSERT [dbo].[Reserva] OFF
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (1, N'Cedula de Ciudadania')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (2, N'Cedula de Extranjeria')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (3, N'Nit')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (4, N'Tarjeta de Identidad')
INSERT [dbo].[TipoDocumento] ([IDTipoDocumento], [Descripcion]) VALUES (9, N'Carnet de Alienigena')
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
SET IDENTITY_INSERT [dbo].[TipoMascota] ON 

INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (1, N'pitbull')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (2, N'pincher')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (3, N'ConejoBeveren')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (4, N'ConejoBlanco')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (5, N'ConejoAmericano')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (6, N'Avion Comun')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (7, N'Colirrojo tizon')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (8, N'Aguila pescadora')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (9, N'Aguila Calza')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (10, N'Malvasis Cabeciblanca')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (11, N'Cigüeña ')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (12, N'Guacamayos')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (13, N'Loris')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (14, N'Forpus')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (15, N'Cacatuas')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (16, N'Ninfas')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (17, N'Periquitos')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (18, N'Pionus')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (19, N'Leon Marino')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (21, N'Leon Marino Australia')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (22, N'Oso Panda')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (23, N'OsoMalayo')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (24, N'Oso Pardo')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (25, N'Oso Polar')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (26, N'Poni')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (27, N' Caballos Cob Gales')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (28, N' Caballos Nonius')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (29, N'Caballo Americano')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (30, N'Hamster')
INSERT [dbo].[TipoMascota] ([IDTipoMascota], [Descripcion]) VALUES (31, N'Caballo de Mar')
SET IDENTITY_INSERT [dbo].[TipoMascota] OFF
SET IDENTITY_INSERT [dbo].[Vacunacion] ON 

INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (1, 15, CAST(0x0000A41900000000 AS DateTime), N'Tripe Viral', NULL)
INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (2, 15, CAST(0x0000A49600000000 AS DateTime), N'Pago Virus', NULL)
INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (3, 15, CAST(0x0000A53700000000 AS DateTime), N'Moquillo', NULL)
INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (4, 19, CAST(0x0000A40700000000 AS DateTime), N'Tripe Viral', NULL)
INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (5, 19, CAST(0x0000A3DF00000000 AS DateTime), N'Pago Virus', NULL)
INSERT [dbo].[Vacunacion] ([IDVacunacion], [IDMascota], [FechaProgramada], [Vacuna], [FechaAplicacda]) VALUES (6, 19, CAST(0x0000A3D400000000 AS DateTime), N'Moquillo', NULL)
SET IDENTITY_INSERT [dbo].[Vacunacion] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Cliente]    Script Date: 06/02/2015 9:34:18 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cliente] ON [dbo].[Cliente]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoDocumento]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Compra] ([IDCompra])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Mascota] FOREIGN KEY([IDMascota])
REFERENCES [dbo].[Mascota] ([IDMascota])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Mascota]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_Cliente]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Reserva] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Reserva] ([IDReserva])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_Reserva]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_TipoMascota] FOREIGN KEY([IDTipoMascota])
REFERENCES [dbo].[TipoMascota] ([IDTipoMascota])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_TipoMascota]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_TipoDocumento]
GO
ALTER TABLE [dbo].[Vacunacion]  WITH CHECK ADD  CONSTRAINT [FK_Vacunación_Mascota] FOREIGN KEY([IDMascota])
REFERENCES [dbo].[Mascota] ([IDMascota])
GO
ALTER TABLE [dbo].[Vacunacion] CHECK CONSTRAINT [FK_Vacunación_Mascota]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Venta] ([IDVenta])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
USE [master]
GO
ALTER DATABASE [Veterinaria] SET  READ_WRITE 
GO
