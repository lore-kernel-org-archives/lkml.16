Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A895296727;
	Thu, 15 May 2025 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286485; cv=fail; b=ns7rUXzhrkHTRQy5SYSrfSSOkiuGMsKaE9kiEaovBfXJK9+h5bKrdJsVHA48RceHcb0t86yWsR9jcGFDazrRvFeAFA5FEXYIXvNyz/mA56jKcYU2+YSAFbSeGy0Fa56wLQ+PL78u3kVOVNlgMKvenyyihxeNPO33GHrL/bddfOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286485; c=relaxed/simple;
	bh=6O/eVApsmNWYXsHrjKVDTvpM/tHavnL9k526hFTg+Ho=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DAPmo1+Ru728pelFBwVmvEAKFEQLDLkjXpN2/a1bHR0LIBhZ6YsmhrEBhIdEbuY+nSVRH39jj5QXNvbbPy6ixltqyJWOY/YNi5D/jRFeZCk3rhw9Ajwcxk61D3VeoFXQcfqiZn+wzonJ8bqcflJFYnXy2zCO82crcS01x+g+ldU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KvnYvbJb; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KvnYvbJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnYyox4bgiISihdr0tL1/qUPqkWljlhQANwDUuNPb9FndbU5Z0lnZY6CSX0p2h6L4ddcMTKwhwUsuhxqEAqVWE6KHPm2nQ9kN9YDXFFxYdMVGrUN7lGhQ198uM+df3SdRYJC8eP50VR9QGbKiQndJAsF02OKl2Q7bxTEBKWaSwDJrpIFVtnwBp7BGIZLHJopKeZM1hpbQZ2HbR2W3yEa3S1HFzWTIpCcfW67ljaTfsThFY8+y1+L1+UDtIwTzikU9LqN9ygPFIHeouGIv+OXTCHT6ee8QBrywuRX1lJptK7+VPp3A1zxudzGuHbsKx8cr8rUYM8CNMU0XJwt9w5Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EsMgtea4ySqPVYP4vTi+0DRKZUnIVAO+PDxnxMKSU0=;
 b=aqu/28/pu9omTmqRsNP/Z4tBuBl2NkUdcneQsNSkqvHpthafTfp4hUj/NGH/E7SZDxsFdn8He+nQ2wTAgR1A5cMkOUZAU8cCAGIEgSZGZvB+igprzfhWDynlbH4J+bbN/kmxK/YibmCGcIWgmqX1bNuqbcF3wAmhuQxrDwQ2PdhFOdXY6Sn4+kp5XiNhtIG6zk5/vCyQbnMjC4hrRNKBL5Lsgt2XXOHL2o1ykhw5EgVANDxSmD0jWGLcdtZ9LMPdLKyGgF5dFUgHwzAOxWK7M4rEkveX1xcXzZNpEcw0sbikaaQSmqSK46S0U5+7pdmvqu+AXTPJRcDHl8LylzVsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EsMgtea4ySqPVYP4vTi+0DRKZUnIVAO+PDxnxMKSU0=;
 b=KvnYvbJbDzDqXIfdvVmp/eXHJhI+jX4FIN9210Xz7+TXJCu91eUGj4NOHO+0WilZvYrDwbhpmruaEf5hJL8qJaze/vRhbNRogL7cdxPOPfdkNrf65+CWS0gcSF0Jca5xLiuZjBbZ6dIIWLsC5VrK2mybf7HLCB95WxVv6sBTUQlkaeKy7hezvdIVFDHXwYKzD26kVq4YZQQ0+QFsNNeURYDYR+WmppvdTsj+VEV6tdneb9knjA6n9N96h4wtqLqIva9Zf5ilWleYPAQjeQprjAxdAcxf6KfNJ9NYA3L8imEFJklEExtVVDW5cy4SEPFYQBhBsRcTCgN0tGm3ZXn/Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:20 +0000
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
Subject: [PATCH 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Date: Thu, 15 May 2025 13:18:58 +0800
Message-Id: <20250515051900.2353627-5-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d7766697-9168-4bf0-6c34-08dd93705327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4v/pzWpd8psrL0tBAjYqISrEuOurT8RUNbPQyXx93gcC46OR/A2Agr8ZStj2?=
 =?us-ascii?Q?vjoAoBIIOpFl3d1QYr/ROS98lfipNgLG07FCL9+6Tl18gz4arGOfiUCBYXzj?=
 =?us-ascii?Q?G7dK4hoU7peYxKJRqypJSBLzdYzzaivTHgRgrXHrzgKASa3WTAlHOYi7qs1/?=
 =?us-ascii?Q?fN3PGnXfd2rejZKyH7F0+ghWLJdDPLIldz9MDnQwpOLsjKMYeu2BhEVtZn0t?=
 =?us-ascii?Q?2he+TQQiZneeBsdEqWyJI2PukPos8aGFVMGqu61yITHkHrtE4pPp9naEKsca?=
 =?us-ascii?Q?snkU98UC3V6CTa4LUZCUXO/fCzrFhWhAksBVBmdA6M9tTibPMDpfIT7kL6Ji?=
 =?us-ascii?Q?cV4LdSeP9UCieCkFXb4lYXmvQmHa/oO64nhKa7vdJCGTO4xZisazIviXsos+?=
 =?us-ascii?Q?o79VcciorSPwI9JncKsvA0WQ9VLO8mWBIprI3nXwz32PLutY5oCPFNFDsT2O?=
 =?us-ascii?Q?zgIr+OOvDRBpNvooyzOJhmcdmT7glYBeQQwKW23c79Ah7YgEG9o+RUzzmCkV?=
 =?us-ascii?Q?zPQrvaOpDRg/z7YFpJMVKH/UY7bk1VRmQ2QARFnuSq5mqKOZh3Qrd//SgnTK?=
 =?us-ascii?Q?3Q11kiA3rOuuvgSjSSnz/Mik3Fmvza52Gdk4/PVf2Gde/ch5KYETlGl+N/BR?=
 =?us-ascii?Q?EZCE1wlbnms9mhmUIFYnaqkVakWPDIHPWr2LdMPqTSu38888cyFRnO0p53pR?=
 =?us-ascii?Q?hlRWHfSxWxWeoXo5h6Yc5Limsw1gS/d7/8ESgpJfUGqSvdSMGOLptxe4FEs2?=
 =?us-ascii?Q?pPFZrzT7dp+/mXqgrZqqavh7eWMaJaecAMngU3PdOuZLsQR/9MloQpTjr5xF?=
 =?us-ascii?Q?QqhtOBCV1iUBvjfz31EiW3tWZx9XukYFQpSVMpAfr2OoWfJQfkTAP7iA9wC0?=
 =?us-ascii?Q?E9/isjtiip3K8ILkSFdzOBZxf1nwwqnbZ4xKJVPk8pDiwK8GZ8ejvVIzqrvB?=
 =?us-ascii?Q?7qb7du+IVL2Pl5RbPEXNW6A6GukBhsoCcAxUXD8A2Mf05Xtj991AqXTSb/ma?=
 =?us-ascii?Q?DmpVnij23bjAdXlgJarLR+PubGFUpFZ6kA0mTrgKTb4lpEWghOj7f1zynPcI?=
 =?us-ascii?Q?ZoZVCGC/62M8FtB9d1fNSpWSOUnDuP643ql+vsRM+22SFc3ywk1FWy/lRU/7?=
 =?us-ascii?Q?AaINUUErzvi7vRcCpR/U432mlY8aCGk/FTjBDLbsKBJfJjbKofNllKHl4lj4?=
 =?us-ascii?Q?O/95gtBkEwVOqH9BYtYaYxnj/WIeeG59CHchvVkI4nBpEoy6zdx9gBMwSEeY?=
 =?us-ascii?Q?8LsooeOviXgfrR58OxUVaRTWMm17WU9U5EShSI5mBTAfQrE+fc59bc7evgZS?=
 =?us-ascii?Q?Jv1/Zp2l4wSEHK86sxEtU8PpAVrtSb7Ow75KVslc+F1mRPsGTG5n9pPv548d?=
 =?us-ascii?Q?SOrSAeC6jPTuTVB6+P7Eb3Y2GdA5yHLzjiRxpCFln5ndOmxsLYK9sDI1Y6IL?=
 =?us-ascii?Q?FWEu5f7qceIImftyMS0yt6WbVfC5i2qTtUu2+aLe2HyIaFXcFCjN2JIn9bVw?=
 =?us-ascii?Q?68EvOmOJtumheX4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kc8ewDK+p2x27Ux1UFZyJT15pDI92OXD94Y1BfjeT5GverteJO7eLPhf01e+?=
 =?us-ascii?Q?LEIdN9bsgRazklynkjCRJr2j7GSwGjQxDLrWhjnFUt1zTKdjfBTFo2xZx4SL?=
 =?us-ascii?Q?scO12VdY/vVf70N0Px/2RpddFkvZQajtk1LNLAWDfVdTo1aVIQ7kLDCQMnoQ?=
 =?us-ascii?Q?mlvOJh9igF6XVoLgO/j9BN92Rdf0r9rjTPgGPyTLUOvmNXsx7F6pczGazzjD?=
 =?us-ascii?Q?Qv9sQ7SYAhg/rR5hSPn+pk896w4xynCug2ZDyTAWdZz1YC0fxsdUNaq62dg9?=
 =?us-ascii?Q?fN1hTR08+loGS3Nn26YbbxGRUktnAlXrNWb3Q0euL55r63uljZidy+1gVwdU?=
 =?us-ascii?Q?T2tfzwutFIo0ylMEtL6VLzbdAckl2KRz3TEr9Unc3cKHIFRk/HTw7AK0dDOT?=
 =?us-ascii?Q?3rKzSx3Y4YdlTvfrW/RylInct0QtFe0gntqoa43X6/rOGD30Zt8c0do+jg1X?=
 =?us-ascii?Q?bUZ3nscZTTNsQcwobfYYXxvZTahW4Lk1XbAgDQL/nsW6Jumwz5m8I1+uE6o5?=
 =?us-ascii?Q?G3MRsKAKOyFaRTZC2r2CRZddq3HOe7ZZZAygw+0LbskrbOnG5Xf0Wc1XMeB0?=
 =?us-ascii?Q?NONUDmnhNOlUndyv1beMVc3H0pp0l07Xe348tnwppBpI3PQknwfNfzPjk6wU?=
 =?us-ascii?Q?SLAq0tEbI3zbskerCQsD4K2BkQUNDlCbT4rNpyqD9T8XNKfJKsBVkLTXi2ny?=
 =?us-ascii?Q?lK3YeMhwiidKn/zw+j7RmMFP4ad5BswT6DhFq+PHgaEaK2DOK+jMRwwoC3eB?=
 =?us-ascii?Q?kUkSyK8LUEQHdRDmBuZMGWwbSaBIQv3Gb6uCSSn+hfpoug2jWXOkHyVOQvBv?=
 =?us-ascii?Q?OZFTQ2+NC0NXi77ALScHAj5Mj0Ndtyb2U7PlEC/00fuOZvH2bpqk+XE8G0OV?=
 =?us-ascii?Q?vpJHyo82rJOucJR17t/RE8nLATq5UuXb+ztxlZnTA1Fv+eyaK6JCdoxGCPl8?=
 =?us-ascii?Q?Uib0WK6NeyKUB8ejpxoDwcG0igw9at+bUALhSm9+8D5trZMel/O0/4BYsyH0?=
 =?us-ascii?Q?WkHWrHL8j92I9ustjzNX7hkyhtHbsu7c+30ek5amqFfPh45dPz7hsCcg292w?=
 =?us-ascii?Q?rKbH+p1my6QCXfe0AJ50Dj6sTAl+Ehd3aIWJzgORQFYlwUnWpSd8O4HG/jUZ?=
 =?us-ascii?Q?uXpXWRSaA2eK6MZDxzpsWSa+x3cxjWgSomX+zPoN4X5+zpmbIKEZyi2sIf8N?=
 =?us-ascii?Q?SjMSfrlbKJkst1WR3YIDi93FOiHOnMaXkE6DryzaUkuQdXPRUnFpWMHGz6nf?=
 =?us-ascii?Q?VxYftfCani214SAlLJ1Zfk9P01cANynY3JQgY6IEvb0VLmpaQG50J3YMxO79?=
 =?us-ascii?Q?2A0FTgD6mXgqU0/B5LtoAhWHwFWQtTODVeTA5+SQdVrOhYOhH6LfbVN4eDuX?=
 =?us-ascii?Q?mRLXthQFRHmQDITwZ5XRwbk/eNLjzMutpDRzzKPoSRGehvCHH9NALTOdMsvr?=
 =?us-ascii?Q?NF8V6Us90RcW/fM9HZ5FIH3d9V1yo0O7saJ1ZPGacfUydBHxN3JnUL3E7c7j?=
 =?us-ascii?Q?bBGO1CtlvQKRAFJ68FaMUAMaDYM+wygzjfrL8jKTpXWllIPwLQ0qZbSCX37a?=
 =?us-ascii?Q?YoxTfZkyZKxRNukmaZSOj5yLUCdOndjwbLwOKVsW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7766697-9168-4bf0-6c34-08dd93705327
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:20.0091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkEu7WqtGmy9xz5YY6c3ObQYCRpkgpjxWT69tMx8wjTUv7kY1fKY5PyxqixoAeTlA0NgO3Chiq8yQh5yRLdJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

Add wm8962 sound card which connects to sai1.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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

