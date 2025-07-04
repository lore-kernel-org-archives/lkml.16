Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2114.outbound.protection.outlook.com [40.107.116.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32061D6193;
	Fri,  4 Jul 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640294; cv=fail; b=luGpojPqS7lDQyc3MNokjULcN6sUBzNMSxigUosIAu7lWnGz13kp1VStlGl7G8i0N5/zllARN0b3qbB7xJkncZ0PuhRjfTOlqxUmsQmfSpSugwgiOThzhoV36jsM8w5tns7B2Z7wVOmQX0eMK60Qj8n6+uruEDyJ8NNLO1xcjKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640294; c=relaxed/simple;
	bh=dKzjNFexT34QJSXxWyR0FSZ5ANjr8k2GZ/trLgG1FSE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zhoek09aI4Q1MMx/1SCGShI7tqv07uD5391jh8JP3J+xd0W7sEmg8Iin6QabYBaRtZa8tyByo3ZcylttMOb6xiM5lMMdjyYV/SVLb5XWZd9Tq7cDuodz3isZGM9zWNkCMw2YqPr9V6+57k3l/IvqpCbN2uKpdk5jlJ+bnGc0g6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com; spf=pass smtp.mailfrom=ndigital.com; dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b=jdi7JJzl; arc=fail smtp.client-ip=40.107.116.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b="jdi7JJzl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4ODXhv8dDS3u2y6Og36u1TCGOjlyvZALLxIJ0EsEZ0m38teKeYbxYApmOv3jjsYCvwGZR0wvokxxbaM4QJd3YOz8/0aZgbgjyEqTg4RaH6Xm5q3lPyjcLH7UQ3BEOzpvlxNMVki4uyyylbw+ae1Xo7yzbByTFmLfk3lFnZU+bKS1lk1M4AJePoyCI8hrWiUOTHjAvcefNHOI8qSR9fEmIHNCh0S3hvqAMRPjbW2OsnRaviVPp9ItXxKCydr3HHFmPb/YZOypLzaieupQbGnsIU7LXfm/BNeV1afTV0Y4pAmxFPuMtvwSASLjN7RbBMD1HG4vggRKcyelEEMuLdtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7p70bH6Wzyai1bOKI84CZmo+1ypRPwSlYCQfUXh/ReU=;
 b=Lu0z4Pe5ZKQMFMh2O+vMDRmv81sxzzIZMjEi5N58aZa+z2cmRppz1hVuV6jcpc/K4bfOpwOf6NbeG851OsuAameTkM1LLXaf+NFKneMbu7q3cpisJ+/nN8n/rt4E0ox28oJbsGsL5fOhiJHQhEjho/XhoQkxgyPTRHKmXOQlClTnl3AnBLaqmlvBAGNU9WOaQFXkbK/pU+2Ave6qXFnlf8nW9+rNnefWd6esuxpQl2ypVq/HWy0+WNvwgQuLfxMvXG4roZJBvUDaObG9w/7SC2fPa5VmS+ESvqrLkr9LRWgA8WyOkDAxiojt3W0mzI2ky7oyxhGa3UCbgGCTycX/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ndigital.com; dmarc=pass action=none header.from=ndigital.com;
 dkim=pass header.d=ndigital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ndigital.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7p70bH6Wzyai1bOKI84CZmo+1ypRPwSlYCQfUXh/ReU=;
 b=jdi7JJzl+kIcoIjU7f2mH9+6j8j/qjJJACjaqAV9vxU/Yba/v3IGoBeW1aq8XFUyl4ORQzoTcZv30mlQjBEzvuqFreAvmQFMW0zZ+yMrNg0fcH7vRaQx74/ShA0A+WdltWcmWCy6rkaUM2wgI83U/aBuugdAsyqeME7cLS95KDhnsvyedUfUO+cxRThv6s5VtMBQl4NrRGS2TBXQIorche/3btfzOysJ6aRVx4w8hmiLmptSkY34ItUWJq2NQ8QMFTzs9G2NH6ldY2DSwop2VqLIZz0RwwwBSOrmFN3R+yRdp8ZK79BDLOQZ5acd7uajihQIrqsO8VcqX2DlOVa7bQ==
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::5)
 by YT1PPF884096D71.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::55d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 14:44:48 +0000
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3]) by YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 14:44:47 +0000
From: Ryan Mann <rmann@ndigital.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"johan@kernel.org" <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] NDI FTDI USB driver support
Thread-Topic: [PATCH] NDI FTDI USB driver support
Thread-Index: AdvsUo3AZSEQGa88Q3O7CZcXksmAVAAn42cQ
Date: Fri, 4 Jul 2025 14:44:46 +0000
Message-ID:
 <YQXPR01MB49879486E5B552D1B0A0E5F6DF42A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
References:
 <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To:
 <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ndigital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQXPR01MB4987:EE_|YT1PPF884096D71:EE_
x-ms-office365-filtering-correlation-id: a8bda0a6-213a-4a40-ac67-08ddbb095297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?siyHdGCosJkVQjIGv3CxAtlTcww2opXXSNL8sN4AJheLVsrQiGSLneyvrkVO?=
 =?us-ascii?Q?Z7kaAkWsTO7zGWQfFmWZ04BdjGU8rC+s7XqjnjRejzl2C/3Ec8dsFD0pFmm7?=
 =?us-ascii?Q?LPj9b6fFHPT5eiNE2slKJ4D2BS8D9IecijT6r6UGRCieVyD1Jgdj/Sz87VlL?=
 =?us-ascii?Q?tp4dvwLl3Ep89WQWO5zL6qboKa0ABiy5CB4Djco7fh4c4Z/EgkP+LYEdzeCF?=
 =?us-ascii?Q?w6I797o2oNFYrR0xGZaOTrwROtuT+I42sFDLdnAUIOusdm74W+bjoHEQT2Pb?=
 =?us-ascii?Q?63Zm9SqwatFmozZDCY+rG+41L5/0vw4I81YyJ5qB/CKJEIBWG68KEFkXdSp5?=
 =?us-ascii?Q?ktfEl7+7Dn6HNt9LPExjgqCkAMDAxGcbR3iVvVuasVLr1T58HHFXlHVMCds9?=
 =?us-ascii?Q?C+d9GICSxMbs2C7CqAMtfPz48mzFGVeRLQf5DnWv9kD3fpYxtjACHVZO9j2K?=
 =?us-ascii?Q?kMCCgJbL7TIcRRjLZGOKQaqGTlwlXwqRfo6EfenxGV1Co63/V9QMFp43CWp8?=
 =?us-ascii?Q?9vaJhMB4be8uDf+K+9xK0B9xfFYG2tBCcC0yaNudqMo15qeEXpTciR6Hcdtk?=
 =?us-ascii?Q?Z/OPrVucHnsHQhZK7D1E3DZS8i4y2SBwSDJ6uM/JWx3XwR0VElnLCrZuluIX?=
 =?us-ascii?Q?0TcUhr8axg3nqdOQsAQ0Ks09FQRI+qWxqupC+7gD7g+eZ77Y6AZ/IcC+lJDg?=
 =?us-ascii?Q?usZsHzAArcHLUkIhzr3bKB9Je/8lceMkMOVFY1N+3RFMI7vWRiBAbSfU5qge?=
 =?us-ascii?Q?nRH0Ic0Dj6pBV4FnaFqpSSHR2pXyI0+0Ck/n6wbAd2FrnX4dAFBkTK6kNKzX?=
 =?us-ascii?Q?g09MerZ5Rxkwa6PdXfmtLRMOWh9VWKs+qOcfQy2V+EkWRq+5DiGajWZ/LVe2?=
 =?us-ascii?Q?hyVqxu47A0sp4Z5NVRucIiwsom4FIVqlSs3uF43W3AtVmQ9Q60CriCtw7axW?=
 =?us-ascii?Q?1mjQnaWGaF62x/1v3gV7o2k+i0RqOlbwKowrkHU3DvA8qXxbtXGwL8tOmDhR?=
 =?us-ascii?Q?zL1sUonT3UkoCnuUXhuS19pce0ZBB5wUhElFb5ww7T9xnnqmDLe+TgwnwcT3?=
 =?us-ascii?Q?ERqJnblVaU0zatDFPy5klJ2g3MSk6jRWYNJGDV1r98OS3uUfdTTuKhw2y/CU?=
 =?us-ascii?Q?N0B2K7QxgI5lHjS/uDf1IuIFzBRScgyIHJ5Gzh2H3B7Wzx9prgh+k1Oa1mGu?=
 =?us-ascii?Q?YAU4oZ0X/zf4tGI4Uz37ChUV2kreWzk6JajgadjmYC5/HSkOPI+dtQf6q8a7?=
 =?us-ascii?Q?t798pHz/mk+ndI/0xxb8k86tRP2xcZtPsP3Uw1iDO5tVMSA2inIrrUx+ikZ1?=
 =?us-ascii?Q?dZu0WyoOT1OXyb+a0w8nbdt0O4+3bdICtH9/nl8YvsdaYS5dmOZa0vwY7FOR?=
 =?us-ascii?Q?deZ8IRsJVNCC4AZbrW/U1EsIJaXKggUKLWvSctnnLcpFXxn7+KmKSYl0JQsC?=
 =?us-ascii?Q?ZEfED2eptgw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aoICRKYt+lyIRkaw2U8yQp/kww5IIske4HkeOH15ESuxVPRX4lsDwXGbvcBK?=
 =?us-ascii?Q?41SuzKAIM75/gjzmjvw1U+FDu1lpx7NeJlBwvApzutOGry2gio/aF+uCHCvQ?=
 =?us-ascii?Q?+MmhELh3UiStDotRl7FuFQxkjBykqbvR520L/txPY9DJbjLUmARfDEXGDi9U?=
 =?us-ascii?Q?3GJb7asGTvpWXgXVNFh+7IyjoW1qc2zr5CTxMnaft9WL9drTLvRciTKnq5zX?=
 =?us-ascii?Q?wJkk1g4dX10cKeWFAZ8OHSP8JjPcxjl7UsuHQ8PQc03LOpH3IS3x9toGwxAy?=
 =?us-ascii?Q?YHqfPBbtOpECIhCLa+JDQ3wgl3FLewJ5bhjeJpPWFtwpl7k29+n9N2rqCBw2?=
 =?us-ascii?Q?/yr0pKEag7yg0uXZT/tf5lAc5nmUj2TRHGcCLGA+HK0bzYonKQBLEUi7ydk6?=
 =?us-ascii?Q?ZnwX6fQpfp/muVZeXqrEJ7tYA4WSJcTtQ4IcRMrxNMwaFbrObaaeE/sFOQvy?=
 =?us-ascii?Q?1eoqvTHyp79B+CLDmlt1YkRE7cBgb8u+wQ4Aad6bpMKFl76MKJQXZn+EbNXf?=
 =?us-ascii?Q?r0UZfCLPTOFXvmWH6DbwxKJ0rxtaXfcpQnORlbD6cOwmIHQ+taoU2WHX2pX0?=
 =?us-ascii?Q?yQRxaTj0+RHXdaj5raGpZGD+LcRSVWJnMeMcCI/KeawYAvfCP0wbkVlwOO1q?=
 =?us-ascii?Q?4CDDfEvDOzPQiIQgvWIZ01a6giliW5w+i2XZaDMW45geMIvZMGsi7Fxx5+j1?=
 =?us-ascii?Q?dmEzI49SyBa24ZsdbuNy24CrVbVzVLUQBG1mSjmWGpw3J6MIXcpt6rnM8eKc?=
 =?us-ascii?Q?/ZbKTm7fv0O0ZSGoNK03mE7oW2o2+eSaJk6gBr6+hQv1rxRGF4u689zjG37V?=
 =?us-ascii?Q?bP19JjZqiobTXJ/5X26YDpWxumviA0G9JKoFlGR7Y55XKeeUr31Lt1/DLabs?=
 =?us-ascii?Q?XtPjfQd4O2rM46UMsFMw90L9aoVrXH5gL6i68GV4McojiLoT5IRbEFu2eE/+?=
 =?us-ascii?Q?Y3zXN1x1cvRUyfZloOrn2sJjSI6DO/BoCz7dVBT45NOBXZfgfRRhdW4efEs9?=
 =?us-ascii?Q?AT4DEillHsJg3Ly26FMBmCXeBoBBx53/bBFjUJBTm5JdARIJWgo9uTW1PEJ3?=
 =?us-ascii?Q?j9K9/mhyknwp2drX0W022eK/lWOcHGtNoQd44cFfFnkLzMz/SeG1q9r5MQui?=
 =?us-ascii?Q?8/eBiB4KxdA2d6iRc+nLiJA88vEDruHvlikdYSSf00PdjevcxC0mgF3BVpp6?=
 =?us-ascii?Q?xG2Zj93wv6rKTzuSAjA+/HoU34OefVwQbWTt8gqou+p/GSAuooY8XAlhe78b?=
 =?us-ascii?Q?VqIkvxQkdvzUIGLB7p4yX3EY5GiYzO77VSwALpe/5PkiAy3iXEgj5g76wVWG?=
 =?us-ascii?Q?/n8vLiybb3tOv08BAwQ0E0AKcrV5gU6r2ub62p/DKI73yF7L1nRUiRKjC7Tz?=
 =?us-ascii?Q?c67VXSgrXYMXRZsBpaE7Nk4mg1EqwI4YSrXWayGEl4V1m6RQ960/aA2oxP/L?=
 =?us-ascii?Q?tHYHYKbdqm3Gc717I9cLPC8OmNCbvCQ3TppvYr7BPkMdAvr3pag8XkCYWbv2?=
 =?us-ascii?Q?SvVTdeSmTSg4GNpJe1qkm+WTgcTTujS0DYLocoeRXJqX4HrlRIcHIU3a0kQ8?=
 =?us-ascii?Q?1kF2P5okGHHJ6QqtfGYWnrjS1J0yBazPl7F87bNE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ndigital.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bda0a6-213a-4a40-ac67-08ddbb095297
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 14:44:47.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fd6f7980-6d04-4a6f-86bf-8f6d0297dd2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/H44bz0ud8gmb8BkcxtLH0yUt6GLi/VBAedu9ZN9QxIxuqqgHyoGgMCP+caUeuI9KjFJtQu4OigmCHckotdJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PPF884096D71

NDI (Northern Digital Inc.) is introducing a new product called the EMGUIDE=
 GEMINI that will use an FTDI chip for USB serial communications. The EMGUI=
DE GEMINI will support 1.2Mbaud the same as other NDI FTDI USB serial devic=
es, by mapping the 19200. It was noticed in making this change that the NDI=
 Aurora was included in this "quirk", but it does not support rates as high=
 as 1.2Mbaud, so it was replaced by the EMGUIDE.
This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header =
file. It also reserves PID 0x0003 for the EMGUIDE GEMINI. Finally, it adds =
this VID/PID combination to the USB_DEVICE list in the ftdi_sio.c.

Signed-off-by: Ryan Mann <rmann@ndigital.com>
---
 drivers/usb/serial/ftdi_sio.c     | 4 ++--
 drivers/usb/serial/ftdi_sio_ids.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6ac7a0a5cf07..e5d7cce83a72 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -801,8 +801,8 @@ static const struct usb_device_id id_table_combined[] =
=3D {
                .driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
        { USB_DEVICE(FTDI_VID, FTDI_NDI_FUTURE_3_PID),
                .driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
-       { USB_DEVICE(FTDI_VID, FTDI_NDI_AURORA_SCU_PID),
-               .driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+       { USB_DEVICE(NDI_VID, FTDI_NDI_EMGUIDE_GEMINI_PID),
+         .driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
        { USB_DEVICE(TELLDUS_VID, TELLDUS_TELLSTICK_PID) },
        { USB_DEVICE(NOVITUS_VID, NOVITUS_BONO_E_PID) },
        { USB_DEVICE(FTDI_VID, RTSYSTEMS_USB_VX8_PID) },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 9acb6f837327..0cb33d257973 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -203,6 +203,8 @@
 #define FTDI_NDI_FUTURE_2_PID          0xDA72  /* NDI future device #2 */
 #define FTDI_NDI_FUTURE_3_PID          0xDA73  /* NDI future device #3 */
 #define FTDI_NDI_AURORA_SCU_PID                0xDA74  /* NDI Aurora SCU *=
/
+#define FTDI_NDI_VID                   0x23F2  /* NDI Vendor ID */
+#define FTDI_NDI_EMGUIDE_GEMINI_PID    0x0003  /* NDI Emguide Gemini */

 /*
  * ChamSys Limited (www.chamsys.co.uk) USB wing/interface product IDs
--
2.43.0

-----Original Message-----
From: Ryan Mann=20
Sent: Thursday, July 3, 2025 3:52 PM
To: gregkh@linuxfoundation.org; johan@kernel.org
Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] NDI FTDI USB driver support

From: Ryan Mann <rmann@ndigital.com>
This represents changes to the FTDI USB serial device drivers to support a =
new NDI (Northern Digital Inc.) product called the EMGUIDE GEMINI. The EMGU=
IDE GEMINI will support 1.2Mbaud the same as other NDI FTDI virtual COM por=
t devices. It was noticed in making this change that the NDI Aurora was inc=
luded in this "quirk", but it does not support rates as high as 1.2Mbaud, s=
o it was replaced by the EMGUIDE.
Previous FTDI devices produced by NDI all used the FTDI VID (0x0403) and a =
very limited set of PIDs that Future Technology Devices allowed NDI to use =
(0xda70 to 0xda74). Since then, NDI has reserved its own VID (0x23f2), and =
used two of the PIDs for two experimental, non-production products that did=
n't use the FTDI chip for USB connection.
This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header =
file. It also reserves PID 0x0003 for the EMGUIDE GEMINI, as well as stubbi=
ng out PIDs 0x0004 through 0x0009 for "future" NDI devices. In the unlikely=
 event that the NDI hardware team chooses to implement the USB functionalit=
y using something other than FTDI chips, those "future device" lines may ne=
ed to get removed.
As the EMGUIDE GEMINI product development has not been completed and the st=
ep to write over the default VID and PID has not been completed, these code=
 changes have not been tested with an EMGUIDE GEMINI. However, the code cha=
nges were compiled successfully using Ubuntu 24.04 locally and tested as a =
module using an NDI Aurora system.

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) i=
s
            maintained indefinitely and may be redistributed consistent wit=
h
            this project or the open source license(s) involved.

Signed-off-by: Ryan Mann <rmann@ndigital.com>
---
 drivers/usb/serial/ftdi_sio.c     | 16 +++++++++++++++-
 drivers/usb/serial/ftdi_sio_ids.h | 16 ++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c =
index 6ac7a0a5cf07..a41a9ed7e946 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -803,6 +803,20 @@ static const struct usb_device_id id_table_combined[] =
=3D {
 		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_NDI_AURORA_SCU_PID),
 		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_EMGUIDE_GEMINI_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_4_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_5_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_6_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_7_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_8_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_9_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
 	{ USB_DEVICE(TELLDUS_VID, TELLDUS_TELLSTICK_PID) },
 	{ USB_DEVICE(NOVITUS_VID, NOVITUS_BONO_E_PID) },
 	{ USB_DEVICE(FTDI_VID, RTSYSTEMS_USB_VX8_PID) }, @@ -1333,7 +1347,7 @@ st=
atic u32 get_ftdi_divisor(struct tty_struct *tty,
 			     (product_id =3D=3D FTDI_NDI_SPECTRA_SCU_PID)	||
 			     (product_id =3D=3D FTDI_NDI_FUTURE_2_PID)	||
 			     (product_id =3D=3D FTDI_NDI_FUTURE_3_PID)	||
-			     (product_id =3D=3D FTDI_NDI_AURORA_SCU_PID))	&&
+			     (product_id =3D=3D FTDI_NDI_EMGUIDE_GEMINI_PID)) &&
 			    (baud =3D=3D 19200)) {
 				baud =3D 1200000;
 			}
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 9acb6f837327..6e162a73f64c 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -197,13 +197,29 @@
=20
 /*
  * NDI (www.ndigital.com) product ids
+ * Almost all of these devices use FTDI's VID (0x0403).
+ * Newer devices use NDI Vendor ID
  */
+/* Using DA70 to DA74 block of FTDI VID (0x0403 ) */
 #define FTDI_NDI_HUC_PID		0xDA70	/* NDI Host USB Converter */
 #define FTDI_NDI_SPECTRA_SCU_PID	0xDA71	/* NDI Spectra SCU */
 #define FTDI_NDI_FUTURE_2_PID		0xDA72	/* NDI future device #2 */
 #define FTDI_NDI_FUTURE_3_PID		0xDA73	/* NDI future device #3 */
 #define FTDI_NDI_AURORA_SCU_PID		0xDA74	/* NDI Aurora SCU */
=20
+#define FTDI_NDI_VID 0x23F2 /* NDI Vendor ID */
+/*
+ * VID 0x23F2 PIDs 0x0001 and 0x0002 were used for products that do not=20
+use FTDI
+ * The following NDI devices use NDI VID  */
+#define FTDI_NDI_EMGUIDE_GEMINI_PID	0x0003  /* NDI Emguide Gemini */
+#define FTDI_NDI_FUTURE_4_PID		0x0004 /* NDI future device #4 */
+#define FTDI_NDI_FUTURE_5_PID		0x0005 /* NDI future device #5 */
+#define FTDI_NDI_FUTURE_6_PID		0x0006 /* NDI future device #6 */
+#define FTDI_NDI_FUTURE_7_PID		0x0007 /* NDI future device #7 */
+#define FTDI_NDI_FUTURE_8_PID		0x0008 /* NDI future device #8 */
+#define FTDI_NDI_FUTURE_9_PID		0x0009 /* NDI future device #9 */
+
 /*
  * ChamSys Limited (www.chamsys.co.uk) USB wing/interface product IDs
  */
--=20
