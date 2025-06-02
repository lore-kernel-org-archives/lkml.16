Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBD1D516F;
	Mon,  2 Jun 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874719; cv=fail; b=ZW3DbFxklXdbUBjIotU2TARzd23Vo+eOLVLDqBkRlD+cH4ChTuCJWXi47KeMtC4JKbfoCOmSLgzizBg3XgTayJ6VxFJOk8wVRGjv+iEE/tky/2o21o6xd/+uXSqtb+aBhJwiXqIx3Az6uyz6QxVMnZJs5k/MReNmIQVEVlrnCmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874719; c=relaxed/simple;
	bh=yaXyoee+unyy4QDbsYnydcZB9vRkaLxr4ejqfgnwW3U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hCv0IAjX+q7u1gCvSfHgxTRamxfXRB1ysaM1mKhQZuk/l/q4eXSbfk2unMH48BJDupNqxPTYAhbKpupj8sMyVOW2SyK285SBQ1s1gXNxcUIukjnXHxEiXOlfa97Qm4hG5ThL03O5X22kJ4mqEy3jxCw6jeUAderwxZTW/gCbkSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PyougrPd; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PyougrPd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KK+l2eVa1DoXFGcfngN2+UvhGLRTGdIbVpO6dUXKGGnslzTQZXNiRIwlW6KwRYiIqS4BeUL+5GT13JKbdNPD2GRtJMGP77SC2bjrrRE5PUSQIeSJn3YpWrHKrZpvQOsCEz5Z4BlzKM06OgiD4bNs+V1eQW1yC1cbV5pKxMJMIdNS7/pfdvLpPquy9AwV3oses6EEjHGo1kelwZGGIWH05KT0c/UB25QLcT83gjTrK3vW5QAh7C+CFly5tdmcANpwVI2Rc55880tTwDUV3FC2FPhF6dauxKLs88cqpVmIJ1IRw7OYt/ekhtqFVK2IKIHK9aH5HHF7p3DN2Oyt4XYxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NAEL+D+X2MjQv1mIVTNDz1YDL+pA7rIx3oUkxtRdbQ=;
 b=bBli4sumadoRFLGnVgExXiASthUv6953PYa7OhcMgexhryQ4JMvgQ+l2kwF5EieZDSh0uouSh3fp7G7eNlHBaeQTy6u1o+Cpqo2es9bMJrZpFxTdCKIh9FGu8tJfPFEg/14wi3NujXSMG+uBItui7/1CUALQOpX5IMzLPgr9YeswSsE790GbPz5oCGHmfh0AjNJYBIAeDqNkSwRiW5HckvE0tRJWRAlbmBb+m9hYwMA8JJunG/R8vDnaxf8cd8B82R28lizTNM3bnA51XkEnPXo/45mSiUTqYB8vuLqnxFFYgzTIU2dny2Lct81RWDNO7imrj+SwleGpkGH2X72Ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NAEL+D+X2MjQv1mIVTNDz1YDL+pA7rIx3oUkxtRdbQ=;
 b=PyougrPdLU7cFrS5QVR9dJ9isURMeWA4fPps4nYIix5JVP0h+sXJ2ZlMH8WKNtcTLNe81jZy+9k9MkMpgXcyaXoTLGKREB4/q+sHxyLOoPFBNHb7GWUSC5g7wHzz9f3GLUhR7iIFQSRiHYBdX08tG2A909Xeym2VWDH9vVupBJBlqQoCrDOZWkqf/bhpSFOji4gm767hSiASKM1sphGBDDLGjec0TOoU2ONm184GTucny/QrehkKDnyJ8maQnuuo8XTD8jJfa2+PKxFDmzL0B4cdoGxsuwTILaxetkwbc6mGp74MgJ3yVRp+IUCwJYgNs35WTGQZabCsatfQ6ULhJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10388.eurprd04.prod.outlook.com (2603:10a6:10:568::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:31:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:31:53 +0000
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
Subject: [PATCH 1/1] dt-bindings: clock: convert lpc1850-cgu.txt to yaml format
Date: Mon,  2 Jun 2025 10:31:42 -0400
Message-Id: <20250602143143.943086-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR03CA0054.eurprd03.prod.outlook.com
 (2603:10a6:803:50::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f0b257-d3f5-4fd8-ab50-08dda1e23836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VKC+WHSou0Mq7nwyaI8sU2MPgPHCadsGDEZTWBI3cQrHXNWKHt043PLQ+k2M?=
 =?us-ascii?Q?p9kqjsDo/UIvXdcIOuHAOGD4HDPMO/MVYcWgqEeZ1w0um3wlNhO3rCmn/Opx?=
 =?us-ascii?Q?GZbqCB39TIt1IiP4FT0G6sMds/8KnfEC09z6g2Ta2gnzhNHnJu1LSerUM3U3?=
 =?us-ascii?Q?/zlDjFIyCwD6w0MwVCxcpL6sGqCijOcTWOYexEvERuLwRBmU8qLKs91rkuMY?=
 =?us-ascii?Q?CgJhgtUszJLgkdhrnUlicGny694uTatIkGzxfTN+lXnNUXU9/9uC4l8lyoTr?=
 =?us-ascii?Q?U93ak77CV2CzXEy8Q8p9/TVRiuwK4VGWKdjI+t3wvK90kFnWzZ7pHmqXOyF9?=
 =?us-ascii?Q?bMRaJvuntmFCU7fSu9BQINIaDYQ+qkjq8YJc0ZnisC+yycIXvg0w2p1XBm/x?=
 =?us-ascii?Q?ME5DLMus7K1T+u84Gol5YBaedbP6I4uuwfzQM5ycSGc32ZXEWsmnuHVYnkRL?=
 =?us-ascii?Q?HMo9i9regDFjvvKXngTTKBaJ8nMOoUut7BlB3I99b9agRbY89mQBQIBZwPle?=
 =?us-ascii?Q?pCeGtCzQZ4GGXTTj8uVS6xWIWdwcb1ki5RpbJoPJgFtbQqryy/ZAbTLu9Aw2?=
 =?us-ascii?Q?Km/3sgaFcZ7rMA25qcB4Job7OGPQerHQCDGBxcF6CwrdO5xXxSARHkXu80I2?=
 =?us-ascii?Q?1KiaXjJWGoZ5eXB1hMA4qsHF9SsdbmWCfkX00qjJKsMp9ZEM0FgW4W1TgL4c?=
 =?us-ascii?Q?sIL5WezpKg9OvN6c6w33yiC2fPlawYzRMMA0lO9JD7aFcpkSC8jDqFKSlCtJ?=
 =?us-ascii?Q?7iePjxbAPaowoH4uRZHtegqrS606f6CWonXE3NSn/ZqkF0M7igbMV25va5NG?=
 =?us-ascii?Q?xVCrFCHjMD7xv1gMFM9nqDBpnrCEOBIhUHXzti+dx312vZCPUgKwEvA7w1dd?=
 =?us-ascii?Q?3XzIiyQOmMN8cJbuMtXFaFKi5CFLhw0yK2lCrOO4mpvVhmxqNmE+LQ2R2050?=
 =?us-ascii?Q?X3xWEhW6CXsXca6mLtnIaxQR0TZ06605bd9Lx1nw2KRVfd0Gh93EcPsu8Kon?=
 =?us-ascii?Q?YCpRwNtmlAbCeOTCRDxxxA9Wh55eJwDynqTVqfqPoox2IpDY8Uiu41EZbPyk?=
 =?us-ascii?Q?Z4DFPivboMkHeBtBy4MDxDw1jgjRP7EhTecf+gJqxnrSzWDghM3HBrKfOYvJ?=
 =?us-ascii?Q?rJkTnvTxl+q982pL6P7Pug4JBH29OCblnibqHdCrvGSSSzpKO/3QHIDcum/L?=
 =?us-ascii?Q?N/jTH+0K9EQcba3WxNmcJ9Kpui3DMl7sa+AilH3eCwwyMLIz+DGuY5/X25q2?=
 =?us-ascii?Q?EZTEFjMEk7Nu/180sY0eDLViTuglpeACgwSN053AOMGSSexCHyJoe7qj63n+?=
 =?us-ascii?Q?DyISUb9fFHacRD8ZZShfAsuEcSzEvV5hRfbuOn2lAUMkGqDzPN5BLfHxtTAP?=
 =?us-ascii?Q?HQAd+6SPv4gXfTl7LfVe08/I2TCH2z/21tfJotE9VR2hQCh5nD78NovAyu1M?=
 =?us-ascii?Q?t8T8NI53Y2g6ITec7ykxxfzyruD3Luc2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7o9Rc/Z4yquNfUTBluhdD0qwrvirt72XXx6wwDiOLFzcc1WKqAXhhZYpWnPr?=
 =?us-ascii?Q?4SK6N4bv4t3JMYEB0Kt3u0YVhuJBBMtN6/YO40mJUPgPz9Vepa8MZv/HJtcM?=
 =?us-ascii?Q?HDRikucuR68oOA63T/pK5rPJBBPlBJLwtlkerAbaSiNlpkY/pRxTqgb77wvV?=
 =?us-ascii?Q?5bodSPg6UaPZYb8RsuvMeh+X0i20nHwLR5VVlU/loSTrIdLBjANPifhPZ8zi?=
 =?us-ascii?Q?4z/Z4+MQJerwALeLHcAzLi+3GxX6dcd61XTWiflK4j/1op1NlW9GlNW/O0br?=
 =?us-ascii?Q?zoICQt0yh5RD9yQ/eFrCYq3Cpvpu8LVsVRqyuS++f1VnGpKZax/416/WeEiE?=
 =?us-ascii?Q?e3aybGqXR5J44pka1+O6LooOVTUsxat4byw1k4wdGz+MOtZmqbZqNr4lC7y6?=
 =?us-ascii?Q?c9bIQirU/7Kbjukv1XPZaxAjyqUcFXGVRwEEzGLAVCjv/5I3tatnP5n6GQY/?=
 =?us-ascii?Q?38k14L49VPjp9XWLKyQvGfs3892OMVbtOu1U2bLcT5HJ2Gp8VMrq7/NPTlCE?=
 =?us-ascii?Q?nkpz2rJrhM2ExA6Y4c1inzWC7p7VckxsWyOlcvwLRGeK3CEfAPOzbT3l2o1t?=
 =?us-ascii?Q?uPN1USl2hClEeN/npqOwoELsesiJb+O0A/ibUyXpuTwImOXTNy4XLzcqm/yQ?=
 =?us-ascii?Q?GQHiZ5P64Vf8DYoPRkAFRPyc+80IUjFgzpfQlxZkol4GqN92T5cRE1WZ4LbP?=
 =?us-ascii?Q?shwhUV2iXvUnenyoB54se8sIZ5gbOcNVmkv2IuqQaNGi9O88TjUjlHw08Yca?=
 =?us-ascii?Q?m4LPuU6tqMHwITYysqORUMPGVYe+bKAuwO7I6U89hWmKauFS+UVakfqTnFz1?=
 =?us-ascii?Q?9ituczeY/pekniEQeyt52VsXqsJfrDUHYtK0NIi5h1KpGkliJdcyZ131KUTe?=
 =?us-ascii?Q?Yhs0tABymtmTL6NXjUsGLFDO3fmlYwnTkrYYNj9Du3G+Nk9mW0zfGuqKl0yK?=
 =?us-ascii?Q?+EU9g/Gr3qz/PIXTTCagwGHHuByb03Zr8+wSSaM0DqIt4lAjHH3YiGNmiS6C?=
 =?us-ascii?Q?T3PhWkPzEbuqqSu1tTlchJO8m/DRtOXeohkDm5L4fG2BHVwytatrZ7xxCkSH?=
 =?us-ascii?Q?RhfmJW3sGmNQUWmgJYHL5OlxqAw6Yf4hs6qDIGskPQKplc3gG7lHH4T9G2A8?=
 =?us-ascii?Q?UnbsZcfPRRShwd285CfkeD9WPDcU1ESARb8owRusXHy2JAYIAy4zncaqM/El?=
 =?us-ascii?Q?H02m7uSbfBHKvvdYvE+LRUA55Rlr/6Un6LWwcY53dI7xwzi9KmPdO8YpCmrH?=
 =?us-ascii?Q?lONh5Ht9za2jVyPgah2mfobjml1PpHI7BG1hyFlsA7DhrmI7LHgUVOzw9QaM?=
 =?us-ascii?Q?p3v1qFTh1w3sP93Lx9jvMmOuDKIqlONwTIdwwO8WrjGfDSwNrXVUx6BOYhJX?=
 =?us-ascii?Q?ZmJxC48hBGbJk6sxbdp5eNME5yT9oNHCAjtI4B9rGLsGWTisfo30aQL9cXM6?=
 =?us-ascii?Q?htzjkLQYsantdCuMYx2I9ZouMBib7rhKdvOZjjzwrPBlJM1ZGV1NWUN4mGjI?=
 =?us-ascii?Q?4DGPLRtYAqE/Zkakx92ETsn4Bw3nojP2F+qqS1M1y1yAuh3LYFahJ7tMidOG?=
 =?us-ascii?Q?MlKO1RJcRI7Wz6bYocGD3m6t6Tplxzqf3LWM9Und?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f0b257-d3f5-4fd8-ab50-08dda1e23836
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:31:53.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOYLwgz5Xx2wpt3YJXgUhyP+a1UL0Wi2iHCiyqZVIrmaOAmB7ORKTUF0ky2XGtoz3YPVhxwXryjWSUnBqoUNxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10388

Convert lpc1850-cgu.txt to yaml format.

Additional changes:
- remove extra clock source nodes in example.
- remove clock consumer in example.
- remove clock-output-names and clock-clock-indices from required list to
  match existed dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/clock/lpc1850-cgu.txt | 131 ------------------
 .../bindings/clock/nxp,lpc1850-cgu.yaml       | 102 ++++++++++++++
 2 files changed, 102 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml

diff --git a/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt b/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
deleted file mode 100644
index 2cc32a9a945a7..0000000000000
--- a/Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
+++ /dev/null
@@ -1,131 +0,0 @@
-* NXP LPC1850 Clock Generation Unit (CGU)
-
-The CGU generates multiple independent clocks for the core and the
-peripheral blocks of the LPC18xx. Each independent clock is called
-a base clock and itself is one of the inputs to the two Clock
-Control Units (CCUs) which control the branch clocks to the
-individual peripherals.
-
-The CGU selects the inputs to the clock generators from multiple
-clock sources, controls the clock generation, and routes the outputs
-of the clock generators through the clock source bus to the output
-stages. Each output stage provides an independent clock source and
-corresponds to one of the base clocks for the LPC18xx.
-
- - Above text taken from NXP LPC1850 User Manual.
-
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible:
-	Should be "nxp,lpc1850-cgu"
-- reg:
-	Shall define the base and range of the address space
-	containing clock control registers
-- #clock-cells:
-	Shall have value <1>.  The permitted clock-specifier values
-	are the base clock numbers defined below.
-- clocks:
-	Shall contain a list of phandles for the external input
-	sources to the CGU. The list shall be in the following
-	order: xtal, 32khz, enet_rx_clk, enet_tx_clk, gp_clkin.
-- clock-indices:
-	Shall be an ordered list of numbers defining the base clock
-	number provided by the CGU.
-- clock-output-names:
-	Shall be an ordered list of strings defining the names of
-	the clocks provided by the CGU.
-
-Which base clocks that are available on the CGU depends on the
-specific LPC part. Base clocks are numbered from 0 to 27.
-
-Number:		Name:			Description:
- 0		BASE_SAFE_CLK		Base safe clock (always on) for WWDT
- 1		BASE_USB0_CLK		Base clock for USB0
- 2		BASE_PERIPH_CLK		Base clock for Cortex-M0SUB subsystem,
-					SPI, and SGPIO
- 3		BASE_USB1_CLK		Base clock for USB1
- 4		BASE_CPU_CLK		System base clock for ARM Cortex-M core
-					and APB peripheral blocks #0 and #2
- 5		BASE_SPIFI_CLK		Base clock for SPIFI
- 6		BASE_SPI_CLK		Base clock for SPI
- 7		BASE_PHY_RX_CLK		Base clock for Ethernet PHY Receive clock
- 8		BASE_PHY_TX_CLK		Base clock for Ethernet PHY Transmit clock
- 9		BASE_APB1_CLK		Base clock for APB peripheral block # 1
-10		BASE_APB3_CLK		Base clock for APB peripheral block # 3
-11		BASE_LCD_CLK		Base clock for LCD
-12		BASE_ADCHS_CLK		Base clock for ADCHS
-13		BASE_SDIO_CLK		Base clock for SD/MMC
-14		BASE_SSP0_CLK		Base clock for SSP0
-15		BASE_SSP1_CLK		Base clock for SSP1
-16		BASE_UART0_CLK		Base clock for UART0
-17		BASE_UART1_CLK		Base clock for UART1
-18		BASE_UART2_CLK		Base clock for UART2
-19		BASE_UART3_CLK		Base clock for UART3
-20		BASE_OUT_CLK		Base clock for CLKOUT pin
-24-21		-			Reserved
-25		BASE_AUDIO_CLK		Base clock for audio system (I2S)
-26 		BASE_CGU_OUT0_CLK	Base clock for CGU_OUT0 clock output
-27 		BASE_CGU_OUT1_CLK	Base clock for CGU_OUT1 clock output
-
-BASE_PERIPH_CLK and BASE_SPI_CLK is only available on LPC43xx.
-BASE_ADCHS_CLK is only available on LPC4370.
-
-
-Example board file:
-
-/ {
-	clocks {
-		xtal: xtal {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <12000000>;
-		};
-
-		xtal32: xtal32 {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-
-		enet_rx_clk: enet_rx_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-			clock-output-names = "enet_rx_clk";
-		};
-
-		enet_tx_clk: enet_tx_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-			clock-output-names = "enet_tx_clk";
-		};
-
-		gp_clkin: gp_clkin {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <0>;
-			clock-output-names = "gp_clkin";
-		};
-	};
-
-	soc {
-		cgu: clock-controller@40050000 {
-			compatible = "nxp,lpc1850-cgu";
-			reg = <0x40050000 0x1000>;
-			#clock-cells = <1>;
-			clocks = <&xtal>, <&creg_clk 1>, <&enet_rx_clk>, <&enet_tx_clk>, <&gp_clkin>;
-		};
-
-		/* A CGU and CCU clock consumer */
-		lcdc: lcdc@40008000 {
-			...
-			clocks = <&cgu BASE_LCD_CLK>, <&ccu1 CLK_CPU_LCD>;
-			clock-names = "clcdclk", "apb_pclk";
-			...
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml b/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
new file mode 100644
index 0000000000000..319bd2705c422
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nxp,lpc1850-cgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC1850 Clock Generation Unit (CGU)
+
+description:
+  The CGU generates multiple independent clocks for the core and the
+  peripheral blocks of the LPC18xx. Each independent clock is called
+  a base clock and itself is one of the inputs to the two Clock
+  Control Units (CCUs) which control the branch clocks to the
+  individual peripherals.
+
+  The CGU selects the inputs to the clock generators from multiple
+  clock sources, controls the clock generation, and routes the outputs
+  of the clock generators through the clock source bus to the output
+  stages. Each output stage provides an independent clock source and
+  corresponds to one of the base clocks for the LPC18xx.
+
+  Above text taken from NXP LPC1850 User Manual.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-cgu
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+    description: |
+      Which base clocks that are available on the CGU depends on the
+      specific LPC part. Base clocks are numbered from 0 to 27.
+
+      Number:         Name:                   Description:
+       0              BASE_SAFE_CLK           Base safe clock (always on) for WWDT
+       1              BASE_USB0_CLK           Base clock for USB0
+       2              BASE_PERIPH_CLK         Base clock for Cortex-M0SUB subsystem,
+                                        SPI, and SGPIO
+       3              BASE_USB1_CLK           Base clock for USB1
+       4              BASE_CPU_CLK            System base clock for ARM Cortex-M core
+                                        and APB peripheral blocks #0 and #2
+       5              BASE_SPIFI_CLK          Base clock for SPIFI
+       6              BASE_SPI_CLK            Base clock for SPI
+       7              BASE_PHY_RX_CLK         Base clock for Ethernet PHY Receive clock
+       8              BASE_PHY_TX_CLK         Base clock for Ethernet PHY Transmit clock
+       9              BASE_APB1_CLK           Base clock for APB peripheral block # 1
+      10              BASE_APB3_CLK           Base clock for APB peripheral block # 3
+      11              BASE_LCD_CLK            Base clock for LCD
+      12              BASE_ADCHS_CLK          Base clock for ADCHS
+      13              BASE_SDIO_CLK           Base clock for SD/MMC
+      14              BASE_SSP0_CLK           Base clock for SSP0
+      15              BASE_SSP1_CLK           Base clock for SSP1
+      16              BASE_UART0_CLK          Base clock for UART0
+      17              BASE_UART1_CLK          Base clock for UART1
+      18              BASE_UART2_CLK          Base clock for UART2
+      19              BASE_UART3_CLK          Base clock for UART3
+      20              BASE_OUT_CLK            Base clock for CLKOUT pin
+      24-21           -                       Reserved
+      25              BASE_AUDIO_CLK          Base clock for audio system (I2S)
+      26              BASE_CGU_OUT0_CLK       Base clock for CGU_OUT0 clock output
+      27              BASE_CGU_OUT1_CLK       Base clock for CGU_OUT1 clock output
+
+      BASE_PERIPH_CLK and BASE_SPI_CLK is only available on LPC43xx.
+      BASE_ADCHS_CLK is only available on LPC4370.
+
+  clocks:
+    maxItems: 5
+
+  clock-indices:
+    maxItems: 5
+
+  clock-output-names:
+    items:
+      - const: xtal
+      - const: creg_clk
+      - const: enet_rx_clk
+      - const: enet_tx_clk
+      - const: gp_clkin
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@40050000 {
+        compatible = "nxp,lpc1850-cgu";
+        reg = <0x40050000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&xtal>, <&creg_clk 1>, <&enet_rx_clk>, <&enet_tx_clk>, <&gp_clkin>;
+    };
+
-- 
2.34.1

