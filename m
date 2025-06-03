Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012032.outbound.protection.outlook.com [52.101.71.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAF23BF9F;
	Tue,  3 Jun 2025 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964532; cv=fail; b=fw7t4aJKlCFcHcra+b9aX8FVY5wyHz2YnYZWtpLAaDqZXEwKY5GPHf37qUjfR8q+mesvELXGThcE6VpK8i8yb7LPvIFpoFmb7a5K1EHiOmn9PVJpZTtm6vT6vgStWytr2ewS3BYfVC2KW1miKJU/dtc62bRiDC/NLh4/yLi98SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964532; c=relaxed/simple;
	bh=AtC3+2MDLn+c0VgshaSflzTLTgWXLh6HTFkTaUa/TvA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Gr6KpIzx76zZU3p4YSl4bU2JHlDqaeEJ27dXKVC48YjLtqfkOG2lzZ4T8WhJ0KM0t2WV5C+1JEJtLmY139B1gHHe4c7G/dHDuuEL6wxncTqj1ZdHZ2IiIpy4S5ujVynHkKAYJ8+pSvKDgHcg3AI2JfwbnRyREWjA9FAqHTV5XxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PswZGTXN; arc=fail smtp.client-ip=52.101.71.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PswZGTXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw+JMx0dTSp+lQnQKpi2TqSJXNPnzJWo6A1p9rgxxUhH82GHGPo1dm2rBPPMJL5YY4azLlmDxvQ0gUOme2G1UDx+PIVCLQ+aKyqK2ZCeZ31rI4XC3t1WBhqP5YLVYtiG7NCHvG4vYUTLgz3dRKiEktUeFTcAKTHnMEoiJ9eX/AIrmD3ICNjCUqG4wPw81v3TU+55cdabuekuFks2p1zRh8bgqhVwvtXwr8BFrrTxFQJ5QMFqD68Wxxn1SmeC9YyRdNbjAyvgTcZTWaA9w8gHaZZA58DFdLEUdz6T2hLuUhBR2BAAGDtekOrSvHkC14GH1ynDURc98HmaXrynYziaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g2PBcxBI1/KGeKXbhMQqb1RVHvyrLkQSBqam9BuBR0=;
 b=Fi3hcvH/9Q+fttq89qwJ3kK1vtrjccpOp3Ibh7CZE6iJ6cbs+EvrnoS8V2dytB9O2lmoRN5vp1rT+kbK/A42w8UXa4caC2saVFKFWM0v3vZd6gGsfzG53KGyBq8A/T9xyEiq26t5r4nEoCSnlGBQM4I1oSsSZzblm9QwGelLwyuhL4q2ugkNWf5HcPw7Ukd2nF1+eZ1JqBfClkpLnWg6k/9+l4J88K4GyJrSxDLEL5H4yg8Y6WyUAM4bvJryscb0uKvn41vmMdTJj6mD7rKAPncE27fwucqtBk6hFVIGxuXYpZn8Bvxm2EmPmBRNnR1wm4Bo9rkZAS2XvwcHF6EzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g2PBcxBI1/KGeKXbhMQqb1RVHvyrLkQSBqam9BuBR0=;
 b=PswZGTXNFQJrOMS5uH8CTp2Gpk2pWfzxnYwkYH2D0tffx8BWDZaGrx6DAjwbgaN5aTsS+YdycsfF1KNzTw7AfzhIRdJcwwtcPKtPApwkHx9bAO73ewASHkTBd5PvK/qIg45f/1IIcA8lmBb0NNLh0hJufy7czEaJOILE4UaDgQ7wBRPLNZU4CqKYaOkI9GAbwqjCEcaCnNClNiaxedJHThXVORCT2QrN6RuIjTKYzmHhGcEgchASLYh5Ka2UjB4m+pHoNm465e3DAMmo+STN6g4lONAQB0KrcOVAFZnXnOQyl82/kfllbYaCQgK//gjiRavETt/5zwAmlwiIHhiSww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9017.eurprd04.prod.outlook.com (2603:10a6:10:2d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 15:28:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 15:28:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: nvmem: convert lpc1857-eeprom.txt to yaml format
Date: Tue,  3 Jun 2025 11:28:35 -0400
Message-Id: <20250603152836.1069326-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF0000409E.namprd05.prod.outlook.com
 (2603:10b6:518:1::4e) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 08610b47-772e-42a3-a54b-08dda2b35598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mCnopYcSLQ66CUiXCu6412ASmVjiwJ4r5bSHXx8gEBk/i4FCp+fsR72f+S31?=
 =?us-ascii?Q?ENmQOLQfSA4z5QyDaZLb/jxW6xHZfnQpFgnEbrNaMYbBD96xp3yTpwKnIvJq?=
 =?us-ascii?Q?2cUtIES+6TdA/NH6HpAePVXIZSq1BXQnMLV5vsWnA8C+DJcN8zQaLolfMDgH?=
 =?us-ascii?Q?x6s+sEZCJOk7XbWDzh6BsnnVqiR/iaioB1rY3HPbClaIiaetpoaOfYK/4Rdt?=
 =?us-ascii?Q?uoiv/Xe0lIbRj766NCQrrQJElT3Wy/HYJdl0HGhdXWWhD8YsDNxfswqygdVY?=
 =?us-ascii?Q?j6jVnvyi7veiMSjvlU5QJQjnMVHxiAXXh6/osmVQO0h7yDLm5FLes3pxOrd6?=
 =?us-ascii?Q?EjPEAJc55qxZMoosKTmwJ6hZE1Me+w8DkIUMmBmhVtl8wwqZgploNudtNTYE?=
 =?us-ascii?Q?/MGClVU8cteU3I7jZnWmWchFE3R/PmVXaO4vU0Miz8tFmDz/hheRHJ6HUJKC?=
 =?us-ascii?Q?+ReytTlWVQKJwCjmo4YXSkdAwSBZzc9ozbkucm+FtI2poyajP1Bs7xmFgq6y?=
 =?us-ascii?Q?Ro1VqdJLFPVhAmCmcur9TdSMAMRx8bN9FuAaggtvwyv6XX1LMW7NkHl2OLC7?=
 =?us-ascii?Q?amW9H1ohKyBvf1sxAzbvj/dsyM870hS8fJ6+9Sbb2dD6omxInb1eGa4mOwch?=
 =?us-ascii?Q?iCAEAKDiExP34JEyLpqLa1Bg1UukVqHK/v+iZlYUAEdtgTxg2mxVqvbRiZVK?=
 =?us-ascii?Q?DcslKkaDXDT8WlmLVJW8Lq53amGTPppSfzfE+Xxqdx+kgGPAS2GAI8gAzKip?=
 =?us-ascii?Q?ZEOxApwdGJ8AbRaX+9VVkEFwd1ySQtXwzTTbmRX6zxFj32/l9YiweshhoJiE?=
 =?us-ascii?Q?WMdQR746H4gNyqMpK+K7BfJtfclVJ02o/jMYqEg2ulSRLeIdPk5lpu0voH6L?=
 =?us-ascii?Q?POscgm+9RITtW3gBWi+/magvvX6IB/daYitm/1GI0vj3PrjEbJ6CcgqWkkpp?=
 =?us-ascii?Q?eeqRVyVJsM8dZEJluKePO7/19MwBfR5gyiQc+sRpevrUF5MQFvNcEDyTFPhD?=
 =?us-ascii?Q?bXwZFZIxSFtLPiU28y0PkrGAYMi364Mlnh4uuxGl81k/H0YU0Y9uNg1m+ArU?=
 =?us-ascii?Q?NM7fM1ikf28cPzqRI0Zv5yXTRANkKQcW6bmcRC0TOhn00kA+ocqNTqxLq3uq?=
 =?us-ascii?Q?oNBIe3H75DQ/5xJpSB45yIV5/yOvMw6h1dD+VdsMBCwY0eO3Whrl8a0AbnDu?=
 =?us-ascii?Q?AEJN61YZrAkMAlFK9w5kpLtO7goloZxHM9suqODUzvjgYxp6cTD2FhWxM9ZG?=
 =?us-ascii?Q?MVl8Qk5d7NDdklTPwG2uU+wLS1xTweiNPDymeUVDLyJr/SjQHx3ouJFvEMO8?=
 =?us-ascii?Q?qKNYTlfgCXpIeAzxC277CqlHtuECc2lA64xsbLf9CJUp/wbQYZhL+ssCo0f+?=
 =?us-ascii?Q?pYsrvNvRU9Dn72FllerODsPwSfPtThvvu0zPfcKZ6/oECGVN99Jx2GN3xsGn?=
 =?us-ascii?Q?Egv2iqGc1rGm/HK4zIKtx64OWt9FnUsz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Le2OnscSScG8RjurUZxiWz8pndaeekk69BGdXQVTnH+/aOA7wH+wQDja5ire?=
 =?us-ascii?Q?EB69nrXpK5xIvtllJRHEMWlLPUOr6sXFWBH5yXwvJGrKNYGFv5UzgXh1N30w?=
 =?us-ascii?Q?ZSdCfyrnoLQKy7/qMrvSGhQ3UcCwBA6R5j88qdNVQBQOsiiWAp3H+JzfEC6v?=
 =?us-ascii?Q?7VG8CzrhEgap/gwSTEvJQ0ckzb9mPK86Im+DIKrykZIejo4dsXivjsbmTJsZ?=
 =?us-ascii?Q?SN9TwY/gmkrPBKiat128h9qyqmMFsKeAlCqYkO/ev84gZDXKOyDMq2LKlHOx?=
 =?us-ascii?Q?nuKpk8VQbX79E3n2aRs5kgGdSjsH78GwiypdO8orWOHmx/Plwb9W8JKZayFn?=
 =?us-ascii?Q?naqYA97XL8q8NZAdjjo59ifrYCP8CE7Sp3B9VlZH7REGx+mx3/DERj5lYQk9?=
 =?us-ascii?Q?C2ivPXnKpDjm5PkrQCEAOxWXmyIXE+wqc01CCGriw+AU+AY1fxnG5lbnwAzy?=
 =?us-ascii?Q?Th2iitQpaVyFe5UhcyuIVIOpuUuj0qt2PnNtN6LzyIYs7cGXDHXKacrfzfYx?=
 =?us-ascii?Q?8Y3YVd+r+cALGioB3LQNSphng8IAgFc2oGM2iiws2X03Jq1blUJidV2QM/MK?=
 =?us-ascii?Q?4VYAfkXSVDf2z4iHPdi9ElPdfH3b1i3jb7JUuMmS6q3OML2YrTJBhEKkRCOZ?=
 =?us-ascii?Q?VFDNf7Th3UkRlMpl7IzzLPsrxQ5HZsOOMtRetgpNAoFvcOsfgS22UfmkE1ea?=
 =?us-ascii?Q?t7+CckigW8AvpPazVsi3KKBu2WV40SFPHyA2si6l2Li6t/cdzmMUQlWhCnRX?=
 =?us-ascii?Q?Jqn+4Blm8ZyHlEhkOKhPKlg2iwKuie2OzG2DriXdHR74GMrhK8O05uW0Zx9F?=
 =?us-ascii?Q?WqLT4pGkpuYIjr50m1+1IvapWWYqrLJPlMNASFCi2uA2fDLVZ05Ty7BGCQK7?=
 =?us-ascii?Q?fyjMjfTdZFLbVSlQFAX7dphYCKWYU3qu7H3LnSUykNZe+LaOgj2U3bcJgfkM?=
 =?us-ascii?Q?3gDSzpM190vqjC79b9i/DL+OcH6Bvwrr5g5AFebuFEm/4FOM4x13vS09zMxy?=
 =?us-ascii?Q?B4GcbjhHfP/xgD3MG/UBwVkZuDODACiLVswCZJoYs3D8+7/26gJN6I0WRbIF?=
 =?us-ascii?Q?Es4qUbmx7F5xzBnKYPW1FBdVbFfSq7+xtRpZB/QNu9ceC5I2Z2kWx+SXC9SZ?=
 =?us-ascii?Q?tdre98sSV5tkkgcHmIAOmNPzq2hjMjx6f7XG6ULB3WVjJhbiJlSn2hu16GOC?=
 =?us-ascii?Q?MT2VPFOU+5fCUvRmpmrhQq5nhrHFkp1jpC0oHkvxULJHskMYEOy2HUFUUFUM?=
 =?us-ascii?Q?sxRfP5/a69s9g0EwZk+FHjVcuUUC/QuWA7Tql6NrP9spSNmd2MCEyIcCP7vi?=
 =?us-ascii?Q?zSV3iB4Vs2MvgN+LoPUluLI6mSk0xEbjGhDS4Yr58Y2tLTbnVyKe1arw7OUt?=
 =?us-ascii?Q?dYC0ZcLBdooeXAn+UZ8i5UGdZEZX6EHMSGWAHzPnWA46eaXbDBzUq41+7tOr?=
 =?us-ascii?Q?CObeypPRz7nL0LkvcQUc5xwBIMmMnWh5stZ2r6UABvjCENuMrWZtBJPrvk7p?=
 =?us-ascii?Q?p0wpV7HbJhDMzddN8iODDk68XKm3dwz0zXpBQxwO2PIkOpI4qc2yXdBu+jvL?=
 =?us-ascii?Q?wMGJjfaHRYwo1jnutZs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08610b47-772e-42a3-a54b-08dda2b35598
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:28:47.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DikWZK68pQqCF5bF/n2BHgnKQe4Jb8OZfAsBA5+OEggVNwlHqDuXNfaR7wNYMDCoE/pFDl0IN9TGV4LIAmqYZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9017

Convert lpc1857-eeprom.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add missed maintainer to fix dt_binding_check warning
- remove trivial changes in commit message
---
 .../bindings/nvmem/lpc1857-eeprom.txt         | 28 ---------
 .../bindings/nvmem/nxp,lpc1857-eeprom.yaml    | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
deleted file mode 100644
index 809df68f6e148..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* NXP LPC18xx EEPROM memory NVMEM driver
-
-Required properties:
-  - compatible: Should be "nxp,lpc1857-eeprom"
-  - reg: Must contain an entry with the physical base address and length
-    for each entry in reg-names.
-  - reg-names: Must include the following entries.
-    - reg: EEPROM registers.
-    - mem: EEPROM address space.
-  - clocks: Must contain an entry for each entry in clock-names.
-  - clock-names: Must include the following entries.
-    - eeprom: EEPROM operating clock.
-  - resets: Should contain a reference to the reset controller asserting
-    the EEPROM in reset.
-  - interrupts: Should contain EEPROM interrupt.
-
-Example:
-
-  eeprom: eeprom@4000e000 {
-    compatible = "nxp,lpc1857-eeprom";
-    reg = <0x4000e000 0x1000>,
-          <0x20040000 0x4000>;
-    reg-names = "reg", "mem";
-    clocks = <&ccu1 CLK_CPU_EEPROM>;
-    clock-names = "eeprom";
-    resets = <&rgu 27>;
-    interrupts = <4>;
-  };
diff --git a/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml
new file mode 100644
index 0000000000000..24c71252846fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nxp,lpc1857-eeprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx EEPROM memory
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1857-eeprom
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: mem
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: eeprom
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    eeprom@4000e000 {
+        compatible = "nxp,lpc1857-eeprom";
+        reg = <0x4000e000 0x1000>,
+              <0x20040000 0x4000>;
+        reg-names = "reg", "mem";
+        clocks = <&ccu1 CLK_CPU_EEPROM>;
+        clock-names = "eeprom";
+        resets = <&rgu 27>;
+        interrupts = <4>;
+    };
-- 
2.34.1

