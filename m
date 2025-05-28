Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E51A314B;
	Wed, 28 May 2025 02:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397667; cv=fail; b=a7PIQLa6Sjez0NvAi+SkvxsTcp3nW+LL/3EpoFPvVDj9T11orLOy6oDr5UWxkaWAwo1/kOOuvMMo3xfyNoqugMgJaSWefS3mP0/rMhFKV6YF4YdqIh5L09ey/YBG44B0vXYFTVywIkj4pd6oowTU+KPJbGG/ThBXAasyalt0afo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397667; c=relaxed/simple;
	bh=DzqkS1iGZEkmt6zbyPNJwBZKUPDHYQAPTSMzYG8R7Fs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mw/JzDzgYS5i5fFDfD2MB2QMcbqbXg3fW/sf/wwj2kN7/1vy/jRnwFx3t6DRKh0DjrQL9mkYrNtNPLtgfRaUOwfggwdYVVD2CnyrX8XDGicX05RSJaIgPCQIK+pei9Xj2kW2xUDiVwEo2HTlvtH77DePQfmU2AoUJO1OI9/A3DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oHraJ93a; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oHraJ93a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxFSY5pHfmUP8Hb2d7ONNgu8nFiiuzDG+eKbkXNcLAQoSVMwiK71A7zWvgmYEvXFyICcHLwJ3jEjpn4XKESCyTY2dqgCwTR30EO4KrRaQcz7o07mnKwxV2qg5h4yFKqh00u/v1VMtci6yGl92YlwIP2JlOHFrKuFqgUTuEoOJc0JNMKSCGEP3r82uAUTn+qjurNjNsO85tLA/OrIAFQ0z2738mN43R6CVzYr5jO8xpAaBdeU0SPu7A2L2KbGbVvOREFV74Q83EhvdvR7FAu6YIUNLJx7+9VD17qLhQD9tP82UBp+MqqkAyCWThJOTiAFgbeyTpDIe706r8PKO920EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rtj5AZytSeihYF8N8l05H7o1goYTWaoVkp4/m4QipI=;
 b=K/gcLrq9DaaN1GoYvO6fpMXQGFtmHs10CqFypsk6dGAbN5o7k17rhP311TNLhido9XZCNaorZjB9/wpmZbI45Xtu6jVZH1ZrEr4xjKJFleUnXeMk7giKfFb4fA2wfP4wEvdHnS6ZnqMV1Ck/e+Nu5p6h3W/cDnFoT7U2/La96fZJL/cAZ3JCQsOId+a6rQ+WaAOYNxvVwmpHouZo8VcBMbkH1zkNOxIOgu1Iqe5WH808qbV5el6NZQBew+pM3o96u1eMa8tj2JeIhvaOBXYQj3rxf7VGOahffzQe5nv0jVyckmF91Tn3pz+hMMLa+Y0xMZxhYGpKtu8OJ3n4C2mLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rtj5AZytSeihYF8N8l05H7o1goYTWaoVkp4/m4QipI=;
 b=oHraJ93aMF1+gsORLhJaf4cIebgDA4bDICGPgH69LYUdrr2MXS+UWV9lHAGqYVpNr0Df40rlYy0P4Qh4t/fZpUQcrN0a7zmafwXMRPhuFF57+VuAumgbIG8EZdRSW2cNDntx6q9dZsiOD+rSyShLGmatAHPofX9lwCtvUqhFiIrx1rdzYHEfdKl9aZTZ5j+gZhVOfvkfHPrbJIaU9QnCOhqy1dKf/xTZqm5ZsWOwXUR3dLk8Nk/S1ghIS4AeAYlphZvRW06hNz9amG+7bWveKPyTonrW5gCuGnu5rcyU00jdOsVCrInBMWs/uHRGtq7rgnB/L5LPLs3slKH+f34j6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:01:01 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:01:01 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH v2 6/6] arm64: dts: imx943-evk: Add PDM microphone sound card support
Date: Wed, 28 May 2025 09:58:37 +0800
Message-Id: <20250528015837.488376-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 28eaf540-8b58-4ad5-0ed4-08dd9d8b7ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wbZp/ZC6AhRo+tIbym3/wvVHkSag+0QOOoJghtQUyqailYetGwgM0+MWndvv?=
 =?us-ascii?Q?AKzHPSUiV9tot2wuX/UUK3YKhIErJNMjSyn4ujAtS6YGd+YeebspRMWhFm92?=
 =?us-ascii?Q?BSdI+9DYv/YXdGPCmUsZ4II2hJb+wmJhOnN8VoTormDi8iGidryA/eajQXXk?=
 =?us-ascii?Q?zDfcVjnMSVviScyLNjvZv1b9CqVky+wYx28xrXwd+jl3rHPzbtciwEc0L8UB?=
 =?us-ascii?Q?OXbInzg/0T909aUvKqVWjqVFYr5l0zpE0/h3DW1iXACUNXussFnfO/1dT8wP?=
 =?us-ascii?Q?XbLP0ajyH1Ip08AnD52t+BvjnOLgmGjbYeAseLMi3R3vvsGSogb/M2P3wX5v?=
 =?us-ascii?Q?zRMuWbJ7O82AgvS8gsskUvlGtdqwxu3ApNmhIHLwsO+u6BNJeEZCg1TsmLyF?=
 =?us-ascii?Q?3q45FmMDRUuIAyce/XCfu6EsScp2aIjk4PsqINppKmuiREi4AvCy+GbXvFf7?=
 =?us-ascii?Q?VDDTSsCeZ/dub7b2TOmN26bDzZsFogJVzPL2rE3GpNeZ/u7SbG2wn9DmgFAi?=
 =?us-ascii?Q?ba/oDuIszlqvEHfcDZs4pl+csQvvNsTDh2VHpXelVcUiR/limYy5ZZ2biqr8?=
 =?us-ascii?Q?NbobT3xjKsTP6ZPhhcVi4q8kk+3sDuKGQXkSUMlwd5IKEm8bsGFbAfgMsPgb?=
 =?us-ascii?Q?KLLaI0ONjeDKmOdyni/GhLBlj+64lP0VNtPcjnicO0MQyjQL1VF/vDOlO51a?=
 =?us-ascii?Q?r2u+Lmj//jwF1fKo1IcIcGyVgUlFVsCeF4axkaHjbSGG2D/glGktYhPmwZk9?=
 =?us-ascii?Q?W9LCj6warkDxmrYI6mTrO6VQCSZM7iNX2Cd/PVwnbahmksMgBA0KORVSRTBa?=
 =?us-ascii?Q?m4OnjtVtjkTr5N2lgMZkpjrq8q2QQChE5ksnqEIaEsdNbPIxu9mwIFy58hJb?=
 =?us-ascii?Q?63Dfp+ZmREwbIsyjcZI1/V0yd3Y/ib9lhm8GZ0is6710U0KJO68puiAw7YKG?=
 =?us-ascii?Q?XA8pXNF/srKKC6lwBXnBEcPdjL4oCRTHU6x8GyH9iYhgovDn/5xXR6UhMP8r?=
 =?us-ascii?Q?GpHIPX553kV4bto+/ONxwMBJl2FQ4rzwSlLPJxDlm/rvSu9Tw+3l1AXdhdvi?=
 =?us-ascii?Q?8AztdR9uW17SlrN7c2HiyWOUruKuRkT4BI7hSF5zCuc+i9G2K1lo8mQzWH++?=
 =?us-ascii?Q?57xOMdtB4ed1TeDYsmgXLPDwqUyK/2qobvN5cJylNVirtcZWoMfYdmZjBvPW?=
 =?us-ascii?Q?LRjxKZSmR38T5JkVPlUYZeTbZ/Cw1cbI93x3viqsNJbH/CnoNjjAtWbLRTat?=
 =?us-ascii?Q?YhS8xLVK+q7HaApUSbHaQmnv2aT3GIm3pNs8HnUkRKtWHlYwaDoG3QSwwFi9?=
 =?us-ascii?Q?yG5tcDOLx2aLNIVfIiU32NCrFnqClTtRVE6FBK9YCB/JECPovjKrJRZJ+6s5?=
 =?us-ascii?Q?fWOWPpYCgBO6u9tI1rdJh/sGABWtuWAt5W96v4obwDnoEqVdPWsTiAabRyhM?=
 =?us-ascii?Q?vTSvEBU+l4g2W+9Ku1MB+dOPNKlXCRXxTv9oLbSuor//lklUAmZqJSD7ojTU?=
 =?us-ascii?Q?uX+O80FN7//na64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ph/Funtp8E+758eFuPTj9cQSUTp1aiYhjFjZ6M/RI+MQuBYKzcm9QkLCZ+O?=
 =?us-ascii?Q?+SV9Sy5LGZLTvUY9jsF/e2OJNR1lJB2p+yzpriignvnjNenIKnLeMhIBsTBG?=
 =?us-ascii?Q?YZhUezyXzHzP1NxDIx7efqULKZi8KXHrB43zWgRwtWlbNbCCuRAekxQFvEAJ?=
 =?us-ascii?Q?QhQdJrfF6x2YljRSbHfeS1kpnWguFRteL10sQIuq1gNblbJ61rlXAspvigfB?=
 =?us-ascii?Q?fTjTxHWQiAaO8p63KltL1T1x23DODrz7KcTcYxVufgPf0h2F3m5/HKUefKxz?=
 =?us-ascii?Q?9s/5S5rf+vsngrb2awN8Op6wBEeQ81NypY8S8KKke6riRobh6ko3Rg+kzk5d?=
 =?us-ascii?Q?YyqB12fUO4AScRu+gOeBMNi7GB6F6h+HwMJmqIl0lgrwddvd69A0+j/LHGVy?=
 =?us-ascii?Q?oWecOSd2bY/sEG2UwV6aJebu6dejkl/uMCZIzfEsxG5651tsmi7In0vpTU2w?=
 =?us-ascii?Q?2cpnF0NySzk+I6Xr6PSIEogHm7sLwPKf8b2iZqzztU4T2sy+27jFmJaPm6cE?=
 =?us-ascii?Q?DCQ2REiQEEZyiKlciA/p4+TYhLFF7Gms8yh8Ro34FyDioVKyAUBzzfO5Tw7h?=
 =?us-ascii?Q?YELOFEnidi35T35GU8E/54rZGU1CA852MtKDCM+mTs+ebhD+ZS4BbDQNWI3V?=
 =?us-ascii?Q?sCcLj0M/xR/I17KIAmdXzn3hOBNX03Q/ndoXTUbWeyol2x6PcIqzbs5uvnU5?=
 =?us-ascii?Q?e2QuKtgyvn6cUWMcBMuSaxHD0v+61DT6PB/CWX6F2YuHXNk7Y2SmxIDC32KY?=
 =?us-ascii?Q?S2FJ2V2nTlhYt3T/pBZQYrpQam12lt9Oco28aNj6n8VaVn6N+glktL6cZ8Nq?=
 =?us-ascii?Q?h9HdhY9nLW8zeazIMMiZpKIrJpfKAnFarDbHSoW4EhfWAlUs2voxC6IfiLGf?=
 =?us-ascii?Q?fDgqAq89E5pa9ZV7iuHVOxEXtcXBFitEwTS2XM/aJoZXNPTHPsfBeh/AmiKU?=
 =?us-ascii?Q?EobMS5PUjl1/OYBl81qeJ33efZ51DI1tzhtZKQsnpPWt1dg9t44wTWj8BeyA?=
 =?us-ascii?Q?UJtO9xSY7dAjQrXeArDKohDJvRVCaoy5etxmR1sA5lCT1VYffaOmNwhFH/DT?=
 =?us-ascii?Q?CE2rCKF8cBRtoKZ0UxuFVCIDyaZfDS3zGIcxCLTrPwiC1ncVS+XohCy5IiUS?=
 =?us-ascii?Q?uHVwO3Pcjd/hzia8qtlEtS6ZIgMNzGtHSpm0XrQhdea9wl+LU8tO6zL75flc?=
 =?us-ascii?Q?g7Wo47AzskYrQHejHnedtcgsQT/dNbKCIROFNNDv08CpNSKNZwpocpn6yyfC?=
 =?us-ascii?Q?+IbQt0IE3Pj1OxDxAsucC/sZ5G+MSSLm6clJSdZWeIGGF9Z+159HcHiYOabe?=
 =?us-ascii?Q?o//HANsp/quzJlG0djjJAmHKAJddi4S16V4dHvJbvme+y4kJJi73I4Bxr83G?=
 =?us-ascii?Q?qHWZAnSZvkF4nWtN7qR5EX2E/krSUqYPB7XtxNug8R5nglw8X2vlGWfTPtGc?=
 =?us-ascii?Q?6AXm5ku+o1qqSxRGW/Q9DIo7OTXAnxG0I2pE6+1wKgvy+iZvh3mZw3vNTLDs?=
 =?us-ascii?Q?O0kzbCmg+LG2gsG4nsrZqspgVt/oP1fgN/lSVGS2OMjv2K98Jdbd8WAtBjA9?=
 =?us-ascii?Q?idjXn4Ka6DaIsPrwIePiWUvDPPL5Qx+3ou3qAHT1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eaf540-8b58-4ad5-0ed4-08dd9d8b7ef3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:01:01.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehy77AcbNaoU9V7brXKQUqQreIFElNBrzE8A77wRX39QBGN8LXzKKqk7uGOumcLdYKUt8/HPk2lOve7SZS8hTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

Add PDM micphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone and convert
the PDM format data to PCM data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 60 ++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 85cec644dd92..c8c3eff9df1a 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -29,6 +29,11 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -83,6 +88,24 @@ btcpu: simple-audio-card,cpu {
 		};
 	};
 
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "micfil hifi";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
@@ -204,6 +227,12 @@ audio-pwren-hog {
 					gpio-hog;
 					output-high;
 				};
+
+				mqs-mic-sel-hog {
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-low;
+				};
 			};
 		};
 
@@ -314,6 +343,13 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
+				/* pdm selection */
+				can-pdm-sel-hog {
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-low;
+				};
+
 				sai3-sel-hog {
 					gpios = <11 GPIO_ACTIVE_HIGH>;
 					gpio-hog;
@@ -344,6 +380,22 @@ &lpuart1 {
 	status = "okay";
 };
 
+&micfil {
+	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX94_CLK_PDM>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <49152000>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
@@ -413,6 +465,14 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
+			IMX94_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0	0x31e
+			IMX94_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1	0x31e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
-- 
2.34.1

