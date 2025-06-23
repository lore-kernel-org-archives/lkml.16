Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57711F5617;
	Mon, 23 Jun 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710422; cv=fail; b=W2NzGDwMnhPQgdb1sRa8FgfUS3DB/WoVOEdLrK18tOiqrgaDU7ximFYrvVFZcVUiwlGQevSSJdq2PHOWYc/n/Glh8LEwc1b25l9KSNvl3uvpKKWv5oaE5qaJNKQU8z3HZ0pEYWv3NR0QtKpqfHiMa0faDhSfAi82eRImRxNk95Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710422; c=relaxed/simple;
	bh=/x8lPGQdcdWvBUNfhTqET8lEFQA0EsNn8n6xjUbPft8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lN93hL1dtkT3APWOc0lSO76G/TlrsH73jxLQFMm4nPCZzdoeT0zHc1tRVdVIhDHbgbCmhERUWgLCktT7ZFFO6iRqPPpdoedNXQvSYDvbkDv5psEXwouzUwKeFmBlRTKh/uPl3W8UFOE2h//2Wba1wRuzr8aJb16s0Jn8IRtoH48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JIebDiJH; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JIebDiJH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbP06X251/lSMmu3IqzZg4gPVHyvYRP0l5cdXLVsLYUDDmr0U1W/5+dM8c/D4pLnfs06BrkOTAB+/FYSlp93pFOlSTsY2DzFJnbGy7gkMGXkyL5Apl8Yhc/WuZpzkyg2w2WyuPHbUy/3moDDj+o8kjBki4pGYSoXQ5Z5/3BptDOPMjShoyKjIPbc+fCUj67TLtjvlVvO9CdaZ3moMUTnPhXVlWV/teLrmO7Q3oaIiGFvKmkfaHwOW6v1qo+OpvFUmE4rM6v4EdYsO/SkhTUu3SOrWuP3/0fxfvuokJGKtbLUjoPHZPuvHCAzjTln1PjYre3SJEllM5Qs2CPXoa7evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aam5t5m+PhmcMtuwt7AqpsiK6i5Q9hwZpinhRIvU+aI=;
 b=I3Dch2JhYJXm1xZH826hgfRf9AUmxSBBD2PcOt6ULHZB9hUiER2wYcZrWTaCLTkT1WF+vvowxmRs8b2l2XDTOf6eSAYRaQzzHjkr3k/zCvrrSenhgqvXLYjN8N3sF/o/62ezQPwD6uxAwRqeSCa4mMd5ArwvNvrnNm7AH6ehVw1hDhwo8Pl+iQLX8R2/o/2qG+fGYFFuyBAmwfswhmftNDH8+usj4GjjA6MWhbpVPbVd773E82I+FLMDZSBmsR6Amdj3ttewbdOW0MdYKciyLKdrjf5BG7WV0YygaTiGWZdhA/VOZ8tZnhtqzeYMmH3lRKhG7UcNNXpPz0y6zt3oLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aam5t5m+PhmcMtuwt7AqpsiK6i5Q9hwZpinhRIvU+aI=;
 b=JIebDiJHB5yegRCMWe8fn8zgS9BMMBULB5fGdropDvNRYZ/b+tWgVHOLd52JDVlHLktl2mg33ZpSlj/o8ScwKgtFF4jAIQ8OchUOW5bhJkD95iKLM7l/v7Kv5KLSWOWxHU5s6gkDqujvdtirRyHpmqd1UFOpgK8Bf2VYtGGlm67YetATCV09NMYfGTcY1bcKxkrmdjSYS8E5n+/GN8DBdIsKZDkHiUMzC+1iyXGs05m+gMwDcqs9V5rlhwEpT1Gft2AVhrqOpqiejZOSvZ2YNFfmzQWOq6fb/r+byESAsp7lgSV8TfU+42RYwOUyQTVcsKvPsVGxjopzRrbNkN0s3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 20:26:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 20:26:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mtd: convert lpc32xx-mlc.txt to yaml format
Date: Mon, 23 Jun 2025 16:26:42 -0400
Message-Id: <20250623202643.2468759-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:510:2da::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d46a5c-bf31-4586-64d6-08ddb2944bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SUIBI/qJIrEqT5SZ1TeiDnGyC/30pf9h7osCZEi9no8+UoNAb3OMRZHblFon?=
 =?us-ascii?Q?5uSwdy532MdeedHxPE/zaf7Jo5muf0/EzaDaf+3lYWaBFERSzSHNy0k/ZKfd?=
 =?us-ascii?Q?X9JKUC4m4ZodysAAjBuOshZykvfpPOJfgbLXaXnCfOSe1ZqWB4yIpdw+Fxtr?=
 =?us-ascii?Q?owafNgwpVPDuLD5RpgXjfxQ5XD1voAuPQF7C03eUUYxi97fi0TSs/QxokU/f?=
 =?us-ascii?Q?iiRkhd9aE+7bdL5MP8L+lpxGAROigINC7548iqWpeTZ+sgXad85JjtxOO1nB?=
 =?us-ascii?Q?vTts5QhWfGQi75CJaTGutQ/H7PNs3QDF627YiVvZJjc4F5BddGCExNoagqhA?=
 =?us-ascii?Q?ZMK1tVsEYxzCeJrZN770YwxVFKRlynRJZVOjIgvd09+hWsPDvoJWm0zgu25Z?=
 =?us-ascii?Q?e+39Tnc/nwpxz/D29BCS6SQpkDaCAPZsO37qIim523t9d0ZYjHN9lOd9joAG?=
 =?us-ascii?Q?bICmn3lt2VDs8nhbBivdK/AnVWlayvzPYg9X+WjQK7VRcQKVm5DSV/BkNdr/?=
 =?us-ascii?Q?rTPr+AXV7Aj64JDMKxqN2GV0s5H5MTFNmLDK3Rkm2GlBz0Qp8MliVH+p6KB6?=
 =?us-ascii?Q?wT++GJKroYOiI0YgHMPJs4JBiSudC8+88oQwFMsHHTnS5gH84iDvGzwCsB16?=
 =?us-ascii?Q?iUCe5xP4AbbjZBuk+XQimUlD9I1bgoEgYAeZZBOZ0lNljwMAsDR+T04Vm64i?=
 =?us-ascii?Q?zHGp7yLVt2NDiM/kio2+gwTzOu12hRIHmTt1pViNWnW1v804L3HjUwC6QlNH?=
 =?us-ascii?Q?zlkNjLqrhXLu6oqxwGpUSPBGIBLFTFysS53TtGGzE1yT9+TIpMK+vMrMD3Ra?=
 =?us-ascii?Q?gnkeUUimtUwGz5UFufC5B22FDfplQFMm4EiYcb285I5TSQrvhwVb/JavHWkm?=
 =?us-ascii?Q?0kziFEJGaT5s2Mno21y/JTa7vCkogWdJejqQwXGaCiMhmiClECP2ApyJXLmd?=
 =?us-ascii?Q?u3lEgbB+gv6Aj11XjPXkrn3AVDAWcNVIYD8a/Du1pBi9VBbOhv4zRBrSrJSU?=
 =?us-ascii?Q?VE0TB6ZgcXbtAyk1DlenLEvKtY/TM5Wh66365sXfr5NNPlXPK3Nm8HxN7FwQ?=
 =?us-ascii?Q?R8HSXrsR9Es3h/hAhjHV312JyrGyTXsPQAQvaKUHl8kZY1var1rnSsYABQku?=
 =?us-ascii?Q?vjKPvQ/waZYjF6lny6BhboyNUlU2tw0OIXImOaCQCl06hMtwGO8Fu9ZvdM1v?=
 =?us-ascii?Q?1QzD6CNAN7eNXf7a1wx+dkgveamNbjCxSEngS/tL1UsaNsI9pVhsxSINQTxN?=
 =?us-ascii?Q?N0GgmCFxpblHCasd28Qm13F4ICCy2M+cNcwC3TX6kD1T5LplKvOv4rtCYm0O?=
 =?us-ascii?Q?TfoGDPMh79u4mzX8bt4m9h6NVKCuG2URaTD/NYUfn59muovFQDy6aq4jseen?=
 =?us-ascii?Q?GoyG6lIy4tjMwLoDhDhhkZtR/s9dVvLpqR5bSt1O/HFSLmzdFdPirTPTaxOg?=
 =?us-ascii?Q?pDzDutHOVGaZzuuFhswaELeMtO6bPEYN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W+wRj5z+fsAe3Q+E+/sVwP60mf1tZi7F28ahN7TfwZXGiq60keiuuA2qpJ39?=
 =?us-ascii?Q?tpza5x8VsTmWuezVL6wc3ukpMim2Z9QQlQCEizzYSsOvL1CwBNghZxCqlEVr?=
 =?us-ascii?Q?A7K26omyuH2+jYvsKg3uygdpIZEUIJBije8olJEvdESynIfy/1o/UNgTxuHj?=
 =?us-ascii?Q?nYAE5oCZSV7I2zH637GLuJuOGwYnHAOl9yC/h/eeK5fue/LhandYvxFD5vwq?=
 =?us-ascii?Q?LH0Iqed5EZRrbQZ7cepI5Mpxg4IjnMiAuqkiul43gC2kZlvnsK6VPWZaDeNF?=
 =?us-ascii?Q?8U01fgaYRMsJflsiRW7CWVsDE5Paq01jkICqP8dwIsLUW/T/RFIqMXJiz0PC?=
 =?us-ascii?Q?hTgx+qsLtAtaBJujNke0GNTGmuJYwSpSow6jc/HAQdoatoeysHBgxeegL0gv?=
 =?us-ascii?Q?5LjldSJs7b3o4goGwmZNhN+fwgf+8p7XcySajbmJPokZe4aPDTCxGQJRroSw?=
 =?us-ascii?Q?wERIz9wQj9yrfOtIWi2E3QS42+rPaK3mb+k2Eb6RnKBjOGvKqDuosx4PDHrK?=
 =?us-ascii?Q?ywqHuvUATjWp6IoVIyWxXBlIb6k8E/QeU8AoD4uQSaUunMW8RahbyWN/SqfT?=
 =?us-ascii?Q?+NI7XFDlkCDatEccUIwqdsAZK1ASPcMVswgmfiE0vG1yKqtY+DWRE3EEXmy+?=
 =?us-ascii?Q?YSZraQsfkyaGa18RwFZ00QNXYn/O3SFXJmYtcaEWFV1HL/RDrFstJsoeEw1M?=
 =?us-ascii?Q?wqly8sJhcLCub9W+wicavRMm1C4VUUyF8q9UBOceBwSciiBlE3/3w5osuMFz?=
 =?us-ascii?Q?ibdhLCNXbwseBrm0ru4oW5evp3j48qeFAOfWAZy6S78cKEijXDg7WU0+cZZQ?=
 =?us-ascii?Q?fEayWh7k+oXmkD6oO0Btv8RxlV4Si/cGGbloeDQ31VAoVf5n/INJNHIKYHFj?=
 =?us-ascii?Q?7MElsiXfjnLiYQT8AGqM238SLaoHg3BN8T6dOpNrz6BrpSOZZE1436QLLoAb?=
 =?us-ascii?Q?RnAG34iiOb6L8G42aXLMxtI9Eofd5g95QibUSkNM6WhaWPM0X/RbA9tbwct7?=
 =?us-ascii?Q?qRMT8aU0Y8wPAvh4fYz8ienWy1jqLbDGOd/dwxKkwt/e+ccWwENMqWsPqnQo?=
 =?us-ascii?Q?kIPgm+OLimyO0DFK3viCjph/FjSyKOxL1N9i0nHkig1q/ZWU2xRU5ork0xZZ?=
 =?us-ascii?Q?rH/G8Vh+LAAoY7t7pvx5shJsgjwCwtJv8qz1PKDC1DPzkRfywim+Piddww/E?=
 =?us-ascii?Q?74+AfzO/Im4BnXAjmgUPxi7GlL72Rbh8MtjbZ+vACzkkGQuYW3lFj4e1MMJ2?=
 =?us-ascii?Q?mmqCpZHXoLhYfJwCP1blkrx/anw41QXFEX0p/nkUu/gaLiooO2Xdz10FWySv?=
 =?us-ascii?Q?aEmYwsmeVoCf7PoGUlQjxRTXV8BYpXyBarVCvRcO3Yp1hKLX0C/D1NrT7iu7?=
 =?us-ascii?Q?T2g/V2EjkEbAuh9/YMMkv+PIG5yvQDNhopok7+1VKNby6mhYeNtJk4WXy8YA?=
 =?us-ascii?Q?KgtXvAVthQLk5qUqCnF+/yRXmAtDuKp7U4rMHhK9gd/rd177sjdxFMp1QS/V?=
 =?us-ascii?Q?aVGm0jPi5GlexMCiYV9XuNXStWefhZYsi+J/Tl/40Jy3QFRfzXh31qJKmqxb?=
 =?us-ascii?Q?vKlNXxXPU+eMcrKlWRLMg6Tm87UiM26VaY/H/M4u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d46a5c-bf31-4586-64d6-08ddb2944bd1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:26:55.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOql5BduuMc572Ack2qkWakri/BrscR3umP9hpROU40l7Dk6dRFet9KvEVly3nhZpI0r1Jd8uFHuXuUtX0oCGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

Convert lpc32xx-mlc.txt to yaml format.

Additional changes:
- add ref to nand-controller.yaml.
- replace _ with - in property names.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mtd/lpc32xx-mlc.txt   | 50 ------------
 .../bindings/mtd/nxp,lpc3220-mlc.yaml         | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
deleted file mode 100644
index 64c06aa05ac71..0000000000000
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-NXP LPC32xx SoC NAND MLC controller
-
-Required properties:
-- compatible: "nxp,lpc3220-mlc"
-- reg: Address and size of the controller
-- interrupts: The NAND interrupt specification
-- gpios: GPIO specification for NAND write protect
-
-The following required properties are very controller specific. See the LPC32xx
-User Manual 7.5.14 MLC NAND Timing Register (the values here are specified in
-Hz, to make them independent of actual clock speed and to provide for good
-accuracy:)
-- nxp,tcea_delay: TCEA_DELAY
-- nxp,busy_delay: BUSY_DELAY
-- nxp,nand_ta: NAND_TA
-- nxp,rd_high: RD_HIGH
-- nxp,rd_low: RD_LOW
-- nxp,wr_high: WR_HIGH
-- nxp,wr_low: WR_LOW
-
-Optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
-
-Example:
-
-	mlc: flash@200a8000 {
-		compatible = "nxp,lpc3220-mlc";
-		reg = <0x200A8000 0x11000>;
-		interrupts = <11 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		nxp,tcea-delay = <333333333>;
-		nxp,busy-delay = <10000000>;
-		nxp,nand-ta = <18181818>;
-		nxp,rd-high = <31250000>;
-		nxp,rd-low = <45454545>;
-		nxp,wr-high = <40000000>;
-		nxp,wr-low = <83333333>;
-		gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
-
-		mtd0@00000000 {
-			label = "boot";
-			reg = <0x00000000 0x00064000>;
-			read-only;
-		};
-
-		...
-
-	};
diff --git a/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
new file mode 100644
index 0000000000000..acc430db5244e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nxp,lpc3220-mlc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nxp,lpc3220-mlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC NAND MLC controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-mlc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpios:
+    maxItems: 1
+    description: GPIO specification for NAND write protect
+
+  nxp,tcea-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TCEA_DELAY in Hz
+
+  nxp,busy-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: BUSY_DELAY in Hz
+
+  nxp,nand-ta:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NAND_TA in Hz
+
+  nxp,rd-high:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RD_HIGH in Hz
+
+  nxp,rd-low:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RD_LOW in Hz
+
+  nxp,wr-high:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: WR_HIGH in Hz
+
+  nxp,wr-low:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: WR_LOW in Hz
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpios
+
+allOf:
+  - $ref: nand-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@200a8000 {
+        compatible = "nxp,lpc3220-mlc";
+        reg = <0x200A8000 0x11000>;
+        interrupts = <11 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        nxp,tcea-delay = <333333333>;
+        nxp,busy-delay = <10000000>;
+        nxp,nand-ta = <18181818>;
+        nxp,rd-high = <31250000>;
+        nxp,rd-low = <45454545>;
+        nxp,wr-high = <40000000>;
+        nxp,wr-low = <83333333>;
+        gpios = <&gpio 5 19 1>; /* GPO_P3 19, active low */
+    };
-- 
2.34.1

