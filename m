Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3A28E5EE;
	Tue, 15 Apr 2025 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717831; cv=fail; b=GaRP11Bc98+WuERMg9L9xx/MF5x7a6hKv01rVutIew0etJ8rSs0hn8bfPqOvnE3BSGGEyNjqcdrcowLSPFmfNg7pk+rbCGuPnsB17GDOBlzoIyAX6SpII6XhIXe2JO+LORhInF0XaCwyUnSEhyW+Ldwd7RNuH+UeyFzV6YFC1bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717831; c=relaxed/simple;
	bh=nMC6GE8fFf4/c8CVenWWj1C01G5rUBh1p80Tw1g2d+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fthc3tUoKXHfQT6fzP8spWHQRCMOdo19Zor5652spbeuNwy1CUDuVT5j/fh+/dGbSFYHVQd4aZGJV3+XIBhyVRw4J+WWEy11ChVn/N3QuTtdxeCHgErL+481plC7jV3/Zy9im/CqIOGQeCSGcP27xgI+kOsCctJomd51zMtUz0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TX8N6sTJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uwppHFRg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TX8N6sTJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uwppHFRg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F4xWIf005770;
	Tue, 15 Apr 2025 06:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qxqzxPfKcEJH6+kXGU+wLLzUYac7v7PEUkSAtwnMpmE=; b=
	TX8N6sTJVk0rbj89zk6k4Zoz9maZ2aeA+6uYFvPbVKj55bEcVZw6yRCJ3wXD9aAd
	y8JOpDM4OricLBe0ksPjPT6K+kpeOsYhUOah93Gzdpy6WCjXJTAog6n/8DkW2b0E
	22lADotsHkKy9jRmT4Z4Xcn/PZqEis1bskRzuz6JE82SwITNfwM7J2IcD7BNw/zq
	t78NOdiQwtKA85Qm36tkLrzBX+IqcUMstug8SQHwbMECa83wmtcdTn8sswpx9yaV
	qBIU0IfMYIlNEBU4RpZGqsEW+vdOCCT4k99XV/0KtoNBdcZKwMDs1OWENTsanMGw
	V+IsuHLWM/Y0slx7vNG23g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkgughb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 06:50:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnsRNgezxThieckKycMoMf0NgmmnhPwaNdFewl7M0Kn/DUurBdobPV5iidDptYIZTiRDDuYmlv3sSfDSTchhgBmKY8IUI+4nEJjYl+j/i6PFa1rz1rxVfK0GnKqgjI7BLZAg6K3lg1U86lPBUxDCnvLRaSq3ljUgAB8pqjJEbkxxNLtw7QxeWo5DjuxoVyRJOS8rFKtGU7ZBZsQTVr4BI25csmeN6e+WnLRfxPQF7UqiwXsci5DBm8jBTUByQWezmXA9OyMMx10Qnx6x33/iEiRLpz86W2ueYq9e0wXGZexK/Iw9+na4LYGVygQgnhF6KZe6j5wI87jsXvQpFiJ9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxqzxPfKcEJH6+kXGU+wLLzUYac7v7PEUkSAtwnMpmE=;
 b=lhm06hPpUcqcLLaZMv82tMISih2rfABc+Uh7MFB8vp1/eVsF3DZ4G1Qx3y1BmL/lSBtwabBOK7SMzY4H96fDcSn5/1cGTVwudqfpxHe6bVd7EMHtyULnf8arzuKw9989hEJdojYsdI2qpzCg8LwcavI/x8adUOQASdbygf609RJyuejQ04QhLa1hPtvl10qjZ5fTgJD20oxIZxvlWtmZq2cy9rNKm6bkyvtP+QD+7gVAY8X19dLsghomcjflYuFYcl9rqKRqib0XWbf20Whwbj3a/OKHBkkmMinNga8OOJCDdaYrdzxydbG+HVPZIDcUL5O27ELy9au3SXoOmoJVdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqzxPfKcEJH6+kXGU+wLLzUYac7v7PEUkSAtwnMpmE=;
 b=uwppHFRgfSyAXO04MSFEYZbpNpcAP98myP/1dbadT2yUzLwFPdF7U+7y4zMUI5Lql1+Rnu1TdXxlVqRa66RDslp7SHs/KxJeToHQJ5rtmPT8taIYqV31H3qTKjsu1O18cjEEUMftvUMk9hFpQRKELvDOtjzwGbz2DBckz+qp1QE=
Received: from BLAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:36e::11)
 by PH0PR19MB4922.namprd19.prod.outlook.com (2603:10b6:510:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:50:18 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::ce) by BLAPR05CA0008.outlook.office365.com
 (2603:10b6:208:36e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Tue,
 15 Apr 2025 11:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 11:50:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36981406544;
	Tue, 15 Apr 2025 11:50:16 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 174FC82025A;
	Tue, 15 Apr 2025 11:50:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
Date: Tue, 15 Apr 2025 12:50:15 +0100
Message-Id: <20250415115016.505777-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250415115016.505777-1-rf@opensource.cirrus.com>
References: <20250415115016.505777-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|PH0PR19MB4922:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f8b516a-9a05-4fa7-bc99-08dd7c13b12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b4DonF2cwe8+bfA8e5K4tW3t/JxJVJp+134mlP8XJpuPTY+SMp1zHeRwbIpc?=
 =?us-ascii?Q?3UDpMVOY/lvdhEO39mNQH+Fwb2Z9a4uSJCCd9NaKmNpyQxElZQJoHVNILdz5?=
 =?us-ascii?Q?pPv5ha8FMmm22UcXAnOWZ3qfnHNyJDo8fEEwMxsTxDLEkaR4UakO4QJWOYzs?=
 =?us-ascii?Q?i26ciHisoYRT8sQIu5pwetwrkafhf7rhfoEOxKqkpRl2kllypLczfJoIoSBn?=
 =?us-ascii?Q?HNCUxDPUfqD8E6jV2yK3vtEZx3YUmIRojXMF8gvIXJ2og/49OuHnC9ADw3Uo?=
 =?us-ascii?Q?GPh1u2TwXe4/ClIYflbFSZmoyHIVwJFQzVbL4zmnLIXV0b8t4InTfL5QTbQ+?=
 =?us-ascii?Q?bBiKBl193wOi+FyMwqqR2elSF2ac+V7bOLBpO105azTR3qW+VRQ1hhSpEXM+?=
 =?us-ascii?Q?2xAHUPwacOWOkK/PcSk4eB6DE93mSu1Kg+Aq4sTKciH9RWebOVDwXQQ81sDp?=
 =?us-ascii?Q?nCzrx+6U+N13LV3GhIpqehZOay6PK02H/Zm+AyT7ZpiaC7rsK9hjk2G6zMBs?=
 =?us-ascii?Q?nbp/d51vy5NHxFNm19YKGIrunGKZYD2Cz2T+Z/5o2GwYUQ8sG2V2C1XdV6g8?=
 =?us-ascii?Q?7LhOqOqIJEj/T5HF2i1zlpYr1aToCXwXbi3+lXWEDEJ8PYfqluEDopmJPEqU?=
 =?us-ascii?Q?jHlwGxot7DAbPCdRw/WzxIW0WSZBCbqrcP0MD2p9dEjer/w1Ps6S5BmcySjg?=
 =?us-ascii?Q?G3j2Q1I3AI4AshuqJmyhvwk/Hm7+XoWyW3yvWddMsS4v0qHhPfOvm4DbIjKa?=
 =?us-ascii?Q?xuTrWeehsn+MdOueyVpcTKFiO8jx4vbzpWXep+yQmmTWaWfhUX7Npe/GBCsN?=
 =?us-ascii?Q?SCLmX/T10PhymdubrkrH7kw74BSzk2WIELnmR4+f8jXTOlCh6Mdejw8lusSg?=
 =?us-ascii?Q?GHSUP3j2W5LmASGKwLuy8UKg30gvvdYvOIbRUL/6g5scQNVw2B4gSRXsZFEN?=
 =?us-ascii?Q?jVpEevTEF+1gXc1HTnB7X3QD3rxOcNM9ynYYG4g+y7AcM28WMXIY/4ufqXpu?=
 =?us-ascii?Q?ZgfUHaeNmzy3whp3tPmprfDLouBnWLIwyL8LSa/Ii65bG9d5ixi2xL44wTl4?=
 =?us-ascii?Q?2n2BvHuVz1urKI+LfdOhmyZ+Ln2YCsDUUqkUGvVnyQUxfNG+0hzrXP+V31nL?=
 =?us-ascii?Q?dOQx60JZbX4hqi2utVBoXFBFsjrjFD0ST6kZN6qbRPbl8UDN4FUkOOrpGDMR?=
 =?us-ascii?Q?IgLTJg2GR9RHR3mEMcrHsZwyu+fvECEkByg/+X9RhXO4E8riV6Gf/o6xr92B?=
 =?us-ascii?Q?eknTSRmkti4rTW9C0a9ekQYKY2rOdmz54EUL11gb/fsnUv5bCYZ/X2dYJZX3?=
 =?us-ascii?Q?26koQcN+OLncnvAaIavft4V/VSw0WS0d7L8GbjnURMZna5rt9TX2HNxYWRHR?=
 =?us-ascii?Q?m9wPHEGoM+FILl57RlSbKK8DTBZ27cplgR1L096mVtkP36gI+p/hM10RO0ED?=
 =?us-ascii?Q?tplwdIbf0Yev6XuRVY+T/lYKCGvQFoAe0nYPq45E8YqLggRbcYYqRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:50:17.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b516a-9a05-4fa7-bc99-08dd7c13b12f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4922
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67fe4801 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=gEfo2CItAAAA:8
 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=yMZilOE19xBG57yZX34A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: s1yqMYZmcAMsiJUhXWT7sI09xQPxK64Q
X-Proofpoint-GUID: s1yqMYZmcAMsiJUhXWT7sI09xQPxK64Q
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in V4:
- Removed bogus updates to MAINTAINERS that were leftover from an
  older version of this code that had other files that are now deleted.

Changes in V3:
- Remove reference to obsolete gpio.txt.

Changes in V2:
None
---
 .../bindings/sound/cirrus,cs48l32.yaml        | 195 ++++++++++++++++++
 include/dt-bindings/sound/cs48l32.h           |  20 ++
 2 files changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
new file mode 100644
index 000000000000..bf087b57aaf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
@@ -0,0 +1,195 @@
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
+      One entry specifying the GPIO controlling /RESET. Although optional,
+      it is strongly recommended to use a hardware reset.
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

