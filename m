Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A41FBEBE;
	Fri,  6 Jun 2025 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236524; cv=fail; b=X3gT4QuPKTzRt04G41GnMawY9+L8M/TOs75jxssGZEdTcvu/HSxGiUhfwciXhwaYjCbmGyCWVDRb+DSkGdtyIvlaWgxjjFtwAApUhl/8h/3+mxw7MiHg/mUsQNrDwDdwYjYfwROCMQQr+g5JeggV7PVsIwL1veWBPbH8E58vdPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236524; c=relaxed/simple;
	bh=tA+ODSiNg4t12QQ1xIj8Y9YV7euFXzEKfZqQqTG+nxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NV6W9A4D2U6TWYdBFJmE/nhfsX8YOusRKgY2cKJNLLIspbqHvMMl/baBTEYLljSU6vY+0kiuBfbjEANNDtjx9ZAczvPfVFXJXqVE4h2iAi3eZs0YP8oi5cF2VWkUrQb5WK4B1E05OBiDQ3wtlj/I/rOCbA14G3Gep8jNLurjyWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HJYsrTMj; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HJYsrTMj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnLXImFvaRU13UgJrpNIrCdlmvn2Q/D5aooPXhW7yZu0kLRCdUe2bnHS0r+XEGVMzf5ui4cxYeWuI9/CvrUBD8Ud3KFFyvg7G9vwbPOzAnigbvSsHdDSet10z8aVK3lzThrJ69kmoWzkMupXELIwNPntcNx1DhTcNda/U9qG57W2kbj0Stv07AiaxVHZ3WZhi42xQFkREP1vhs2p7NJDk2jibZGuyWOhmBy7QAw+Mg9udlgP0Ug/T9CLt1CajxeqloYqLhu7plpNmcS1XNHXLBZrTqbxu1ww9JmZeLN0cR7xycxJJRI7GTa8LMeCRtn2RLKHy1dp0dklTZwNNQrK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1tLZZIiKLQv0qjAh5AVUEgiz1sOq215XU2X7u3Qm7o=;
 b=eqi4B5GmZDnFfdz9vfa+CNaOH2ChcItwb/GkzrkSZyL/6OOz6fPFGY1VGv2VXztg2mydGBQhv1f17aoZ2agvlPFGL9E4k6QctbswX7bDj1GE2nUISPSE1RJFXycxngCk8LUsVJWo+8m+UDdyeqJhhsoPABTo6nE17N+3PjZrbs2hReodKGGX35a9d2zE53RnOZZTfvNvpT7k2Xp7ZihklNAA649dyJuxWB2hKo0RI7sK3sa1J5sw75p0XRpcRJNVr2D2wN86a8UX59YGH4yEUi69ehaw2ihEFIfi9LujzEZydiZr5XIjbTRfbX+UG28KWtol2nO82gLM9wsAB+RLkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1tLZZIiKLQv0qjAh5AVUEgiz1sOq215XU2X7u3Qm7o=;
 b=HJYsrTMjPmqGZ3vyyAggnqdJiEgYB2r6Uium0D7WDYHnMe98q9JiS/dhId13+KBAUOdmAPR6+/pY7dq1Zcu8P6BaQKrI24uSgNnKTlhHKZq7Uh+BemI5/SVgFylmbfxPHb7ueJHNBJPyeoVl3YKa+LqEmDQZpiXihqfHx6HNX73l3Br3fJNxYUunhbXvApzK5leCtxuWtR3B+KU8n30IXNnVZVN5NgwyoeutXGbq6Lkii4E1fv4IabQaJZWjtTd+PlbLgyyV2kuhJ9gz5CHePR50aam6iKch7tY+0b7x/9JpMluv9Filbq8NEWCB8g5MKwkG3WyHvMEMvpxdLot1tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11087.eurprd04.prod.outlook.com (2603:10a6:10:5c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 19:01:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 19:01:59 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: imx95-19x19-evk: add GPIO reset for ethphy0
Date: Fri,  6 Jun 2025 15:00:44 -0400
Message-Id: <20250606190045.1438740-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11087:EE_
X-MS-Office365-Filtering-Correlation-Id: c9337426-978a-4742-431d-08dda52c9d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ubVzq+rRan7gNRm7f2KAT95cpTN2rzgXKo+RdQrmjDj9oVWM5ZcCyIGtMtUD?=
 =?us-ascii?Q?8ThSil9cEC2I7qxpywaGzJe+zAffP6miFPJIUkcOPPBQ9w35nTjPdWJv/MzM?=
 =?us-ascii?Q?NIRd3LzMsyxmSv7xfioNKx0ROopbNymQIgrFyupkYnUJ9WMGeNtzVTwTw+mg?=
 =?us-ascii?Q?7VrNshvaWQsDSoDYwNATG1HIo83cgh4sXVMteibo1YO9mIUwsZACc8DmPDH4?=
 =?us-ascii?Q?tARQRv3yJ00KGCxf6T8AVXqiDkW77YkowUl0l5CPhil350kkO0EqHjCTYpCJ?=
 =?us-ascii?Q?7m8V7jGZuejV9z1wSzpnGzJZSAe9lAFC9PnvBuR0lc2f1/7MKYJCI6u9vUZ8?=
 =?us-ascii?Q?Lz3shbLTHufYPlJcdn9qnP1h25ujcZoiVUE2+HvNDfysSTI0u+gCYCSmk1JW?=
 =?us-ascii?Q?EbHIUwUnFW9iId/+RM0RluE+SRQm/byGyzjFGKljtSW37XaKDF97zOFCQrkz?=
 =?us-ascii?Q?vGPFDFzUSEzy4ec3psD1NgZTD5grgYNkE+xCE3zD1J6REVofz9uREmfZiZAe?=
 =?us-ascii?Q?SXsAafKzUsp2l68JVgyKpJFPVW7Y5/fZoXYE2I2cfeyC+X5kzFVmnsEnFh+7?=
 =?us-ascii?Q?nbcoFxzaTbDw5X9HkubvPstK46whMAN260vyf5mGLbjoFd2Bv4mANgEaAApv?=
 =?us-ascii?Q?G/jQ49D0BGDaQRpcGHZr2zV1JDw66983z/lYoNwwGT16qiPHDRYR38qZscTt?=
 =?us-ascii?Q?7xEmCuTTTg8uD+qhQ+EJaFiB69BZ/yrCWpTFWA84LyUCav1Zu2FZA8vD+THW?=
 =?us-ascii?Q?a2EYOEEX0dZaJUprdY2a6TKSHaGmesi+1cdsXq+NWMuSM5SE2MGzbmiYwe45?=
 =?us-ascii?Q?8I1PcEtYKWcZOoUGh0N165dxN5B3zpA0AV3/Q81k3WabXARN61rE9oxqyFWq?=
 =?us-ascii?Q?ZWrMFlJBF2kge0kbKdbI0YE0PLO2+zsxaAVZflQDjGNJBENUn4kg5a5rcysO?=
 =?us-ascii?Q?qqRt1hsSvbXX4qtFUiT4saA5bUjVCP4XDr7ghKVcV9zVj4H2fttNtP4a4mTv?=
 =?us-ascii?Q?V/wua/nNIbXQ+S0h9ZXk0wSg9MN78XLf0mLZ5g60rSdacwd/iHyw7Xp3Ek/s?=
 =?us-ascii?Q?zNY8iegbaUXv7mFyj0lZHgQ2uzeWb6tgWcRnx7rT5zOVjw1sqgsT/+CUJcqL?=
 =?us-ascii?Q?GNB2AUCLxcNuQjCz3obyyCBbV0eRpA5ORoyzxjFm2YAom9asUdMONe23qabE?=
 =?us-ascii?Q?QW3PIpKbINM2wir2293Au3XiTms7FEZxxOQvUxhAJC5AicRKcn0JPFcCxVer?=
 =?us-ascii?Q?+hv0R2ocXKaIUJldKmeI/JZJc+U8MYBebCUo0Bq8VLdDFksDD8sPeuwc5FWG?=
 =?us-ascii?Q?92K6yHS7tS1P11yD89Cs+MOgw6lC9j0lMzwEwK1RLrf5PDmlII5K+LvOyebQ?=
 =?us-ascii?Q?M0mqpn0/+iu6pRLYun6Vuvjmdv+id3IjIkhhQl3x7Og6PTlm3T9DYkJ1hpjh?=
 =?us-ascii?Q?WAmsTtrh31ob/pdoOnpjbqC0G97xUF6Rbx6eJ13qDm+XfBEaIRnS6oX/0L8i?=
 =?us-ascii?Q?Sol1xSNnILf1qUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9fem/prTrlRykVVRgSH3OZ+3dglviSMarqZjV4pcowdrDVBeXNzoi2C7X/jQ?=
 =?us-ascii?Q?3FGuXmkHys7asIFpCVyQnOPXKxrUaLdyT/5QiX6klVUREczxJtBV99AP38Cc?=
 =?us-ascii?Q?EGekH5hNxF60+4V/nxy/CB5qqNEQravV3TGo2ifqiX7KSvo2qpHzr81iit4z?=
 =?us-ascii?Q?iKeTfelV5vIXGywyft3iR+s8qh70sXb5BM53LvfEenj3/hB6u2VDacbjOilk?=
 =?us-ascii?Q?vBpN9mSf06cQl+OMeXk09OCi3kiMs2yT262zI4V/UHEfYXxgLw59y1NZ+Vcj?=
 =?us-ascii?Q?peIu5wFHK+GVQxyziVyVuYnFwwNOEb9Qg+p0x3/U/XzgRlWp4JT0Do0BRtD3?=
 =?us-ascii?Q?zowhyYdv+O1ryIn8iLp80uSNO7H9HbfFJ85JyOa7SE+n1hXIXdqX7v0SMXxp?=
 =?us-ascii?Q?6aO2H2OeC/F0/mR/219VhSkV+vzJR6GfSzFxLmGkLpRb/CgCR4lhgq93lLCf?=
 =?us-ascii?Q?XXcsKRTuFfSeomE78YkyAiJNvogR3fi7ub0P4lCb/1ejyd86XSOpWgjqnlSJ?=
 =?us-ascii?Q?ZWTikkQEDpC2ZpD8ixR+XZ7M6Igsl/69v4AFtFoOIeNmLOgxBZBbmec4z+NX?=
 =?us-ascii?Q?1kjmMAtiu3fQwk5YIxGIPddXVrl2szhuFeal75PM+JBAtfdawfONldD2emMP?=
 =?us-ascii?Q?eqrlTkKNuMFLwLAO1YOaAD1cgCW7JK742ZsEdQSoxOS3SkojlG8Ndz1iTq4D?=
 =?us-ascii?Q?yp/cuC8atB195xmRz23uupXHNwbV41fWUxchr+QS3hTYoyWLPXDL+EuKnTeb?=
 =?us-ascii?Q?ez1ycC36D1Ab8aQUhMfLPkN3ItHX7eh0A35ctcbP7K5EM5k0NQPhtg7aIGYZ?=
 =?us-ascii?Q?j0QYuqJVUUM5OB+GaTQzisiTHZA2zgZYvSLpfHNOTvluR5Pfof1kg9CG5tYs?=
 =?us-ascii?Q?HrncxU+HJf9J7MqXR9Cwy+SL/4hjrzL+whc/NhB54gOP34KUWDlRmZ0SIPWV?=
 =?us-ascii?Q?9F4UsVX2ZBIY64uA3x6W9qtecYczClCqPYCGqlTjy7FFHKs+QUtSW4pQ10fG?=
 =?us-ascii?Q?xW4eArH+aX1YgLQrwa7XKSKeKsNy3N3NhHHyPMJW40Xu4CDtckiuqbwKKLkH?=
 =?us-ascii?Q?5ZMq67Of7yL+LKxZOovtkjOyZDBIwNY/t2/cks382XLP80bohdtkuHNoDTS5?=
 =?us-ascii?Q?EH7UJ87JMw73sh1V/you1HB10paujNPdql4AHwVsEi8RrSN9VmJH5wTgKsqr?=
 =?us-ascii?Q?CkxElRwycUKnQI/Ejjt0PtS4ws7gG+uPsiYYV2qWycYPpJivYVI8WB5+bE0g?=
 =?us-ascii?Q?ommZd5Cj5Y8oCF5umFplMYTfHKPD0OJsBQtTSAwHSyTMQMzYbfd5tn1W227D?=
 =?us-ascii?Q?56KPDPiVCgIyx5BTwIaLRJ4QZYOX9dWVLMN9XF+yqKrBX6fwdlJsAh3gxKVS?=
 =?us-ascii?Q?63wK1PxC9fqhbGwv2AiyRe3kMtK0FIf61sJVEZsQTV3clLr0iKTUmnbhpRvJ?=
 =?us-ascii?Q?ma6fajmSTWFcV/9oocS1UrwwAtkDb+Qu8LNUGnEsbD/+dbp78+j299UphpAP?=
 =?us-ascii?Q?zT/bsrti9N9027/VJ94i5JLa+efdedrWdJMeCwcF+KGS/nNbqHPyUdwnPkWD?=
 =?us-ascii?Q?kmJVm/B7Kn0rNjIU7Abjf/sY/xnQhLg9SmmFiCOx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9337426-978a-4742-431d-08dda52c9d11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 19:01:59.2350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMaHGPyg95XODH8N62CL/GIYviDuzDjTAMtAYNm0SZLMNnmAudG6/Q/m7EnN0sXsjeUedajLjw/U/iI/7j/pSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11087

From: Wei Fang <wei.fang@nxp.com>

Add GPIO reset for ethphy0.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- none
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index b6822b56374c4..48ca09464e832 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -505,6 +505,9 @@ &netc_emdio {
 
 	ethphy0: ethernet-phy@1 {
 		reg = <1>;
+		reset-gpios = <&i2c5_pcal6408 2 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
 		realtek,clkout-disable;
 	};
 };
-- 
2.34.1

