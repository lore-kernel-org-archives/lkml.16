Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458C526F44A;
	Fri, 11 Apr 2025 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406643; cv=fail; b=os9He+uygCeJos58NDTlAQS8fU2vnceaulfJTPXK3BNwVK6pmXvcCpI1Q/0qnVdS1j/3WMRKTbY3pqWoFbtjBPC3GKUxJ91ENXzgQdfckQjsVNGS/EQcbvB8iHLbAONtNPPqvZ5XW3EILt/TYrexoM44GzykNb4ekKpMAPF+J7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406643; c=relaxed/simple;
	bh=EWZDHpYoN914Q+mL+PGPJ4G20yl9kzHuXt1Q2rkSkYM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gPm0j4Nz+114mpiVu0GilE1y0KOoxSSzp6nkYh+j6yjHo1tJUnrTVJzNYDm0u0h0y3S/6YLXYON1aRcwvFtHn9uZOvVnhdaD1VUPPXwGK3HJpj1HjRbzQiwYpZFknNhTNmKA0cDicx5PSlxeDMBYGOMTqM6BCceTYlAwysyBhTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RNGK8vj4; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RNGK8vj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj8SOwYnnyYddMsW+EaRcczmznEQRmdOslhP3OFEaSleAXT5C+pXOT/NNB/iGyGXefX2QDK8bxUa6iMqCfKqCkZpK6Q2dn72ZBC9wJBY6PAag7aqTbWHP9xs+PkqrTefObVewl3v4ZCH7TYjRFt7KF70rH4pW7R8SYL4QKVEQdqYupHogrhnqCYNsQNcM5ggBahAFxHZDxQhq8X255RpbYqyALf7URTrLG5vbmqFUYM8Fh01MSmi4/FqzV8Z5lPGBMthsEYj1BTu5dXcw5Ml0iCuKt7KeOA6HiRrQSD8w2VKR+IjZgbjNQSAV3IYpR/O+l1DDbFrhubgaFJ7R9MkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkU+DzXGJYV+I09MCnhKZkDKbhO9q03Q7OQCBOLVPCw=;
 b=VH6ttKnkWdQ1PHrPfcRRhImrfkU0pvsOXOKu5UkI6VqcdD3omMQTzCvlkE83D7caQ1zwWutrj9vTtOYraMdGmU0bWOlgaN+ymnoJ1wDXAftN0yrtSKjGtaxqeNNOFevMU7IgAz6mjl9qA48TMvjVdBfKk9DfRcjoc/WN/kbcUk9Rvqts4CsG6DaXSzE90x6DnN0KRAkHseHwNNRvyoSEUy56xYibOQiT0+vkZo4vGcm2yzlh0P47+ftHper8Kvv6EuP2HVyBvUpP9XgZVjrFFghW8hJ1uesIMouvYlzBChSJhdbacL3tVzYyUO1NjOcdmiHJsWxctHlSnFyn4CWu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkU+DzXGJYV+I09MCnhKZkDKbhO9q03Q7OQCBOLVPCw=;
 b=RNGK8vj43XXvW1S5h/Kf8TrslfCajwhMHwNcOlnHqoJqirF/4jfUyfl3I5zBSG4kgxHz2S3OmXw6Q4k47GTBlX6b55j9U9ieJTQ+cohPhB4EeqGXZeunuv8z4pdJSuCEg8MWky7C5PjoIlhYmth0mXbFWSmEqZ08YqbcBU/Qmtm+BbcWR1Esz4kjFXgLJWIdkiJbvV/bizFVWN9UZ9WMFMU3qwKusoyPqiJWHEgJkQZcppRT9dLuk8E1n0iU2bHTsVE/0r5ztVK+N/EeMdErhUvclSqov8H+XIVsaMnhawLwsHYifJ9yQ35jpHPbeae4IBUgTJH5+EQpcrnOsSnDFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 21:23:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:23:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: clock: convert vf610-clock.txt to yaml format
Date: Fri, 11 Apr 2025 17:23:38 -0400
Message-Id: <20250411212339.3273202-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0131.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: be6042ed-9148-43a0-701f-08dd793f289f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x1dnXM7wNanAKEUvzKfskMXIgAIjxq96JOWNXt24Ii6Lge5qJE4jXPEy7/5+?=
 =?us-ascii?Q?YSBvnSYiQuqX3Uy6E/jOKJmfDEV8M5nKa9NNdrLwxDUYJLdkfzpZTtSSSqWQ?=
 =?us-ascii?Q?7++1dY4vROHBJUOYRcsZXuLaLTihtxhFIzNgJtEyUgKFiVFTC2qErPXXMfaT?=
 =?us-ascii?Q?eXIwcvdXY9dG3UZqP0gn5x0veUbyPIY9Mgzy1X5szlGYyiTtvVit6CawmRy6?=
 =?us-ascii?Q?cb/Rp4enzHjeZI9SqLlQHy/0zTSy8rjGECb0FyA2fD4xL1s+YbrS6SXNb1QW?=
 =?us-ascii?Q?moFIoyVqR96Onw54jZ4LLdUgOTSuQSkR1rqY/hPoKTWnjQs+efnwWCG8CvcA?=
 =?us-ascii?Q?Dd0mt3YyqV5rCX5laHMnKaEwag2BuHUCSb9E+rkADJ/KRJ/E388s01p3ZITm?=
 =?us-ascii?Q?kvtk2lA3RbJS1ijHAC0sgHn3Q+GwAu0Roj+kMd80Uj8drQD07pHv3qjdCVZd?=
 =?us-ascii?Q?t71VrhUpk6vUTsyG3VbekYE4q7Lg/9amhpvyKUZKK2TLzAfQXxLZBYAMoPUc?=
 =?us-ascii?Q?bE6lD+XwpMFG+s4ZSka3kMSQLLxtKf8SnIMAfL4P31PmDBA5UJJVlcA5+QWH?=
 =?us-ascii?Q?bTufvW/TKItkzlAoeBmFhLpi+xqB4WFBJywZC7z8aHAZEGRfVULwcsAWI501?=
 =?us-ascii?Q?YtUyoFHgIKL3pEp46N+1uZF28Vt9TLn0zfE/2v2k9/pqqm5dHUvtaa875gSs?=
 =?us-ascii?Q?cmKalz4pFLD3z9AiR78sQ4rqR9+WVylk8qhFaxwAUiQR6fBKjo5VTreX3VQV?=
 =?us-ascii?Q?DVJqZvV4Iyp23qEFYf/U/VT1UozDOdpm72tB+37mLV/E6J/U+5BIiy9DQTg0?=
 =?us-ascii?Q?+kcEbDBnXkNAluih8JKC7WRugIssIZYf3ZCx4jXRkPFH1h6vP6UjgnaSw6qE?=
 =?us-ascii?Q?Sh4FvKAWWoXiOWf12+oAWz8woO0UAkBVXaRBgAxErLLuCTTnH8I/D+GMgSB4?=
 =?us-ascii?Q?Q/i19I5voum+/77Iz/0xmQFVqis0TrtbXDZb/6qmBaUl4rqibLPvzDedVjqt?=
 =?us-ascii?Q?TP+93nITO//Y8jWLC8dyk91q4qhRpj/KCS9CL3v54YMxzNWE6tzuND05LRig?=
 =?us-ascii?Q?hbQqvim7J+Nsn6DmtEKJ1+XUYVJMerAVfPPJJyXMod986kJjJkLZ+hsZ33gz?=
 =?us-ascii?Q?3RA6EkaL43lLBFQg+7K9+Dmxz4GVQAiwht33daFdrzq8t1Cga20zlbjfPZsR?=
 =?us-ascii?Q?2EmP5JHAFZ1ipD+qqzKwcraBttmOasEYdNFtIYqRMipxGKovjx8EegugHzfu?=
 =?us-ascii?Q?4UqbOM5VccOIqunxeudMODT71FbLCXg8BmiA2Xwlfr22+Da5N2c3VNU2oy4M?=
 =?us-ascii?Q?OM+lOlRQVRVvzfWAk7F9BhKjZIhTF7BU8LGIowOo/TFi1I/YLpQdhSduO7Sm?=
 =?us-ascii?Q?PpsDOK8Klukpb5KtFDROQPjMUWvZ0dgIUXSxBarWN7vcyKXkrcR97pWP+467?=
 =?us-ascii?Q?pviDmCE75mI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T6Tcdxg8wXsAPkBBlX6PNXAKUJnzNn3xKoyMoIhfOM8taplW2OZiIfEyjMP5?=
 =?us-ascii?Q?SVtYb65bsD+VQ0+tgg4vVHHbE35n1wfYvaCY4m2iv6uor5T+wNeBWXhwE3LE?=
 =?us-ascii?Q?hiR4vXe/OzoCX2wGVbXwCZ1vDdbJCI9XyoI+nMqgpuoe84mVDpSWda2uYpjO?=
 =?us-ascii?Q?B7UIkdYl7Vqfa8xFtIXLwuN1tGV0rrxpTfJvG+6hCc/Dphj/V0x51wDLLED8?=
 =?us-ascii?Q?krxR5AubVSqn4Rc8qP4hZQAX4ED0gIjrb8hFYPFlgYyKXZlWQQ+wNSkhbpBE?=
 =?us-ascii?Q?ZsYD40An4G7igLX8liNa9vv/dqkbhy7t77Xd5SHaemPj50FFw9DjoKysBpI8?=
 =?us-ascii?Q?JJEApbCa9aB4Ezi+MReEogb/lgxe0dgDiENrZjpMnRgif/XC45be/oGJpNZT?=
 =?us-ascii?Q?DFCAmoS2yq189dgzukd3GaHFbiHr3cnPK1kH7v0BEUN/YR4+wSJkAYT0ynay?=
 =?us-ascii?Q?W/jf+Vu84t+SW4nNo+zukfI9vTe5YkORZK1pQtvM3UZlMnwoNXnfKazscnJ0?=
 =?us-ascii?Q?z5byJrMmXGQW17ATQ0p888eGO+ONZw4DmLyKy3AE6x5ffOiLXanFD8UMyDTr?=
 =?us-ascii?Q?iXF4+HHWOffA8OYtlWWfikXAsGasyjEF4ASKYXaE3YjA0Di4JSGj2POjwtfU?=
 =?us-ascii?Q?RKoE77vl5aTTRfvAu2d1JE4St577b64oH8WGKo/PLM82lzPCTG+68IBz73l4?=
 =?us-ascii?Q?mRitH/X9O/VUcS+K4bRiRxMeJ3X6LdFNg8Jw7zIG3GwIYtvyh9zaAnlA7mh8?=
 =?us-ascii?Q?SkYJ+7ZLnmWCRyF3MsWN3cLNwwrOD5O8j5tniAuivb2CFhXyf5Vmn7BO4GPc?=
 =?us-ascii?Q?LSbNa4uew8d147PnDPMIZIrHhPG8HY9Cp/xcOCdaVeNLgCYTHZ1zbHtYQlSZ?=
 =?us-ascii?Q?WE/pMzLy9q4uZu5uZHp8Qx/cs7hOvK6GDIduQyVObD7WNHlE3sHwjKj6SG+j?=
 =?us-ascii?Q?+3yfkFdmnMLoBHT/oe7cmZLqSpSXUzsgJ+rLMwTSIjIJUnbPeuKmdlq3MbtQ?=
 =?us-ascii?Q?1kv/eIbqr/FRkqsp/8USTmHegj9aiEyKGld+Y9HZneYzGiIJxR1vm9O0XYxq?=
 =?us-ascii?Q?rOEGaQsZ716WMgA43Txi4Y81Mc/EUuW6DSYrde3574vc8g/g+vz96c3Q0BQ0?=
 =?us-ascii?Q?GDOnsMYiGggwjHe3zky8A8tKHByDPMz8pTVflVMcrKNl5umZhseAbxElQZ0E?=
 =?us-ascii?Q?WCqFCb8PbLM3bkxg5neIfn9qL/VRGTo4EuacYtnuYusiwvrchVeJ4n/24V0U?=
 =?us-ascii?Q?Cgcljzg1JUO8nBAJZjRgKBQeMwrS9MgKwISA3XblHsCxtMxgXMHrWDFt/Uuy?=
 =?us-ascii?Q?5B2hxoCquxOY9drmMXMOUYVjJdUYYC0aazFlfDabXFzgKycXoiSrBavNMsDM?=
 =?us-ascii?Q?TfGhE49SQpGRtbesXqeA3/ezUgChnpCTljypI2Fq4Tka8SJTfSCfqVAeu1eb?=
 =?us-ascii?Q?KVXMsiAtEqFDpXtZtF/I8Nd9FYHa0hVsA3FYgXTdZqWS/uk0uNrN+sV8zl51?=
 =?us-ascii?Q?57wuwAHjAl90EsR7WCAeT8vPfKTbEn5XVEi+z/LAoFXik+vAEOTO7qgoByA6?=
 =?us-ascii?Q?pTa++8Dcs0jZOvTHGSSMYC1OGo/mzlQIVm0tDJgt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6042ed-9148-43a0-701f-08dd793f289f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:23:58.6183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbFIj38W00xsQHWRmkz2MQNLjmzLs26oqSu5dt1CG8gRr6G0+c/UyqOxjUxH8dFfXWmE8JFHL3eSQOFaT9kGHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983

Convert vf610-clock.txt to yaml format.

Additional changes:
- swap audio_ext and enet_ext to match existed dts order
- remove clock consumer in example

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/clock/fsl,vf610-ccm.yaml         | 58 +++++++++++++++++++
 .../devicetree/bindings/clock/vf610-clock.txt | 41 -------------
 2 files changed, 58 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/vf610-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml b/Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml
new file mode 100644
index 0000000000000..29ae5be51acf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,vf610-ccm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock for Freescale Vybrid VF610 SOC
+
+description:
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell. See include/dt-bindings/clock/vf610-clock.h
+  for the full list of VF610 clock IDs
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-ccm
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: external crystal oscillator 32KHz, recommended
+      - description: external crystal oscillator 24MHz, recommended
+      - description: audio
+      - description: enet
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: sxosc
+      - const: fxosc
+      - const: enet_ext
+      - const: audio_ext
+    minItems: 2
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@4006b000 {
+        compatible = "fsl,vf610-ccm";
+        reg = <0x4006b000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&sxosc>, <&fxosc>;
+        clock-names = "sxosc", "fxosc";
+    };
+
diff --git a/Documentation/devicetree/bindings/clock/vf610-clock.txt b/Documentation/devicetree/bindings/clock/vf610-clock.txt
deleted file mode 100644
index 109ffa3a5b661..0000000000000
--- a/Documentation/devicetree/bindings/clock/vf610-clock.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Clock bindings for Freescale Vybrid VF610 SOC
-
-Required properties:
-- compatible: Should be "fsl,vf610-ccm"
-- reg: Address and length of the register set
-- #clock-cells: Should be <1>
-
-Optional properties:
-- clocks: list of clock identifiers which are external input clocks to the
-	given clock controller. Please refer the next section to find
-	the input clocks for a given controller.
-- clock-names: list of names of clocks which are external input clocks to the
-	given clock controller.
-
-Input clocks for top clock controller:
-	- sxosc (external crystal oscillator 32KHz, recommended)
-	- fxosc (external crystal oscillator 24MHz, recommended)
-	- audio_ext
-	- enet_ext
-
-The clock consumer should specify the desired clock by having the clock
-ID in its "clocks" phandle cell. See include/dt-bindings/clock/vf610-clock.h
-for the full list of VF610 clock IDs.
-
-Examples:
-
-clks: ccm@4006b000 {
-	compatible = "fsl,vf610-ccm";
-	reg = <0x4006b000 0x1000>;
-	#clock-cells = <1>;
-	clocks = <&sxosc>, <&fxosc>;
-	clock-names = "sxosc", "fxosc";
-};
-
-uart1: serial@40028000 {
-	compatible = "fsl,vf610-uart";
-	reg = <0x40028000 0x1000>;
-	interrupts = <0 62 0x04>;
-	clocks = <&clks VF610_CLK_UART1>;
-	clock-names = "ipg";
-};
-- 
2.34.1

