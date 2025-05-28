Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED01DDC33;
	Wed, 28 May 2025 02:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397657; cv=fail; b=TrKsTmhOjeZaPUg6IcHMDyckKHCGlwRR7IXxhHWxWLBDiQf/q+gsC154ap8nOtLpMnyIVqDZSDRK5uJI1/O41StiOfFpOJeRWf2+3MAus3WiqC9g1CPZOBMA9Yzt8nEDhIAMsLMLRz3lLqFCe6jG29C+q5hvQD5G/PFxh2FbzEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397657; c=relaxed/simple;
	bh=dxVoRIYMjs7KRrmK5fmmp95hrdDx+x/WPw6LxVdciCc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ikSTzWEXxekcwtViE6FXehSCBdKBhdC8n3ywbO26vZcmtQ40/TdfDgdV6I8YzBrFTqZsxJg9ygSBIge6J0oPM78ywx9JYy7Adrbngpa/u36SU76eodV95jpk2tTtg+qlXumsLlcy/og0J2M6UutF+hWaOR/CKRZPPoiAqZ//uHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OIZyPwjT; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OIZyPwjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9u4nxYyJmfGbkQe6bi5LqUuPJEzgsFJ7MnIH/Ep86TGjc07IjqG9YRiNYj3ePDH2m2ZE5/94+Tz+Rn3QR21JGmPc0HW3Py7hPWwE52TktAG3Eip6QusmPnaXLfuDFDMlOJLeAqWwpaIenPP44O2OggpvxpVtlteaTzAjmaLQx47o00aSGVk+r9X675idvdeYnu31K2gMweP29/gVmcpMMRwZfgbWCntUGSsl6VoT0jDaLldO/9AdGJqbZXvnmqNsoK26+xqRGmXpOy+g8QeO4Hx0lhs8PHm9/nGcfCOWqRlX031OaIvnh3ZseW4jEExeVlKy9BmQFO2dPPWcEswRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdtR5RvRKs1pp+hbK2Hl5KmaBaaskXHMQLhzE/DNSp4=;
 b=vnERJ7aIewJdQb2XKiAJGq1GVkb0UKNHE46WOSElT5VyNKDCh/taBgCQ/zdPH8kLPXx9fHVJ4VjntOAoCcZhp0Jm4fcw8b9qgAAFS1CB7NuLV5iVU5f3uo5WlLb1Qqnzt6YXwZ/5ljTIXmJVdsQ+P4/eIEZxH56PNVLcdXu7PIiZgoayYGXrpI3OIjJS6HzkzBLqsXmO0bTGFpKnXP1pwPyTBSvBUCTZXPmaxoqVhVykwNiQvKiafyaVUTn3cQ0yD47J/p1WJ/8dD6HVruXnhgr1l/DARsP2A5DFAa/yITkQ1CCsYCkAt2B5SL/EdOsvP1nR0NuF0PFhUx14NEsulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdtR5RvRKs1pp+hbK2Hl5KmaBaaskXHMQLhzE/DNSp4=;
 b=OIZyPwjT3BtCDU27bfq/YPVGk74tRrgtgIyLyHg0cxcx4MkI27zGeUYW1WJSL3mp6sqUVgWcqiH/qD48QNdAECTZoyeN88cdpQ8A5MCa9EYTrX+DvhJvw8DNHu3EqB3bR5Hxb1BDKjpzlbae9R2nlLNUnY74qTIQJw5wsNsOHDKr3pShs26OpMtR7DeOWrb1WMK2IQhM4JYucIEVzPXKYaOHlJGSvOjWjpZ20w3xWWVycu8AiHFNIZWD5ug0BUmRE5f6N51t/bGrgcgxFwxX00D5aZt8n/Qv44y3rZQwK2mb8w11a4LFQbkYYsvVMX8R9hmAR+noEoPBcIH4JFAMPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:52 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:52 +0000
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
Subject: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Date: Wed, 28 May 2025 09:58:35 +0800
Message-Id: <20250528015837.488376-5-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b313da86-c2cf-4110-196a-08dd9d8b797f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z9xQIfX/HZkNyv4qESn2ALOyPTGqdmpo+636eSzG2JR6z8Enwqu5WTTFPDkV?=
 =?us-ascii?Q?5/hYwHMj7OX5R4Xq8WDVPsN2pzQea5g25SyD3R2AU265u/qIysHRLrQTFthJ?=
 =?us-ascii?Q?wdi4Wg0ViqCLBHLl4bx92MdEsObsuYO94laqG1zQdLJY0fOL3+CXCAKxtHG/?=
 =?us-ascii?Q?He+RAB9ik+uJyNji5+/I/P0HWqoQnBwgyZq8l7oEQ6WRqgwO9wT9HHfT309G?=
 =?us-ascii?Q?C2BjmQjkDi0ZeBgcI3YLgfBhSqeIUR7D3uvsEu+lHbGIjaKXGMzrYueBTMPQ?=
 =?us-ascii?Q?8xq22lW082dEw5jySBBznINjgZogukONWwR/+deZEVrnTH2W3YQiO5Nmd8Qq?=
 =?us-ascii?Q?YPjs6eLYpCTx68FeRqn9D3Csi9InriR4asK5Sf3/EmFcU7PUag1dhjVSBCgK?=
 =?us-ascii?Q?dEhsX+NQqkzr2jTxClC7NyiLQFBHKU6ULWkC+C65Zt5R2uhYIeCCfAtGS7T6?=
 =?us-ascii?Q?dwTmSNcaxY2/S1e9TIrYeTdzLSb73jnmzraZ46DiIZ2P8ShbPGhRWNtI3MeM?=
 =?us-ascii?Q?+0NPKBIF2up+iK31Ij6mx2ajBcfAEfYP4ivoKRXnjskA9tKqraNtFUsfrpH7?=
 =?us-ascii?Q?4t6Z+9GvHRuJ9SNKx8K/an2wQaFpRTY3rekBW2vvLH8CT5BWNJQoqh5Gy1GE?=
 =?us-ascii?Q?1QFyrlGX4kWNsBKhZdT1DPcGN+GPrPgbEraFxEGWXjbCk5RUiDcTjOgJdUjF?=
 =?us-ascii?Q?TyyMGnZPnWno8JZV/vpuZ5y5OEcrd0br8dmXSlL6CfNzNMxwK5555kG4QAs+?=
 =?us-ascii?Q?7EZ45lvWi9xbpY8q54WVIDH8WoUXxBVKoJ/YB7hJE2Z4BNqTlndZi5zo9GvG?=
 =?us-ascii?Q?mRjAjYz/dnH/7ylxMUn+muijv6LwYnd5MRvQ9nXs0L/WiVA2k8VvGd+oWETr?=
 =?us-ascii?Q?4uzvY64okpbbtTJnoRyFQCILasreWGurv3IWRxJhwEKEqaSrmGHvC755I5ee?=
 =?us-ascii?Q?kLeW2TgF6NQvmFzSusceLORN4xoAcrD5zMWe1Q9DCuqOpWB2VHQCAmZx+eVg?=
 =?us-ascii?Q?wNDDu9+yBlJ7ti3LkLRwpjX0jfcsBfQN7gNA6gIDpukBUvz5Oouf7xzRk/ef?=
 =?us-ascii?Q?RIfQ0jzgQx2liDEzX89e7oL1sJe9n3dWvyrVqbzKtK5548gWSKovSx0iwKFv?=
 =?us-ascii?Q?Fbb2Y0Zfri5hQAPjFnkWu4ZuZ58TJairNecRRwSbrZD1o5VfRow4LguvAgiO?=
 =?us-ascii?Q?/6d2n1XZgN5v6UBmBxRiKxODayM0R3LGM7orpaR59gCk/iioo8T76edJrSeo?=
 =?us-ascii?Q?v0cq49xRXtT05nPElASk8HVaD3J8avWjSw1z6aHbgOUrRtBLWWpvHCd3FmEr?=
 =?us-ascii?Q?xIWh2pLNg8kHT3ojv2EqmhCi8SGaRlczVDFxjMhMqvTganoJYOa3Neog0d24?=
 =?us-ascii?Q?2PM2RFVkEp3lXggOyH75uudsoHUE8CpSBvWa6hopgRaakjTqnz6BvvxXUNwM?=
 =?us-ascii?Q?QfEz6ysuL8fSQg4yu+SxU6iyVDMcEiQbBjhIwd29sPA/K5LVlWnKL8Vob3DW?=
 =?us-ascii?Q?XITVox5R/7dH3OM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nz9mVAW4KJItzWQZJcyO0ouuIuhwJ/0+yCN+1zKAok5xLq+6VY0pybKwZ68R?=
 =?us-ascii?Q?H1Y7dCEh3DI1FMgj8Hf7f4DfFYt2voq5zWu0LAtp6TU+XNRCwgoOPnfnUHt2?=
 =?us-ascii?Q?UwOdA1TC2DsamTD2yE1sHZ2UjLfcqzcuYpC64vZ0AYcxIDWLvr3Gq1CW7VvH?=
 =?us-ascii?Q?bMKOnseeeo65BuKwQ9CTqtPyb2mL6MgvVSYe2bCDNF52hj421AMYs3/kqWNP?=
 =?us-ascii?Q?BFSsrnyXCBzHowIiKQVbYNgZ8QETSlJSBJ6xNtr4GXP3AZaDJMHyj9WtxjZJ?=
 =?us-ascii?Q?cTQNYyoj5h8EKrvm3EYJy2bo5+ydf25UtoQhLpxypHUB2OC1GaTIM6kAtvz7?=
 =?us-ascii?Q?OGyhGx7sAKD+un6uXTwNDJas/qwppNeZwjdHb5jBDfs3yILNvIcM6GoKyhne?=
 =?us-ascii?Q?y43EAV735oHl5fed4baTR4488pBv2Rn2wLtmM2a+Bm2yWyHnJ4nNrhoKevh9?=
 =?us-ascii?Q?S5RaCuEnMVwefxYpIajd0i/ULjr9vpyn6DJHdszKWHCExlvW2DaerknYrzZ9?=
 =?us-ascii?Q?H6nqw6qVqsW01kVOxgWOYzX9Gs/2BiybUC4Kpk8rKudiI171N1KjRJLwtHG9?=
 =?us-ascii?Q?MG9lBNYF5T2FTB1f2BqE5Y5Fqvzcqg8/tFolHIlgVuJrfREz4M0gKLiA1Ssv?=
 =?us-ascii?Q?LpyZTqiCY2UaC0skrFihaPXi8rhprluHVomh5SZVM7gQtUvyJApIAH6/Avc5?=
 =?us-ascii?Q?b1kEch0IdI2ZpsdES3+7AADKzDby+BbpFv9zXjruBhI/Zx3QmUihdVjmybXk?=
 =?us-ascii?Q?WmECSbmTbESEhCrEm8pq464hcVdx1GrrrJMrv9woIirDgdgor8Fa5VcYhonp?=
 =?us-ascii?Q?YDPFPKMovse0YDSRVVb1x0+KOzyydV0P1woxZhXh0zgCa1ikKHC0T7avnXVe?=
 =?us-ascii?Q?4aCX1oXg0cRQ23jBRbKI7AF4inItf2WdCLSDu3LHVR2yvGGn3ec+/PVMpLYo?=
 =?us-ascii?Q?7jY95qApejmwvc6lsnMqZDElh+pFmZS5AJd2GaxmAufZEcvo9ZU42Spo0ul+?=
 =?us-ascii?Q?K8nX7UWUdBTBrD9IDNTMl/BFnoQn8huY9fmFhYzPZTb7L+kh6kS+dEUfKLDy?=
 =?us-ascii?Q?o1L0gmABH296I5ZB3BcvzEF3A5uA4SB1mbWNzOMyVrSaygOGxY8kk+W7t3N+?=
 =?us-ascii?Q?LgVeDbtDokrjFxDl4OWFRDY50V9tbFTLyjIEnP6XHdBVjzyvqKRYcT5E4Qtd?=
 =?us-ascii?Q?5+tLev1CXkkjpl1tdRxACpYXLlGSkWj3pVpIb5Cx4ryplAnmBvY8hmMd1s2d?=
 =?us-ascii?Q?533kNiCsV9oth9b2/Ql48hwnel5kyFGL4J6bTDyYA9hs2u5Ehau5W4OvohQu?=
 =?us-ascii?Q?UIeuW5uMOyfOi5ccVWyet11BfPJEKUsGNmIlROW4FNObOyIWsj1WWSZkwQEx?=
 =?us-ascii?Q?erD8CPeqvz8Ybd0Tcr1I94rHEy4WsCoaWQFMa5Z9ys4VKG8YZLERp2o844Np?=
 =?us-ascii?Q?M9u7T0wAswN7SR03ErP8xdOJ1iDMAZpanvyYR7hw84hX9TwdVobJgZ27zXJv?=
 =?us-ascii?Q?FjKQppfITpC1jKIIG2MQSy3HSCHMpNdHiJaANwrURVMlXXCcWJkw+C1eMjN+?=
 =?us-ascii?Q?7nVeVblhMyGiJKVVBzHV5mWZt6XwWcJfUiEQhXb0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b313da86-c2cf-4110-196a-08dd9d8b797f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:52.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DtswGfKtQuPXvLtpxOn+fhvuF5L9WeTjoPn0MG5Gpv5GRWGrB2Y20GdRc8XeVndAwjjalj+siaANRCKkGq3lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

Add WM8962 codec connected to SAI1 interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index ff6e9ac5477f..da08aaa95904 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
+	reg_audio_pwr: regulator-wm8962-pwr {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "audio-pwr";
+		gpio = <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -50,6 +59,21 @@ linux,cma {
 		};
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		audio-codec = <&wm8962>;
+		audio-cpu = <&sai1>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"Ext Spk", "SPKOUTL",
+			"Ext Spk", "SPKOUTR",
+			"AMIC", "MICBIAS",
+			"IN3R", "AMIC",
+			"IN1R", "AMIC";
+		hp-det-gpio = <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
+		model = "wm8962-audio";
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
@@ -103,6 +127,28 @@ i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			wm8962: codec@1a {
+				compatible = "wlf,wm8962";
+				reg = <0x1a>;
+				clocks = <&scmi_clk IMX94_CLK_SAI1>;
+				AVDD-supply = <&reg_audio_pwr>;
+				CPVDD-supply = <&reg_audio_pwr>;
+				DBVDD-supply = <&reg_audio_pwr>;
+				DCVDD-supply = <&reg_audio_pwr>;
+				gpio-cfg = <
+					0x0000 /* 0:Default */
+					0x0000 /* 1:Default */
+					0x0000 /* 2:FN_DMICCLK */
+					0x0000 /* 3:Default */
+					0x0000 /* 4:FN_DMICCDAT */
+					0x0000 /* 5:Default */
+				>;
+				MICVDD-supply = <&reg_audio_pwr>;
+				PLLVDD-supply = <&reg_audio_pwr>;
+				SPKVDD1-supply = <&reg_audio_pwr>;
+				SPKVDD2-supply = <&reg_audio_pwr>;
+			};
 		};
 
 		i2c@5 {
@@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
 				reg = <0x21>;
 				#gpio-cells = <2>;
 				gpio-controller;
+
+				audio-pwren-hog {
+					gpios = <12 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
 			};
 		};
 
@@ -262,6 +314,23 @@ &lpuart1 {
 	status = "okay";
 };
 
+&sai1 {
+	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX94_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &scmi_iomuxc {
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
@@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
+			IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK	0x31e
+			IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0	0x31e
+			IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0	0x31e
+			IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
-- 
2.34.1

