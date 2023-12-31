USE [master] 
GO
/****** Object:  Database [shoppicaDB]    Script Date: 12.03.2022 20:27:59 ******/
CREATE DATABASE [shoppicaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoppicaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shoppicaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoppicaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shoppicaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shoppicaDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoppicaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoppicaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoppicaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoppicaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoppicaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoppicaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoppicaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [shoppicaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoppicaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoppicaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoppicaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoppicaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoppicaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoppicaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoppicaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoppicaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shoppicaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoppicaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoppicaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoppicaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoppicaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoppicaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoppicaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoppicaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoppicaDB] SET  MULTI_USER 
GO
ALTER DATABASE [shoppicaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoppicaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoppicaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoppicaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoppicaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoppicaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shoppicaDB] SET QUERY_STORE = OFF
GO
USE [shoppicaDB]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12.03.2022 23:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12.03.2022 23:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[TopID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12.03.2022 23:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitPrice] [money] NULL,
	[Discount] [money] NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Image] [nvarchar](50) NULL,
	[ImageCount] [int] NULL,
	[Description] [text] NULL,
	[IsSpecial] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 12.03.2022 23:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.03.2022 23:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Password] [nchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1, N'Adidas')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (2, N'Samsung')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (3, N'Apple')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (4, N'Nike')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (5, N'Lacoste')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (6, N'Hugo Boss')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (7, N'Reebok')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (8, N'Sony')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (9, N'Korkmaz')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (10, N'Arçelik')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (11, N'Kütahya Porselen')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (12, N'Tefal')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (13, N'Hisar')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (14, N'Seramiksan')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (15, N'Vivence')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (16, N'Bellona')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (17, N'Alfemo')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (18, N'D&R')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (19, N'Kitapsan')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (20, N'Eyfel')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (21, N'Swatch')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (22, N'Mavi')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (23, N'Koton')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (24, N'Mango')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (25, N'LCW')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (26, N'Şölen')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (27, N'Haribo')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (28, N'Coco-Cola')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (29, N'Niğde Gazoz')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (30, N'Huzur Gazoz')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (31, N'Karspersky')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (32, N'Norton')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (33, N'Zen')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (34, N'Atasay')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (35, N'Koçak')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (36, N'Kemal Tanca')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (37, N'US Polo')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (38, N'Beymen')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (39, N'Deichmann')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (40, N'Boyner')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (41, N'Kids')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1036, N'Wyze Labs')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1037, N'Epson')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1038, N'Soulcker')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1039, N'Logitech')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1040, N'İpek')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1041, N'Aqua')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1042, N'Alban')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1043, N'Octamed')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1044, N'Acura')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1050, N'Burbery')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1051, N'Datto')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1052, N'Çiçek Sepeti')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (1, N'Elektronik', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (2, N'Bilgisayar', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (3, N'Giyim', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (4, N'Ayakkabı', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (5, N'Hediyelik', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (6, N'Ev Dekorasyon', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (7, N'Sağlık', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (8, N'Mücevher', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (9, N'Kitap', NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (10, N'Dijital Kamera', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (11, N'Ev Sinema Sistemi', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (12, N'Mp3Player', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (13, N'Ev Ses Sistemi', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (14, N'Cep Telefonu', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (15, N'Araba-Ses Sistemi', 1)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (16, N'Masaüstü PC', 2)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (17, N'Monitör', 2)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (18, N'Yazılım', 2)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (19, N'Dizüstü PC', 2)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (20, N'Donanım Birimleri', 2)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (21, N'Kadın Giyim', 3)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (22, N'Erkek Çocuk Giyim', 3)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (23, N'Bebek Giyim', 3)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (24, N'Erkek Giyim', 3)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (25, N'Kız Çocuk Giyim', 3)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (26, N'Kadın Ayakkabı', 4)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (27, N'Çocuk Ayakkabı', 4)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (28, N'Erkek Ayakkabı', 4)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (29, N'Spor Ayakkabı', 4)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (30, N'Parfüm', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (31, N'Şarap', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (32, N'Çikolata', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (33, N'Evcil Hayvan', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (34, N'Alkollü İçecek', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (35, N'Çiçek', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (36, N'Oyuncak-Oyun', 5)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (37, N'Mobilya', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (38, N'Araç-Gereç', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (39, N'Aksesuar', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (40, N'Yiyecek-İçecek', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (41, N'Bahçe', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (42, N'Mama', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (43, N'Işıklandırma', 6)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (44, N'Gıda Takviyesi', 7)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (45, N'Kişisel Bakım', 7)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (46, N'Kozmetik', 7)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (47, N'Kolye', 8)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (48, N'Bileklik', 8)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (49, N'Set', 8)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (50, N'Yüzük', 8)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (51, N'Küpe', 8)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (52, N'Fantastik', 9)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (53, N'Bilim-Kurgu', 9)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (54, N'Roman', 9)
INSERT [dbo].[Category] ([ID], [CategoryName], [TopID]) VALUES (55, N'Eğitim', 9)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (1, N'IPhone 8', 5000.0000, 4500.0000, 14, 3, CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'1.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (2, N'Mp3Player', 600.0000, 600.0000, 12, 2, CAST(N'2021-09-05T00:00:00.000' AS DateTime), N'2.jpg', 0, N'Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli ''buraya metin gelecek, buraya metin gelecek'' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (3, N'Sony Laptop', 2850.0000, 2500.0000, 19, 8, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'3.jpg', 0, N'Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia''daki Hampden-Sydney College''dan Latince profesörü Richard McClintock', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (4, N'Samsung Laptop', 6500.0000, 6500.0000, 19, 2, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'4.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (5, N'Kaspersky Antivirüs', 120.0000, 100.0000, 18, 31, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'5.jpg', 0, N'Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan ''consectetur'' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan "de Finibus Bonorum et Malorum" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan "Lorem ipsum dolor sit amet" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (6, N'Norton Security', 150.0000, 150.0000, 18, 32, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'6.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (7, N'Lacoste Essential', 350.0000, 350.0000, 30, 5, CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'7.jpg', 0, N'Ut quam dui, mattis non convallis quis, dictum in mi. Cras id dui eros. Vivamus consequat eros eu nulla molestie volutpat. Donec vehicula ullamcorper leo, at bibendum sapien auctor quis. Maecenas pharetra tempus erat id volutpat. Etiam rhoncus nisi vel nulla viverra, sit amet porttitor lorem auctor. Proin egestas gravida accumsan. Aenean vestibulum risus ac sem tempor cursus. Integer non fermentum elit. Morbi scelerisque mi et volutpat facilisis. Maecenas accumsan, ante congue finibus fringilla, sem arcu mattis est, at tempus ex massa sed mauris. Pellentesque condimentum ornare tellus a porta.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (8, N'Nike AirMax', 250.0000, 249.0000, 29, 4, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'8.jpg', 0, N'Vivamus vehicula, velit nec condimentum pretium, nisl massa eleifend odio, sed elementum urna tellus id leo. Vestibulum fermentum nulla sed tellus semper, eget mollis nibh rhoncus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc vitae efficitur dui. Ut placerat vitae libero quis blandit. Aenean non neque vel lacus euismod feugiat et et neque. Suspendisse quis arcu ac felis aliquam accumsan. Sed quis dolor nunc. Aliquam id aliquet nibh, eget posuere est. Duis aliquam ex quam, sed consectetur justo porta sed. Morbi congue ipsum ipsum, at interdum ipsum euismod vel.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (9, N'Bebek Arabası', 600.0000, 550.0000, 23, 25, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'9.jpg', 0, N'Morbi interdum elementum dapibus. Fusce id risus sollicitudin, fermentum libero nec, porttitor mauris. Morbi accumsan mattis tortor, eget laoreet magna efficitur in. Aliquam at velit hendrerit, efficitur neque id, placerat augue. Etiam tristique fermentum nisi vitae accumsan. Phasellus efficitur erat id lacinia tempor. Maecenas auctor sit amet eros vel sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (10, N'Nutuk', 100.0000, 100.0000, 55, 19, CAST(N'2021-09-06T00:00:00.000' AS DateTime), N'10.jpg', 0, N'Maecenas dapibus, ex et iaculis rutrum, justo arcu faucibus arcu, non ultrices eros libero in ligula. Suspendisse in imperdiet libero. Fusce non laoreet mauris, laoreet euismod purus. Sed ut mi eros. Donec lacinia vitae turpis eu interdum. Sed porta finibus dui, a ultricies lorem efficitur vel. Nunc non lorem suscipit, commodo purus vel, efficitur elit. Vestibulum ultricies, diam ut aliquet ornare, mauris sapien commodo orci, quis ullamcorper augue est vitae nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis turpis felis, lobortis ac interdum sed, vulputate ut nulla. Quisque massa mauris, interdum sit amet blandit ut, commodo non arcu. Suspendisse potenti. Integer laoreet pharetra ex, at congue elit ornare lobortis. Suspendisse potenti.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (11, N'Oturma Odası', 12000.0000, 10000.0000, 37, 16, CAST(N'2021-09-23T00:00:00.000' AS DateTime), N'11.jpg', 0, N'Nulla turpis dolor, vehicula vel volutpat sed, tempor congue massa. Ut sed pretium arcu. Nam posuere lacinia ex vel tincidunt. Vestibulum vestibulum placerat elit quis elementum. Suspendisse potenti. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam at sem eget urna efficitur suscipit. Proin venenatis diam risus, ac facilisis est rutrum eu. Nam fringilla, nunc et bibendum congue, eros urna ultricies est, a volutpat metus purus eget turpis.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (12, N'Bahçe Grubu', 8000.0000, 5000.0000, 41, 17, CAST(N'2020-01-02T00:00:00.000' AS DateTime), N'12.jpg', 0, N'Mauris luctus id magna sed facilisis. Nunc efficitur euismod ipsum non malesuada. Nam in lectus nisl. Praesent fringilla, urna a commodo lobortis, velit urna vestibulum dui, vitae tempor urna quam vel metus. Maecenas viverra massa sed mi auctor, lacinia auctor sapien sollicitudin. Mauris bibendum, purus at tristique eleifend, dui quam cursus eros, sit amet pharetra ipsum metus vel lectus. Donec ac laoreet sem.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (13, N'Zen Pırlanta Set', 20000.0000, 20000.0000, 49, 33, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'13.jpg', 0, N'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse mollis non libero nec cursus. Morbi a mauris vitae eros feugiat suscipit sed a enim. Donec tristique suscipit ligula ut facilisis. Nullam viverra id mi id mattis. Sed urna justo, faucibus congue iaculis eu, rhoncus vitae enim. Nullam ultricies justo quis massa aliquet vestibulum. Cras sit amet risus consectetur, sollicitudin nulla vel, aliquet neque. Mauris et elit nulla. Maecenas sit amet nulla tincidunt, cursus felis eget, vulputate quam.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (14, N'Koçak Yüzük', 3000.0000, 2500.0000, 50, 35, CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'14.jpg', 0, N'In porta orci quis magna congue volutpat. Sed ultrices facilisis risus, vitae convallis metus euismod ac. Maecenas magna elit, commodo vel odio quis, consequat facilisis est. Maecenas rhoncus convallis libero, ut tempus ligula ullamcorper in. Cras in tincidunt lectus. Sed et mauris at erat dignissim bibendum eu condimentum massa. Sed posuere, metus in elementum auctor, lectus dui dictum leo, vel vehicula dui diam vitae quam. Aliquam bibendum sagittis varius. Nulla metus erat, facilisis quis porttitor nec, porta sit amet massa. Aenean eu nisi cursus, tincidunt quam et, pharetra erat. Nunc id arcu vel turpis condimentum vehicula. In ac nulla ornare, suscipit metus nec, gravida tortor. Cras non ligula et ex vestibulum venenatis a eu lorem. Pellentesque sit amet eleifend eros. Pellentesque quis vehicula felis, sed vestibulum eros.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (15, N'Atasay Bileklik', 2000.0000, 2000.0000, 48, 34, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'15.jpg', 0, N'Suspendisse potenti. Pellentesque vel lacus sapien. Maecenas hendrerit, ante at vehicula placerat, mi nisi accumsan dui, ac dictum metus massa ultrices lacus. Vivamus volutpat posuere turpis a placerat. Ut sodales, arcu ut ultrices sagittis, nisl ligula consequat libero, id tristique quam metus non purus. Etiam ac ornare eros. In risus nisi, euismod ut feugiat vel, pellentesque et risus. Aenean malesuada nec arcu ac varius. Curabitur ipsum erat, auctor in condimentum nec, condimentum sed mauris. Vivamus dictum nisl turpis, vitae varius tortor pharetra vitae. Donec ultricies urna a risus gravida, sed suscipit erat laoreet. Donec eget accumsan ligula, quis ullamcorper est. Proin et venenatis est. Nam elit leo, pulvinar ac turpis at, cursus fringilla libero. Nullam malesuada nec magna non luctus. In eu quam viverra, malesuada dui ac, fringilla nulla.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (16, N'Addidas Kadın Spor Ayakkabısı', 150.0000, 150.0000, 29, 1, CAST(N'2020-11-09T00:00:00.000' AS DateTime), N'k1.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (24, N'Kemal Tanca Erkek Ayakkabısı', 250.0000, 200.0000, 28, 36, CAST(N'2021-05-06T00:00:00.000' AS DateTime), N'E1.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (25, N'Kids Çocuk Ayakkabısı', 150.0000, 150.0000, 27, 41, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'C1.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (26, N'Boyner Kadın Ayakkabısı', 200.0000, 200.0000, 26, 40, CAST(N'2020-11-09T00:00:00.000' AS DateTime), N'k3.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (27, N'US Polo Kadın Ayakkabısı', 250.0000, 250.0000, 26, 37, CAST(N'2020-12-07T00:00:00.000' AS DateTime), N'k5.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (28, N'Kadın Elbise', 250.0000, 199.0000, 21, 24, CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'kadin_elbise.jpg', 0, N'Morbi fringilla, dolor at maximus venenatis, urna eros eleifend metus, sit amet tincidunt diam nisl ac justo. Aenean a leo nec est tempor rutrum. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (29, N'Kadın Pantolon', 199.0000, 99.0000, 21, 24, CAST(N'2020-12-25T00:00:00.000' AS DateTime), N'kadin_pantolon.jpg', 0, N'Aenean at enim id enim blandit varius sed sit amet orci. Donec posuere consequat euismod. Aliquam at est id lorem dictum fringilla sed non nunc. In dignissim mauris id consequat laoreet. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (30, N'Erkek Gömlek', 130.0000, 130.0000, 24, 22, CAST(N'2021-09-14T00:00:00.000' AS DateTime), N'erkek_gomlek.jpg', 0, N'In velit nunc, imperdiet ultrices urna in, auctor dignissim lectus. Fusce scelerisque felis lorem, sit amet tristique urna hendrerit in. Sed eu porttitor enim, id feugiat mi.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (31, N'Erkek Çocuk Pantolon', 60.0000, 40.0000, 22, 25, CAST(N'2021-07-03T00:00:00.000' AS DateTime), N'erkekcocuk_pantolon.jpg', 0, N'Praesent pretium magna iaculis, ornare nulla sit amet, gravida sem. Pellentesque fringilla ipsum eu libero sollicitudin, sit amet blandit dui feugiat. Curabitur eget nulla non augue sodales fermentum eget pretium nisi. Curabitur quis purus quis libero imperdiet pretium sit amet a sapien.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (32, N'Kız Çocuk Elbise', 120.0000, 120.0000, 25, 25, CAST(N'2021-07-03T00:00:00.000' AS DateTime), N'kizcocuk_elbise.jpg', 0, N'Fusce tincidunt nisl volutpat risus volutpat, id pharetra enim malesuada. Curabitur ut placerat velit. Aenean aliquet diam vitae egestas suscipit. Integer rhoncus turpis non volutpat consectetur.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (33, N'Zen Zümrüt Yüzük', 4200.0000, 4200.0000, 50, 33, CAST(N'2019-07-14T00:00:00.000' AS DateTime), N'zen_yuzuk.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (34, N'Atasay Kolye', 9500.0000, 9000.0000, 47, 34, CAST(N'2021-05-14T00:00:00.000' AS DateTime), N'atasay_kolye.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (35, N'Koçak Bileklik', 5000.0000, 4850.0000, 48, 35, CAST(N'2020-12-09T00:00:00.000' AS DateTime), N'kocak_bileklik.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (36, N'Atasay Küpe', 2500.0000, 2500.0000, 51, 34, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'atasay_kupe.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (37, N'Zen Set', 7800.0000, 7500.0000, 49, 33, CAST(N'2021-06-16T00:00:00.000' AS DateTime), N'zen_set.jpg', 0, N'Praesent viverra nibh eget lacinia commodo. Nullam imperdiet, ante sed porta tincidunt, magna nulla semper mauris, non pellentesque ipsum ligula vel enim. Donec a pharetra odio. Cras enim eros, lobortis id maximus in, tristique non leo. Nullam quis risus eget massa aliquet mollis. Proin dapibus scelerisque fringilla. Sed luctus nisl et lectus pretium porta. Duis ultricies massa ac nunc aliquam, vel congue diam sodales. Morbi mattis mattis magna, vel ornare purus dignissim eget. Fusce faucibus consectetur molestie.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (39, N'Harry Potter(Set)', 169.0000, 169.0000, 52, 18, CAST(N'2020-08-20T00:00:00.000' AS DateTime), N'16.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (40, N'Otostopçunun Galaksi Rehberi', 120.0000, 100.0000, 53, 18, CAST(N'2020-06-30T00:00:00.000' AS DateTime), N'17.jpg', 0, N' Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960''larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (41, N'Yıldızlararası Bilimi', 180.0000, 180.0000, 53, 19, CAST(N'2020-04-06T00:00:00.000' AS DateTime), N'18.jpg', 0, N'Morbi interdum elementum dapibus. Fusce id risus sollicitudin, fermentum libero nec, porttitor mauris. Morbi accumsan mattis tortor, eget laoreet magna efficitur in. Aliquam at velit hendrerit, efficitur neque id, placerat augue. Etiam tristique fermentum nisi vitae accumsan. Phasellus efficitur erat id lacinia tempor. Maecenas auctor sit amet eros vel sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (42, N'Huzursuzluk', 27.9500, 26.0500, 54, 19, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'19.jpg', 0, N'Ut quam dui, mattis non convallis quis, dictum in mi. Cras id dui eros. Vivamus consequat eros eu nulla molestie volutpat. Donec vehicula ullamcorper leo, at bibendum sapien auctor quis. Maecenas pharetra tempus erat id volutpat. Etiam rhoncus nisi vel nulla viverra, sit amet porttitor lorem auctor. Proin egestas gravida accumsan. Aenean vestibulum risus ac sem tempor cursus. Integer non fermentum elit. Morbi scelerisque mi et volutpat facilisis. Maecenas accumsan, ante congue finibus fringilla, sem arcu mattis est, at tempus ex massa sed mauris. Pellentesque condimentum ornare tellus a porta.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (43, N'Bir Kedi, Bir Adam, Bir Ölüm', 59.9000, 59.9000, 54, 18, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'20.jpg', 0, N' Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960''larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (50, N'Kara Kitap', 35.0000, 25.0000, 52, 18, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'roman2.jpg', 0, N'Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (51, N'Beyaz Zambaklar Ülkesinde', 55.0000, 25.0000, 53, 19, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'eğitim.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (52, N'Fersah', 45.0000, 45.0000, 54, 18, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'bilimkurgu.jpg', 0, N'1500''lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (53, N'Madonna', 35.0000, 35.0000, 55, 18, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'roman.jpg', 0, N' Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (54, N'Muhteşem Yaratıklar', 25.0000, 25.0000, 52, 19, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'fantastik.jpg', 0, N'Ayrıca arama motorlarında ''lorem ipsum'' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (55, N'Vazo', 50.0000, 25.0000, 37, 11, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'vazo.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (56, N'Fener', 150.0000, 100.0000, 43, 15, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'metalfener.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (57, N'Lambader', 250.0000, 120.0000, 43, 16, CAST(N'2021-09-03T00:00:00.000' AS DateTime), N'lambader.jpg', 0, N'Bu üreteç, 200''den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (58, N'Ahşap Raf', 750.0000, 450.0000, 38, 15, CAST(N'2021-09-01T00:00:00.000' AS DateTime), N'raf.jpg', 0, N' Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (59, N'Dekoratif Resim', 880.0000, 850.0000, 39, 17, CAST(N'2021-07-06T00:00:00.000' AS DateTime), N'duvar.jpg', 0, N'but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (61, N'

Epson Ev Sinema Sistemi', 3800.0000, 3500.0000, 11, 1037, CAST(N'2021-05-04T00:00:00.000' AS DateTime), N'117.jpg', 0, N'Portable, bright and easy to use, the Home Cinema 1060 projector delivers larger-than-life Full HD entertainment at home. Get widescreen images up to 300" up to 25x larger than a 60" flat panel in 1080p. Easily connect Blu-ray Disc, gaming, streaming and MHL-enabled devices via 2x HDMI ports (1). Featuring 3,100 lumens of color/white brightness (2), the 1060 delivers vibrant images. And, get dynamic contrast up to 15,000:1, a built-in speaker, and setup tools. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (62, N'Samsung Galaxy A50', 1500.0000, 1500.0000, 14, 2, CAST(N'2021-09-24T00:00:00.000' AS DateTime), N'118.jpg', 0, N'The Samsung galaxy A50 is a complete device that provides for a onscreen fingerprint sensor along with the 6.4-inch (16.21 centimeters) super AMOLED - infinity u cut display, FHD+ resolution (2340 x 1080), 404 ppi with 16m colours and triple camera setup - 16mp (f1.9)+ 5mp (2.2) wide angle camera + 5mp (2.2) with flash and 25mp (f2.0) front facing camera. ', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (63, N'16GB MP3 Player', 250.0000, 225.0000, 12, 1038, CAST(N'2021-08-05T00:00:00.000' AS DateTime), N'119.jpg', 0, N'Multi-functional?This MP3 Player not only supports Bluetooth Connection, FM Radio, Voice Recording, Picture Browsing, Video Play, File browser and E-book reading (support txt format only),but also supports time screen-saver, one button to lock,A-B repeat. Built-in Pedometer Function, Perfect for Sport Running, Traveling.?Built-in speaker, you can enjoy music without headphones? ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (64, N'Ev Ses Sistemi', 1600.0000, 1399.0000, 13, 1039, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'120.jpg', 0, N'Logitech Surround Sound Speaker System Z906. Hear every detail, all around you - in theater-quality 5.1 sound. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (66, N'Kulak Pamuğu', 8.8000, 7.0000, 45, 1040, CAST(N'2021-09-26T00:00:00.000' AS DateTime), N'21.jpg', 0, N'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500''lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. ', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (67, N'Oksijenli Su', 6.0000, 5.0000, 46, 1041, CAST(N'2020-08-05T00:00:00.000' AS DateTime), N'22.jpg', 0, N'Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960''larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (68, N'Yara Bandı', 5.0000, 5.0000, 45, 1042, CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'23.jpg', 0, N'Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli ''buraya metin gelecek, buraya metin gelecek'' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. ', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (69, N'Esnek Fix Flaster', 10.0000, 8.0000, 46, 1043, CAST(N'2021-08-04T00:00:00.000' AS DateTime), N'24.jpg', 0, N'Ayrıca arama motorlarında ''lorem ipsum'' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (70, N'Koldan Ölçer Tansiyon Aleti', 99.0000, 80.0000, 45, 1044, CAST(N'2021-07-03T00:00:00.000' AS DateTime), N'25.jpg', 0, N'Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia''daki Hampden-Sydney College''dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan ''consectetur'' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır.', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (81, N'MyBurbery', 255.0000, 255.0000, 30, 1050, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'parfum1.jpg', 0, N'Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli ''buraya metin gelecek, buraya metin gelecek'' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında ''lorem ipsum'' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.', 0)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (84, N'Çikolata Dünyası', 120.0000, 100.0000, 32, 1051, CAST(N'2021-08-01T00:00:00.000' AS DateTime), N'cikolata-kutusu.jpg', 0, N'orm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan "de Finibus Bonorum et Malorum" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (85, N'Ayıcık', 250.0000, 220.0000, 36, 41, CAST(N'2021-07-02T00:00:00.000' AS DateTime), N'oyuncak.jpg', 0, N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse vitae tempus augue, non congue velit. Nunc porttitor, ex ac efficitur lobortis, erat dolor euismod leo, eu commodo nibh est ut nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur maximus vestibulum nibh tristique volutpat. Etiam laoreet leo quis rutrum ultrices. Cras eleifend lectus sed sapien aliquet dignissim. Nulla venenatis semper diam, eget rhoncus erat suscipit ac. Donec rhoncus viverra blandit. Curabitur luctus lorem in urna aliquet dapibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;', 1)
INSERT [dbo].[Product] ([ID], [ProductName], [UnitPrice], [Discount], [CategoryID], [BrandID], [CreatedDate], [Image], [ImageCount], [Description], [IsSpecial]) VALUES (86, N'Çiçek Bahçesi', 320.0000, 320.0000, 35, 1052, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'cicek.jpg', 0, N'Fusce nec rhoncus enim. Vivamus euismod volutpat ante, quis tincidunt eros imperdiet imperdiet. Morbi vel purus enim. Morbi urna metus, egestas ut consequat id, iaculis quis est. Ut tincidunt ipsum nec rutrum iaculis. Phasellus est odio, vestibulum quis lacus ut, maximus gravida nulla. Aenean vel elit imperdiet, iaculis arcu sit amet, fermentum nisl. Vestibulum ut mattis orci. Donec lobortis sapien urna, at condimentum ante dapibus at. Pellentesque faucibus non turpis a ultricies. Morbi molestie dui ante, a luctus felis rhoncus ac. Aenean pulvinar euismod dui, non varius odio semper at. Morbi a suscipit sapien. Morbi malesuada gravida sem, eu cursus quam rhoncus sed. Aliquam erat volutpat.', 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [Image], [ProductID]) VALUES (1, N'2.jpg', 1)
INSERT [dbo].[ProductImage] ([ID], [Image], [ProductID]) VALUES (2, N'3.jpg', 1)
INSERT [dbo].[ProductImage] ([ID], [Image], [ProductID]) VALUES (3, N'4.jpg', 1)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Mail], [Password]) VALUES (1, N'Ali Veli', N'ali@veli.com', N'123       ')
INSERT [dbo].[User] ([ID], [Name], [Mail], [Password]) VALUES (2, N'Cem', N'cem@ayaz.com', N'123       ')
INSERT [dbo].[User] ([ID], [Name], [Mail], [Password]) VALUES (3, N'eda', N'eda@erdem.com', N'123       ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([TopID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__BrandID__3D5E1FD2] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__BrandID__3D5E1FD2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__3E52440B] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__3E52440B]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
USE [master]
GO
ALTER DATABASE [shoppicaDB] SET  READ_WRITE 
GO
