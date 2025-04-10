Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B025E829;
	Thu, 10 Apr 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278148; cv=fail; b=AjPKTBvgj2Tz+vIB6bX6rhozVV90vhbLN4rrjScobxUWiQquoOYgvVQDRoXXWNNifZFBTKR5kxh4OkKfyJNiNP1ivm9+UjatBXTr6c3Nv0mItjnzK+jbzFNCqRMZAS6GprQDWiCNtONw6VlNWaD2sA1YI5q8vsIXq2F+9yfT1X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278148; c=relaxed/simple;
	bh=FwVPU8rKXuL6sjK23M8ZCQ2HZu9y3JVoE0RqKPg85Q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqQNvySkoW1Bsr70439YcF1hNMkJZpqHc+/F7KPFZzaiLF2mD1rtj06zhk2xpsmkk+jkMKxSnRbKEvXIM1svzP1VNAKpUfkf/NwssvI9JPahcdqYyw6YTAPCFiuZuMfEaiywDJF4fRY1fSjucKXzX8qT5uVfS0t0sCxjrDUwOP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DM1YoEum; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OG2U4ey0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DM1YoEum";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OG2U4ey0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A4muil008871;
	Thu, 10 Apr 2025 04:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TfCgcuO3I7va5zoiah8O0Ih9QJpkmKeAnL9xoQSMqqw=; b=
	DM1YoEumj+osuswiB6UP0nd6sE+2KnlSJMQGSAr/rmDOXjlcmGUZWsZ4t5sqMmFu
	AU7qE4K9+euZXtBl42GnQzgq1J5Q1/HOhT9waJKGOI/TolUgpxUBaZZaN4PSAJqT
	sURFgmkBzVTz0HXHXTK75wqtYkt2ea07VHebWWOsAgLWazXezEy5Lw3dKrCe5XIQ
	7Qs/XkLU46zn4+hyfmSyntGp8uywjjCSZoFK/xDiVrtrG66ElP6A/nzvEPJ3yIa2
	4dFqsiDPxLr0SMfh0pjgC3dh1U3qR6HVbB5jAp4JlrTxtSKCnpJTWsIbLTYRjyeb
	Yo9oEOn+jAavqUPR2q/cxw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45wf0gt52e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 04:42:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSl6Ta/IrBmSilRbTXSkPWI90tGZmJHxOCsgKWgg+60eqBmNvDnk1k7yzJUseD4AcFZpzfskTryJ1sOmC4+45zjfjcqGnvjB827F5klUxlNMENtH1gcshLuptrHU1cdpzD+N9J9cqQQn/XXjAt/3r8ycQDGi53UHpHNwVBwasNYxOCegz/mSxWjmP3s4nFy2IiKW7y95y3iZKNOh8Pm6OQftSdeno+JApTKQLAc+myb5Zk+CQm3XNCdE09Jgcue5rRcoAbr6IepE6jfU9qf3tMvtzVrua1eQMx4jPHjM1CGcqXmc8qvYn2IQ2G/N4IBempawe5kno6i5nkiwAhTXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfCgcuO3I7va5zoiah8O0Ih9QJpkmKeAnL9xoQSMqqw=;
 b=nQaiHPx7ZA5UM0ATgjmPXUutV1kisUGakTbOWinQD6xfuecYFgab5niuTcBhppVruqewHEuq0wBCqbeBvXXtOuFHY9YqD9Zaq0PeHh9+3ZyJPSh5gfIfCEwXLr/gVVSSj45fgKW2MesyHlgnDv2I6rpnS9o99DcXTTHYYsBUxwbznEw/L1cf6A95nNBzrvH/dbGG0UvWpG8HjNeQquWHTDkMlJyuch1auGQsftT/DSF23RQB/bdOMWcqg3d3PFGg8ahoit+SIqOhGskVHdbgG6fcNiiPVAMUvHMTkwrYQkR9uezkqgJx1LY7akz3Bb65qdvKktf3f8PW+loza68NEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfCgcuO3I7va5zoiah8O0Ih9QJpkmKeAnL9xoQSMqqw=;
 b=OG2U4ey0ov4rWSvLQ+emVELyGdKNJpzqsdPuy/n4/DDDPzhzV3epWOO+GJUgPa9Oen2o731qwSUlnh0M9OVIaEizP/aAoQkvkeGaffabE7uMbE6tVglpKFc2rz3cDkK77GHoMgFh5Pd7WLcTPcD/qlMgIjMZ+4xXUOzwa+fo0uE=
Received: from BN0PR04CA0146.namprd04.prod.outlook.com (2603:10b6:408:ed::31)
 by CH2PR19MB4117.namprd19.prod.outlook.com (2603:10b6:610:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 09:42:14 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::95) by BN0PR04CA0146.outlook.office365.com
 (2603:10b6:408:ed::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.39 via Frontend Transport; Thu,
 10 Apr 2025 09:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 09:42:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 618A6406542;
	Thu, 10 Apr 2025 09:42:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4528882025A;
	Thu, 10 Apr 2025 09:42:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
Date: Thu, 10 Apr 2025 10:42:11 +0100
Message-Id: <20250410094212.1155529-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410094212.1155529-1-rf@opensource.cirrus.com>
References: <20250410094212.1155529-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|CH2PR19MB4117:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5b76a233-4559-47ec-adbc-08dd7813f92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R0HbICl/cQyLvWUs2mpbkRvKGftcuUB4UqGkmEsshuT3rBzN9eMc4gY258Cl?=
 =?us-ascii?Q?gexoGhGDzbpvK9bEVgIcdoUyYlrvqCmWy0V5UB/peYIXo+LhwLor32Yp/psV?=
 =?us-ascii?Q?5T9lQpGwONq2rBzq81HV5BRBYSkdmpyU1RwJjO8d13h44viXL2kLq+hY9qv7?=
 =?us-ascii?Q?5wEJw6cjPlR7AvGZ/mLxynq7fle5yIKo+DKhjy/iQgBHsce19g36te3iB9Ii?=
 =?us-ascii?Q?Lq3w9wtOJo0Z8C1JlahDxEgIV0ZAEbHh1JFn8Iyi6tZGinI4I+OzLUbiOTmY?=
 =?us-ascii?Q?yggD4FxaioiTUy4VMHXnu9lniOVXliyLZy7VE/Atos+FMWq54b0qG9S+BpZ9?=
 =?us-ascii?Q?8s67y4UsZcEObcyo2cZCkJxKqt+wZzcrSq1BUPRKcEyyCIE9K8giS30eesIf?=
 =?us-ascii?Q?gKeWIWGdvIQnO+JSdbQYwNuquJQwhjtjCuljKT0C7BowbGtQaL/hrYvlC3qP?=
 =?us-ascii?Q?5QOdelCgAA9NsdBhTl0AinRw3jqbjD8VbS7fwNy9e/9Ll0YIqN7v+5GI7BKT?=
 =?us-ascii?Q?/HR6Jbb2gat9AoooHbH/5x8CICQ8Q0og8vGgv4UPo/zqgBOUXRMd/74IVApC?=
 =?us-ascii?Q?sF+/6gZX6QDF3sxgRBh5Ibq0Jl8rg+KiYcb7Cm+P6dWYHKHG8O75l2GEq7+X?=
 =?us-ascii?Q?nLPcN5QKbbCA7JevQSO72/p/+UbLwDbwBPnXqdKHPKtg0EU5uR0g9+tO/+H/?=
 =?us-ascii?Q?fhQtoTXwdAu9S4VAckp96mGw195cu8KA1ToqIwTI4KugCRUiK4iruun85NoX?=
 =?us-ascii?Q?k6tbvsaJUuEt94+TTQHHQCX1uI/tUZXWz59vg1DAF2KJ5EtaZeLmvBIcfYgd?=
 =?us-ascii?Q?PBYOBISe6Db+muFYqeEXM+58KhTnyQX6Ghf90PCPnDCewKVg80+z1Z2vsvtJ?=
 =?us-ascii?Q?WDexwbyJhaDjnSTCOYg+CgFEFkl8wt2F09+8x893C7xkA5FjVXTgZpPw53Y0?=
 =?us-ascii?Q?7f6drjYxmLev1LNgicJ7dwFNtc3u2ViIWSuGy6Au0H3EzxCF+7xTuqWl25IF?=
 =?us-ascii?Q?WXgrj8APgzENwbNqkCTFJOHlxEj57If1dTTVYJdHWvncsQRWZ9cdMoZsXz4t?=
 =?us-ascii?Q?txsCs/t1ainAyIG1/cB1mWFMLZih/fQtfK2aR7OpGTFvR7IvX2FujiLzJAMk?=
 =?us-ascii?Q?nnepGu9EjFqINVR8p7ub13uiURPnSxC5txT8pNIKMcW2tyU3KABpPzdG5iaQ?=
 =?us-ascii?Q?yfK5lwHLosHCp+XX/3UDs1PP0sRgpsaX+8PloS+RhGdNwOFvZCZA3R0JejnG?=
 =?us-ascii?Q?SaQLgTVvGF2GX+GYp3PUBacsOFVQm2M/9mWb9SdleTgAW1WxVUkZpr/vQYko?=
 =?us-ascii?Q?SeJPjYZDv8BpyTEmBdh/wcBK/HdmdWrAH6kLCFr5lPsV1d80V4hfVU5CGdXJ?=
 =?us-ascii?Q?90wpOL+eguj0t2W0xAb0C/dRfyFqD1obSJpDnmDBQzkKJXDtdejk+V0ZctO8?=
 =?us-ascii?Q?GAgwO6aEI3VcQKfOKAMDzHjOERK2A3VBEGHT2O2qKcsSvKCjwShbDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:42:13.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b76a233-4559-47ec-adbc-08dd7813f92b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4117
X-Proofpoint-ORIG-GUID: FK0uE5vSo-ss4c8U8ckyowXiK1BfAqjg
X-Proofpoint-GUID: FK0uE5vSo-ss4c8U8ckyowXiK1BfAqjg
X-Authority-Analysis: v=2.4 cv=A71sP7WG c=1 sm=1 tr=0 ts=67f7927d cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=boPnmfXzqavYFiE8Kl8A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The CS48L32 is an Audio DSP with microphone inputs and SPI
control interface. It has a programmable DSP and a variety of
power-efficient fixed-function audio processors, with configurable
digital mixing and routing.

Most properties are core properties: supply regulators, gpios, clocks,
interrupt parent and SPI interface. The custom properties define
the configuration of the microphone inputs to match what is physically
attached to them.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.
---
 .../bindings/sound/cirrus,cs48l32.yaml        | 196 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 include/dt-bindings/sound/cs48l32.h           |  20 ++
 3 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
new file mode 100644
index 000000000000..1d58d12291d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs48l32.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS48L32 audio DSP.
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+  The CS48L32 is a high-performance low-power audio DSP for smartphones and
+  other portable audio devices. The CS48L32 combines a programmable Halo Core
+  DSP with a variety of power-efficient fixed-function audio processors.
+
+  See also the binding headers:
+
+    include/dt-bindings/sound/cs48l32.yaml
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs48l32
+
+  reg:
+    description: SPI chip-select number.
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 25000000
+
+  vdd-a-supply:
+    description: Regulator supplying VDD_A
+
+  vdd-d-supply:
+    description: Regulator supplying VDD_D
+
+  vdd-io-supply:
+    description: Regulator supplying VDD_IO
+
+  vdd-cp-supply:
+    description: Regulator supplying VDD_CP
+
+  reset-gpios:
+    description:
+      One entry specifying the GPIO controlling /RESET.  As defined in
+      bindings/gpio.txt.  Although optional, it is strongly recommended
+      to use a hardware reset.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The clock supplied on MCLK1
+
+  clock-names:
+    const: mclk1
+
+  '#sound-dai-cells':
+    const: 1
+
+  cirrus,in-type:
+    description: |
+      A list of input type settings for each ADC input.
+      Inputs are one of these types:
+        CS48L32_IN_TYPE_DIFF : analog differential (default)
+        CS48L32_IN_TYPE_SE :   analog single-ended
+
+      The type of the left (L) and right (R) channel on each input is
+      independently configured, as are the two groups of pins muxable to
+      the input (referred to in the datasheet as "1" and "2").
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description:
+          IN1L_1 analog input type. One of the CS48L32_IN_TYPE_xxx.
+        minimum: 0
+        maximum: 1
+        default: 0
+      - description:
+          IN1R_1 analog input type. One of the CS48L32_IN_TYPE_xxx.
+        minimum: 0
+        maximum: 1
+        default: 0
+      - description:
+          IN1L_2 analog input type. One of the CS48L32_IN_TYPE_xxx.
+        minimum: 0
+        maximum: 1
+        default: 0
+      - description:
+          IN1R_2 analog input type. One of the CS48L32_IN_TYPE_xxx.
+        minimum: 0
+        maximum: 1
+        default: 0
+
+  cirrus,pdm-sup:
+    description: |
+      Indicate which MICBIAS output supplies bias to the microphone.
+      There is one cell per input (IN1, IN2, ...).
+
+      One of the CS48L32_MICBIAS_xxx values.
+        CS48L32_PDM_SUP_VOUT_MIC : mic biased from VOUT_MIC
+        CS48L32_PDM_SUP_MICBIAS1 : mic biased from MICBIAS1
+
+      Also see the INn_PDM_SUP field in the datasheet.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: IN1 PDM supply source
+        minimum: 0
+        maximum: 1
+        default: 0
+      - description: IN2 PDM supply source
+        minimum: 0
+        maximum: 1
+        default: 0
+
+required:
+  - compatible
+  - reg
+  - vdd-a-supply
+  - vdd-d-supply
+  - vdd-io-supply
+  - vdd-cp-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/cs48l32.h>
+
+    spi@e0006000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xe0006000 0x1000>;
+
+        codec@1 {
+            compatible = "cirrus,cs48l32";
+
+            reg = <0x1>;
+            spi-max-frequency = <2500000>;
+
+            vdd-a-supply = <&regulator_1v8>;
+            vdd-d-supply = <&regulator_1v2>;
+            vdd-io-supply = <&regulator_1v8>;
+            vdd-cp-supply = <&regulator_1v8>;
+
+            reset-gpios = <&gpio 0 0>;
+
+            clocks = <&clks 0>;
+            clock-names = "mclk1";
+
+            interrupt-parent = <&gpio0>;
+            interrupts = <56 8>;
+
+            #sound-dai-cells = <1>;
+
+            cirrus,in-type = <
+                CS48L32_IN_TYPE_DIFF CS48L32_IN_TYPE_DIFF
+                CS48L32_IN_TYPE_SE   CS48L32_IN_TYPE_SE
+            >;
+
+            cirrus,pdm-sup = <
+              CS48L32_PDM_SUP_MICBIAS1 CS48L32_PDM_SUP_MICBIAS1
+            >;
+        };
+    };
+
+#
+# Minimal config
+#
+  - |
+    #include <dt-bindings/sound/cs48l32.h>
+
+    spi@e0006000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xe0006000 0x1000>;
+
+        codec@1 {
+            compatible = "cirrus,cs48l32";
+
+            reg = <0x1>;
+
+            vdd-a-supply = <&regulator_1v8>;
+            vdd-d-supply = <&regulator_1v2>;
+            vdd-io-supply = <&regulator_1v8>;
+            vdd-cp-supply = <&regulator_1v8>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..b807a91a560e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5708,6 +5708,7 @@ L:	patches@opensource.cirrus.com
 S:	Supported
 W:	https://github.com/CirrusLogic/linux-drivers/wiki
 T:	git https://github.com/CirrusLogic/linux-drivers.git
+F:	Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
 F:	Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
 F:	Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
 F:	Documentation/devicetree/bindings/sound/cirrus,madera.yaml
@@ -5716,6 +5717,8 @@ F:	drivers/irqchip/irq-madera*
 F:	drivers/mfd/cs47l*
 F:	drivers/mfd/madera*
 F:	drivers/pinctrl/cirrus/*
+F:	include/dt-bindings/interrupt-controller/cirrus-cs48l32.h
+F:	include/dt-bindings/sound/cs48l32.h
 F:	include/dt-bindings/sound/madera*
 F:	include/linux/irqchip/irq-madera*
 F:	include/linux/mfd/madera/*
diff --git a/include/dt-bindings/sound/cs48l32.h b/include/dt-bindings/sound/cs48l32.h
new file mode 100644
index 000000000000..4e82260fff67
--- /dev/null
+++ b/include/dt-bindings/sound/cs48l32.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Device Tree defines for CS48L32 DSP.
+ *
+ * Copyright (C) 2016-2018, 2022, 2025 Cirrus Logic, Inc. and
+ *               Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef DT_BINDINGS_SOUND_CS48L32_H
+#define DT_BINDINGS_SOUND_CS48L32_H
+
+/* Values for cirrus,in-type */
+#define CS48L32_IN_TYPE_DIFF		0
+#define CS48L32_IN_TYPE_SE		1
+
+/* Values for cirrus,pdm-sup */
+#define CS48L32_PDM_SUP_VOUT_MIC	0
+#define CS48L32_PDM_SUP_MICBIAS1	1
+
+#endif
-- 
2.39.5

