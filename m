Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C733170826;
	Tue, 24 Jun 2025 22:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805210; cv=fail; b=ribXLu8URojvapgikZKpuQEyHxLiXeI9sYIykFoQK2eZJWtXk3h5JpyipmUSI+D6lONDzl4uk0n81+9Y4qUBMbpRmc2gq5r/n8oLXU5DaKUyuPAC+J3W4PF3O5qQ9/nROSUfXMp+Ae9f290BM+C9JtLkjZtIHMIoaIG7Kfj188Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805210; c=relaxed/simple;
	bh=lUWnUYNDoe5clqDu7FIIuBWdv2YF7Xxxmvg+zcJNSu8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZcWFRX5CjLnB0htGnrOv9sOANOLm1iXF72DzrHHVwp7p4MoMj8i72mUArMu4dMGaY8ADNlNkpa9voClWa4YMol5Sd3to33hzYCfOxI6MfeGpbJH5QVSGvm55LFvy2qZDZ5bKH/GGKQoV6oQmERlJzqu7oG2amBE3y9lMYVB1MGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SVxHiyfl; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SVxHiyfl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd0CnAzmeVbUxUhsEL+arV5xyo6LBQY3vE0t0vfOEZK01Q2Nnfue8WTALW71jTwLF9ccT36jFl4ErnnN7f1IjA6badIJzl8lQdef4TYdtP1ZFz2Wec6e6O9by9DsRQZHW/ofR+Ws2Hchsct4TWooQrdCgPrxMQHEdLvTHavLQ/XYgWuCALYStNt7PRvEND8xCDVxDy6mlhpL76OjaWq/yhdYoF19edO+k2LXXaQMyXj/Ba3IYBF+HorhRpWMJl6UjeBPHgkio3EtVROEfcvQTWUKuo2gCl+bIgXJGL1qUev2igV7/X8S41bfguSnmjq4EIDKosYkFgPFBpBxsZWsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMbaFIUOgOxR6eAOIl6T0Lz4pZNl6KuD4Zsrc/CBMdA=;
 b=EO2Bg5Yfcs+FXlqgzR0TARfWpsW36bDVWvpm8ICTKAGh49f2OH4WGM0SDwAZWFmGkh9IgzwI6F3yQkbVTRKq0JPOYMFcIwQ/Ge7U2JBB1N5ksti78v7DJdrhVykmIk+fEtdueq5xQdiTFwnl5Whgh/28zcpr6poo0DGkniSd6hAXWtpRB++41aPXmEPbqSb8O4t75D2Z3lNCloPxgdanEsgPtperkKRhlNlo1jiQbCagHkeHZ9sS2H6OUjrL98IaR3rVQ3mCAxGX3fdzYFCmZ8MD3ONDHYgNFroYVDGMf4RrZil+V1KyDMdTkVNWckwJ41q1ke2n8qhqU0S8KVL+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMbaFIUOgOxR6eAOIl6T0Lz4pZNl6KuD4Zsrc/CBMdA=;
 b=SVxHiyflZ0EVP6znZaRfH0KPeYpBl0i0SoFHUdo3cgRDTlg8bdo8c+zOd2TJoR6vPr8KhGXwbZd70yO2JkLyaBY5ayisIwaSU54AKSc6MLFVw7cipfEDLCpjavp03ijYVJrJmLeENPrRpxvJ2XXqWmmSH5c60qqucbn5fvC85UI/iLBOE1eG2Lcv1JTzzqjcqg2cRA2G0OcKhh6Uef98VuP5Y32h8CS+SdF24jZRNATLyJMU4ZaW1H8ncMzBF2UBCGjmOp8kwXxNYBFr9xg+Vq8POuyAFL0N+Xrq2UDyBkPuz1bqzgGJRL+RDZPDjIBBiLln98Ek6tWtx/laTVJIGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 22:46:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 22:46:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: interrupt-controller: Add arm,armv7m-nvic and fix #interrupt-cells
Date: Tue, 24 Jun 2025 18:46:30 -0400
Message-Id: <20250624224630.2518776-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b8b2df-c242-48df-a016-08ddb370fe4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0mFplX1chEUd7M92Fe7ydYSbsuTQ4qCULdh2V6pavEPdfjLwwao8Sl2ndBVd?=
 =?us-ascii?Q?bwIYrSCxjWRoczNzrz9/Np16y+3FuoZiZQb04NEMKW7spICz8AtlWjqtgPGk?=
 =?us-ascii?Q?2gPTN3vypeGBalmzXnKRRCGS1Nqr/K6+7kLN9qLth+uYe1bfoBrYiuqvmrHP?=
 =?us-ascii?Q?vKYL9+k8yHcFvROpZS9HOqqqJx4NOZTkklxKYgC5Dc6oX/WKsX8WSvq9Cdhx?=
 =?us-ascii?Q?38lNFdhboIaI3R1c9686BGlO1yRELOtuyMV9mwkTl9vJmFV8rR9EkpJznVSe?=
 =?us-ascii?Q?9vd5vWDxMzgzJQfR3eU/xGEa8qmXJQhZqujjnEIoL6uk+K0UWhu+ImvOeN4q?=
 =?us-ascii?Q?HzfH67+8aL8tS4tff3KZPwATO/htEADj9fdpdYbkcW0UtlUbO8V4u5Cw5NND?=
 =?us-ascii?Q?kUpxcRTLR2Ip+ROycmafsikShQUJUSZZN+SW64E6/USKVRbSnTS8VFw89/f1?=
 =?us-ascii?Q?CQtlViAYgLnwTFC8hNBAh4S2rRA/6FfGB0cVdG+BCAsC8pfVWACWQFdbpULE?=
 =?us-ascii?Q?dayk2nNcSThp2YWkpQf9aib5GApFdTklAS2CgBPRhyaFa4Mj2XiQppgALlpf?=
 =?us-ascii?Q?/DceHx1hO/W75DIBsFnSlPGmsa+Ya3YHXJCLqWyWfK8P72SH/BrGZAiSnRy0?=
 =?us-ascii?Q?qp1sBxy9UkgAPrYDY0ntBSB76wLaJWy/YQgl2cbeN7fl+oU9RJjxIfUNvPR/?=
 =?us-ascii?Q?FdNA1GCtcyjxOp8CJJb9acvb9FG6BMeMdadC/9lruXenm+WaRkdJwtglZWn6?=
 =?us-ascii?Q?MdgwQn18DAZIJT2Bpfk0oAdyK9Tyxp4rYwB+1+m2JVcRIbz8PlGBv+tvyMHq?=
 =?us-ascii?Q?vUVgXQrKcs4wrA762VBCFRhb8CDfoGxDHVKdOxR4fCyA22Ne71dk0lLq+Z3f?=
 =?us-ascii?Q?bQGbxrhEmH+Y795lOTetKswCrBK4e3eIL9YuldW/jESxYZj9tiEG54joaWCX?=
 =?us-ascii?Q?UqGn1llSATRxH1N4qdwbu/M0IVhLX5r7R/eQ2SXFwC5gmbnjo1MO4iCaFFjy?=
 =?us-ascii?Q?4+lS+U3qBI3O0RZXLC5K5LFN1EDz2sVbOFQ40+XtZLDeVCSHdfZdKdtfN7nA?=
 =?us-ascii?Q?5isFQv7+dD4ORZ/xIQJJ7RINOw741M1Z+cRs3VLdSglccRZwvH7Jpqpr6yFk?=
 =?us-ascii?Q?b78EwrbrGMGQuc/NSG1V7Cjm2EdgAaT5tEDISM0rlcOywpqgFbDRdroogXxa?=
 =?us-ascii?Q?94/uCitCCpTbbTRWqcCLctFLmMZqJDEf2gAMlUX7KyJRU+Ve8t6EL4sa1By7?=
 =?us-ascii?Q?w3MaCLn0GwPld9aLs+m2x6/PhpGIKH+3WWJpFwqdJ519sF5qZpKQa1K82G5M?=
 =?us-ascii?Q?AayFSENwJNv7m1QC6ovE2H/XCi69L7UYhB2qMZkodtnYL+FcT40KC0CD+QZu?=
 =?us-ascii?Q?bF56GGAtcFNk8Ud5Sy1FrGL0SptfGx7nk9o0NbvB6+nDcfOyQ28GRDf0OSKb?=
 =?us-ascii?Q?DLOhqQQSOrLP1SrGrpFDAeoVjMU0CLfZVnqRRIYy4Rd5Ti9aKb9v/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mTZIIkLzOFhgyESoCwi+cUe6Xj/VahagW/T/oyeYtBmIU2GCdNAGxc1vDTUV?=
 =?us-ascii?Q?nmNw6kczj2EwOFm2vZdPuIRiOuz6kJu05aMlyp5DRrCK9zv7oi2ttNUbN2Bo?=
 =?us-ascii?Q?Y2mMMSQabLGI/OBJgqp6SqcIN6msixBOxVEKqYCaNJGdt0CqpRK2hgcm1RCP?=
 =?us-ascii?Q?1QmOdrYcXny/K+7uv2BEj+Nez8XleMRYHB26GkH9d1SEw5NEHCMnwi1X13lP?=
 =?us-ascii?Q?Z/i9y3eQ9kbFeN+5LnbmqgEvC+z1JOOv1lD3zUpkRlHrUZgYQiU3Lv/MRpaB?=
 =?us-ascii?Q?mAc0keA8WIygQ4HE1GDHRUT7Pz0jP72PuFENg8CcAJRUNVEFHpvDvnrsgj3m?=
 =?us-ascii?Q?lpBbbKi/teWxSW3NMek+nDWKu/kKpc8RArGltueqaNDkqiPQr7ykzeElHkjz?=
 =?us-ascii?Q?w2oWdJS0vQwQLPjKBmG4qGRPqpEGs/ZvU3z/CFQzqYm1py4BinmoflQYuD36?=
 =?us-ascii?Q?HK3+FTCaEZu7cW2HoyDsJkuA5s/smsRkZ67xsOAa2sQ3eJQXmNxYQjhja6Ye?=
 =?us-ascii?Q?ekUwN4b6U2O1Z+EIDNS8wqKfT9bwOahQU6n+01DpraW0voFMwlp8qmGSLMmP?=
 =?us-ascii?Q?SRu/kSp0lGGeuwwWC3gno9nLu8LdvgbXEe1RLOY3dDwQnkJ2VQ5Xvvu4BrSC?=
 =?us-ascii?Q?gXtbw1o8iiPs8AwkVioeI6gQGHLhuPq19BAALjU49qTaJNKRYc4PGh0NJS01?=
 =?us-ascii?Q?lVFmBqvl0Vj21M0KBChROutXO5l6/JDMCQU388JD81CY5myKhSWNB+Caioqv?=
 =?us-ascii?Q?jEnVHz5y/kV9QlSi6kF0S7EzitVRpPgCDbQ+Sq7slblGTVas1x8OMwiXEOR2?=
 =?us-ascii?Q?JTMP+DSk7Yz013cINxXZtgePNFRAHanJRVN8+izLnvC+9Il30cVCzlMButyu?=
 =?us-ascii?Q?X3YNf/4nMkkPnxP4WliirTY0nB9x/nOoIbu37/ApO9vkntZFkxgm2NnB20oB?=
 =?us-ascii?Q?zB17mjwgViap05n8F9Xn3M3Bl9obaxFqL2BCzRPXrL3+nCYzQ4qiWrsiDXV6?=
 =?us-ascii?Q?G449xBXNrMVP56QjzITRXHn5t9pA0g3DSABWkEUnme+ht4KyoSBSNssl2BKG?=
 =?us-ascii?Q?xwWEX82YEYQspU+HGkAJyekGdzWIyr1jpCspLfwEF4zEC9U168U/6JWh2RU3?=
 =?us-ascii?Q?m9ZgxEodF0ESK4BsQDf3nny1SuGuNKpCG4QbWfEJ70/yWKNO7JUnD5rPEk69?=
 =?us-ascii?Q?jnF+Jb+7tKKN1aMf0Cko2At7kpeQVhNt7ka6JRAwRwnOI6JUPeLJiCAKyA61?=
 =?us-ascii?Q?UZ+S6eknK728Uc/1fHmvJhJbKrJ2/E83hwwQQCR3HzVMGuQ/yuybNTd+rsmF?=
 =?us-ascii?Q?kip48uKpYGyQcFhl8t4tNaAnMoxG6MVLqDjOgV1QGaF5U0Gr1yDDglC3RYu3?=
 =?us-ascii?Q?eukoOPUT7Gw8OzchRn0gi8fNtFNZlaFWBeGN2y4ZPpYgzE7OECd36b5w4KMX?=
 =?us-ascii?Q?rCk/9LlOJ9FJB9/uMgO8xcj/FjQHd5O94itiNdkQOyV5YIDmwCotElhvMl2l?=
 =?us-ascii?Q?VAJ2SrKy8HPKqy0ypdu390hB9J0n/2wy9oWVWbYQ4U265gEfSjFLYb++uZmB?=
 =?us-ascii?Q?ElpgvHssOyBmzKrTJy8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b8b2df-c242-48df-a016-08ddb370fe4f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 22:46:44.4203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/2RPpaLnPzARKpy5sTFkuv9rB0Kt0k6H39SlKFSk2E+HlmJHqRKm4ftq93qxo4d1nBgASQ/07DWd89ztxnqQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

According to existed dts arch/arm/boot/dts/armv7-m.dtsi and driver
drivers/irqchip/irq-nvic.c, compatible string should be arm,armv7m-nvic,

Fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
    failed to match any schema with compatible: ['arm,armv7m-nvic']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- keep arm,v7(6,8)m-nvic compatible string according to rob's suggestion
- allow 1 and 2 for #interrupt-cells according to rob's suggestion
- keep arm,num-irq-priority-bits as required according to rob's suggestion

change in v2:
- fix example interrupt-cells
- commit message add driver information
- remove unused compatible string
---
 .../devicetree/bindings/interrupt-controller/arm,nvic.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
index d89eca956c5fa..32dfa2bf05d84 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - arm,armv7m-nvic # deprecated
       - arm,v6m-nvic
       - arm,v7m-nvic
       - arm,v8m-nvic
@@ -30,7 +31,7 @@ properties:
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 2
+    enum: [1, 2]
     description: |
       Number of cells to encode an interrupt source:
       first = interrupt number, second = priority.
-- 
2.34.1

