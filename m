Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD601A4F12;
	Mon,  2 Jun 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875260; cv=fail; b=YtqRMkWDyVoQPRJnAkMaB6GvWqJ5+APY9Z6dXtWxkdBBvluddvceM4dweFrkWjIzl1jCVFNGTIP/+0I7vwOgbWOcWxiIS8YzLiqofXkhu1rwb3MnTn0IJegdZs5ZLmbQTscaZtGrN+T77h2eGt+4xY9Odj7t/VV+DmRU+6/C5sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875260; c=relaxed/simple;
	bh=/7czRMIrge0TzMtTbjWHYH2Dvl/kobvy9yR68ub4liQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=npERx/vqqm4iWtWJI6W3Hs9+Y6REaMfpTHrp1ZbiiNNOFWSxeAtWOSZGNbYBOd0Iaztx//wpj/DaNZI+JkyEWZPsiHur9GsiHF7rvhYNIYM3aCmUl39aG9AZKFYSvqeBAtZBoW3w6zDagCCmKSHJaivWmRExSAaFWQhr6lpRfx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WEUUEo7g; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WEUUEo7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lua52YhshKJoxyMKF7k+mPId+hpkUumENNY+SjbvtPNzkaZJs+sLYs8Isg3VHYLB0zIwGjaAE1fvaECShJoZ/eKqWYsWbG6+Y/IKb01eYLI/alygIeBJP+MF1aQgfEx2F7c9+cL8RX+LQpfox7W6cRVfhF5scnQP4xu5KvCnkVA1+FxKfyYN6FgGiYWKUfqF9JMw30gscIYxe5b8ZegfnUumD+9EMEDD8cHYXrWV0DMTe2RdHpt9U0NJWK0SPmlx+5yXPKuHOGd8xqlh5xegDmJ6X+WJRjDgf7UPmCkgiKnQr7FBzy5L2fEAFh89PmPPIxgZfpXF5oqXlMm9pZvLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ+MXxak/xIPZYzRYUdfFjQbdfvhKmz6XKFVFb/Ftyk=;
 b=Jm3xHfimjHTukDjVujVVnMfJFlsCvvrJPaTNe0cq3SiVu/StYAu+7/GTQeD4+/BwoQ4gpXjGk0hJKpk3ZqbTepMK27kQKs+JgcvBistKiOn8mkq79mMGqvUliBT36VCB4MsQNDpPFgGi7G9NZfeIsZgRXmXtZ1jzZU6nKEiIdPtqqsDq2l/5YYYjxo8/ZZ2YP/uu4pwvNE/MuyVHGpu4kqjFIdaKQwnuf5jxZbViPA2Y3gfV7xmK+Nxn+wt4KwNDwI45N1ER1AD7fQa6+9AxNY1pZcJwPbBGTCo7vQHwPDGhoqfgusqsRCviMMJo0XtGTODsZsnMdGx+N69rB1/N2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ+MXxak/xIPZYzRYUdfFjQbdfvhKmz6XKFVFb/Ftyk=;
 b=WEUUEo7gOF/oA1M9mJBBVJj6wkzDXLeV7TgShchN+vI86yBdnODQ2ZiDITeKY2+vrQ+5wu3yMR8svXkPoN2H9VAu9pOYn+gxb6bSxtn4KLSZS6egIZW/w3J63k54ttIkOIgmcUVfOwupW8FWqwAPfjqqreWnhPeE7W6I/LavI4BSS4bbddCfrDr3hlW2uYE+DQiIfyrBmFBB9oC3aYq3MxMYVGJxIh4h7CjCwmMY1SA3GIvfSvzID0yD/i6fNOcxJ84akmh/AmXlnMK6xtP8027sIEnxA6aKdm3FALggZifRE4IYhW6VtswgnikF838FNu6/f+AlSLQAQO9RhvG4QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8289.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:40:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:40:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: reset: convert nxp,lpc1850-rgu.txt to yaml format
Date: Mon,  2 Jun 2025 10:40:45 -0400
Message-Id: <20250602144046.943982-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 6302d88f-8bbe-4f96-6981-08dda1e37b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qfMiR1sHY+TM1brhTnBOe/1/s3JQoOR+/NB/k8V66jJetBdmVtXzoTxC6oBJ?=
 =?us-ascii?Q?1OpW+QcHnFJv8ogDnDX1sVA20KDVZAMEDhwV4MVE3UUpeZeWUxcZgDKwsWRo?=
 =?us-ascii?Q?9UVutXG8Sf4jDbH2o0Co/O5UMEDVcX+UavobU5UlYSJ6QBZc+c6MyhG4ecRu?=
 =?us-ascii?Q?4O/v/wLLKR5RcIxu6akMd6WF55F35x2EVi1RmgAacAB2keosjn/50BjdiTgV?=
 =?us-ascii?Q?7HxnuSactLLPT3qqzIoxGT+RendybCDwKwCzKihEfULNkY/DnLJSPYjs2IP1?=
 =?us-ascii?Q?i6gfuW5XuTSf7MnU137AoqkebjC3iT+ACoD4/H7iJnyns9gif8j2CNqBaUyM?=
 =?us-ascii?Q?WwXGUY9wWbA3mZxQhS1Z3CoJPcaxhF2Tn0ybzRTYq0owzEzz1PNi5ewcygRD?=
 =?us-ascii?Q?KgI9P8RudGPaTwO4vB4QEsQlN8eJsHDGEgXSAApi+Sl0LyMu/Rl7AJG2UFQZ?=
 =?us-ascii?Q?ktKeB4chHOtDXXHHJZ1Nx499TfCvmgV0M2Q6/8hjzOjZhJ4WO+oMcijsheso?=
 =?us-ascii?Q?ZzG35EEm9ILpeMlcNAaoYz4fBVNHsTxxvDMvcbhN16xhRrLB4jM/nYd4IODm?=
 =?us-ascii?Q?LrSBFp2rBzoM2Ke+hF4dFjBEFTxUeEHQ1uqEBElxEo4phsS5T203oHyKPLyi?=
 =?us-ascii?Q?YD34lDeZMBuMiGlCsnzVKQqrc8VqmK+r4TM6HqWZcFKObJufl8QzNLQh2pJa?=
 =?us-ascii?Q?BcoyOgZvfBJPWc/7GT6NCyL7MHmvRE6vmQvvWlsJ/zEseDRLLnuGc6Vx77tT?=
 =?us-ascii?Q?yBwc66Gwm8GCU1SF5aABaXixTDH6m5kgU3TS11axvzOLIBXIj2latr3QvxTd?=
 =?us-ascii?Q?CF/vRZFNr/7mCWl7Qr5TWCixsOGdDFyB8Xf6u2+h++ohNrHkX1uXMU0Yte9S?=
 =?us-ascii?Q?i6aB8QeBwvFhAK18GqCIVLPvkap3jvnSNc9HjWmPv6LIIp7NZQVNetdkY/gB?=
 =?us-ascii?Q?6FX2wY81NWIPv2jClAGwxiwnv/NXpdmVX1J6YE9HOUBg/UahFb4PryI/swKC?=
 =?us-ascii?Q?1x7fiaRTRP26dFWmipsPuFkUuiITitbTg+oUFMYYOy5g+a2My8myw1NQUceG?=
 =?us-ascii?Q?fbTxhl/kexxVyJ23clS4Hsz5YReq4fepYLo5leh+rP1vXnUGgbxfD0sJYKu0?=
 =?us-ascii?Q?SsYtUHESiVNaDYAl8rdhqF2lVGpNPgircdj9MfvhYn3+tWFHqW6ESK2kEZlW?=
 =?us-ascii?Q?IIqA0jnpwqN/isV4xlHmoJpopmrMwkvxECcWdv+adPY1QQghX6ECyP6ErdOG?=
 =?us-ascii?Q?PET2H372jPkJGsQV6pQjZZwYnD+otiCDK7AIwShJgG9hAfcCC0stU8AHozeI?=
 =?us-ascii?Q?9Yah6Hn+DZ8y7e+t/y5yz2VIE1PTj3JARWsOotKDYbv15PGbODm1eGAufCiF?=
 =?us-ascii?Q?pjLwgAG/vQc5ix5NmeWGvRUEQLxeotKP03qeivTsvG/7hTDt0WPi5RL2D4wq?=
 =?us-ascii?Q?f7gwCpI3d71+hHtLUX0ETZ3g+K+jQXdQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emd1s4HZhb9vbGp0jcZbiLTemlszPxmqqqBkFNobbAcPGxPBfAP5hoGsiHyP?=
 =?us-ascii?Q?gEe8eNrq5KvFcYf/L9Dwpuy8km1BbCymxDJeM2u6F1J9oHbDsdcINsn6y1M6?=
 =?us-ascii?Q?LnWe2Kx/ugaZ1k2cmHq8yoJFVYFZjPKTQHghU8KlatlI6TiAZDtWKC+Kurwm?=
 =?us-ascii?Q?yHJKivyBJtDTy/jfJBoYTHkj6PPHb0QdZZOW4qxCCFnfEialrgap6JM3FRkm?=
 =?us-ascii?Q?fM/olgui4lgkf15ZyxEP13MznS+mMrb/pchBEggF0Fk6lYzbbxQ/guaWydMW?=
 =?us-ascii?Q?dUC4U/QPxKil3SegMNck86F6NV1oQmCO2A62iR40AjTELA8zhP97GEQ68DDM?=
 =?us-ascii?Q?xbqQ/RTiNmdqgYUS+Y8jFSWjORIsm6HLwiq5nhRvIPSDbVMH7Q9EFluL5cg/?=
 =?us-ascii?Q?df8Tz0SJwP6ogjVyokeEh9OCJ9ExV+3EG8XJJQnQSJiQJdqB/Cgj/loVy2Hu?=
 =?us-ascii?Q?XQj1MeiyCvrRwyMHoskl+QJLeS2gqfjENcHd2CPyq4eXCJqrkVGw4pmvbBse?=
 =?us-ascii?Q?aCeDbUYdIlLPg57uXwD6QT0LpBoBH6zqUfn5EaaAclU0ePZoAxSnYt7Ou5mm?=
 =?us-ascii?Q?fMX3R1Hmh/sHcTojXfCYW60aG+6C1/cYKj+m381CgojYcoPbe5Cu8+14FlWA?=
 =?us-ascii?Q?mCceWbstiGZOYeJyjZb3WLsa21PUlcolqR0ZiSTBspBzjftTRld+IYlRre/b?=
 =?us-ascii?Q?J0sV8hVipWfnXCHzmWF7T3raWIJmatTzRY4TUUHvgT+UdXiMg7RVntSb6crr?=
 =?us-ascii?Q?LMDLdqDXpxZt23nOucT2Whh+7581bJZjsnBRBkMw3dVDuXdvjF/UAdAjD+9h?=
 =?us-ascii?Q?ObDw5c3LHW3fON38iPnUiuk4YFHGOkmKyawVxEmzF8WMwr3KVXcXoZkq92TK?=
 =?us-ascii?Q?jnQ5wErJskYRyWciaHTrba5iLiohj63DmJQnMy3XPbnF5+I0Faxs7EpPRMO4?=
 =?us-ascii?Q?/XfL07+V3k9sScc2jfI51GcP2yYw084fLghqBwAn6Lia3GywLrfcJks8OE91?=
 =?us-ascii?Q?sW4GQmZowpI9lTHdKgHW2F84G3TyUR7yH5GBYFPId0L4TYslmybi4qD+sfAA?=
 =?us-ascii?Q?+PiO6jxUdbpW2maC2dW5Ba1XR5+B1VmylmM88hQrONx5IT2zeNBslJ0C/Y+t?=
 =?us-ascii?Q?8a86iVJKkHGr4ebGflshOku0ziRF+2Y1UkowAGRvU+F8otFxQb02dJUkuTfB?=
 =?us-ascii?Q?6xVN2hTlRD3xEaeBgr0h2dWctxuZZewX27+G4nSFYpEoqHNGr9mmAPA3pebF?=
 =?us-ascii?Q?1HHI04mZbmnbs78YuHgZo36b08w8E+xrgvLcfTSea7NxYhHEopCg2KILIVbV?=
 =?us-ascii?Q?/141zf81s1oHejXLziYvv774h3gfP8cGFMct9ZDVUwQ5nmp59BWFffxCskxg?=
 =?us-ascii?Q?CQ59RDPGnxH0GM6Sxa7awPhfetHMPUxLKW4XeZ9PVo5dEC838NDEclQLAktM?=
 =?us-ascii?Q?4qAOcb6HH3GH1wq8kJyW4WAZglx5kRE2wqmVekqwVrTEntDJR1RBzAm71u+6?=
 =?us-ascii?Q?/FcPnSbvFvBZz5D6xgL9uqcXgcqSCocWe15tr6/3KGUtpsrqPfcJxeiX1dot?=
 =?us-ascii?Q?9gMv4i6Ff8rzdJCcn4YkqGJmgpGF9BHGT7HvydVz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6302d88f-8bbe-4f96-6981-08dda1e37b3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:40:55.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SfW36IY8+y0mDpaVESl4rPX8JEV1SW8rbwtltJjgdG3YJ6htQL8h5gN5vZWe65dya4GJJivMEtY+9P1FcaArw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8289

Convert nxp,lpc1850-rgu.txt to yaml format.

Additional changes:
- remove label in example.
- remove reset consumer in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/reset/nxp,lpc1850-rgu.txt        |  83 --------------
 .../bindings/reset/nxp,lpc1850-rgu.yaml       | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 83 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt b/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
deleted file mode 100644
index 05d5be48dae44..0000000000000
--- a/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-NXP LPC1850  Reset Generation Unit (RGU)
-========================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-- compatible: Should be "nxp,lpc1850-rgu"
-- reg: register base and length
-- clocks: phandle and clock specifier to RGU clocks
-- clock-names: should contain "delay" and "reg"
-- #reset-cells: should be 1
-
-See table below for valid peripheral reset numbers. Numbers not
-in the table below are either reserved or not applicable for
-normal operation.
-
-Reset	Peripheral
-  9	System control unit (SCU)
- 12	ARM Cortex-M0 subsystem core (LPC43xx only)
- 13	CPU core
- 16	LCD controller
- 17	USB0
- 18	USB1
- 19	DMA
- 20	SDIO
- 21	External memory controller (EMC)
- 22	Ethernet
- 25	Flash bank A
- 27	EEPROM
- 28	GPIO
- 29	Flash bank B
- 32	Timer0
- 33	Timer1
- 34	Timer2
- 35	Timer3
- 36	Repetitive Interrupt timer (RIT)
- 37	State Configurable Timer (SCT)
- 38	Motor control PWM (MCPWM)
- 39	QEI
- 40	ADC0
- 41	ADC1
- 42	DAC
- 44	USART0
- 45	UART1
- 46	USART2
- 47	USART3
- 48	I2C0
- 49	I2C1
- 50	SSP0
- 51	SSP1
- 52	I2S0 and I2S1
- 53	Serial Flash Interface (SPIFI)
- 54	C_CAN1
- 55	C_CAN0
- 56	ARM Cortex-M0 application core (LPC4370 only)
- 57	SGPIO (LPC43xx only)
- 58	SPI (LPC43xx only)
- 60	ADCHS (12-bit ADC) (LPC4370 only)
-
-Refer to NXP LPC18xx or LPC43xx user manual for more details about
-the reset signals and the connected block/peripheral.
-
-Reset provider example:
-rgu: reset-controller@40053000 {
-	compatible = "nxp,lpc1850-rgu";
-	reg = <0x40053000 0x1000>;
-	clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_BUS>;
-	clock-names = "delay", "reg";
-	#reset-cells = <1>;
-};
-
-Reset consumer example:
-mac: ethernet@40010000 {
-	compatible = "nxp,lpc1850-dwmac", "snps,dwmac-3.611", "snps,dwmac";
-	reg = <0x40010000 0x2000>;
-	interrupts = <5>;
-	interrupt-names = "macirq";
-	clocks = <&ccu1 CLK_CPU_ETHERNET>;
-	clock-names = "stmmaceth";
-	resets = <&rgu 22>;
-	reset-names = "stmmaceth";
-};
diff --git a/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml b/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml
new file mode 100644
index 0000000000000..9c3c13c543c70
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,lpc1850-rgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC1850  Reset Generation Unit (RGU)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-rgu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: delay
+      - const: reg
+
+  '#reset-cells':
+    const: 1
+    description: |
+      See table below for valid peripheral reset numbers. Numbers not
+      in the table below are either reserved or not applicable for
+      normal operation.
+
+      Reset	Peripheral
+        9	System control unit (SCU)
+       12	ARM Cortex-M0 subsystem core (LPC43xx only)
+       13	CPU core
+       16	LCD controller
+       17	USB0
+       18	USB1
+       19	DMA
+       20	SDIO
+       21	External memory controller (EMC)
+       22	Ethernet
+       25	Flash bank A
+       27	EEPROM
+       28	GPIO
+       29	Flash bank B
+       32	Timer0
+       33	Timer1
+       34	Timer2
+       35	Timer3
+       36	Repetitive Interrupt timer (RIT)
+       37	State Configurable Timer (SCT)
+       38	Motor control PWM (MCPWM)
+       39	QEI
+       40	ADC0
+       41	ADC1
+       42	DAC
+       44	USART0
+       45	UART1
+       46	USART2
+       47	USART3
+       48	I2C0
+       49	I2C1
+       50	SSP0
+       51	SSP1
+       52	I2S0 and I2S1
+       53	Serial Flash Interface (SPIFI)
+       54	C_CAN1
+       55	C_CAN0
+       56	ARM Cortex-M0 application core (LPC4370 only)
+       57	SGPIO (LPC43xx only)
+       58	SPI (LPC43xx only)
+       60	ADCHS (12-bit ADC) (LPC4370 only)
+
+      Refer to NXP LPC18xx or LPC43xx user manual for more details about
+      the reset signals and the connected block/peripheral.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+    #include <dt-bindings/clock/lpc18xx-cgu.h>
+
+    reset-controller@40053000 {
+        compatible = "nxp,lpc1850-rgu";
+        reg = <0x40053000 0x1000>;
+        clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_BUS>;
+        clock-names = "delay", "reg";
+        #reset-cells = <1>;
+    };
+
-- 
2.34.1

