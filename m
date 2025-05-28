Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A628D8DB;
	Wed, 28 May 2025 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748450854; cv=fail; b=ZF7xUBt86u13nKuP7M2YI0zn75/eGZimcRsKOma3CkwTL7Sgw7zqiVjgnpNE9frRyJkC3+ZkqHQht014Ec7zpPf1WtkKikn/c7sQxw17kGYnGCY0PZeoKKo0wGD/virNF16HgxXFXVO1lxw1fQcff2BaTi/FS+9vCZ2Mwjhd2CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748450854; c=relaxed/simple;
	bh=g3MQKkxIgCgHJywu5Pjcpunq0ZdANWBHM/thwC+NCzs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WnMGK4AYApPPqBR0G1LsMHKWlKxjy4Z9oFTfLt++lovDzpG4hNWRu9pqfMDekrcvTGtX/l5wXQv6Eb+qu+ZUJx/LkE2ZSzVwOeisYwNPfNhXZ3yc+7rnSbpfGZo4GxP/nffLCZRK3jG0p3KhNwYd4mkgMVaW+YbmQ+wwaOMZTsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GVsfUxKJ; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GVsfUxKJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+RZJ5RnUnQcAthK/5bTVkejj1uETgOEejMHEbmu1+Nss3c/4J1oIpvYtBWiPJ3GQJDckCZY1QPWTk9baDelG91bAjmSV84WiZifzNCwuyFnMY6PsGiyDN35AatZm7Z+BGYT5ShUnObQMCBiNE5Nn6E2vTCQvgVyBTd4p3yJTovZI/nqFerisADwhOnb9pHS4D7N+Kf8ss/YWRo6MdEMmxkkqjG+eIqj4eTpnpN+28HfYrETTTTjkaq4O+UhMBwCxvtWtuwGTfl3b8iWoIqqZMyeKncwKLEv991DjIT6pj65FBY22ZfQ2H62uxhQP6wEXnIJS+/euvrqcfPHBZ7kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuVn7eMBcjLxGug645DFCwocyXHw3L2aItQ9GwZPNnk=;
 b=DtG1/4fbFG6/xtiP/1W29zN5OIzq158Z+wrTGY5QQnTh1O8EUx+4jus1qyImPEihLSU+A/sanhtvPTO95RzPIgXp3nTUBOipoKkkQbAkRNdtXt+SeoyJGAcX9udBQVJzQwFgqSzrUDZqckCD6ApsX2Bq9n/NT4L8fpTyd363FxRL9rDQrJd50jUsR51/7o9Ts6If2ThwyvCFCZSsQh2KXF6/stiB15VKJYPnm2Apu2PhfdfLpaRs4d1FC7Ou7BHYsFrdPylSlHKyKPc0C+3ycMhdP45Gvbqr68H33eymsY2K2fk8h9HcA0dv+TH/TE4lqoIEwFH/lGfr3Ny9jA+BLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuVn7eMBcjLxGug645DFCwocyXHw3L2aItQ9GwZPNnk=;
 b=GVsfUxKJDEDpVaVDSbJtOGx1sg/vWfiWxgWXPBi+xtfM2IV1/93rCvNW5hO3Dp9B4Z0LBk7l54J4CdmuF8YyzD3WEivbpXCamvT4dq+UWg9mh9j8CzVGOCabQ6V1vZasOst3Uw6SprcoBktFUQnV6+KdpFo7bV23N8d9dQ2gPkuu3xDDSKuTyczXz17yKrjZIMOKoKiGcdM8VvMcH55MzCyftSGfOZrMizi0EIwazy0CmLr3lnASB43mS+ajsaJnvRn4byOnvWYHNxDzHbUqzWCG0lYSX6WtbAqeojiPqLZSrC/5uA76/5gk+GNqW/Z56L6TcbNlVBLNqp1ZWzbF7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10909.eurprd04.prod.outlook.com (2603:10a6:10:587::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 16:47:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:47:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add fsl,icoll.yaml
Date: Wed, 28 May 2025 12:47:11 -0400
Message-Id: <20250528164712.691372-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10909:EE_
X-MS-Office365-Filtering-Correlation-Id: 5182eba0-f8d3-49b7-9e39-08dd9e07548b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1suixALBCthuJWh7V01SzOTw4CTByAIu+L/R/PDizlpL5WST4zt1hJ7ZnmMj?=
 =?us-ascii?Q?Oh9y7hL34hMNMsUVWWhIVhS/L5TkCLhqdpCiA3CngKJrFPkpU1ShjD0EpFcI?=
 =?us-ascii?Q?MMn0H308tN6QMsHubNnh9oTLhAzEaKPy6ircGmCSNBd9ZwvTdhnRfEM0+9iB?=
 =?us-ascii?Q?S5JrlHNGjZtS2uaqKuMp6akaVhs1/nHPr0AcYfDHxG4EHVF5vcd/sd1niKJ9?=
 =?us-ascii?Q?aOeGGj6q91Ee5I0kBsJOim9HIJZAJKjHP0wRu2yG6lkMqUMSWkZUCD6E5V2x?=
 =?us-ascii?Q?zIvvG3CU+gqDOJ1+QK39sbmqYgTS9jgUYiLJNK2KxaTbf+AwtpZeEid8tzSU?=
 =?us-ascii?Q?JUB75EAKspkarN+5WsvgLM1RF5f6l3ByqzxwiAFpDHcK52Bo5YVozeB/52hb?=
 =?us-ascii?Q?nhW/KFWpNK9W90X+yYtr8vkhvqtOad+//g52IL+QLuQ5nAj9CHyV82jrkmHe?=
 =?us-ascii?Q?hWBwShmBMNwRxGeYMUcVisu0PiplXTlxEk+7ai8ejaNHw8R+xHYbvSN+rfUx?=
 =?us-ascii?Q?HcjlrFGtS2V/Nsxqvt6jtINtXv4j5Nsqy+/0tdGgvjMzExC5d6n6LKAFjUhd?=
 =?us-ascii?Q?Lj3Lb0bmSA+oc2R5XTgaEJrV5yCq50DnUDXfjwmW0HNjctMNDcriY3h5NE2I?=
 =?us-ascii?Q?X04SHPhwJ04ugHlm/E2uymUPs6cgRuED2sF6swGQBtF39E2lxspewCFGt7Rh?=
 =?us-ascii?Q?p6fqz90vsnY1+UEZV328CP49HbQ0Xjd/LNofbAp/jVJTKlMXmCwiHZ5d4Bik?=
 =?us-ascii?Q?JUHqGzc6NkPRUP9CoZgOcHXyTPu99OaorETo+ocmUc+IYtEJ6a6+eK5clHhe?=
 =?us-ascii?Q?GbgKrb7320SyiE3u8OFukiKBcqwO9r3lVWelfGATArougu8p2ZaDhVT/hq+T?=
 =?us-ascii?Q?vLHQuoVysMtkd9HGnl9/3ZpB0YDouHZuxOXa5HdPUPjFFG1eSRQMtojZoex3?=
 =?us-ascii?Q?Xio4lUlm1g/taqLt2PfMn/ZkT7kIKC0SqM5aH4ovoqvrQxrxnSCA7Z7L+w44?=
 =?us-ascii?Q?yIzvRdQb53/oTdREIJboAEZz552MtG3BJ4aI0G5SLl3J7K0lSKwDBmpSf1VR?=
 =?us-ascii?Q?qUJf6x82ouhzGvcKw6nrpcFP1ksDqRXpd87qe35+rWrx7M4Hk3adVbHEGb91?=
 =?us-ascii?Q?fBxIFY8mEoMtTzLGzYsY4TDJW+A9FGxyCMTNA5qNjcmNz55xd9InN7GXdwQQ?=
 =?us-ascii?Q?+7/5JmvmjclAXJQUoUZnsylVZdvSTbnb3e5g2knSSMSKqom0Z4sAUjGACrCo?=
 =?us-ascii?Q?J8DuzGF4RYuMUVVdzjhWimNWS+wgU+kSSqMbPB5HaBqpyOk+/EsGR+/8twa9?=
 =?us-ascii?Q?tBC3vBZKJozw78l0nnqyM9Om95CawAssu7dbRH0/j+8xkVya0zy0vHfnUVGz?=
 =?us-ascii?Q?ZV2pYXNnyEtJ57EotH45Q8MuietDV+0iNrmFMeiEUCwkB4jpKcDiS1dPxAt0?=
 =?us-ascii?Q?GJR3cv9xU0nrQScSEYT+Lx4os9nbIXH3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FNgTswyYfR/KNthNKWY8CURlcyno86/HukNBevq1fqtENtzsYDgcinNj3wKx?=
 =?us-ascii?Q?W+oal9wNkeoI3pLVhTpaxKYbHgwN8jYQD2ysKrMeWNVHJkivbmK9W5FHu1A8?=
 =?us-ascii?Q?RUHNbUJELXHaa1vQn4Iv/HbomczCZUWcvqQfbZaudfJNMYit3AaYg64jnUJW?=
 =?us-ascii?Q?VldoWr+m/zu3FFqUjGM7m+crPibK4kNY0It6eoznyqL+G1mw4eoc+cjMrZfn?=
 =?us-ascii?Q?zcGnZtlD0h/zcOwWR4S6J+YA9raDGQiQi4BRklwvGzQkBRWelT/EgZp9qxOf?=
 =?us-ascii?Q?vEPMk5E3J8uDJNZnuuwqfGFbgNtDkTWhII51v39eKaBwQimqcWeXKPKMle4b?=
 =?us-ascii?Q?68F4zo/a+4ajAZ/Sv+Aw3HWFnxYhozvy8hyhsnk0HT+PZKg2UAZQ9qEAInIc?=
 =?us-ascii?Q?4IzcomHJsn+KWqrtwCahQVRkFBdfh2qYQLmtgbJGSBOnmp4S6QBBRrjfJA1o?=
 =?us-ascii?Q?Fo9Y6nmwnZ/5A454PwclkNQt0kdmSdoxpGrY/Y16ZwVAy6SfsIilnqNlp39H?=
 =?us-ascii?Q?GPTUauuzs8qEnFEBBcio8rrcHalEpIe0ZktifX+V/w+zFX58Q22fzDZus0fg?=
 =?us-ascii?Q?6inLSnurboChCQpTCuReQqN7Fa8lrCUHhjdk9XePvuW4WLzd/cBvTGQRfUUe?=
 =?us-ascii?Q?+mLqCtal2quLuTsw7ZxIkMgqW5PdVXhHvvOXjUtdcFITwCcqDk3cApRSZeqn?=
 =?us-ascii?Q?XMm3LpJqyGOYMi45/quip9yoyQPPwMW2pleKKc4uMHZ0GgSZzf/z5X/TR6ck?=
 =?us-ascii?Q?cyvGXAbkGuSgWefdbwYZ0IOeiksPDOq4/Oi6kdQrHW6sU1VRvlKk9iZLo54k?=
 =?us-ascii?Q?6maom5XVM7QCEPgtLjDC1M/C+1q3n/4cIwy/EJGalRlrgqZkxt0ERTEc/mzD?=
 =?us-ascii?Q?pLsJpnDhloC1Rp0+aN3+V5MUAQjnfAdL2Wx0k5UKpHdFWt3gy2vHahcxwOHq?=
 =?us-ascii?Q?98Tsx1tHz4W+dBGSPKZ58GNqqrbw4vLIWmQx5SJdK/Jm2Jx12S6oJ09ZBLuJ?=
 =?us-ascii?Q?ay2/bW3lgtFEdU1+vmBHtMiRfRuB6aF53eRfHjh5KS38qxkR7+M4HtCRbC+H?=
 =?us-ascii?Q?cFJ3ECcuy0uZEPlH3KpjSDCw+zVwMjV1UrcPUc/BX3wp4KkH2YrD/OqnxgmO?=
 =?us-ascii?Q?2rlfjhGvGk0+3EnONpXSZNGD8oAW/YSzH/jESkD8e5VLlDpOcxR+TbpXRH0J?=
 =?us-ascii?Q?MzbCZsTORErEx1i/dD7/OccIATvqgfopvW6QaB6cenfsdMTlwkAZefPb4gAw?=
 =?us-ascii?Q?2htEWh6OO7wg22q6mIeSfd3XNsMEBH2s1MhcMNJsW2llaz689tK3cIaDUzdf?=
 =?us-ascii?Q?weQftumw81IcifhyTJeOm4e1y9pgY5/zIc7gyyxgG1VEhJwy5egVc9x96M+6?=
 =?us-ascii?Q?5rSlCerDHed32G376/oTzRAZ5T/orttdEEV2DMKCAXydNdW0dsN6uUEgluKB?=
 =?us-ascii?Q?38Y9Ydj9Wq22A7F3ELrIOaBQsc0Df2k0gKr7aq+a/LciauRreu+svk/D9rMp?=
 =?us-ascii?Q?ZoZNvzV6LQg4aedcWUQnYTsdBtYXp+muE/Ev/vEMVDnyMg/LzKfoVGGGD3ur?=
 =?us-ascii?Q?2+yk1bQ9m9Y0clb2BnkM89GQXl1xKkxEtmuQIq54?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5182eba0-f8d3-49b7-9e39-08dd9e07548b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:47:27.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ijv0w/w8mI+isveKdvDn4rLU0OrK7B0tjI3lNPyc1Umb8P54pr0Oa6GVgn0X7DAkYUjw7lKhGatG6Cu5/fjyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10909

Add fsl,icoll.yaml for i.MX23 and i.MX28.

Also add a generic fallback compatible string "fsl,icoll" for legacy
devices, which have existed for over 15 years.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- Add conor's review tag
- update commit message for old device.
---
 .../interrupt-controller/fsl,icoll.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml
new file mode 100644
index 0000000000000..7b09fd7d588f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,icoll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,icoll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS icoll Interrupt controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx23-icoll
+              - fsl,imx28-icoll
+          - const: fsl,icoll
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@80000000 {
+        compatible = "fsl,imx28-icoll", "fsl,icoll";
+        reg = <0x80000000 0x2000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+
-- 
2.34.1

