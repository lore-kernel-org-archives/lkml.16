Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B271FBC8C;
	Mon,  2 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873194; cv=fail; b=k1gPRNdNOci9q0rg/B8KBvg1S20nomJvDfupsJFfdlp1pala2Vb3h1LCeeXcavGcf8C1GeFM9oEIC1se/nlwP8Kr8vNA1yJTvu+LqT1tBeFkFeBxjMLQpHNJ4bKtvIGIPbOl33JT/7DlifAk+hjDd9BtJAnUNdMlMhzorHXIftM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873194; c=relaxed/simple;
	bh=XrUISnWvQ/Isqi/5fSC3n5LusBcctjKgsDwfrUKewwU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=X6FR9GO5eRqECgNnN2CqCaXgpWIvQugzlGmYu1RAeBjMumig1jQXDWXvIXtu5sFF/yzrWW74b3GhGZIs3ZjL0EaO709IyEe6EnX4QX+BrwhZbZqfRje/BIgXQtAC2gJ6NnVl/RVmEz+Gi75S2fB3GRQimdABXTZz/w113n4176o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xh8srfoc; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xh8srfoc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV6upaxy3dBHKqcCDZfb/4nSJZYu8v+BBolgGVKl3yYPrjlwEWJk689M6Z9T8HTca51wvNzIZFo3/aLUrBk6ajmBfmaDVWA/jAlwyu3VoxxHVR7DbxxSn57sOp1rQJTjc7ku/ASq/B2MbY0kfLvO/KDJqxhpZ9EjYZCG92kPBNYSJvIUOa660z8JvUV0Kd14g+E/LBXgbDn76Cya0hb+V0TGvvTHbB9vhMFWfictDAJhPXQ4aW8nnUOCHAnm/pkEefUaja3tD7APPvvKeOhOYharzcqVpCbJsH44D5Bn1WHo/2TiifCaXc2lbn3pDgMFf5xW6/b0CRmp92vpE5IEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RwJl7YzXwq0KeWbVodXsS1xqMcFJVMkcVQybhHjMIg=;
 b=xbkEbvMivZij3PjVBC0dKM9f4c9V7zWczNBSPwYdeiYwJg/wkjZpAdpR3jWCQ/uybNgykUTSZER81L3/EC6k1tck4UsQLeC5q6nSNSXg7sAMffWEzaGZI4hRCeChFklHBW6h8jwASegVzOrKV5HUHjFgiRpwfQ4C/bXuGSCcyDGztsuKkDolv9OUJNLxPrmtiz3DjlhflMZB3DxdSumMp0+41qlEZIUmIjPEIJ9HUvpqYJvauvH1hQM6YPnKmjSPP5jL2IC0QmssxA9wUzKhchcI18l6B+mOCckoMZzbHUQ3yvjIunM5jf3XKN8mJwcpTB3NGk2+fay6pwqyOZd/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RwJl7YzXwq0KeWbVodXsS1xqMcFJVMkcVQybhHjMIg=;
 b=Xh8srfocRVi15EglAqYzbjP2WAcr6q4BjolHWdWg+m06DAkc1aFctPrmh+hcmorkGl0EQYCmgt+HqxV+eWGi2eBeOm0jsLr/4T0Fk3hNDUmN7qps8YUns6rGvfVzYONizpeInk41F6yAdRiUTpXFyIOM6qvI0Xu+q1bk5doe17n5gAN9ek8dUN8USiij4jt2TipaNXi6HJkG0NVLArdrxMHZRr6JM4bqvf+3dsAQwqeBVv/zP3EhVVdfiRKP9yQFPqedDXm/at0VVAA7axyo3AsSibxQkoJpx+P/H3cJFwgIFR3LjLIF6CiiLZ+Dpx7InVBX8NHo88crTyN2bXHv1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:06:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:06:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Walle <mwalle@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Date: Mon,  2 Jun 2025 10:06:12 -0400
Message-Id: <20250602140613.940785-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0138.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: 006c46e5-9a05-4d91-0b22-08dda1deac29
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?UoZi889gG477WOMqsWtVBiKTc7cN5v+6FrDkJEs2IdvDcIDKYx3pVsGzBjjv?=
 =?us-ascii?Q?CyFwF2kFbhiA1W/AX/p6h42lwReBw4znQDlCcR3haqHkLwHZLUsas2lnn3ca?=
 =?us-ascii?Q?om5+98vhPrWwwF/tgj542ytxHtoPQ9cO0ojQTSEviBp0xYiwFGBcRaYCGD4Z?=
 =?us-ascii?Q?dRm0ya/BO6yyrtSBefApOREVRkoPOr6wzCRKLEiuFhFsTOLt4fmyay4c9i/i?=
 =?us-ascii?Q?v7YOv7yKEph540qHTpZAiRwn2oyRR8uVlwqx6xQMrcq+JrqKumqt1j3dDTuZ?=
 =?us-ascii?Q?8mNt/FAkyBlaeN6NOoYLqLLkY+XSXcQuctR99dq8tQPE2mlqUURgNUQqtOrZ?=
 =?us-ascii?Q?vPPo2JL1V7H6j5Lzj4K+3jWB3lK9aTjk+vnp5zOU/g6MS3NGOH8tN51z4SOr?=
 =?us-ascii?Q?LQE6k4lSW4UnY/R0e8cOHhDIHFRTEm4hdeKklV9vqDWXxacnEDmpvLQLhHmV?=
 =?us-ascii?Q?pCqrURVnpb/42xr7cDaiNuLOjiSYYtYkOqZ7UIAZfzJMoHQdu/wEGcTiFmsW?=
 =?us-ascii?Q?Q8PYwJwUSzGxB/BWol2cwTU99k3VCc5FFT7RoSOYpO9t3Glece6iu5ccVzv7?=
 =?us-ascii?Q?Pmq6IY7PacphR8NywnVjZ7AqTrxhP1hOI2wOcw4dH29i4W6ohCPIKa5pzXFZ?=
 =?us-ascii?Q?offdek8TDWKQ+mgTFpzjQbSsrGP+fr1wt75LDaIIgNha03TQWfFeQgStYSM0?=
 =?us-ascii?Q?xwJDhxFdEEPC9SjRNBPD8MX8lWGTXv3mudkqR4QIaUZh96hMQxpMr8XZwnpc?=
 =?us-ascii?Q?p+t+PLA1EYzPMPoa0k5HcY51hJ9kG/JNgAZHX6/+PccdmTnrECzTpvCytyvF?=
 =?us-ascii?Q?ZUN67w0+KwU94RqpDQGNc8eaMzKU0F7hJOPD4Na40g9fz2VvNH8fwihSZ2tV?=
 =?us-ascii?Q?/1vG2aNq8H/SWo8Eo2E/JbEAhihhWLNVRSRMvYRofM90DRa/OLUjVMiScY5B?=
 =?us-ascii?Q?fUg0U+EgjK6Iy9SPSeF6TVAM5J/Nof2gOlaB6N8oFoIL8H7Ucff2mzijQQ3d?=
 =?us-ascii?Q?AIfhKVQwoOpSqDKno+D3coNXa95kEdAkpbAQLjlPRbMUgIwaCzJ2TvXLJDBE?=
 =?us-ascii?Q?7DeJIxMmGH2XiwrXgYXfnonft6hIY4W+kzE372ZItWURUZnB0Kunscpg+fxJ?=
 =?us-ascii?Q?pXE0WRL2lgbkcXyMQUEhgLki4E3QTkrzsclLFrssPEEwnooolhcQBEVXQk9Z?=
 =?us-ascii?Q?lm9SSIzR/lsD3KyuQ95FJ7+Nt0UVsWLxN+s9ohD6t/ITtxpCKqLFOZf6L5sd?=
 =?us-ascii?Q?XLqMeoAK+PEZdX1IbDWI8G1we5G+x/AbkvfutWXfib3EB/KEfFq2S/o22D/q?=
 =?us-ascii?Q?bWk0g3wABhbqnKPQzNYWe8nsxO28kxyh9jAw7FWajVtB+l5HHA5U++H/+urM?=
 =?us-ascii?Q?6NEcTrE0sCNdn8A4Km5Ygv7Ptlje0RrY2oI4LsF8xXtr6x1C8u9nWb7htPdl?=
 =?us-ascii?Q?PfTZRutQD3ayvzdeIKplBlH3MTBzc+mkmeqOHzI8itNh1CsLt9dyasubGkO9?=
 =?us-ascii?Q?P3y9S58UVhPQDVs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0/kSDPrVNUldBWUqFDjQmNDIrtJ2b/KcQD2uHTBGU/eyi2e43rZKxVz5GuEo?=
 =?us-ascii?Q?1btnQzT1sl6+Xv0d6Iw4jzueN/ol0NC5gOBXbGmtzG30TbBuvoi7OLG1UyTn?=
 =?us-ascii?Q?ku+k0yF4z1nHxhl0y/FDlylRpSZmlQ0rM4hrujW+i8NDjtrBcb7PS+xsQl5I?=
 =?us-ascii?Q?2VS3d1lrC360t1sfOC7IMPLrBWjB1i6ngzTFgXHHFV4RnMu9HgdhIucIkAGT?=
 =?us-ascii?Q?/hAGR9Kk+7MckGovnT4XKJLgpNGdbt2irGvjTnhRLXSk5mVlj38gfO0Acswa?=
 =?us-ascii?Q?nKQ798XuqeiK2ki8Nh9m31xgPbIV3uEYkAWrLTtxBhL6tk1Aw+f0p6V1ir49?=
 =?us-ascii?Q?N2QklBZxrEEIf++SaJeXom296srIYwwmedWsRwAatTQNhRXIGrDee2UUDUbm?=
 =?us-ascii?Q?CSLhtJNFIDGs2Xa1SZT0CSJcFaCE4LwYVNENIYclsGCEWMs6h63iEh3KJtPY?=
 =?us-ascii?Q?k4XH/kbvdsTrqzJLw2e4oZaJwPvGKGieBGFYypbJ5oPAq4+A/DgUMJ3DYgeX?=
 =?us-ascii?Q?37KzKyBfbkdWlpGzGBdtn4EF2+q8nmLo9wlOEOdbZF2YAc9cUE2U3aYNz3wp?=
 =?us-ascii?Q?WDDaZfAvDW70rQymkh/eQ7hpvJZxIgflOxUuvxxDL41Em5xtIoa3ae7OH9+Z?=
 =?us-ascii?Q?WoWyOdx6HdTKv1vqdJLjFBSGZDkG8Xzp+QO7cFjmk3oWwaZDTXvVK6of2NLM?=
 =?us-ascii?Q?ikWbwfYQs1yYy2++ctyYr8J3bhjKGiXbQS/0Ny0rTzH3lu377RgvmTUko/6Z?=
 =?us-ascii?Q?jnfYe8CGwZPm26D2HASCDPfyK+simTqHzifVlOqdJx1026dqWRN4RnMzeVKH?=
 =?us-ascii?Q?G+Z5xQRJlMoOYNe/k/fsnNUZacTxz7epY/Gnr79kbxy/xoOx1Yq90Zs44PXx?=
 =?us-ascii?Q?elciHenOUjP7Wvn3oCUMRnhPRSWcUfbnKJJKX90fnWh0cc+0GzUsNPvwUSI8?=
 =?us-ascii?Q?kJHhD9iGPX1m/Smalc65r3rpKRz2Qj5sEdoIum4VZVLvZY4SZDY8qlw3uu+n?=
 =?us-ascii?Q?276KIezmQKJWWFnS3v8eCsAkL5U4eo4H5BMsVDc8oMzBlpwf2kEghDgyecJC?=
 =?us-ascii?Q?DrV2KYANEovq0I5Gwn/aJlTik/RUoeQrq6cqFoHPtZ9gAmi26wHxnXBuRt+T?=
 =?us-ascii?Q?2vmsR0JXss8sEOcNhHvqDGVtysIAp4XVrr5LQsz5WnaLtPsmToWh9VqE4gv7?=
 =?us-ascii?Q?SRdMCpl5KHXPBMtD2lYjquSGWuYi4sStnLUUPajTtljTLGNWQ5LQnpHug70y?=
 =?us-ascii?Q?/WLb2X/UuKUCJnIgwS6StIvnYLmChhO1QcwegpfhkIqS2p22UEmEsI+JKum2?=
 =?us-ascii?Q?dRqOpmjC1k8FCyqM/PZq+s867o2uHbsO0bUDalA+QYmX+P1LVkJQM72xRuGn?=
 =?us-ascii?Q?eNC062dsUQCYV4kLHq8Vq963eEUz6kG/2bXKvVsuODtqcWBBdPVFNA9syIIG?=
 =?us-ascii?Q?Xx8EwENhPHyx4HOT80uqIQtihbjy6wQ13f5IZTqRzlUX8cSCb/lHXX2vZER4?=
 =?us-ascii?Q?4REBvmxGRBaSfDuZMkaogrJDdFuoq/KOCUjOoaESys62VdSSSHR1bzQ7xIcD?=
 =?us-ascii?Q?SQ41uuc/yNCw/STV8xcaFTrM9Wia2xULvuQUE4cJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006c46e5-9a05-4d91-0b22-08dda1deac29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:06:30.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XGCTSRDuQBN6EibxBBSBIDmNjdUY0K5fYd+mceCg2+VtxjH1LUGHd8PEIiWKBtq3Ay93VhmSXwdrN+zT46N5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
warnings:
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e416..75e46ffe9ba8c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1711,6 +1711,29 @@ properties:
               - traverse,ten64            # Ten64 Networking Appliance / Board
           - const: fsl,ls1088a
 
+      - description: lpc based Boards
+        items:
+          - enum:
+              - ea,lpc4357-developers-kit
+              - ciaa,lpc4337
+          - enum:
+              - nxp,lpc4337
+              - nxp,lpc4357
+          - const: nxp,lpc4350
+
+      - description: lpc based Boards
+        items:
+          - enum:
+              - hitex,lpc4350-eval-board
+          - const: nxp,lpc4350
+
+
+      - description: lpc based board
+        items:
+          - enum:
+              - myir,myd-lpc4357
+          - const: nxp,lpc4357
+
 additionalProperties: true
 
 ...
-- 
2.34.1

