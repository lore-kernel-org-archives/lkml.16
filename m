Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5571E32CF;
	Fri,  6 Jun 2025 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236515; cv=fail; b=hgKtHXuEMKF0ekkBtdndA4HuA/Pt+9C1VZs40RJ2nCpGxSIpwVhP6eUrILMEDG0GahsGd/yIpFJ0vFjIqCqO+rETI9TSC5bo4g0OGpGhGDhP7L78gTfneq2q4BZPMOkYD3iW6GNKSa2DXB+MjmjBy4MAXquaWhxUqgZaRfwNfSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236515; c=relaxed/simple;
	bh=IsW6+YKYDOVfrseuHD0+RNae0fBfngfkQASvWnHOPnM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iZcj6YXc26pcVdOWrnzqR1DzqoySkC4ZvHKoO6fArIBMr9AthO1f2Ma5ymfvYKexE1wXDYi+GA8sjjCr5HGsNBA/+Z7B95ML7Er4lDkxIH9Bv1ScQlMPAh55YGd4AdL0y9NlUDWXEXVU+EJae1suvTIErMBWqFKNOkHbVwZwyJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aNTAQh0c; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aNTAQh0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2+cUnefpg51Dj7rKyHCpt4IeSGgdHfPOYq1DVJAdxJ7fFIWYLzvqNOpNpQ1BjgYsxr4frj09aK5UKylv/8encp/P+2/P5AdEbMVsnla9T+ntSxFk/z0gcUClsX/4LW2U9zfP4bOBdBbEPDv3q4w4wUmV5/cNkDyryYBKKF1ntg5YJZctilcKPqqw8ilW65eYnGgRUx1qeahVAFXUuJXXU1MZ46dgx7dIQFkBfVp4p8dQKw6F++5Ludf5bvdKXRNFd+777bMymnQa1Yp6XSTlpZZaQRo3eRk0AQu07jbH3QQAWxTU8t4bAIgEKkL+4EnoFYqBcN7TNxdKUeAKPpo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FZFXTaCTt0S8amAU5NTqFVRMFQaUiv4PfTU7FUrJ3U=;
 b=x+3sLzKItSESN1PJqi56pntMBsAK9orOU6sT5J7RtGmMyDnLIy3NVgB4Jj0WBM3daBs+9UGIHyiv8dZlvegGLoLsrYvGKbfCt17qb/6ZG4aDTo1sX4kSrxhNv4EfMkbDPvEZhjiKu6S8A5D+IpbVYatFFhmlk4fKgl0/9hN74CybicHmy7AB9jgEJgtYZfeUU3hdnoTK4CXH7xyYozp4MGboB16DyNTIoIITWY15r4WvMSGI6Zl2S+byOmcZ0Zthk6WGcBPNDIBy1p59bhDle+ItOuOrhmLIOA323A66CR3NfdCH1QTj8MbkO1fNLtn3kHKQkgH0Y5FEmaNPhswTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FZFXTaCTt0S8amAU5NTqFVRMFQaUiv4PfTU7FUrJ3U=;
 b=aNTAQh0c/ONilMItD2trhKfDjDOGx3Jx6N91AGDNF6Q9zL0CdCqepi/jovq5QhYnh9127sP+mLsh9/1stUDW6PO5QjrFljf+YCgsoPVofSTSrH9AlM/7l3YvNeSzgvspBmGgJvDcwOfEt/TQvniw63i8KEQsGWsBN6C/SBM8S3H3eD9h/GMXcJvx+hB0t3o1myNiF84MCC3JPDNgaCWbnCFr3UdKkTj6TIOHO+Va433tOc2UoZWM9rf77i54IOeP6ElsLkD9dBtSrjU9g4gjOjvv/AV4+xSRhXtSLL4/SxK5ZiVD6OTpIQUW0U7w0xjw9fN3UwTzfe8ZhpKMzWJfuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 19:01:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 19:01:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/4] arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
Date: Fri,  6 Jun 2025 15:00:41 -0400
Message-Id: <20250606190045.1438740-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 485cfe02-6188-4b44-dbec-08dda52c96e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bN0PGwQcByOcRet4j27W4MkAmlg5eB/opteckGOv/gdj7J+WXK2lrPQfmyeY?=
 =?us-ascii?Q?4qofIxcJCtkb0IrhQvpBlpsrH6a1Ghc+9GGCkKca0sM4iTI0wwP+5nKMnnjP?=
 =?us-ascii?Q?NhcuFyvMQRce4Ke6V+KhY0SjnYbdKuPL34Nk0YPaalarCyuvH5EAxtpbHpH2?=
 =?us-ascii?Q?RgkFCRmRCRhGJ1582pMeE61PjPXqxUL8wnpJCIGNb01LJejO+Dc1obY5KI5I?=
 =?us-ascii?Q?0KIEYpspx6d+A339OHppLa/oE6utXMXNu6kfyv4qP05RJsbp0SmrxyPWyTZ4?=
 =?us-ascii?Q?sLb9oGtQjubNuZJxX+XFY0qw1ji1A0iqbiUEW8RbCZGsxYXC6FFES6IV02KH?=
 =?us-ascii?Q?kXlkJUl6u64tXVdbH53CS2HKkSBQyunUmpzoOhc0l6mpJC5pY/QQ7m4DiPwE?=
 =?us-ascii?Q?RyY6K3y6SzmTK+ACBLJv55QQ7t8l+WO9YFXWy6rLvkQ8VbzmqvlgAlinZQcE?=
 =?us-ascii?Q?UxQGysGEF2v9n+/80Ex0TCE6MDg47+64fPqAAIE3Me4fYn9FZDYxD/BiCOYY?=
 =?us-ascii?Q?P4MzqvCsztj+3jQqhwZ1t693AMGfNdtcDNfCZhzwKvxPPo/070gegBIvPIxr?=
 =?us-ascii?Q?B99ZrbVO+hr8f2AldkTG77zBU56zRpieswyjTw1NTXJKOEoqykUgq2XMtD84?=
 =?us-ascii?Q?byLCnLmGS5wxbcQGcU/wwTNoBcrhl+CLv7kZSHvfLnpdr6WRk9YO4X71Fgam?=
 =?us-ascii?Q?i0IN0MP3i43woIsiSBHIM2pcOkk/7pBXi780w8QZ3OM7OHhVBSjQ/gM9eiJ0?=
 =?us-ascii?Q?fQ5Q82gL0fa2mkdkn3lR3CVUJvUBVolvGVBdxybV2h0YT3rxi5Jvgx6ufEC0?=
 =?us-ascii?Q?RaR54xg0KJ5Mq2SRHjA9NI2fenqkwMlU/GTwhrAIW8anoHgbz4I9f4UrgVl6?=
 =?us-ascii?Q?z9FXjZblMCXMZdLJONLe9dzg7ihTol/lRukMf7kx0uU3xi/fTpshGiOnWtgW?=
 =?us-ascii?Q?AU4wvojOeEEllTI/8wEJqfsqI/MKKVG/wALWJ4VioMBoZ8A5mYN4zcGRPpId?=
 =?us-ascii?Q?esROKeq/CS+d1C9dWziIUq+oJwa0vm3B4WaP9ncFNmZlSCKE5J9ZQzHeqUDy?=
 =?us-ascii?Q?bQwYso6/haKs/Mjh+5DI1VbftqFdUkb9KPOBv4yS1l6JKn8cB7/Ab77FPOf6?=
 =?us-ascii?Q?8aq97+hxDccotQqsP37OZraVNBU847nm4XDMqwOG+JRm6qJyyg+PMl0wY/8P?=
 =?us-ascii?Q?P7EWhi0u9vEDzEr6bzniHSZ5CBBswS4jfC61Wq1y6t55FnSE/gS4+MzttaYY?=
 =?us-ascii?Q?1PP1R9UqjpoDfpHohMPICHZh1kIZcQ3r1NG+DURlg9Oa9BTqOdFrMabkBwEh?=
 =?us-ascii?Q?CiLfZlI4+kq2ocr8DCh9D8fLD9/JhMoGCT01CZZ6NG87WGMNaRb54I4XGjhB?=
 =?us-ascii?Q?lwJ9Fnu6e7hsRjSjABvBIH6DtYaoPOPUlg8S/KeGcT1qOhVzKXpo/yJFd39l?=
 =?us-ascii?Q?31JtD6EevoiA1WZCj1CiQtDk8WXf9ISJwTZDlWQjBlaFgjMDBV9Lhz45DLfs?=
 =?us-ascii?Q?HnJ190eDmLP4E8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KOIHbmbyrmh+VXZSZP6PODovv42joyMm9lbS2c0gmoO7fRgZzmho5OeolZ3r?=
 =?us-ascii?Q?jrVgyDmgOvUJ6o/Ec87pRtDNYix93I4RdU1tIrEF2B9eBWCH8y0EOg6qfBBp?=
 =?us-ascii?Q?z9Tub7j3gO0lEde00eaYSBiLU8e5OA7dPJQGM/TIcwFDgKSbLOB2t5kU1x0C?=
 =?us-ascii?Q?/ky/d+x1aNULQr9hUsEYTc0MY+doA/bja/Ly1SsSWya1rgOj2aPwIel4klvV?=
 =?us-ascii?Q?iCB+M9x1a6oW78di/+uW3j1wJpwOsGJHL3wFZV6Rk3iZWoO+lWmHkEc9VQn5?=
 =?us-ascii?Q?6fppBGOa2o5og5OB/hxCcp5O5pZ+ptRA1W2Ci0Umh1wItktV3uZ2g+R1KEjx?=
 =?us-ascii?Q?HiZ7xQcRjwNFzjnzC4MdIP+KgGiIhShJ5b3V7FuVIccxO0VB1Zo4JUNjXdwh?=
 =?us-ascii?Q?m25IFPdofj+XZHlspMY0sU6wERDD/fJpFS4dB1ykB0dnzftxWYpFO5qGbSpE?=
 =?us-ascii?Q?V4Qp9aSrQ2MDMkgpVLVUhYfCm79qvBTurj3B5+YCGzqYOWgN774UxiNeFIpt?=
 =?us-ascii?Q?bm5aMHg9TgPQ6QP5674pumhGNdGDDdDTNOJiOXwtSwP4cXPpkPAmnj5YNnKS?=
 =?us-ascii?Q?1E+CngYm8N7yV7x8ubDF+En0/Bq8sZW+79Cma3e5b1DogKO9guz94GCcxAXB?=
 =?us-ascii?Q?Co3dTKbtVsj8tvwvAXWMZ/1CamZvW3vH9IFMJvUUAoFJWWwSBPUVHnQ2OOQC?=
 =?us-ascii?Q?1x7Q/Xii1W3p6vxVuVJyAOsgM+d0tDAot77IADBQ82mRRpSr8fnplT7qeE/6?=
 =?us-ascii?Q?D0ZP1X69m0sKtH6evVBdBkkFSikj1sHf/V8qAvO8bpHUPwTFigRgQefGDxqw?=
 =?us-ascii?Q?xYdaWnTamGQYFtzQXCVLmXnIwLoY5XxmZ4umcn248qdjqoYxOa2cX2J/t//+?=
 =?us-ascii?Q?MaesSLPuvh25Wtdc/WCorHV/a93z12eR+yu6Bms9TrYg/FJdkXOwe5AIW0wP?=
 =?us-ascii?Q?bxQnLzRHqNwpiffsPzdIyHNeEZeqOrg5djNcJqAjPkQ6zohJgZ7viY8Wckba?=
 =?us-ascii?Q?4CRH87I/XHlqEgPmH71Xni32XsKoDGaWdwnnH1DYsgwHYsujddyW7DdmqQ6O?=
 =?us-ascii?Q?wecSwhxHDZRrcKfHIp+SYSB6qTyNHxHNLhKLRkNPfMHvExQMH2IWTCpVQ+uH?=
 =?us-ascii?Q?alILMkCKMsZC8+tSALKM3PPf4ji++98wOpuZh7UC1TfSO6iDj7QPNaTazeQh?=
 =?us-ascii?Q?dcrvd5nU/SECxmWlEH5mhTpWUOV/0eMNwl0oC0g9c/vexugKF0YqjJautTu3?=
 =?us-ascii?Q?mloDr/WdNWg8rZT8jzv3VZ6/FqwDMilPPmEQ6re0ynX5R4P9BP5Xp6Myrh9Y?=
 =?us-ascii?Q?yTsAdSDhtHEGHUVjS+FoDsL7U5wm0DM4w9px5sb2Gm4hRi/2sqyfO6AgKHXW?=
 =?us-ascii?Q?lLYJynLRq2mPXA0mTNxX9rL1ieyMDZI3dEspWIh3VIZsdyodEymZMCeV2FmF?=
 =?us-ascii?Q?326Yz7QOV4YsojjnV/iEtIeOcwP9lGtS94/vcU7bxuiRfFJu/dlQwZUpPKkM?=
 =?us-ascii?Q?+y03WH4aOl+DRAxHQDx9HeTnaI3KYaUQ+BY0hF3OL3uDLwyzSCg8f6IuFpuA?=
 =?us-ascii?Q?fywb1j3QiN9Qmp+4hIg+XQRKu6YYim7ZeipMZrZJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485cfe02-6188-4b44-dbec-08dda52c96e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:01:48.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51mrtU9T4iR+WUYheqVRYcm33y8VZqP+hbEHTqSrdr+49VpBJkptPH+xyYY3TwWMHou6o44gyG4Szobw1aAktA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563

Add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 tpm3 netc_timer and related phys
regulators pinmux and related child nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove spidev0: spi@0
- remove extra empty line
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6886ea7666550..5d85849e867fc 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -77,6 +77,29 @@ linux_cma: linux,cma {
 		};
 	};
 
+	flexcan1_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		enable-gpios = <&i2c6_pcal6416 6 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&i2c6_pcal6416 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan2_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		enable-gpios = <&i2c6_pcal6416 4 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&i2c6_pcal6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_vref_1v8: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -204,6 +227,11 @@ sound-wm8962 {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
 &enetc_port0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enetc0>;
@@ -212,6 +240,20 @@ &enetc_port0 {
 	status = "okay";
 };
 
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_phy>;
+	status = "disabled";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan2_phy>;
+	status = "okay";
+};
+
 &flexspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
@@ -231,6 +273,37 @@ flash@0 {
 	};
 };
 
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-reserved-ranges = <5 1>;
+		#pwm-cells = <3>;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	i2c3_gpio_expander_20: gpio@20 {
+		compatible = "nxp,pcal6408";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x20>;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
 &lpi2c4 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -378,6 +451,24 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "disabled";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&lpspi7 {
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
@@ -418,6 +509,10 @@ ethphy0: ethernet-phy@1 {
 	};
 };
 
+&netc_timer {
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -484,6 +579,12 @@ &sai3 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm3>;
+	status = "okay";
+};
+
 &usb2 {
 	dr_mode = "host";
 	disable-over-current;
@@ -588,6 +689,20 @@ IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
 		>;
 	};
 
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX			0x39e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO25__CAN2_TX				0x39e
+			IMX95_PAD_GPIO_IO27__CAN2_RX				0x39e
+		>;
+	};
+
 	pinctrl_flexspi1: flexspi1grp {
 		fsl,pins = <
 			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B			0x3fe
@@ -628,6 +743,27 @@ IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16			0x31e
 		>;
 	};
 
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL		0x40000b9e
+			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__LPI2C3_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO01__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
 	pinctrl_lpi2c4: lpi2c4grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO30__LPI2C4_SDA			0x40000b9e
@@ -656,6 +792,15 @@ IMX95_PAD_GPIO_IO09__LPI2C7_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4		0x3fe
+			IMX95_PAD_GPIO_IO05__LPSPI7_SIN			0x3fe
+			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT		0x3fe
+			IMX95_PAD_GPIO_IO07__LPSPI7_SCK			0x3fe
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e
@@ -716,6 +861,12 @@ IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0			0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO12__TPM3_CH2			0x51e
+		>;
+	};
+
 	pinctrl_tpm6: tpm6grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO19__TPM6_CH2			0x51e
@@ -729,6 +880,15 @@ IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX      0x31e
 		>;
 	};
 
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
+			IMX95_PAD_DAP_TDI__LPUART5_RX			0x31e
+			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
+			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
-- 
2.34.1

