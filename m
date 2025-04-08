Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7522DFB2;
	Tue,  8 Apr 2025 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129404; cv=fail; b=Cl/I8+3g4/E7h/3r0Z1K9xUic/7kQ47eKZy+TUYxAETwfAnDQUjOvgziVB4/Yc4l+qRFtChBiszYMxARfqZbU9lYfKsPGYZG0xuTQk07l66fDbAZ+1pB0sOBQJhxOAlzThJqPtYl911YtegsamM71ysfqFc4dJ8zqeS8d6g818Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129404; c=relaxed/simple;
	bh=R1AvojrVg6hPGRagNWgGgd8+Fdjm5x0pmPwYdFWQz4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVOyWc1t+I2WboT6OyOMRBObcxrXspaUtFYRsXyTJd15rlotz67ZT9JeYJg7hVnb12pS3/9jzq/RWR8tSWm/IXxXLqMwFvfYA+56prjmxQUU2bzx66U+F9YVi+/HKFZPgkp4/v4AiFMqKxjj+2SETRnZbZ8aCqCFaN9kxkM0MaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UmtBcpxK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NbKqSWx+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UmtBcpxK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NbKqSWx+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5384tF4O031977;
	Tue, 8 Apr 2025 11:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YaFnOMzpTfYRGg22RFdi5DfO7I5GhNPrHKoki0dpgAA=; b=
	UmtBcpxKI/CqMVSwJGa6OBZqwHgJl9ocDXwVeGSG2LDY29R9rby4NLfveWJZXZpp
	pckKe18w2mvMOPYiXVPclgEKuRgXc2Zm35wExiRIaZXRrXPqUGXMpnZICPv4QFm5
	fZgYHx2yHyBFUn3UKvjy49zQJvnUjjL1sS16TsakWjx4CEg1qGTGdAYGCZvOBjS6
	2ufS+zNsQdbBdEbavPI6Xpnh5BTYdJkC2DNi80VPHwV6NtoTFEBAIfhWzVdYF3pP
	aiqqf5Xx3Ufn2Z3UupFW9IbOq9qKmCYWgaacHZTIwpLLPVMs6fbGwVqnfESdeUsq
	osvPdHVSpbiF9/JP7JLZ6Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwjgkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 11:23:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTUcetZfatScZ4YbQJBeHGPP/7XAuHu2szU4BtBnJtPQAdB0dn+Uw5TVKKcPEtC3eY/iZdkWhhlPFpskNZ5jvarbdFvSMNSb9v1STiAk1VC6+vqRdJZfKu8guWyX3wk0bocdolm02qch18aVmSSkwytC2RwYQYp64SKZoLF9HnJrnTvd0bY/deyOk8xWVk74AdE5TR8q4Ye9ZkD0oHLly2pHzcQ0Y4pmXL4uUBuh6bzH9HkO3BIoZAknFeo7zjJ9j7OFsgX16Cn0+4vR2L4IsceHx56X/qwxZYuwNxBbza4zrRfWwMtpAC2nqQW8LStXThbWizzAqrVL9DWJqVuwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaFnOMzpTfYRGg22RFdi5DfO7I5GhNPrHKoki0dpgAA=;
 b=t+LjIp3geXastfSFrKQpaCH1i5NALB0nyMvANK1hRncIsfxF5acqKzrnBPtppThjz714wW7YU9cf7u1tnKBsTt+sl/DwQnK7v0ba/tOFW9pz+TxxwMAFDPyOpkCcWLAkUWiTnDjGky9564O63yYmz91oxdySVgBpjCzACDfnxaKV5m/A6SzO614DuQwDcvIjnMIHoOqRgEfaQvfnqkQnyYOcNK8EOi3KQDVlwKq35cimu7hUnfNyfc57XRpjny0PDWgMvX9tIl7YAGtf4V7XKySOWcwUiZTAoe386q6N62nC4l+yKV7faAClgxSgcxUHrew2xzbqb7lNvQlu5VFoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=kernel.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaFnOMzpTfYRGg22RFdi5DfO7I5GhNPrHKoki0dpgAA=;
 b=NbKqSWx+WFZPt8ncvCBcZp9P/GA8mmWY4dkdlos81olkP1pDUxhhnxxx/uVSgYd6bhsTj2+E7tMnmGl+bhNZkbt4XyBTXZ3QAunCYEc0G2a4qfiLjB/dgAflbcz4fH3+WnRJWpuO1k83NpYRjwYxUOv+ygZDxFcEuOjGCP8xXBA=
Received: from MN2PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:23a::14)
 by DS0PR19MB7960.namprd19.prod.outlook.com (2603:10b6:8:165::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 16:23:13 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:23a:cafe::21) by MN2PR03CA0009.outlook.office365.com
 (2603:10b6:208:23a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.0
 via Frontend Transport; Tue, 8 Apr 2025 16:23:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1E17406547;
	Tue,  8 Apr 2025 16:23:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E24D882025A;
	Tue,  8 Apr 2025 16:23:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
Date: Tue,  8 Apr 2025 17:23:09 +0100
Message-Id: <20250408162310.670041-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408162310.670041-1-rf@opensource.cirrus.com>
References: <20250408162310.670041-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DS0PR19MB7960:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d46c7cb-b0bf-4d77-890b-08dd76b9a8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IU+jNYCJcximHXmlMtNdH0IzjaGaO87crzUjL94+KO5TMBf9W0MBy3qDsvCN?=
 =?us-ascii?Q?4a+QnYlEshu4XJdPOCuiz0NLILU2HUULM5uzZ/9Tte8Z/bbkBr+dIDVXeeaL?=
 =?us-ascii?Q?iUjetpdFQ1uvqpsikK+oGmqix41XVRHhoUvl0QGrs+0aRUBjYG1soK2Lb1xM?=
 =?us-ascii?Q?JU9NI+75s2Ll6Evf2qY5No/MK+uEPW+70x9QXV6v4AYXrmwQUVOxKbqIv0SJ?=
 =?us-ascii?Q?mu0i1fhxt+cglnXkWY0KMe+4bbxSAF72ea8QZ0eiXQtWadGsZRDuzxDBIWvp?=
 =?us-ascii?Q?049uyw5GnF+3E7NkijDBmqxU5+9y7jDAfxRfPDVRuDo3juL3BauhWpjec90A?=
 =?us-ascii?Q?5mYgpk0ElRcaoTOjV7+8zzPfYjdLE3YIZT+XloUDNnkgp/VmuVhAuf/oD0X3?=
 =?us-ascii?Q?Au+H+KLLt/RpZNYM18aanbRSlPgJ0sCiO0KM9Y1A60nhiKpGFasr2REw4Kyu?=
 =?us-ascii?Q?QXQbpiSdjdDcLOfiQVx7dt74/UzvN/gfF36HHl+me1JK5eH+cuL/44+03YBM?=
 =?us-ascii?Q?Wp4pXt6BnbEbGK2fqYK1FrvU362hsPy1QrMS2DIsOHDqsekwfHy+1Xz6HvrQ?=
 =?us-ascii?Q?BIOM58nYE95RwhmaKYshvEH3rJk+/BZNe0e4le+ED7kM2NIlGul49kireAsU?=
 =?us-ascii?Q?oXIz6v3NGK5f8CuNJ63Ykud3gGefKIDWtd+e/VGh5KX7+gN0/iVrImijeo8d?=
 =?us-ascii?Q?+9ls6x1jcXoFwQCXs41MdxM0HYfGhANvIhgil08YMJ3px4NNtpwx8TVSd4xa?=
 =?us-ascii?Q?w+3JhafHFo+bAIRzb6BeGXKx2sF2s9SWliy3Z34S0aw8tCWs5aAAvs6oGxre?=
 =?us-ascii?Q?QbNw+0tYhs4qaQVMrXoTzeWUEUiDwXhkyQP3K0qI25zzxtsI1n3f1vD4mZ6F?=
 =?us-ascii?Q?FM239w3UgSqnOyVS3fcV3MrXWECMCSEmBV1jtHfIDcL92v/hu7SPVKqGdL19?=
 =?us-ascii?Q?DzqupRu+vROdIGR0DL4n32L/kdw0n3C3z+b6NHXDiB+c9n4v8NFBaf7I7M72?=
 =?us-ascii?Q?p18gTvq7yI3IUfe8jZpMHl1rmozs3Wlr/y3XKcbzzp9UBCrmKBaR0fEJX/eL?=
 =?us-ascii?Q?S2kW6AmszKN0Wm4bYQDDL9H53iirjiw0zXDIHbu2yStH9+oEsVA+m8qfHCwB?=
 =?us-ascii?Q?RL+kuSg7yd0ecOf4ndH8t9VHE+xtQlq5U7GjKYlMxnjto3V5ttf5SdzVL3dH?=
 =?us-ascii?Q?URlAiv2U3Qlg3j3pL0mLW6wLjDFEF5wnrc3GXSqFmO+foYz8+mnPZuxzHwK+?=
 =?us-ascii?Q?sFnWZmWkV6OwxTxFzAtbt9WNr4B1tWQSqDKUNZqZXH2RtUjMiZWSnG4kfrCQ?=
 =?us-ascii?Q?zaCDAY6kffex2RFtQiuSdp06ud7BE1tGIiryjZgON/elTzVeibj7bSz0J/23?=
 =?us-ascii?Q?292Q2aVZd3rjzoO6Ohwpg/HNlkiWPj/w2NWuBQ+yA4t1lvtCgoYHZM4JCE4W?=
 =?us-ascii?Q?VJi2z/EFyDi3sBmN0VlT0YDAUPCtleNO?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:23:12.4641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d46c7cb-b0bf-4d77-890b-08dd76b9a8a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7960
X-Proofpoint-GUID: rOg6-yBp3Ci2yJA9NXECG3eHE-t_Th0U
X-Proofpoint-ORIG-GUID: rOg6-yBp3Ci2yJA9NXECG3eHE-t_Th0U
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f54d75 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
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

