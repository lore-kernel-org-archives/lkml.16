Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021100.outbound.protection.outlook.com [52.101.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2144275105;
	Tue, 15 Apr 2025 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702053; cv=fail; b=gjuSjOqh7WIsPcNQMUrqYA9xRiDdSE3R9QAMUsoPVt2ETzxPekJTyjFZfRPI/rTRRWIchKdJv4X8LgkiX2q8/bsFHzkzMSGBhICGswWWLi/IMArVE13PmChRahrROejWTizemqVluGZ27c4BNch60mlEwYc6I5D0ze0vrIT6Ies=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702053; c=relaxed/simple;
	bh=lQbcM19iwKNN1B2y7EDJNY2Ha0dRL76ZD3/OM5i1DRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkIZBMenobuKFuCSvFrsrByxhihkwP7XQYBUupIrKGTgQj5ydHfxtb01GWP2QKnEBBK0m/sL78Pyt0hXABvSQrJmOUDCBOnOlI03+T5IeKF6R4mJSB9oEKAUoZYhqMVDK7qdOZbwbBi0/KMZ9k6cx0rZu8+fjVoBTbdcurw7CEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHOW2ckcEcQPlbldpl4swzLnCdvNbScflwy4VzKHGosCfW3k6pByk4ufCe8mr0CurHZTPpm7MM2n6YIxp6ha03UIE9FYBwJ7NVspqNOAODFemZcXRtubqag4TXRmgcfU72Egais6G5NBpnEvtdQ80CEKya/WcffZ64jpLLOJxr8EYfkqkotmsi8zdYA5D3ydsFqSpwwMGn2OfKkDKfRIAzdqMIFHsjE8niwroGQirePERv9MKS4gAR9NpHANiiIamZVQ2y6eia97WBzyMWpoF/u5bj4+w3PonqJUQ+eMF6svoZilJeKChSm2gBl5Qf3a6T/twqmFd1L1EyGtFIvipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySdqJisphT9IDv//N0VMKf9hr/L+cOAPw3fuNqhKncg=;
 b=CYXhCXeyMsA1VnZbOzICqyafRzYXLrI4RDwbYCNbeDMC4tYfunCUP7t5ZoSTVgqmFuD3StDbFxe8Gbo2DJ4U/92VGvF8Q4mFFvFvSHZ+6XrwYlyEvq8asgXYFbXf5C8KcR6NcUpPbrBtD3/yYYvwgLKtM1QqSC2jWstVcSSiPrPl5YynzlbkJM1MydKx/uqGBLafAM6Z2NwHiZvR9H5IaPgaTKaK4SbXFyl2cXcr49KTHR70X9NJPVarXxKz9n9Q5Xpy0MEsfXsz57ODIVpWTer7UNqyd/MaFqVWnGmm5X0Ijjaz63ThN3zBjboIlo/DLImgVlDUI3pm11ZJQMBgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0299.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c8::19)
 by SG2PR06MB5335.apcprd06.prod.outlook.com (2603:1096:4:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 07:27:26 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:3c8:cafe::a0) by TYCP286CA0299.outlook.office365.com
 (2603:1096:400:3c8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C210E4160CA8;
	Tue, 15 Apr 2025 15:27:24 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: [PATCH v6 05/10] dt-bindings: mailbox: add cix,sky1-mbox
Date: Tue, 15 Apr 2025 15:27:19 +0800
Message-Id: <20250415072724.3565533-6-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SG2PR06MB5335:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a85f6908-638f-4b08-08d8-08dd7beef880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oIEO7RMhbT5sx9pyW1nFGeSICjEy0d7mCc6qIRfp0fLr7cXUp3B2CNVspC9G?=
 =?us-ascii?Q?n94x83Vo7KSIearVzqdtWhiFEf3NewyH2zVkkGVI9Z+Z2ckMIcPbQb/sx7X6?=
 =?us-ascii?Q?YQypPorwgcc01hv/PzBZ76HXJuEp7bDU9XdKdVEM20VM8AUS7vGkR4G6WZBK?=
 =?us-ascii?Q?B5tLjB9cMx0L0cOFkf4ViAxcVQ+IlU/HUas4jUp0FnAECkGE4y35VPq39QR1?=
 =?us-ascii?Q?ISFibDOJWB843ycHK5Af9o5tK1vCGLeQM3HV+M/Gvalv0y8XR2OwTNKNbRWR?=
 =?us-ascii?Q?CfJtoVibO31R+9WEK3tf4MZ+cP9AGq731i/3NJJjOAoyfgPsqMh8iPMWlMg2?=
 =?us-ascii?Q?Lwy6gXqT33w4u1RO/kL6oltFOdqD6aloHJtq9qTdmCGojih7UOwbtL8IKdW8?=
 =?us-ascii?Q?rWaXyUCbyf914W8fTOImXzJhcA5h9Jbmt3Mz9gWx0Ex212uvZILSubSG0uVh?=
 =?us-ascii?Q?f2vSyOy9G7pp1TEiJYK492SrspYFx2VrMlGjNuJerYGeLglZmwNcCC9WB4hf?=
 =?us-ascii?Q?PZ+PGUBugrZPGjfpBjE/uMOVYk2fE8ntvD7i7qnAULPyMEjG6H4iplWvNLW8?=
 =?us-ascii?Q?Druvyt6gf0WrMUvq6cVCoEUe4as4TcyKi1/QzsuMszNWpf2wioAKNIvKrIKJ?=
 =?us-ascii?Q?HXxpi2nhovFmsXjL/vPMOQq/HtVRL0kofoNJxT55jthAmlv9N959POzDkzdT?=
 =?us-ascii?Q?IA1+FkK9Fw/v1PdKhqcLeML/VfcG761wESBtcGOEctyrBxonjQiEwWlf3m4I?=
 =?us-ascii?Q?1q+t6YKFkGHqYRnw78Oiy9trBfuyUZL1Y69NGOxOLbvE5WgUzn/q79bd7G2p?=
 =?us-ascii?Q?lmf/YeOL+lFXtW/k76AduNxU0+qBCpi5Ub0G7IlmTwmhyHaqg38I5oW+Nw/6?=
 =?us-ascii?Q?NAXQ5YhB9eRo1nxpi6Z/21ITa9F0OZDSSznMoxHAjHMWyr8ukyzDodIr88Mh?=
 =?us-ascii?Q?tLaL0+zEdhyShQN/a0BkJUo8tYXaCtKxkgRtQw/Xpgm/rU2v7q1fWzwmI288?=
 =?us-ascii?Q?3Z87uG8HQUp/DnZSOsZc0kSvSyylVx4sE8ZtpbDrz6TuYY60R6lH8a8BFKzV?=
 =?us-ascii?Q?Jg6t59oxV24DcsLwVY8/UfzbZ8FVuW80KnaOblo+kr9hBKlgyOl56ZCTA7ic?=
 =?us-ascii?Q?+dnFzNH3TiG6UB0ZLDf/ykZWxdXi1jW9vhvl1eM3kmSKpN9oguhZ7TP2iLza?=
 =?us-ascii?Q?Rwub3kGhf3mE+N6wFLLz2fh3xvkuNlRqwXAZN1QAmubC6Zz7M8IbWgaR1Qs6?=
 =?us-ascii?Q?oVFgAOY9Ek8muqHVJpnsRzY0+bmjPmHe53aHm+Ag5EjYxfnHIHXFmyjzo17X?=
 =?us-ascii?Q?ZMtE5IIvq5RLoERwrEct6fM2NddxN3cGYbg+CR33ilcNptAJgogK6OQ28Rca?=
 =?us-ascii?Q?1RW8LIhQLZaYy0JZOV2j0hFGApRlOud4J9dSaiV2MbuMnEme60D7zCBalnLV?=
 =?us-ascii?Q?MBiOm7dTXF5iYxxIPIRuBxzseThqUy++asShN6gRxgO3lsCPwnp/kA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.6019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85f6908-638f-4b08-08d8-08dd7beef880
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5335

From: Guomin Chen <Guomin.Chen@cixtech.com>

Add a dt-binding for the Cixtech Mailbox Controller.

Reviewed-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
---
Changes for v3:
- Replace the direction attribute of the mailbox with the strings "rx" and "tx"

 .../bindings/mailbox/cix,sky1-mbox.yaml       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
new file mode 100644
index 000000000000..216186f7cc4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/cix,sky1-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cixtech mailbox controller
+
+maintainers:
+  - Guomin Chen <Guomin.Chen@cixtech.com>
+
+description:
+  The Cixtech mailbox controller, used in the Cixtech Sky1 SoC,
+  is used for message transmission between multiple processors
+  within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
+  and others
+
+  Each Cixtech mailbox controller is unidirectional, so they are
+  typically used in pairs-one for receiving and one for transmitting.
+
+  Each Cixtech mailbox supports 11 channels with different transmission modes
+    channel 0-7 - Fast channel with 32bit transmit register and IRQ support
+    channel 8   - Doorbell mode,using the mailbox as an interrupt-generating
+                   mechanism.
+    channel 9   - Fifo based channel with 32*32bit depth fifo and IRQ support
+    channel 10  - Reg based channel with 32*32bit transmit register and
+                   Doorbell+transmit acknowledgment IRQ support
+
+properties:
+  compatible:
+    const: cix,sky1-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+  cix,mbox-dir:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Direction of the mailbox relative to the AP
+    enum: [tx, rx]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - cix,mbox-dir
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mbox_ap2pm: mailbox@30000000 {
+            compatible = "cix,sky1-mbox";
+            reg = <0 0x30000000 0 0x10000>;
+            interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <1>;
+            cix,mbox-dir = "tx";
+        };
+    };
-- 
2.25.1

