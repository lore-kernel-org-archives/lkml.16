Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFFC2701D9;
	Fri, 20 Jun 2025 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409185; cv=fail; b=myDDnkD1/13C4RzUjrUbb6JN0CAB1fcSclSfLS9GFNldoTfUphsYCLB79z01eSk6Id3ldBAUZPH3Pn6tsRM97XZwrcoUQ3vaml0X+fnHqmqgidrYZVwO5vPUNEXbuvTSa2gs6De3Lz3fMskZRmnK0qfXtfWoEYlZsHumqWGmWio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409185; c=relaxed/simple;
	bh=KGn/2QSz/ZYNzjwBjWDn1XVU2ySNxcoILqaJhKfwn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cjlox3zlQqI9k2uCIJihPL1xQl58LDRXTSVONOtMjjPyk4mMue257DrbxGs0dsgehJJ3T0mrgQdc3CwGJFzSEWXMVDmd/VwQ3u3il+5My1bsdXkKNCLiqvmgqNcH2GYKxiGvosqx0Mzb8+Wwsw6XnFJXWUbBEKNPDj9iHuliD58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=w66KgUWi; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="w66KgUWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADvRKg3lEfQf/NPXXYWKhVEw0q9iNj7E95YuxztB8Hkxjr4suqGi3+GIVBdyviEi/AY7PYo8kLKLZsH6Ljfrf5T0qON+8cWBpNRiCdsZCGAhqLFzqnlGDUSthux9dj6WDGUuAs8u1Kf4geCW21rfvNnmPzV/d2cO1X0Qr6Mx+o+E+ggiY6bM0I5LBDMR+m/S6F/1qDr3NMC2MZUTU6ZbmzoSYmD/MhC8pguYIFxcTVs6RHCe7ZptWEo9D3WPPEGk7+irfFwDyEE433vsdr/weISytslidl20oAD4eEWkI6B5s4ZnkTc3R6fAL84D6EyCXVYe3TnfxrVAgRGYm+dyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVhroDx/084vK7fdeTEeAUMVZjJheuAe00OtqX42JJQ=;
 b=yd2q3yMfUcqX3pvWYEtmFm4IfuAf8/phJZs85nl3Ips6t/eeregObVeLlnpL8w0uKpkeLJ0yaDUTnj9t4IbfTbLVFAk4QF5jv0rlA7RVFhve9lbtNjMTRrb1ZZF8eO6Hpdibj2QmFpSGIm59cZZsaJj3PshQQTtkS6zuCgK7Ga3PKkaAqYmEt0SbJFLHALG1YUWaxzNBROZ3YJa4OEFqBtZm4i+IMC1ZkFKAhLSgA4zJb9wnLR9Ois4f1VOuhfZMlzz4tosq3UPmJyZuJ7qdCdMW/lif1RWkLUzSzJ84MSKX4rnhjNDNS0+ySAgoHxAqKmaC+GOxph/SBHn/eA50YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVhroDx/084vK7fdeTEeAUMVZjJheuAe00OtqX42JJQ=;
 b=w66KgUWieP8h8PXmEcjIZ42js4C7MzPd4KdPCfbl9FQ2tmvyfM/y+zZSyRsOZd010y47CpMuL9iRg1cDXgkDACgjk+UOmZ23rqf92HyxJ5hrBUxvJPbMwbybrDiJs+zzh0Uocf/vf9xph2bZcFj5Db2QRtFEu+O5Ffib3Nzp6ngziyycPfc5O7pu5H/U0w3rXML8UBdZhaQ1iEbbGduG+LYncyz5fs9qgT2rr24mmyxhBoB8mSzVswulub9t9wB6M266TTpJvmp2BX65Na6elMYwY73dxZSQvhIYLxsFdSmwtuqAFA0eML/w5kLdcqOFY0ULmXKvG7z76LIOars/PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by AS2PR03MB9490.eurprd03.prod.outlook.com (2603:10a6:20b:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 08:46:14 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 08:46:14 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wojciech Dubowik <wojciech.dubowik@mt.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tobias Graemer <Tobias.Graemer@mt.com>
Subject: [PATCH v2 3/4] arm64: dts: freescale: Add Mettler-Toledo Snowflake V2 support
Date: Fri, 20 Jun 2025 10:41:44 +0200
Message-ID: <20250620084512.31147-4-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::6) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|AS2PR03MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3540a9-3479-481d-ce38-08ddafd6ea5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?45y/afiLVSqQoYdw21mwCywJJIIcHI2o3tGirAC8VzcxSgAc//5K4M/c9rGx?=
 =?us-ascii?Q?oxddTaMFEABauoVFjgF+lX8la2CSuBK85C7KImczQDEojIIvUkT4rEwGP5gc?=
 =?us-ascii?Q?2F5m3DkcIphb5mppV6iY/XTE8WI6G1KW+dLjgNEfPCUgwn8EPhcJmj7ceE4a?=
 =?us-ascii?Q?esqXfSUZNG/P/r09TlBDKK4sJaTCxXlCL0ScjWiCnI8Gmo9nmw7dE5gWn2hb?=
 =?us-ascii?Q?BuZcvNerLQGFwleLrTLhW90XhyOYECzyFOdR726etDqAJZ0ynnUWS4aHoahw?=
 =?us-ascii?Q?jpjU8uuDdeYgNU36nC9yk/c1YxcSgVY/iKbqIt/VCI3A1k2xc5ixF4UXoL1X?=
 =?us-ascii?Q?qH0FIbNmMJjo6JhixaXJj1JfQGDpfvZPr9mmfrHA9X5uuScSDATDlPUlgdM4?=
 =?us-ascii?Q?TRCfLmTHn2XDd7/Plbol896JWZjODezN/4Z6y4lhwPDlLkxnkxhfgo2/vq+7?=
 =?us-ascii?Q?6y740iS4DrYhuSMRtH/Z6NtOVvq1HBvZgEfyESJw+op3H5IBibnJY2tvnZes?=
 =?us-ascii?Q?lijULtZl+l97PUBoLB51faoqR3jWscGP1pS858+OGucxDmIBLHkjG+nPzA1H?=
 =?us-ascii?Q?U/qwg1QzgG0mTFaScQ5Rpp6N9Kuk9Q04pN/hYI141RzJHK+TKxwL5SJKNlkf?=
 =?us-ascii?Q?ZklLW4OmNKLn2mEf5ZdZ9yfmBpwBlQzD+m+siuWPHxls0GBvQwLjxMKKPxPt?=
 =?us-ascii?Q?KRy7WbFQPg3B6ir/IDMmeCk2X7BSvDRPv6VLWNNx1Hj248XaV1+BieGup/KR?=
 =?us-ascii?Q?1i/JZehw7SZpM9mzQR4YR3sLE0JJr9Qoq9t84SHVnO5sJhnAGsrmCudcfr/f?=
 =?us-ascii?Q?3cB12li5goKTEiXeXciLiv/m8Bd0JwaeWPQ61FUEcTY9m3bM8UAF4j6U+utY?=
 =?us-ascii?Q?5lxcIVcaqt5LRgu73B0xtu2W1AegpTttUTNZ28vJxrI32J72h8lCrr5WOcJt?=
 =?us-ascii?Q?Dw3vy/QzCR4HGYx+JyXMj89DnC22URI7qmBIaM7uBWjRilq4kl3guwl790BW?=
 =?us-ascii?Q?j1UzW0SzwzoZ6YuhqsqNHvo2es7MWSIe1z6nNYEdtWs/Qe+KXQUY3Jk0FWLo?=
 =?us-ascii?Q?pU34CtgI+Hr8/BgbKug75Xc3EutbcGZHeqAcqc0AWDHUA+It2aDZxRgrOAjd?=
 =?us-ascii?Q?hv+yLkRAGhvt7/r8iKr4BUbb5G/cPPTV7qv2ShqSX7cJtF6Crixl8JNc+uJ0?=
 =?us-ascii?Q?x4B8LF6+TslbffuQ61U4oC0J+w39CPL0PSFgxApyuYovP1xvduDDzKScHhUd?=
 =?us-ascii?Q?eucf7w/0tLIBJXZ978ys1rDAJbNqLwVjBwfHLV5obsBy9Wo3+v1A2xoy6Vvv?=
 =?us-ascii?Q?fqcIJmXAOyFsWaK0W/+Y/Qmggg/5nEGZsD6bn78BBbcaRD6NrLOzwGdoTNwi?=
 =?us-ascii?Q?4rGEmVFwdPLl5/PBQwmuZjhSYimsUKCchDdhMS9joCjrtHuq1xO0gsnuz/+Z?=
 =?us-ascii?Q?yuXRwO4GEgA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEhhbiL0euMhHHVtkIa+twR35UynAeChTkvU9fxlit102qCYMlMHEgCzv8pu?=
 =?us-ascii?Q?TLaYKHPhYhMUNehVKpdpJLOMIe4Gdl0ShRxpf6YY6djeaJ7STe22V+AnDawI?=
 =?us-ascii?Q?S36pyNm1ZIedR6MC9esf+qIg52Qxz56oXZQesKp+yKfAwwvReUyhBvgYUTz2?=
 =?us-ascii?Q?hql8Ox2V/DaisD/SmOwVdF7UzRtgmRuCaW3kqtoTkPcDMHMSqTEKAUUzmkPk?=
 =?us-ascii?Q?jlntrFu4heId9Lb9JGSjZoPt+AgnEtmeuqeKdsyc0EAxeNNDvXm8B6KypSv7?=
 =?us-ascii?Q?HPULYjhxvn7tgjL8l9xdUSY64mwz5bK6BEz7bCMWP1ua6maWGk1V2ticYZad?=
 =?us-ascii?Q?gTUV6WDsUd+vU5oYKah0Sl385+mr19Kfym1iw5A4BU9RwuAlSEpdAD4ZJBou?=
 =?us-ascii?Q?IECwASJvJgOeTfECr5+Z33HjuBzIbJhyv8kUmMkyBEN5b3A1fDCkp8ji3YQU?=
 =?us-ascii?Q?hqM56+t+r5oauDcBS7gJKkH5l4aPSYhT2lxiz2i8rCIuGDN6KFFB4ouW1eFJ?=
 =?us-ascii?Q?3i13aV53GSIo0wXwZoXQ6hyvYoaOb3Habyr9VjuHLXQW3BZVskDAITB7SOAA?=
 =?us-ascii?Q?BT/UrXFjEwr5Pqq595ewZhOzbpTe3fbuVe2S0uRQGP8HE6FhW+LD/JtKVWtM?=
 =?us-ascii?Q?uC/yidJVHR/TgmpROkhpLdx6QIzmazU6PBbmTQHkxSDn+CGI1m4I7bjInxkq?=
 =?us-ascii?Q?6/9Ph1eKM2eU7cLRvCdccrBqC7+hdlt1yxJDRAZFUL2JA5nu8e4uZMIP0rDa?=
 =?us-ascii?Q?0gY9FHDnIrHJDXett00kp9BUwQB0A5dupazWY+P9IYfXpEM51kx6bsRvYW9T?=
 =?us-ascii?Q?VkXsb6/OddlDmq0saZBuYsU6cq/JUrUfalkZWsPHTU0tGl9lO9+9Vhed0P4F?=
 =?us-ascii?Q?v6+ECj5jJMAR1tpzPsJETBoU47ztBLFfnwCkG4F/rjzPi9zAKZIun+uKarwx?=
 =?us-ascii?Q?T6P+N9Ntx2acJTrBJQG6llR5h9CiSTcn7XFnQgsWDNT8SV0upvmdgjnHWoHd?=
 =?us-ascii?Q?c+LeGC0FyvDZzhbHbjsrtvlmmxoKth+Hp8IJ1jarNc+E3dvvte4p2XVFMXDr?=
 =?us-ascii?Q?O92yMTVQ40XbeNPno2f3PobTJBI6+unwxWCuLaBNAjF9P6ixlmxVk98B5gTm?=
 =?us-ascii?Q?Tacxj9PHXZUln/GDcsbvj2y+dLWS+oEndnQE7MGdOoFK4vo8x6dzjL7UCUCy?=
 =?us-ascii?Q?2TihUdpHR3o42OS4pCb2RZ9SUvHAwP66+whFqvvwctNc8YYdmjnL/6AF/cEj?=
 =?us-ascii?Q?vaN52BdFk0ouxfXcm6BqdS5mnA9XHgJriqv+cfCh3ty+s5rUkBvIXjM2pVtg?=
 =?us-ascii?Q?Hn0wfNmmYo1tKVmTFVMTQdElovY9QMf/tsR/UGYfwXGmKJ9L5TiYgLh1xPB7?=
 =?us-ascii?Q?9co8qhJZ9pfZfEtPEAR5XAqMvKBuGnheCrcMKg2MOjjHhNk8vvx73aJZi6/v?=
 =?us-ascii?Q?EHxHa8ByrxhWZAM8VBbBKnUpr34/xh6QZEwQHyEAR2BtrfCW7aQggnMzSXki?=
 =?us-ascii?Q?asM9qg3/wk9HMxiHq/dNj9VTSUrOjGy0zyJVucEjSZH9RBV21BBjlLcNmdlA?=
 =?us-ascii?Q?ApGBiunlu35uN4Q8z7QHxoX8Jv4lfD5YMtFmwkIuYrf7V7CboygPLhg0SU7u?=
 =?us-ascii?Q?QGIDZoT5yVxLm/R4VwjiAn6u+Awjp/1PomzFM8QePF6cx7kx48sIu5EpFJzD?=
 =?us-ascii?Q?fGFttA=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3540a9-3479-481d-ce38-08ddafd6ea5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:46:14.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrNjHSKHaA1LICACst3AFGxLS38Fts0z1OxYhygX3m+3c13vtnSVDwoauP7xV+VtBCeSjL8VQsEWqgNnONlheA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9490

Add initial support for Mettler-Toledo Snowflake V2 terminal.
The board is using Kontron SL i.MX 8M Mini SoM with 1GB RAM.

Supported board features:
* 7" Display with touchscreen
* RS-232
* I2S Audio
* SD-card/eMMC
* USB

Signed-off-by: Tobias Graemer <Tobias.Graemer@mt.com>
Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mm-mt-snowflake-v2.dts  | 484 ++++++++++++++++++
 2 files changed, 485 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d120..86f2f1580696 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-innocomm-wb15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-bl-osm-s.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-mt-snowflake-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-mx8menlo.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-nitrogen-r2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
new file mode 100644
index 000000000000..b8f24ef1fa9d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mt-snowflake-v2.dts
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Mettler-Toledo GmbH
+ */
+
+/dts-v1/;
+
+#include "imx8mm-kontron-sl.dtsi"
+
+/ {
+	model = "Mettler Toledo i.MX8MM Snowflake V2";
+	compatible = "mt,imx8mm-snowflake-v2", "kontron,imx8mm-sl",
+		     "fsl,imx8mm";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		ethernet1 = &usbnet;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm1 0 500000 0>;
+		power-supply = <&reg_5v>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		status = "okay";
+	};
+
+	panel {
+		compatible = "edt,etml0700y5dha";
+		backlight = <&backlight>;
+		power-supply = <&reg_vdd_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+
+	max98357a: audio-codec {
+		compatible = "maxim,max98357a";
+		sdmode-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		status = "okay";
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_sn65dsi83_1v8: regulator-sn65dsi83-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "SN65DSI83_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	sound-max98357a {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "max98357a-audio";
+
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,widgets =
+			"Speaker", "Speakers";
+		simple-audio-card,routing =
+			"Speakers", "Speaker";
+		status = "okay";
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&max98357a>;
+			clocks = <&clk IMX8MM_CLK_SAI1_ROOT>;
+		};
+	};
+};
+
+&sai1 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&i2c1 {
+	bootph-all;
+	status = "okay";
+};
+
+&i2c2 {
+	bootph-all;
+	status = "okay";
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	status = "okay";
+
+	eeprom: eeprom@54 {
+		compatible = "atmel,24c08";
+		reg = <0x54>;
+		pagesize = <16>;
+	};
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+	};
+
+	lvds: lvds@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		vcc-supply = <&reg_sn65dsi83_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sn65dsi83>;
+		status = "okay";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+					data-lanes = <4 3 2 1>;
+				};
+			};
+		};
+	};
+
+	usbc-cc-controller@61 {
+		compatible = "ti,tusb320";
+		reg = <0x61>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbc_controller>;
+		interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&mipi_dsi {
+	status = "okay";
+	vddio-supply = <&reg_sn65dsi83_1v8>;
+	assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+			  <&clk IMX8MM_VIDEO_PLL1_OUT>,
+			  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+			  <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MM_CLK_24M>;
+	assigned-clock-rates = <266000000>, <594000000>, <12000000>;
+	samsung,pll-clock-frequency = <12000000>;
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <54000000>;
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&bridge_in>;
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&gpu_2d {
+	status = "okay";
+};
+
+&gpu_3d {
+	status = "okay";
+};
+
+&ecspi1 {
+	status = "disabled";
+};
+
+&gpio1 {
+	bootph-pre-ram;
+};
+
+&gpio2 {
+	bootph-pre-ram;
+};
+
+&gpio3 {
+	bootph-pre-ram;
+};
+
+&gpio4 {
+	bootph-pre-ram;
+};
+
+&gpio5 {
+	bootph-pre-ram;
+	status_led_controller_oe: status-led-controller-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-low;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hog_status_led_controller>;
+	};
+};
+
+&pca9450 {
+	bootph-pre-ram;
+};
+
+&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {
+	bootph-pre-ram;
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19 /* \SOM_RTC_INT */
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x184 /* SOM_DIS_ID0 */
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x184 /* SOM_DIS_ID1 */
+			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11		0x184 /* SOM_DIS_ID2 */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* SOM_PCB_ID0 */
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x19 /* SOM_PCB_ID1 */
+			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19 /* SOM_PCBA_ID0 */
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* SOM_PCBA_ID1 */
+			MX8MM_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x19 /* \SOM_STATLED_RES */
+			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20		0x19 /* \SOM_HUB_RES */
+			MX8MM_IOMUXC_SAI5_RXD0_GPIO3_IO21		0x19 /* \SOM_SUPPLY_EN */
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x1c4 /* \SOM_COM_RES */
+			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23		0x184 /* SOM_DBG_GPIO0 */
+			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24		0x184 /* SOM_DBG_GPIO1 */
+			MX8MM_IOMUXC_SAI5_MCLK_GPIO3_IO25		0x184 /* SOM_DBG_GPIO2 */
+			MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1			0x184 /* SOM_DBG_GPIO3 */
+			MX8MM_IOMUXC_SAI1_TXD7_GPIO4_IO19		0x184 /* SOM_AUDIO_SD */
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA			0x400001c3
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT		0x6
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_RX_PWM2_OUT			0x6
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x6
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI1_TXFS_SAI1_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI1_TXC_SAI1_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI1_TXD0_SAI1_TX_DATA0		0xd6
+		>;
+	};
+
+	pinctrl_sn65dsi83: sn65dsi83grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19 /* \SOM_DSI_INT */
+		>;
+	};
+
+	pinctrl_hog_status_led_controller: statusledcontrollergrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x19
+		>;
+	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1		0x19 /* \SOM_TOUCH_RES */
+			MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16		0x19 /* \SOM_TOUCH_INT */
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX		0x140
+			MX8MM_IOMUXC_SAI2_RXFS_UART1_DCE_TX		0x140
+			MX8MM_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B		0x140
+			MX8MM_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B		0x140
+		>;
+	};
+
+	pinctrl_usbc_controller: usbccontrollergrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* \SOM_USBC_INT */
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x41
+		>;
+	};
+};
+
+&pinctrl_ecspi1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_i2c1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_pmic {
+	bootph-pre-ram;
+};
+
+&pinctrl_uart3 {
+	bootph-all;
+};
+
+&pinctrl_usdhc1 {
+	bootph-pre-ram;
+};
+
+&pinctrl_usdhc1_100mhz {
+	bootph-pre-ram;
+};
+
+&pinctrl_usdhc1_200mhz {
+	bootph-pre-ram;
+};
+
+&pinctrl_wdog {
+	bootph-pre-ram;
+};
+
+&pwm1 {
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&reg_nvcc_sd {
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+};
+
+&uart1 {
+	bootph-all;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart3 {
+	bootph-all;
+};
+
+&usbotg1 {
+	bootph-pre-ram;
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+
+	usb1@1 {
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbnet: ethernet@1 {
+			compatible = "usb424,9500";
+			reg = <1>;
+			mac-address = [ 00 00 00 00 00 00 ];
+		};
+	};
+};
+
+&usdhc1 {
+	bootph-pre-ram;
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_vdd_3v3>;
+	status = "okay";
+};
+
+&wdog1 {
+	bootph-pre-ram;
+};
-- 
2.47.2

