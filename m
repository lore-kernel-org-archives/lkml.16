Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8D12222B2;
	Wed, 21 May 2025 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845651; cv=fail; b=q8eTxT8SHa5bw8z4jxss8dFbHfLVPLjAS10ukTtoayoJLVqzz2e3R8PApjvEw49WGG+RqwLemkpz4h1bGxnsMOhrEWsSVlYfoyNngwx+jOza1RyU1gjrh5p6h+anlh+ZUckQPJE6DKpeHAK80N2LRSTdOHc22BFoZpK7K9m7nIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845651; c=relaxed/simple;
	bh=MuGr1zmXQMCYYP6ppY8625TpIwEoTJ9A6LSd4GIcz64=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TzHL+KOYZPfBpr2QZu5aSwbDL9L0uZInym1zo9dQqE75ppQmJagLLLwG6lHra4c1Y7flercfoBUrzrl6sOjeZ03XAuRpVaTQuHPO65Go1k0WoOcxHDvuOWItc5T8/Y8kvCMoNSjsMwID+PQbcbMXhU5Z/ILjyrOVtHvqnprfxnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bJDWTNu1; arc=fail smtp.client-ip=40.107.21.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bJDWTNu1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDt1ruIJfdhdZs4f+QYbFYxUhldWQnv/vhDkq8j0SlkHCM3PeW8O1Wy35LUdz/6/2up3y2k0keYr372LJoHIWioDW8fKJLbN5/rIQd/l805lPXrndEFGO+qJQ5XmJf4a87N84Juz7aII2TgTJmwZSZMtpqxG5RDAGeMa43XQ2sgvQxyyZ2/uijgzCqOJHZfRPZNFy2udmgflMXs+Rjft5ZzdSrvw83nsqEHqH8NOvuNcznPVFiqGZE3zZezKCoNzVqY8HigksfFnR0DvuRshuH/EtjMjerhl87KFG+O1Aaf5WN7EdfHCPuuCG4K+nWLh5vJ+D4Gwf8bwiayWj4ht8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2wWrteotAFJoryxVzG+gfcDhs09SR871M70tKvV0w4=;
 b=cGo19qlq9XNMnOE/SulC8SAYeJ3wCL4SKSSJUg1cIRvJ38nrOXIkyvBd/ERB7d5YkQdXco/05UEWKejuv2Nsg4AGxAx8jPIcZ5MfHfI0KKBGKJYiZvtHWtToSydkpR6jFSiurz+XqDWr1QZr79LIqH/sJQRX/zxlPs65D0U2LpWrEiG/xspwKBdO7d7NugfxcSonrGmsvF/E8Qjb9C6Fm3v/nUfeZpnMwzMMLwKegqS7H4Vg4vZbK/3nRDUvPpgD4WXmP7sguqjqy7o5BuZ55/SVGOL1nZgfvTxgbUrEBvjzM3i+sG7npO0usA0wUKuRgR5G4iUElRyJ3VUBzRiitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2wWrteotAFJoryxVzG+gfcDhs09SR871M70tKvV0w4=;
 b=bJDWTNu1lo1rxg6a+zdbU2NUD71L1FzhmqUmnqt2IXKDqza18mQhDSUJ911EC3/Q2S8UyVbdlwQGPbp/eYtWkGYKgu1tcYMVFOwOjaS07cs5tIiWPcv/xcls77+YH+KkC/L7Ker2L4LCki556OGtmXCL8YzQAOT3YuDuIX0+HmraR0wf+XqlDVAulGYToPiaGXp1RJSptrBeDMZ2S+lQb9mE03/BOUFPLNOcGEYDBzZTDNTVs/MbZwDqQ3l1hCzeQz8PuJj4NVcPCSCtjLoBk0hEMear5uYjmFZeCB9K7jTb9kRYGim4fiQOpU0eO30sqOpCCPIlT9v4a9uohTVVhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10295.eurprd04.prod.outlook.com (2603:10a6:102:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 16:40:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:40:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: nvmem: convert vf610-ocotp.txt to yaml format
Date: Wed, 21 May 2025 12:40:30 -0400
Message-Id: <20250521164031.306481-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0035.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d861f3-2a58-4356-8ad0-08dd98863c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6g3Df2ONxtKQJPh8fKyEWC2cYw3stQ0nL/0ocFUcKylwdDpkWRxZUbyh4Pt?=
 =?us-ascii?Q?3kpTozu0Ho4snMfVnEvIakmRu5z45aOcWjWejfjl7StySbTl+Y7Som393e6Y?=
 =?us-ascii?Q?6EV+fIDBJasTYDJKYFTrWkedyHPzOG3wZ/DkHkcC070kdlX39/zKQLQU5A0W?=
 =?us-ascii?Q?goDOS6jhWYqV+xXqnF86PINjfiL3wXowfxmYO1GInDchOwrsp1dAbiQHYj0r?=
 =?us-ascii?Q?11hbxLIzbIdbTHzEDZBrGCfYAZbpSzr9KA/MbMGh0ZDHBkpAPZTMXDdE/euJ?=
 =?us-ascii?Q?w7m1d3afTKQRRNy5guJv7b2UnGiepLGdRBN1R/qLpyPtqjj+kIIV1H9odVrv?=
 =?us-ascii?Q?3QQwTKf/oN20y4dDmgLSI4NtaOYV7ljJW7Xk8yGrfZxF7po5Z+j80ThKMw0N?=
 =?us-ascii?Q?Mwz5iw3rAiLKukljnw0koVbniQ9/RTr1+6vlxVQTxiTFAaRhB9v3m69Pmi5n?=
 =?us-ascii?Q?HqMrBAH7o0qlcVg/o/hkHPCB2kzLHZI9QtwlH6B5+ZNhn9mbuFA+UvS/w0Lg?=
 =?us-ascii?Q?fNdKiFQvJJ6O8XKaeXEPC8WfgSrgT5l5JKcdaGrsGyPNUkEpIC+ZNYE4syjP?=
 =?us-ascii?Q?ndqz0LsWQ2+HM92Mtckc36LaNN0/RWYzby/Ku2PVcF/ffnFJO9ln89r+Zyez?=
 =?us-ascii?Q?fZ+7bLrMpS0wz1WTCbLag5smQ2LxuQPOYm/QKk6W4HYhc635JS7KR7Ndu5Df?=
 =?us-ascii?Q?XV5Y9f9sE2/mLg+17bwvlZ1kEnsBQnSI1urtwqGecU9dQplHx99rxtGY/vr7?=
 =?us-ascii?Q?WvX3NJj8iOB7OdIVsZ/uUpLzrH1Mg+KY5o0JqX3iq19Abc9RBaB5poO31ebC?=
 =?us-ascii?Q?UyhUyaCt8b8ffTg3sb9WxxRwilksWF5Zq4AuyfPkXnbh7Bn1fFqR3pq8winB?=
 =?us-ascii?Q?hcI1dEzmD63CfnI4Z3masj+4CIph0lEJi/ziMdjNd88BdTE+J5NFO6kT52XQ?=
 =?us-ascii?Q?t0DjD6Wz4K5TKv/leKkmJQKabl7YuX0oFlQ0WIaNVimcs5oDOd2PSuncgZkF?=
 =?us-ascii?Q?F8442u38M6YSu8vqeAQI839njWC4kVMlLDPthEKt3e4qHTT/pvdjqpd4Z/5Y?=
 =?us-ascii?Q?AdbhmE2BHehZoV5gIY6Zrg9sEY2QCy+NC+khXeSYRJ8l/Np2qEc65saRlzNv?=
 =?us-ascii?Q?G2oLB9MAmtera9pb7eN4pyPwJWXr1uDZ3EDh0+W0uSRwfI+lk/3HiE+J9CbX?=
 =?us-ascii?Q?9B7BoUHmpHPSleVZ7LCd2NgrDWO7Np9dbe3ZHP1A9truIpFolEEHCUIzhxrf?=
 =?us-ascii?Q?WupuwHbRAMWtUsdR7k2vQzqnq9QwZzXzMMDDgyDpy7PThXDFk7EiKJu+x6Ny?=
 =?us-ascii?Q?YGf/Rk/tK+N6kWZlVFjs8bYkp75p4QdtBG2OyD7SHYDfqmJf64oL5G9+6YWn?=
 =?us-ascii?Q?dyGjuEa4PBF34oEnfqCGlQYn+uGtuXsKGXtqXeIADjNTWaxCPIxDRc6A9Sku?=
 =?us-ascii?Q?0ul1Yam7oM5jdos7tCeaUShPd+NVk2Jo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q32IaHrKhNTUUV0VIONYX1UIznSLLBH2gZk8RXKPCVgE8XgytSEJRWwEtHe8?=
 =?us-ascii?Q?g0wOV8PA5gSIsXXZltXHr6c89qxF4+Vam5v0y4gE2fR5jmkpZgbMXJxfkkmV?=
 =?us-ascii?Q?qd4Z/gSSVPbSCOTPS2tXNscn/EgReAaIVnNAyiVmPwk+aHPaKSJFTPPHYLaX?=
 =?us-ascii?Q?rlj84rTIvGLR8y4ZY7J8sA1BPO6Wt4QfwlUBG8xaXxkHNtR0CdpcdD8jHRXP?=
 =?us-ascii?Q?xLl1+stol0pFJGsDWea5ZmmgaAPZRyg1ic6qUVg+cv4xALxNnl7GCtWHlC3h?=
 =?us-ascii?Q?oRcGxfV73zI0g/IgRxnCHf2ma1wptbkvjCZr7CiSEvvgYJkYm3XU9QgUjnfw?=
 =?us-ascii?Q?CoL2LKH5vvUqTk+UMTK2C0Ix6osAv7DhNWxfas5GGTX+N1apmDPZhFVML7M2?=
 =?us-ascii?Q?/NGWb4ueyAVYM/uYd/LS4m69WPwmdae93SC/QcuL9rtAKgfHnZN18F6yCsHs?=
 =?us-ascii?Q?61/AEuUGs0v+MIb5U3EGadnFMAASzA1XZwyi+s1DgJr83CJ/ezrYaH8cJCKk?=
 =?us-ascii?Q?IQdakEGSnRFkqHaKUEHRciKZapKWr4UStXeTgu97tUsyyvvE7tUzFlIAHS7L?=
 =?us-ascii?Q?8TL5Y9xso7qRzSONw8Ymy2iPTaxtfEeOZ9SuQ+RWzKG4br830p5X+x4hpET5?=
 =?us-ascii?Q?inO7DIFTnUDMvhgl2LZBOl4yI0YZ+KpQIC4QCQypLg0F5aPJsgTjLKgG4Ga2?=
 =?us-ascii?Q?egZebwgBvKutOn6u8NH85tVFsM2uQLRBS29OCH5M01typ6asfiEIdtFEJJqX?=
 =?us-ascii?Q?Kwy+WBS5n5AQ1+UyTBn+YifU+bAudZ/Y7ryNqZ9fbHa6M6CYduISN800wccv?=
 =?us-ascii?Q?ecfUUpCLod8WTEANdzFJjJV8n0eSYJ2zD+2QWIDiw/5XHau61aYWxfWJxllZ?=
 =?us-ascii?Q?41KgW6yzS+ivJzk3UgnMCnmDa1DI96chTxwaU/d6CFmAB9omDMQhJS2CvWCu?=
 =?us-ascii?Q?PhcRtH9TJD6nXTl+UmOxajhIt5TGb1dCVVEMLkvREmvgL/3W7KGeozeJqJ2T?=
 =?us-ascii?Q?PnzjC0Dim69UhAeV5AsBLy8aO9UZx+d4eB8VUBKK2Qut9lhDgncPeePthk4r?=
 =?us-ascii?Q?xz4HmwKwJnTAItfzjy1GEQ3v9n5+r23Gs2f32is/sk0JB7QHyJvLOM8REPf0?=
 =?us-ascii?Q?InC46X0LxjYhPG4eUnsub27UXPAW8vgfpvhvry51FrjJrugzmyd+vLCIkawX?=
 =?us-ascii?Q?vcwxCUULJNcI+hY1OVRxg+yg8vZnUUaoxAhiYjtr1pxdZdeRXC2Qxa2c/wEG?=
 =?us-ascii?Q?vzNmwsnWroPUKDunecYSHOevrKn6NxaD3OXl/y/dOR94+lnO6GpIOQ89zl7u?=
 =?us-ascii?Q?em+kk5ymtDbM74sQUS543f6lxXvO4XuFIfTFDjF8nStysJSe0bEwETLXuFSW?=
 =?us-ascii?Q?xNtWhysnlp9FfJlECUwuu4ad15IwjRoDVKjUsKKfkN6a6u23jtio/RBebofx?=
 =?us-ascii?Q?UcXXKFHN/BHLDKSAbHSGG/Fg0ycQ0hVROFTj8PCSs4zk62DX4LZONZ/He48P?=
 =?us-ascii?Q?wNcqzeq9U9+IzPpoti/Q6pyB22SOP6nlyiU2gNQkMUdW8O5QxkhbunfJ7ugV?=
 =?us-ascii?Q?KYBWmiyTzuATP+C+QF8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d861f3-2a58-4356-8ad0-08dd98863c84
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:40:46.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L3iIpOsO4tIwHADVi+DiyMaLlmDK5iovK0hLch546hc7xdy2HHG1q9HXWshXVjnwgl7M/Xm61r7yPXZwJnIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10295

Convert vf610-ocotp.txt to yaml format.

Additional changes:
- Remove label in examples.
- Add include file in examples.
- Move reg just after compatible in examples.
- Add ref: nvmem.yaml and nvmem-deprecated-cells.yaml
- Remove #address-cells and #size-cells from required list to match existed
dts file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- remove address-cells and size-cells.
- add clocks to requires
---
 .../bindings/nvmem/fsl,vf610-ocotp.yaml       | 47 +++++++++++++++++++
 .../devicetree/bindings/nvmem/vf610-ocotp.txt | 19 --------
 2 files changed, 47 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
new file mode 100644
index 0000000000000..5aef86a752a6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/fsl,vf610-ocotp.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/fsl,vf610-ocotp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On-Chip OTP Memory for Freescale Vybrid
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-ocotp
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ipg clock we associate with the OCOTP peripheral
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/vf610-clock.h>
+
+    ocotp@400a5000 {
+        compatible = "fsl,vf610-ocotp", "syscon";
+        reg = <0x400a5000 0xcf0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clks VF610_CLK_OCOTP>;
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
deleted file mode 100644
index 72ba628f6d0b0..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-On-Chip OTP Memory for Freescale Vybrid
-
-Required Properties:
-  compatible:
-  - "fsl,vf610-ocotp", "syscon" for VF5xx/VF6xx
-  #address-cells : Should be 1
-  #size-cells : Should be 1
-  reg : Address and length of OTP controller and fuse map registers
-  clocks : ipg clock we associate with the OCOTP peripheral
-
-Example for Vybrid VF5xx/VF6xx:
-
-	ocotp: ocotp@400a5000 {
-		compatible = "fsl,vf610-ocotp", "syscon";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0x400a5000 0xCF0>;
-		clocks = <&clks VF610_CLK_OCOTP>;
-	};
-- 
2.34.1

