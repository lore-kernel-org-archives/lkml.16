Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EED2AD00;
	Wed, 28 May 2025 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457371; cv=fail; b=IjydcgGMxy8jS2PjNigLRwFWA6VC5wuiU1+4vqfOpVJc09O9+Jir+q7jULsuwQvXD6rZblyavwvaQ3mPnHnVrLf2mx21JTaoCCKvaJsh21a9W/vbSV73vhPOfdzD7C7lSEr4QTb/sOXTLWe8BG7z6z1gksEKnoNqyE2OSM6Rvmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457371; c=relaxed/simple;
	bh=9lfWmqdeKdWKQSUUw3Xt+wdGUey2H/vV21OA9P8TpaU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eVVwS8IbyV83Fb4PKFSjd0iwbrzsGGiCWgD+XOXoYD0OsquToLtfo/Wgb+xF5lXlrtjuFRF74LLsBF/+vK+Xq5/2vjKnNjzzUcrd9W1DEiyjgcwW2V0j3iJJ1fPmNdO0OmkvXSfwDZXvrbnfuUyPJqtA4r7E9em2hB2diiBMfsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l9LaOCz7; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l9LaOCz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR1sEqPQ2Xw/Ri9jAHEAQtXQsfmiRaavWpT7DUUD9CUOSJ1sk83QFces5R7tPGtW6clhZRZoNP3guZpy00fViQJ7e9munWKNdUiyXYpApXpfmQy7/VHeShnLwrgCWDv9DB/girxB3xi932bYLm3Xb7NZaLAg8RvPrF71XVcOZUchgC4a/J++03e5+VMgvfo4mZ4io68q2X7sQ9OWpUOK5zEmpdZCWOo3rrpFfPZTeHeu+l453XTPcGF6KaWyo3+HRrlIIG3R7dG4Cc+WCg2pPqdKnYGGt2iGba8L0U5sHlqJAbOOk0WQHBdo4nhiEWB9kG19fGd/uWzTVK5oc97+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlT4lXXXLoiE3qAKFOidzSRR+dXCGrkIesfiqB226vw=;
 b=fPGXhDf/E+aZcfLqNsYWmxSSZFQUTbfg94iwI8jUuV226jvPQoCUkZDxk+zkS+ZeUPBP4JmhdXPy2DWr9ewjqXiEK59i0J9zQZVHfQwBdBh8srSZKHaj2wpjowDS8PwLs7ehj7YXqpIM+opXtb+trTKArWHnHm8JoGxQQIU46B7ItqiXMcV9o9z9Ks/UpcnZov/ilY94xMmtx/VEoAD6WSuCZb2sL6a2vDmFWvyi8Wtpi+J76nUuH9A6GU2xFPdPHOkZG7okVLQBoIXTHczD9poW4H8yZbdtx/9LHzf+gV48eTXt/YGbYMZHBHEjpVJnUz7EkiVJhCnRew3JPfPrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlT4lXXXLoiE3qAKFOidzSRR+dXCGrkIesfiqB226vw=;
 b=l9LaOCz7At3PXoPKpjLbKqYNmcf6yvJ5isbfxXH7XggqL0iNaWCXvfU7/JWpMS9qRoXB3kjVHBKmKG5enzmSC9h/Q0QbQ9NcmIU3ow408qv6M8XM1xxjHj7vm3/HH8O/1dj0WoPH1n+mQF4O9KBlkySe6OLKXLsoeFs0xcqZEQp9+yfyNhGBlQV/jyIdLl9O7Vd1XOeX2ahHCkBlzcBTjkei1N+haroTJzn2Usp5W/Z/ZjEVlTe8OCZV4hOZiXL0ln6VPxthuZ5HFt6V1g6k6nFL2dW89g3mIuowF4hKMXMzvjV0mosNSLd5Qn7JHdJCD0B8Oc13flsPgjzEpOgZeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 18:36:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 18:36:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28
Date: Wed, 28 May 2025 14:35:48 -0400
Message-Id: <20250528183549.694434-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: ea182c1d-945a-4168-30b6-08dd9e1680e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nMWD15kfxzSq+1Ii4iy67C3S1V9B+//eeiL0WQERti9u6Qbrkf5DG8ORo8gX?=
 =?us-ascii?Q?7U5vjr8Q0cYw9z1z0dqXScfavFeyskbcxOznHch4zS8zdWEmCrhAeGdSiypm?=
 =?us-ascii?Q?xv5YuOArnE5Yt+9sB43ubYimZwHpv1yYDpAGJKA3KcLZ7Q3jCJnGDnfk1EW/?=
 =?us-ascii?Q?P13DDzzoOSXFbclWCMg5EsGMiGqQjKv3U8jLP887q0XJogkHxyUWHWVP1CSF?=
 =?us-ascii?Q?Mp/RtoxrRC4qnDI3cd/ydfBmWfyclNB/CH0ngVs9WKGs24PesngGr5lgxhA8?=
 =?us-ascii?Q?7z5wwlL77wIf7T5vw3ddTyogV4YyWlSu4Wuo7jADKdSuZJU059NrN+P1Y14h?=
 =?us-ascii?Q?7sZFEzRSj5UyQKm7i4wshJEYZNXVXQURFbxn6EtyW7jsPF7mqNoyoOgeGMuV?=
 =?us-ascii?Q?6bpMVsHCkS8Fn/06LueKGeV20jASxkkEhaBqNPDmBANPhZtyeYWT6brMY12b?=
 =?us-ascii?Q?D0Qpb8ZDDUmplGh/f05ha6WpfPHuOLFgxMhdWXftA+Mi3UNCbkSKPhgNCXvc?=
 =?us-ascii?Q?snQFROjh6GJriXNhvzBLRojz7gtR48O8upR2THn/rJrDglMvtmTqG1OEnkS0?=
 =?us-ascii?Q?Km1grAR4zucDrbvKr92eHvJohq5r9NiG8jITIvZbNo/TsCZvIz2G60Pyx/A+?=
 =?us-ascii?Q?EBAv+O35o4dlE0dvS9P9iGIT6IywXMo5xlEJQ5A05Vpba8nX1n2TDVqTz9Uz?=
 =?us-ascii?Q?Te33MtmARjQEwFvlImmJar9narECpFf7RncdGw5tX285B4QXe8kfQLDdwvqS?=
 =?us-ascii?Q?rptDnsjkie7pkwWqxje0ZzLY211V9ADEghS0buV2ZZcvmwmHnVQaSeinRIGy?=
 =?us-ascii?Q?Krybh+xpdUnSfItSLLKZy6ch+x0nQP93XIjS6IXI2Q9pmq7yLue2bSPRoyox?=
 =?us-ascii?Q?nywsG2JYNVy/LSbDwT3xFw9EgPQ/+3I3HEYbDWO2GXmeIVrDtc222XwBe1kZ?=
 =?us-ascii?Q?ryA20oc+HZWP8TILF4ExFQsG3urixydWbotESWKNGMIRQoYlw09LUc5CuNli?=
 =?us-ascii?Q?G9durFx2YgZPDpPDiH4E7CdW2wHP6swv8L7M2o5YUWXbHx8zBmprQ/cLSWe1?=
 =?us-ascii?Q?uiPdmCamq9+lTDJFvrzuXmHgcJN9CckBFjtejGwSDHtYgKfqwGtxvt2eABeQ?=
 =?us-ascii?Q?aVNRNHKJICSUTlhn7O/oQ3+J8WEBDtgbDdzzxkx+rH6vLTOq89ZG+rgH4pzZ?=
 =?us-ascii?Q?OMb4cFVusWMqM+lL8vArErZGdn3P9lqV8QRfJtsX+VnzEYcdblg/U26FZbu9?=
 =?us-ascii?Q?UOQm0A2YlTMsbl81lh/toFKzl1vnVdCfhuJ0e2ixkc1OB2qzYusQlFiHrUTr?=
 =?us-ascii?Q?5T8V8SXYNBxm+2MEO2d9+4tnwODwTeBTkSRFqs18SOm85rpNLc4kbVpwZfrs?=
 =?us-ascii?Q?3KLtwUkvFCrWFTPw0PntZvr0DQdrGop5mRvqm8qOvOwJMTWQ+gIhMAutnx0d?=
 =?us-ascii?Q?7bBE40clgEaRyZNXh4rZtKxWWFPNXGixjEpQ3nU7UR+SXttBahmfcw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3obKLU4A7+lZNDZxCwGrQsa+O7jB8QfdcwHqpibm5HgY/ghcXMElhp7btZAH?=
 =?us-ascii?Q?lCrFqfKOxxvBWryp+IpcLiCPavU1wGx6vU712TC0JQBZAJs5QBh7FQdeVFfq?=
 =?us-ascii?Q?JrSiP/Ov6lbMdy1wET6cBb4IksCkQbABNJ5GNUkRGoIYQJatXnqNo8N4k1dU?=
 =?us-ascii?Q?ysbv17O3f0cqGTdFOK89tStYrVsrSKBocQDFUlp3/zlGPYtOiRe9fs8X8BFa?=
 =?us-ascii?Q?u5JJNmAfUcjt0xwYPNSTFmz2QJbiM0TX+o7oKxIUY6iRRrOw2GBuea/7NzRk?=
 =?us-ascii?Q?s4FuVrWcvAZ9A1zWmgKPNK0mF1hgm7MnS6Uxo+rbHvxoSsy7tNL4JGjDBWqt?=
 =?us-ascii?Q?7nPySmfbmKSWHHeKZyu6SYUlcXWYLunBnuTzS2VblPAp1UbkyZro6lq9FBf9?=
 =?us-ascii?Q?nzi0uuza4wTKjVx8+rMOfSBS6MEeCDD14e21PTIvknHi859gk8qtnH9yRopC?=
 =?us-ascii?Q?AUNORvIsGA1GO57mEhq3n6XyZAsmqdS1UeIgAzuPosoiaUnndzCX938frFzr?=
 =?us-ascii?Q?pKvGgPUzr3BHyVnGpIf2amrGUt0NNzJ7E8jKWsNgChUPbPh7668SMHXhKMx/?=
 =?us-ascii?Q?cwPjV4rzJwDngK/ZZvutst2dAWWEAL1afSXvL/3NsEsT5uwAF9YKyTkAfHei?=
 =?us-ascii?Q?EzvdUazYb1LJ9/Oie2N9L/iVsUjqE7jEjPW5kLw/MhbfonDkaGmGXAQUbA3P?=
 =?us-ascii?Q?2ldyTbJUDiCl4CbiprzzT+h1xGPhL99mYnACSnL3gmFzylI+kdcMNHQQrGNC?=
 =?us-ascii?Q?E6jDr/End7ahucr2DgNTsL3Ms7lzMBMdAZw9ADHUFNXqVsy5Ybn7qpFvzEgD?=
 =?us-ascii?Q?2h3PlfPe8kSuwCxUIZ2cQU4U9MRi/xaXREAklRD/TRPM4SbcfYRIs7gnn+bf?=
 =?us-ascii?Q?9pXAW4WVTvG9A4a/ibEngmM5wEdHw0UPW6A6b4aXjgemy3GJuQ3LT3oiBYEU?=
 =?us-ascii?Q?D+L8rhvYq3tCog2xnMk3X4A6BUvDBhcQTiCEA9MUpLhbhXbqjs0xsw8rZ7Lx?=
 =?us-ascii?Q?6WREPsbVcvAXb1Sfq8K2+qPi/Pr3z/vegSTfgXoIASOJGLm1ONunGvjhL0ij?=
 =?us-ascii?Q?JS19BqkOI9LAV+xQSLQMfcw//xGs8IDm6Ke8gMykWpxfYChiYVSTejWpRTKB?=
 =?us-ascii?Q?JAgh8mvROv3NW7thCwnbJqIa8+M9HEKElEslZM7jTPxjalnF2J2SV15fA9pR?=
 =?us-ascii?Q?7yBMWlfriukWeRDaxKFnr/9mlJ58WvNrlmG/S8obqHfyJl31hFnAAoBJSfTL?=
 =?us-ascii?Q?nu0LTSQqZn+jaqqL3eO++7jB7fr05TWW3xuzXACM+ZwyXUexhW37QUEEjlMu?=
 =?us-ascii?Q?sTpdeS/OEt47iMFZCbmuZKlKoi68GUKeOM6GSqeRCds/CVmKRGtz5NgF5+K1?=
 =?us-ascii?Q?34rSjjocOFqBGZqE9l1pGJ74WMNyMmV+QiVKnZgt0PpaFFE84Lb4q3aCilm/?=
 =?us-ascii?Q?adkv9yB2N30vnLiAKHY5umguhViIyci3N2qTJHM9UDFbUyo8/F/JP5amsJEZ?=
 =?us-ascii?Q?OyqII1s0pzJntjgeYMfl4hDZ4Xf/F6Y0nSkKaz26bipgyCMOjo9sFm+QPU7z?=
 =?us-ascii?Q?faMJm6dogZtz/ZJmtUBs/fL/pcNrU7LwxQsF2R3H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea182c1d-945a-4168-30b6-08dd9e1680e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 18:36:04.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiLVEvpNsojlmwHImSIiYdMdo+cz72GsA5T/BzGn/kK+tojVxLWXMhUWPsR3D5F6iZoe3+wxPJc4eKBxJ27Ifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
warning:

arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000:
    failed to match any schema with compatible: ['fsl,imx23-digctl']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add more description about digctrl hardware module
- fix double /
---
 .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
new file mode 100644
index 0000000000000..3de135a70579a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,imx23-digctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale mxs digctrl for i.MX23/i.MX28
+
+description: |
+  The digital control block provides overall control of various items within
+  the top digital block of the chip, including:
+    - Default first-level page table (DFLPT) controls
+    - HCLK performance counter
+    - Free-running microseconds counter
+    - Entropy control
+    - BIST controls for ARM Core and On-Chip RAM
+    - Chip Revision register
+    - USB loop back congtrol
+    - Other miscellaneous controls
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx28-digctl
+          - const: fsl,imx23-digctl
+      - const: fsl,imx23-digctl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    digctl@8001c000 {
+        compatible = "fsl,imx28-digctl", "fsl,imx23-digctl";
+        reg = <0x8001c000 0x2000>;
+        interrupts = <89>;
+    };
+
-- 
2.34.1

