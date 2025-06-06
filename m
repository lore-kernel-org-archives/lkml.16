Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22228980E;
	Fri,  6 Jun 2025 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227073; cv=fail; b=Y5tMTcpgyjXYzkZSEtJEL9as4cTabd0UesYeMyaoRk0uRJ6BZXsLawQcTi7VDsGzCf9KtimfAoUEOgOWsPApTegzZLRPMnjpXxnBhJzr/8S8BLttwyCsdJfgzLcriHTKlxD3yHYezQyuZUbhA31fOGUIKFxPMRFYGJsdR4G37Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227073; c=relaxed/simple;
	bh=DDX1ZU3D4PVLcFmSxciyhvu6xJOJDitlP/ulxH4oWSo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M8Oiit1SVs5a4RaCPmGRNY4lpafiL+ysLXjNrpI5gsO2WEdjE46HK0krElDoAqEuARS/x9SaLcOpfmJdpEy018dDqVqACwUKQpd+nblKoHd53XLsbaTGTkbnS67HvGjOMKc4znIVvMC8hnTEEn58dzXP8xLnWDJQp5UyxL/0AXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ifGM3taB; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ifGM3taB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdTJPHp+m1tT/4CItqN8hPdy6jsRRH/tBUQZR/vP1dYQzcrfmIUSVd12t38rtJToG0+f+TnfCroQpt/Kzi899Yo8zNd/jyte7aGNd8KpLNDUFsLA/YRL/0i3F8cGaLKXQ1cnzKKt6blX7auHnKJ1EgF5piMov0jjJYLidvFj0NYcvG/Uc6prWcRPR11karbq7x8eT5ofKu44wngjSIjPhgxThd/8LY1/0UcogO5b+wF5qKuh7nQovE9/bAowpEqp5sa7+UgGliBRdb1txy05m0IFQzpxuIestN0bSJ1iEDfEstUV4Ubjn15SOxGe3iUADxTrwzaijcXc0Ck8qQ3f1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ/AHrSz2OeB3HhiP4Bhi3nMPRHo1SK04MUNm2WbCZI=;
 b=WJdrOpgXYAxYbJfPCFMcPk8TY8GDQku+mvlI234czG0ci3e3WeBhzBE3HvyyQc/A9M0uXdlDOE6tQZe2VYmaxViawk5sxpBPCH28Szr+qHOooujWy1RINQZZgKtXlClqYbGydKyWdDpvA9KLdVUstfNAvm0i+awu6EfbJRj/ibhkELI69Ch/lsCeTfr9ewDiGy7WRLg1mxkSU5xfY6xpjqGPUty8rw3rGdcLPnvXxZFiI123pV5oTEIY4i4E4X/BqC7ZlJdGqotFgj5RgeWA2dDE8jgVc6OWqyiw14Xolc3muv2aPnJAuZNnPm/Ezq/o4aPCtEkmLM6Ou1sihlHEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ/AHrSz2OeB3HhiP4Bhi3nMPRHo1SK04MUNm2WbCZI=;
 b=ifGM3taBlYXrSvhT3x1DskdKq6ib3LvE9QQ5AHrM2hOQ9dL/UvjeEeL3jSKd0QtASAb7j7rbPHhX26zDW5aMaSIhwENDPyzfHRjvMk+avYfwuSRnoGGPa+iQy96g9Ao2Ac4NCgq6Q2GiFPxTHjGN8kQiAfD/xI1Yqf/+zHf9rORpSSvtAMitKt4ATcMcEyU8ZAlPsIvac6C4XP/s/eMBMb9kOOAcGwQ1N+96taooHrtYjOoDrLXLoO6niN7MfXIphAHiHmZw+FUJPzfbEPvq86ID7c5489VOAN09cd50cYieyHcajCrN3LF3SpkXOOSqblB4QIO/kAdiB+1qBACftA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 16:24:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 16:24:25 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: clock: convert lpc1850-cgu.txt to yaml format
Date: Fri,  6 Jun 2025 12:24:09 -0400
Message-Id: <20250606162410.1361169-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: e5284802-3c8f-4ebf-bd6a-08dda5169a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/NK50BvY3FlHBBE+sRGIwY+wnpReMdB92XC6kkpxZ8DoUFw3b5Eo1HGMEcfj?=
 =?us-ascii?Q?GkLWKs1cbBm42CL9RSEGorrwhALuW4ZPh329cDqQJEkD8mC5gph2YvmFc7As?=
 =?us-ascii?Q?uH4Fzo1QPoQZDXzSFpI+NC+2ufPfC1ZtxESXktvUTPoYz+huDJc7TpjWHHUL?=
 =?us-ascii?Q?B1Bxe2xQFvIW963aXnx7IADkkr6Lz5phE7Tm5xT6B9EJivi9J/ItDkCiy/nh?=
 =?us-ascii?Q?RHWM+tDcTbFSx6OQhtasXDokz35X76uDq4pkge8baCYO05wPPQWlEaueZ+m1?=
 =?us-ascii?Q?1r6U7RjVAJHO4EBH0zdcJeYyAnF18F4ZQJwi9is6qJESuYgTPrVvFJm9bXbL?=
 =?us-ascii?Q?7oZurX7BM5MsPda1K69zRRYlQfOsee3zwiedMIIWoW6LskWWi4BLqHrp6b66?=
 =?us-ascii?Q?qKFCZUE41eo/haA1q+FuroXkDqiD8LY9FaAnREnas3s77p3ra4UenCY6jWSd?=
 =?us-ascii?Q?3cr06fJDzBpyPkbMSWoDw4D5GJPz8wIVJBebd2kY56KnASGSf9kz1nFRHh4H?=
 =?us-ascii?Q?FFafD0jysBJ8JTRVvNNG8UnPmHK8MO9bi9tFK74v0JCwnA+bIFx+pD09oYH1?=
 =?us-ascii?Q?3StY1TWyZTOIkUVOjALc9/JMqoG7+p1aLv2YBoW5sy+RzZwfVccVn6Vpwvgc?=
 =?us-ascii?Q?Wa3VErBZW6xWwehoM6orYYQAOJS33008/JQbob7ZWkP2dYKgNXIjADQngJHp?=
 =?us-ascii?Q?35V0h5meuDtHrab1tjZMqB6BGIbtzXY/iKRWgwg7yOtbmJMHiPnkb4epVc5J?=
 =?us-ascii?Q?PO5S/j1S5+jmVjuFSetcdnMW8P7XxLy7joQLBgcGfQ0unZcgogqAInyLTIa9?=
 =?us-ascii?Q?iiFzXNjc3pY1Wr1qOrzItiooH+3L+DJpEGyKdkmkvxW1GqfoS44At3Dx2mOB?=
 =?us-ascii?Q?bj3qyH+ISmoqzhD97BFJRpgCN/OpiV5sKw1W58ksKLMcEfVbxbxMtyA7Rc5m?=
 =?us-ascii?Q?3FEHOLNOi5yqfmtsReQCpzZ/mPrO0cxoUgWtC374SF8IxOtHgrn47+bx45JR?=
 =?us-ascii?Q?EKQy9dL4h0s1I0GPNhTZ8PWTQaKlTefgEACbKA04vUj7aUV2Lr4r6KcO5uPQ?=
 =?us-ascii?Q?CJayW/SLdf9kYD01LoroW4id3Hs1t8SlRWXyh5XZ91tSwLGf6zNhSkiuc1Mk?=
 =?us-ascii?Q?tY3d2MAG7zzkLo8icAZaEz9CVW3BbgeuqridlHQ3gF6ft1/mGksh+yPViqLk?=
 =?us-ascii?Q?9c01tvMZ6gS++D4EyIVWo3n1emfR6v8evXOusq0RiAC7PPOi8/qouUWQwlkJ?=
 =?us-ascii?Q?9gNufi2uTpRPN8owZzjLba/8o4QgD6kyrcrDdQ65JTRs3RSvzTwvBWzTyC6v?=
 =?us-ascii?Q?3mIGSob12HS/gPe2z91gq2cbaS5z8RBakv402RmSBmGa8dh0CLOTP1E4U3mA?=
 =?us-ascii?Q?DgSCBw8qvSYBq6boJJganF0Y192d7FP24RXx2BID+WMyMcJIpJkwkixFlHMD?=
 =?us-ascii?Q?wUQS6pK0Y/QHIRL/voyjx9Cl7swSwGKT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAhFUhRSlxUctw5J//xgcEpXw7m8PqY9vcSlNIu/PmNjRnXV3tlnm+1xFret?=
 =?us-ascii?Q?PBz33DQ/3jSed6GwpydmnvEs7yqnFJgxT0aYtRCjpkR1OWTNE8OYpivcP1se?=
 =?us-ascii?Q?FQxWcR0M+eirz6qUM7wO4UajhkjczDJkWCndibPYPTin5pMr2h91tQPGNVwf?=
 =?us-ascii?Q?+07eiqWVhwspU9gjkz3sYqBUauaS7kB+DZUsp9WVR+1JZCn+DDKQ0HXLjpnq?=
 =?us-ascii?Q?kc9fKX2yCnO3Ix+MN8cG1gxaQlvZVtHBq7/dYLNtHmDcGKPsQ+nResXniqsD?=
 =?us-ascii?Q?ybnJKfmGgITlyb/0xT7Sr+S1/L5uKtF6esuG8FASDwP6txyfu1iNvhp0q+Xi?=
 =?us-ascii?Q?SK+oc7V7jXDj4Vk7hqbn4KyYiVsMaKN5EP6BsJhFwADxrUoX76+IU8l/rN9N?=
 =?us-ascii?Q?xK+10L47VIL4mVKTgGwQ6fmhC6HFxavJ6dDjmqO/hhrEy5TsCAUlan/Vee/V?=
 =?us-ascii?Q?MxidvpN9At2PwJgqPiLMUDA3haWHrTWm00N+SHLVaJXTa0l4nc3FhCv8tWSC?=
 =?us-ascii?Q?mSozxaNQ/1oO1Lmf5ZjGerjPlqf142KNObApS54plmDKT11SnrDg++sAXHqF?=
 =?us-ascii?Q?QQHQrKOH9QAAan1BO2j7EAQHf/qbu7KSXsqPVI+/Yu8XoIIzF2LmnvB4PPnk?=
 =?us-ascii?Q?zTX2ovBANnCXH6aQHvkm3Zbdoa1nJgikWcnq0Pjv0Vjws5Y/BlZF0F10kuzK?=
 =?us-ascii?Q?3y6GqVW6zFU0VEtobehjPkRpk6QOoRHCn+BJk4wvPRl4sqdDuDni1TDX94Va?=
 =?us-ascii?Q?HbqyK3v9++752lNciO2wVo9vW8B1SZL/QN4r3cS9BhnaFD3EjJCKMZ7sD9Ks?=
 =?us-ascii?Q?Q5jWAxA1dQNkMVVtL7rUY8Y0xM63rY7c5asOydgE7kdLOrMApri/wtElJMer?=
 =?us-ascii?Q?seo/mLH+/oY6zxOIJI0qwSt+KZaNN+YZVgS+UBrFHMTIrv207zNB2t8t+/qr?=
 =?us-ascii?Q?TGMofAWX7+rQuk70gc0gt6Mt2A3odMeh3TXBmyVRFRWiO6p2NNorIACidRVE?=
 =?us-ascii?Q?oTytrEusF813xaZrOmh7aHd5UpFAQR2pW2gDyVp/qOmpsYfXEj3Vs79Bu3io?=
 =?us-ascii?Q?+qJF6h6XpCj2e0zypYLLVQ9N+YnI7OuRKWUy7QWjh13DyTvNMe45Pwc/pr6c?=
 =?us-ascii?Q?w1pMryDhikUxYSMCkSdeYkBy6Aa/8XkWnO4d3CpDovqU6zmChmTGFqU+dL9g?=
 =?us-ascii?Q?gC25lBifBR1rcPpv2UQSyWKqbUrvP7HBo1B2XSToODSBfm1i1D44kSXDYgpp?=
 =?us-ascii?Q?jE2ab82S6aoOYEjwIdEucK45ZGuuKv6RWwRvSbJk6XjnF11WMMYYOEkyiDXT?=
 =?us-ascii?Q?QTtzf5W8j0xH8xQFb7u2BZ40paXiMVuaLycqy+i33qUuZkUI3WbXX6MrDF/n?=
 =?us-ascii?Q?NmBhQLn2E6PEbhyWmF/LaQqt/hebiRxXqjZlIe1kXTmqRXMI1Sa7nIKBRcjV?=
 =?us-ascii?Q?4VWTIEGw7/wj7kl1nSLQXF1MIgfAy0Q6QYOYqA48fbE4RUzW+uAbGSJQKKz+?=
 =?us-ascii?Q?R9bplt0WFnXoTe0YjF2a4ScwBKB7yzYBr27jJVW+1lfdazCziNeouYlx+SCh?=
 =?us-ascii?Q?8SziaIAxaumYuQfZZdU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5284802-3c8f-4ebf-bd6a-08dda5169a5b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:24:25.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8bvAoQp1LGEAFzeQ+j1yP/qmsuiq3qQzHXOpKRWf5lB2XySX8dwkaTAOCbirD9vS0OHGIEyTKAT1pysoOmJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

Convert lpc1850-cgu.txt to yaml format.

Additional changes:
- remove extra clock source nodes in example.
- remove clock consumer in example.
- remove clock-output-names and clock-clock-indices from required list to
  match existed dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- fix clock-indice and clock-output-name allow 1-27 items
- add > at top decription according to rob's suggestion
---
 .../devicetree/bindings/clock/lpc1850-cgu.txt | 131 ------------------
 .../bindings/clock/nxp,lpc1850-cgu.yaml       |  99 +++++++++++++
 2 files changed, 99 insertions(+), 131 deletions(-)
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
index 0000000000000..ed178c7df00c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc1850-cgu.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nxp,lpc1850-cgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC1850 Clock Generation Unit (CGU)
+
+description: >
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
+    minItems: 1
+    maxItems: 28
+
+  clock-output-names:
+    minItems: 1
+    maxItems: 28
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

