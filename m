Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012058.outbound.protection.outlook.com [52.101.71.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58C28D8D8;
	Wed, 28 May 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748450249; cv=fail; b=NvZzx4KTOuOVMafWALziuXbf/a4/ZEoHPeVhQUGnpDYzM7rQmc06aqP+gMQ7J55TyUMTM9mDlDOy3AmI/R8BiTAnFYFSuRVIjuvxEM9nOUsSvOU0CwoUmFnV7956yHhFFC0QBFNBqjyWrq+xW2U+H2IQRem+LcXivssUzIRIEsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748450249; c=relaxed/simple;
	bh=YiaebUEexpDrNXq6fSitD4TwUujuscFqzfsakTGzlfY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UtVPWPvxE+DqO1dVFsYozcxMFjIfXR22MAcElW2dCR3DeMBkOfQ8gMELejVpPROBkU7ukns6jPF4cRqzMbItHZMZTPxWZflxEUhoq8ZUFp9VK7l8oYDv2aJF7XSfA+4MLr9UxhO7995omT4cMYELZnH5ISW6yuhVH2btcM/9sW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jSjm+JzW; arc=fail smtp.client-ip=52.101.71.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jSjm+JzW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRGf4Iotvuj6vrIGhpeElp4sNoS921u7f2Us14uv/KdBJ78P31EBqIhiugxsszuH0ccQ67Pz+2L1VUJcAaWKHO+w/otOOf4r9LlFOlG2RFP2RDeWocYEO3w32ND5wQZSQ/Ayz0DE/HNhwmoFZMpdBm1IAX6xSCEip5Nwaab9622OGol4qil7bEFGfrSKRs+lcjPLBRUkANpBjVxRuskwQXp77Kjn09CfOMo88Tvy7wEhKnXL9z8xiCYwFzy/2a5tdj+pQm1ms8FE1+k38LKnQi4GjJ/QS+WONz8nwfTDwqWeV7+UOSkQ58vqO7Igh7LS16omRNjF0+HzGzpt5h8t7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTWrLr0E9zwKawOazY7TrSPI0Vgh5mt6AUy+UAmEbJk=;
 b=E8zYbqoyQffbpd5Zqkf7z6lbL15uGj1hg9fshBJF2170p2GgvG4eTbaoaiXBYEQkF8kyrWit1MJ5tLYSbVup6CLY9HhYYJche86zYNdWsoB2G0gMNrRkuZQqLDZquGBRV0nqJvXtI+LXRa5H7uDJQrp0vlSeCe7X+9bNYUpuNRxW1vueY4eUScIkk9/7JUXwlZFOYJv3Hjac9r8tQI5MYwNKzXuteAuP8v75FUCBC3JK0vI0NuwaP+eoMYiEZxwe2AcQ/Evb+ZyRkcrgQbwclWJDP0Cdbl3tHQnL/VqMVALZ8/CgTvrbEWIZvthGEXzajMaEm0Q7MIofN9GA983Beg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTWrLr0E9zwKawOazY7TrSPI0Vgh5mt6AUy+UAmEbJk=;
 b=jSjm+JzWHJ0zKgePZVlLtepBu1a3ZAn+v4VUapYmK9DFRX/3BRD3yoxS4dvnugQXzNX2NoS7DuqIhtBHwrhwbdUBnfpkwl4+xJZNgIqyjRD1KJRBPTQcUwpOVlSeWjS+dbAv4WB2SR/YRV9LKpLplgW6Id5ZEHqcCk6LY8w267dR7yF/biFEZTKVnkk0Li3HrTKOHBmr3YQAZnGDipCHUuvFJgEOAhAqFhWdYeQpEC4SV8J2C+CRJOBpdM49dyr77E3u081UB07QC4/M2r6PqV58EAU792SI1jWAVii0So9TjwHV8sT3c/uT/8rqXEyWcJf5GtFWEVFjG/i0UCNpXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 28 May
 2025 16:37:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:37:24 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add arm,armv7m-nvic and fix #interrupt-cells
Date: Wed, 28 May 2025 12:37:04 -0400
Message-Id: <20250528163704.690840-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7d4a8a-ced3-4122-e878-08dd9e05ec96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vg2YCiEIQmo3BUk9JXMAOmy3lnamJctH0IXhYadqyrgzUoLZOzSNwKM8q7F?=
 =?us-ascii?Q?S16O8bc22omnEs4VcPLomSq3ZOi9hlu0PCBxp7MMMinQu1v68Jnirt7Idkxz?=
 =?us-ascii?Q?IKyjOHfzjjwdrr76uA7r530D9liP6AByBvagHhqHKcqU/G8qdcfeW2JmYda2?=
 =?us-ascii?Q?BqIPa+klREgqmattyP5JkWXO7Yhgn6aRxjG8qxCMSo6XS8PdeVjhIqFavWLI?=
 =?us-ascii?Q?YukPOQwtB13IDU6dOWs34Upqh0MxhCcX9HNbr6xWtvKFZdCagDmkPFiEZJTP?=
 =?us-ascii?Q?pOBO4iPXZVqEs0ZzKv8SzhjH4mXkGcpwzCgiZXx5t5pEo2uH6tHDW69Q+Tdw?=
 =?us-ascii?Q?IwKHnXunR0BgkoHtt/c5d3KSaCwISX3eFlm8LAHgHnqR1GQvg6qYagHJqiqq?=
 =?us-ascii?Q?kTAvTvP6IomXaygg7NjVX81R3Xmlm83w+GyxpkyV/ylqdJFZMBJ6e8i5+tD/?=
 =?us-ascii?Q?S9V28j5LUcTxXLCKIYNBioVUjYPgEWdHtLh9Bi2mHPjONiFOwlRnvPBeucbN?=
 =?us-ascii?Q?4FBm5K8DI0b2W/bDtf0ujgqkpHGl3yk/xpkjkkpU13Ng6/A0GQGSA99v/LDK?=
 =?us-ascii?Q?a2gfmGoh3OV3TQzoMQMLJmex/97IwIK5eo4ZbWFAOvs/r2tDasK0EAcIAHqw?=
 =?us-ascii?Q?A3SUQksaF0Nj2YYs16/k+2I5CZeReQetjkK92LAlc/zuloCeZPLog87//SdY?=
 =?us-ascii?Q?fSn8r7JhiGCVwFX+vcAoJHiOwaK9aQ4Z4zC+URuRFT1sGFJJUU4YMwT1Sk3l?=
 =?us-ascii?Q?BcTXQJei008DGARfTe8DriyX8zIYc29b3KJjb1UAvGJntf8XSpAsh4yXE8Hu?=
 =?us-ascii?Q?qqCs3kvP6yaahj56+NHgXAgH0KuG9NnSLiAHJ0I46GoTXVcO8EgNZUcq1jkV?=
 =?us-ascii?Q?TDiLgaImm9OVKgYt1V0Bgt1ZzKvLGhvXQEjF71EjfpkrnlHDfb08zczU2T8s?=
 =?us-ascii?Q?hMiBpQYHHFqDetr9RDB9rBH6SnwLthXfBcCaCfrcmEFiWhWKhWwTg5NjVTTZ?=
 =?us-ascii?Q?VVgceW0uoBElfhr5yUB9AUQmQnMAL5vaGZDeG5IehtIj1L1rY/coRv5ADiUG?=
 =?us-ascii?Q?ZfLwi2l3KVwlQmmoMj4b1R0s+B6o3NsHpJOm1T0NX5s/w1jtwNOiXmiIP8AW?=
 =?us-ascii?Q?4lUfhApxzmQbBvbUEUTqewrp8mnXiSpN+b7GL6mFX/udwCR/iqHmWj7kVArX?=
 =?us-ascii?Q?kdoPM6/z3lwo3iat+TagAeqK9y4nfDjPb+hSay12neOeATKbYUFCvVOojwAb?=
 =?us-ascii?Q?Q12OvvDsMJHnV6VL5zQ2rfmDyFZyeWx9CFbE5ybSzIXi/tFAMTBQlXIivlAC?=
 =?us-ascii?Q?x0E8/b4n2/QomVpRlsRBarB/nZcVpPkShR60nuWhzDozBAFYzNrWPK91j8eJ?=
 =?us-ascii?Q?YNsVcM+TpOyLgIKwwrwpvCUwRH0uqu5TlAWPoRaHGOSMhTlsmLan6r7YhVRH?=
 =?us-ascii?Q?OtT6i84UWvnsNqcNq5NyCOYqxXPMFDuwrVFMNvkcqCA3Hj8bQQbWOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZFKs1oRyjpLbYKeDERb6XLoHd7oYBq3LNiy81r08oAX8ga3H63l3VGtZhvIS?=
 =?us-ascii?Q?WLAX9zEIB3kgrQL7WbLRI0/ZIqHMWf1gztt9pmQp+O0PSsr/QGgGSP2G+kiv?=
 =?us-ascii?Q?NpjPtuz9yOc+rHscTO1c9LLXJz/1LKs2WSOtddU0hLA01tWwWZQFftHU3an1?=
 =?us-ascii?Q?8VdRQ/3/at0axpApzlR/x4uPkagktgPoK66GkYkUK04lAMRP+jxsonPZ9umt?=
 =?us-ascii?Q?IBepL7Go9Mq1cQtm1S85dOzVzwXR2ujD0ajqppZHSIBSYcAp5gWfhNjwWSnp?=
 =?us-ascii?Q?yMA7US12THcs42HZ+lpvOVpbFiTR6jeLrCWLRcgaUN5oUKgtOC6VziizrHG4?=
 =?us-ascii?Q?Xf770cf3YVw3kfRAZ9Z7u6GNkK796zhyCDJGHW5I+PwM86ZlWpcyuOf9EGyP?=
 =?us-ascii?Q?OVRmBOkWHxOe5Q/7kyk196HzE92t9KrfXeOgNG6jXJp3aR2FeZOPqEVTWE8e?=
 =?us-ascii?Q?BPbXMoXVWgZkzAkcutWGMUoVi5nAyOjjaGQ1wMwtrZikb0EnI4F55zgj/tyD?=
 =?us-ascii?Q?8ryXTiSIVpxKwSqPftgUDVdeOGHSpTdSbY5O28IcC1BKo0ApumWSkt+cysXT?=
 =?us-ascii?Q?Fh0OT/nhPUxtF/lRXQh32NRTWW/44kExbCgLNU5GLW9acW2Tpj/NkcGfnd9z?=
 =?us-ascii?Q?PQLoNF/nmGb+CTiYohY5+nhW+k81f6dI6knGMlaS8tr/1Rkvf7BPGniQiqY2?=
 =?us-ascii?Q?l0MRz47gM6ewsz90XVKFcfIwRMKQawkXDEiHJjoHTyTvhQLm7oMnUk4AEarZ?=
 =?us-ascii?Q?VetEoBiT7DuUY0Zn+6il+o0RY49DQUd6IZn4wF+bAWkszFfQEsQdS0a8bw5e?=
 =?us-ascii?Q?MfJaqSTCCA9OjaTdEc8VwytKZPqnOAIp3syclQ54tkpq+Tym+RTi4Dh1Bscx?=
 =?us-ascii?Q?KvaxVfdLZhVj/u0JccojPeZRLvtjZagfIX62ROOyANdaArI2u/C/xvuGu1ka?=
 =?us-ascii?Q?FLuveHyj6ClDE5Z8CFHpYTY/Khb2Bxr35ZRYzVgaZ9/aNY4yj/6GCoMJBejh?=
 =?us-ascii?Q?gp4abWSHmzgrVvqo1fdLxyDLUo5/x4Ca3ISqOvylV9hSNvxCNX4IUfrKBxI6?=
 =?us-ascii?Q?57470XBNxH2ll1J+7QcJlN6Hbr72gtHxIbGgje9iv9Mp9BCMIT+EBTTYvLjo?=
 =?us-ascii?Q?5AIRKtdo81HCB+nnFJhytNn5TtNtAXULdFfdIatxEgq6KWWDV06tGwrKe0UI?=
 =?us-ascii?Q?CL1EMVsI0EX3ZCEpZpl8GSEWMZLYvO/wHjEBJAD7Lc3MvUe5z/rUZe2viIjE?=
 =?us-ascii?Q?67DDrNLOhTDI8mJq2je9r3dhUvmTOW4kbG6aRNz8lWQDwm8nxRcd23e6vhXU?=
 =?us-ascii?Q?KVQMkgQZLpyZjDhT1cW8iEbeWFDREaOlk5kORgrQ9ZafGTpvd1KOlUXqp6Qt?=
 =?us-ascii?Q?03xKG7ctbSg4jjHslFHHGj/ysOofzHiE1ruZaElSl9VTod7Jt1pwa0xcbB5c?=
 =?us-ascii?Q?lJcCu3Q73TzOxQ4+Ps0by9hBF4Xcz8ia/N/UE8h4+bliVdK9n6lQtLgbC8Fi?=
 =?us-ascii?Q?h7hjr8sETJ6rvpmt1znQwnmvs3S+OJhlYDP/bNQ7lRZaaNPl3IyQXRQymUxs?=
 =?us-ascii?Q?J5InT7s4WSiqNbcM7Vc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7d4a8a-ced3-4122-e878-08dd9e05ec96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:37:23.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOOsa6S+39jHthSURnktK290OOH9q+28sx9GXuuXFb4vIUbDKIfZoe+zyukNDOQfjADkg9ZLjqOhOvaGwVbfZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304

According to existed dts arch/arm/boot/dts/armv7-m.dtsi and driver
drivers/irqchip/irq-nvic.c, compatible string should be arm,armv7m-nvic,

Remove unused compatible string arm,v6m-nvic, arm,v7m-nvic and arm,v8m-nvic.

Fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
    failed to match any schema with compatible: ['arm,armv7m-nvic']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- fix example interrupt-cells
- commit message add driver information
- remove unused compatible string
---
 .../bindings/interrupt-controller/arm,nvic.yaml     | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
index d89eca956c5fa..c0be00b450291 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
@@ -17,9 +17,7 @@ description:
 properties:
   compatible:
     enum:
-      - arm,v6m-nvic
-      - arm,v7m-nvic
-      - arm,v8m-nvic
+      - arm,armv7m-nvic
 
   reg:
     maxItems: 1
@@ -30,10 +28,10 @@ properties:
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 2
+    const: 1
     description: |
       Number of cells to encode an interrupt source:
-      first = interrupt number, second = priority.
+      first = interrupt number.
 
   arm,num-irq-priority-bits:
     description: Number of priority bits implemented by the SoC
@@ -45,15 +43,14 @@ required:
   - reg
   - interrupt-controller
   - '#interrupt-cells'
-  - arm,num-irq-priority-bits
 
 additionalProperties: false
 
 examples:
   - |
     interrupt-controller@e000e100 {
-        compatible = "arm,v7m-nvic";
-        #interrupt-cells = <2>;
+        compatible = "arm,armv7m-nvic";
+        #interrupt-cells = <1>;
         #address-cells = <0>;
         interrupt-controller;
         reg = <0xe000e100 0xc00>;
-- 
2.34.1

