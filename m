Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CDC23741;
	Thu,  5 Jun 2025 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157150; cv=fail; b=fwv6J+33keuFgHiQ6pps6XXwFmSniKHIJqoltWRkq/YNxfLrRVFDEqudQatRA6MPypJRmGHoZyzff9FbXaQYI0fXbktLD1ynQTJHjGq5Nfb45mNnAiSSwcoQ5foZuvA48VicBTkH8xfKYvij1c32k1JnYfwWs1INn36RBZWGgzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157150; c=relaxed/simple;
	bh=HdKFXB0swrxost/B/2/qvPEVkcnDfw+Xd+L92jmol5c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fZgc3DGIMTQpp54QyLh+2d7v7YhM7V2r0dWW0Zll62dCQ5MXgp0Iav9cAxg9Bk021PfVME997anY6KPzUgBDS5dlw1qh0i89RgQLwiLlhFi7xQQ0t3T++bxRpuVTxf/2AnfUS0Kx+V5HcgrzpEDvDzvYSbJ4ziTzYHtwlyUU3AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NFwGT+xm; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NFwGT+xm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHVdaMkfaJQTsnZ+yRmvqNfrQXL0CLcRp+RMhE7Ma1ftEBgSHuE2gHhwJAfshlLw3zXu2CXYjBYMTwQw9FNMsPSPZYMDX1rq10rRrCdAVs9yPasmWki6BlEL5/fi09wYgiKH7gR9lkhtpXwLmuzrz/V4ptlAYSss+eqFaVz1gKXEutSOVczGctdS09CAoMg8Jo5k59G/74ScgzEfzQZjIJAQY9TwYW68nDYtslC9PFmJrwYIVvGF4FEmsvGVLf8+xexk0TH1lFIHwu+8lXrzWZoQwJqMqICSxxRMEM5D+USi1+0wd+/sr6hKr/c96Z+RidVV8xghY15dIVP/S+Yzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g1h54Lzag/Zn8JzOZqlQXphhcQMCfR23PKVckCov5k=;
 b=khcX69ucMal4dKLFIcuhLAdmtkmZyoc8Z+I7lLckM/S5Ww/a6ozmY/oTA2UA27H8WsLB5y9gR33Qt658NWJqQ82oU/vZO8r0LicU+5jImXlWcvJQuRH9IF7q8PPP7vf+mB16qj04sa3yStNcNh9TKX7JEYQG7nSdL38DuX/nfYKMNlAJFzq3h/3t7mpzTDnKNEg3pS2XDSNaKdqm4/KvTj2CpjXSAyXJQB+A/52xo1i4yMRPMzVnWlBrL+kInIkYuP1JDv6U4p5fit0grNa6OhIDO3DlQl2W5YptoBNcMxRixY8F1CHbyivsJ3Sqj+qID2h0YtGD0hfqRiW2gb+DGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g1h54Lzag/Zn8JzOZqlQXphhcQMCfR23PKVckCov5k=;
 b=NFwGT+xmy484AfIhPgEgTFA8Tm3ImqZvopQ1Qs5bJwMcBTNVILxaazH8K6sEGGYZvnzjmdIj+3pYkAui3fVXXYKzEEKT5w9XbMwW26palt/0SZ8Kb/OlrHLPGr0MszsbOxXAF3ZZd45IpNI3deYxmvsKGiRU7wT/zWb0Gihjrlh28bnRKLHrtBQ8poama9nI5EQ6TsMlxNCpOqCi3hDXCdlYMaeITbIBsyhcR7AyXdcNrul1IVekPYdjYlTw8DJzs/vkdcaa3DxOt2ZVSqZ68qn9qxcz7Xbo2mgiOp2vopU8nVw+5H+Y8tzjWIU8UaHNwnLYbua9UroF4d/6NvAvNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 20:59:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 20:59:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/6] arm64: dts: imx93-9x9-qsb: add IMU sensor support
Date: Thu,  5 Jun 2025 16:58:48 -0400
Message-Id: <20250605205853.1334131-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A3.namprd05.prod.outlook.com
 (2603:10b6:518:1::57) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7ce015-3e9c-4e45-b41b-08dda473cef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UXH9yvUIcMVheEuPkKaYOzo6VIH3PiTj+A0GKRGC2NxNtEE1P+sRVo99mrvg?=
 =?us-ascii?Q?3JK0ysG3kxmo+hZiVLdT2qcU822UOhFp4fc3Ob7KyLVTOC3zEkp0LtgauvQN?=
 =?us-ascii?Q?JhQ8imnRi4Lst2B1VBUaEWOZGpb2odhheZZjcppYAcach200JFFZNQhyScX7?=
 =?us-ascii?Q?TJJSwFrH1R5YMz1ajFngAoDKCzVwJk6Trk2KpZ0tiiG6fBH06YYsTfLpkny5?=
 =?us-ascii?Q?BIwvk2iP/V0IrYBT4Wcd5sr2C8Do2s3irwe5UcWYsFWy41SajpvpiCb31pYZ?=
 =?us-ascii?Q?nx6VZt90Mjg0lp0dYM5rhj5ipqhcRMTddz8LZvCKEBH0DnvGkKpjhnH/mZMf?=
 =?us-ascii?Q?bZmi6UcYsNuHq810ZVVuC1kzTaM3rcfxzbsxLUkz1XE4MNjTo07rZBFT7NXs?=
 =?us-ascii?Q?QExg2IRcLG5fR1YF6N5YulfqAWXrhw50Tr3WG/bE8+YeKkzgbF92M/UPK7kM?=
 =?us-ascii?Q?XTByjGtqgUxx8yw0k5sfoRxZ1njMH/c4bl6W7NqqNt4iaFjTjZPv+nylCPzp?=
 =?us-ascii?Q?pNFu5op/a3Nam2yxtHN0GHlOqDJkjFTXrUdCjvOWPKBYIiu4LIfuoPNs7N+l?=
 =?us-ascii?Q?3XgNcJjIKQWRg5w+Mm6/U+drYjYMFQLsCC8iB/oVyJhI/7YucP3XPHmpMRR2?=
 =?us-ascii?Q?ZTWifNG7Eh4j0JZLSfcQaCX9Ezjm1ZYnxduNcgOuYGiG2sxMu5ihc6kYLPdd?=
 =?us-ascii?Q?xi5tngW6jhqLnoSyE3t+m7+ytb+VhYCDVMiA0r6BWY3HIgY4PNWLGdyWRNJ1?=
 =?us-ascii?Q?Fa/uvdGDkT+E9oaUE2tzeVFLWpHXDqva6Z9+w312S0a2AqvNQVY7ovrPgt9p?=
 =?us-ascii?Q?V8MhaNQY19JbxwQTzyb7DO0GRhLumHrQOwR/KgCYZ1csrH5vbxZsmqMmBuke?=
 =?us-ascii?Q?xnt5ZHWoAyNhyIklGSBdObh8Q1RqyuvSXW34RlijONQzOUHPoNARWHFl47vR?=
 =?us-ascii?Q?rQZYLqCKR7zuX0wyIiK6gim/ECN61+5OM/l6ks1vEvQpltrRz2aaO8SmtGao?=
 =?us-ascii?Q?qWE4Z5lQ5+5WgZb94gNqvBSBqnh6bT9eaFouDBOKRANMT9l3UCAXmalyBk1r?=
 =?us-ascii?Q?879EGc9lLgOpaB0i3l+8NResujfuiWp7YtPCRkjb7iRoQ1DdsxbPyOekSsfb?=
 =?us-ascii?Q?lcwjWzuJDuaVV4+oro/zKdM6sTk9WxBPG/vNZSOyDXLfHVfhbr4+fSMPFpk/?=
 =?us-ascii?Q?turCMCnLrAg2MgzW+/YudqKM5ziYHJc3wN1u1+TjqnJ7CtokOoc5lkKBcQ9e?=
 =?us-ascii?Q?kFA0sLh7yp3vvp57MXENmVV9vUlbL/9K0MHjygMml1v+paXF8wH7maEOcW1d?=
 =?us-ascii?Q?BZ3OE4ZubkSHN9+ndNvyIBCBTFQXV5RkmiyWI2beiuE8Ullg54xtTiWKkyXc?=
 =?us-ascii?Q?jOr3dzJPkYyx07M5PIS1Ul5YWNmmu0kb+OQKqtrinP0+0bZeXthyx8GlGA76?=
 =?us-ascii?Q?jFKfqbDDhvHAnQ0Cxrm6dl452ZEJqzzNM4kLmoNFJymcOCDrS+uCMK6oNXyq?=
 =?us-ascii?Q?mx3U5tkUNnfSODw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dhV3TAUtpI3AWlIzY4tXl9s55fzmIWC/DmHOL8juuD2EQSHG+5XaNz3QTUMH?=
 =?us-ascii?Q?N4csrxXqAmWHGHRaGzKUJQOrOypIva24iWJWJi3W2EBi0jY24S2PIhIJFovk?=
 =?us-ascii?Q?OzOstb7QRg5xbOqDNdfMWiCyGu+kLIkdQjoFX0PeokRni4a8RHRD3MGoW/xr?=
 =?us-ascii?Q?P9cxdeft40moRtri1rJPo58q3gc5arzdWLtAciP1KZYAg/2WpBQSv1Olw4JY?=
 =?us-ascii?Q?b/L13pJVWT6/8Z0dJlUTfBplYoaCnH1N4HrTOmUikGEEWMPwefiE7vGyAzXE?=
 =?us-ascii?Q?svPL2+0E9rzDdalMTfvu1e8US1ZRrgmWIuXqzKGRsBOBuuiTsYfwNc1P2jQp?=
 =?us-ascii?Q?XydfNehWXxI/yJATKnEhYw5MGwSWmxgh4+za3lEPQY58LPqioGFZQzmUVUum?=
 =?us-ascii?Q?ge2bdg/LsumPkJn/cpVmMStkuQI7urB0zDx53f8AaTjjTN13RLrSqcXt3X9g?=
 =?us-ascii?Q?zZBasGvIVS7knjmCKcTxKr4Ho7eUhpcdvB3SXyMQkT2Kh5A5EOR07p4TdAyO?=
 =?us-ascii?Q?yEiXXzneElubUmkpA2xkvRKcN555UV9KottWMfb5Va3kfKmpwOeAhIe47daS?=
 =?us-ascii?Q?ON1LEuCTOxoTViLdINlBwHidlzcWmWxMQy3Cqw953dRewjpddqiXrm+SwERt?=
 =?us-ascii?Q?p2IYHSPyAzKGBgpKS8rD4DlGVKqcogH2f6GPehfJpdO9y7ccimx+Tz08AiOL?=
 =?us-ascii?Q?j8X7VPy6cXu6TK7YPErolbTu/ULbN8TU/byuZCIICftDITr9iBHYRQUgUm23?=
 =?us-ascii?Q?IK+l3MmXyESLq8g6+fBpZXjsQeoPa+1Hy1ivv6YSByYStsfg3HgDe8Q3utvK?=
 =?us-ascii?Q?zl8bYbPzFUapf0DDcNQ2+FtEycrpN9SwHBOCL0yJ6XoXG3wenSYmaH9ZNrMz?=
 =?us-ascii?Q?pNDHofkyRQ1hfj1T0K6koeQjPGVwHZbQCCPzI0iM3lxIv9QFP14LVpUudlsP?=
 =?us-ascii?Q?uuR/7nzsbJ/uSBBE4r3Arglkal3Tlo/25If7vWyOtQR8dZQKD2WiE5mCOpLS?=
 =?us-ascii?Q?UNfaE7rdVHY3scihvh1qlrI8A9hsDUXwc2+FReRbdmSWJE6oh3so6crbeJqH?=
 =?us-ascii?Q?31RyHilytoQzNBrdNiXipAItnlW7zWZaD88n0rEjWPFZgS/2O+SnRe7afMwY?=
 =?us-ascii?Q?4pyx1lSFr5jwKBx38P7P+4NZmzCP9zFOkiRtaKTabFfcQHy7/kuJl+V4f5Nr?=
 =?us-ascii?Q?oDUmkXqz9ArvYYYFQhXeLtlLcUYWVvs4p0hBBQGW4HPnekIjz1hYKrVov+n+?=
 =?us-ascii?Q?c+IK+F3qV/gamQTwnzxmrzgYqzPmTIU96ovAMBWJrzXoh92MtcoLjEEb+BUx?=
 =?us-ascii?Q?jCBky/9aZaNNMKLuNoRqWfwvWl55xyDLdDR6D/78uWgrm2A86xBLJdk5lp7r?=
 =?us-ascii?Q?fzZf79bgbNidvksSOF6t04x71vcWBAAKfKvE09ZkTKTU3LeqaQsQTr3Z+OXV?=
 =?us-ascii?Q?NLoqlrsgVRlRgguXbbodHtwdRD/1uTaWymWRy99wOkHq1kBv974SIiMq+MOr?=
 =?us-ascii?Q?2Yv36Hx4lEjpHMyPqoajI8sCDm7RJYK64CVZMfYYak4RmY0JYzZTveelLghp?=
 =?us-ascii?Q?li2wOY63FnuoFkKlVnsVeM9JewSlVgDyERGAEfAF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7ce015-3e9c-4e45-b41b-08dda473cef3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:59:06.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpK2XRgPK6EA3U1sD9rKtAbX2mBv1iLea4o3sSN+5usYHhtNc8IRx7MUeYtYKGiQkiWQddR52BisOSnrmMxC0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697

From: Haibo Chen <haibo.chen@nxp.com>

The i.MX93 9x9 qsb has a ST LSM6DSO connected to I2C, which a is 6-axis
IMU (inertial measurement unit = accelerometer & gyroscope). So add the
missing parts to the DTS file.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 75e67115d52f9..acbd981ba548a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -265,6 +265,11 @@ rtc@53 {
 		interrupt-parent = <&pcal6524>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	inertial-meter@6a {
+		compatible = "st,lsm6dso";
+		reg = <0x6a>;
+	};
 };
 
 &lpi2c2 {
-- 
2.34.1

