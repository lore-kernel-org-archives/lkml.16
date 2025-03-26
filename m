Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75DD18BC2F;
	Wed, 26 Mar 2025 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025957; cv=fail; b=bOT1u/cLyQn8STS6rt9Zlg4YbHnwT2AcSzfbj7m5d6aUxk8umTeUut9ZIU6CpPQR6ijEt7MumNdKGqb5ocqc/ZHxHI6nyB8gl3fDyDwMzdoj/mPzXn3bOTq9u/dh+gmus2yPYEH5QCYdlSs5TAs3tLHsVwy0ga0QhXZ+TxQZ+o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025957; c=relaxed/simple;
	bh=9jgPx8GaQspQ7qjzFA7Wz+bF0umJTWmNOwUNW88ub/s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GjXAWRUOak3M3KZJ9UuKvsvnFVvuxde6qB209S++BAZniKAqdK4moKojMGIiXCTTZGWwIpTjI+pTT+IIWmIqnMJDnYZGcusYox7b2ArYalXsrEysKDPowwNb5BblJ2AXHwch5Ta+7DkSHGqFzHzSlYqMzewDtApgS1DAvPMAWUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S/hZDoa5; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S/hZDoa5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhBeN1JovSjI+IsTvE3yx2LgeY8tn+lEJdq5xNB4RNnil9JXhEFDWei+HAlqiXUwsxUKynHGerffcLZ9pxcPt6t/X25MYTl3kdzkH8RHZ5jtdGc3qAlU2KmQmHkjffn0cJx+x79qSUEfSg9Ecv1GZNolAabMbn97tcVSCYABFteMBsNtQNoZ4fIZm9iUwANy0OYaJSbnfudXIMhfYt4dIEw0NHGo3bP6TD4XuZJM7qbXFLmxjjm6+RrJBcwrntWNKwqNMN6Ncmmp8MkHfqJy3qXJyaEwslESTztlnK6CqgoscqANvphT+8npMi62IC2/tsKEBcn9ASDLAeaYCHBXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xw2BoiZRIg1GWm7LEOPQnDGYalum15Z06BFd2LBL0k=;
 b=E7gq6udAEhNy0CL4kmBewUTnVljg8DqOXuCBmmpKVlECb20xWDCYkd9ta2jzf0XCmMCS71F0AXvMZf58fUaf/rCKiFGVutMyHGUzHHKtVRKYH9iyZNcyUtCsqrSOw5vT8RkT7U0TjlDATWyRIQs50tZuOqS5CE6ESC++KtORsnMaprzNWtO/Ga0kNqbNrLfUAti81wNoZPHNUJR3tpSjuUiiuXO8zdMQTUcxTReJKOPEzP5eDv0s3V7OgFNRNhtIuT8bx422TqLXmsrxy/dDfgoCbrgoWDUgP7HqUpVNKt2gSFcJ2xsMCsxpM3XkkYx4zLCx31YNTAIuigp7LwqWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xw2BoiZRIg1GWm7LEOPQnDGYalum15Z06BFd2LBL0k=;
 b=S/hZDoa5Bma1Sc70mhamCfdHXSZ0rRkd77S62ykHUUnc2RHYWK06qmc+cEpGlG2Sh4aGOhsrQdpROlw8zz1fSboKjoS1ncbIjkZDOa85H/5Hyqy7qao0R/9IEfdHGSZyVFyNzKSsjHNwGjxbDcXRjpFhzq9iVbc8rBXVvOBAVXyy/iGGNhspjFbh7lqVMZ6R6h+6uQwLcKRQkY8uMn0w0+oHDGlkJnDINpemVpfGH1nzY3VaSOSkqhdsP9nzp/fFpUlUUwdaTb3wa64hq8eou4FYX6kfIS0Uxc6aqdkuA6N7VuOZKeUfH6H5o7C0myo1Uq5YH1jCO8mnNS8D40Yhcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU7PR04MB11209.eurprd04.prod.outlook.com (2603:10a6:10:5b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 21:52:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 21:52:31 +0000
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
Subject: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
Date: Wed, 26 Mar 2025 17:52:14 -0400
Message-Id: <20250326215214.1706887-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU7PR04MB11209:EE_
X-MS-Office365-Filtering-Correlation-Id: 63690b61-c48e-4f62-a649-08dd6cb081f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BzR/Lr5anPdUKX9AJeyR/gPVl23S+OkCPR9VC0h3nbEiA9m89+w09Bh3BKjR?=
 =?us-ascii?Q?i5uVQIZ3tt7zBygN8sJ6WMur6/0ZwI8FMNCNGM4SY6/+uPBZGDdO7kcr/WAD?=
 =?us-ascii?Q?vHx6TpRmP/reB6FpCNA6MGXHV06tD6d0wHNIi5vtkkb308xgbwWbw3/DLcct?=
 =?us-ascii?Q?LuWUTQndFUg8/PfbFBwEIZWuiVZT753HbWz6Usqk/gRaP0NK39ZS3riQPo13?=
 =?us-ascii?Q?ebbnFVhC34DyjOi3K4dv7VBrX+qfyxUMa6I/5MZxlSKl3MZZkV68cCNH427D?=
 =?us-ascii?Q?ndlXwxppWriTSM7dRwIfKIoD9IhnTGJhwSKFPCLvNrjSMaDOkffiZi94PDqG?=
 =?us-ascii?Q?xSq1e0e8CTQE7aCHpoChW1kcsIu5gW2IMvy+2u4HNKk94YAt94isI3kEu7dz?=
 =?us-ascii?Q?ViYAoVpgXLa58dbogck6cqqTDUrHGRVh/NfE2BP2Eqc2U5gI/Oz2BgxVdya3?=
 =?us-ascii?Q?pJGWzy7jR68d9bhHELol0wvC0atlrqKa7s9jZRfojgkkaV0qzQJBe9/F4cih?=
 =?us-ascii?Q?bL51mmA9JhaX1Qw+qII8eQLlUcR2tI0jkJ09g6RuHhLvojOfGdxXo1+Jl4mb?=
 =?us-ascii?Q?T1fqJaUnk8cwxof+wRqjMxnT7Gur9QViMeLi25qMhOkZD06z1akFHQbR/LtD?=
 =?us-ascii?Q?joyQJ43LBg0bcpSn+nAOJnTcRNW9h0bN3l3+xsKjT+qO6kKWuw+2Su6k0IZ8?=
 =?us-ascii?Q?kj8BJwv9szm8pvERUI0D0bImmV7mx484/vrjEr2yjIqYcNBmVFgOkMQwQAAk?=
 =?us-ascii?Q?32lRS9lkGM9VIBYKrlSE2Bayu8r0uZWSghzsHi///YARmS+1YCDrQBX5gynl?=
 =?us-ascii?Q?mDZbSnNU7fYf+/PMCWxN2KSyG0tINMZ3n3OKkmYM3R3SV+VPIgwC6yvG4uNF?=
 =?us-ascii?Q?ehbBq2X4wWxCcmCQ+uVHo0d3zA+3KmdVWsMATYyxf8+s4wmRc3ZsOZ75+7UT?=
 =?us-ascii?Q?uHOl2C9Zn2bVd25vQ3TRY9mWoWhNiLkBP6FvGhPnTUEuDn73P0tZjrh7k2Yw?=
 =?us-ascii?Q?y6WdFcMprlTHn251N5WW64Cw5D8bisrA8sv9maCMGqY0nizstLNpfNRe39Of?=
 =?us-ascii?Q?fIRKSq9FMWqyWjHISMe3Vtg761LzFsHPDE0hK0lO2wnmTXLGmLyfMKD/57GN?=
 =?us-ascii?Q?gDlxnkmc3kfsurU68EucB2y/wiY86PHHRkNHCkKtCXSYojMVJZePloz0pX91?=
 =?us-ascii?Q?Cuvs/EVwgDunLqgtCrTZlgFe+x1YgdXCmuqNV+D2GFJJJAsRWs4FbgiD4Q6a?=
 =?us-ascii?Q?fNpTL/DCEEteWnZLRp9Yhplr67t+hycg6itAaQKz/IJ2z7fnIs6/ARwH0zgr?=
 =?us-ascii?Q?FYgfFWEB8CJVH8U/g7MS1sYtqAWuYdC4k21JvXCc/9RtYSbP9Wb9bcaMmero?=
 =?us-ascii?Q?ixZ8JSZK2jydZHJEMSJ6OpJP/tYcgdc44VqTYd6UcXzHXuUPLZv6Z08L2Hr4?=
 =?us-ascii?Q?piPp0o5ufsD5v6DX4wO70/kF+zjGe+C4nKSgcJbfrOXMmufVXggqmENwYWOt?=
 =?us-ascii?Q?7VfWw2woCgs04x4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWxT5MdOnvj/pnXlbGRSadupz5AesMFk0gNP28DHvXLvvY/nRHvvrd0pTh5X?=
 =?us-ascii?Q?pzrPPOTJHe1TIWf8WdChQreJ/Txg+HEiDPdPOLNAXOhKNu+igVUgPp+RP7iS?=
 =?us-ascii?Q?CK4vTn/SR/6N+O0BTMeg/f3keuJs7fx6H+itBXSC43BCR+EH0rmwS7tnNp4i?=
 =?us-ascii?Q?g60r5TVNhrYlbSscM2kJB49RecHIQuGlg6GcS9CwqwY8Gtxj3vH22Khc7VWP?=
 =?us-ascii?Q?1D8xXxJfPuVWz5zqef4lR9sGhEP4CcIh1d/YUskPewmYUdlogZ7TNtXuuXBL?=
 =?us-ascii?Q?zDkGrNDb9vJWhMaBJoaaBpBBP3HDXHnH8i4xoh/iPBv5BqlWBDa3gn5LD7m0?=
 =?us-ascii?Q?nXWnoGhNNJdpv8Rhhbyo7sXnOpLL7QTcg89v1DneAmwVweeGjtb+SdS1M7ZU?=
 =?us-ascii?Q?jw2cHqXwl/zmRmA2uFqOgx93TLHYcvuXlJaswr9wPTeQWkAlTqSy5ZMCRkb2?=
 =?us-ascii?Q?cZ/zAUEs8KEWyfnbz6SRxQPf3SOx8COXtnnNdVWmXvxQkmJBkUYJ8Ipw49JM?=
 =?us-ascii?Q?8EoK7XCes/6VUOEwT4xRyQOkR1VWBVcmWVwtp1k1iDNzkaFQmlbQtHmwA1IS?=
 =?us-ascii?Q?5lr0TCvExyS7O20UTrEwOUyWVbR+FAoZyDWBKt/Wf29mx8LwQAYBjuSDkmJy?=
 =?us-ascii?Q?7zolDqKzNTrXsARlQ64TxDMJ5hTakmyu4XnDa8Go4Hr3aw7/iDS71zlIv4vs?=
 =?us-ascii?Q?d4+rNN/ZFgoKFYjPzCdBYgm8V2aNLIZ/xFZWKq79vcoyNPBESgoyN29Zn3PI?=
 =?us-ascii?Q?UgfM8mbwqNdTfnCvU/U4WYJoh1Or20vUM0TGX9MGhMqAPJOTIb7K6i54akRH?=
 =?us-ascii?Q?RKF+zPV5e7/eX0RvngcnUrkGSNvbVwfbswBv2ACzaptg4KVhCr5x5/gbdF3i?=
 =?us-ascii?Q?ejqmVjysHF2PDKenmtKXsYkQ8mqilDw2JuWbQLNVRrSeIqcSwlhl8Kiq33IJ?=
 =?us-ascii?Q?numXkuseiVGBQMm4YiPYnDmZ1pmJSlRAvnjZzKymhcD3nYFwmqVXaMEz5e5j?=
 =?us-ascii?Q?Muxd78CspZ3d9TNJR3eKjSlVWOW0qEDLl83YEDzR9mxJATVUG8yvs2YTeW76?=
 =?us-ascii?Q?kLkoU/cyxKQyOAfMGcDf0/RWDx60FxDLn7TH9pHPy4X/FKQ0NFH+I+01hPRn?=
 =?us-ascii?Q?S8eoB3V9iEjBg9Yc1QmGQkxDPhE7/LMwmzb8T+ZPDKgZClAEw50s15YlnmF9?=
 =?us-ascii?Q?epC0R/zFGAJtEh6Pi101gRKuQ5gEffvLfQ82Zo8LJxXMNsyVjDkqBzVK7fMj?=
 =?us-ascii?Q?ltLDyZJGrYgzXwWLEf5cEVrNpY5MBSgMV6sg0L3n6BbnTSR0zcJN8ZxrflNt?=
 =?us-ascii?Q?bV1ojfEl+MN5VSFaWx6WTjP9aHuU03Ndb8Xxex+TII+gcyxKKryc7xwonupx?=
 =?us-ascii?Q?9UaEFQhek8WQ13NiXAB9GjSbZmSJJJW2V2uiUBPGpqKTRKvYwz+Q+uQ4oBNX?=
 =?us-ascii?Q?GZFA7f8LlsCZEzY//8qDML+3qeA3RrJiEXJetMBsvQkiUdpyQyvuVKh7yM9U?=
 =?us-ascii?Q?SbeMatE6TI37aySbrLlVA9+k8OkppGbrZ/QXxObT1D3IkYBsjfg00N/GZ5fw?=
 =?us-ascii?Q?/AQZSsRzIK+PBiBYAAR0iqLG8vbtK3k/Paf3BpPv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63690b61-c48e-4f62-a649-08dd6cb081f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 21:52:30.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wh35WkIa+FiRI14Lr+D3RAzm2w2MigsbFghyn3nC+Ek7uSQSTtdQtpMMD+6oCalOg45DWaNm4MN4z2tt8XvDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11209

Move dsp_vdev* to under existed reserved-memory node to consolidate all
reserved-memory together.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 34 +++++++++----------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a669a5d500d32..4ba8ddd472234 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -40,24 +40,6 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
-	reserved-memory {
-		dsp_vdev0vring0: memory@942f0000 {
-			reg = <0 0x942f0000 0 0x8000>;
-			no-map;
-		};
-
-		dsp_vdev0vring1: memory@942f8000 {
-			reg = <0 0x942f8000 0 0x8000>;
-			no-map;
-		};
-
-		dsp_vdev0buffer: memory@94300000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x94300000 0 0x100000>;
-			no-map;
-		};
-	};
-
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -189,6 +171,22 @@ vdevbuffer: memory@90400000 {
 			no-map;
 		};
 
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+
 		gpu_reserved: memory@880000000 {
 			no-map;
 			reg = <0x8 0x80000000 0 0x10000000>;
-- 
2.34.1

