Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2112.outbound.protection.outlook.com [40.107.249.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D771E86E;
	Wed, 23 Apr 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410662; cv=fail; b=cM9RHmkp38HYSBvwCyCNhdNsXrS/lvMH6o0uNfmt7xxli3oUR56Mm7jzLdstGP8mbTyhCLfxCu0+yy2dzG/4IGgCJelBzRYTWxXdcnGYPFGQ2qkgBnpwT1UCBfJx8pTXBdAYipSIXyA7L8K1EQLLAW2XfOAV3jK5g6pki+MqtZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410662; c=relaxed/simple;
	bh=1E56l9AL4cWO0EtuYR3TME/34+uYJfWBkFEh9g2MefA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N2BdZV0NjYmRQQY0DmFbJS81GlThOVx4lUxK4RMI/S58rowd8G/KU421m+wsYTjRPegQAXA3wCLgMxLUoY2f9vEQErk7gWUukpO0ADF9mqBAu369Wy7Qdk/dK0FWZbX/KCMK6yfQsee16K1oJ6NzMf7gV1/iBoG41rP8YLXsoOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=qIkjgXlA; arc=fail smtp.client-ip=40.107.249.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="qIkjgXlA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLfmI0dm9FMhqx1TvGbKykBJzSg8+8guAmHcsX78dvoiJ2qZNyCpCnhpfxP9qlr38qudrMeAqZh5+jJ9hg3o0ZFwjUEpHWQECaRG/JKVFxEihPEH4A7DmiwlmRVtC8l4cKax18C3ON0ZVWuyEHf2FBzyHVGaP+7ntfD9+7L3BtHA/YOpHuZonsfRREb0Zp5unj6bQ2FfClz5bz+X4WA9mw1ev7VSJWXUVWmhDObjVj9Wp8QPo6KX/wGfcD7w1fk6YTFpTU5jlhKwbrdHXsszZCEzeEI0CKeqGExmoHM3C5BmSA+zn7/VbZ6H286FvTa0ey54MM/10V5qx/KQuwBMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp7RnnYn0PTWGK+8xJVdO/MxLO9EpRKAtpqQndg1Vac=;
 b=k1VEYgAZ0jtv0bqqyUA9S7b2F2YxW1LNpHI4LfwVUvbqPoFCqwMZQYUeKZViySwCCuZ1oGalKaJF27pYZER7afgekWUCtoEK5NzWyIzwCd44cUOmuE+AW0FQCJNKJ7sVrUtVoc1aplY00JCJkcqIvQ23LsXUmuvsjTqbBiXum1uJuLvNIUcrwd03MNbXg53271mdgrkjpwWWIOaTbhrelakE4bbcgj4RAd68ZPI1lraytKDE0IDLDIwsTjDc8LMqTS068VKCo09CphzWpmDStTttjLik1TaU8XScS5Ee+PCvS8u9neuGq94vUt6jJiZOc26Z4NvrCZIUL+f9ZsOZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp7RnnYn0PTWGK+8xJVdO/MxLO9EpRKAtpqQndg1Vac=;
 b=qIkjgXlABuFvC8NHnb+Is4T/uS8sAtEErv++PAT9ovWylvyreMlSk7w2uw5bBK6a0cJUhLn5VlxLtke/ibFTPYeS4RehIh0lqXXwJAziEdmU+m930LUVtTJou/UeCx5IpZRItqUylSMe4SyiE7thKKBzvhRUxomKQcH9G/kwAY8CPF8MD+B3GKeegMQZI3l1rbnIipcwxNj20o8Z3u8SrKx43GcSenhyAh2WGelBPQZEh48qipld2U1K/hu2ZBtI9kp9ihu078WRVq+bvGPRkLRlUD16Muw3LNEcHoAF98uvU9RN6fOYE9O6xH09E0v3XB/JR+SbJboK+himYcEDFQ==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by AS8PR09MB5925.eurprd09.prod.outlook.com (2603:10a6:20b:54b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:17:38 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:17:38 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: Djordje Todorovic <djordje.todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Aleksandar Rikalo
	<arikalo@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 2/2] Allow for riscv-clock to pick up mmio address.
Thread-Topic: [PATCH v3 2/2] Allow for riscv-clock to pick up mmio address.
Thread-Index: AQHbtEmzuV/JBZvWCk6DhGfv2JPNTA==
Date: Wed, 23 Apr 2025 12:17:37 +0000
Message-ID:
 <DU0PR09MB619673345C9082CB442A8DEFF6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
References:
 <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
In-Reply-To:
 <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Enabled=True;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SiteId=9f85665b-7efd-4776-9dfe-b6bfda2565ee;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SetDate=2025-04-23T12:17:36.938Z;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Name=HTEC
 Public;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_ContentBits=0;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|AS8PR09MB5925:EE_
x-ms-office365-filtering-correlation-id: 44def4fb-cfac-4fe8-94bf-08dd8260d642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q0HZdta4UWV5j+HTvojMX3EGsIs6WXdudrsUD6ya9Or+asWFzNd3oLHPgR?=
 =?iso-8859-1?Q?vpETQmV4Jq91x524t+IrARJcdjq4e2iIDEQSk8P+1s3Yxq4VsP63SmNd8D?=
 =?iso-8859-1?Q?P9V5SOBCCU46Qwj1UYn/BT9EkSgYQYxVaY299GA0+jsm3SSRPXo7EFBAUm?=
 =?iso-8859-1?Q?CwExkUrUZG9X+DbGI7E4Mn+8roUTSa594LStGCzK+rUtftlhgryYtWn7es?=
 =?iso-8859-1?Q?VTGc5O77k/W2wcwRWYVl+qTvE5U5ew0Q/m/HUg2Rc4n//oy/MaTxZx1nKP?=
 =?iso-8859-1?Q?6XSNeUfEf2orUMEn/wnQU6paoLOQiCSpCSK8v4oEYBrmS5zA2E/om8k57h?=
 =?iso-8859-1?Q?9FlhMqnAPh0PTj1vz8z8TcAcChY4CDtNltC6XFeUMeBrz6HKnAbtmB4R6A?=
 =?iso-8859-1?Q?SNRXvBH/yPOKHFE6EV167KjTKeqwloRzDJTEiI8HvoHJeMb18ZuMOmIzed?=
 =?iso-8859-1?Q?HNnqDGPO5i7agpEWcJMQMk4PkJQIHaRNj+faQdvnjfgLr7eTCdvSQ3quoD?=
 =?iso-8859-1?Q?wApSg5iAwIznR64J1yOGa0lGGL6wW09iNPQWWiMlFFQZXxo61ImydE8oe7?=
 =?iso-8859-1?Q?B8HCMT9QhfEBzPuAZtk2traV8ZE6TiTQvjoElHNwZqWooBCZYinykmhLgu?=
 =?iso-8859-1?Q?NmOS2LzjGJxCQYkU6roSeEpAj6uvAXvxfQfFm9s/u6BodNg+d0MIzmw82V?=
 =?iso-8859-1?Q?RoFVkTpg4bshqhGO1AWaUmXDUXxnlWcHdx6V/au758f59yoRK15lSCVqpx?=
 =?iso-8859-1?Q?soiC0olUHgRaWPj8BcX4CS5EV/56RdByLKEzvEnWUT+0hyScTmABmNhQdK?=
 =?iso-8859-1?Q?p+47KY7b5ItvsFkaShILrFWLWq94oRi+Hclt8swtWkXjlLR3YkVDRP9EkD?=
 =?iso-8859-1?Q?yn7pTL7SLjU+hFPuDlbMet1b1dtb7+UWSHGrMFwhfQ9AHXLuJEuyms+kbh?=
 =?iso-8859-1?Q?XVZ3KvJvrNA+8BEEfQMpoTMJg5K5ZFEAbPUkkk2ffBbug7Q+V8OegmOLBK?=
 =?iso-8859-1?Q?5gIdae1Wu3Hq6pxUGAkCdp+MXCJdZfhwlOOMxnzG4JrVoFCVuef2bDj/f6?=
 =?iso-8859-1?Q?M50LMYA+wXMVTiuyrLHU2r2yKIy2DgxIQ7uHm4eMZrfuvZEjDBJ7H7eBJT?=
 =?iso-8859-1?Q?PO++bl5qA+XNMIBO6MOY7PRmkPW5ke4Ey73o8b1IDLBSov+5YCxC00z26/?=
 =?iso-8859-1?Q?IIezuo+u04IdSaocBOD2fKGjbpTA0MgmVrJPcVwayZrSxMES370WORgZqt?=
 =?iso-8859-1?Q?yj4ZaP0Azu723Faa/z/YUnnSoTFqr5t2xi1K2mEYfyVwDGIAtT9ZuDU+YR?=
 =?iso-8859-1?Q?dgL4hMz1zvTkXNvdQVdWW+1iLlLHRav/w2bY0HQYIArtLhWGXGPBhmC8fg?=
 =?iso-8859-1?Q?EL0HNUcg9KH+R1EpPnlN/A+NkMsaHaIIHVCSHGRvMxh8UgTq48G+4ejE8i?=
 =?iso-8859-1?Q?kgx7lpXUdjrwKUPKYiJK4YqsiiSNArLsKpwS1J1Avklex1VhNNm322aVgj?=
 =?iso-8859-1?Q?RdWIAynt1//Zh3beLTBcP2CTO9Dz2Qpq39TLmBHOIkeg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?79ECIodnPOEG4eM9PIGvUfY/VuYmanxi31n5eVfZtzfCyHF7X+GOPlvx7V?=
 =?iso-8859-1?Q?eGza/C79/nS2wC4tTEqX9TXzt4ISxN6CP99/Lcsjoh+PMsrYKOeWphoMIB?=
 =?iso-8859-1?Q?w7QdgG7fxqvR2czW1u6O7y7ISwdlHquumzm7aEeMG/WFme6v8GKuhM4lrS?=
 =?iso-8859-1?Q?IekmcYQFDeuqwLByJ0K7lYogw/QzrvRB9Q/J2JAE2fhFwN+1WIAXnWNsRB?=
 =?iso-8859-1?Q?afJo+E5Lk+Ng8g3XY99xymnJn7jtud96V3F4Ry2gCK8I3Jg0+9uyEkiwOP?=
 =?iso-8859-1?Q?2xsOsbp9C4qi38YSN0No30dlUusmiO75T4dl+FHh7fZ5xjrZZK38fy61qA?=
 =?iso-8859-1?Q?p8svXlcggs6a1gZIwfy557hRPcO6TqZOOGIx6AEYFOWyg+PlzTso37D4Pe?=
 =?iso-8859-1?Q?Ri/pGmWcxOmY4PfQVIVXUQH7aBSd6bqJvTFDnV8hIVdacDPHLPPBAGkdIg?=
 =?iso-8859-1?Q?3FZ8Npk6Q/FFAz8bnMTL4auOTpBJq//I8UQXCCFevYGyeYuzWHBsQ0+PG0?=
 =?iso-8859-1?Q?jPXg6QwYd4YTiVvLOvl3eh6m2+LCLLs3s+439QgrwIggsVcLEwGMFz0QP1?=
 =?iso-8859-1?Q?EfEGWhYxo53uQTL+4QU7Qu1XkaiXt6z/ZnWAvHZ1Pp5WIgsgrdHXCKa2o3?=
 =?iso-8859-1?Q?VULPrrm8yiKldYfQ3cqcvGPd3zgl1E4pmkqOgk2wXjssqmdz29shd+5MOT?=
 =?iso-8859-1?Q?hicsfBPFhb4srZ8SCENGRlqtZ1Rfsc1FeFeAO4DWjmOIPfKiavfK6cgxvx?=
 =?iso-8859-1?Q?1Udj59EpWPxOgA27qtRLhGgimLRx02/s2vFcrOkf6NbMtQJqIfo7Gfy+x+?=
 =?iso-8859-1?Q?n7LFT6FZ63ypJKSxHFrF6mU18WWnJxnnPEnoqn8+1Gacwq6sw85SaCPbqF?=
 =?iso-8859-1?Q?JbC4nfJw8A3gC+R/Ao8cdBQ8ZKhnqC7HSreFORgbCGxenCJOo/o2Ij45bj?=
 =?iso-8859-1?Q?JoF4iyouVYLu1j8hv6CmreaIIuLTTM5mQDWOQDneBVq6hlhw7V70LT/aJF?=
 =?iso-8859-1?Q?TMC32r33p9Dd/Erp9O2XELinhGHpPUHwmYRVmr9/eVeDAdyCQS++J3pHCM?=
 =?iso-8859-1?Q?dpUsbkH3qPWrIKuUKbvhZIkzNVMFmOxjtyrGe1FLk6jbMcTIj9v7OwhPSp?=
 =?iso-8859-1?Q?F3xbJXBbpXpdJoMu1mTWM4s7i0rfGkYz9Wkj2nBKlxihv8mTSTmZOd19A4?=
 =?iso-8859-1?Q?qkGV4Dt/oE04keUUpb3XNaQ+2eAmadGQ6WsqG7Zor2xNEG8gAE4zohhwtt?=
 =?iso-8859-1?Q?tSLgekGn1bp10rJqyXWlCtAnfM5Og06jcqZDH8q2G26NYuFcRzzSKARHJy?=
 =?iso-8859-1?Q?xUq/u547koD9XONXe/wGEp5ZdO98KG3KoAi6l2NBS/tKiRxnWDlWX2KaOb?=
 =?iso-8859-1?Q?Z362Z9keTyzfDRlEaevq9FNq2AFqxJ/bRgmMNi29KnEVEdwrY90pfN6kYu?=
 =?iso-8859-1?Q?GmvZAB96Sx2ucBV+mwN2QPjo4KEYk5/RptkTHgBpuIl6pUg813RUbwaulO?=
 =?iso-8859-1?Q?OFDiJOsHmbY3FuRlMAl2mBC3uB/icGDg3VLZ2/z9unS9/Y91qRf0KlhDgZ?=
 =?iso-8859-1?Q?LwBTIF82ixmltJRsZXZZJgo1cqXg7r4xM5p66COKs/SS4VZIeO9urZDeWl?=
 =?iso-8859-1?Q?91txZkgRLKdMZdkveQIWaajlL84G6MARxR5f/CEcjcqlfQd2XQcagOmw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44def4fb-cfac-4fe8-94bf-08dd8260d642
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 12:17:37.9268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxipKm8rPshDJCRLCrfEnpxlbrhlMLng6/eW6h8kcG9jG14AsEIcT+91V9xmLdE4WC293/YlbaSc8U7+3z3asFqQA9bRZcxQH2/kpIYb6ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5925

HTEC Public

Allow faster rdtime access via GCR.U mtime shadow register on RISC-V
devices. This feature can be enabled by setting GCRU_TIME_MMIO during confi=
guration.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/include/asm/timex.h    | 59 ++++++++++++++++++++-----------
 drivers/clocksource/Kconfig       | 12 +++++++
 drivers/clocksource/timer-riscv.c | 32 +++++++++++++++++
 3 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.=
h
index a06697846e69..47ad6285b83a 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -7,31 +7,24 @@
 #define _ASM_RISCV_TIMEX_H

 #include <asm/csr.h>
+#include <asm/mmio.h>
+
+#include <linux/jump_label.h>

 typedef unsigned long cycles_t;

+extern u64 __iomem *riscv_time_val;
+DECLARE_STATIC_KEY_FALSE(riscv_time_mmio_available);
+
+#define riscv_time_val riscv_time_val
+
 #ifdef CONFIG_RISCV_M_MODE

 #include <asm/clint.h>

-#ifdef CONFIG_64BIT
-static inline cycles_t get_cycles(void)
-{
-       return readq_relaxed(clint_time_val);
-}
-#else /* !CONFIG_64BIT */
-static inline u32 get_cycles(void)
-{
-       return readl_relaxed(((u32 *)clint_time_val));
-}
-#define get_cycles get_cycles
+#undef riscv_time_val

-static inline u32 get_cycles_hi(void)
-{
-       return readl_relaxed(((u32 *)clint_time_val) + 1);
-}
-#define get_cycles_hi get_cycles_hi
-#endif /* CONFIG_64BIT */
+#define riscv_time_val clint_time_val

 /*
  * Much like MIPS, we may not have a viable counter to use at an early poi=
nt
@@ -46,22 +39,48 @@ static inline unsigned long random_get_entropy(void)
 }
 #define random_get_entropy()   random_get_entropy()

-#else /* CONFIG_RISCV_M_MODE */
+#endif
+
+static inline long use_riscv_time_mmio(void)
+{
+       return IS_ENABLED(CONFIG_RISCV_M_MODE) ||
+               (IS_ENABLED(CONFIG_GCRU_TIME_MMIO) &&
+                static_branch_unlikely(&riscv_time_mmio_available));
+}
+
+#ifdef CONFIG_64BIT
+static inline cycles_t mmio_get_cycles(void)
+{
+       return readq_relaxed(riscv_time_val);
+}
+#else /* !CONFIG_64BIT */
+static inline cycles_t mmio_get_cycles(void)
+{
+       return readl_relaxed(((u32 *)riscv_time_val));
+}
+#endif /* CONFIG_64BIT */
+
+static inline u32 mmio_get_cycles_hi(void)
+{
+       return readl_relaxed(((u32 *)riscv_time_val) + 1);
+}

 static inline cycles_t get_cycles(void)
 {
+       if (use_riscv_time_mmio())
+               return mmio_get_cycles();
        return csr_read(CSR_TIME);
 }
 #define get_cycles get_cycles

 static inline u32 get_cycles_hi(void)
 {
+       if (use_riscv_time_mmio())
+               return mmio_get_cycles_hi();
        return csr_read(CSR_TIMEH);
 }
 #define get_cycles_hi get_cycles_hi

-#endif /* !CONFIG_RISCV_M_MODE */
-
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
 {
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..0f2bb75564c7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -661,6 +661,18 @@ config CLINT_TIMER
          This option enables the CLINT timer for RISC-V systems.  The CLIN=
T
          driver is usually used for NoMMU RISC-V systems.

+config GCRU_TIME_MMIO
+       bool "GCR.U timer support for RISC-V platforms"
+       depends on !RISCV_M_MODE && RISCV
+       default n
+       help
+        Access GCR.U shadow copy of the RISC-V mtime register
+        on platforms that provide a compatible device, instead of
+        reading the time CSR. Since reading the time CSR
+        traps to M mode on certain platforms, this may be more efficient.
+
+        If you don't know what to do here, say n.
+
 config CSKY_MP_TIMER
        bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
        depends on CSKY
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-=
riscv.c
index 48ce50c5f5e6..4290e4b840f7 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -22,6 +22,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
+#include <linux/of_address.h>
 #include <linux/limits.h>
 #include <clocksource/timer-riscv.h>
 #include <asm/smp.h>
@@ -32,6 +33,13 @@
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;

+#if defined(CONFIG_GCRU_TIME_MMIO)
+DEFINE_STATIC_KEY_FALSE_RO(riscv_time_mmio_available);
+EXPORT_SYMBOL(riscv_time_mmio_available);
+u64 __iomem *riscv_time_val __ro_after_init;
+EXPORT_SYMBOL(riscv_time_val);
+#endif
+
 static void riscv_clock_event_stop(void)
 {
        if (static_branch_likely(&riscv_sstc_available)) {
@@ -203,6 +211,11 @@ static int __init riscv_timer_init_dt(struct device_no=
de *n)
        int cpuid, error;
        unsigned long hartid;
        struct device_node *child;
+#if defined(CONFIG_GCRU_TIME_MMIO)
+       u64 mmio_addr;
+       u64 mmio_size;
+       struct device_node *gcru;
+#endif

        error =3D riscv_of_processor_hartid(n, &hartid);
        if (error < 0) {
@@ -220,6 +233,25 @@ static int __init riscv_timer_init_dt(struct device_no=
de *n)
        if (cpuid !=3D smp_processor_id())
                return 0;

+#if defined(CONFIG_GCRU_TIME_MMIO)
+       gcru =3D of_find_compatible_node(NULL, NULL, "mti,gcru");
+       if (gcru) {
+               if (!of_property_read_reg(gcru, 0, &mmio_addr, &mmio_size))=
 {
+                       riscv_time_val =3D ioremap((long)mmio_addr, mmio_si=
ze);
+                       if (riscv_time_val) {
+                               pr_info("Using mmio time register at 0x%llx=
\n",
+                                       mmio_addr);
+                               static_branch_enable(
+                                       &riscv_time_mmio_available);
+                       } else {
+                               pr_warn("Unable to use mmio time at 0x%llx\=
n",
+                                       mmio_addr);
+                       }
+                       of_node_put(gcru);
+               }
+       }
+#endif
+
        child =3D of_find_compatible_node(NULL, NULL, "riscv,timer");
        if (child) {
                riscv_timer_cannot_wake_cpu =3D of_property_read_bool(child=
,
--
2.34.1
