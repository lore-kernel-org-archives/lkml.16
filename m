Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D3227BA4;
	Mon,  2 Jun 2025 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875479; cv=fail; b=cm9TX2BX1gURonH64916HflbWjRwgzAbIGNo0OY1zr5fegl078qwEdJP8KIRrlbHcLWEc8paTiZAQIA3TPRHZ8WfQ9rPEhkWck8jQ0DpDKVXdB8JNWO7k5UNhsWMFAWEeIgXvs89k7ieX7wfcj31dlZZjmld5m8xL/3CC/e1BMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875479; c=relaxed/simple;
	bh=GDziKO1VK/jDoJgMMb0Fasmg/1sA0rKaOID0VdfJ9QU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ILHh42RgzDohA2MAJASbtu5TYQvxsz9DsX0Ek+t9dCBeUEhSu+AOIQRa5fW4v2KKoQO8kQiHzliKF4D5RetAD6e6B5koeSPpZ9aHzjtRYEQMlVJ/L4VFO8qBRth9fzblC3NkiwSrkoXSnOMN3Risz5gxt7L5h9WaezG/LuF01PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LuyA/1vg; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LuyA/1vg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHl6ZA+dmzww+m3hHf81NDmbAyJzDIhXKcmH/xkQoK7HUAjXytFSI4IqM1RQjbKITT739amxM9CfiCzKaB4zsC7myIQo54HwaFruJblYoW/fjmOZjD7vmE+JBKCWCWfbr1D3MmLLSaYAjLVj1KaghatsqR8hkmZwq5A2QlopT7chAHIrq5OMWY3q/sdBWM/2N9F6g3QkBgwNF9TdAahXX33i+s2MContGV2EdL56vBUNnOoWzpmFrfqeNcpRCiyjmpsaLGHlcMob51uhgn3R2GaaS71VIR4yX9h8tON5z3fcM6Onf3sJwxI6g4/MPZemCZ4vwY9gs3+OjIWDloDk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM8jUxCT1kRbv4MJGZ2/KmFwVG3eQvPwBxeZHLnLqeg=;
 b=ymAyanwDHCvMf/IpPbXzaGhORpt2ynxjJvAaoZgQhE7fXeJP1aICgiGagKGRM8kGnBVpxx7AH2aaGcR10e9RtiZuZiDK3L3hIA0GMICeOFmKjPN717EqVZzTFcbut5gvjM4f6JcLbHmM0vfOIvS+4oXx6/eBzmLYsm4ALb9o3FNHWoE+zq6roIvRAijsDmrsa5+DyrMeHoxxo9xoLfhnzFy5iAL5qoK+o0Lkf3qZrqeyybvFjIpmW9Yru4C3kqA09ZsKuUFqY9y3taMocMWohtt5dy4Mw1ZuB0MLaaf9OWDxj37sKfoz86gzHy6FpJnf49OaU6x+emXY0bczLo6ubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM8jUxCT1kRbv4MJGZ2/KmFwVG3eQvPwBxeZHLnLqeg=;
 b=LuyA/1vgyXLOErYQXKGh30f7yl2bjeuyO9EIw8BQSlmlL16Bb3jvw3S0zmo55ulw5IK1OwVbvdVIvV0BLTnNvcyoISfm4ztT3UNKLFCGgePGSYr/AOQMSU5dupkZXxb3QSSgZaRa9gizGL6ix5dlHW6extIVwqqFUkON80/d61s0EMnhKH4KBCoIvDv3axqJCOfu2F469PMgS+0iMdZZ3PyfYAz9i9WO9C4BADWIWbglF6pkzcczc0B07j7/LDQkTDFEvlAYvMaXetD82kwwQvk/C2AV8Sr2YJpGTgySubvQ1QpA0YMdYBGfdP0Ikk60Y2MDidUci6GNhOH35Xf8Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by MRWPR04MB11286.eurprd04.prod.outlook.com (2603:10a6:501:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:44:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:44:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: nvmem: convert lpc1857-eeprom.txt to yaml format
Date: Mon,  2 Jun 2025 10:44:21 -0400
Message-Id: <20250602144422.944454-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|MRWPR04MB11286:EE_
X-MS-Office365-Filtering-Correlation-Id: 067c1b00-63d3-437c-f545-08dda1e3fde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?udB3O4ouFnUxKKslSN0+ZRS6xja5YsI8asV55ObtoHAo0WR4rs8KD3+kB7gW?=
 =?us-ascii?Q?ZpXN7JChi061vDDHbjRygRfPH1phkj4EWn2tdbi1VrvnIF/6NL5xC9GPFwUe?=
 =?us-ascii?Q?2yr8as8Zf1/Iis672Ckh2tPj47EBT+tQ1KNup3hdsyX4OSTOoFjt9PbeetTA?=
 =?us-ascii?Q?VwCJaH1IZz0AWxiPSYZ/qOt7Xklm4+r6pJYKk7LuUNx00cLFqR5NF0ocnSAr?=
 =?us-ascii?Q?xya+y3oMtCZayPM1mgWQx9nZqaRrQHSVJFmW1tGyPDkckAihPQhqN3CRT7QN?=
 =?us-ascii?Q?as8ObusVM6GXbJUvTRFO/XwhdkrB7QBLGHaMLwk1pp37lmV75u4f6ijIdbaA?=
 =?us-ascii?Q?3Ly2o6U+XadebNqFLdZC0qRnWQHNnL34ov7/P+xr6IqRwU6HfbP13LOSu8PG?=
 =?us-ascii?Q?JrdssqS//BeKgzKraoYvPqmW4AFfzLVEGnfI6wFlbJqqi/W8y9nwoTDhqxBN?=
 =?us-ascii?Q?tCNr2wzoed6x4qeW8yepiqdYw2Kmx+W7vVORn+d8lHI3xmJ20n27GKDYNWwn?=
 =?us-ascii?Q?I2SoiWdlbBuqrxXEy/PwENc9Qk0JENUlbttEPrYnsYvuT6sIsEDaOCCZ72v9?=
 =?us-ascii?Q?xoU6+Q2IIT4m88PRu7++TY6rNU0+Eu1YbjxMx0g/0hnxdvuRd3m/j5uj1FqR?=
 =?us-ascii?Q?LXFF4vJgM/W8GThjjkUFAH/UpO6jp+eHBJbAiWDCX04YHNqfem7JhtuAJcbs?=
 =?us-ascii?Q?q0woHXv6V2Bw8M/W/Jr4YyHYlDEt9lTF+EAleIU3ZhMrl4PG4jbHtvHx32aF?=
 =?us-ascii?Q?0c+ldBFzs3aR+q1ucJQt8SKcx1evfmKQfGfNFbLqe339EQTbovxR+kUZjTCF?=
 =?us-ascii?Q?GIKrr0NTI76QOHmlsmoq69gnZECBO2QtAJ5jcN2i3fYEVv7r99jneq+sLT/3?=
 =?us-ascii?Q?cjJwxfFvT8ZBUFSV5llZEWgdkygezpIv/BFBvxbtzioE2foBnwBvaptGXfPT?=
 =?us-ascii?Q?XEXsQdmj7BCfZjiyOJ7ZArWzKFY439eu7RWhogXKPRL4kJPxnHcJv6oKpDHq?=
 =?us-ascii?Q?/wylbSePsjun0cKyW9NMIoFz2UG1IzidL9LLTCpKhMzitHnOzn3XOmW4efTv?=
 =?us-ascii?Q?Ll2cQ+LOgmPZRyyoWZzEwu6J/z8YEsp1sUfikGzfWp2R+2dkHoBhXWLjXY95?=
 =?us-ascii?Q?6+tu9B/cr7A7xkNtBdz0pVWG7Vt7UDJjfAt75NAgTsug2JO5kYcpzPhuukQ5?=
 =?us-ascii?Q?92i/wuuhENKhUmTJwrG2ztBUXdzfXaSaBelLNEHYqEUSiPTUNvtZ6cTZoiV1?=
 =?us-ascii?Q?EDIBfqITu9+sqVjn3Zfqrv8/AcnSKIWIf5rrE5LbVIrMo7zUUApak9s3c37Y?=
 =?us-ascii?Q?o4y7aBuX1ppnX2NkqjbOzfBnjOY0fc3dU9BPf8768Z0arht2Gep7Nl7xooWU?=
 =?us-ascii?Q?W3J3DZR+bOjH7dXZ1HYukwc6dPpI8dS8wU0VJmL1xCdon91Wf1K95dJPC53u?=
 =?us-ascii?Q?HdGrGCoB3i7CrCizCPecUts+YpFA0uZL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JSNVaSARNPGJRW8smkyplqO1Zb+gimoqVWT5JWXtg79txrHqPa7v5d8fj/yF?=
 =?us-ascii?Q?HTWUhFzYkDMN3XD1aAg/3TBNmN0P4gsJd8NNGLplIsoqxnGPjjS6ROzy+oZH?=
 =?us-ascii?Q?SRJJTv0dQG4rRhxOHYVGJ4Ql6NNgijB4+uz6nIdxYG+X58Ag/RJsuQoMNdnH?=
 =?us-ascii?Q?GWv5rbctVDa8VKBVDj88+y2r5dzcUYlntGBhPsvH5RhW5Cm5GiED9xwM9eoa?=
 =?us-ascii?Q?RTCJLjSyzmY/6OoVvfD/ZgB8ZVI92OaN32tVXS3SoDDpZvG6uCzy5urNX7Wl?=
 =?us-ascii?Q?2/xs4Bq+iulCRhvT8ZSG5UDFG8wLamLozTZ/Q/8hg9w3ZaptayNpg2W2Abu0?=
 =?us-ascii?Q?fAFjklJKak7pG7qB2/20L9N+Ch2n5lvcGB5nHEwcG/b0XcaJU3b+frO/r23B?=
 =?us-ascii?Q?fL1/cXhW2ZPgs9KA1Ef4C2GsIqsr0sTqnkzHG8+c5Jdi4x4Cc4PB5KbFmzr2?=
 =?us-ascii?Q?vL9Qj7KP5+6ms0zYuQnhKCpY1cPLW+rU558/txoY9uhF6sgWEB3KnkU1CW5M?=
 =?us-ascii?Q?n6PFALrlsfPoYKAqNW1JI1u0eNTVF5R0jZR8K1EeU0f1ki3BxzWhozbto1jR?=
 =?us-ascii?Q?2ctcHp8eoAPbn4EKU8q/7ctUfakD6AYhUM4g0+nOcP8ICe4o2zhHHiom56ny?=
 =?us-ascii?Q?ehx7uCKPfZTKG1VtX2P+cn4wI2oVNtWeoUymdsmZh9CLeeUFxGrPvVRyD9b+?=
 =?us-ascii?Q?SJcjqYyOaNsaBmDqUBpZahQDyilNW6aKtQ5mJZ9EcdCJAfRByk7O5eHiK+QO?=
 =?us-ascii?Q?XBhwi889EQtX0kjBXxhwp02tEQpqE/H5NQE7+m5lERTZr4sU6S14g+1aNhf2?=
 =?us-ascii?Q?8HJBgR11TeWuHa+COeizImFyQPyJUX5w4nVKF2LQZ2nPe5oOvmmDSSxL4ptN?=
 =?us-ascii?Q?H43i4jMI2ddfsiOIasRtQeAKRtphCnwqCypaXIbyMjqcwQWFbVvCgmy3vQOW?=
 =?us-ascii?Q?l9zTS2lAdwUySgtYsq9CugtkoAo5qnGS5Gx/wejTOmKk/MYVD+/K5eXm5k5U?=
 =?us-ascii?Q?PQdUDV0x2jKGGl20vwooxTtwo/0lwjp8mOUCn04cdPP+VEY523PjhspqWUTV?=
 =?us-ascii?Q?PgAxz+kDAabk++lVt+M+bJ0R7NhQVR15OwKbTHt/XbdoT3uzMVE2o69aZ/ee?=
 =?us-ascii?Q?rzri6sz0w/5NTlWziZEjHhFaUKQrnxDfTtNxMKfQUWkxbq299XfBLpTsYb2U?=
 =?us-ascii?Q?noU2hr5Tch7+kz/5ThnNaN1UPYoNq+jow2kS+LEv3UbI6N8zfQIKHlXlnaWK?=
 =?us-ascii?Q?DDtlkligHLOviHZ5y1ga3LPgtfwYk5AdaQ1daTVeZzgOmUkk6w3T+PnCqY1G?=
 =?us-ascii?Q?U1nRgnXhtpMagpLPYaE7N86omDuwlDi9Wr3/QCtyMHny7deQVb96HkyFd8x/?=
 =?us-ascii?Q?FOPv0FC4yyxkfKVtZWXcNVJDrOxqVOiwtGMeTV2ZqgyZT7vERPbigcB+sEPN?=
 =?us-ascii?Q?CYENotm4WuWZiN4euhVdlTRK6wLaO4mrRPd7l9Py+F2KHceIJMxfSJX1DUWD?=
 =?us-ascii?Q?Mu18g/hEAYe2P1Ntx/WBlh6+WaztH6O+/7Dj2V4dyps99MJam6nVrYN/tAH5?=
 =?us-ascii?Q?j7OBeRC/uapVP4rciiw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067c1b00-63d3-437c-f545-08dda1e3fde0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:44:34.7371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcTmn0n3wlrmp6LFj21PXTQu3mxCpjX3+3nFKBTkO5sQoV/2Z2a7+jf9Jc91ig8dh6xtZajQarrYhU/RyM+1hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286

Convert lpc1857-eeprom.txt to yaml format.

Additional changes:
- remove label in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/nvmem/lpc1857-eeprom.txt         | 28 ---------
 .../bindings/nvmem/nxp,lpc1857-eeprom.yaml    | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
deleted file mode 100644
index 809df68f6e148..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* NXP LPC18xx EEPROM memory NVMEM driver
-
-Required properties:
-  - compatible: Should be "nxp,lpc1857-eeprom"
-  - reg: Must contain an entry with the physical base address and length
-    for each entry in reg-names.
-  - reg-names: Must include the following entries.
-    - reg: EEPROM registers.
-    - mem: EEPROM address space.
-  - clocks: Must contain an entry for each entry in clock-names.
-  - clock-names: Must include the following entries.
-    - eeprom: EEPROM operating clock.
-  - resets: Should contain a reference to the reset controller asserting
-    the EEPROM in reset.
-  - interrupts: Should contain EEPROM interrupt.
-
-Example:
-
-  eeprom: eeprom@4000e000 {
-    compatible = "nxp,lpc1857-eeprom";
-    reg = <0x4000e000 0x1000>,
-          <0x20040000 0x4000>;
-    reg-names = "reg", "mem";
-    clocks = <&ccu1 CLK_CPU_EEPROM>;
-    clock-names = "eeprom";
-    resets = <&rgu 27>;
-    interrupts = <4>;
-  };
diff --git a/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml
new file mode 100644
index 0000000000000..df634fdbcaa13
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nxp,lpc1857-eeprom.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nxp,lpc1857-eeprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC18xx EEPROM memory
+
+properties:
+  compatible:
+    const: nxp,lpc1857-eeprom
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: mem
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: eeprom
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    eeprom@4000e000 {
+        compatible = "nxp,lpc1857-eeprom";
+        reg = <0x4000e000 0x1000>,
+              <0x20040000 0x4000>;
+        reg-names = "reg", "mem";
+        clocks = <&ccu1 CLK_CPU_EEPROM>;
+        clock-names = "eeprom";
+        resets = <&rgu 27>;
+        interrupts = <4>;
+    };
-- 
2.34.1

