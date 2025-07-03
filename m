Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8898629898D;
	Thu,  3 Jul 2025 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529047; cv=fail; b=kz5OYDyT4FlLoFPN3Ff1jnkspe471Vs0ccjJ9uGPOZvLyCz8jOzZQNW7RqQtqovg8ISoDAnUSGQ1eWpElXXHeQbbVSM2VeIeD4gBlGA0GCaMfrXKePyEqsZVCxIHldapAjbN6FIr0OjYaHwqwoXrN+sWs/zyLXz2+OXpUh3yaNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529047; c=relaxed/simple;
	bh=xQlgi4iqLw/A8b/doU6U8TAjYsaDUnjTO6FMHVdvu+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ss+yJrVmcJ3MoHH1+idIeAIP97wtAzSJSAUECL2r92zOthAcSkkaPUNTyJFtltXMDCxb4kQnBNNztteTx78EYI+fTT4vdAUL09gfzDD1i3rhUSImiyHyf1ImtGKNrPLVxhnsFyfkYcf3978zbaEPNIHLlKMFR+9VW85asB2IV1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=SD6lFA6X; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="SD6lFA6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1cXD0QEA9OSAEBClAIr5s3NOTUTbIMLBvF3Lqw78W1GbFX/YRS2uTUynOOFVoYbcCzCzg9FvbslCkacseoHjUb2oKlfBt4lkN1n1DW6E9rfw89maVEMjyetUCQa/QJGhFCF9SfyUmSf2XYxl9N1LdFv5oHQWmiotDpQgoQhaxVAms0rdO1v7UQgf/UtgH+5RkAS+zyNO8OWNP6PMDSElRzZwnRKNWWDe1Ijdq92kLYzBsf/PPPJsggSIXQHhWndRfyEoBdAOfBhy8qtemit3j8k/RIVvbHaVSpRRhS+kzj9aDWDHCHOM94GOY7eFy07P7qXGkXQCzmTUc/6yHf3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMB3kdudxv8TrcapxFj5B9OBJzTRJDhaP9dPwNZXGIM=;
 b=lbQ94dKt0fiDYfmkx90vp0R/hsGB2eZtWlPMu36BOqbNr+gn9rS0a08vYZRj1ZTBmphW7T+MWZ1JfZcJF7Z65LpZFMoZeu39tC/TZzj0MNLfGVPH3grpedL4O0nVHadkrEdOKYnzL68QhlxIPEfdk3NscTbdFY1G/sn5vKZcLbf1yhZvxha+/4iA/EhHf5vCOeYPAcb9lzbdV75bGLutnZeek6Yj+mzlsDzeLtwWXfNkoL/FqV9pbg+WPcRENmAu5WMb24NtYHuFs7V/z71jKh3UaCn+G65tz31ljMSIFvpBUnoP/ybWKpQ09uGb4WZ1Rvr8DFuEvOmb4mPkC+ZWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMB3kdudxv8TrcapxFj5B9OBJzTRJDhaP9dPwNZXGIM=;
 b=SD6lFA6X0BSZutK1JVn41q5AinpWOK1afEDjZL1+R6aEyHaCfKjULMqaWQ6FMSg4RW7zY/BJdI36Mrw/0wHGXjhiTT+wQBQXKO2wdCDoApc3Txd9M3JHaKfe75gz1eb5GdFiKu+WjYu7WoaOYZ4KnQMbSqIkW1QCjHQ2UU/O1hs=
Received: from DU7P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::28)
 by AS8PR06MB8086.eurprd06.prod.outlook.com (2603:10a6:20b:3cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 07:50:42 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::78) by DU7P189CA0016.outlook.office365.com
 (2603:10a6:10:552::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 07:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 07:50:42 +0000
Received: from AHERNOBLEIH55.lgs-net.com ([10.60.34.120]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 09:50:41 +0200
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH next 3/3] dts: arm64: mediatek: mt8188: fix audio amplifier reset polarity
Date: Thu,  3 Jul 2025 09:50:37 +0200
Message-ID: <20250703075037.2558549-3-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
References: <20250703075037.2558549-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 07:50:41.0930 (UTC) FILETIME=[2CD306A0:01DBEBEF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AS8PR06MB8086:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd7bfc32-eacd-433e-924a-08ddba064f79
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ASnxPolSiQga7EaKkT+7enq5Y0YKVld/mhKbCSL6eK8ITjdLpWp3QAlL9Z5I?=
 =?us-ascii?Q?67uv3MyfjowQqaPgKYT8nL8zYA7lKg5+qm4dcVFFJ0laN4nXy4X+qfuB0FfN?=
 =?us-ascii?Q?q+aCwaMzG2mng1V5/IIBmzpHxrmLQQY85gEkrLGVSmfrUmYzPJXtg6gae7H1?=
 =?us-ascii?Q?fD1cdAYrV4Or4aYSuN+7TVTR5GhLbRnZlsunP4u+lj/9joUp8lCc39KI0dQ2?=
 =?us-ascii?Q?cYCBU+d3/KR/opUf2AIc3Fa3jpI3iNpHzoBanANWNuZCwNl25j8yDttPnaIS?=
 =?us-ascii?Q?jNxWmr8K6Rqkyg3cPKXoEAdfePDaCJTEnWUd/zHjY9ifl+ay0+G9XiZ6julW?=
 =?us-ascii?Q?0SXA9PuAtQufwTxUXdxDaNla7uRrxYBR23lBVAAyIeOuqm9nR3dUcwsaFbap?=
 =?us-ascii?Q?SGL7KwTAwWw/+K6p/Vq3k+G+0jIDINQSasN2hR9HugQXIpZYbSI4F/hZuYLZ?=
 =?us-ascii?Q?/dCVNSNXqDLU5utVeCKs5M33PXVeKYmQTjtngENWjZ2phVmj8hnFor1cg9S4?=
 =?us-ascii?Q?4eLszp/hm6sehJgJ1tg0mGkqJumdw3oggn2JMzB7gsmIuvNS96eC8LYX3YSF?=
 =?us-ascii?Q?t698EkJexJovthYpalJ0p0hnv9Wx/0GyH0JrTd0xD3yBFj7LegKW5nTsAZp3?=
 =?us-ascii?Q?3ojES/E954ZxJf+8tFwpJpRxqeYHWild0rkukw+XFGGy04f0xT1UyZ81xP5V?=
 =?us-ascii?Q?idxc2AFrkzB8uoaXLC17EkGh0I7TDHafy2yBszQgtA8cKJFPr8pvV3XNuDwO?=
 =?us-ascii?Q?Ao6s+MTBL5pB/tMV/OHe/9jq3M12mniyPrBVHeEpDkwUl/AgeLq9e24X9PAC?=
 =?us-ascii?Q?7Fy35f6c4IW4qPtwiZM9Otqg6U9vt0iVTH8YIIyzpw4552f0PADsF0nDHyHl?=
 =?us-ascii?Q?WxUhyLgRotPzaxqB74fdEOZvQZ2STivKY/MQdMqh9eFYUtOoA9k0x6Sk4dfy?=
 =?us-ascii?Q?lZb7mwIt5i1BizYO2hXvrxGaQ0TVUm6uamUiolJ0bV8ziuzDLMRS3dRnVfGS?=
 =?us-ascii?Q?BPb+Sl2hf11DJHg/v55SMBNmxDld9BcKwYLD+SdmFEWxOi+2oDKaT9eK89z5?=
 =?us-ascii?Q?EgBY3jP/5l6soWI9xavDf66Z/IImoT9T40hIdgaky+m3ma57MGI49QqtaLF8?=
 =?us-ascii?Q?zZLitBPoHTZ/E+78BEc+a0d21wnn/lWBAkML1NSgbFXE2sv3LLLVJQK6+5Nb?=
 =?us-ascii?Q?2WntxGm3kbR5f0DStLeyjXVzWpiT28d3GCkcUvRAzf7+5mPsX/AOp4Bbl51W?=
 =?us-ascii?Q?YfrPKKuWhjJY85nwGVJ/yNbMycXTaX+y5AEbjivbF97cigHGhtqeipaE6FNo?=
 =?us-ascii?Q?+iKcZp1B+qTzX6F2jX5xVIu4NYLYk8obVEXWIfXWBoZcUn4muC+x2MHxXp7b?=
 =?us-ascii?Q?oSKssk/hcmz8FF33w7epDeEACybF905nkOyOLrusVJJItAg+8VBOLpN0apuq?=
 =?us-ascii?Q?+3SjZnBQu1AsZBtIC67hjMmvnCAeuWgPfO3yLzs94tPtcK/zMcoLx/xty46d?=
 =?us-ascii?Q?aAqm1VWdMmmsFuJd5dR/bQgcCJ0vHu8IaG8mxOD93LAfOpQ4jY1xcUy4Cw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:50:42.1027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7bfc32-eacd-433e-924a-08ddba064f79
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8086

A few MT8188 boards defines a wrong polarity for the audio amplifier's
(TAS2563/2781) reset gpio. This is due to the driver assuming a wrong
polarity so the devicetrees have to configure a wrong polarity for the
audio amplifier to be working. Now, that the driver has been fixed, we
can configure the correct polarity in the devicetrees.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
index ea953d7e1543..65993d25a3b0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
@@ -21,7 +21,7 @@ &i2c0 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
index bf87201ccf27..303d8cc3af69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
@@ -33,7 +33,7 @@ es8326: audio-codec@19 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
index 17d7359dfb6a..f54b116eab1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
@@ -33,7 +33,7 @@ es8326: audio-codec@19 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
index 825015b452d5..36c3b236dcb9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
@@ -21,7 +21,7 @@ &i2c0 {
 	tas2563: amplifier@4f {
 		compatible = "ti,tas2563", "ti,tas2781";
 		reg = <0x4f>, <0x4c>; /* left / right channel */
-		reset-gpios = <&pio 118 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 	};
 };
-- 
2.43.0

