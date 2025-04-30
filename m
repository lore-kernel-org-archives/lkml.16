Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E72641EE;
	Wed, 30 Apr 2025 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027415; cv=fail; b=ZUp4xci73jCdBAFuukxnfgyBiG9MdqAoYpwiahvZH17i0V5v0RusLEiATewY4RiK8SlzHjkxI1DmA9MfiDrc61k94jNJPiJV4dku/RSAYG9/v/rrMG0PvMFWXlPIQSkBP7RLhhXJaO2JXtcANOUvCWrqgGX9sC29ax7ph2pCGek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027415; c=relaxed/simple;
	bh=w/scuSqoL59XjUppGp3iEUm8pGhxcqtG9hcOpG3rNxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OecG/QoUXDzEQhKdWiTYGV+r4kzUqu+eJSUDvJg7BEpUWSaQmeCJro3xSrtBZXgntK4mYzvSIArYZf9h12TkfFMP/tp1ZsZPi/QTfSdsqupvTVMQtEOne7nJJ0MjexACEDs9nEk/vkcz3QKu5OuDcJDgAqiSmyTSEvzqlbc8a6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SLFdTT+v; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SLFdTT+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pkxny1mdP9/1/kNVSUtRgi/AbdaYOY8oYmUeN+Wisjwn12iK+ZDnyEQQOnzF0n64WYMzYlgl0DH7OLPXlfjBAHyyM7ozwBvLXUioJUowC/dTm9gcqOV2wS+7RK0yS1JeWBH6kqNRfF97Vy6kU7PzHwjUFqmFvyhEdttixqahPymxHS/6x+ki8xEO1Xf/JXPApAXM0jgpeRCQ7I/QoUfQ+i1bnerqRu+xamfemp3nBsoWstaLy+AaUbmZDsx5Ey2xbZW9HBY9Cu7+YQC73YkDeEG7f4BTWeLyZ0x3Ek+/FKd3t+i3PURs/z264QZgFDwvhXph+749rv0AcEIYjyoUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5xIFP1ic09AMYa4QAp9ieFDpPx5Pis38bPTq163VwY=;
 b=wjLIt4deq51lxrEtrO9O+uzKvWO31qZOsFCBre3JFm81gITh4M03EMtesV4Wp4BEUoT9wrMe7dluxODwPORRehvaTLXupUM1sHhvq7GUIQzEq1E0CVDEMIS+FLM2eGwTB/wKvFBvRXc/TeWTKMct2lk2DuhSMcuAUyHU04NmU16uKI3p2sFzZ9AgPgEL+dLy0Igi8gGpDw54mEebwe95fnApqNfPS9+PYAoxYm91By1CshKM44ABA/xO2nBMa1L05X+jWfs4BRQ84lj2OmyHUpl4IrXzPEdHXyqD4hG7uIdDP2ZBJanf2tteAlzi3lyO+pbaxXFADY1rofV8TczQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5xIFP1ic09AMYa4QAp9ieFDpPx5Pis38bPTq163VwY=;
 b=SLFdTT+v+77nfWtJ9/lIIfP54k2jgKmlmTIigq6lUoB/8mwqOK4kKtd9a+UVFFtEw6ItBKmsmhITbqIHX+jgSIBupglLsV/8WU26kTbwvXWGHmKiO8gJv784aMlNfMJp8xNZ3GbeRMViBBxc6VSre8u9fsC/Pg7S0qi0H5C16TO87UT3Bb0vS6fIsDAunWK+bvERIpBu3gSBpL1zgfU0bfzik3bSgL48urvXyaegigMWpZcKuwurjrIsAmTKpqO0oB52u49KkRXp8/Di/OCadyKUMr1IHjD1wKgHD60A8CrnbKH0l3H0fu/cONQJaEViF++sqZrgoEO1dQ0T9uxqNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 15:36:52 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:52 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Wed, 30 Apr 2025 18:36:33 +0300
Message-Id: <20250430153634.2971736-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::12) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fbcca5-dd3d-4d27-8a8f-08dd87fcd422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SISOHQ5uh5n6swPamPIQaNaeK0LUbKjhpmlz/Uayxapy26YVYyMn2zJMFra2?=
 =?us-ascii?Q?0MZ12dbw2Ap4C7LwVpFk1TUcveDEu+KWDWRdw/stK+RWQ1vQ91sgpLbmlasu?=
 =?us-ascii?Q?xstsHNNGhhsSULoxZQDA+0VpqYHzc+JeGrEmOFu7ZTUU2tSp3NQnX93iXDHR?=
 =?us-ascii?Q?UNKC8BLmVxNDKTgwH/CBlyQC0M3JG0DvFtRPP8SnV2Sr6kVrk71WsR5740i8?=
 =?us-ascii?Q?yf9IPYL8qQXcgYlCtdDgd5wf8KU832dYdURp9YWNkGwmeSG9Tuu6v7ClhVRV?=
 =?us-ascii?Q?iMwMwHoMlQ2Sw7/i3x+X6jGqILWuQ+pW7Ocz2Y/LB7Du0cFDwUDFZr0t5osO?=
 =?us-ascii?Q?2oIv6qw2eYNninJ5T4bLkYLRLCPnKLCZD7fSA5v5wuB/xFf0a3iAi22/yf2t?=
 =?us-ascii?Q?WsRqFworsO51AU65Man/a6xE/mZjitzPL86gjOwaQg3WtnKLo0I2u4Db8TPs?=
 =?us-ascii?Q?1n82njF24exnsK/zOVKlH+m733E2p4yKnEXG0fOXTjLRKqnY8d8h1KVafYC5?=
 =?us-ascii?Q?P+k3SssEmEU87zm6tUEpCgxalbi5OoIPDWawD1sgS52bff4xqPtnl7ZmzUez?=
 =?us-ascii?Q?hF3iIzXKeyYuFSJlaTRMuUWVGu3I7BQYjs/Sv1XEpawJ8YM0ZbjHoGgAPEaC?=
 =?us-ascii?Q?lkaa9hkNDfLiPYW7AWE8a/oeB0C8wYHBCNSxVAOP1X9iPrY7sfUuJ1IkrcT4?=
 =?us-ascii?Q?kka+/1bhg/foiorWQh/wCyqgYk6H5rbBl8ygeULRWYFckut3WDldoEMAuv58?=
 =?us-ascii?Q?/BmHsC7no+BMKihOa/GnFE5uLBk6B7TeFYoKXZaCzSnoxkI4ZR994x/lCzis?=
 =?us-ascii?Q?e5FTCGfLYeDn2jHPHJEndj/lNUMZvzAcBV6EstDgClAUnA3A94A7XVfUsxCi?=
 =?us-ascii?Q?ezGdbAOZglPVlr3+pKl9VOhF6tiIcyPxf9qnFM9AlgUQmAm0/xg12y0uzCAQ?=
 =?us-ascii?Q?XuNDu7YZb+clKMqOT/gOjRdnEcH/H7JrtMpRDyrK05dwEizVRVUIg5sR6rv/?=
 =?us-ascii?Q?Xqgv9+ts9MfvnH3R75ni4Fg0doCfNqvr1I9F4z0h74Q66LuS8Mgz5siSZe+Y?=
 =?us-ascii?Q?Ezh1KOOPhh7mN0sk6hkimzUmdO2ZyfXCu+FHIbBdN8kBRfnXgIEhf/Q/yHfD?=
 =?us-ascii?Q?AKO6aeC3f+t/AgzDna74ZgTuydydw6fzTZUr/G10qEKGcsPYp6xuCYknFQaq?=
 =?us-ascii?Q?xqM5DbAsDXDbSi0sxyPbcIqcL0A5dPrm01g0LJTwO17lO8KlXUtZHG6wNIsw?=
 =?us-ascii?Q?6Nh+tl8yLQaDx6ePGJd90K5tik52EomEuIB7FLOi80XTfZBXmTr0UDg47e/K?=
 =?us-ascii?Q?xHnFQRWnDKAJnHfRLLdrD1C6U7YWHzaJ//RYrU7pNAHePBis7AuzzkCLm2n2?=
 =?us-ascii?Q?quV/Thqa6PsnHIRb2PQzP20z+4HRs8OYzKe1R1mtieL6C9OR1U/FAzON5hQ6?=
 =?us-ascii?Q?BBnjVN5YseY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fun74v+O0l5Cl6XtrdbMD670oP2d14rigYWO9Ty6a9/KbeGxEbHXMIWhhE4U?=
 =?us-ascii?Q?gc6KA3z3dKRiTE7AfTqEKlsTegoysSA4X8dsPjOL6zDTUYhn2+vbNbSD7cQs?=
 =?us-ascii?Q?qD8eeQ6BNSO5oVp11fCnJZFzG2+yx0A+EsCvrcX+LXwGdmPPN90Ntg/yiK5O?=
 =?us-ascii?Q?77WsEv0j/vC+Wg/ctVdGwd08zI61Qc31VUIPV8E3Z/pOQ1Vn2P96th0OiwbE?=
 =?us-ascii?Q?BXNnGGR3xheetKtYwyx4Quh7rUwmxDKESmJBVqlk3q5F9X+x5rIpbHQ+HMeg?=
 =?us-ascii?Q?NF9wS7EwmffRHhg2v1UZ0x1jmSDtXXIbBbeGXw5+TpKCacHgaM2lXnnKLe23?=
 =?us-ascii?Q?kNdPOvFJYhDGT4GfHSyhuDDDArJSpux96TjAy39MJSg6ZsYT3ViiDWaVApWJ?=
 =?us-ascii?Q?dFJ/a7fba4tE9Qybfa6psDRA/LqxCL6K9OvRTLLD42rotxRePtjAgAD7ExmU?=
 =?us-ascii?Q?siQS5DGiDdwvAyEZ/aCt9kITRekwXidoCikAVHlxChz2zkhmO3OHV3jKvbvf?=
 =?us-ascii?Q?hM8H96ojajR1VtGlS9TzaNO7BGRGiM0l/+sjQxv+w0e7TZse3IKK+YfOyCe4?=
 =?us-ascii?Q?TlJd2mdWOkgMClUd1Jz4BO9zt3qH84SgxVGbZLSP7MzcMmI+PaMxtkBheNWj?=
 =?us-ascii?Q?Sr7WuVKqrVtg2d/eTVMgO4vLlYpp/FajniVm+Y+tpQ0Ub7sBTNg63PkgxhTJ?=
 =?us-ascii?Q?WsAME2H2Q9nesIsOiYF70+4kFnzfcLQtyg+JfRteXU4vYS1Lu4uYk8XqF30O?=
 =?us-ascii?Q?8S9kgH4S4I77XqY/TQF5nB5UrhS6+djcvxCT3vbNGik4XZLDCXLQF03fiVC3?=
 =?us-ascii?Q?oNIYNgsLzdOw5k4Gg3JYfBn+Xd1+k9bNeQV5oVLNh4WqV7X+y+sxn1HD6Igq?=
 =?us-ascii?Q?/4+a6M2XCM+6iAHCaF/spZaWopji3fGVA6ObGDrUcrfjDpt269c7bXhn5GVh?=
 =?us-ascii?Q?0XWBOa1hcqOh32HlRoW4jvC/u8tIkG5gw8VVzKTdlf+Nv0+wZsHaeeTAghYZ?=
 =?us-ascii?Q?ifmc6Jaqgq85Fq2Gj0Q0vm8nCgDpoB+/sKKdrgKNI7Rl833XEwh6YX7voIzH?=
 =?us-ascii?Q?ZqjiLNf7wGd36hk6qDvjuH9VFno/NqaEN7Lp7EmClKng0vEBFXwZupBI6kIa?=
 =?us-ascii?Q?pZXG+/Uhp3ibIEwAqjxBi2zTHXRXPQOPtjhA1SYQkj0Z6NASmG/XFEK3eSHx?=
 =?us-ascii?Q?c5E8yvU1v8fF7EIdS0xnt+3ERFLfuO7V1l7qryd8gM0TWi1DFCcLkxglv1mt?=
 =?us-ascii?Q?XXgHBnjbWmRM357hcNhDrPn58mOBd0aOU/qdBtxjp6tJ3UIR1ot0co/8o6R+?=
 =?us-ascii?Q?gN2wpiH4MvO8UMoEsb/fVLbE3L4nX83qoHDG4E0+J4JpYTohWtn/2/XqSkI0?=
 =?us-ascii?Q?whbF+R8T2rAuXjNvBn8FBfTuOfhje9xzujZOudU4v2tKlCBudK8DVbJdpU4F?=
 =?us-ascii?Q?czUlEcWo94NQiPC/QPNO5Y7u0lnWNBKR11bVhmqe7ei1ZG0a2F85RbASNpyK?=
 =?us-ascii?Q?NU0oPlSHBKqWCj0DFtwH0TrE0y3j5alNqv5ARQXIzgLv84OpwvDUvHrTX8HR?=
 =?us-ascii?Q?k60y5M3HMASCLN54L4UeLLok1/4PL3yCr4Xd7EpQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fbcca5-dd3d-4d27-8a8f-08dd87fcd422
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:52.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PLHGItXJuA3xfFl834LrNTun9sTIauq3xf3Qvjav/d7LCef1QF2A78JkWrwlCTUw92O5qyB3DY4YMiUzdLeiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

From: Vladimir Oltean <vladimir.oltean@nxp.com>

The MDIO mux on the LS1028A-QDS never worked in mainline. The device
tree was submitted as-is, and there is a downstream driver for the QIXIS
FPGA:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Adapt the compatible string and child node format of the FPGA node, so
that the simple-mfd-i2c driver accepts it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index 0bb2f28a0441..58b54d521d75 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
 	};
 
 	fpga@66 {
-		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,ls1028a-qds-qixis-i2c";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
 		};
 	};
-
 };
 
 &i2c1 {
-- 
2.25.1

