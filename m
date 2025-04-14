Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8625A349;
	Mon, 14 Apr 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620662; cv=fail; b=mDmJCUdsLXNqt6r9fGjua1CsQ7WhlZEIe0f9Y92KWlDw6lyTq6Si3Ug9/OFdkTXSaEQ3UonA91lsgggjNxowtzAVCPV2yiuMDHq0vCH43T7qYxMd527N4r3mNKc6OVoYsgrU0ssYw6zE8TkvyEArjcuP/Mt0GzGkKD19Mlun4qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620662; c=relaxed/simple;
	bh=c6lSnRJDsbzfPExYNFDhnlt+pZMuui/fFdHJDBRkUv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uobvvBn+PSCb4fN45Xx9deB3Qzcka4wOj8ZmYs/kRGWmFhD1Euc5VFrYm03lK+efdW1Ad8SNnUoEPpD1ZVy07BDKPMM2pi84051t65u4bg174kYsstvHmaQN6n3+ejbIZ+OBdSF0AECJvRYlrGfGO2EQWie0ATdNKYLrOD0oW+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z1yLH9kO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sNvvE3D9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z1yLH9kO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sNvvE3D9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5Vh5g019464;
	Mon, 14 Apr 2025 03:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Hm1VAl7cUkLMLKeoAAYMFOxH7kXI3jtDt4zYYiRBbOg=; b=
	Z1yLH9kO76kSIinQ0tUyZ1FHgk05nKGhpTZksW5mMwg3C9BURhDeGn1dXHicFRk9
	LEVauuj+VMr/rPcrC+OcCnfJH6aPMMgqewAeejT+JTQ8VAB5t0D88p8lwVIVHFWP
	eDbG65aexBwTRHuhHHzq6wckMArdBussNyO5gCGjYQN8o8uKmaeQzF9wqM+jEx7b
	r8LbxI/NvKuE8C1Q/PKTl0oHg72L55QHA49JbSfVtFlSZJagbPGqRLdyJ1nnUDwq
	SFY4pWuuyWUiy2/A9hYI5ILhUGGxFwCnAr8iOZOOJR5DU9urhpuxW11WqodYfyxB
	qBW0NKMSaCusmb48WYrQSw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkgsw4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 03:50:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb8D9TIqKn+W28zaI/5JwSc1dRKC+23K0FbGg/QqoHkyptV3pF7cXD/VpbmAe++Muv4NsL4GXUkSBvz+9efAvo4wpJBSYDXwCsnYWeQqKmCJ4aDs9FOQANXPZbExPGbpHHjqErjnR/IVsC9aH4SpCyQrtLlpYPJh13gCPV2INLuAzMGSR9AuAikM02fufGTZWi2lxY/n93yiGij/7af54N294B8jrAbUzDBY3zus8HBZJzaqdO4pk4h1ZmYpMFsAKWoLRJShARUZUbJwGfwSNjPmLOLFkheZJ5H1oYuHrSH1erHZJuZhpxCSbQL5+F8sMB3r10yigbvOiltVJl5EZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm1VAl7cUkLMLKeoAAYMFOxH7kXI3jtDt4zYYiRBbOg=;
 b=JgBbHchR7klwkhYG5onuA6QXOai9SgTy4OUI9dDESqh4gpxNNG1IvQUXjvXxuLjXKE+rkJ504uK3a1jaatTqOl0TuNYxfizZw1jbutzKLHyDFY2tqkCCdydQjlMG7sYXvHkwO1R1THXJaxsQxSeIYbQSdmLw5nlXPugWRpgyBxedAaLeSwX5a+mdhphynf7tzWNOpj6dx4Y+FjVa9CJuo5AS8i2K2T7a4phiz2k/li6OO7aC4f3nMdNPBoaTRzw7jJA8vKOBlkHiQ9L3d4ndObtB4AtkYSTBuUjGuWnFkc5UoPiP+LdL3f7G8q5ynwrvG/14+R+v40QpvK/BCoc+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm1VAl7cUkLMLKeoAAYMFOxH7kXI3jtDt4zYYiRBbOg=;
 b=sNvvE3D9+ztSr+elGSfduf19Wj4eLeL/4Wilr2pKR6MLe/IrJBkeosb6+kff/xctENH9lYYLVytuUk2ViqBOMZEEcRYsRgYOig9JxQucA36d0NPbbP3aoJjih8T2DOdl5aAJ2vjwKLplOVF2iOXQRej7QLJtzXd5Uxx0QVhxOw0=
Received: from SN7PR04CA0204.namprd04.prod.outlook.com (2603:10b6:806:126::29)
 by SJ1PR19MB6354.namprd19.prod.outlook.com (2603:10b6:a03:457::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 08:50:38 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::e3) by SN7PR04CA0204.outlook.office365.com
 (2603:10b6:806:126::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 08:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 14 Apr 2025 08:50:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67AC1406542;
	Mon, 14 Apr 2025 08:50:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3E55482025A;
	Mon, 14 Apr 2025 08:50:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
Date: Mon, 14 Apr 2025 09:50:34 +0100
Message-Id: <20250414085035.12469-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414085035.12469-1-rf@opensource.cirrus.com>
References: <20250414085035.12469-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SJ1PR19MB6354:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39c19c32-4aac-4101-0f74-08dd7b316d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EAFR8jtZFgTQce4+wTjXMSEVxi4x+flPaHbJKXEgxYtJo003edqAjQq2UQ5t?=
 =?us-ascii?Q?gdzZzPfCo1IIzvbNYO/TWfQvSvd2IEvGm3RypPjODlWQ+EzK0nz4Ff6dwfyk?=
 =?us-ascii?Q?dVXenCnvxzTAYecTdmnr2KQzry9xh3S/97dYtuHNQHoUbGJDR5ONZPkXG6QS?=
 =?us-ascii?Q?j9FDncLF4Kxj0p99imxuLLC1vPiE84a2A0ox6s8Ayc2w1eNL7eGLL6Qyr3xq?=
 =?us-ascii?Q?ri+KqYefKez6ZWMYo+aNI2eZEs9ABocuprS2cnY//Wg/lxrWkdUVf+47ZxcX?=
 =?us-ascii?Q?hL9n+Rua6D5fBpB92tEFYN8YB6ex0rYR7ZXaMQGPt4wm7jQ9dDNpdp4MkU5h?=
 =?us-ascii?Q?FTmmOO371DPjkMjpcoi19iB4HufYNsn5ZBcWzVtgpjdvZyjMcpQxMZBpErxi?=
 =?us-ascii?Q?DoMy69NFZyBwiL/gbuORCcwbYsrbT0mMnDh3CG9Qy+3xhzITWaGykwC9yui0?=
 =?us-ascii?Q?cxpI+dHr5t1yjp0zCG6IvAUPlVvtCo8Btq/emarDv21FEOe7Do64/Sc7/BOo?=
 =?us-ascii?Q?TqJhX4TdY339lyev/M78BZEsWOfTay6X7pwqF//yeeGgjDx44SjLA6tVcpFJ?=
 =?us-ascii?Q?38OTFwXBV8WddRTjUi6BKDSlolsvW+2kWOLWnAUMimSB+ZeLLyAzSqlRVPLt?=
 =?us-ascii?Q?xgR5rh8rWL1oY5FQeh/saiyRxZdVp+6ziRk62mQ6cAlA7Wc2tqEkdOozMBPS?=
 =?us-ascii?Q?HbQOYXBsagC/DtJkyDEj0i0uOYEbtiRErHBvoY/qks2IJrJryGOmbfhLooYY?=
 =?us-ascii?Q?+KSfZ20nWoFBEBogSU3Z8Vq+6jOnLH5k71X9608iCYC8WetgBwo9D6bOsX73?=
 =?us-ascii?Q?FcGcipFybkjQmI19bfkO7gUVbFd8tAWiSqhzf22BShFpjSdtlkT1rDXWrRf8?=
 =?us-ascii?Q?bECGzirHIUq9qSQ+cJy2XAUAATGfky+0WCieLI/Qg/gJohJbIMWvrBCQXk8o?=
 =?us-ascii?Q?c7YBP5Z+yjM71615kVJE9ViOn2wL9rhVHUB+SB/qx8y5IxVKO6XieCU7rtih?=
 =?us-ascii?Q?bfXWPG1aP2REO0w5gocZm1A9KZl9NsO7wagzNkcghEQJtUJpdgP1JHPiI1Ea?=
 =?us-ascii?Q?bNqUYDgXSlJVuoXruhxB8cAgmmSjn2WbxrDQAaeU2rkLv9SDHA6/N4bg+Y5B?=
 =?us-ascii?Q?h401FUkFd0L8Xb2tFRLB8n72Qk7hQ/MNl8K3GixMfFHnQ00uJ8uFQRLI1Z9T?=
 =?us-ascii?Q?m3hhjVK98djsDjFqwPT6OhgZ+Wrg8Fz/U/YleZ7mCm3On8iN50TTSlpWx0kc?=
 =?us-ascii?Q?T3crzLACVq1GcUhDTX3mxpt87Njx+PoG7ZVS73jWctfRVVI5ulBciwUGqVFo?=
 =?us-ascii?Q?ETyu+wwjfwy/6RSlvIBIqx5kwO8mjGf5Iz7ju4zjL59hzrAfqXee0YmNodKg?=
 =?us-ascii?Q?TpGcW5HFRqQyG1XlKRgHvsWCVJX9g2sxJy1w//Uar9jxHUVBlrzYQgIAAa/r?=
 =?us-ascii?Q?7k0BjfG1Twi7sdrFgUmnwFhaOmRWuBF587GPhJcSse1bLlgQmZEH6Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:50:36.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c19c32-4aac-4101-0f74-08dd7b316d03
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6354
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67fccc63 cx=c_pps a=CSNy8/ODUcREoDexjutt+g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=gEfo2CItAAAA:8
 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=KoJoRkigfL5pzssNYOcA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: 031VcedOWVOWQri4lBxdn5IDEA7DUGyq
X-Proofpoint-GUID: 031VcedOWVOWQri4lBxdn5IDEA7DUGyq
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
Changes in V3:
- Remove reference to obsolete gpio.txt.

Changes in V2:
None
---
 .../bindings/sound/cirrus,cs48l32.yaml        | 195 ++++++++++++++++++
 MAINTAINERS                                   |   3 +
 include/dt-bindings/sound/cs48l32.h           |  20 ++
 3 files changed, 218 insertions(+)
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

