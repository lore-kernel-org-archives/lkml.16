Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011045.outbound.protection.outlook.com [52.101.65.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BB20E6E3;
	Mon,  2 Jun 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873996; cv=fail; b=CgwxWatNf+ev9tzb+Kt/estt1HI7KnKzCPIHNN4cadburIvF2jsz4nkSSq+qPK0Qt/Uf4UCAKJc7ZpPfO/B/hKOzPs71HUdzx5VPtf/NY20HPbgzMKd+eL9E6d24HIBQ7BuxDu///Dj4T4zdos80Wucsx5z1qxTdPY+wC1Zv8WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873996; c=relaxed/simple;
	bh=bU+Uo8aTJjdXvH+yUbmltNKwhNRXWdTxKeTzvJqUthE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DmUvrvFguTagMls9IDLJZi/f8durUBV7QmADQ5ZxpEvxf1WfFOEz0w7cVE1nLZ6U2bG+VDoVwZDHPiciI1XhS9mq6t9P4o0Q+PjGo+tnzjqA6RbThhs75NE9KZzpAU/IDMcNki/fo6y4PvLGx6dQtFWkMzNSLlIXC1iWWbUs6rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PdOPdpI8; arc=fail smtp.client-ip=52.101.65.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PdOPdpI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuZrlM2ArL8cDPNT7NSYJZPUuLZDLSRoNePWU7AVzEg6K3RF1lrqLcLZF+6NfmlXTvWr8mLUfX7vnh0bC8Yy8NENn3j+gAn7wGBpN773u82sd/HT7zlKUema1k05CmNPKYEJ5+m8Fz6uaGEjbG+cWPetNIlalpdXpbXIxNdw7Ar9TWafPPnvYGPRBc7YZjYQxqfO0hnRlnBmIvcmNfZ5C0paPbWZZwmd22AP0+/EQv/jtTzqFAJsdmyIiRBLQppufO+tta0Y0GxhBGwhoaSCGc52Qb3L6YQ/HWZdnZZOGOpdw1G1pUJDKmlrjKb8MoqYHMHRWlGa7i2Ztd9Fqbk+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMfu7IbVWn3aoFiVTYGONAi22/u2R0o5Tom8ECYKt60=;
 b=FiV0ijEoSjFwNgEFmtB592VKst9LXBQhQ3lZdS6LXRvbIKvGQiKotBmm93VomL6zfQgPXcg18qaoNz/aEV3qN+a5vDnIvQA94hUeYewQDczW7P8b0hJD6c34ixoxvBkKs5z2QtWouI7TUX8k63jm9jHylgDJ8Fp7M8YETEA4tQK7pKfzehkwfEMFFElF198d2ue+/gR7zi9bDxvZCvdBfPlTW1VdFbSbRHeNn1BMf/TwBy4j+p8ZNx2CsPHcdhVenRwbc/oXz3zKuWNYTYfCtd8RcOzRegsK/mgFCCff8h//IkTGz3jHuK9SUd1JWNKOMOBY611KsX0y320RR6nluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMfu7IbVWn3aoFiVTYGONAi22/u2R0o5Tom8ECYKt60=;
 b=PdOPdpI8r2Lf7rAN+xP64kx3AbwmcYuCv0YfLGa4dwDk27i5W8spxeCrCDAFlviYVFVh9+sseAwCBfKpR9hbPHDU/jFxwqwqEjL8k4of7+FXT8/kasedHhTOOozI6rik0XAOrWPWHfmaA6MQXruJhCfRACVWfDDG+6XbqtH6DCi2GEt1AXhUcz35RRKyGDeMGJ9xKOwkYzYRptFH0Xc9aPqGDtbK/x2x575nuhon8Mk5oQOdOsrm8MHr4ngaEhs+WlJAwC0pHv42ixylweQnS6EoSAlTN+YjvAiv02d/aAMBwoMaebEM1a8Ggeo47VMm8UwI0hkRroyniuycdVfWGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10153.eurprd04.prod.outlook.com (2603:10a6:150:1a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:19:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:19:49 +0000
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
Subject: [PATCH 1/1] dt-bindings: clock: convert lpc1850-ccu.txt to yaml format
Date: Mon,  2 Jun 2025 10:19:36 -0400
Message-Id: <20250602141937.942091-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b696ce4-62f3-4966-fa50-08dda1e088cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aTRxu+sYmsTceztAukae/TFcMcutuTZuVpS99YnXe+CQRWNM68dYQPsr6/X3?=
 =?us-ascii?Q?zOWY6rIThMjVJpMexBD6Vwp7C3rzqHfdFswSoeLW3eV31iwtyOCOKSN6Ne4z?=
 =?us-ascii?Q?TVvB0CZ7L9GSojBvyGa/bKRzmikXYhBdNPcAluzsLcjAz1Z9HLsWJkWfOznk?=
 =?us-ascii?Q?A+KJBz0aL5oq4k154FAtfa89WxsfUwreQ3OcRPUoNfP65S7I3PazuQTsw9dQ?=
 =?us-ascii?Q?sjWZ9ox1LoFpe0Rx39vLRWZy+tAJAaa5vCIQ236SxDWFI2ILV4qdoGPtlCQj?=
 =?us-ascii?Q?1u/6fs6tZs3iXXChPt4/Oh5NINWxINaCMGFpzYMTCwbk949eqZKC/QM+AAmw?=
 =?us-ascii?Q?Yh5XAgtHQl7VbetATAqPP5nb46fKVFPvOMU24dkbTScK4yAP/6+N0TIXULxi?=
 =?us-ascii?Q?lO2ts5rqOOLT0S+qwuUyHD9bK2IDrvxPNTJCRW4+xTnf3Xkyen7ZE1g9piXK?=
 =?us-ascii?Q?yqwClqC9EraFHt53abaaxgLy/TXtZ40huZhzbf6pF9vEZi8XbAA+fuNNsscC?=
 =?us-ascii?Q?Ok3fveSUZwAXM4crVaD+Ua9Qz/x+p2KuEZ20OG9t21moRBiQ5iSLeagm69qG?=
 =?us-ascii?Q?qYL4m6al470qZeuKiqLaJUa7syZjiyz8TMNh++WACovuAW0TjSOJkHEElk4T?=
 =?us-ascii?Q?ArKtOyQbukVb0ccP1Ih9tSOOrvI93guPmbk3QelxHXM1547WJl3oBQQ3ii4/?=
 =?us-ascii?Q?H06Qw2UfqBGol7n824uhPGnP1xzaE6ReYmj850Us0VmqgqPhpGrhtCghE/26?=
 =?us-ascii?Q?QvufdttjQCWdTpkh/O7Pn1IloIJcTlrFb88ANLBs0b61/wF1t0wVX39hMC2Y?=
 =?us-ascii?Q?v5LgSwJ4gYTDbv9Z+HH7TB28bqsHb02RHfv1cGo4jixHJVvRb/lvRrhiXveM?=
 =?us-ascii?Q?Q1UZ8U2Y2efmC+Z8cmNv+t2JnZmCAzXDRu9boUbfVr+2X9NXoT2lB6jjnRmz?=
 =?us-ascii?Q?B92D/+DNAGq7zKYWZ1FfsZKSsN9Ci3rYlSm8Jftr3FINZWo6YRUqgn6tHEhK?=
 =?us-ascii?Q?lfqDye+iXhSLEDarQNTZw8UVmM8tfTO6s14lrmDK/FhQiQysDBtXYwOADZ6U?=
 =?us-ascii?Q?UisTLL0waO+nwPUGBlwW3YCnISGCrD/QYmv72v6ePuUe/2EugVlTRh/U7xcr?=
 =?us-ascii?Q?wIaffBW6DFYj4R2Br2QPFHagFxjubWC7cuO1/nab+ZVF82szOjiyVZ9a/7ur?=
 =?us-ascii?Q?m5XHZzUFTD64xeMW32kV0bJquBEryTtJNvuTkCOn6qfWhCwT3cz8jViBoZTi?=
 =?us-ascii?Q?277sVeZeURQXpnoIXfOHhnWPWB+wDyC77H0DH4qNVbmL9XTAqqyUhvcuemef?=
 =?us-ascii?Q?NCxGU9zTPPJ7tLm1BdljMCm1dox+omC/pLc8cpLQPuLOsGkwx306O3RE94L1?=
 =?us-ascii?Q?hQUZiBFVnby2naUcpF+6UxxJ50WKUmJ1Y8+lqpX2ivL8B96TVKBL3XWVdNUh?=
 =?us-ascii?Q?x22cZQoDMtdtsYgyvaxEYpgn8Zbmev2y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1XEtJmtMeQcBzh4ofaFJIIj1YNcQJ9ZxvOooh0fXw0cHsNhBfadZdU75USTC?=
 =?us-ascii?Q?JcwlxWa6/lx4Z7lFcGgLC8MPLuDTaBy+XjIUMwnlLQxJ4V+i0Hw+P31h9SYO?=
 =?us-ascii?Q?ojnFe4PYB32ioiwURG8prMNk8LzX4npT8D9lvvsqhGX1H3jNKCBY/cWrwo3l?=
 =?us-ascii?Q?VEWu/vjnWAMmyWV6bMD6/RKZsNMSLnhL5XxcI/ExDkKV+cPCoqw7nFCvqla3?=
 =?us-ascii?Q?KNDKnVpvMCocNm6EXbuWZM9YzrosyCj39HMfMQ4B5RGySSZrdUSr3Qr2xddD?=
 =?us-ascii?Q?3Xia3iUSLqtrVHWs8gXeJrGC1uY5SMTIgNfyWIcNr4U+wmn1oGuhdm5UxyL5?=
 =?us-ascii?Q?Ly3ve8RLAp39ocP1iWSzEKdsS9cMdanRkrWfn+/9jX+qyJuEomt7esrtm4bg?=
 =?us-ascii?Q?7W5UNAr4bTR56tV9HhVGL7TnY/QV76u0ojkqakuwTB7y4w+pp/0CV059jBKA?=
 =?us-ascii?Q?OV3E9ndorrMOrM58FWUkl8lVR3+iXN60C96bkbTM84a6Wyb+bqx7F2BdcIrT?=
 =?us-ascii?Q?jt/nVHGc00uV+b8xQrC2fFzj+5sscZNuSCtubm84BMZPlSunvOwo5uj/gGT5?=
 =?us-ascii?Q?fj388md78Tf9Z/ivC2KYwh9jLKlIBVoTr6gfzY9m6lHM3GooGMzGPk0ftHfC?=
 =?us-ascii?Q?WvGb+CCan9sLHFOYqHqUjX9/BU9soBRh37t4h+3xfMX9+TGFYr1G5+wKDg+t?=
 =?us-ascii?Q?toAA+FcMu0+pWylo5If8qaITg0G+cPbUe32k9sRzGror0im46cs4q6yQQKr4?=
 =?us-ascii?Q?qDKp07EO6L8Hug0XafcahRpXq8bdi2G9JqWFg5cz370d84wDUO3mcpoAoEG+?=
 =?us-ascii?Q?HWZOUQmmCjg0hZO/Fgki1fZ1PpOFekSHAQrci554S8n8YWlFzw9BdfaxVvKu?=
 =?us-ascii?Q?74KB9ZJt5FO+VAnlOXBOSERSaGhdcRg40yDCOZu2G0u0EqwYePkMH+cmtafM?=
 =?us-ascii?Q?+XZYsoQguAUv7/aeTrlLscxRRHSFLBkWpE9kFfqb43Qo0hXArS2OrITjcou7?=
 =?us-ascii?Q?cWGnfm94m2Xjjto6xMxYyOO4f9cdW1VCHs67JZbB0RBh/VH3AsbvNz9p5gzA?=
 =?us-ascii?Q?xT7+AIJMXu7JEIExu5DxqroJq5262LSQwgeAc9WAs31pjiKVWDAxgR9OJOmD?=
 =?us-ascii?Q?zpRLVe8/vm2JB66bIRIScclWoVX3T06QmXcFCjvtzMQ9nBvQKrjdanE2fbH3?=
 =?us-ascii?Q?Kc0Aw7L4FDd6KOhbsg+ZUYytiagGXjcNnspM/Dd6NNf9wKaSMW7m89+xzKXK?=
 =?us-ascii?Q?QBElPpg59gSq1Zf+sjlLTYFhlNdXtoAuJkIV/r/PKTCdun1bfJDGytlSZYfF?=
 =?us-ascii?Q?/oACUiH1OR7jOP+3jcGnracbGeHsbvJRKJktxU7VKXh7pBExIbRzJHtGD/4l?=
 =?us-ascii?Q?0Ve/WwOS6obHz9bTO+H0Cta3dlCAaLF8WRfRoYx31GpAp+Nd1/1SwENYdd4l?=
 =?us-ascii?Q?9J5DUh3c7l8TQw+omiT6SzOzU4RokrcPw10KXrf7R1SSQf/feglOKeg7zi8K?=
 =?us-ascii?Q?X/pxToe8WCsHSVE1y8Eyv1GPCH9UO4RcaA1YFaMH2i0KaANpAcjvmqPayEFC?=
 =?us-ascii?Q?Kpdp6oEiGUryYt5DJrI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b696ce4-62f3-4966-fa50-08dda1e088cb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:19:49.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtUfnCdr2sSWd67sGKtF7UgY8WkQubgYgURrp3zJe8eGA1VNJy4tz/W3YwaDoL8SFSXVMl9I2vLcPv1O1gIwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10153

Convert lpc1850-ccu.txt to yaml format.

Additional changes:
- remove label in examples.
- remove clock consumer in examples.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/clock/lpc1850-ccu.txt |  77 -------------
 .../bindings/clock/nxp,lpc1850-ccu.yaml       | 104 ++++++++++++++++++
 2 files changed, 104 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc1850-ccu.yaml

diff --git a/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt b/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
deleted file mode 100644
index 8cf8f0ecdd168..0000000000000
--- a/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* NXP LPC1850 Clock Control Unit (CCU)
-
-Each CGU base clock has several clock branches which can be turned on
-or off independently by the Clock Control Units CCU1 or CCU2. The
-branch clocks are distributed between CCU1 and CCU2.
-
- - Above text taken from NXP LPC1850 User Manual.
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible:
-	Should be "nxp,lpc1850-ccu"
-- reg:
-	Shall define the base and range of the address space
-	containing clock control registers
-- #clock-cells:
-	Shall have value <1>.  The permitted clock-specifier values
-	are the branch clock names defined in table below.
-- clocks:
-	Shall contain a list of phandles for the base clocks routed
-	from the CGU to the specific CCU. See mapping of base clocks
-	and CCU in table below.
-- clock-names:
-	Shall contain a list of names for the base clock routed
-	from the CGU to the specific CCU. Valid CCU clock names:
-	"base_usb0_clk",  "base_periph_clk", "base_usb1_clk",
-	"base_cpu_clk",   "base_spifi_clk",  "base_spi_clk",
-	"base_apb1_clk",  "base_apb3_clk",   "base_adchs_clk",
-	"base_sdio_clk",  "base_ssp0_clk",   "base_ssp1_clk",
-	"base_uart0_clk", "base_uart1_clk",  "base_uart2_clk",
-	"base_uart3_clk", "base_audio_clk"
-
-Which branch clocks that are available on the CCU depends on the
-specific LPC part. Check the user manual for your specific part.
-
-A list of CCU clocks can be found in dt-bindings/clock/lpc18xx-ccu.h.
-
-Example board file:
-
-soc {
-	ccu1: clock-controller@40051000 {
-		compatible = "nxp,lpc1850-ccu";
-		reg = <0x40051000 0x1000>;
-		#clock-cells = <1>;
-		clocks = <&cgu BASE_APB3_CLK>,   <&cgu BASE_APB1_CLK>,
-			 <&cgu BASE_SPIFI_CLK>,  <&cgu BASE_CPU_CLK>,
-			 <&cgu BASE_PERIPH_CLK>, <&cgu BASE_USB0_CLK>,
-			 <&cgu BASE_USB1_CLK>,   <&cgu BASE_SPI_CLK>;
-		clock-names = "base_apb3_clk",   "base_apb1_clk",
-			      "base_spifi_clk",  "base_cpu_clk",
-			      "base_periph_clk", "base_usb0_clk",
-			      "base_usb1_clk",   "base_spi_clk";
-	};
-
-	ccu2: clock-controller@40052000 {
-		compatible = "nxp,lpc1850-ccu";
-		reg = <0x40052000 0x1000>;
-		#clock-cells = <1>;
-		clocks = <&cgu BASE_AUDIO_CLK>, <&cgu BASE_UART3_CLK>,
-			 <&cgu BASE_UART2_CLK>, <&cgu BASE_UART1_CLK>,
-			 <&cgu BASE_UART0_CLK>, <&cgu BASE_SSP1_CLK>,
-			 <&cgu BASE_SSP0_CLK>,  <&cgu BASE_SDIO_CLK>;
-		clock-names = "base_audio_clk", "base_uart3_clk",
-			      "base_uart2_clk", "base_uart1_clk",
-			      "base_uart0_clk", "base_ssp1_clk",
-			      "base_ssp0_clk",  "base_sdio_clk";
-	};
-
-	/* A user of CCU branch clocks */
-	uart1: serial@40082000 {
-		...
-		clocks = <&ccu2 CLK_APB0_UART1>, <&ccu1 CLK_CPU_UART1>;
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc1850-ccu.yaml b/Documentation/devicetree/bindings/clock/nxp,lpc1850-ccu.yaml
new file mode 100644
index 0000000000000..5459038cc9544
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc1850-ccu.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nxp,lpc1850-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC1850 Clock Control Unit (CCU)
+
+description:
+  Each CGU base clock has several clock branches which can be turned on
+  or off independently by the Clock Control Units CCU1 or CCU2. The
+  branch clocks are distributed between CCU1 and CCU2.
+
+  Above text taken from NXP LPC1850 User Manual
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc1850-ccu
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - base_usb0_clk
+        - base_periph_clk
+        - base_usb1_clk
+        - base_cpu_clk
+        - base_spifi_clk
+        - base_spi_clk
+        - base_apb1_clk
+        - base_apb3_clk
+        - base_adchs_clk
+        - base_sdio_clk
+        - base_ssp0_clk
+        - base_ssp1_clk
+        - base_uart0_clk
+        - base_uart1_clk
+        - base_uart2_clk
+        - base_uart3_clk
+        - base_audio_clk
+    description:
+      Which branch clocks that are available on the CCU depends on the
+      specific LPC part. Check the user manual for your specific part.
+
+      A list of CCU clocks can be found in dt-bindings/clock/lpc18xx-ccu.h.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-cgu.h>
+
+    clock-controller@40051000 {
+        compatible = "nxp,lpc1850-ccu";
+        reg = <0x40051000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&cgu BASE_APB3_CLK>, <&cgu BASE_APB1_CLK>,
+                 <&cgu BASE_SPIFI_CLK>, <&cgu BASE_CPU_CLK>,
+                 <&cgu BASE_PERIPH_CLK>, <&cgu BASE_USB0_CLK>,
+                 <&cgu BASE_USB1_CLK>, <&cgu BASE_SPI_CLK>;
+        clock-names = "base_apb3_clk",   "base_apb1_clk",
+                      "base_spifi_clk",  "base_cpu_clk",
+                      "base_periph_clk", "base_usb0_clk",
+                      "base_usb1_clk",   "base_spi_clk";
+    };
+
+  - |
+    #include <dt-bindings/clock/lpc18xx-cgu.h>
+
+    clock-controller@40052000 {
+        compatible = "nxp,lpc1850-ccu";
+        reg = <0x40052000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&cgu BASE_AUDIO_CLK>, <&cgu BASE_UART3_CLK>,
+                 <&cgu BASE_UART2_CLK>, <&cgu BASE_UART1_CLK>,
+                 <&cgu BASE_UART0_CLK>, <&cgu BASE_SSP1_CLK>,
+                 <&cgu BASE_SSP0_CLK>,  <&cgu BASE_SDIO_CLK>;
+        clock-names = "base_audio_clk", "base_uart3_clk",
+                      "base_uart2_clk", "base_uart1_clk",
+                      "base_uart0_clk", "base_ssp1_clk",
+                      "base_ssp0_clk",  "base_sdio_clk";
+    };
+
-- 
2.34.1

