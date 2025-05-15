Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF961FE469;
	Thu, 15 May 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324614; cv=fail; b=l6oxe/dpz+bQYYIQ4KMzG6AIAy/C6A2/PxzPQoa0qQlA6rki78OjMykxt9u7b+oAmcs8IJV/vYA72TnlCrnNKpYQtrVx5Aou+I5PmH25YbWJ8lHfp4XwNtpbf0hnOLjJ82AXp9F9Xm7S1S5lux152XbH5vW42usbgLrYVCv4ZqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324614; c=relaxed/simple;
	bh=4jhooCw9cpnjKgAni5MuEuENTkP9mVJJdtLSBIY5JwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YcORWAHR7St5stvfEEnjZCnIgvkXstPVQIrDvDfUA40Za2wSDlj4ICoQq1Wh0QQgnPqvas8l9Ksvp4qMZDprbvpTvLc02D7vCla4wzK2Ug2jRET2pHM2tCeJfgr2T7l9EcjNJri/ex551xdzw2bZRMV2HS1v2sUr/hf75qoY7hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X7pL0qlv; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X7pL0qlv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVbHMqhCWEOWXkULmbvULYzOTxEIbwMyTG5RfCkQyPBr484FlnimbBDGDPnLj46kyRK3qHzcoXFCEIDy7fqN+U4lTX7jISka4xAAdh+D1NJh/3BP714DNr5K0Vif/vCiB6heYNFfyloF0PdVnXEseX9DLHcEqBMeo6+hgqITNX7ATJ/ksWxEEwT0xy6Cj7Q7vpr1okNR9Sm39p22ztCPKwG9lI0QiNoZNRXng9INgJCEIWET3f5DcWs2/thsdGmeSDxs1u1Rfx0Q/2EWiHt/YXK9Vb3aIapy33Ikc9y9JFXvZDSvI3bdMKsw2kEUPTP7h+039OMeDfn4qt5lRz5W/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCXQXXQni4VT1u+7hfMQXkvtDZKJ4t80cdJzI1iCHkQ=;
 b=rArDsRcYiB1sD/tfux7wy/E93BIQ0ZSCt1gJhupBFpAOeFX2QGlIs6t9Y9pcK/s3Q6LNYT2JuVSZFz0Z0lGYz+H/Jb9F6tgA5UdB8zkpMI1CiyVPoWdgXbkOpS39VKNfgx1MZBg4+ad+5ik7p/uYqfZN4c9yB121iFjnAcTGJ5TjD6/76UCGN0BpfguN+vGrgkgx/jHUU15Ww03nui30TrcKId7NOwVNRCvjYDOjWtdxxECUUjPdCgQUi97twDjsNUQfnhsteOP/qDKknUi+JyxM68O0G5Y8rf2BzdJQfdQRWGplxurhzE86rMIvhY/VIf3ytkLCNKZoWcWyzuyrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCXQXXQni4VT1u+7hfMQXkvtDZKJ4t80cdJzI1iCHkQ=;
 b=X7pL0qlvd9u3A5AstoXiBNxm9NJVlDWUs00r6x+QKVBhnw6SzFE2rvXrtVV4DpqvJf4ji3k8AheiD4WuGfOxc3L5cyt/FTgihuInxgldFd34M9pTWi39tGY2AsK6Gf15iAXOrU66ThJjJ4+eF6WTKOcIiHYEiZho7JnsyEDrK5Q5tNCrCjAPgQU8XsXpnyBMYARHrXigW3kUxubPmiaWdtTNPedVy1bBc8hzgIVoTygShzuN5RbL00MIIYdggljh1px3N2mhlLU4D1c72wpdI/BmU781VaLuTCnL64pnYuq0JHScrwTImleqL+UswoTIKXkWVfEiw64tWglyDwx5Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:48 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:48 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Date: Thu, 15 May 2025 18:56:23 +0300
Message-Id: <20250515155628.233007-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: e35fcfed-b924-4193-adc1-08dd93c9199b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UUv42hyioGvTVlJNv01wRuVSWthmoVkBP9lB1wlRKdvNU+iTEKoFYhXVJVTs?=
 =?us-ascii?Q?0lINnXz8EWHl4X0PDC+9tJ+PvJFTVh1yHFz3ssNCwDH/g3r7MiL2wXcv88Ek?=
 =?us-ascii?Q?B67RClYXyl9zEWmKkJk3woiH2Ejn5gYHngN8cwbyzD44jDUZPE/ONJPDvkDD?=
 =?us-ascii?Q?RdGV4Cw8EwhkKrSRGpWG5AHPNLRupbEV9J7BONMsyHLkRZRT4lrEOFMUJYl7?=
 =?us-ascii?Q?RUO7+RVLJ63Ed9TvwpXrmDz6KK6JlwT+iR+PkjJ0OLhlLTA6RvepRpAjXE38?=
 =?us-ascii?Q?4xr0eDI/NKH8dSvo543n1gCZ9XfcjCLX483SySCRuEvZK8B48Wi3fuWBQRMk?=
 =?us-ascii?Q?YfN34CYGig+tBVJmtUOtVMBjIs+1tc3Pn3YK5rCn7X8ksQ6rN05YZ7x0Ozlr?=
 =?us-ascii?Q?cl5cCzETm2tf8m6HbyFhL8x2sKaJ0N3lRyMIYPp67Bg2tBx2F4T8ZLowuZhH?=
 =?us-ascii?Q?dPPe/L6BgNv9crZNDODX0UNCUxUokDSXVW/WOxMmrEzoj1cXrrK8TsKMRQo5?=
 =?us-ascii?Q?3xj5W8n7VY80Bl15fOZmr+DRZGh5oxOUEeIuZ4iekBXR4cB69mZRtPO3Qja1?=
 =?us-ascii?Q?Vi7fipddE044IaSiWFMuzftgK3VgLm5p02g7jYOzqo7YCeLtGrDGhDxnlbnJ?=
 =?us-ascii?Q?VOYhP5/K7AvFq58xjw6Zon8vx7Am0/hhCHAFlVu86NmJbOBGDDOJkpre7K5q?=
 =?us-ascii?Q?Metk28yQfgZb1pJ+9MJq8OmSGfeX3TNWqApm6PldkeWfe6LGwmjAixpX4sw6?=
 =?us-ascii?Q?veIDN3z6Lm1Wp0uf51i5eP2Pj8l2A2iL73FxG1XZRx56mPVsaM5MELbVn3tx?=
 =?us-ascii?Q?6xvaTqTr+0KqqxjEx3SnwIhle8lWHpLYJYjphVeJjrhFe0bMvg3hMUyTi4E7?=
 =?us-ascii?Q?Q+GnYltVXDWZ3moaw2pWML0e29ZZlyAS4EF1BP5GLT25dH+VyzbvbM/Kr0rX?=
 =?us-ascii?Q?9ueMQv91srBRelbKL7lgi3YZqllFsLV9KkM4uXYTdIxcjJUXLi4u1YgI6/rr?=
 =?us-ascii?Q?Y0vvpHoViklPn5dV23BCUu3Uy8Wbgpf1y7InYNfdU20yZmVbSerqW4B5L1Z0?=
 =?us-ascii?Q?i/nY3yNeo4e6ehguHLFeOlS0MJUVzYZwNSg/XBnzjTaH94zIqGHOqITnsSrU?=
 =?us-ascii?Q?Sx1Kb5GWT0F67rbIq3n7OVvWnJz+gHjFTQHjdZB7lAEkN1byHntLmiwGIvCC?=
 =?us-ascii?Q?hnEwcKbIlwU+MFzbKqf3KcW4IUstaf8Hsd9jd18NA6Pe92UPayyhg4iGZYEB?=
 =?us-ascii?Q?sSmA7MbkAz7iOkansZHemV37k7htL7roLdWqhE8KnVNgjrqp9mQQTSWEDn4f?=
 =?us-ascii?Q?AtaSdrzs6El337ohftLkp2sLVtQKMbD+ow7nM1Jx00tpRsh4mO6vQv1rBD6x?=
 =?us-ascii?Q?l3Em+h1dK0zqBltCBqKpaD+9Lwzj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pcLuquY8+AtsHa/WoabIU22m3s2A+PzA+JBA+GoIWPsjbDME3S+hxGqUG9lg?=
 =?us-ascii?Q?WGruY5xthoyT5od5EPAfeW3Mlkoef2PaffeYjlqqWnMQdvWpvcOCChuDnOj/?=
 =?us-ascii?Q?vK1h/CHrqHIlZK5vfm6Yez+gdy4CGlXJM9ReEo9ISMtT/7Nv5NwHYbVqB7iY?=
 =?us-ascii?Q?vAfuXnuMaXBF3eptu3/a6UOU4IRyhkLgdzby7vBw2SgQ86EWeknJLZScffbc?=
 =?us-ascii?Q?L20YsyB/ARIRXLwgkQYvfR25zN3AH3ugUGD06wBevoPViDGvtz4xCIc3hhCt?=
 =?us-ascii?Q?PirdQc6I9aEFyptYyoiqrQTQRsGqfg45YsCrxdZCrio+HAysy29e4qg/07E1?=
 =?us-ascii?Q?4pAa+Q5x2WjWXStquzqWWfE+WwhL9qdwYlB201F/1w0XVzug5V3YPxtkM0rw?=
 =?us-ascii?Q?yiCzrf3DQzYMKFzNX8kyukmSkxiTlJqOi6Z7QnL/Tkqz3lHwwpzpcUWhTCR9?=
 =?us-ascii?Q?1mcKbrmfF9yBmJLUenCH7YvaL9s381QB5iJVO7yUzGWHv98lwXmtJ5yYB/ch?=
 =?us-ascii?Q?ZDJPfwavZKxLFfWLMOVvubphlGkTNl/dqZiS/LV81q40wBvU6gEYpcYiauPY?=
 =?us-ascii?Q?Jpvi0SWt8M/BIGtlrLxhN49hc2reDKJ0m6SG7p88jXOjY1wZzuOEg6Qpbqrd?=
 =?us-ascii?Q?QcHXgePAHv5pinEf0kJD9AbvH+Z6Wiu7KiAoA9ILzb7YiqP4PKaT0MGxq1iJ?=
 =?us-ascii?Q?z/qfxny2og7lcof5d5KszESc0NegJW5bPW4j8scEtipl5a4OiWvIBKfnqVOQ?=
 =?us-ascii?Q?R4aBLcRlQTtRmLWbxWjSA/pMHXaiSQ66LUHr//oCZfOYLXKYJsMYBoTgJZqN?=
 =?us-ascii?Q?xagIEyb8mKGqX9YgwayzPXMzxGNnnZaokJndLIpHI1bd9UxSq6HJZV55blLw?=
 =?us-ascii?Q?gX7F+iqg6+xDk/sK0mRm+Kn0euy6DGi6+KYgX7Ye5CzFK+l1Lr3QFHyZa3HG?=
 =?us-ascii?Q?Lzj+f6atprrsS8oWw/wwXWnxlouBsM0xlPopQnDepuLrRR1xf3NvAzQzeheT?=
 =?us-ascii?Q?1JXDGjChq//+aRx2EjLHA1ZLvIIlemOZMNb+JQ0XLoT305WbWkBrGO/CDpBF?=
 =?us-ascii?Q?8bwgBBjSg41mwcRUruqIBsHbHKiaegkFa4dbUlFnXxkvqnmYxGbK4bTsDbh7?=
 =?us-ascii?Q?n9OMkdn8l6yG/bthXEiqXavQYOP8P8RZ18tx3rETlQ0BMOiqb3EE+mSxuomH?=
 =?us-ascii?Q?fNBu8ZGavuFmOMhWCvPpMSVsiZcp9XixHWZ2rQrXHyw/PeyN+MBlQE+FSaGd?=
 =?us-ascii?Q?MZ4rQjg4x+vnnY/q5Dd4QTARwYO0YklXZ2XXBVR5KxS9Ek1XKuB9Ag7H+cqZ?=
 =?us-ascii?Q?ElosOPPEb8UNmpnh1Elc6ILTWLBlPdmqNqX+WvWbxV0VhlTHj+jj24rat4mB?=
 =?us-ascii?Q?w/MEZR1X8LucWS/t0vs3sqGQcjS/x4ax8XZ266fqWzwWWuB265mryVyyFwSv?=
 =?us-ascii?Q?6GDpVGayD3GDbQUvMcdsaYEzykxg+9ORpSV26N7nrFaPBvauwgbYKWUsQXut?=
 =?us-ascii?Q?kKLlbJle2ERfjvPCWs1Oo1pSE1E2cOYualS3v5p6NcnzYFlnU9D8HioZGWYd?=
 =?us-ascii?Q?SHCEFVju7ufdnYGg3ttNKi42kuMvaD1JaOsPGw8q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35fcfed-b924-4193-adc1-08dd93c9199b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:48.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMV/4s1y4FOcck0+dArMSSKMcAfeBMNH0FCtPxo2sgnz8ieP/6ilP3o7tausfMhmMzWFFPJJIGs5ixHNdWO4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

Add device tree bindings for the board management controller - QIXIS
CPLD - found on some Layerscape based boards such as LX2162A-QDS,
LX2160AQDS, LS1028AQDS etc.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- reworded the commit message, updated the regex to only accept
  children with bus addressing, removed unnecessary '|'

Changes in v2:
- renamed the compatible strings so that it does not mention the i2c
  part, which is redundant
- remove the description from the reg property
- reordered the properties when mentioned in the required section
- updated the example so that it actually reflects the expected DT

 .../mfd/fsl,ls1028a-qds-qixis-cpld.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml b/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml
new file mode 100644
index 000000000000..e54aee572092
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,ls1028a-qds-qixis-cpld.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP's QIXIS CPLD board management controller
+
+maintainers:
+  - Ioana Ciornei <ioana.ciornei@nxp.com>
+
+description:
+  The board management controller found on some Layerscape boards contains
+  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
+  etc. The QIXIS CPLD on these boards presents itself as an I2C device.
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1028a-qds-qixis-cpld
+      - fsl,lx2160a-qds-qixis-cpld
+      - fsl,lx2162a-qds-qixis-cpld
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^mux-controller(@[a-f0-9]+)$':
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpld@66 {
+            compatible = "fsl,lx2160a-qds-qixis-cpld";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mux: mux-controller@54 {
+                compatible = "reg-mux";
+                reg = <0x54>;
+                #mux-control-cells = <1>;
+                mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+                                <0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
+            };
+        };
+    };
-- 
2.25.1

