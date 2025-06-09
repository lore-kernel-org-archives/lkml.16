Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC4D21CA16;
	Mon,  9 Jun 2025 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487992; cv=fail; b=VOIJeyLGFUMtEUhFLIFw8ZKLDFSp09zc0EK1qjluw9jBJUsCuNDCvW/1JAfGeprLKu+3dMuriMVAUnr2As/1ACqsMV71sleSpgzfwyB9zYli+i8RmPJF+gjbXnyElWVopCnIzIic2Q1XrFaFpPqRfQYA3MudrZctTiQQBR1TmZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487992; c=relaxed/simple;
	bh=0Pg44542Vdwct4VkWhPrj1djhJjh81RWiO20X7ltaUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c8taTgHZZ6mImz5YSIw0FKb+1DG5CbNcAO8V05Ue1fSvUk8166+j9JR34vKkjbGXdVMHqE26pK4Hy3Wadxp/Ygy852cvoCz0ZxZiEUSZRBMVmm5WL+JPphLgUP/uJPyWoR5xctTVnXlLcvntxudrEB3y4JXwKKxCyzxM2bnKIl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=anaFbFz6; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="anaFbFz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oavEn1ITvHXPv43w9nB/00hniB3e3Ls8IDwVoc3q4b44XFiowxIbwwTyTcTFMxvxyv5HWvyjDwNoyklxHXeWzwy8NaXV0X+2qE00WpJmM9fCLyEIyyiiIgtjKXLY4W+QUrP8DVlCfSD0U2SFVJy3c+iM0Kwj0bZ8mbuGPeFRH7W4mp4fh/mpe7qwtfs2zgASh3O0nAyOMBcLJ5HItnD9lWFcwqtZ/AxXfPl4NGpxqsAaARYO7ah9rekPfH4H/hW37sblbYCoB/5Sd4R7O18twYFHiGzNcaB7rILqOaoL1Z4gNjFdth6ocot7O65GXeXsb4W4vAMn6hid1x9Y8VuB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sggmJZKVlcur+gL51KABdVQR4ZamoxfXl5jePQdUXvk=;
 b=FxmbsHuLkL9pYZotD+zYlQFta5Xx87sALf8wA/HRar3HtBwGDrHsBydtqnk5Jo7NzCq0N9JrPaehW9T52l4daKGNEDx1w7dBg6gf6a8qzi4WnPyLXaS0w5GjTsvCdL0EPd7AwB9lXMnGwv84jP3z5ougeSlp4Y5YASPDbYkWehRuAwmBd95qz289FoahEZl7zgA6fBOn7etnygjrALHsnJVFDzT9kfTaBItrAdDS4ycQt0Q9wqD1f4XQl7U161jZ0vl19jN86Y+RE4vSNptQDxIVk0+3ZqmJyrQwsne2YPa8agip4HF5X3hnN64LdPRsLqsUFGG01aCX+emn5Hzu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sggmJZKVlcur+gL51KABdVQR4ZamoxfXl5jePQdUXvk=;
 b=anaFbFz635JvlWLV5NpJneGDzyi6Jo/6ujr6jRlhSxBft2s9byjO/RedN/CK05l98aFoZZCP3RJppw7cPueYk6Yn1MIfkdoW4u1bumFgL0Dnlq26HPOHtlYTu/MkFTThzzCSWoajpXQU5L5FVWuylGxmHyEGvWQn5h0Zo1uo4tNTJZHjevz+QUF9/G/UNf+/NdTkeWbx7J8QTl2HJ7Jgd+XahSXO8usKaneBL96yHphn1VtjAppy8PIoxeCmrayDD3V3k1Iatb0HG4Uj0hbonbm249jdyA/Z4MRdMW5Kv8D/2ZkODs9Sm4dgNuMide4KQdiDC9wkYfUhTubmL4CVVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:53:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:53:08 +0000
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
Subject: [PATCH v2 5/6] arm64: dts: imx93-11x11-evk: reduce the driving strength of net RXC/TXC
Date: Mon,  9 Jun 2025 12:52:36 -0400
Message-Id: <20250609165237.1617560-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7fa678-c610-4dfe-04d1-08dda7761ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q0Oixtc0H+omTRN1ooQKjX6Z+1pkW+ukYftNa6T9l8x7nGyis/Wi1LDfo/zI?=
 =?us-ascii?Q?7WOVkuKt7z9kht3GWxnfnQvvqioNxunk4OQR41sD6pk8wmQ6QJYm+uFYugjs?=
 =?us-ascii?Q?6tvL+PJTtM641YM50mQsI3GxrEcAwc+LbvEsxPcIAqFicJqiy0xHVrLjmy7E?=
 =?us-ascii?Q?RdZb5cZWY49k5viL37WnLymcqLaW62K5lbg0PiuWjKCxRF77o22kPCJ5dN5y?=
 =?us-ascii?Q?xyeBdzuZN4FYlQwnS8tgWMa2TJcW37kTV4aKlLwH6f0TMn91ifIbWDDiGNfQ?=
 =?us-ascii?Q?XA0OnwQcH47GA+u9kmdqT5s0z5cncw2S2DtDx+RYt+DEp2NkGR0wSub1wYlN?=
 =?us-ascii?Q?faZkxY6i4UGvYiehlcpcj2nhxWdNefdcWZ7WHgE1Dvqgjfb9y0wWiF0aU/u2?=
 =?us-ascii?Q?LoiYv+KBzkFxAd7yPttQ4v6p1fkM3Bigxp9ZWTBDtI198jLW6A8nAJRfavuV?=
 =?us-ascii?Q?w4s8OeQqDNshyIT4Whd60XxSXfH4Mqm/qKSmXtWFcKbK3JbvXWpcEQ1NaNSY?=
 =?us-ascii?Q?d8pefzFNNxQ1EOS5nj7bRxzKFdc3hACPqiBo6nPhFK0Hn8742bo67ZZsuAeJ?=
 =?us-ascii?Q?PeD/ZKqhdSXoUwePDJMmctQbVhVF+y9LBGueMUd1Imjw9od6vx+L/oiPVddm?=
 =?us-ascii?Q?g2aMSV6FK+IZX/dZzQOtEe6thLuxKXOuxZemv7IJn9xmwfNdoGdYZGLM+dzz?=
 =?us-ascii?Q?svPBAS4Sav0ykNqUgAzZS7xJjaMHCozSzAVUIq6bFIJkRDJRp2kaoeIclKo0?=
 =?us-ascii?Q?nZVm3RqneKp2Nm3xwDy1WeHP4oU9fvFQUX9rH3xqHAX6ExzHCT9qIECeQAj+?=
 =?us-ascii?Q?CRrZRguzh5lyI9It1YmqMbWtsg1OWNedIsQZxXvLTRskbOpAMNBxHk2Af/ZJ?=
 =?us-ascii?Q?QIt5tkLZ6suTLV5JGWpDdboxYJNA29HYHJQbEx6+RrMS4YrECsKHNFsVRmyV?=
 =?us-ascii?Q?3r2kcBbcH5GiUGwwnTspQLb1/cXjGX0IjS1SLk7GnNG5tex4AeeMCfk5xVTT?=
 =?us-ascii?Q?uiTmNT/3QgnGsNirf/g12NVYfpknKue+1DZK0wzR7tmoKihIGlOBzot70b1c?=
 =?us-ascii?Q?PpYH78EdQ3Fh78wXjJlQeyDI16YtBT4ALD+nefZbLCxWDsSfOXDaoK/8Jl3+?=
 =?us-ascii?Q?zMx5OmKp3+ajV1LghpUGO0ZzUHWSsarxXaNsponx0/OdKO+ZGCNbNBG7KyCU?=
 =?us-ascii?Q?GZPjBfWiEPdsNWBZuS3R1bljMFJVHMPAvCa/88ZDG+r/vFOBvfXlq0XpEol8?=
 =?us-ascii?Q?6I0je0e4imsTPlQ0b3dmGj5PsfSFhvvJMDgPYJgN0H/uwHfTIgQ+JZoylYqh?=
 =?us-ascii?Q?OuGFIiPXlnhQw7e3xom97jrpcbzshE23rOlJXFRqogtDUXs/GyX7vvaPhjpo?=
 =?us-ascii?Q?5n/dUcm1T7LKur1wPMO0nzFotndobnCPFI52iJt7G01bk90u2wLxPq05/WRq?=
 =?us-ascii?Q?8/tP+qMbyFTmsYUqgIxtBHL+xOFB6NhYW1AbhfH9BrQfdmvXYaVP810rSivK?=
 =?us-ascii?Q?Ke1p50iVsfftj6A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HVWNZD6CsfXZsGhtEXMltLWa6dToEt22r1AO6SXE6egzhktE4H2PKWlJT+PK?=
 =?us-ascii?Q?8uxZK6dwTfuiAyKHsGmKd4QYD0oQ6SMNlhvjMo6lGM92H69DcN7kErW14z+h?=
 =?us-ascii?Q?3A8IO/SezFr+/dLytVGOOZVXaOgyEVLWb0U4UfJz4JeJr9k4xS08OFkBoUdr?=
 =?us-ascii?Q?plcZhQjLqlCduJC/xEqU8TtMauuGcDyFWDLMujkd0yLkJ4qYo8jJG0OccWeU?=
 =?us-ascii?Q?h+Wd3kEpbxKUO2dmP2UtE0EaP4hOZBHpQ0khElehlITWGM8jGSXYo7NzpcOh?=
 =?us-ascii?Q?9gPB9aPpTozbmMt+JkZgEXlKjQJ6uMzl8SZaoMptYWQ2aqYAj4ElC7U37sZU?=
 =?us-ascii?Q?GE2nMhJpwDBbrnnEUBB/Shazlq4jVtUCb5QTgTVRdR9ZGUZL72hDuRwW8Z+n?=
 =?us-ascii?Q?UgO8tQfiRcyBqMAdNPGcG+W5JtJC9frXKpuGnokpDiUhQYzhcjA0OClFrJgf?=
 =?us-ascii?Q?TlPHZdEWIDrb6hJmIPwOjZal0hwvVuEWQERZE/mBhfOh46Oye5/Q1DL3MMSw?=
 =?us-ascii?Q?Z+esPtZaJyx+js2LrL9DWbEav/p7xM/C2bHCdlt6XIuydoj1VjCS/U1u/1vG?=
 =?us-ascii?Q?8ciUMmz8XhR+0H8ImWT8b4cfJVhtHN3XALkXtazgxOR0EjYvGwNj7EUHUZOU?=
 =?us-ascii?Q?rncSRT4zOgDZ3yELkeY6iTrppU49AkGGyivpWdH6JGDGraO4ly2RwJVB84fw?=
 =?us-ascii?Q?xPb0kzZd/1ycHsap/gWlD43wJdW5YBhMFG5Rh503Kar2Nn7ZDLr0+KAlni5Q?=
 =?us-ascii?Q?lKTzIAuTpcg122FH4gDRC6kVp6aI5ofUCNKwoSoFXAG00Y4qsIh3ddh+YJ7M?=
 =?us-ascii?Q?XlxFY/9QM0XPGuxHBYYfiUpr22jray8JFCOdm1TQrwR0Kj4ZyJeGzG+OlVNm?=
 =?us-ascii?Q?ekQI99efpk7DCWoZqf5V6yLJga7CNsue0kkm+KqGekdAMCL6FVdBE/E/LrLi?=
 =?us-ascii?Q?rRH8J+Fdx67/Oa83NZqfCLby+iqZF3/1gOtMleNzy19qCIXr7uCOKFAWgmPX?=
 =?us-ascii?Q?yGeInCrMDEfgVOzTXe8wG+zfV3kXynPYCCM4FJ5998ab3Odwmdw7+tFlV0sO?=
 =?us-ascii?Q?5LT5jl29YK+3QQ1SoUWUApYrWXiMhc0U7SjnB+j/Xt5xVGt7RnLjBZ3Drrjv?=
 =?us-ascii?Q?0pIK+UwJqeG2NT1H/qoXlJF5NDeusW1/vpF8iaUjRmdedWfP4yBtHB3/bO1Z?=
 =?us-ascii?Q?6txvp/ix5HrC+tkI2rI98fOTCOwb7zo/8mS48AD6f3zQ/Xd2DrUAQuHhW97u?=
 =?us-ascii?Q?uyPpLPdlSwJmHka7TfiG0AOJbGTUrzNPN2HX2lrkUSmJSrckNgnel+qt5XR3?=
 =?us-ascii?Q?ZTjS9dmA83XUKNZLtpcsxsBxF9NkompnOsdJteLdaKT/o2DFpb9aahNCSbQC?=
 =?us-ascii?Q?QcMGaSejNF9xhth8fdWwQ/Z8WcGixz1XUmSxwSnHqLUvhwPdpWnBfVrjNRHj?=
 =?us-ascii?Q?CC7TegkGRceYAob+nU6qqxRZfoYVzdQj77rm/zB17TzoCBZEkm6BCeCn4+gv?=
 =?us-ascii?Q?4FPEAQYvZr+RN94TPSUKEYrYUqVHMvmMhiDjcYARoL2y+tfP2ns/QcuiV3Me?=
 =?us-ascii?Q?VpLRUkYrPeINiLvC7nBVyZT5CmPqyvy0JU/vhXy9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7fa678-c610-4dfe-04d1-08dda7761ca4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:53:08.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy2qfdOEHNPTgLl8uW+8mqsso7jA52NFQSsLtzPBByF9hgfj4sdi419ENM4VesZsQm5D/GbwvD/nTCJg9U78UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

From: Clark Wang <xiaoning.wang@nxp.com>

Reduce the driving strength of all Ethernet RGMII R/TXC pads according to
hardware signal measurement result.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add missed s-o-b
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8688fcb382c06..31fb1cd8daba2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -673,13 +673,13 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
 			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
 			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
 			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
 			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
 			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
 			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
 			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
 			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
 		>;
 	};
@@ -711,13 +711,13 @@ MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
 			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
 			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x5fe
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
 			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
 			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
 			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
 			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
 			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
-			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x5fe
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
 			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
 		>;
 	};
-- 
2.34.1

