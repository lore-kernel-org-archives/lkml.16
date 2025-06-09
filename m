Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022123.outbound.protection.outlook.com [52.101.126.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D157494;
	Mon,  9 Jun 2025 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438997; cv=fail; b=C7WnZRn3ljBq55ZdKka5c6mhyaWehcfXHSQu4AY8RibnQxTaAgKDW6nROBLuHoTzyf79KceWQlKiEdxfUiB1CFnFKIl1Bl2dsCn8ucH21ulC/GF+mc7VRPt8ISa0ivkroQUvtXfBDH1mX9xNslsE54rx9CoQfgaxAzg1qemR7nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438997; c=relaxed/simple;
	bh=UKsmwzZe26YEwRW0MepEcATvSDXCq77/xB1KZNvKQco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQB5kiEjsgsCQuR+YWepoD9qgvhuOq42iEt6LZfGJJ1GPxZG2fqlmn0kVEeEX8okVTswKO61dpCp8AkdISckQgZ6K1iNy18SCxJBzsWEXQwobtZ1+9gUy28V7u1+dSAB7OYGK6zlkJFN9bQwq9xciP71Qxo+EmUlHOoz8VyMMlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5r7a0lzNao6zVtrMGyTWRhzpcRQq514Ui2VQYaQJUbgAfj0fJxciiDShWhsBkUzDDlF9xq8w9xzBRiUFniC136pV41MYRKWIYgIFJDPy9zlCxVWI+X8YikR9r5qavtDbcIJY4D1yedmNBn2uR69nVDU6ANjj4oL5wxcwGvFFFjfj7dNhS/AVs7NhPgqHFJJjQhmy7M/nwdKllD7mqzvFyRTc3UknvMZ0uoLCXlflw4NS4QPDTJWfFmuVQ1bs8pULmxG2o1rJa8OJ/gmWsspgauerP3LEYu8q8FQCI9OPq5aua4LKmTuy87N81W7F7wyAiiIuHSztQCmA+FSpfHiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qkp6gQi94U/2WPGbuHu4BvuDRcR+scHugkw+FjX9z/o=;
 b=s5BGGGaYDF30K2A7AZsPolU53kJgqwOUsoRmsqSxUfhgDUL3OA6ZaHvfFZz5vUvGVO0e/rziuxiMvAF85/cAAQSAFeaCNFifDvT4Md3L58JX9QL6OwF4UjVE1kNhI36taSGAbKkFTfOoYhrFe/AawkeUts+pG5FLzVEevf7xSEQ4kfSGQRCQBLk5wA7gfWXkvu+F/pV1D7I22JDQZD00xuJOmUbPZSdxYUCY0IlgTrfCCFwtnMlq+gfh/gGUuN7y0OE0QT6DfMfN6p7Bl/CucbgJXBTT1WIA5IQ64PlAPkZ7YqnTI+2vFYTLb/5LdixtFxWacLHTKHlpbDzRZieP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405:26e::18)
 by TYZPR06MB7189.apcprd06.prod.outlook.com (2603:1096:405:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:405:26e:cafe::b6) by TY4PR01CA0010.outlook.office365.com
 (2603:1096:405:26e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B14784160CA7;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
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
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: [PATCH v9 4/9] dt-bindings: mailbox: add cix,sky1-mbox
Date: Mon,  9 Jun 2025 11:16:22 +0800
Message-Id: <20250609031627.1605851-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|TYZPR06MB7189:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4ee392c-dd16-4b11-b5bf-08dda7040696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DURs9A8gCnsSZQZlKb41So4b5L72kv94XbKxSlB7WjIwWQX3hDmRIAfB8naz?=
 =?us-ascii?Q?+QSwKfTbAUmIx6kjruEyeVLSM9KBDkiUVR06JrzSP6rzNMmNDk+tisSltLgl?=
 =?us-ascii?Q?09H3p496b+TjoeBmWDfHonLSEOjIfwKp9t6nubcQiquPyAy15Mfj1NxetgSH?=
 =?us-ascii?Q?NNXrNMZJlvIE7Q3HVT1r2P+iwJlsYIXKcKz6I64pYyJTq1WmnQS/Vmv9N+f6?=
 =?us-ascii?Q?t2Jt2poBar1my6uXuKTR9ENvmVw5CGwDYA/qE9c0W7Wurbb29THij3KsTki8?=
 =?us-ascii?Q?qoPHC+zA4mpE7DeiqDdpRDIgCh+fx1OU4+DVd+XBdxJEmcgdhAvk5iN56ahR?=
 =?us-ascii?Q?kXks9vd9IUUebI+R0dIJX6x1sjo4MW4P06Jc/qRFuETINTfmM5XRjgOMNXWQ?=
 =?us-ascii?Q?50aKjYoE8gO7Bgyhu3IhTPJUCK2QAtQrWtec9qzFFAEUpPTC4FTg9FU9jPjl?=
 =?us-ascii?Q?Nv41Dymx1mU4XhfXKd8qd6dNWHA9H/Gf9LohhPrGGhWFxAhnJch971m8zYzb?=
 =?us-ascii?Q?7sTfXcMTC2KtrKabl0OqIltLFXTu7c6WYdLACMsvH0xlFRTihFIQGDru7rHN?=
 =?us-ascii?Q?Egj36KeW0+vnx+NrOdgepSvfSrC3cwCnMWVAoGY24vx41HO8g9njWRlU1HQx?=
 =?us-ascii?Q?9K/5yQtohrlv7XYXzQS5zVG2/ShdaWABBdLAAjRe6bU9YobjAfA6TFtb5Klh?=
 =?us-ascii?Q?UyAIssy9bPL29nGyfmSsYhORyN2bJb73EypajcGzZkmKTcLLowWBHaSNJSSi?=
 =?us-ascii?Q?5UtKzngrDMCY/EO1nLJTGsyzabOYj8TXMNGoNsEIST4trIOvH3xl4cU6IJ+K?=
 =?us-ascii?Q?67/bOWtng2raaGcYTx5w28YPdjrJOpAfwP1I7WAf22HIYO3cINrqGxtsTWi/?=
 =?us-ascii?Q?29TFIiNsph/EtboAmf7I2YZwHd/3RIUDiWlM4OzqBJRqhdDou9c/68UTUcht?=
 =?us-ascii?Q?4ItB88gOSM40nJyT2mRXKsC02PkhslowS2GZhGz9WVEpVM3oBKfnAnmriDrM?=
 =?us-ascii?Q?F8G6pvM1Pdjwde1FPRW9ivLAghzy4vFTTB19eAF7CACaVtFdYC5fnbKltBSK?=
 =?us-ascii?Q?a0o4cuLtdckKy7I5XGAZbTe7L1lC5wfsXoq847Lhzpy1A+1wVWdZMTF42R4E?=
 =?us-ascii?Q?ciTp7JyVz8AKVKDgtaRvbQ8VS459cAPfewkmFHyCWqLqi9F5QPitHTIkHO8/?=
 =?us-ascii?Q?XWOAM8y24GZt6RK6lKLt6J/5jL+pGsS4K1TZu3uwYhMjdqNlA2RvvO5zzQ/c?=
 =?us-ascii?Q?4H1ICQ2naNMrc70eAqvdHLUpfTxz2qWVzZqv4cEOXEl38ml3bRI+/beO8MVt?=
 =?us-ascii?Q?vGCR+T9cqwzgHyYyFQt+7lcYFVAA1kWAHc0GDfOMjGB8hCigukhauHq/MRuC?=
 =?us-ascii?Q?gweqx1BEs3GaaApVV6kgBSjI+XvbvxpafhJABSGKl5HS8IfeFWdiUOlPJPYn?=
 =?us-ascii?Q?bc72V8SVZ2RZniFNx8vCO/v2RwZSg6jV8MezbXA9da2L40WG5vKNpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.6352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ee392c-dd16-4b11-b5bf-08dda7040696
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7189

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

