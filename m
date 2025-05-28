Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB42741A2;
	Wed, 28 May 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422487; cv=fail; b=kEUlVn481VjfYd/O803DqYTl3JjGuECUfHO7hBhP+fFZ1ttxBZiW8+c/NJ+XJRYw2Rxp5XyLtTTY6aBBUb1QY9y7VzAW6yZu+YjBifMGllohoglkkvQ5GjSaVbQoA95G18rcswK0wwUa+BowH3tW3/8yqqawSkSct2Qdwz9eiww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422487; c=relaxed/simple;
	bh=gzscK+bkcNUhMSGfqRJxwGEDmjn446sdyjrqf91+zi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CtHTG+Uf93wQaS7RnwHlxvq44L6/wluFeXwqSFcy9eIOv/R4vn0AX7Bve7t99WgeZGLBuBWWpCrzDwRKuHeANtQE0YXm+7AQ9PcnNlsYDIr5cklijhNNIHujeposjew3aCMWt9QT1vampmMEt18i1oCEN4tQYQxFvho3j59c5TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E2oJjMQw; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E2oJjMQw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjLGvZpwaVSimGSjNejJF9sjS3PwCUaQgtdT5NZRdk2Tw9LLo6mPhEBhdeKMhQ8xJomHc4Vz96X23L43Uz7z5YOFF6t9AXRAhMy6NXXm2PpSgRerXKO6oi0mbfwih4pgagLi7FfO5GBl0xJQEw9Yf5rH4JH1RJ2j7d8xeBj3COixOFdzM9Cmre8shhSWXtUAbCo9R16Ift+QIjJKwsbxSISbNSqn+u/MfPG1YCpOuPuEVtj/mGTge5DyKQTq0g4hNiFiY/EMiu2W2NT+hExaxISZ+E+PEBZC50afhZxCHL9Y/7jIVttz6bWUCj3vNVrbUmEdG4FKH2NIuqjqIFdbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OfEQy9CAuUDmwdNnE6mni3ZXagwk2dCBRyxgz0Fby8=;
 b=aT2HOOfe8OQtQcl0KlPy8Y2b/tcOtK7WdmE/UcyqyRPOD+MBZXnH9LRkp3uPEb7aZaavtBQVtd5lqDQk1aEuYYMSjx0hqso36G+/DORAToMIvXaNpY5OXo8NPWWnMVaEQfexhZO+BLKKhjWUJcKHHXIrfSvEK/0q2Fu6mmVS952fMvefyq+v8VZyYqI19/bKgxEJfIrWYtxG+EdhEA17kh919oTlXC71SDLXyUmhBfVpStVB/WC4Zmvl0PS/BpzfC3UQ66USmZx8MCmPD6icMPLCA45RoXn22MuHFN905E96QZxUYMixMi6TdeQhMde2kuFnpCl63EBIi7JprJGDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OfEQy9CAuUDmwdNnE6mni3ZXagwk2dCBRyxgz0Fby8=;
 b=E2oJjMQwVGeklc0VG7qkk/vhBw+UnAgUMQlCuggPn7RmyhaOf84+W6r1A9BGmBvEeHuyhi2dDJfXIF0zsio8noAohjzaS9wgq8LvJboVd85aeFbWb+TRIvvFYOi7vgRpZOkWc2Zro08S5eODSqgAK54rxkvSbx416RksWieedWQn5bMCFpIZE28ezpLgXEhl3+OQYK8dKDx41Xo1ZXIVkVzcz5EfHNJvPbf+Ydf4Tjb2OhKz1gSFugzAwBcmy+xfH2pu9eN3Jr+liQhFkIwFLKwfF09JK/R7vLLvjm3cWMgawI7UdBtomJk9330YlVHutXlaJ4NnwYCNFEonra59bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:54:42 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 08:54:42 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx95-15x15-evk: fix the overshoot issue of NETC
Date: Wed, 28 May 2025 16:34:32 +0800
Message-Id: <20250528083433.3861625-3-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3cedf1-bf2e-43ce-efba-08dd9dc54947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kB3Vza/UkH06gjqWQkQ4Vl3sdhlLR4NJrjp9WfkN/PMBSzzjjEfDbyNoTz0f?=
 =?us-ascii?Q?QWsg86HCIwbBqWxn7dBYZALtbxe8rQNWt+4ODQH+KWka5dh7grJmI7/xmwIg?=
 =?us-ascii?Q?KPzECJC1R0rWEw1s8Rn8Wup00m0Y07ATb4e9Hu1ZsLOggUxWQhlktVepIlit?=
 =?us-ascii?Q?VSgSmcKjwcUyZqmjOFo1JodFO2xfCwkEN8HFu7ocILzPWrhG4imlSuNbslrm?=
 =?us-ascii?Q?MDJ/8/F4o1Xj54V5dAx8UKbaGKiiOfPedgBhBom0MlE1joN6jeVpA7tyVzTM?=
 =?us-ascii?Q?6Kbvh9TNS7vxJCruB+NtpFPdktDvz4UcYICY9YFefQ8jmPkTV/UerJsrbJsD?=
 =?us-ascii?Q?LpMn2n+YQw6d0tnm3WP1sOBVUdtNdmzW2KS0ixLf4lVedjfDu1Xe54hx2PFj?=
 =?us-ascii?Q?V1ct9AJTJawEFOH3/xVy4MYsnGK7P1bMLjOiQWkK+l+KbOMyFlDtTMQPuZlx?=
 =?us-ascii?Q?yxZWB1TlR/91VhpQ1Z3WitGgjmlkFOcV0XaeAf9zXRL9jUJhK41WXOK6ym7H?=
 =?us-ascii?Q?Ejd40ODerigp7rMCssJt9n2YVxJaII22IBowBaCxWG3WrPEXzbAv+5fWX5la?=
 =?us-ascii?Q?P7gncKNO3W3/ZUXOlXMQbgHH5Ndi+ny+sBKBnV4WxfWx4vQTfBbNU/6nqjIt?=
 =?us-ascii?Q?4PHs19ZQyTMvvPE4TQDtQCD5FKwVWln8goFspMfpoGCQSgRA30cCYLdj+7/j?=
 =?us-ascii?Q?Ksa7OBBCr6GRXfZAuOxp54p260zc+aTPGmzrx/qfnO9z8nGnqx8bdBklTO36?=
 =?us-ascii?Q?j4tyAj2ntqYedgfy80pvgxVwJ6k2OxtPIGnfOvVsDmOkwVEZqLpHpEUMOCh9?=
 =?us-ascii?Q?GQBJTjwaymJlVSv1O2ki2BI9xbzrcAtlIyWrAZsDHNw/QQvu+b7CpgI+c1yO?=
 =?us-ascii?Q?hUd0Fq+P3Rv+QDH+8Jb2nPSp8ni3I88p8Nebzdig1A5l9YQIP1eJ2HtrgDBK?=
 =?us-ascii?Q?vtMu/b2F8kcipAbIidczNE5JirVZtf5JCXKE15f1TE+p18nNj3T26ZI2KcBu?=
 =?us-ascii?Q?2ANRqxH49lgA7fcNox9y+mPw4i2fOxkYOO8wcrRten/BPLfKMiQtE/sI9cmw?=
 =?us-ascii?Q?R3h+kPqf1gF32cZfo6iqq1eUdpiA0i1CNXBQnpMqz2HWGrDIWk6nclecgbbq?=
 =?us-ascii?Q?3+HxvOMqzu2J3Aty1nvBVH/B+KVLYCkF8mmuZIaFphG/1QeY5QH0T/fXA0tn?=
 =?us-ascii?Q?2s1TCUqpaPvmd+IrxrUWDS072y9Zr9c8MUnOnMy67aWzaaxa3xcRpm876b+M?=
 =?us-ascii?Q?dwtmP75NjTVXNyf1vFrMWoMqFuSdbacW6rUU2KAerYXzuY8DdCLzsPzQtjVj?=
 =?us-ascii?Q?VBtB9q1bUuncrYe0QzgPmcKKBEuuGCIv55XfVkzeJyGoLhGS1ht+Td4XSKuH?=
 =?us-ascii?Q?jnIF2ORiEGLGJqUxuOrZ2IXE+liHXPpKHkywNeO07I8JHHcutBcnPMHNRQcr?=
 =?us-ascii?Q?nVTRzHC2PXnu5PRoEwMjnatZCx9oF+OeqBTVDe/Kf5YJNW6BXsP+dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3VjsqiTu4h865TJHcIw+ef8KvOWGn+d3FSFzPkRKAYPcETUVjC6xEZYCgCG?=
 =?us-ascii?Q?0k+pGoKJpO2rwV5KmvhQad42TMTQYTI4UnpOvViRnvpQMnw4UuojIVkIac9s?=
 =?us-ascii?Q?DsVfrlSByKeT2S95swW+zD6g+VFEyslm4cgnRx0aKkOKt11/90tquKEZVz9H?=
 =?us-ascii?Q?0XPygIqtneB8jvRFyhvEPtWdIbhx4JzXXVKJ15vnFPO7kB6Wte7EWrIVd6Y8?=
 =?us-ascii?Q?uMqQbOfGobTwUirWr8vKmkTU4Ij3rcoqT4Sa/WulzvD1afMxEjonXMBS6w+S?=
 =?us-ascii?Q?yh1E55qcTqpvFZLIFLwhQ3hXQvu42/R8TgmETOBxMqZZrPr3Yfcvh/Kt0j90?=
 =?us-ascii?Q?jl1JSwCeW2aDfb+HsV/ypzRWSb1IoTvdtHGzFf8YSVSQBP8iurENSQrXQS80?=
 =?us-ascii?Q?bLGclUbC1NjJY1eWkKJhNwClppBb1B/wuyeZ6OFuGZbUdf1qGTtIOU+mQw9g?=
 =?us-ascii?Q?HKE6nvXdoFL2aNq3pEkbdGMdXZ20Vdph+T3Roz1MEQDuSiwBf2Py4arSmlz1?=
 =?us-ascii?Q?HYAE82a+uwKP9zM89tBRpPx7cyT18e9rIixeZ44lGJePS7lDZud/bcuU8+rJ?=
 =?us-ascii?Q?fn0Gkz9WU9ey7LSGjo6R6DNdD60fbH6gWG7JWCEFmAaJ3iqcsU7d0/ujaC+a?=
 =?us-ascii?Q?DQjoscLMOUecQmIuXWsnA1SYyyCAkMksr3jYwBiXH/df2Wb0XBCkpz1R7lr2?=
 =?us-ascii?Q?dznoe17GGzEklK4DcBctzekfIi+BmKTAYRgdImRG2MKHrFQeExNWuV9NCMiI?=
 =?us-ascii?Q?C4ca+8pht2+KLzGug0/V+hGo6tSDW4xLp1duIp30XWJKAs0K4Yuqy/VGA8Hp?=
 =?us-ascii?Q?WGRQTaYQ7qCmB8s8c6mnGL1Ety2j9pvvNdyDM+BUVtXleGK6iDrxtXyMEJm5?=
 =?us-ascii?Q?mlFCOMUq0RvNi2GZRl9oNAW5TPLX+o/zBH1GH9awN2x+EaVZJP+NFhO3LTF/?=
 =?us-ascii?Q?cX3iRenj3KltMYzd6rCxdI4RDRE09+HHYi/iF2YcHyar5jzL52sv0icgIu8K?=
 =?us-ascii?Q?/GjRgOHOPPPPXl6g6lJZec4abgEXCAp2Jpk8hQUWYvkqgy7XSmPdaDZZ8FFv?=
 =?us-ascii?Q?IpGQCUDHJbaHKSx3ENmNqcIpKmCXCaecVFcoyT5mK1gklQ7J84QjSkh6oruy?=
 =?us-ascii?Q?jyjlGdIJplumb+MEVAl6+l9PMT8IErGMWwJezBxDsRDTxJYa7/5+kCzTQ/5S?=
 =?us-ascii?Q?4yAkOF7IDOZ7URgoXu0Qli18LDuPqL9lGB30d+uy6xzemYh47cb6dxhFrB2f?=
 =?us-ascii?Q?e4LupZDPU1COO2KoqJrdt9RVjoWMPIpcxQHSpXPM51ePFf/8LfEFWmxe9bB0?=
 =?us-ascii?Q?Q0hhcCTjsxS60UyAcrzVRYZF6TLjjkhBAIDmlWIusZwod9TAntwuuzM/e9TL?=
 =?us-ascii?Q?Y0XM26gg8ZypAm5lokSYPA4yMK49u9dKe2ELCnPX3IHSrc0yxdZjwZ5Yu9Ff?=
 =?us-ascii?Q?IHsupvtHRAzWoEUartlgxLSDWgGiz0opo0rC9+RqaVZQYX3InGuiZalXehU2?=
 =?us-ascii?Q?UuuZrvWPWX2mfBSerPzgQMcYyTUtq/D/NQAc76TFSnJSKn73kxcHxGtnbBFD?=
 =?us-ascii?Q?gbVUUC2lkqP1YwT/DtNNsd192ZYLipTl/oDuGpma?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3cedf1-bf2e-43ce-efba-08dd9dc54947
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:54:42.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkZQ/YNZuLTjzKaMjxjbDrHfccI7Obs1hk/KpK4jvTtmExqZpufUnlewr2pUHYrFIb2oizC0LpneR//lGnsEQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

The overshoot of MDIO, MDC, ENET1_TDx and ENET2_TDx is too high, so
reduce the drive strength of these pins.

Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6c47f4b47356..9f4d0899a94d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -574,17 +574,17 @@ &sai3 {
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
-			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
-			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x50e
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
 		>;
 	};
 
 	pinctrl_enetc0: enetc0grp {
 		fsl,pins = <
-			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
-			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
-			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
-			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
 			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
 			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
 			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
@@ -598,10 +598,10 @@ IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
 
 	pinctrl_enetc1: enetc1grp {
 		fsl,pins = <
-			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e
-			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e
-			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
-			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e
 			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
 			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
 			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
-- 
2.34.1

