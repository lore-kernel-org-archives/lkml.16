Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E58274FF9;
	Tue,  6 May 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522481; cv=fail; b=ndkYpTqY+3WcZbdZ2NqhsQSnkbF/Yrc6Mr173sQeW6DWlyE3xgmwyxAK6ELT8DLZMOi6zudINqKy7QoCVSICiEq2gnH0cYwSAncnCBHv4Wmu3CML3Axq+VluNw0cpeyreuiGNdivuA/1zFIplJVMuf75fMBoNJnjxJfhkbBU9CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522481; c=relaxed/simple;
	bh=UKsmwzZe26YEwRW0MepEcATvSDXCq77/xB1KZNvKQco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8VTNLxJsnuya21wbdzek7lNzC5ttWC7aU8buzd7B4I1HMx3JGsxVyKAXF6m6L+4KnWcdKbXscMLfl2cADqUE3KO5LgIrjYiyeZMBpfBpdlyyquPx8budQekpLbojZEvfVguMoKe14Rf9xHYC+hsDTi0LKIRsHGTR2e1pMwFK6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKT/qx6LC3Y8wObMsv+KS8473l13P+CiWkmX4RLMrAmTvtzn+pfGaHAMLnj4yEOODlGLhD3ZlMIpPns6nIZmP+nfUxyd/Jzt1h7t39qztrumzAgyabX4CB9hoh7oKvDIXCaYmbF5KLAX5a9Qhe2SEflndQB26DC1WugYVQ2AZbUOaMU7x+p7b97NsaeflxfmZe63MGGlm74w7COWWi6XOI3ugipaYVHyz5E9fnUotRltUG/cKSKwAOY3lCjCcuAhbrgSDX1djeL8WXBQ95Ipgz/2syniQF72Bx/hwAZjR/Ik9//LtR9Z3nBJ9tW85qlXPA8XBxJBdisF759t1Fd9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkp6gQi94U/2WPGbuHu4BvuDRcR+scHugkw+FjX9z/o=;
 b=sGmzH+gsPf5SQHSMbxznPapPhxB/KbwPf/cdC3QWBXTMgG3CEfNXEU3xzY+g/wO5qBkq3b0tezJHGTreNFIU28BqnpJ14Jmkz5ogTefQI0eKnW2IfdcHre2P9Z4uGkxqpoQeR+PKIpSwiZ5PgesCp46s2Hg9wOTHyeopTyjg5TcvGQLw0uORUJgg26oYbxrn/i45byNeY9a2FngMQ/BvW+a1fDw0vItKx9juFOMwsZb46T3UUsTRIblDtpkMUBpT75BHiFXxHUjNZScELvW8FsuEMC1Veq+bHorm042XSM+TdQolN1v4ninrJSTWqZQHPaavJ47oXXLNN4Utv2UTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::31) by SEZPR06MB6717.apcprd06.prod.outlook.com
 (2603:1096:101:17b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 09:07:54 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::dd) by PS2PR01CA0067.outlook.office365.com
 (2603:1096:300:57::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.43 via Frontend Transport; Tue,
 6 May 2025 09:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:53 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 704004160CA6;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: [PATCH v7 4/9] dt-bindings: mailbox: add cix,sky1-mbox
Date: Tue,  6 May 2025 17:07:47 +0800
Message-Id: <20250506090752.3695666-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEZPR06MB6717:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: abdd0196-6dc6-434c-aee0-08dd8c7d7c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Do5c3fUWuUZqA9z9ZsjC4Tn9fqEZ7jriTiK67x0heEu9auCNxe8gT7MW+Pe+?=
 =?us-ascii?Q?CQ76DgNspC1BteXBUKgrQ5NO76HSEhIcR2BEn/I5yecr/M2v8dLz2Uh9DFB9?=
 =?us-ascii?Q?Z5Xh2Bo/MZeRwD02b7H6JHOz3dTmg6Vz8NTynq7bCq1d/gGQUqESYfB/bWmu?=
 =?us-ascii?Q?tRlPDumVuePQSVUlJ3/LZhOZknWJhfyT+8+6gYjT51Ms4SrULpPiEiXCAh7d?=
 =?us-ascii?Q?+ljoGY/5PQuMYLct2tA/u0I2azTahjv4QnE1QwVD/HUpQcdWKuhdWOSemCxp?=
 =?us-ascii?Q?0HdNb5Uc3dQjPdkC8l5ys6A44mXp8Aeb9B3+tJGRQGUh9RvamPXBy7O+g8bP?=
 =?us-ascii?Q?yi4yLoJ6+gHXfXtI1onmlWOWKQ1I8iDd/4lugqdt59rL7TKFzCkOkKUNphyQ?=
 =?us-ascii?Q?VVacZb3AqzHWuj8TuOgRJhryCR+aC/GZVgw0mQBvX5UR5S53apQwaAsWNmPo?=
 =?us-ascii?Q?optGZoL5quGLKyqJ44zMUuBJql3oML/FAOo1KI/9MDa+Gz71jQ7e90V3ogPd?=
 =?us-ascii?Q?/EH2DX4mRF79XUwnzkTYaDWbnCJCTYWLoriMMuOhAuRVP+xKXwgzRd0b6mX4?=
 =?us-ascii?Q?rIX7jxJhSsu12747U+hKe5r22rZ7IgrxEmy5OHtX3CsKqqp/ZE4V1q9QZwAx?=
 =?us-ascii?Q?eqDylXuAPFlyjKCR19yZBtz9r2tLZx6Lmg9ADQlq9EB0K9BXjd/XUx9Gf+w9?=
 =?us-ascii?Q?FzuYYmpvuD97mZRpyG3Z//2NT1NAza1NZgDkkNZThN3SerjELO/HiWrcXXba?=
 =?us-ascii?Q?Uim2Owa08jce0y0nWIwH/VPYGxBgTLrHfB+ywUh/+hwxaRKFUM+V3WBqQgXu?=
 =?us-ascii?Q?iR0Hhz8iALeIm9Th0X6vugmirlOIEBVStrCE1/xMe1tPgF5rdG12bz9vhHZd?=
 =?us-ascii?Q?5weJBZUREkaumUpbq6jGXrPRZIlzFzCeHBM/a1UQuFbmvSiWG7J7PcWTrFpS?=
 =?us-ascii?Q?Qj0eWfsygH5tnDrnfYZQWzrQjN9vuxR1g/rUpTuNQ6M1fzg376MwHN5Bcjpw?=
 =?us-ascii?Q?xJ5AbYmL3rwKSR8JmDj9ktm2C6P0XWlGQOrTOlnW6aImfSK1ZDUWQ+isrjLP?=
 =?us-ascii?Q?K4WagKVwQrFGa1T/sOxpoS/1bN5CcsUasMajk+L1WWgYqQKi7WLfpRXLVsNL?=
 =?us-ascii?Q?YRUPHidd4+D8uHzTptUZJ2q9CqI2SIQ7S7+90c9PCUcAXAX3BgFSbY8DbDFA?=
 =?us-ascii?Q?FIzdW+pD/y8FPqdKxJ5RTaU1Kh4+Y84fFpcCEOtVUPt60FGpA22sdgC3chWm?=
 =?us-ascii?Q?dddOXmX1K8Qta6gyYfhLX0z21yzeLMd043Uyp3P3q586T+iRHnpFc2+nuWOg?=
 =?us-ascii?Q?3eXbA4fMAFMFaLMSokxkll9OyP3sCLmJR72rnXMh606e/azsKICwcItYB/Wv?=
 =?us-ascii?Q?yL1Z77I/2AKtyFERIOVBoUFbJgxS/7HaU/e0eiB4WgJW7TlLgFfE8e+3F+pc?=
 =?us-ascii?Q?TaQ1QPKzUDPht6UiHkwTXOoWJD1KbWljRHDeHz9CavyTQQB6zqoBpntRbLiK?=
 =?us-ascii?Q?GoA9r4CKI9iozE0=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:53.4266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abdd0196-6dc6-434c-aee0-08dd8c7d7c10
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6717

From: Guomin Chen <Guomin.Chen@cixtech.com>

Add a dt-binding for the Cixtech Mailbox Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v7:
- Add Krzysztof Kozlowski Reviewed-by tag
- Add my Sob tag

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

