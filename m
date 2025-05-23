Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F37482;
	Fri, 23 May 2025 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748033146; cv=fail; b=jl1uUW+Xh/nFCnhQ05xJR5VBB2hUNRO5FbdDLpBcguLfQU4tbqQ3+AVvDlRMKK5onRUToTyBMa3niKYJLaBEorZgKCADsLGYMkZCBGQ5mJKGsKcCeSl0nQkd2eqDWLveINTw8jWA+PQyWiqWlWkawyFraEXj7QtI5sAilDkfDN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748033146; c=relaxed/simple;
	bh=apAuHHWTjXf3iKGRjuYxsMlZ6lEZY0d4Y+qTYCkxyt4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sl6hmsFry+Na7E+sjgiIr1eUFzF3wWsCgXZLrxae/p/f5BvEDGyJ5ocp6hEznAKs5z1JEHnBEURyaK3UzR8ClWKB3u2GfmZWoL0H+mpxYpQwktCebLXIXbERV3zN5fa3H2zfto21RBHd74xyyzkqdlw1h20BznqQYsw+ZADmWA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j39UCckc; arc=fail smtp.client-ip=40.107.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j39UCckc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd84LfZi6rINN8OK4mJqLc30dvLFxnXO2FiuNXg4JoHTTmIdAQX1NRAlWzW3t9yOSJ1RRWlmKUEJCUMHMWxthi+N2z6I73ZgB4ubPTuNO4+1gC5YchsDvZ72cAVlB6oZTACRoiRZJpDvJg9Bk7FEF1Hpjgr+Ykwc5aAXXh5G6Z+iwM0+bzAIr4JvicqBrB6TODvbP2t7F7QyVQAAy0Eqq0LtG6gnnYnE6KWBjLh19ZOMy/SxkoIrGBRnuNrwbz5/7Sgo3eUSsJiUyJgNxNMvNVTylyN6qm3KSD/9ITON+VdrJtmNTceF7wB8V8X+vb60KKexltBAUdnAxLRgwS9RMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBtfSlky47YpOZJQ0+zNDAHLKWhrFE+K+qgGWrB3EHQ=;
 b=nOydsPmHjClMpYx0WV7R4VasEx0cNmVSiC6x9T8p5OsTkAJ3Pl0ltj5bLVUEeg0GvTyAUyeSL04yhiQC1rtQcq6IKZ5tMYWRoFShOPJXcoJYB2Yxq7PHG9ZEB3KyWixkmIF5GRI6qM+dG0h9wdSCCGzMhsBqkdzFsOlTU4UT+xJlGvl+HZx9DPOltsmDT6xZgaYopm58dZQzROARACPKKP0Td0c/XZmQZ9Acf1K7JYJwS+xiaqqR9xMzcbMUSsyVkIamD+9RaKSDZMKX9LJyavOjcQWs5lOt+rh70Kyll5RFRbMM6Jy2kjvyx7frFHHb8YMReOT4J6ib1rPTmG1VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBtfSlky47YpOZJQ0+zNDAHLKWhrFE+K+qgGWrB3EHQ=;
 b=j39UCckcTzIRl2NzCZtFoXPj4Vww/3qwkH5oFBYicvpP6jRgF9HOac0mUkmyh/RJiu2ykTRAsjbjvCNU4kkAjLmZesoeuDSueHKmSGijT1TKOXxJJ9pxeWrU558dpOyOYoARqq+u1IrgSgyxFDKCbiwKGNSjuXQU9riRttmV3NDqKTf9Ng82I6MzO1zneuYOW0VwkOIEW2rzGpJkqbT+hKURhdINAr57by5X9d+16AUicPm9M4llnsOOKWVhkerUnOdj/gOYdM2+wnkd49aob3s1soyIfYmBB7yqTuOT68cA2xvmW8bT8lHbaJmLYAX+LpdTNnH8+ZFEyF997mWrUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8472.eurprd04.prod.outlook.com (2603:10a6:20b:417::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 20:45:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 20:45:40 +0000
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
Subject: [PATCH 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28
Date: Fri, 23 May 2025 16:45:23 -0400
Message-Id: <20250523204524.573028-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc8269f-3ceb-4b46-5060-08dd9a3ac7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+JvC6RL/VQg8uPyJdp/EApljtQ5w4f13Vb9MJH1BlNe3N3Lt7cIstFD+s8Uf?=
 =?us-ascii?Q?+L1k5/iyAEQUdjMghROUv7VZcK5kdCVgA7nBAxUOQLf3cK7Ivrsn6r1cYVhg?=
 =?us-ascii?Q?eD+IIaKSYcyf/IoEio0iF5p5Mu62AFjHdbSPYqVQ7H6RtP1+xExIGAt/6+Zq?=
 =?us-ascii?Q?sKsYZSRN/dFWxOE+ML7R+6ZYqTb9ZfMV+fslXX7ZPv9luJLiOljVpfaVnpwg?=
 =?us-ascii?Q?jknfWhd1jl5bUtkNifJ6cL877xqPDQOV4hRAmXIs+Jy5UJ5TaDj27zpC41OW?=
 =?us-ascii?Q?v6yiFc8FyuZS5ZyFT6eUaGdvqGDKHZWwoNMm5F0KWvRNU9W9aq13qxPjDEW6?=
 =?us-ascii?Q?cWpRaKTEhQ3jMrIQv8oTYuj+J2QmQyzM7aGJu9hPDib9op5qHIqyh8RHttYw?=
 =?us-ascii?Q?qMWTvRj32VnaAcANd2/mBzVrB3wdd6KPrRSIVkOc9Ko2WjGwH0GYqpIMk/Jf?=
 =?us-ascii?Q?XBauvBkqAHWKc0MXn+H+8GZnPo4gblwTU/7Os4Epu0pJrJ7kWNXCYIdfnygF?=
 =?us-ascii?Q?VMISYN/Ai5Y5DYPXkwNFVjnCEjTH9Q+7NCF5g7JCJ6webfCqqTnJf57XXR/k?=
 =?us-ascii?Q?19oA9D1NouCuaijHvVn73NTqTNNb52PJhUZfcyFiGnnf0zJmoDPE4iA0mNx3?=
 =?us-ascii?Q?DakP0pe/zk5fogQ+CwvEujhsqhXELSDnNSDgHWPDr7EZ3NL4K10fz9M+XTNZ?=
 =?us-ascii?Q?YpRjYuKu6SjqfpEo8K7n6cP17zqD3JuSByLy1iX82auwuk7up2uTTJ3og34Z?=
 =?us-ascii?Q?cqHJds970HrG1A8o1rT4ITfJEMY/YOCZ7SDQ9d7sTJfyUFsUMmacVVMiJ7rv?=
 =?us-ascii?Q?EwC2e9DYbMbUzKnQsw9/DkNIdokIlpHSiVKNyilRe72/Q3TOSwmizKAbCpQ0?=
 =?us-ascii?Q?jBM0cQOoojSGhRJfQv6Nib+qFIMhWb8E2an5tvI6SzTNzLVQ93JN3kCcbP1G?=
 =?us-ascii?Q?H+QhrUf1iuiVMGk3N4JR5B+W2T5dNdGEMETKza7aud26UaxIkGanvGiyaC3f?=
 =?us-ascii?Q?+VoRKkH1ZD1tTp2AgRoGRNJOO7HL++32x3+d/pwDSu18nqHYDWNZJNqP1aZM?=
 =?us-ascii?Q?d3fYcepj5/HaLaRMkXjCnWE6flI2ZK68ZHcSKesTF95ph9b83resoXeQgwqN?=
 =?us-ascii?Q?lHgB7uUznj5kkDrJhVQUUqZxmKW2F4Qp4QgWzibl4CbtZt1guaVk7T6H6hKF?=
 =?us-ascii?Q?hix+0UmrrmFoQ4MtCLWJIWSueaLykwahfVcd/bMqVcFOZOHkPRBbW+MBx1h1?=
 =?us-ascii?Q?XXM5XxROOZ8B7XfDmRqtzcdQcvD+U+qgQCjqIypzFkYsv72BUGziOFUHSoeQ?=
 =?us-ascii?Q?gIbb1Y9oVgICSNWrb8skWd6n/RDVJtd1sAL2Aq/SEIrv3BP42Gg7AHuYMICK?=
 =?us-ascii?Q?8xAYNYvmsw1hlOp0xXGdcvMX3ny9y3CSBbYJdi/MMdiFg6/pRrZ5qtEfE5lf?=
 =?us-ascii?Q?5TGg4TNrI2rYY/bcd3wWtENXAqursDkSCYKd0B+2d9siQTvcCoU/AA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TD7W2vnTdxVOEohvGVAXjfaeqj7xxSSpOujmEsCuBLCCVG1ikfLWVH7gjXoX?=
 =?us-ascii?Q?DzzMWvVN5/rxYK40LBtQIMvConpzxMfeDTJZv8ocKW+n+dkE4WAbAQPHT5Yf?=
 =?us-ascii?Q?0h29P+KLVMvTUJF1ctUKTQolz8HVXmR84MqcNBydDVpkl3ftatS7pXotD+ZJ?=
 =?us-ascii?Q?r3oIONo7C1/IpTy08gqiIiIPsOkK/6LRG+/yH+OS/kqOvg1QYMSBsdPneEiI?=
 =?us-ascii?Q?VTf3AaRxBHUVMSMyq5bJzipTjwxZntiBHBVggocP8kaZxunHGyeSkPcVt2Hq?=
 =?us-ascii?Q?5lrPD8uZorfNNaD/LasLxHPbldToNJGvtCcwJDHjSwceUYbPuWYTJQ03YbHG?=
 =?us-ascii?Q?tiwb9eWePmEAk2W0ak2a28zWh04xG4ONWm3GMTO561BNtb/CzX5DhykwskW0?=
 =?us-ascii?Q?xPsSUWZ1f8/V+esyTL79hIDSKYFtNp3McT2UdQkvHH0VDPtua86pM1uNC+z2?=
 =?us-ascii?Q?kOkW7byvKhWEKGtayVlh3Mj1Py8qf+h+n9PGk0ElOF6QYDfkdIANP25OPiXw?=
 =?us-ascii?Q?MlvTKmDVUj8DASV9DAt5c9MVUBPsnvaYG2r9u8e0w+47jsp6p69Q4bH6AVEa?=
 =?us-ascii?Q?oLJnafwIzG4wf2DJh+VA8QHJvSNhrCCUT8fH4UFgnbnzjHimO4ArwuIbqezg?=
 =?us-ascii?Q?lsCGFcWUX3hCOu+Ru1N0IxzP+f/m8Jtw2TjPZUWYW7PW5f0lJsr8pBEimCDr?=
 =?us-ascii?Q?5zq3v2hPGWyeBrFpAwCd5pxqm4DzwIhBZIx8vyI6ZVISu9ZVF0Wm1obPFXqj?=
 =?us-ascii?Q?nl7Vm2e+2mKgljg+mLoPQzN/8rMjgu+x2WaNkWUvhK7BwAxboIGra0zSMQR8?=
 =?us-ascii?Q?A4kxjtG9aVYYlaPauPTXvnHCgq87IIYp5ZIKrXRZFOIGS6tXoxC+uoJegS8V?=
 =?us-ascii?Q?IU9iqClOpRaUKwkDgUqdZFaMMBMo4BzSQNfWCNzruRI0b07husZ5hXC/1fRT?=
 =?us-ascii?Q?SenyjYBK49b8EHtNGK+28tViBgtZOudV+NgEnSrxyHYaBlXHOi97KLyssDoX?=
 =?us-ascii?Q?h77qPtX+jJcIcDErPtXJ881//GkInSvRJiYTxSyg1UQ3JTawwgDT3jUzYGNF?=
 =?us-ascii?Q?pe12D2ATY/mcNnsQEyBqbJ0xPuwV47nd87a+B/OzwUD7AthS/YuSUyZNSF+F?=
 =?us-ascii?Q?Rawm/FjMTmpxOwP52hOmcHUvGI1Kt7piJyyo2GhSwmjeyYK6CT4juhJK77I7?=
 =?us-ascii?Q?dBXacyPOkcOegQktdS/oneBW+a0SJ9h4S4QD3V9bsrEs66G41P6nf3ZIwKji?=
 =?us-ascii?Q?xTYuz1s0cOj3h7rWpzAzIzs+mIkBwUyNAgMOqb+pQgMs3+u1IiRP8CxBSyoT?=
 =?us-ascii?Q?qYpRcpw5gFnDGicjGwBN6RUHgE/SKSNlNi1vuOBC8fXTzZA2Y2z8HIaW8Njq?=
 =?us-ascii?Q?64KiK9EiCl5x/LD7AwaxCBMvHmDi//TKbphnKQVAuxZJbk2oWKvyR30xCzut?=
 =?us-ascii?Q?s7Jfsgjsy3WTF4kCTMpmxkvvt+jp0ooXK4ZsTd97BAovbia2BqLTZXLT+iBi?=
 =?us-ascii?Q?OxkhaOxuYZdGh42Nc+xqxcQZQBsxkSdxnFHBUWguoPbtUYr2CBhZvVi723V1?=
 =?us-ascii?Q?6n+64OJgJgkUa1tDTp0qXZo5u6jol7QM9t2Eyxcs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc8269f-3ceb-4b46-5060-08dd9a3ac7ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 20:45:40.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNrFqPB6BSICoXc259+KdDS9DaHwySitX5Ke+EEToaFU/eTApfjgK3e4sG68Pf5qi90eLZfG16KUsRJ/TGrrXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8472

Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
warning:

arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000:
    failed to match any schema with compatible: ['fsl,imx23-digctl']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
new file mode 100644
index 0000000000000..47f92f763bfa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas//soc/fsl/fsl,imx23-digctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale mxs digctrl for i.MX23/i.MX28
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

