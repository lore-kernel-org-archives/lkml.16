Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154E29672A;
	Thu, 15 May 2025 05:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286487; cv=fail; b=Izqb4yOSuBdWrtO0GhM0DYoBuChBioKICmM0YPtw5In+GCaYQm10H1MdKZFY95Xxqqla1m2fxjTT2h3ko7b5Pw90GLduGSVG0hHkBS9TkFyI5J9TKafL+fFp9Y+FPzb4oJja6kKdo4TZxnmb32ITWMnjKpGD9WcYvEtS0FAmu00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286487; c=relaxed/simple;
	bh=g8QhNjcpc5zuq/dS3VodwN9mfdkAXYy1SliCWhMI15g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QEaf4ILeaKKfCuSeo/tK9Jd4oAZVYrUJjTh4ksbf/Kcrr1S8KXxeQfmpGE5YC4NzlQUIYbSbekoLx06sFrSguwhqffF7MurMnrF/npRl4kqSVO8lA+bE4RVeap49/IknpZKs50fjkALAU6W/NFg6WXfaqYmjBzqIvjxyQYY6ZTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kvbfc2wu; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kvbfc2wu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdtj40yzcjz3r1xYE5Duv25rDbmR23QXerGSaceAN6dNfms2dzYlSFwpK7KRAIbFCN60VZnLv3TcOhPp9SaFJ8G4HaA3un3DwJgs4y+9SaKN+11TmWGTxR6n7kMZsBCSBITeqmMx0buICQnXghFLqniXNQSb5Zb/xgjt6P1bW6tRK9p0YORdb5DVd+iPyAxVM5RvaocWBPJTRb48CkhnhSS3UByUqZCU3AoazkmG1YC1bfPpMc7K2Hm1nr0OpMHhNEHnQSpg+IlP9S2Gy8g4LsR1GLw6Xo9KU3/Bsr5g4aqVh+hxaGTttKfjofeaWDRRM2KHduee6aUIh5uYQjvWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK+YCvGYjKyF6a/UZAiX3WZzrHZ2uCX/kLvX4aI4u4Q=;
 b=X6a9PYXR9YYbwzlYq4/L0E4/ros1Wepe5kw9dcJa5vir6a70CHsDzQ/RCxK2lHQM8uCq0F6RQxq81xa+kpcrLlrom/COJvCByY5BydFqzypiNw9GwoOce2ylOhUENlifYPr8zjai5r2PUvgGptTw17mdiJgyuaQAOH2c9tQXoOHi32LpkTdRFata48BEdhqJX+1PhLFT6kRkREEdgMM/4Yzrl37HOOzJTZ5aueZzXdt6iWlIq0+e9PwpORZbZXHXUuzTCkkJvdvx0XcJ/l85+tE9HbKBhK7k2h/lhI92l/CVUV7fQ86q3NfgjtPhkh5JENB3hfhWcB3iVkdmziKBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK+YCvGYjKyF6a/UZAiX3WZzrHZ2uCX/kLvX4aI4u4Q=;
 b=kvbfc2wuUUH0LWP/+i1wiaCQNpI/X+7Mp2p8VZLIFBaCHrliQHL19kjbq0h0s4+r8Z/mHAu2EScZaM5Rt/o3qESo3EEKyW80GUJZs4PCqqBpF9MAdE4QSI67aCZQEtVQkTYJwhfFL/B+copuSGQNULDWw9Xz0F2I/ttUe1WHXmcMSqbK4MXtyXvnWU3NVMEP4hj9dTa+FgJUskMqK9F745HdsevkhAelZ6SzCH2PfV12ZEQHTzWlJY9fv8uVmE8w6Oh+PyNovVVEXYQ1/4gu7p2/2yOhuuOkLuFBqV1BeWGnb12cE/dX/JQNNPohk+ivvDrTZYd0sxF7AUwLzBS64w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:24 +0000
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
Subject: [PATCH 5/6] arm64: dts: imx943-evk: add bt-sco sound card support
Date: Thu, 15 May 2025 13:18:59 +0800
Message-Id: <20250515051900.2353627-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10914:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f328a33-735c-4d95-779b-08dd93705590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K/WbqUhVdQb7UbY3u9g/gNubNIVR4GJMXbdbP2szisvhawWOE6l4pxLgebGO?=
 =?us-ascii?Q?h84M9rls8Icd+IM8Fp6vzaC3Neh6Us9hYaqDo/lzsvrPf65r4vkImGH4KnbL?=
 =?us-ascii?Q?lakMqnI6T8h1e9WBXOG+FELKRm6ZpVNa83wk890UKOlZg2VzlE0C+eCB9QYX?=
 =?us-ascii?Q?0/dSZPvQ3hfB0T/421qZRbSVCKbVS4lb2EU0gnYCDJCEoIWS40V/UeZSKXEd?=
 =?us-ascii?Q?F/mMIqINlTh5JAUFJZIe5yUBo+1zozQx4MyyUQ2KNlSlu/7nyDEbEypUTcYu?=
 =?us-ascii?Q?cTY5QIB0R0a9DU8aiWcLn4hJo7Q8OeEljxLwDsADvYNPvz0egsMkbMVp/faH?=
 =?us-ascii?Q?GheutDzplUk/A9gYg8ECPAlLalghvIIOuZT5RF7+thwk0F0L3kxfpkscXRKI?=
 =?us-ascii?Q?LvN9AvGDLStHEuQhyhoKFtVF8f3PmQAxLioo7abAeNLhwELxgztM7IOVPsV8?=
 =?us-ascii?Q?F613KeJINVeaROzo0RBztkcK3uwkT3wuuOxs/agxIyvg+wwEGGdl3RDxOcBr?=
 =?us-ascii?Q?ZH6+nmfl14sFbTPkHNJaF3pZlU/oo99iy6LxL0Q3Drvy9TTrnhT88lZpobEb?=
 =?us-ascii?Q?h69flUDuctv2lhDwZNFmB4ZnHtxppF3SwKZ9xcjJUjq6sR+DpFuEcqgjbT2q?=
 =?us-ascii?Q?DdSpzbJIoSmtTOC+XAcSyyRPjeUQvbZ+up1KFNXrbBHzmWbP20oEkXs22ocg?=
 =?us-ascii?Q?X+W+LNGsU8/7h4fmueIFR2TnzhC0T0qQbA1oeUCJiSpw1a/NcQtO6/5VSAFW?=
 =?us-ascii?Q?SqrkMYDUGh1XuuVPVnwZsvx0UzfYL2vT2/U9uUToSilxSUnK3GWR5gWReGc6?=
 =?us-ascii?Q?V0NdPag5NRtIlsRQQDMvEUJpUwyM+ujeyFBuPVbsp18BPmHsj2Em5qOyq/Y9?=
 =?us-ascii?Q?AU7XfOcuYr0ImqoEmXIWXYJar8+W2k+YM04NqIFzQ1DtYlJBhg7KArLyW/20?=
 =?us-ascii?Q?Bm3gnA8YItuFt3lKaWqH+Y7SfQDL0YCnp+R4v06+Cn4Uvu0FfDadsm7/Ng7a?=
 =?us-ascii?Q?OoSyU/U+ZMcVT+YkrCxv7u15tcCw8T3OnARmhNulks1PTSBhVqmsEWJtWT08?=
 =?us-ascii?Q?EKDLyJ3FYsZI91pvMRIKk8XruPxFP2TSPcEVCHUULX7oMW+937DkmxM/QKMH?=
 =?us-ascii?Q?ZP+TRiiz1PAVnGGtoDmfEKC3oomPnwcDeGbYMas6ZZEAcejdwmX6xJg1iLc8?=
 =?us-ascii?Q?hQs0oJEq5tHD5WBWRCUn3Ww/On1AdyNzlRkPeLHKhTcwzBSGgBpoo4qylJCA?=
 =?us-ascii?Q?DY8SaGYKf8RGbiZ1MORkzbgGsatBU2wvpUyqPS7ot79O7fkM/7ygiaFNPFDE?=
 =?us-ascii?Q?C8FKEVzc9kZM3D2yu8WRBtH8Hwvmk5JNO2UeS/aYVaOKPq/qasXxuYjPrrUq?=
 =?us-ascii?Q?agpWeyk45ktk1BnsezAFpX3LY5HAaEQ8Koe/L7HQpAYBzjWN65HhusMIZi0Y?=
 =?us-ascii?Q?3LMr+fH6jDFC5JqURCZrwrMYi+Wd5TtuRlCLVzl9IcvaEInstRpu3NOlkwQR?=
 =?us-ascii?Q?44OUc4TkCMrZpUU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKmXoGBGmJYZaO2esjHIgOXcCUsyfMTTIwvT2TzVgMeakDkMj/VQxQ+thuVp?=
 =?us-ascii?Q?MSQR2SHlPWmgJ52QZTKcjLrPpfrg4YOX3KZvm5crn3G0ZdKLUh9zbC0JqgDc?=
 =?us-ascii?Q?lzZIRwSsGuvHD5HULWL84+HWEoExIwZe5fL8gIdn5FJV+TNdopolrYkgkG0e?=
 =?us-ascii?Q?cvIeGSWgbQfx54SSLqdxo3fBMW2vq64HLst7ePMapDqtnFZwwWEmGRJE2q19?=
 =?us-ascii?Q?yDwtuYwdDtywGU+OI1raofY9kBZDy2bfoucIo5lzTkp+gslsuoAYjC8dRIKP?=
 =?us-ascii?Q?PoFWPIYZaZSQ7F8LlqWdI7FFwlTLFmAYjzK9vXL9k5SB3mJFB6KHcTMXPM1l?=
 =?us-ascii?Q?pdtkEBVuxh6W6xZLu0tpOamQv8yAUfH3ImQTrb1CKYr5bCp+1z3cECEtnmg2?=
 =?us-ascii?Q?orPsb2m/xBGEAFckRM/Y0U4AeU8MHw5rFNvCvuU0mTbhGmr6EZRIErDWgJ/v?=
 =?us-ascii?Q?RI6L+pj6RTb9AP/My8aqtxVHD4R72rMM2WNWhgbJBOqK8dL2N0/XB0JVznDa?=
 =?us-ascii?Q?/8/Xuqz6ZL3eTf5OL+bk/4vM8sCKw7UO9I+9mqT/Ld2t6eKkqKRoXZfDF1jS?=
 =?us-ascii?Q?Sg6jq1dWMDaC21o+oeHuGX5/nQylML+AT53p0NVNAT+Q/fgvcNazgMH3EcaP?=
 =?us-ascii?Q?88BMgYnpaWUsBmi3fqU/P7OxjyuZuJBHG8VGvjbmucxmZhoOgr24fpdlN/Ad?=
 =?us-ascii?Q?U1V8JHAUMP0P6ve57AzsmkYihrD7W72498lERsCfK77Jx5vPI1dJJdm4DPmA?=
 =?us-ascii?Q?MRgOX7SaSMKfsjhO/XhJykf04r/NHli06lpzGa4uBe3jVyWclHbU8NLBknR/?=
 =?us-ascii?Q?wjT9/sx24qM2KMKJNFrgQmvmKxHZ39meOlgryzC+tG22kni0ds/UPOCnsLd5?=
 =?us-ascii?Q?ijEv8ViddpvmGHYMxWovkafcK9AXv22QKAZEPJXQc9fljp0lcTSaYEkp7JA5?=
 =?us-ascii?Q?ASo8DCaB8lrPGGYnzfYURN4ZTqZDxMdbjw94EGEOP3IE9zGqoQJP4T085VU7?=
 =?us-ascii?Q?rqnbo3fzYmHFCTO5dFQvlXHzMWPy0h8s7hnmsdsTtmdCZ6xXG7K16siGdDrG?=
 =?us-ascii?Q?U2vz+HFxB/VJTnw/TeZs5iIouVkKDylhyLXtz7SMKsKjJjLh1IAXaRCRl9Hc?=
 =?us-ascii?Q?791iDVhzz5jv2Zh0ay+pcC1CxxrjCbLkb9pMZiy+Jf3uOP/gos6m3tXvYi9n?=
 =?us-ascii?Q?0C3aUleNjqCpt2+fewVXadHH03Z79DWSrUuGjnALaQqKoSz78wOFmT4/M1OJ?=
 =?us-ascii?Q?OHecpExhwDaDlsPf7cFO7dK+tp1Mm3LxTMPT/HglvbXYHGItANnrpJ648JvZ?=
 =?us-ascii?Q?FnjVxo5QgeKEe7fW1+nTEtoyIRJXZ/6A6N7V+RBHqCquws3kt1SVytNxty2v?=
 =?us-ascii?Q?ZSuiyXh3Q0kzRncSEL1UllejOB9Hz/rR28ibcUclD5It69ShML1CPSSiB+Pb?=
 =?us-ascii?Q?q1qExqh/GvKCg5j4PuSM+meSDEQedb+jglYCGEft5B+wO4+Zp0Dwy9nD+TCN?=
 =?us-ascii?Q?zMBtd4Aph+Zg40tw77YLay4QcTpLM6OJUFMHHtHowr5Ii/C+xT6bNdHs17Z4?=
 =?us-ascii?Q?Xuqd9vFV/+EtIKTDbdm48wu0iq79AILqRlS7GJBj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f328a33-735c-4d95-779b-08dd93705590
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:24.0280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+7ctSTYAHAEsjS727yOKCI9M99DEdD9pDdQLEpUH6PLx/zWyL1W/Dzuzg8s4gOfN+cJurYcO3iZrsKsye2YAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index da08aaa95904..85cec644dd92 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -20,6 +20,11 @@ aliases {
 		serial0 = &lpuart1;
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -59,6 +64,25 @@ linux,cma {
 		};
 	};
 
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&btcpu>;
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,name = "bt-sco-audio";
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+			sound-dai = <&sai3>;
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-codec = <&wm8962>;
@@ -290,6 +314,12 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
+				sai3-sel-hog {
+					gpios = <11 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+
 				/* eMMC IOMUX selection */
 				sd1-sel-hog {
 					gpios = <0 GPIO_ACTIVE_HIGH>;
@@ -331,6 +361,23 @@ &sai1 {
 	status = "okay";
 };
 
+&sai3 {
+	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX94_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &scmi_iomuxc {
 
 	pinctrl_ioexpander_int2: ioexpanderint2grp {
@@ -376,6 +423,15 @@ IMX94_PAD_I2C2_SDA__SAI1_MCLK		0x31e
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO42__SAI3_TX_BCLK	0x31e
+			IMX94_PAD_GPIO_IO56__SAI3_TX_SYNC	0x31e
+			IMX94_PAD_GPIO_IO46__SAI3_RX_DATA0	0x31e
+			IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
-- 
2.34.1

