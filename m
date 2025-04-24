Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7F79D0;
	Thu, 24 Apr 2025 03:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463810; cv=fail; b=jeUKIk5jyFsFchkt376fR+Y4T1JKMGjQwcbI9GPly7tLZI+eEPS5l1UbinGHCYach4AswJj2jCdvTA6ZbdC0PLNQHYpxcO4qm5sBVkoEvn6ehMm4VPTOCPez/hJ1Az+a/m640q4qBR9PmcCwU6rAK4ViveNyeZNTEFl/4LPGoPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463810; c=relaxed/simple;
	bh=TSdztaB+hLg6rQ0ykEjzUnd6nHXaQyEGL9noh7Z7V2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Rwu9jwMQTRKqhPPgXeUBFYzJa4BgySH3fwMdfm9BaduOSLU3jmH0fg6XAUXJWl5kSao61jlm/bF//87B550d5RaiuNltMgnLjXBKWJwbFPtXSnCYxehUtfJzKPD7umViZBCFFgx2lMxkxtYh5pxRkOxJjrlCbzwFOSLHDIpHqHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MdHHX4Nt; arc=fail smtp.client-ip=40.107.249.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MdHHX4Nt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU2XomcnRJeo0jhG+XB0Yjyqjdn6yvWdSqCYcT9YLSCE08Bxbjw77nvTZLaLFoWhteE5e5qGMn1XqLsSi3YYBNEXXVvKTvhehDFLSJ6nevayUj+apn2C7n8UXWxUKigqeLdD8JTpPUMSi6RGeupwHgHIjOQyw3UkqKD8b8ZrsE0Gk/k2AWGd6wAFGkMST4UeSNuz/Vofe5DfmAiciZVvJRthtLFVEAqPXw6YJoi43+bC4jAJxZRQ9ivrMa5nramJeKwtidZv18rNJ5kEmcgmVBaT+j2nGgnvazvVQu81MCtaIfrP/ceI6oqHh5eBtPXMqKRLDJoTJyx/fXz3xXR9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcSyoYTMfm5iE0gu4fs6DVDWBqgS311y4hiKgOZyu+E=;
 b=LI+daq3sRjvgRJN+bLkSXj/gld19EQfbRqwna3xUFTjoJ06dZ4NtdLLzLdKS+jxMhmhZk/3ezg6ssOGF571WdIeMN7XkpEsxAc77nzqaJ+/4tU173Ixx4YfnuEAMS17RrV3OjYV/J7IlzdDTMv4OjnjYj95eUxEFbcnUJjtAb2dNjhjaiNweGIDW7Aq1eij3ZZeMJMWzakl6uo3OrKU2jEzDWu3scVAigDZHwj8h/PAxSpa49jTTIygaDGiJLturcDNQrLd+DoCsVUcKIYfVO4/wAAOlMmV/j0IFobj4ltPgDnM0g/CR7mGcLysuQvCt5bFR04CO6l8f8BdibuN++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcSyoYTMfm5iE0gu4fs6DVDWBqgS311y4hiKgOZyu+E=;
 b=MdHHX4NtkpDfmvF9jIxVPebJl3DYxSiyXI75Iay+TfH8DIC9ajpxqKZKa+WHiSJS7fSazhjik3ek7jiOP5RyCt18lT1DczFJF0X74mtvL6rKbccn/23bFAe/o36RENyAXeAOlMGdRXKpLg602DWHfj6UwOqcfy4xnJZPmavMUgxENeMJgzRmj084q0aeCnPC0Fz/ii3Obb77WUT1AoF3pTgWmjs+ojpLtHu4t4Zz55PXvxZtCS9Gjqe5PkJh6GjBiR19UfPLJduh8hbRZ4egjO/aS6nUXaMbfLMNfV9iYcfTAPYFF/AwUF0XCFk1ySMJ0aUlOWQvfozoL0Dq0qu0KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 03:03:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 03:03:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: fsl: convert fsl,vf610-mscm-ir.txt to yaml format
Date: Wed, 23 Apr 2025 23:03:03 -0400
Message-Id: <20250424030305.3868637-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 63491835-6d0a-4716-0ca2-08dd82dc9484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?10upM5ARvHIMwOs00s1FAoZuUQx/616D9rSs8lOXKGA8EHFUFtOpfb2IaOcJ?=
 =?us-ascii?Q?D87XhL37IppFQUApfz31ZOGDnOHIBwdMSE0ZXOayUleVeBzg9SuQ91SpObz5?=
 =?us-ascii?Q?LtArfTLq4nDuW1KbpYg4XEKTE4/DcwNzpGaA4lFuan++qx5SCle2EtJtYCse?=
 =?us-ascii?Q?0elHRuh1aL7d8163O2+3g0IfdvHfxDE56CKvgGiXhCQEYiByq6+7+Mjlnqzr?=
 =?us-ascii?Q?8sIYmB7eIQ1gwmM+HvGDXiDBHorQugqL+szys/R7dzUiu7K29G+/3SLOvxwr?=
 =?us-ascii?Q?HxiinruWLtD4WtxD4anlua1qpo1InA050deT5JaUkBY8FyeS79uh1fGXkH73?=
 =?us-ascii?Q?9Mq5e3JGwY5MpettzdESy2vU7gOXvSzPEq5y8gwzTJYvWN1G6q9GDEzwiW4B?=
 =?us-ascii?Q?I4sKyHynakTItb46V5D6CN5tj8rvbevOByTSk3Q/E6sT3urAj08Pgd2bDzyr?=
 =?us-ascii?Q?s1X26odfxQ7S2AEE9mu7aRNEa0id51UvA8LiJwWOgpHF0yR/StLP6YEhlnZd?=
 =?us-ascii?Q?/xbQM0HfR/Pt6sDVTvBvpMx4JHx2uwpK23rmE3Nc0sKx5O8bIoyp++73bz1C?=
 =?us-ascii?Q?m9Nxu1NZ8xKtHk2+/Kk8/XI+ANqZ/b818jM4RWwfO9Tj0cCOlian2oBrerse?=
 =?us-ascii?Q?zIcBugs0USMh+1kYI9b2ly9rXvjjc47zAv6r5OT7J1JUlx4nJy8DjtThjZ6y?=
 =?us-ascii?Q?/y2j2hhNBBjd7y7PdiJqRe5U+3O5H9z8B6768/s294EdzVXum3/ls09KF+di?=
 =?us-ascii?Q?6N32Js2uDrqRIpwbmKpJMAZOkY8QlZeqbUFM7DdZCknebggT1GFbi0/0LVRK?=
 =?us-ascii?Q?gsA3qxShSuRPHXChUe216FGDU9KIce/s7K3DrvAn0MRLynLCmh8Zw3t3Mnfm?=
 =?us-ascii?Q?ycic5/5jsjSL98wIhoLekk6/rM8Hc3IlGieZN9QEKoIkhxaGj24s5n9DicJl?=
 =?us-ascii?Q?hQ+vfQW+sw7RD+k/lffTosCPgqgGmZrEM4AoNDrILc+mziL1nufbiNLcwm67?=
 =?us-ascii?Q?SUCVzEJktyMmEVXMCW4nak4sofwdTHDZ+NGZZ3ZUCHjPKQgmlFrTjewuVp8T?=
 =?us-ascii?Q?lyquOd1WCMyQf+FrWeLRK56he4ZHd3VbvLeL7Tr2Z3Mhse+kVgBf8uC+SL13?=
 =?us-ascii?Q?KezmDBElmvdx/0kymmQFEG6oiMGDPLGu7fcSqO0oTGFD2AuKVXMJ7HZljah4?=
 =?us-ascii?Q?4Ini924V7klkjrSIwHbkK2LjrKIwtqwGmgfIgdsEe8lOh1VtVLJvXJGcoVj+?=
 =?us-ascii?Q?jBWJoieeiTgml0YD4qrD6aESYkLolc7XnBkhOWeWlyO+38D1aZzorKs3MMg9?=
 =?us-ascii?Q?Y+wGKW7w+YpHFGVElzEi/Wdkl6wgVApv4jsG2gPaR1pErl6YhTgzgckPNpG1?=
 =?us-ascii?Q?W0I15p7umGbE8gFcBZBzznUzV37BmPJFyPeys009u8Hda9GSZyKa4jiGBo/x?=
 =?us-ascii?Q?0iAkDP3QXTk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LvsbCdCPDFTxcWhCfUANInM4E6dyD3DqG5IjU62yDfZgsc7NTIOt2qXo/MFJ?=
 =?us-ascii?Q?miFQhFlOHsl1P07bCai92TONhfYdTTAxmz8WfiXqnFywjpFcPCKAN09uqRLd?=
 =?us-ascii?Q?AQuIbRmy9qqD3WC47f7UMnlmKZlIh3DODAAeIMtb+VTYBLs5zmVHvcfSLSCd?=
 =?us-ascii?Q?NQ63i81BZVC3u4hOB9krViruxwcnFc0d7vMRtDabDf4Ojj6Eoc/CdfAlH/c6?=
 =?us-ascii?Q?WjDKCCAw4OBQn/zSV9khiPLCh8XgJ3ZJK/2f0awjZeAjToh5N1z5d+o2X2K3?=
 =?us-ascii?Q?MYoxzaeoWpa8iRIhoehlncwt4l1sKeQJz9V5Jacv5e6tmTMsRkNw4PuAcRwh?=
 =?us-ascii?Q?E9v4EteIK4D2ueQG78TkTXoWo69xgvTGGQDSOc1Spln5TVwSijvCYmIrvNYR?=
 =?us-ascii?Q?AuanFouEGKB5ufJldzS5m+IQTBp9GiUyhxd2jUelGJdfgXXerhc9lauzvCHN?=
 =?us-ascii?Q?73p7/v02YcQQAagT9D0uxP8XYvDKR20ANKyae/OjmNWg1rbLCL4F5ul/4bVa?=
 =?us-ascii?Q?dh1jHG4imMM8y3GW3NB2FL6mdXUJyk/6ABpzJmao7EBokpBE6Bw1JmRQUZY/?=
 =?us-ascii?Q?2mTTa0zkLlM42rbBPFwDwomC1mwZT1C2rjLRI1NclV+Z6eQQk6GWInahi+ra?=
 =?us-ascii?Q?jHj0wN1lZZDjOogvaZNZdqXtTJuaK4VNOir/Vw+musFGA1DqbqcMX2Q135hi?=
 =?us-ascii?Q?Nx7cEOqJd8oCrvKi7dZ2y9WxLQabNa+VXjXeWPYvGq5muIKaCRUeqPlFc3Z7?=
 =?us-ascii?Q?mLYIwBRGdpmPKhTJWT4gQoUpYmYdNcVNNH38ZnXtgtSXOrn7BFQFpCGkbX9R?=
 =?us-ascii?Q?fbYYuu+Ie+80eoPTlRLLizja0dYZyYiUi+jboKA/ByXnjK4EnUmDMDE9TO5d?=
 =?us-ascii?Q?meAp+cX5LbXQEQwnSjh0UA4FMG1/zh4PZMoWuV+qFUfPMMBlMDwrTG3hNe5x?=
 =?us-ascii?Q?jR8UZRsRmpNSKrnDBEcPGZKR5fJeVQMXZxSplHfyDnkBE8ZlTpK4BNbo/a/H?=
 =?us-ascii?Q?63dK42vztwPis7lqSDwy6a+BkqzHL1qPPoOB0ZICK8Zw9dxiNEOEhJO1zjDP?=
 =?us-ascii?Q?pQOHeOpQN7VMbZwVsziDf5WmL86Rj3Cwy7LEepYleG4L+YhMrxznj2u+AWl7?=
 =?us-ascii?Q?FmZQw9MMcDu89ElB+WdytNBs9P5XzEVoM+58wuiwI68b22Q3SAWQIe7fTQgS?=
 =?us-ascii?Q?5qAmL9sUpUNoKEeqVmH07ibk5eNP+hUadE6vN2vqVvFHApoDgO62GlqwMkVa?=
 =?us-ascii?Q?5kHvwhe9x+AUl78Nh5RMJ+wMLDbrnDq/t80xL1XV6bSCVLl2N49m3p/obbWx?=
 =?us-ascii?Q?r7+ai+7rGxB1WkQJAqOLp3NkW0LygnFVg9kquKj6H9hU92BBOmKpiphpUjUZ?=
 =?us-ascii?Q?/AO9JD9V/jW98HAD0RUWCHU3OFmb/JJ0QntjyvfA4g97oBFF5tcKTUGDkIM5?=
 =?us-ascii?Q?JoPLlJ/nE76W4oGiPnWhKEsbHcBR/BzJ8D8BTJvASq+MZUpK1sE8kj13GW3i?=
 =?us-ascii?Q?6Yd4NLnI1/a3qvFUEFPtsfcNnV5onjy1xRuw5yK2ipP23Nm7nq6szT8Umqlp?=
 =?us-ascii?Q?JSqa1afVafAgPQxM9rY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63491835-6d0a-4716-0ca2-08dd82dc9484
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 03:03:25.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ35deyp/XNMrals9PLCaXORP4yAlCy8LL2oqGGyvIv5PLpJTfCVEblGlT8dRHRhwM2RJb7dBuegGaWzu1GtsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

Convert fsl,vf610-mscm-ir.txt to yaml format.

Additional changes:
- remove label at example dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- move under interrupt-controller
---
 .../arm/freescale/fsl,vf610-mscm-ir.txt       | 30 ---------
 .../fsl,vf610-mscm-ir.yaml                    | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
deleted file mode 100644
index 6dd6f399236d5..0000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Freescale Vybrid Miscellaneous System Control - Interrupt Router
-
-The MSCM IP contains multiple sub modules, this binding describes the second
-block of registers which control the interrupt router. The interrupt router
-allows to configure the recipient of each peripheral interrupt. Furthermore
-it controls the directed processor interrupts. The module is available in all
-Vybrid SoC's but is only really useful in dual core configurations (VF6xx
-which comes with a Cortex-A5/Cortex-M4 combination).
-
-Required properties:
-- compatible:		"fsl,vf610-mscm-ir"
-- reg:			the register range of the MSCM Interrupt Router
-- fsl,cpucfg:		The handle to the MSCM CPU configuration node, required
-			to get the current CPU ID
-- interrupt-controller:	Identifies the node as an interrupt controller
-- #interrupt-cells:	Two cells, interrupt number and cells.
-			The hardware interrupt number according to interrupt
-			assignment of the interrupt router is required.
-			Flags get passed only when using GIC as parent. Flags
-			encoding as documented by the GIC bindings.
-
-Example:
-	mscm_ir: interrupt-controller@40001800 {
-		compatible = "fsl,vf610-mscm-ir";
-		reg = <0x40001800 0x400>;
-		fsl,cpucfg = <&mscm_cpucfg>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&intc>;
-	}
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml
new file mode 100644
index 0000000000000..fdc254f8d013c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Vybrid Miscellaneous System Control - Interrupt Router
+
+description:
+  The MSCM IP contains multiple sub modules, this binding describes the second
+  block of registers which control the interrupt router. The interrupt router
+  allows to configure the recipient of each peripheral interrupt. Furthermore
+  it controls the directed processor interrupts. The module is available in all
+  Vybrid SoC's but is only really useful in dual core configurations (VF6xx
+  which comes with a Cortex-A5/Cortex-M4 combination).
+
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-mscm-ir
+
+  reg:
+    maxItems: 1
+
+  fsl,cpucfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The handle to the MSCM CPU configuration node, required
+      to get the current CPU ID
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      Two cells, interrupt number and cells.
+      The hardware interrupt number according to interrupt
+      assignment of the interrupt router is required.
+      Flags get passed only when using GIC as parent. Flags
+      encoding as documented by the GIC bindings.
+
+required:
+  - compatible
+  - reg
+  - fsl,cpucfg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@40001800 {
+        compatible = "fsl,vf610-mscm-ir";
+        reg = <0x40001800 0x400>;
+        fsl,cpucfg = <&mscm_cpucfg>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&intc>;
+    };
-- 
2.34.1

