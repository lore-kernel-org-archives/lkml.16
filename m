Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F42F2343;
	Tue, 17 Jun 2025 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175571; cv=fail; b=iUCLTCnoUVGUgHAkos1/Tf/9wYCDTfohu+Fu69ztpsuQqnBKch547E9K7tAVd3b4WM204/AjyYUnVI3tvCFDdq2pGSM49NuryiJDIp4qjYVYntSOezfoencVUZRTEo0y/Nm9wuvRP8wsrK5eXwNY5py0XJO3QlVC7oHt3b5TDIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175571; c=relaxed/simple;
	bh=lEBol8710ZpJ0f3abJodCXrszpzTDj2GhCmSvoWwtQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z4tP0OCUqTNfW3WmsJ8oWx/Ss2+QsFfcNfs5tjgw9Kms//1G/MuhzQrKd4FTS2ndby6KEtvwkV1Qu6+tRDmmB0Lx3U4iCq1Vg/2hP9/dzT8G1R4soEWysP1U6zwq44GLhQN6K0dB6jtX7+THTXdGbblxbANqbj3k8GKmg9ZtEgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C7NgZDc6; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C7NgZDc6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBRWPYRRn2fSa99Z1XlLxnRwHmQGh2IbUOmPRVX4z4RRhY+hNP+UPpPlIBOgJUM6DZrtOcktcoiFGzt2MZU0BGj6Ej19+HT4VtywqggNw64Og0aMz166r2piJ7eAP8vMgil9yejMr5Vg+VT2FNgBMkRfRurJeXFTzi9cnPdjCepAA76QRz5mpsbdx0zVQXv1AjouS6m8L5D09WSJaoTAnv1pfN16nIR743jUmoeM2gc0cMqT3H4GCy7o1GbH490Ni8eipdFTI+q8d+MqAcaml0Vy1paSGWPLpafGkHxBF5RjTIyeZCFIc785MuDCHm9NC/TICmhNSQs6mCJjL0PsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4xYxJkiCehEqp1gBa0wDge8tbaG6db973aIhfqFxgg=;
 b=L0rEoZEbUn1wW1pHZJTnevGehL97FV35CBjxodXuwnMcRhK1U74bBcBDO1W3i5zjOPbt+8Us7G4AjiVsusLLKkArh4t9NO9ZZHdiHrCbFfpyRS5rA4qlJf2fD6NXBb+NhLiQSwQEdEzrTPc4JK4zhD3sZ3x9kznppi7DWkv+ZCSqf50z5WEcY+WTCStxzGB6vN3oOSNvgtJpnWNGWw/pPBmk7lQ8opxFIQWgqsMQRRbkyBomkkobGwljeA4Mz9ECBynKFuofEK61QlJPoDLACbp1NtAsFuggUtGFMD8MdpQvy7GD/MIzl803PytDQlwu3Ng3ZPkmBWiylH7jnsajOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4xYxJkiCehEqp1gBa0wDge8tbaG6db973aIhfqFxgg=;
 b=C7NgZDc6unHpcj1yLle0s/VnyznejSDc/EW0ta85yNoQWY7qb9Si8A8Tm+//W5BKK9XVqVXrCjQEMiA6BUtoAdDo19TlkrA6xKjJVvGHUS5JQIH3z7yvL+BevtiuAHOpI2F3EkBrgnmVy5NqTVImBZR2o3LgzuQKD6umQLOPbtkHL/il41oBMDpFS+kvtuSDi18GAyXC/8dg5mUkIt1qSkGjQvswJULcQ+j2wgzfTueucmZHo1sWhSIdzCoi7OmWM57gidWffBl5b8Gl0qqmztLLeuI42mTgjr9AO02inwXDmR2lw37Wiky0yWlGRVIVrNRIGJhuDUPXkjRDYM6yPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6946.eurprd04.prod.outlook.com (2603:10a6:208:186::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 15:52:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:52:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: soc: add vf610 reboot syscon controller
Date: Tue, 17 Jun 2025 11:52:30 -0400
Message-Id: <20250617155231.2023977-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 1178bd8a-ea06-4131-11fb-08ddadb700f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nrN6iagT5ZZo1xSCoUL+XbPmtxmTNlRKuILNp6Z3apcOEZzEbrFOTH/JpLCC?=
 =?us-ascii?Q?HqSN34DOF07EfJMVhcAhFkOHLXJ1NQ5n9cnbjCLWFSbf41uaLVjuNds1/TfA?=
 =?us-ascii?Q?ef3jo0BjjL1WsDxSsxgC1UDAPraE4i10kLcmitH68Mn9WB2jsHpXw3gh9YsI?=
 =?us-ascii?Q?aJHg4V/L2vzNEIIo5LqrAWuyRtQfulzhRleR6tzO4FcBdClm+MAt3g65ho9K?=
 =?us-ascii?Q?+bnGXdTNlB3CoUOQJXC3zKYUN+iIL1XKdfandMvBVVWlWyDZk5gIhjBf4W7/?=
 =?us-ascii?Q?52AbSp2KhMyOMWQs7i6kvIvE9jcBTuUL1zFHN94lLy0wfWUyR2ALwipGQmgS?=
 =?us-ascii?Q?FWQtW903xkaTMBlWPOeEqOM7oAADWEnuNUyAA4ZJgonOyiQpneWgLSnzkqpe?=
 =?us-ascii?Q?ZPa44w12IX4QlBcknEZSmP3ZtMBeRM31Ms9F3nikKGOGdM1vdhxJTLSs7aR/?=
 =?us-ascii?Q?5Xn0rylox6LSnURN6apvNNsF1r7+NEF5U4lawORsXzSNLev/c2SjDIE/SxPV?=
 =?us-ascii?Q?UfhN0GNaJTQag03AjIGAdGOJmLKe8nNOmr291R0nwELmiyrCkYplL4XVZXZz?=
 =?us-ascii?Q?SfI6XdgD+M7BnPkirSSzJn2gry7VTg/1OPVQ+qN18OzZGHsgFbHpi5lUQ6Hd?=
 =?us-ascii?Q?FtIyrryugpZTFUmw0XzPezbZXY6EqVOp+ioldm71MaWKXW5pKvdZ6GnCo50D?=
 =?us-ascii?Q?Vv80Xo2Fb5NIn9UDjD/AuxIzzpNFZaqdvQ5HKK5jolEGGRfPs46wwEceSuXT?=
 =?us-ascii?Q?ida8NNB4tzdRiFBWHxWITsrWlhhQ3pV5CHL/LLjvPNsCECMK6bcvmFL1Jvf4?=
 =?us-ascii?Q?e39/ds/P2FvY0gL3pyUNcdYJZRJ3e2WSWqoqu6TqxZS0E4Flhh4rKohrYky0?=
 =?us-ascii?Q?LQCjj1wQwhK6BBWMZOC/Vi6gm1N4UW7DdkhfU+FMt9qqTs2PY0oSmMP6P8Ku?=
 =?us-ascii?Q?fwPAj+oTHXjowg6LSbFbI6//9261/vpb5cZQfcVmtaV5sob4eTJVR32fF8lj?=
 =?us-ascii?Q?a2XZjMyApj9sOa58rqUcNQklnpxw8pOIF3Sx94zVAYStwwc2M0sXoxbFqKk5?=
 =?us-ascii?Q?EvX9izsd6pdsuUFdwdbkv86jEGdPUxlN4DCzEVITMJ2tM2PZdcFBAOjR/Krk?=
 =?us-ascii?Q?mm2YsirL+rbxB6jHGCZKRd7W1NCE5ECDoLK4HB2L5EBZOSqnN0TBpjV50330?=
 =?us-ascii?Q?zmjwaAdlBjOfO38ycYzNWvYXB+Q0LB66wXLzCsjCf3On3/jFMasf/RL5Kxfb?=
 =?us-ascii?Q?s30gONG7XuSKv1UBAnGnB2Z5jbWpg/TgK6U/QlfuN5Cum9F6QbPjb+MVWcBM?=
 =?us-ascii?Q?adW5XTGjuhPH7Fz4upsvKuEZL3jFlEkqEB1gBfOLMcKSTBlYibn5lXJG+rqn?=
 =?us-ascii?Q?Ryhl5c9x0VijYRkVQfGQT8zRqf0ELs8i0LOSKL/alfxkQrnBxEvlbzu2fMHh?=
 =?us-ascii?Q?4WINz2DprsG+auspDj92XROMwuxQAbhF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ycCIu096MOJMCP/95dViIi7zJktX2tvo8LxGfNwTEO8iX4Jcr8tDTex2u7L?=
 =?us-ascii?Q?91ljOIz2gz5KrCGnVkmUEP3AgSbZMeFdcSZppwjakTtQwvAmXjTxVjZ/cwvm?=
 =?us-ascii?Q?LEd5tSNUBRtBP/I5nYb2QVS7EurshQDSeO5Phi+J1Dmubfm4Qll/nidE+Q8N?=
 =?us-ascii?Q?n4T2vjBW0AWdo+zuR3wgFOj9JKV7+qHqeLq8fPHRSIVmuIrfWQqFJHpr2uvf?=
 =?us-ascii?Q?XQtIq0DyE5pXmGWe/YeKizmaPxzkegkpkCEcnWEhi6QaLIykIYBzointd8Zn?=
 =?us-ascii?Q?R3k5Jde8XS8K998pBIIhNGSY8nmoXOMcKd1Lvn/c6Ieix+mVSMfz90NFxB1r?=
 =?us-ascii?Q?bbPAVq4y/rx3Xn6Q85boeeaS54GgyQc8t6shWWECtsAWsbBQFteaY/BfvRyO?=
 =?us-ascii?Q?zjilhj01HeLxyWvm+rt18fSck7+lfx6arcI0q4BLjbTxzBVv6Bgw0uRe+ecy?=
 =?us-ascii?Q?se4UcII5Cxw7gwC3qzIVNe9pP1ittWr+SLYK468eA7/gjy6btZuwwTaD8yrB?=
 =?us-ascii?Q?aSkpJ+Yk564XERt/cAVr/BRpwaz9sROjynCLePwp8WIsziG8XyXJo/qF+dF7?=
 =?us-ascii?Q?NFsSawuotSc4tXAEd3Xfu3m5MyTsrextBTB6sS0TiIqVYkVgFdVy8bTAF16i?=
 =?us-ascii?Q?lwMqGG6QN5rlCs8B5skRVwwpZ6HQgQwyvJpP4oaeJchtVkOBaLQwTJeEE55e?=
 =?us-ascii?Q?kqiGb9gksf31zo6mx9SGIDw2B5OHa/HXEhz6oRFYcCW/TZ3JSnQeE//JTKoh?=
 =?us-ascii?Q?4CSoYtuTT7Z2AS/a6d55oXhikAAt0vetfkMf/OcLFzT0idoI71NP40qGLwkm?=
 =?us-ascii?Q?YE8tPLS9WfLVWSA6BpLph6PJ+pi8vlQAeM3+Rli5ALNz+V1BWnyGl6BdF/pA?=
 =?us-ascii?Q?jMa2J3krkHaKGU+v43eTqHWXdjKHGQHWxnRrUPFBZ7ZPaR/xBltS08q3w3sC?=
 =?us-ascii?Q?2YfPk5pYDJ2cetG+eJEJlblVmpK6tscPnByOhdyLVsUzKl520UxrmFVj/wHo?=
 =?us-ascii?Q?iv83uoz04wo7ehP97CJhdCulYPKJ//fA9pi249vZzE7R7G9kzl2kOZj4uNpl?=
 =?us-ascii?Q?4EgItW6+GsetMmKt4a6AurBjWuN7zOeeSn4RmuuytydtIqs/7yF9wjJExE3j?=
 =?us-ascii?Q?1flp+XSIHQ5uAbRCHxlUhPjWPnyxLG0qSDBkmZWzqvydbHHNSQATXuuwfJlU?=
 =?us-ascii?Q?Q2c0JYW1j8dN5fkdneMHvryy3h92T3416ZzLUyPJdlpwaqLlK6Qb7fy6UDzi?=
 =?us-ascii?Q?qGMizYkeZKFS1XIrCE7aRN/z/dSN4v5QXYdUGtGKL1ZUOJ8WJUq89GVIhmjW?=
 =?us-ascii?Q?4TT7+DcR8LXvXJFD7/MCBw6JQdT06gFk+nxe6XkZfpvXT6nFO3LKnWvy2d/e?=
 =?us-ascii?Q?yPjJtz2KvdXB2yZ25TnVTvUObpGWBb4wSZeNqUXET3Zarg+jKv8v1qsNcmJd?=
 =?us-ascii?Q?03e1WLG3DmoqFf00aI6GQcHuBRFUmHuaM+A5CCmxgYbglS+ggUKKDyuMIYYN?=
 =?us-ascii?Q?wjGXnACffV6JpMHfGRlxxCEe14pz9VyPPxaCAiRt3kwW3pkfFalSobZ1Mv4L?=
 =?us-ascii?Q?xV25/S69LQzRWGFEGdOjmU1QGUOZHSmaoMe46Rez?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1178bd8a-ea06-4131-11fb-08ddadb700f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:52:46.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o8Lmb8UdGu0mx1Y42mWB6lc4F2a9Qxn1vHi5qsXrsFqjsxlx6K1O6M6s23tHCoLN1AM17Wa4zq7iyqJJVQojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6946

Add vf610 reboot controller, which used to reboot whole system. Fix below
CHECK_DTB warnings:

arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
    failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']

IC reference manual call it as system reset controller(SRC), but it is not
module as linux reset controller, which used to reset individual device.
SRC work as reboot controller, which reboot whole system. It provides a
syscon interface to syscon-reboot.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- change description to avoid confuse about reset controller.
- it is legacy device, more than 10 year. So try keep existed dts as it.
---
 .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
new file mode 100644
index 0000000000000..cb8aa510a21f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale vf610 System Reset Controller (SRC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  IC reference manual call it as SRC, but it is not module as linux reset
+  controller, which used to reset individual device. SRC work as reboot
+  controller, which reboot whole system. It provide a syscon interface to
+  syscon-reboot.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,vf610-src
+      - const: syscon
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    syscon@4006e000 {
+        compatible = "fsl,vf610-src", "syscon";
+        reg = <0x4006e000 0x1000>;
+        interrupts = <96 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
-- 
2.34.1

