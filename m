Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693392C032B;
	Tue, 17 Jun 2025 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155781; cv=fail; b=HVY9dQRFbQN5etwBnylTux6ssiCnb1C/W8ugC2NPK/iuBzG7BxZzap8KK3xS7jwLb0HhdNUYy7SpP8TfM1ZupWpLDDjjz2rlPePD+4FkOoxHF/nDGbHio036SftOAVf1Xml5WW/dkOSoiCCGL2FBIBrJSSZDyeiT13+H3AA9hXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155781; c=relaxed/simple;
	bh=ZF4AgS9ejSi10215PfL1J6HdCrl3RpTwslAil2lFa04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gle5c7nWBY6ToBM9XUQv41lyb74zxJGjtfNMQNsUHdMcEi6Sjl7EJCXLdQOYGCOTzoOvowH4RTdSEmKZijSW6idX8zsO/7WYLCeaytVCV8W3lFyMRhATujTS6cJ39wqwwdSREab9njwIomo/AVvAZ5wZF8qiWMjk/YKptRbZE3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QWUba5VU; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QWUba5VU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtOJftFh95q/G85mt5f0LOLvXkJttUjO6EIp4eMnIbVq1ncVVDKpKUb6zqG94vWBDkUm1YnRU1MlWwYn16RticP2KNvou7b3u29sipsDS/RVCYAFzzcTIrU3Judnpgb4WOpxUQSB4NEtMgNvd5wOAZj9W3O00j3wdfSUk2Sv5wMlJ8vZ0Of2O5dYxR7MF0odCa/N8pJHPrRvbvfVNhyz1oZKqU6sdfCve5ztTOZHjoq3XPoXC9LhDg8DPNdXFsHXqOYPKEnFbCt33L0DMMqyYWCLJuwTEQeiaaHZPks+OAGSlX/yFSqRaj+kKoksv9WSLM1dUilnDhOEZ1DJKjoTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4zoeRUrJ0IJB4qGhDJKxzEJI4iy/c3jRm1x8PXfn3k=;
 b=zWQhl2BJn3jN4m1Yk4eHSv/uwppVjEXutfVth9Jd3jSY0CHTcoP+a2MpgUB5z6vMTrVdy2N2hBl9WaQlYUdTJ67S4Od6oVEXQCm32sG70BfIVFiQkYPOYAPzUKia2x6Wak5oC1Js6YrNE+EtFOKnmoWzuH7/eynHGgPOIViLfGIkORostU8+2C+76Ow6yOTGf/1qt9jFsuLhdS+J/fu1oV887n2JiU9Di4tHNeRIsdWhLAsm4OgCq4J48k01RLNyeeZSaNsoutdxwWCBZkUlxt6KfkC0Lyp0DfpGTqq5u5legDsYoRh8tQKH9d/TYVemo/VViGhOgzd7p16lhxXcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4zoeRUrJ0IJB4qGhDJKxzEJI4iy/c3jRm1x8PXfn3k=;
 b=QWUba5VUIE6k4xVloGti0F908wNhq90d/u7A7aM/9CUjRQrjIHlZqCew/3GKrwQNJhC4/8EEQ1EAF7B0ddiB8z0czZGxxabziEL4VBDFCEES/COFZDxrxI9ISzyiU2kCLhnbL9Nmx9hPiFOYqQxp94bwJ5Ed8igyGK1iFJGjfgVkwNdvS59XvaSDgQPxlel6G4oMeZek900/KtNpGl4owbh45u3IAshm1F8viyQfD/FvUnOOzUAihHhqtYG5uKjMXm8ziCEqIVSU2Gx41re+l2b6m1rS7EXc0LIHAZ8qOA3tM/FJ6igtNoCJybqyw4qQWQZOfkG8zVIVGLCoChs6eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VI0PR04MB10140.eurprd04.prod.outlook.com (2603:10a6:800:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:22:56 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:22:56 +0000
From: Joy Zou <joy.zou@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com,
	ye.li@nxp.com,
	ping.bai@nxp.com,
	aisheng.dong@nxp.com
Subject: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator yaml
Date: Tue, 17 Jun 2025 18:20:24 +0800
Message-Id: <20250617102025.3455544-2-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250617102025.3455544-1-joy.zou@nxp.com>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|VI0PR04MB10140:EE_
X-MS-Office365-Filtering-Correlation-Id: 421cc5a5-a49c-4fe6-c314-08ddad88ed2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/EwQS8kfIwI/bC8ra2kxrUpTpdT+91qbG7FFaHA9mYA/Y82655sP9n5VztDx?=
 =?us-ascii?Q?iIThrEi/jTsBLVM5kt6URijqxsM9eJh8ZBLO+8sdvsHEyZk2CoIkCc8HwnNC?=
 =?us-ascii?Q?J6ydD1WqFxShpgpeZ7DJZKTHihWm3ewQ4qpgLcJ7gfZ9fMq10iXw8P/pOXUP?=
 =?us-ascii?Q?F0cBjj7wA2Sv4/Cd59vYQrtNKtQa9+Y+doUqbPHsBzMSzH3wjjIZac1+Wzbh?=
 =?us-ascii?Q?CUxWtVUu5piiuu+nY24L+Ck6vW2TM8jSX2kw11AKf9gZ6mWziS20C5YWJI9v?=
 =?us-ascii?Q?B9ozX+SOC3ZycSqtLLFnUo3CoOq9PPdeRzJ1aJLmmbtV/cmMS9fvlHVfaiAT?=
 =?us-ascii?Q?0HLMZOEvUDKQzWKQ5mRzSH9W1Z/iRPnyo698MP6enUHZa5hvh1VSaLPVeypd?=
 =?us-ascii?Q?zVgEXJALmevOgDU2TJWsToDdyDAQU7hq6Ra/qiUK8XLsU3ihH435mP0imBsl?=
 =?us-ascii?Q?MiWSOHeMkKoXsMfBMhzE+kHv+wbMDxfLvf0AYvPqIhhDnqWDQm2E9CqXZ9sX?=
 =?us-ascii?Q?oExh0q22387EaujwM6Tv8Cx/tRSOHLNRoIxSWu6nc86SmnMh8d53xk+lFblb?=
 =?us-ascii?Q?mTjUvKf5MN0h6w0xmSOE7j1qXrCHgJXZcKMuI7mILMYerkw9DmuqEJpIv1Yw?=
 =?us-ascii?Q?LmA/hTm2WGkGslK4Pfck/6EBTns4cauOcR8uxkiHNgre4DTSj06DHepiESBl?=
 =?us-ascii?Q?3UA1P5s+k7Z9QvtGfwZyPVJ3/1Ski+PK2RfCP6Z2r5JSTfba6Wi3uU/x3fAP?=
 =?us-ascii?Q?lJ1xdxxA+h6jrlw9yvy6g5odWUiNLOhH14JpOVhTFIB09OnIl/53xX1D1AYx?=
 =?us-ascii?Q?9OfOuvsadGL5/Bv7gKolPCofkbSDS+yo17QvAQgdckjbs5CL8LARa0Wa9QfW?=
 =?us-ascii?Q?Xi7G/GuW5d2OwxYDFr0ikerNImfpQYYedt02+UWWQXgNj0Kfh23ZYK6qVxH3?=
 =?us-ascii?Q?g473QsFYAE84OHhbHqOKTnUnPbzmCJi0zoOOn8k2aeDUpykilQmJnfBmaoYc?=
 =?us-ascii?Q?JnbR2qi7L6+nJ6Y0Nkae9MqTmIjWO88oZUGv5AhC+eV9DTpvId2ke659df/D?=
 =?us-ascii?Q?D05RsgtTzcyPZUVhVBLLl+0ylBICn6myXUuS6Gsyc/mKXe8gs2UePv9wb3ld?=
 =?us-ascii?Q?qkIISexsgsCGE5vy7Nrk/8rQj9n5HKAMshQ6gGVA6NXmC3opH2znab3K9SNl?=
 =?us-ascii?Q?+nfel6yxy3q5BAlhywMU7mc1YQNks+yrIkEvxHSkWthJ+MIvX9ELs2F+nfg0?=
 =?us-ascii?Q?JyuEPXV0wNzW/FEEvgFjrMdovVfDQnVIFoJ7X9f8VA8qQc7+ZCIua9CUCLHh?=
 =?us-ascii?Q?rPEoz6KgrxQ3+ZTLc3dbqv3nLnM7TA37a4oDwmaxO2klysCUWhZZA4nmxDrB?=
 =?us-ascii?Q?CyylZPdtM+uOOcUlVlDlETyYvQgsTTBTPElSdz3Iy5HOGTtRrsumYKiTlkUo?=
 =?us-ascii?Q?1N0cD74oqYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zq1etcN2zJAR9wN7I+FZrlhA3hR9u/e4L+8EfZtYr5kkiuvYkS8otRKKbbDE?=
 =?us-ascii?Q?16c4QdKoiX9Rpn9GfABfqmzx6sH8pP4+wXNEGNvjxkUFDu9WrjauvjO7ounB?=
 =?us-ascii?Q?96k3D9hblY8BhRpC6UPNF2mvo4Fyl77XqCiTs1u1uuPmWDqmXiLViYR2pOBC?=
 =?us-ascii?Q?iGE/9SBqg7h2Cl29P5Z66yf9PFNDh/yqh0mq2Zifd0h0l8PdJ/OnXZA87gLC?=
 =?us-ascii?Q?9VtJ8IPAMkVPkj4zAULnJkUTgyLHnvWpdLLV2XLEOj58kOnuLDTgz1BCxKsj?=
 =?us-ascii?Q?Xrot9AQgtzp3RwTfWuAwHeNzFFOJqCLN+Xy2n0mxJG4eHWV+7syP2TDcCICv?=
 =?us-ascii?Q?5cOsZ7kWRgfiWY+j9hxb2EmIf1RtixtpvPt66UBf4AlSYCI0HRd+/EFXTnf1?=
 =?us-ascii?Q?U/J7tiCdwjH1OJMpDkMWuMa2xlSYwxAqpa0gY1GFnp/7cE+lXcD6on8w9ATo?=
 =?us-ascii?Q?X6bwgq05CCeKns0GGeHK4YadlSzrPaJexrL2hlc1f3Z8anHltsCjLH3pWbtq?=
 =?us-ascii?Q?A3bDBNPil1SukueqtKALVZWprHHTvaTOWBCa9gOMQPNgBSLL68ztmVywCXVa?=
 =?us-ascii?Q?4npOcPoVsDG18Ds2iRPLx/bOTsUZrqA97X/uJDfl52BYXn1heuyxucOam3NX?=
 =?us-ascii?Q?MzL8JBC8xC50wau2fA7YUX9suOJkY72ECNeDChG5gRI0kOxKEu6JSDFta9aK?=
 =?us-ascii?Q?E3Q4KSuMOD/8ezQ/piMduaO7hdX+iYWgruN1jawOUHlFhMXS/Vcnq+iX48zd?=
 =?us-ascii?Q?ii6Vpy0sVNrFbqijKN4WhBi+yolP6yZX9tQREodBMbqgXUUjQwc5D5dyiNoe?=
 =?us-ascii?Q?HMH5gFG22eF9723uSVL1CguVwtFdmSvZTwz6GfOI5xDE29RDcSFJg3asPxgI?=
 =?us-ascii?Q?YhCWcsbXyD9l6DR2RO0O5iFZZ9FJuppDaNleSav4BpjA2lDySweq8me3ekRc?=
 =?us-ascii?Q?Lcpruj91iPbwtcqcYYC3E2XteSMVSmu54knO1RmiLfUqa4vK9ofB5DNuHgHH?=
 =?us-ascii?Q?ywXGGDEPenvypfZyJM8T+rWuuZ5kalcT7R/tjhnL0SdhDkC4rzvv1FNEYASf?=
 =?us-ascii?Q?2yTs0/nlQQPoPdRnP03V9qtYFOMdIkL5zo7/4o0KkadC1+nPoXix1YrHfEC4?=
 =?us-ascii?Q?+zKaBTFwboXNQOpFPm8GjTc40Od8vYLimCcw3auoBtx0bBJ9atDetSne/msg?=
 =?us-ascii?Q?mXsVyhwwjHkb9+VDWkB7dHN0il+CvwhVMevqGilMKUzLrKFHdEcCctVMySwc?=
 =?us-ascii?Q?BcJ2shLmPIjEE0bFRzSnetnLkXkduO9AWnpUsx4ayZ6/rZMQQmGk9GXb6X8/?=
 =?us-ascii?Q?FGDUW2nCWj2usmIjgDgDzKeehbwJeqRwQ17/C6mxPmXZ6oA43k7UjmN5ZKMd?=
 =?us-ascii?Q?zenef5XBwtOWizrshgKmoJ05c7ufzkvEFWxIKqXViM0sZNLENzXTNIyrpgdJ?=
 =?us-ascii?Q?UyQnCYrTUz4DpBa4R/o+CjTi/poP2zoy6u7Kyw4RbI9DpgqSLTqZjskgqh0P?=
 =?us-ascii?Q?DmsarMjEoHzGA+tMBtWsm0cKkieqPozm11x0Bb2RtuhQKxapnVCQUPWfT04I?=
 =?us-ascii?Q?sQCukVNdWsXqv35hYRY4aIPEBTEmwVghZR6RgAT7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421cc5a5-a49c-4fe6-c314-08ddad88ed2a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:22:56.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJGoXu/qTHnMsb4SAmO2vtnVFnv8tbX5FMmfHiw4629K8hFDYSeZ1bOisL7nzNiB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10140

Add device binding doc for PF0900 PMIC driver.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 .../regulator/nxp,pf0900-regulator.yaml       | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
new file mode 100644
index 000000000000..32e2ded92e2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/nxp,pf0900-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PF0900 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Joy Zou <joy.zou@nxp.com>
+
+description:
+  The PF0900 is a power management integrated circuit (PMIC) optimized
+  for high performance i.MX9x based applications. It features five high
+  efficiency buck converters, three linear and one vaon regulators. It
+  provides low quiescent current in Standby and low power off Modes.
+
+properties:
+  compatible:
+    enum:
+      - nxp,pf0900
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    properties:
+      "VAON":
+       type: object
+       $ref: regulator.yaml#
+
+       unevaluatedProperties: false
+
+    patternProperties:
+      "^LDO[1-3]$":
+        type: object
+        $ref: regulator.yaml#
+        description:
+          Properties for single LDO regulator.
+
+        unevaluatedProperties: false
+
+      "^SW[1-5]$":
+        type: object
+        $ref: regulator.yaml#
+        description:
+          Properties for single SW regulator.
+
+        properties:
+          nxp,dvs-run-microvolt:
+            minimum: 300000
+            maximum: 1350000
+            description:
+              PMIC default "RUN" state voltage in uV. SW1~5 have such
+              dvs(dynamic voltage scaling) property.
+
+          nxp,dvs-standby-microvolt:
+            minimum: 300000
+            maximum: 1350000
+            description:
+              PMIC default "STANDBY" state voltage in uV. SW1~5 have such
+              dvs(dynamic voltage scaling) property.
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+  nxp,i2c-crc-enable:
+    type: boolean
+    description: If the PMIC OTP_I2C_CRC_EN is enable, you need to add this property.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@8 {
+            compatible = "nxp,pf0900";
+            reg = <0x08>;
+            interrupt-parent = <&pcal6524>;
+            interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
+            nxp,i2c-crc-enable;
+
+            regulators {
+                VAON {
+                    regulator-name = "VAON";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                SW1 {
+                    regulator-name = "SW1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1950>;
+                };
+
+                SW2 {
+                    regulator-name = "SW2";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1950>;
+                };
+
+                SW3 {
+                    regulator-name = "SW3";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1950>;
+                };
+
+                SW4 {
+                    regulator-name = "SW4";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1950>;
+                };
+
+                SW5 {
+                    regulator-name = "SW5";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                    regulator-ramp-delay = <1950>;
+                };
+
+                LDO1 {
+                    regulator-name = "LDO1";
+                    regulator-min-microvolt = <750000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                LDO2 {
+                    regulator-name = "LDO2";
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                LDO3 {
+                    regulator-name = "LDO3";
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+            };
+        };
+     };
-- 
2.37.1

