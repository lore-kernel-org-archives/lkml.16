Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101A137C37;
	Fri, 20 Jun 2025 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386270; cv=fail; b=nppenRiyIvtJbrdiszztA48eduNDTA1zpz1rYW7qnlEDEP5DDwFA4RqEi0vS6918g57/5FSaYgbHB5HADEEYNKbD21KzbPnSc59GqcbAVyrK9RxHVFcFNQM2WV4Qnw2Rq/7BCe7pXleHz8yeTY39c2w7nrpygptKfjta+v5qX9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386270; c=relaxed/simple;
	bh=Ih1Hgeqazm5UYbCl4If2b4Ye0KoKSIYU1Bquxwwo1mA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=soiybMNc4lGbeM0KoUE/JEeyMRv9VstlhpGkdebXnZpmP5tNcsQL8C1ooNpnRj/6N5AzTSVCR8x20xVQ2L2ozoc5lihbX+L/xewWnQKQnm/D3hoQW5ZHelRoK9c+XFi1ivyjOIYrl6e9kBEwcNXtPY6Rq9sgRYzW+joEAP5i9VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h++eqcny; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h++eqcny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruAP/p2CBCa+oBnypb7vLNCdSL5LF0dGlQqbPQoFQ9VfOvJTq2KtCsMVBzyUXqfktqvSO2V44gXSkLFePHQ4QAu+ivjwQo2pu5ExSVuCw9XYevW4N3wog7917MR+OlJ6navi1thz7BnQJ+JjCtztAtVYyDOP80LKL+OYjwmuQoU9ixZVCMEvjHSJ8aOzdtdUuoqJ7O8GCHWL9KuFJGG2L3PYEeSdQU2jC6gHHx4MvFK/U/d9iNeM97O6EAtPTbmqNQ35ry9IBn+HFxj+6z8YBcs2x0QWInJKOJdRlvxbiNkt1itNqTwYw8pVKLmm9523NCfkDSZHe3/g3s4cd5blkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1CSRAnsqiDVE42NqZ4NY/jYZLBYyekF4LpbRByctog=;
 b=k1KNg1PoaJimBUxo+eTU1SuFx6VauBDVjxpHCA73YSg4RfgyF3VWunHia/eJmXWlz+XpeWr/ALyKhmS2N42bzd5JyQ8P9u9orTM4mcIm+IBnoOYjZ+rqgZoclRHxkueK6tUm93/TLjNn26DnQAiLWNvPtwz5BwCGACssaCPIkUZN+Uiha0g8VBh3Ouq1OrNpnhO02XZHqK9uXDjsGI9fcu8U6yMgwpA8YyjoPLsALupGJcEOPqXEO351pe7W+Ggwp7/xYVziI3t18jtKHlD5XYfOuxpegyEMeLj3VIEoYDJHPu12fvyCWCFO5VN0JqdqPZe8IyVCgQi5QgcRK+YBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1CSRAnsqiDVE42NqZ4NY/jYZLBYyekF4LpbRByctog=;
 b=h++eqcnyLnJQx58ugNGwoh1aWg2k5Hb1h3R7QjuP9YxrTCOGUisAf9x8d17Q/1wwNCrvb8fQivs56wKwTpkDeDsx4uHBSnxaeV1YR6CH269UMrAXoaHGvq12T87iGEeDtUu7pzK5fc+KNTaYWit2uxKHpJIgD7JtvvEAgsPPZjV0xUHKptGi2zN+bFEzqQMKuLur7Er2wMt02TOnEeQQxt7kBd6lowgNgADwEiwuINkh+4p+1+/rggHliNxSA1MmnZjkG8v5CKfixDB6Gi1XrkTJdy+QS4BzvBzXRSTQj9Q73/Owg7wem9n50AxGVl9WcSBLwD2nblPgdOx3XjYovg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 02:24:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 02:24:24 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lee@kernel.org,
	victor.liu@nxp.com,
	gregkh@linuxfoundation.org,
	frank.li@nxp.com
Subject: [PATCH v2] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding documentation
Date: Fri, 20 Jun 2025 10:25:37 +0800
Message-Id: <20250620022537.3072877-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f8c61a-8be8-4a79-ad5f-08ddafa19275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SocwiX+4b6s3y+SWlMqCtp5/nbDjz/zxRaVm5YdoKrnlQ1TAyhsaKVcefu1N?=
 =?us-ascii?Q?/RNQxXIZBWl+HFI0Oy1xzjIgoLw6DYhKgjt0ZdmqkILjpzmdFkZawsSdyEzC?=
 =?us-ascii?Q?Q402ctApo99THUauBWR3WvPWn4Cbx7T9FV0bqQkjLIPDoNPQJQbG/o1yB/QM?=
 =?us-ascii?Q?hD4JNYFQxzNh4WToA6r1VSgkjBn6wtM72xfTfPPbncIXpUH7cqedGKCO/Aga?=
 =?us-ascii?Q?4KUy5hhUY71q2UInQ7UmPTZpPRB2TTtymnf19eA/TLUNVLFOtaJ/8pXLq64t?=
 =?us-ascii?Q?hkLYuzsjyePrObHhvkazBeDC2K9v96h7okk15COB7AYS2mIRBlAke0yZvKMk?=
 =?us-ascii?Q?LyCFR0wm7SowdkHQTFiuWdF9JLT55ZiD7F7sjx/15p7bBn+XRb8/s+Nzc5pY?=
 =?us-ascii?Q?7ZIdtrQNaAu6qZwNAJgV9N07f9se/B1kkIg19iiQUEx79XOE+xdq738yLcWz?=
 =?us-ascii?Q?MjCx4w3da8T9SYax155BXu5helrfqN/IRxzBJpBxlLmp07ae2qfZuYKZ0cyr?=
 =?us-ascii?Q?snb0R5qj5MjLcsveUOlE8zubbvIfqYiXVDWhSU7wMsVduT/Mn77nmg//KOdf?=
 =?us-ascii?Q?emmhezpi8gcSykVVMpk2mphYLEMdkWSprpyfpuNqhEyGGTFyWvygYJfMeshx?=
 =?us-ascii?Q?ix6TbVxcgxlB7i5vuxWrljJ2/bc5M12V2j7HL/zx03wFHzqKFZolYDHvzTC0?=
 =?us-ascii?Q?rTKj3eKgNFHKWe/y6ZHVyT33QyYKcRh1AObAMDB47EOmooxd5ur/t8ONMxD7?=
 =?us-ascii?Q?zz1ynOQ5ddoK1Ec1weOLxDDtE3Fm1ebLXMlEEDKFiHUPLzoyPIresnGf1HEq?=
 =?us-ascii?Q?NMRO+F3ZJPBUVOdeF1KnHcU0yT/ypCVQgO9/qvrDgc4mGq/N4TwrVEnMa1IR?=
 =?us-ascii?Q?FpN72FNmrYkELFg18fx7nOsNxFMESAuvaQPaeNKAwupWhraJM4TeJx1QhVy1?=
 =?us-ascii?Q?vKH3w3eqRIlBSVqKhke64eGBCgr4P4K0kXKlPOrlqWvHSd7cpynM7BVrlTab?=
 =?us-ascii?Q?vIjiVX0G+DbefCmGaTReOVsGzNnQFtZLwtjuK7AB5DT+k4tZ7k3Q8I7FyutY?=
 =?us-ascii?Q?JNQCgDdxay36j5t3h5G/bTjA+8dRkWkQ7y68fUVzSpL0JoXxlM0m3yc8Qo09?=
 =?us-ascii?Q?3fYbafA8yIj7x0PPNot4adOxAgdfE2exDtTu8VcSVfiv532qE5YSdLorL8ax?=
 =?us-ascii?Q?vpJMDRCvUHudiEJj1gKwLio/PYYHDzqJ4n5kxo53BQMEBdDKUv0vZgWaVUEJ?=
 =?us-ascii?Q?ErV+xLq3Vf0f0sin0xYJkgsHIPrw/DsqKWj8bQsTHbofejqjclTwZQYPYvr4?=
 =?us-ascii?Q?s9GWt+/pwLcCQZ0o8hcsrqVnyVw6byhIfVQzR0OYJ7VwyjqZ2EVTJj8daNkX?=
 =?us-ascii?Q?pIolbhxpuALgUnC4f/iQuU5hpiCEeigcqqgAr7tyTiz+XQkJw9OCLRXwTn0g?=
 =?us-ascii?Q?ypt/W3BDozs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LBIatPRRun9ASfx7gxETXaKCsidpk3YtpnuLqUkgA4UYmjuRqOE5Br51SO5x?=
 =?us-ascii?Q?JAv/SHsmxRVISJhFek6XTF10ZbychlHqzbGT4wcccauklwaX3n94/MJ0BNLr?=
 =?us-ascii?Q?G2Fnex5KklL1rcAI7gpXkRAR5mYDA7WQ3YJgZL8fUwjZWdst8d61Ffk/d7O4?=
 =?us-ascii?Q?Jmy2P7c2NjBNWpGt8HjEN1NWtUq8xFVw7Sg6FIiwr7pfmsm9u8o5noM4eyqQ?=
 =?us-ascii?Q?hgttbQrG+kE15HQFu9uwi7yCWET9eAAK3E+go6nW7q9r+nr+k+V+L8jblHMw?=
 =?us-ascii?Q?EvMd5Bc+grbdGJ09SZUtUFn8bmZNPoGA0L80EIK97hyNDoSllxnLGPcX8HhV?=
 =?us-ascii?Q?NSmyOw8FMdQzGJI+ppDvVzsgg0nF0WmuG24JCJb9+Aq7RjZN3KvnMGm6kweF?=
 =?us-ascii?Q?2Z3f44t9+RLuA+LfqrdUOH7ukKChxl/q8OTCDaMDvVz573J9JGdf+UHaCJ6Q?=
 =?us-ascii?Q?i+wTL+H+AmpLopqFwJF+8jRAbRvG43husAkkebLqrswOdaxvESULt1b5emTe?=
 =?us-ascii?Q?nRqrqRQ7Yn3iI0AyHTfw7xLN+T+gXIGLv2fa3iKI25ecmKuip6/GXHYo3mxC?=
 =?us-ascii?Q?mFv6S4TCDJ28QS94FU2Q7uKwm9G6GvaTH6HtLU9kzY/6QYyX86lKgtwjMzcq?=
 =?us-ascii?Q?OQZ3wVKpb/3MDsmPuJ5vt196FMcANGuG71hQF30/9fyi2pj4Rlz9lgn4s0ZD?=
 =?us-ascii?Q?/a1dws9Vgsm7ecGfifgeowtO1FFkZWVuDgkh9XpPVb9MXHrlYEMmFhyXZypo?=
 =?us-ascii?Q?5CKTLj8D5gLHH6zehC95MiZqpC+YZ0n/oNjyv4DNozYWsLn/HnzWVbNmtAiZ?=
 =?us-ascii?Q?C5Ul0/qZYR92BApeINNRDukI2S+7WighKksJu5pZ4rWtrUbj811kXGCjmoAg?=
 =?us-ascii?Q?+0RZ7g4pyp/82/dZ+LVwC7wfBVrbNocTyaWQ2yYf4Blyb6CIC3m8x9QDg6SR?=
 =?us-ascii?Q?cTq3MW6sg1Hb+YQyIevowoR3UKyuw1Wq33xby7urOPbBfE105lwJi7V0Y87A?=
 =?us-ascii?Q?tuLLwquu2gMudsF2qR0y0dsbIMUFIY/L6j6YN0azDpBIK2UapIQhdWLwneou?=
 =?us-ascii?Q?RgU3TRBnKEH9snijsek3clUA9Qo8b5aGdjy/MUj0bQXg2keil59NvFV8tm2h?=
 =?us-ascii?Q?xFn0LmXMj1SJdvr5/r4siq5BJi85wCTqdkk+cWaIBMrOQkJ9kWlkhKnJUFnr?=
 =?us-ascii?Q?l0j17WyEx8T602OZP1qLiTeXZZZCYpfLdi1AJgSzipLYkjz2brZFjfLpo4u0?=
 =?us-ascii?Q?Hd6qdTCGcBPBPgG21RvCiy+8i2C7xJveSxClXvYE3tQoY9uu3jx5ep56HyBw?=
 =?us-ascii?Q?Zo+Ez9VatyOq+PnWbuohBeERtj22ZZ4gNElqyaH2krPt6IG7ej7dKbXLbMMh?=
 =?us-ascii?Q?B11ajYIysgPU7PwULT4VTir6oy9cIfpqSiGYYA67jVnbC9WO4n6zUeUYWD3P?=
 =?us-ascii?Q?xw7SuFfdVs0cOqil7qBAFFu6VaEmdjF87itWqWrlsCQOCXCWFPkBPhNiU7mm?=
 =?us-ascii?Q?1ig0XL50lMtJu0HdYUntL6TgcRglkGwC482o27C68Tv3iLpUu2hCwcISJ2S/?=
 =?us-ascii?Q?joSFhZDT6amVPk03p20KPIEriPewfO/PfIhBQOTz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f8c61a-8be8-4a79-ad5f-08ddafa19275
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:24:24.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6rN7aHmmj6MOU5r6C9wQqBfEtA8yEbV4KF/5nekSIHzmy9aTAxvGhR6IROL5xI5LhB5YDJW5IFLB3ntjPDMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
in simple-mfd") pointed out that it's a mistake for a child device of
a simple MFD device to depend on the simple MFD device's clock resources.
fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as the CSR node's
compatible strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml
to replace the wrong compatible strings which include "simple-mfd" and
"fsl,imx8qxp-mipi-lvds-csr".  Since fsl,imx8qxp-pixel-link-msi-bus.yaml
as the last user of the CSR compatible strings no longer uses them, it's
safe to remove the fsl,imx8qxp-csr.yaml binding documentation.

Fixes: 9b2c55b5403f ("dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding")
Fixes: c08645ea215c ("dt-bindings: bus: Add Freescale i.MX8qxp pixel link MSI bus binding")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Mention it's safe to remove fsl,imx8qxp-csr.yaml in commit message. (Frank)

 .../bus/fsl,imx8qxp-pixel-link-msi-bus.yaml   |   7 +-
 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ------------------
 2 files changed, 5 insertions(+), 194 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
index 7e1ffc551046..4adbb7afa889 100644
--- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
@@ -103,11 +103,14 @@ examples:
         clock-names = "msi", "ahb";
         power-domains = <&pd IMX_SC_R_DC_0>;
 
-        syscon@56221000 {
-            compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+        bus@56221000 {
+            compatible = "simple-pm-bus", "syscon";
             reg = <0x56221000 0x1000>;
             clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
             clock-names = "ipg";
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
 
             pxl2dpi {
                 compatible = "fsl,imx8qxp-pxl2dpi";
diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
deleted file mode 100644
index 20067002cc4a..000000000000
--- a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
+++ /dev/null
@@ -1,192 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Freescale i.MX8qm/qxp Control and Status Registers Module
-
-maintainers:
-  - Liu Ying <victor.liu@nxp.com>
-
-description: |
-  As a system controller, the Freescale i.MX8qm/qxp Control and Status
-  Registers(CSR) module represents a set of miscellaneous registers of a
-  specific subsystem.  It may provide control and/or status report interfaces
-  to a mix of standalone hardware devices within that subsystem.  One typical
-  use-case is for some other nodes to acquire a reference to the syscon node
-  by phandle, and the other typical use-case is that the operating system
-  should consider all subnodes of the CSR module as separate child devices.
-
-properties:
-  $nodename:
-    pattern: "^syscon@[0-9a-f]+$"
-
-  compatible:
-    items:
-      - enum:
-          - fsl,imx8qxp-mipi-lvds-csr
-          - fsl,imx8qm-lvds-csr
-      - const: syscon
-      - const: simple-mfd
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    maxItems: 1
-
-  clock-names:
-    const: ipg
-
-patternProperties:
-  "^(ldb|phy|pxl2dpi)$":
-    type: object
-    description: The possible child devices of the CSR module.
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: fsl,imx8qxp-mipi-lvds-csr
-    then:
-      required:
-        - pxl2dpi
-        - ldb
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: fsl,imx8qm-lvds-csr
-    then:
-      required:
-        - phy
-        - ldb
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/imx8-lpcg.h>
-    #include <dt-bindings/firmware/imx/rsrc.h>
-    mipi_lvds_0_csr: syscon@56221000 {
-        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
-        reg = <0x56221000 0x1000>;
-        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
-        clock-names = "ipg";
-
-        mipi_lvds_0_pxl2dpi: pxl2dpi {
-            compatible = "fsl,imx8qxp-pxl2dpi";
-            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
-            power-domains = <&pd IMX_SC_R_MIPI_0>;
-
-            ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                port@0 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    reg = <0>;
-
-                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
-                        reg = <0>;
-                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
-                    };
-
-                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
-                        reg = <1>;
-                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
-                    };
-                };
-
-                port@1 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    reg = <1>;
-
-                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
-                        reg = <0>;
-                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
-                    };
-
-                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
-                        reg = <1>;
-                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
-                    };
-                };
-            };
-        };
-
-        mipi_lvds_0_ldb: ldb {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            compatible = "fsl,imx8qxp-ldb";
-            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
-                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
-            clock-names = "pixel", "bypass";
-            power-domains = <&pd IMX_SC_R_LVDS_0>;
-
-            channel@0 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                reg = <0>;
-                phys = <&mipi_lvds_0_phy>;
-                phy-names = "lvds_phy";
-
-                port@0 {
-                    reg = <0>;
-
-                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
-                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
-                    };
-                };
-
-                port@1 {
-                    reg = <1>;
-
-                    /* ... */
-                };
-            };
-
-            channel@1 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                reg = <1>;
-                phys = <&mipi_lvds_0_phy>;
-                phy-names = "lvds_phy";
-
-                port@0 {
-                    reg = <0>;
-
-                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
-                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
-                    };
-                };
-
-                port@1 {
-                    reg = <1>;
-
-                    /* ... */
-                };
-            };
-        };
-    };
-
-    mipi_lvds_0_phy: phy@56228300 {
-        compatible = "fsl,imx8qxp-mipi-dphy";
-        reg = <0x56228300 0x100>;
-        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
-        clock-names = "phy_ref";
-        #phy-cells = <0>;
-        fsl,syscon = <&mipi_lvds_0_csr>;
-        power-domains = <&pd IMX_SC_R_MIPI_0>;
-    };
-- 
2.34.1

