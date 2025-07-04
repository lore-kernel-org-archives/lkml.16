Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2105.outbound.protection.outlook.com [40.107.116.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E02E371F;
	Fri,  4 Jul 2025 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649951; cv=fail; b=S+Yg4WEYQitVSwz70l44ZykvBJ6DY/H3yoP4TkNK0nmAmF29LFo5QXAQ6gkWVgg/qXElUVjUg2ycVRPjbTU4X4UoRje8o9YsDV9R2sdhrxcp32asXHtXDpiZ9b/HhTvKoAUSihMMfhCYqshatUcCHfy5W5UWGILTZTiooGmo+oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649951; c=relaxed/simple;
	bh=KQ+vCYU1bO4wTybg6zcD0Bt9KxDYrbIXcnC6yGW1398=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cif1GLdcbCSqJI+MwukvWBG51OY39BXU/DCnORZe26mFE+IY1SpDgP1PN61ypOAzYhocANnXlf3gxrjAL/W/hhvetAfDnCw4LuX/dOELmaz+kWkkLDdNrHnkR1fTsF/slGs9Y9xuvkamaw+kv25dvyPmg7VrB/3243wN8LWYXxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com; spf=pass smtp.mailfrom=ndigital.com; dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b=fJgGpJba; arc=fail smtp.client-ip=40.107.116.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b="fJgGpJba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdk+BOLsPjqsuQfFj32oUg84VGKLie4GdJiopn+VHKSRLRO86CYdzssKr6OLdzSvuPGkZ1rUrwUKz/ReUBmCAKIYB7pOD2feH1hE6gIhYdXlse9pIDXDRg7qBtw5WUIMCDJS1HBvf8oN7gtSXL77BK6cIa5I/fNzGH5UsAsAt5Gh+cpsntwKKHVfSv2B7pz1DG+1D2HzriKJSgwHIuFca6GSpbSvNy0gmQkw1CZ3hkorX824Leu8RjPEj8TGIPpBPqtRJpaB8vjGxbSgic/pgplps04zK+xWTpKiydig0cZ4bRLlD3VSznFMkXOsVRWvpMpkQr56o1+msd5ft6OAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgag2wVSOfbIwwbk88EI0EmflGJaR2yfXX3fblqI5AE=;
 b=Wv3+EK8iYX1uAfIk5WOJK3lNVPOQQFJjrwVefpSEAQ2J1+z4giIktvEqQVvoKRGbqip+o7S4b6Dfz5GCnNAOTVfy3vNSqPJrhaNAyQetKJzeDCMHqDyjDLP/6Ub2XGayALgw26W0BzArOIlRAHK94p4a2+VZUe+rSlb1w7Ep7aHj0IBpAFZy2FxOVZcR/jFEhD1dbpYnpJlfQ8YlVxj3rwViJUJTjXU1XldhI3cGmArbs4Jsa0HLVxGnjlKSWVxlrAnhqJNfYRA8mb6Kq5bFvaH08ps4nO6FB0+TGyWnbE7gLmnc+bSNKrFEcZEEM/JD+RAu/9DuZ8Y7yGDdFwqK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ndigital.com; dmarc=pass action=none header.from=ndigital.com;
 dkim=pass header.d=ndigital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ndigital.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgag2wVSOfbIwwbk88EI0EmflGJaR2yfXX3fblqI5AE=;
 b=fJgGpJbay1EeYTRfvsf2VVvHgjq+eU0yy6q0JF/A7Cg6rp0qu+EKCaUrPzCtkgkKWA0colJEX25efDkOcuQtEYafEF0XE+5BwZ6CpmHU5gWeNFlxKVNnRaPVxEoKUP/ksC7Dp/jqcVg7M2Zpj7leukP6t4lMuLb+tIy876WawVD3KTVpkkL7i200Ve0Sa3koBSJB++gF4ITaocz6H2q49To7iYkTaezMypq5gGfSwi7CAJjMqJUH2r2t1G6sHG1MNGtbsUNzBP32WSqCQaTqGGxaQCHhYzh3wlrUTReVOP0GcZCZWBsNjQkiAF1QSdY55d5t3Pw6FUzJtBRAq9Gm5A==
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::5)
 by YT2PPF0BB770EF4.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::40b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 4 Jul
 2025 17:25:43 +0000
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3]) by YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 17:25:43 +0000
From: Ryan Mann <rmann@ndigital.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"johan@kernel.org" <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] NDI FTDI USB driver support
Thread-Topic: [PATCH v4] NDI FTDI USB driver support
Thread-Index: AdvtCJqp4SZK5ZqLR5GYJuOyPvBNFA==
Date: Fri, 4 Jul 2025 17:25:43 +0000
Message-ID:
 <YQXPR01MB4987FF89C01297FA6F1B0C9FDF42A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ndigital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQXPR01MB4987:EE_|YT2PPF0BB770EF4:EE_
x-ms-office365-filtering-correlation-id: 82a46f56-3010-49d4-2b92-08ddbb1fce0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TcZ7pwoN7PjZfPe+/R7megIr4N5m3C+xzq0SuUl9aDpge2D7e5wmTtaTgogI?=
 =?us-ascii?Q?18RrLJ/WugTJgTLC+43JGigE2aSkB+Dll1rKDAKfXvSDWBBuyfgf3nlvyL39?=
 =?us-ascii?Q?DDhIBL61smLmicPCTWGntzZxXSmboNKZdIcjd0koQEsK1hdGS6YLZBhbruBP?=
 =?us-ascii?Q?8XqZ/sUL3jIBg5VwrfKbsd9TX6zBHZejtJC79e7FYl+0rS4CfXhm8oCs3YTK?=
 =?us-ascii?Q?TfD0FhICX6l7AdvO+WxJj4qPifAA5WYPurPjg9ktkfHjO9o7GGcV9M2G4APY?=
 =?us-ascii?Q?5M8gjdi86S5DkHwp9yRL6l0RdrEl68mx0rTG8KO/PSPLrVxSsJBbOhjrhqj+?=
 =?us-ascii?Q?fqUdvNiYTcbwrN+XmcL/eTc9cjBhLxL+ov+GMTc9QjuPgjEOXq7gPagGrMN0?=
 =?us-ascii?Q?AOTqYzIJz8alUsUg4GXC7nqyFGBkn0psuVJaW9dXXQ5KAy4NoEMf0SU+WvLl?=
 =?us-ascii?Q?tNnFqshYy7hKdiK5tNrGBqBi0GWXw4aR1rHdBamKHII4xenCgQ6ru2sDmnp7?=
 =?us-ascii?Q?BR/52lceTs1BRUAKXt2sdrTbh0dIIm4HDrdeyE4fGF4J4KzGlQ2CcTruLAeY?=
 =?us-ascii?Q?+r1keLL/hZjH4j5awWulB71Al50d7T57qSdpUv1mDPBOEG4G/wZYoJOU6h7P?=
 =?us-ascii?Q?kGK1DctJmXIvg9sxYAgwZXbcEPVO1yQacgF5AYq1TagbBKvjOIU/qa4l4CCw?=
 =?us-ascii?Q?XlVuTH4la+yFZ6VwEiSYxhCCIW//4dSsc34tntXDfUmHDrnIeCQ3983VtlJH?=
 =?us-ascii?Q?J9RO7/vnLnBjpT1lbYJT2hlG+BVrOxtSeCAdcWk/7C/UJNeDYVthyRRcrSSd?=
 =?us-ascii?Q?aD6hQUg9gulKJf8ZzO8O/3qq53EOuU07DPvsC38IlVy6lVoQMuquIXvFyjWx?=
 =?us-ascii?Q?KDw98/1Ofn1agWxZzm7AbTwkFy8rW/94qd2eGQMipB7cSFNFJQF0Jjaus3MV?=
 =?us-ascii?Q?aazHdQCHjY1TUOCvR6pWALdIp2r4Qg+zF7MYaKWy+60O3aTJSIe3wUBfmrLC?=
 =?us-ascii?Q?+XXdMEBaXAgZl8VZmV0y1/7hv7NoxnS3WfrWXEAK/MTajmV6X4FN0pSyBqHP?=
 =?us-ascii?Q?lmjpnD7VrCmDPMPtmdKHJ2wA/4EPUkkYtmyvSYzFlWWgb8+JGk7eZ9duZkYP?=
 =?us-ascii?Q?UhAcpMk4e9cAgkhqn0chbnKw8O6d9Kp3lvITtHuoQ4sMHmlkoBCIGdzVPYT1?=
 =?us-ascii?Q?ekAF7m6/ytdWtcT/BgQ8YJKt5V4ESCzQJs7Y02+RuHHOSet/TWp6hB08x1Cl?=
 =?us-ascii?Q?y3OQX+EUXCcZJBrjnOTZJU68mcBNyIbxxBiHj/WAjVAwrmn4UjRoEqyG/Tw9?=
 =?us-ascii?Q?2jYOOSRcC0HWlc6cSYtTLhsqMaAcXUm2E3OycLCU7DEfgwzn2NEYe44nPK8H?=
 =?us-ascii?Q?Q1UF7UDpvHw63nl+zn+ZNAdt1xPbSI4BpV57nvF6cPh2sT2LZPLG8+h1V6uJ?=
 =?us-ascii?Q?2neBvhkcoSo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GpJEKPgdRHZhIvBUXtEa+PnRCKtGffBPAL1GJK6gfRyY8jmOq1XpKn/u4rff?=
 =?us-ascii?Q?GF+mCgOArziPXYUd9BIPW4Lm4WRkzk4gpcgx+h907f26+bAQLgXlR21UfmB5?=
 =?us-ascii?Q?UlArOid8029MJ5aQBYJXd9QpqvsP+NgJHB3fc23GzbhvJP91JrG/YJqAW3dH?=
 =?us-ascii?Q?B1d6N5kR6prBRt16x4o3yOk4AJhZkaWoaJmyAK7FFXN5RzAJ2abV09knNCgA?=
 =?us-ascii?Q?DofqgbXdpc73nfWZWYsXZQtDRWjVuxgGnxzYfRyXuJTUjfATA3qkAN0/eQDK?=
 =?us-ascii?Q?5zVG8jVBl/M4FsTXbE/WSCSTymzcmVQikrjXvxDTTst5PmxnfBEl40qDTp+g?=
 =?us-ascii?Q?93U0BkXHgATBgqrIiC2KuuxDOY/aBOm3bXndyGV5xHHsjKadZdBVibDMB8/W?=
 =?us-ascii?Q?DfTXNOXUoJ6qJfHAn2cq59vz3cHDclL+IcaHT/gk7Vg077H755VCyLjF1TZM?=
 =?us-ascii?Q?EI+qM7rQMBle2tZpYg+5dDMBNlZ8Kas+NeLAxJZ41+D6+lY5GC8Tpbh6S5yc?=
 =?us-ascii?Q?Lgvx1jK0od7WPcju2Tdw3kHvBWN86I5WEY+OKfL/xR7BIM0ntM6sRVBOZav7?=
 =?us-ascii?Q?ktX5FdmgcrUenV/CvOljXLRQAslOldKbQg8lLJStZE8hFC0k5mPV9stHBEC9?=
 =?us-ascii?Q?9u+Qzez6jyHb1Jc8XL5FHW3PDs0Csi1+iWSIcmnGt1hEB2oOZkezdsPOrQ0/?=
 =?us-ascii?Q?Mj8JXfQtzXkvnNtnKQpRIEGfUgXD9v+XD+802JucXluyzLHfLFHug1aS9HtP?=
 =?us-ascii?Q?YWykQWzNXzf0Ja4+f/r2UlxP62+V5TZAxyD+y3zRrYqAV8A8ffH+0azkA1wW?=
 =?us-ascii?Q?5QvF0QjtYtUu92aQW96xgSWYDww7O/UwjoB2wgrNokZk31/f92By/dB0GKlr?=
 =?us-ascii?Q?cGhYhSLy82nC5uPQZw3sFtiLp9t+8NKAYJxlB29xQ8SVnjjH9GhQ+gu3/ZOJ?=
 =?us-ascii?Q?xbSOoXd9qI6dsyDZEiYizik+p9r8B46PkbusjoY7+Gxk/umIJW4lFDdJUrUE?=
 =?us-ascii?Q?55DWBepuvChYp2N8Zi91EpkqL3LB3XwzNwhBy7APCDYTA2NyEX01lDjCTgen?=
 =?us-ascii?Q?ljaTVsV6UBJVCLR3fHYlr49P/+SX5xsvIhg/mSjxD/iZGAp9HvlWx/lW3Luo?=
 =?us-ascii?Q?xMvpgDUIn6jy79Tw5brcZRxi7P4Nayk/L4v1RS1fkpBrkB06YXWshAB1u4HH?=
 =?us-ascii?Q?7K84xAc/4RXra9nhcNdMYf+8ZovRKRD8m4D+J0TK7DIGdm40qt+y1YLxyagQ?=
 =?us-ascii?Q?5kXqBwZnz5OIApeFeXfLbsWP+ZLCNJckKmo5sVJD5VWG67LOh5GPuXhtZw2f?=
 =?us-ascii?Q?TjxglGoNjz1Vg0h82HwbHwwfPQgLNbPirXCDTXsIAz1IrXIcE08KlsKWeGMV?=
 =?us-ascii?Q?XRXQ1/sZ9ObEPwvmH7r66ipXntFrtt1gVTN0Q6+DSk/LaoHMQY1VYx3dDNVs?=
 =?us-ascii?Q?z+y+fwJQfUK1znFnY/rPUaFj10Ouha4MI6erFVS0Hy7dcLxugqG1/AYPhnLF?=
 =?us-ascii?Q?due8n2Dfm9W3j6mZiANzCKc9+uv72yDBatZB2XeGbjNB0+HoRmWUtBrUZOAb?=
 =?us-ascii?Q?lFgSwpLRb6hBIR4OollRdqjWBHHDLvRHu7J+Blep?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a46f56-3010-49d4-2b92-08ddbb1fce0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 17:25:43.1664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fd6f7980-6d04-4a6f-86bf-8f6d0297dd2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CthD8JGRlDISRjbAM/e2pQgJ8bSB8jxeW2yNYbxUihJP+Wa6SRUoUaUF7roanlCBiagIxuzWFps8hJoDEBOboA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PPF0BB770EF4

From: Ryan Mann (NDI) <rmann@ndigital.com>

NDI (Northern Digital Inc.) is introducing a new product called the=20
EMGUIDE GEMINI that will use an FTDI chip for USB serial communications.
Remove the use of the baud rate mapping for NDI Aurora.
Add the NDI VID definition as "FTDI_NDI_VID" into the ftdi_sio_ids.h.
Add the NDI EMGUIDE GEMINI PID definition into the ftdi_sio_ids.h.
Add the NDI VID/EMGUIDE GEMINI PID combination to the USB_DEVICE list.

Signed-off-by: Ryan Mann <rmann@ndigital.com>
---
V1 -> V2: Email-to issues fixed
V2 -> V3: Email formatting issues fixed
V3 -> V4: Email formatting issues fixed

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
