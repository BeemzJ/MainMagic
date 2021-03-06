USE [master]
GO
/****** Object:  Database [NuevaMaster]    Script Date: 08/03/2017 11:08:41 ******/
CREATE DATABASE [NuevaMaster]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NuevaMaster', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NuevaMaster.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NuevaMaster_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NuevaMaster_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NuevaMaster] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NuevaMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NuevaMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NuevaMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NuevaMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NuevaMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NuevaMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [NuevaMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NuevaMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NuevaMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NuevaMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NuevaMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NuevaMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NuevaMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NuevaMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NuevaMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NuevaMaster] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NuevaMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NuevaMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NuevaMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NuevaMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NuevaMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NuevaMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NuevaMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NuevaMaster] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NuevaMaster] SET  MULTI_USER 
GO
ALTER DATABASE [NuevaMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NuevaMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NuevaMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NuevaMaster] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NuevaMaster] SET DELAYED_DURABILITY = DISABLED 
GO
USE [NuevaMaster]
GO
/****** Object:  User [GRUPO4]    Script Date: 08/03/2017 11:08:41 ******/
CREATE USER [GRUPO4] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[DesenCripta]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DesenCripta]
(
@Clave as varchar(100)
	
)
RETURNS varchar(100)
AS
BEGIN
	
	DECLARE @PassWord as varchar(100)
	set @PassWord=HASHBYTES('MD5',@Clave)
	return @PassWord
	

END
--select UserName,dbo.DesenCripta(PassWord)from Usuario

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Material] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreC] [varchar](50) NOT NULL,
	[ApellidoC] [varchar](50) NOT NULL,
	[DireccionC] [varchar](200) NOT NULL,
	[TelefonoC] [varchar](50) NOT NULL,
	[CorreoC] [varchar](100) NOT NULL,
	[CiudadC] [varchar](50) NOT NULL,
	[PaisC] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConfirmacionDePago]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfirmacionDePago](
	[IdConfirmacionDePago] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[Deposito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ConfirmacionDePago] PRIMARY KEY CLUSTERED 
(
	[IdConfirmacionDePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalleFactura] [bigint] NOT NULL,
	[IdFactura] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descuento] [decimal](6, 2) NOT NULL,
	[SubTotal] [decimal](6, 2) NOT NULL,
	[Total] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetallePedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedido](
	[IdDetallePedido] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPedido] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[PrecioTotal] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_DetallePedidos] PRIMARY KEY CLUSTERED 
(
	[IdDetallePedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreE] [varchar](50) NOT NULL,
	[ApellidoE] [varchar](50) NOT NULL,
	[TelefonoE] [varchar](20) NOT NULL,
	[DireccionE] [varchar](200) NOT NULL,
	[CargoE] [varchar](50) NOT NULL,
	[CorreoE] [varchar](100) NOT NULL,
	[CiudadE] [varchar](50) NOT NULL,
	[PaisE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[FormaPago] [varchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[NoFactura] [int] NOT NULL,
	[Saldo] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[FechaEnvio] [date] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [bigint] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[PrecioUnitario] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Image] [image] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [bigint] NOT NULL,
	[IdFactura] [bigint] NOT NULL,
	[IdDetallePedido] [bigint] NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VistaObtenerProductos]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaObtenerProductos]
AS
SELECT        dbo.Categoria.Material, dbo.Producto.Image, dbo.Producto.Stock, dbo.Producto.PrecioUnitario, dbo.Producto.Descripcion, dbo.Producto.NombreProducto, dbo.Categoria.IdCategoria, dbo.Producto.IdProducto
FROM            dbo.Categoria INNER JOIN
                         dbo.Producto ON dbo.Categoria.IdCategoria = dbo.Producto.IdCategoria


GO
/****** Object:  StoredProcedure [dbo].[ActualizarCategoria]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCategoria]
@IdCategoria as bigint,
@Material as varchar(50)
AS
BEGIN
	Update Categoria
	set Material = @Material 
	where IdCategoria = @IdCategoria;
END


GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCliente] 
@IdCliente as bigint,
@NombreC as varchar(50),
@ApellidoC as varchar(50),
@DireccionC as varchar(200),
@TelefonoC as varchar(50),
@CorreoC as varchar(100),
@CiudadC as varchar(50),
@PaisC as varchar (50)
AS
BEGIN
	Update Cliente
	set NombreC=@NombreC,
	ApellidoC = @ApellidoC,
	DireccionC = @DireccionC,
	TelefonoC = @TelefonoC,
	CorreoC = @CorreoC,
	CiudadC = @CiudadC,
	PaisC = @PaisC
	where IdCliente= @IdCliente;
END



GO
/****** Object:  StoredProcedure [dbo].[ActualizarConfirmacionDePago]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarConfirmacionDePago]
@IdConfirmacionDePago as bigint,
@IdCliente as bigint,
@Deposito as varchar(50)
AS
BEGIN
	update ConfirmacionDePago
	set IdCliente=@IdCliente,
	Deposito=@Deposito
	where IdConfirmacionDePago=@IdConfirmacionDePago;
END


GO
/****** Object:  StoredProcedure [dbo].[ActualizarDetalleFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarDetalleFactura]
@IdDetalleFactura as bigint,
@IdFactura as bigint,
@IdProducto as bigint,
@Cantidad as int,
@Descuento as decimal(6,2),
@SubTotal as decimal(6,2),
@Total as decimal(6,2)
AS
BEGIN
	Update DetalleFactura
	set
	IdFactura=@IdFactura,
	IdProducto = @IdProducto,
	Cantidad = @Cantidad,
	Descuento = @Descuento,
	SubTotal = @SubTotal,
	Total=@Total
	where IdDetalleFactura=@IdDetalleFactura;
END


GO
/****** Object:  StoredProcedure [dbo].[ActualizarDetallePedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarDetallePedido] 
@IdDetallePedido as bigint,
@IdPedido  as bigint,
@IdProducto as bigint,
@PrecioTotal as int,
@Cantidad as int
AS
BEGIN
	Update DetallePedido set IdPedido=@IdPedido, IdProducto=@IdProducto, PrecioTotal=@PrecioTotal, Cantidad=@Cantidad where IdDetallePedido=@IdDetallePedido;
END



GO
/****** Object:  StoredProcedure [dbo].[ActualizarEmpleado]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEmpleado] 
@IdEmpleado as bigint,
@NombreE as varchar(50),
@ApellidoE as varchar(50),
@TelefonoE as varchar(20),
@DireccionE as varchar(200),
@CorreoE as varchar(100),
@CargoE as varchar(50),
@CiudadE as varchar(50),
@PaisE as varchar(50)
AS
BEGIN
	Update Empleado set 
	NombreE = @NombreE,
	ApellidoE = @ApellidoE, 
	TelefonoE = @TelefonoE,
	DireccionE = @DireccionE,
	CorreoE = @CorreoE,
	CargoE = @CargoE,
	CiudadE = @CiudadE,
	PaisE = @PaisE
	where IdEmpleado = @IdEmpleado;
END



GO
/****** Object:  StoredProcedure [dbo].[ActualizarFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarFactura]
@IdFactura as bigint,
@IdCliente  as bigint,
@FormaPago as varchar(50),
@Fecha as date,
@NoFactura as int,
@Saldo as decimal(6,2)
AS
BEGIN
	Update Factura
	set IdCliente = @IdCliente,
	FormaPago=@FormaPago,
	Fecha=@Fecha,
	NoFactura=@NoFactura,
	Saldo = @Saldo
	where IdFactura =@IdFactura;
END


GO
/****** Object:  StoredProcedure [dbo].[ActualizarPedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPedido] 
@IdPedido as bigint,
@IdCliente as bigint,
@IdEmpleado as bigint,
@FechaPedido as date,
@FechaEnvio as date
AS
BEGIN
	Update Pedido set IdCliente=@IdCliente, IdEmpleado=@IdEmpleado, FechaPedido=@FechaPedido, FechaEnvio=@FechaEnvio where IdPedido=@IdPedido;
END



GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarProducto] 
@IdProducto as bigint,
@NombrePoducto as varchar(50),
@Descripcion as varchar(200),
@PrecioUnitario as int,
@Stock as int,
@IdCategoria as bigint,
@Image as image
AS
BEGIN
	Update Producto set NombreProducto=@NombrePoducto, Descripcion=@Descripcion, PrecioUnitario=@PrecioUnitario, Stock=@Stock, IdCategoria=@IdCategoria, Image=@Image
	where IdProducto=@IdProducto;
END



GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
@IdUsuario as bigint,
@Nombre as varchar(50),
@Apellido as varchar(50),
@Direccion as varchar(200),
@Telefono as varchar(20),
@Correo as varchar(100),
@UserName as varchar(50),
@PassWord as varchar(100)
AS
BEGIN
	Update Usuario
	set Nombre=@Nombre,
	Apellido = @Apellido,
	Direccion = @Direccion,
	Telefono = @Telefono,
	Correo = @Correo,
	UserName=@UserName,
	PassWord=@PassWord
	where IdUsuario= @IdUsuario;
END


GO
/****** Object:  StoredProcedure [dbo].[ActualizarVenta]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarVenta]
@IdVenta as bigint,
@IdEmpleado as bigint,
@IdFactura as bigint,
@IdDetallePedido as bigint,
@Total as int
AS
BEGIN
	Update Venta
	set IdEmpleado=@IdEmpleado,
	IdFactura = @IdFactura,
	IdDetallePedido = @IdDetallePedido,
	Total = @Total
	where IdVenta= @IdVenta;
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarCategoria]
@IdCategoria as bigint,
@Material as varchar(50)
AS
BEGIN
	Insert into Categoria(Material)Values(@Material);
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCliente] 
@IdCliente as bigint,
@NombreC as varchar(50),
@ApellidoC as varchar(50),
@TelefonoC as varchar(20),
@DireccionC as varchar(200),
@CorreoC as varchar(100),
@CiudadC as varchar(50),
@PaisC as varchar(50)

AS
BEGIN
Insert into Cliente(NombreC,ApellidoC,TelefonoC,DireccionC,CorreoC,CiudadC,PaisC)
	values(@NombreC,@ApellidoC,@TelefonoC,@DireccionC,@CorreoC,@CiudadC,@PaisC);
END



GO
/****** Object:  StoredProcedure [dbo].[AgregarConfirmacionDePago]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarConfirmacionDePago]
@IdConfirmacionDePago as bigint,
@IdCliente as bigint,
@Deposito as varchar(50)
AS
BEGIN
	Insert into ConfirmacionDePago(IdCliente,Deposito)
	values(@IdCliente,@Deposito);
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarDetalleFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarDetalleFactura]
@IdDetallefactura as bigint,
@IdFactura as bigint,
@IdProducto as bigint,
@Cantidad as int,
@Descuento as decimal(6,2),
@SubTotal as decimal(6,2),
@Total as decimal(6,2)
AS
BEGIN
	Insert into DetalleFactura(IdDetalleFactura,IdFactura,IdProducto,Cantidad,Descuento,SubTotal,Total)
	values(@IdDetalleFactura,@IdFactura,@IdProducto,@Cantidad,@Descuento,@SubTotal,@Total);
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarDetallePedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarDetallePedido] 
@IdDetallePedido as bigint,
@IdPedido  as bigint,
@IdProducto as bigint,
@PrecioTotal as int,
@Cantidad as int
AS
BEGIN
Insert into DetallePedido(IdPedido,IdProducto,PrecioTotal,Cantidad)values(@IdPedido,@IdProducto,@PrecioTotal,@Cantidad);
END



GO
/****** Object:  StoredProcedure [dbo].[AgregarEmpleado]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEmpleado] 
@IdEmpleado as bigint,
@NombreE as varchar(50),
@ApellidoE as varchar(50),
@TelefonoE as varchar(20),
@DireccionE as varchar(200),
@CorreoE as varchar(100),
@CargoE as varchar(50),
@CiudadE as varchar(50),
@PaisE as varchar(50)
AS
BEGIN
	Insert into Empleado(NombreE,ApellidoE,TelefonoE,DireccionE,CorreoE,CargoE,CiudadE,PaisE)
	values(@NombreE,@ApellidoE,@TelefonoE,@DireccionE,@CorreoE,@CargoE,@CiudadE,@PaisE);
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarFactura]
@IdFactura as bigint,
@IdCliente  as bigint,
@FormaPago as varchar(50),
@Fecha as date,
@NoFactura as int,
@Saldo as decimal(6,2)
AS
BEGIN
	Insert into Factura(IdCliente,FormaPago,Fecha,NoFactura, Saldo)
	values(@IdCliente,@FormaPago,@Fecha,@NoFactura, @Saldo);
END


GO
/****** Object:  StoredProcedure [dbo].[AgregarPedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPedido] 
@IdPedido as bigint,
@IdCliente as bigint,
@IdEmpleado as bigint,
@FechaPedido as date,
@FechaEnvio as date
AS
BEGIN
	Insert into Pedido(IdCliente,IdEmpleado,FechaPedido,FechaEnvio)values(@IdCliente,@IdEmpleado,@FechaPedido,@FechaEnvio);
END



GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto] 
@IdProducto as bigint,
@NombreProducto as varchar(50),
@Descripcion as varchar(200),
@PrecioUnitario as int,
@Stock as int,
@IdCategoria bigint,
@Image as image
AS
BEGIN
Insert into Producto(NombreProducto,Descripcion,PrecioUnitario,Stock, IdCategoria,Image)
	values(@NombreProducto,@Descripcion,@PrecioUnitario,@Stock,@IdCategoria,@Image);
END



GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarUsuario]
@IdUsuario as bigint,
@Nombre as varchar(50),
@Apellido as varchar(50),
@Direccion as varchar(200),
@Telefono as varchar(20),
@Correo as varchar(100),
@UserName as varchar(50),
@PassWord as varchar(100)
AS
BEGIN
	
	
	Insert into Usuario(Nombre,Apellido,Telefono,Direccion,Correo,UserName,PassWord)
	values(@Nombre,@Apellido,@Telefono,@Direccion,@Correo,@UserName,HASHBYTES('MD5', @PassWord));
END




GO
/****** Object:  StoredProcedure [dbo].[AgregarVenta]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarVenta]
@IdVenta as bigint,
@IdEmpleado as bigint,
@IdFactura as bigint,
@IdDetallePedido as bigint,
@Total as int
AS
BEGIN
	Insert into Venta(IdVenta,IdEmpleado,IdFactura,IdDetallePedido,Total)
	values(@IdVenta,@IdEmpleado,@IdFactura,@IdDetallePedido,@Total);
END


GO
/****** Object:  StoredProcedure [dbo].[BuscarClientePorApellido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarClientePorApellido]
@ApellidoC as varchar(50)
AS
BEGIN
	SELECT * FROM Cliente
	WHERE ApellidoC LIKE '%' + @ApellidoC + '%'
END


GO
/****** Object:  StoredProcedure [dbo].[BuscarClientePorNombre]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarClientePorNombre]
@NombreC as varchar(50)
AS
BEGIN
	SELECT * FROM Cliente
	WHERE NombreC LIKE '%' + @NombreC + '%'
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCategoria]
@IdCategoria as bigint
AS
BEGIN
	Delete from Categoria where IdCategoria = @IdCategoria;
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCliente] 
@IdCliente as bigint
AS
BEGIN
Delete From Cliente where IdCliente = @IdCliente;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarConfirmacionDePago]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarConfirmacionDePago] 
@IdConfirmacionDePago as bigint
AS
BEGIN
	Delete from ConfirmacionDePago where IdConfirmacionDePago=@IdConfirmacionDePago;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarDetalleFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarDetalleFactura]
	@IdDetalleFactura as bigint
AS
BEGIN
	Delete from DetalleFactura where IdDetalleFactura=@IdDetalleFactura;
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarDetallePedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarDetallePedido] 
@IdDetallePedido as bigint
AS
BEGIN
	Delete from DetallePedido where IdDetallePedido=@IdDetallePedido;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEmpleado] 
@IdEmpleado as bigint
AS
BEGIN
	Delete from Empleado where IdEmpleado = @IdEmpleado;
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarFactura] 
@IdFactura as bigint
AS
BEGIN
	Delete from Factura where IdFactura=@IdFactura;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarPedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPedido] 
@IdPedido as bigint
AS
BEGIN
	Delete from Pedido where IdPedido=@IdPedido;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProducto] 
@IdProducto as bigint
AS
BEGIN
Delete from Producto where IdProducto = @IdProducto;
END



GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
@IdUsuario as bigint
AS
BEGIN
	Delete from Usuario where IdUsuario = @IdUsuario;
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarVenta]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarVenta] 
@IdVenta as bigint
AS
BEGIN
	Delete From Venta where IdVenta=@IdVenta;
END



GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
@UserName varchar(50),
@PassWord varchar(100)
AS
BEGIN
	
Select UserName,PassWord from Usuario
	Where UserName = @UserName and HASHBYTES('MD5',@PassWord)=PassWord
end


GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientePorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[ObtenerClientePorId] 
@IdCliente as bigint

AS
BEGIN
Select * from Cliente where IdCliente = @IdCliente;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientePorNombre]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientePorNombre]
@NombreC as varchar(50)
AS
BEGIN
	Select * From Cliente where NombreC=@NombreC;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerConfirmacionDePagoPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerConfirmacionDePagoPorId]
@IdConfirmacionDePago as bigint
AS
BEGIN
	select * from ConfirmacionDePago Where IdConfirmacionDePago=@IdConfirmacionDePago;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerConfirmacionDePagoPorIdCliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerConfirmacionDePagoPorIdCliente] 
@IdCliente as bigint
AS
BEGIN
	select * from ConfirmacionDePago Where IdCliente=@IdCliente;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerDetalleFacturaNew]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerDetalleFacturaNew]
AS
BEGIN
	select DF.IdDetalleFactura as NoFactura, Cl.NombreC, Pr.NombreProducto as Articulo, DF.Cantidad, DF.Subtotal, DF.Descuento, DF.Total
	from DetalleFactura DF, Cliente Cl, Producto Pr, Factura F
	Where F.IdFactura=DF.IdFactura and Pr.IdProducto = DF.IdProducto and Cl.IdCliente = F.IdCliente;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerDetallePedidoPorIdPedido]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDetallePedidoPorIdPedido] 
@IdPedido  as bigint
AS
BEGIN
	Select * from DetallePedido where IdPedido=@IdPedido;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerDetallePedidoPorIdProducto]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerDetallePedidoPorIdProducto]
@IdProducto as bigint
AS
BEGIN
	select * from DetallePedido where IdProducto= @IdProducto;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerEmpleadoPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEmpleadoPorId] 
@IdEmpleado as bigint

AS
BEGIN
	Select * from Empleado where IdEmpleado=@IdEmpleado;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerEmpleadoPorNombre]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEmpleadoPorNombre] 
@NombreE as varchar(50)

AS
BEGIN
Select * from Empleado where NombreE=@NombreE;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerFacturaPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerFacturaPorId]
@IdFactura as bigint
AS
BEGIN
	Select * from Factura where IdFactura=@IdFactura;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerPedidoPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerPedidoPorId]
@IdPedido as bigint
AS
BEGIN
	Select * from Pedido where IdPedido=@IdPedido;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerPedidoPorIdCliente]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPedidoPorIdCliente] 
@IdCliente as bigint
AS
BEGIN
	Select * from Pedido where IdCliente=@IdCliente;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductoPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductoPorId]
@IdProducto as bigint
AS
BEGIN
Select P.IdProducto,
	P.NombreProducto,
	P.Descripcion,
	P.PrecioUnitario,
	P.Stock,
	P.Image,
	C.Material
	 from Producto as P, Categoria as C
	 where P.IdCategoria= C.IdCategoria and IdProducto LIKE '%' + @IdProducto+ '%';
	
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductoPorNombre]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductoPorNombre] 
@NombreProducto as varchar(50)
AS
BEGIN
	Select P.IdProducto,
	P.NombreProducto,
	P.Descripcion,
	P.PrecioUnitario,
	P.Stock,
	P.Image,
	C.Material
	 from Producto as P, Categoria as C
	 where P.IdCategoria= C.IdCategoria and NombreProducto LIKE '%' + @NombreProducto+ '%';
END




GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodasFacturas]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodasFacturas] 

AS
BEGIN
	Select * from Factura;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodasVentas]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodasVentas] 

AS
BEGIN
	Select * from Venta;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodoCategoria]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodoCategoria]
AS
BEGIN
	Select*from Categoria;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodoConfirmacionDePago]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodoConfirmacionDePago] 
AS
BEGIN
	select * from ConfirmacionDePago;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosClientes]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosClientes] 

AS
BEGIN
	Select * from Cliente;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosDetalleFactura]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosDetalleFactura]

AS
BEGIN
	Select*from DetalleFactura;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosDetallePedidos]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosDetallePedidos] 

AS
BEGIN
	Select * from DetallePedido;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosEmpleados]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosEmpleados] 

AS
BEGIN
	Select * from Empleado;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosPedidos]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosPedidos] 

AS
BEGIN
	Select P.IdPedido, P.FechaPedido, P.FechaEnvio, C.NombreC, E.NombreE
	 From Pedido as P, Cliente as C, Empleado as E
	 where P.IdCliente= C.IdCliente and P.IdEmpleado= E.IdEmpleado;
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosProductos]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosProductos] 

AS
BEGIN
	select
	P.IdProducto,
	P.NombreProducto,
	P.Descripcion,
	P.PrecioUnitario,
	P.Stock,
	P.Image,
	C.Material
	from Producto as P, Categoria as C
	where P.IdCategoria= C.IdCategoria;
	
END



GO
/****** Object:  StoredProcedure [dbo].[ObtenerTodosUsuario]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTodosUsuario]

AS
BEGIN
	Select * from Usuario;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorId]
@IdUsuario as bigint
AS
BEGIN
	Select * from Usuario where IdUsuario = @IdUsuario;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorNombre]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorNombre]
@Nombre as varchar(50)
AS
BEGIN
	Select * from Usuario where Nombre = @Nombre;
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerVentaPorId]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerVentaPorId]
@IdVenta as bigint
AS
BEGIN
	Select * from venta where IdVenta=@IdVenta;
END


GO
/****** Object:  StoredProcedure [dbo].[ZDesencriptarPassWord]    Script Date: 08/03/2017 11:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in

CREATE PROCEDURE [dbo].[ZDesencriptarPassWord]
@IdUsuario as bigint
AS
BEGIN
select UserName,dbo.DesenCripta(PassWord)from Usuario where IdUsuario=@IdUsuario;
	
END



GO
USE [master]
GO
ALTER DATABASE [NuevaMaster] SET  READ_WRITE 
GO
