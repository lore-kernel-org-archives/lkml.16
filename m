Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091D22B5A3;
	Tue, 22 Apr 2025 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305074; cv=fail; b=PyloUSDvNzUkvbIuV6Nz8U4uFYs4joUmTK0L0/tm+VLPTDuZNuUifZC/A8BTKpPdHXYingrRbb8yqjL6RMdlcXLY3wda+YkWwryyvgqhm2ljIY/rVC88RB1lNeDDPbgOTMX1hZ7QHAgom+QEQZIiR02jyWTU/blcGPeLj0Qcwf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305074; c=relaxed/simple;
	bh=ktm3ju72WV+4MIxuFd7M/6EE38vqA/xZYiLdqhc+yK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Aq4yjoZER5jSjOMP1e69g0hjJWfD25tQuAnkpb2aiIcmtUj6NzP86NuC3NyCaicD81uKDG9dinpqiWxNurFEUFplxXTm53yxxx83KB0LVAsyrwziP7yI/ViowjkMAE95QUMuSwUgBGh+GIWCpxzFqWd2tM5+4qkDRyqB75FLpHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TKWQrjC4; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TKWQrjC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1ADw2P1shuYsXXW8SdLjclqWanFVDOBSfXdQnZHzMpMceXhwOi/JBt/aAUK9clzSWVrBPtv/MSWFKnYSbWobYqg773LFdZ2ujvMqbXlp227jWTrcRv4shpNDp/fPVcbo7baCzsInfFm8c4RGgeHxAP5g+6sgm81vHCGBUboYJzHbc3izUlqjuNqCMbYYQdx68PsJCiv8sscmnhCkYsLOrnSbqdrkw3bytaBN3Sba1S18N11EM34RMB4Gs6Z3+42s2teM/ImVSPe+nG5GR7USvISABSmQRS9Lhn+F5YQNo7dXW41Y54wakF7Lu//pBBoTaPelIt0eOUBsgRcBqHM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WngHa75Hnp6MQqV77Lj8m27lrApZ+GjDJcuC/ESixXY=;
 b=wjtTuKINHNFsrGTaw7EfScbguOPD4Z079ybja6q2rSbkBjazE/mvXB18KiVC2HlQlT1+d/EXaxbJjeaCrPdSyz10lotOTA9UxNp2kbvOCQlpP36dnDtnHsoX0xWbtvD65eh//gBPdvWJ/XqRXa36XlylAsPpEnWBUd1W4bxkk3DRuIXSEsMG6NOjLZUip9m7uR3jwus4+zg5/n21e5M8tdiXDw+Q61MAfAYzj3AHO9dwRb9G5v2wf8sfU5k0mcZgBQgTVOpD1zkDJtDN/7BExmKJaigWMYobdWC4xKMwzy03IzVA8hbN9anQE8t2TPKlQJKKRt4miPsXI9NuLY2f7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WngHa75Hnp6MQqV77Lj8m27lrApZ+GjDJcuC/ESixXY=;
 b=TKWQrjC484IIFWH4VHOFs9fl8PougbC8yTe+CmIQnELTEZjttDio83WG9dtpMn/gjE/l5caNi+9yJZorrZg/R/FuDwUTDV7K5Sr/hSpnjpERavjcEA626wNtHCMbwhdAgTuHlGq3GqOA1jLYBhKGPuyqGDrUUWOjDiVfCEWVn5w+WHoi5DAQ+7lNnVByJMmii4XgEptQibXd70bdRWWnGPTyC438T6OgawQ/GsdYK3KAOyjNO6NiJYqp8qLgxM4S7A/y8MJaLhyI6Bt1x+LJ91QCgsWj+X66ny+ivbIopiuC7A1x1nalVp2Glzx7OGB5C4wZu37qjdGvJ5SqsKmPrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DB9PR04MB9937.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:57:49 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:57:49 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 3/3] arm64: dts: imx95: correct i3c node in imx95
Date: Tue, 22 Apr 2025 15:08:53 +0800
Message-Id: <20250422070853.2758573-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422070853.2758573-1-carlos.song@nxp.com>
References: <20250422070853.2758573-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: f84a58b7-e0cb-43f6-ad8f-08dd816afe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5+X4SuzYiDVuIyeNpi3mVqGbskC8IMmJrDzM+ETu+8ZqQOIZbp30qYEPbI4U?=
 =?us-ascii?Q?3J7d8NX8KwuhH0C5NVnmK4pIVfxybAT60z2cvqEm/q0k3mtj5YqJeMetXC7S?=
 =?us-ascii?Q?+AeNeM/V5SKkEdLjZBnpCvcdUfLtu8Xj5gzLCCyHMT8C9KutQiJk8jn2odzV?=
 =?us-ascii?Q?YMiw/akBCGyqtn1+gcD+PCqV0LuEx7+RHxpPgvKwK26+bCjdV4jDT8sBafGU?=
 =?us-ascii?Q?SrjHPAgnijFXWcwTHQNu+6zscu624xTo0S0LCjsaZ4jVvyVbKLj3AjqXOYQL?=
 =?us-ascii?Q?2t5ihxyvm8XdwoqeUrzxSCM9dEkC0GTQ3KC3HqLRukWZ4p+RptZSh4AwxZIV?=
 =?us-ascii?Q?+nG46IckzpYnbfPA9E311G852LvgQ3ex5Vn4iE2+o0QrD0yWTxRT0ZVojsB+?=
 =?us-ascii?Q?HCTG8XtHiUc/6y1oyUHUxLqkH4ctqLiwDmsXuuzUUBEJVI+U4+SYvAz14pqB?=
 =?us-ascii?Q?gYFeOV4YNB7ylPdqkYCq58U4F4YKArHpPv/jlANHAJlgnyg/AO0alFPVPOkz?=
 =?us-ascii?Q?YxjziN1s7E5/ObY3l1IJX5hP765Jlbz/poRYRySVx0VPb/pkSgPm4gMh37Fy?=
 =?us-ascii?Q?gXSjA5MarhpdowNG95QpttlP6qHseJxSojrnSZ+Pk13E+Ys5UCrvSNkPKAwY?=
 =?us-ascii?Q?hesyjiaajDSieABKBk87XwbpT7YFp3BnvoyA/3AHErQHUI4x0rDmgmlfv702?=
 =?us-ascii?Q?HfWJKGWGStVix/IKcWs6jJWo0jWU/npWd4gN1bLZDchkon02qWDDujC8qgM+?=
 =?us-ascii?Q?97Z7ANefxjzSGvUEYFQ7lpm7T1Dg9lLevrFK+oHIqIiJEvz+9E3yZjYgjuom?=
 =?us-ascii?Q?Lo+PT3q5Wrkr+2INWiw212yeKCR6FELf/OaIVUgqRPvzs/hC0UA8xK/1I6EY?=
 =?us-ascii?Q?dcVMvNPWSZA+h+mGq2XOdd3KdJR726duvnt+GkC2TmIANCkTYfQR4/cCzqf2?=
 =?us-ascii?Q?7VfEexvv/XYVC8gKooYJCyUciRr0O2tCH9TjCG1X8z5DdaJq6jDnEra19jRl?=
 =?us-ascii?Q?kI1pq1XHuyEpdCC8S36dakeVbSU8Sa5V52zBLo2vvxUqp/cy9y+iBsBW4jTS?=
 =?us-ascii?Q?8OhkQ6dY77R8KVi0eJB4mq/h6kuAkwYZ2wwoSkXgB6UmeNs+Xg83nq/kbbka?=
 =?us-ascii?Q?ta8cWaqIgA87NqQCG+gHPm+MKfGAD400ekNgcPhUgJDIlTAXuDbG51rG+iqd?=
 =?us-ascii?Q?/+wLGaMREZb0W3woNKMjoAC8SfA063pxwKjs8SP4PStAGzJoEEo8ftc3dyyC?=
 =?us-ascii?Q?JRQ8pJT0RPkeWNCKy3LwJba7INlVKkyEECQfj/NaAbEPs6X5SFGc2QW+ClLc?=
 =?us-ascii?Q?+Uxl9jWDba9qpLDRGyFyIpOzLShFPafaj7hxwVoHIDgQ9r4ieXDXSvUy6g3g?=
 =?us-ascii?Q?aywabNBUbDnwQhqqFd9cHjsiESdGIQ51S916gcQnLgRCEW26/eod1Sics0bu?=
 =?us-ascii?Q?4wFj7PotI95s16C0KA2SV5MFfm90a26IC940jC3gVCYdTwBoFSeENjUKkN4J?=
 =?us-ascii?Q?QAxJDsDTQpsVTw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zFgiK4vLLpMattyEjVy2mUvUnuAHpsymk2vFX0nrvo2bIuCGiYhi0iETGyy?=
 =?us-ascii?Q?Fk33Hm6PHLAUH2zohP3easpRDMPBF7aChHwl0p5Hh9kmdDSqw/J56+EqBdWJ?=
 =?us-ascii?Q?LCHm4cqyk/3FtofKqCRPPsrsGbe1vhu5vT7Nr/QF0Y7rT7RF3QtTu5Lb7S9s?=
 =?us-ascii?Q?mPgObol/M96LjQTDHlbmCzy31HfmQpuRPTf7MkOGtLWppE1rssPCl4dnmQR0?=
 =?us-ascii?Q?wV4Iah/4Q8mPcV0ArHmZz/pFGphwqfOTNOIuGprJduxZzhPrjrMHBjkr6bli?=
 =?us-ascii?Q?aPkyScWuJg6Tmrl/Weg383X3F++V9BKIW1oY41zBhHCWkmUbR34aMyLx05Sa?=
 =?us-ascii?Q?XAsfmrZy5deTuX8tq5kXw+iGxQZKNCQfHMxLqtg/5Oes56GuDnUowqQaT5Wi?=
 =?us-ascii?Q?mqxCy3G4PCBhBreDD3eEtKiYvPMJgd9/n+8L8U81illZYI5pJmZ9DCo/eBGn?=
 =?us-ascii?Q?/2V9dJGcaOL2FDJMaGWe1yJUy7iv2c2wP4UlXdn6ojWLcqYaGwweKpDAkOs5?=
 =?us-ascii?Q?gF7UteRXDmEUkOg9Cxrg6shIUWa9Iej2qzb6QPP/tiS9pUU4/LvIo4yWKbFJ?=
 =?us-ascii?Q?hJnmYJcZAk1S3ZijSnNTT+0jkS6R4g/z1Oy/w9uRNIRNBjIiS3/jNpJ27wnn?=
 =?us-ascii?Q?oa5mzPcuPrVmh5gPtukY+oAfqWF/e8L1yTXybi5TMguj0xYff1eQFK8Ktkam?=
 =?us-ascii?Q?qUHClaAZCD0npL4zq4DT/kkMlae9kHjfDp3LMVCHjA+m4YCxNcRmGkWMeo2A?=
 =?us-ascii?Q?JzutgtcT4KtGlOMpl7zv9+na49F0aLjDupgNFOG4/zozSFPczFxecnBO7ajy?=
 =?us-ascii?Q?Xdq1NK6Q7lWeh3WLg9wCZHbDm0IoXVf6A4sE60ZRZwBpTiQ66xxX2mzwl0Bs?=
 =?us-ascii?Q?uci+vR2r2hGGNXtPv0TH3mww2Iqr4tvDUfChUh46aUP1pKdgLWVFcXu7HC2O?=
 =?us-ascii?Q?gdwT1Y6/iDjSxyr64kIJfyi9faqzlXD7otm2Kx+wUO2LpEfRBVWGgrMy14FD?=
 =?us-ascii?Q?n7afZEiz2chrMNC7TRAQCA2BgzIE0szzkLKRD1QrpdmiFlTZlxaHrIlwCHmL?=
 =?us-ascii?Q?J7j66eeGjyzfSgruW6pvmHlCvWwSfhvVLXKqlQ2i6fTi4aJUFTVN0v4esgRT?=
 =?us-ascii?Q?3c0cnxAcJ4NDVXP4w7gdk7gR9lKCWIO5aWRMNYVMctUUSF2P5QM+DlYGVzZC?=
 =?us-ascii?Q?T4Y7p8iHSmapmDyGefZMICX0vQb3ImVthxvJ8aY+ByYj4nczMbe39veHKGL+?=
 =?us-ascii?Q?tvpU7g3B+Eqc7XUC/J+bWnFpHIv1Swhw0qNs10jn76QO4tjFsVw2nC068QsX?=
 =?us-ascii?Q?Zwa6/7bzhhH0cHgdHM1bBr/2FNMiTgHtmbHPN+2kAMiD1bYISwQCSIdBWxoZ?=
 =?us-ascii?Q?RZHzS+by9sswTRXlqxbsMXQTbbyoY0tMm7zRePg+gXXDxNJteoYtNjvZzDrd?=
 =?us-ascii?Q?xB62uSOVRwMCEr0+B6imKCA2onoRldX8o/qrh4QzI8TfYI6K1Pmc5bgxmtNe?=
 =?us-ascii?Q?tkdYbqf8zMPpBTmmyQR9aO89gksj6KIhPuVzNMcjErSuvwqrBR5qh39IjcAA?=
 =?us-ascii?Q?667RDA5WCNbJYXjgc1pTmBDIBgbs0nRWfZNipNFS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84a58b7-e0cb-43f6-ad8f-08dd816afe47
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:57:49.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fv+r1vwomNhGTrdhQbTHbipF4Pb6udqa3YLZdvA6U4Wp3B7/vROcHas4fZbjK+7JIxn8oZ69iz6yooK+GTR8lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937

From: Carlos Song <carlos.song@nxp.com>

I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
compatible string for all imx95 i3c nodes.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for V3:
- Remove unrelated fix in imx95.dtsi
Change for V2:
- No change
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a06..7eb2b1a0e3ea 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
 			};
 
 			i3c2: i3c@42520000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C2>,
 					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
@@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
 			};
 
 			i3c1: i3c@44330000 {
-				compatible = "silvaco,i3c-master-v1";
+				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <3>;
 				#size-cells = <0>;
 				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
-					 <&scmi_clk IMX95_CLK_I3C1>,
 					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
+				clock-names = "pclk", "fast_clk";
 				status = "disabled";
 			};
 
-- 
2.34.1

