Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2064.outbound.protection.outlook.com [40.107.247.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8D296FB1;
	Thu, 15 May 2025 05:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286492; cv=fail; b=K1vkDSJ6mrTiF0Tp7nIpnKJjin41UJglb71YyxRPemXTNKI86GKNh7ccCCdiTMEyaKrMdI3ej4Y2NgBkP1+G6JKKAV3iCN8rnPGrso5J/qbh5sO2I4vxlqZGvohBLDR7ddlJcPncEj4NWJermFwEVqVOT5lamcGS5nPdw8EAoOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286492; c=relaxed/simple;
	bh=r4g9hxJNedSVfVTXBjUrFZNqpUxIU23O8nAjzx8rFSQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyUzTchaxv9t4u92YjaW1mON1WeBEcGtlJTbjQp+wN6rwYJpjdmvMZTswmNxj++VSLXqEb37X7ZweLhKHXEjZMnirLbKySnLZUPewweteRRjc0n0RxGHuoppxxPRdVlw9ZmgYFstcY7Gxg9itXT6frj5oC//2etutL6NgNbWVJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dAErEzYM; arc=fail smtp.client-ip=40.107.247.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dAErEzYM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ2bbiXgAdjNjqDLCrw2LQjw6EF/kBMVWW+/VU4veX2wMcovRPCRgpRK3f8+TxyiEQ6XvSUVfH4zzKyivU/DOUdswl9BVZrg0veenv9vr7tGMWyz73PYJO4pafsM2TsTp6a8Ibd1mPiA3x7ILATd8C4Ule6Qc1w3bo1RXpMU34S48aInUz14G7IouO6BywNHQUI/dN4VDIB6ykPd7I5QnRwXNmp58TCMR/fDkmftet3JrjdputT5O7Osyo8ZWo5JccDzhxYKAGoCXh3Ja9U+pxh2uXxgWgrHg5OZlsZNNXTfPWQx2zmoPQyoyyL33AV7JDZoXoLc9O5RLBmQET8FdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU1Lv7t8fX8UN+D9GRhI7dEix8jpR1LK10VPgQ1QzUI=;
 b=DKESjGWD/Q3RT2BnEHAwP41ajgZFBJPKCcPhRh/NU9OMdTYetb2iXiF0LCrkqC+LEEpngWIPjz3wDgKRyiKAmTVzV8q4FFWoYDt6O2rxez/bzC3LXDs87SHlJMsPHCeq3ziO6cvWhfU3dGurX4n7bLNcJnjAl0wNxRBl0I9S0vWqj67Oc+zlavrden/Pu1b31M7JbltsvXRoaYdnEvpwsi3+6nnbFae82FyShrKqoLeWVC1f/IkuWeMmcywNe6yoZZ1Ujg4k8i1QkZ3Y//so0mBHT5X8ZPzpDoBiN3UESeGpnObwo+uDsx3YMESvpwx4BZgMfd6yChqyql/Oe4REIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU1Lv7t8fX8UN+D9GRhI7dEix8jpR1LK10VPgQ1QzUI=;
 b=dAErEzYM61LK3wmXPAVQF5znW5uGt9yWGtDPHNPaA1cWriXndgEZv5zvqiMUqfXf+UbNISmevI1hMgf4tEDm7MwVRblm379OpSyezIGUSlCd/AANoPYdMgvWvwOQqSdv4jokJktkJ/0+lHWmrlsff0zxqebj+Dz8zEuLfebVKCzpBZ67Z7aShtEpUUSV58beBsdLea9U1/Ii8tEplCKeqrRk8B/t57G5WBnTXUJzmHuPfXerjt1m+8J0ca7uHXCT5uHGnyS5AYU3aDTT/XBkeW1i6amO2jKJmOWX/9NE1TcejzK9Dqn8me9oQcfJ3IIFevUey4u0wmFe0RAithUkiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:28 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:28 +0000
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
Subject: [PATCH 6/6] arm64: dts: imx943-evk: Add PDM microphone sound card support
Date: Thu, 15 May 2025 13:19:00 +0800
Message-Id: <20250515051900.2353627-7-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d7054bdf-6bc2-45e9-6db7-08dd937057f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hrnga7FsuRalmPBqUNSpQTKnaPJ6wF1GKNPxqMQKqfILUOgP1IOqoaQRZVO3?=
 =?us-ascii?Q?zHa8HLKGkV0z74cea9xzmAOI0LVfBAOAv78SVX4YFA/D4Q0NCbQePweHQ0yk?=
 =?us-ascii?Q?/BE7ryH7eSa/BJiDIvlS77/acyjxedAJH4tu8uf9cEw273+Ng2SeKIN4GDUR?=
 =?us-ascii?Q?M79KBX/GngqWCRxgzG5XXPNs1D3pByuOk/KLtw6Px0JV4JVEgj+Y2KtyM6++?=
 =?us-ascii?Q?jI5V4ImoaNFklN1KOLzbyvN/KB1huewn4X86uStKPysV/3XAPDhXtc1tNe2C?=
 =?us-ascii?Q?+WCDQi6YK0FT7DYXO5mcCF3x2PAJBR+ntTrdzqY6VpDuxQm6aPrwzYQwx7fa?=
 =?us-ascii?Q?q1KZs5DCuzrP6sl1FLyaclDd5w22bxPbRL0NSHz1P8xVu3R+NKemJdlE5um0?=
 =?us-ascii?Q?CQ8bs9BAHt0/gSwNDbYz6j168O+keXUZn2nyivzb7wQf24B4iuP3ehDEip+2?=
 =?us-ascii?Q?Ti/pqiqOQNhgW4yHoXQMS6ujQZ/cPnXdN2sckwaGjrJo/g2FEs3cnZ3jKX4Q?=
 =?us-ascii?Q?gU0dejEv9iije1eyznDAfa5C95zZXk34eitK6nTcRMz0Vao5iB3cmL7Id8I7?=
 =?us-ascii?Q?arKat/b5pa4rOXhY9ycxDI1Z50b9F8pBfDUInTcAZHb7hPyYzV2z/EPOr/TH?=
 =?us-ascii?Q?0r4v9q4F9752zIiFUGpnb6/YFvSYD78l3A1ETCMfRpgoXHTDEIpMBNis8yEE?=
 =?us-ascii?Q?jWR8baheHWbCIMVV2I4jeRYug9qVZjnWTrYIL9/sWqNYNrjFi/Ar3WOYcR2k?=
 =?us-ascii?Q?w0ubm+Bz/wspdB/pzF6CCONRQNggJrAD9NYn7FtDyuAzyOKcxZ9GD4/9xyKM?=
 =?us-ascii?Q?zYgs1vsPXXM6P/4XHofEQcsJ6qS8ggBDKMWFRIvYBc7s4KPV4uXxKO+GVZT6?=
 =?us-ascii?Q?n52AXcCPBxyTo8gZ874WlAaYfScUdC1w941IoCWfOVzPy55igUUetC5xKTdw?=
 =?us-ascii?Q?G8NxasP51ol2w56lWYAchyyZ0hXAyI+b9mCz6CfDA/CC8Gx48lI4KmRluM8N?=
 =?us-ascii?Q?iqQtv+p/BryM4aubBMoiOJfmlAta+j7/PWnELUpI7+tWpYylQ5QuAhEXjZLT?=
 =?us-ascii?Q?Mjs/72i1tgDLg/HFvQrxRCP1hvL0uaIZLDfxHFp/ZXMzYxkJobiLC7/5GJOn?=
 =?us-ascii?Q?pm8kdT0RR82SNm8tm2ulJLyOWht88SlDeAr4IfTCJ/a8D5NI6/MHpiJvECtu?=
 =?us-ascii?Q?9r5G4wAC4m4HNWsM7Y6wCqQT37vb8lfdVV0ncWCwHuN9aLzDI9NrzjnrJAWy?=
 =?us-ascii?Q?nTzf3p1aq9eb4cF0wIkFfrRaxWp/ebPvwUoMc77/OAT5Irn3zV5LrPnjZg0P?=
 =?us-ascii?Q?h70IRUwxGzfrwY7D6AXn2qkGJtVTfB4VOm9lmjOnwiLYT+CBPhUueNi8xJwZ?=
 =?us-ascii?Q?v6RHM+k4xnCA/CfejlU23Dl9GY6yYTuda2vYirJXyUNbp5qNy43WbsDgZ6gb?=
 =?us-ascii?Q?SXvB0DIkpTLA5ENhsc2sNVg8QYGV0F5Xcw1KXJ9W6/GMBNt0qpl51v5skApi?=
 =?us-ascii?Q?U9NdyzaZ1cVv4D0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TmzwWvg5jLJjYwTnUZXJ65sbp+ve8b6tWnC22L/kUqdS1+w+6LCzp0jLtHp?=
 =?us-ascii?Q?QS9ckoIhrH7nif9N7xyZS+YbKUlJvj3a7Bhge3uzbGZqnr/WlSzkKDUFl7VX?=
 =?us-ascii?Q?aj/8+gbCn8n1Eauzp1Hy//08fcCFyozFI+tslFewqXp7OgRm8hMPx2qA3MIt?=
 =?us-ascii?Q?rmCeQB+Ikc7JwdXtUYFfRG1+dc8Dx6n7fF0Z3ZHFnzY9HIP4SVqoaLn1Loem?=
 =?us-ascii?Q?Lf9cnFC3OWdC/NCL/j++dFmWlP61Cw3N2meklv4nHlykyca4Z0liPc/t0Wa+?=
 =?us-ascii?Q?f6r1RJXpyJYejM7RPQxD/Aec6w7+06tDEoIKaelXxdxJrnayI1psesT+suWG?=
 =?us-ascii?Q?Sv0lz5sfA36RbB/C8lClu9Ok3xAxXmudDzM/rftDvFF2k5tzJAPFMy/XMGvr?=
 =?us-ascii?Q?zY2dPKzQitSEMiEmO4mKTVb2GyCI+2o/PJEbFHTsbHNjRFtKEG7NSLrQkhxC?=
 =?us-ascii?Q?cRFmTRq5fdovDHOOgZ5fjKTWv6OD+RTRi+2ZKHp0w2sSTKY9Gwwatiq4NoC5?=
 =?us-ascii?Q?ihtzX89hj+GEOsBl4pe1Jn2ASrojCVRIENs3kESXunbnqwdn+pIQQMg/2sIC?=
 =?us-ascii?Q?E/G9rDqYIjKHEhyw9hILl5cYMrxictNYjdoB7vyNpqMAFtdTsouO9OVxdEps?=
 =?us-ascii?Q?QFXnWRBeIm1N+/6r0ilx3FCw1DIw9nBIN6EqARCPGbGXuX6oaZAkD8sXKCe0?=
 =?us-ascii?Q?XP2ZlSNbiwNOyHpGADWKWqoZyKDKI+DJV1Ksqdz5N3BsgKMqpqKPb5M/O3TA?=
 =?us-ascii?Q?Du1xU+dOr1/vi2MrlTnDXCn/nWCA6I4B1brBHVYOOrQkAlEe81lD4lIc7Acu?=
 =?us-ascii?Q?rGv1Mobhz5JryQQHy4RP6iFafXp5ut6SSkJb7CXTf6zKV2DnizZmJUOF+S47?=
 =?us-ascii?Q?FstGorpBDh4TPWz5mLuCu0WkXwoE/OZ9QHADI6Iler/o3M/9VHgcf7ZR8S8P?=
 =?us-ascii?Q?jjJWqjF3485Ex9XqunD5fh3svlcAUhHl2ux89HnSJEYp8jxCZSZAMuKpvXeW?=
 =?us-ascii?Q?+qgFhZzcgahgz6s74OV16F2ax4NNz36uplPdurQDq+H67Mki+HxiEmxCRFZZ?=
 =?us-ascii?Q?dlzPMMiFMGw0UST/SAe7/HRAdj2Jdv+CysKB0AFIz1w/gxdaCY80xj09VoPJ?=
 =?us-ascii?Q?Oun7OdzSw7qzNTN8cm2dK65LS/KCD8nb2a9Gv7gIST3Idi5LqxCiTpfRECqW?=
 =?us-ascii?Q?M8xvBngeHVeTlH6VuaZTOMI1YiUNLfGtxDSQXaLjNWhW00AOm2huc9m58cBU?=
 =?us-ascii?Q?m4/m5bgu4usKJEgX3qjqkz/yZTmqaI99DjA5FDls34gsBWGZr2pXUxwPZsXS?=
 =?us-ascii?Q?qY5v3ofwBdURt6A/wbgiJ5SDvwasolItCoGLYkjON/Hroa1VSsiDCVHlRn/h?=
 =?us-ascii?Q?T8nusZTBExlwJnAVZyfuht9o0lQpY+CFsSrK1y3ZSdbLAv521g3w7hurf46k?=
 =?us-ascii?Q?kelPWntFBLyA0LkcvT99lSwN5M3CLGxKC5KUn8UUMkpC8Qhe5N+YlhYPC6LB?=
 =?us-ascii?Q?xydoYqASeNZmTLgEn1fUFiQgIt7sncHFkBnKtfLdK/MncEnKMRVMzWUvbYry?=
 =?us-ascii?Q?aaXqdk+SpERJb+yPrRSUK/Yq0VF6VIM46WoP9eT5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7054bdf-6bc2-45e9-6db7-08dd937057f8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:27.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GibEqmEOqnos3OYS3Bi5UNymMT7jZHe1QPTZX0almFhspbD26YZ1DeXBOuk7MzqicgMQg1C1mEQzTk7budKBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

Add PDM micphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone and convert
the PDM format data to PCM data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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

