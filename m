Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A51DE3DB;
	Tue, 17 Jun 2025 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145355; cv=fail; b=h+Vh98BiGSv2AeIrhkiFGvMpNn3fX5G4FlGHbKgb4FcbJb7MpBtJ2T0Frh2XoOJjmdxsaPJwhAN3zf6Cubcc9HA10syl6R+XQgV6e6fx2PudW6T8tb+p5o/LKg595A+Q4obPXuyROr6o1eZtkMb+XpCb3Se+KOEaL4IoZsZQ5bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145355; c=relaxed/simple;
	bh=Ez8G6uDgZkXZWPSA/GNAo+d6pqeqSPdGFxouom6qRhg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gstCetjn7pN0SWHfhhfO5MFfPhf6YNlprMeHJj1MGWR+8kL6McQ5vjV6qEUCKfzLw37FO0bpdzf9/mlc2rYwzpE4e9vPEhBXeyM8mrCX9j5GQ2qPQGvFe6ZXPwyl0dnuW++7+z7TKUVxTO3WdVBnKjJ7kW9Mx6G+7nKZuz+5AZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xe32Mwvy; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xe32Mwvy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nok+cBfn5i0iE9l1yJOCPpoI6vbgcy7JNf6q3qkKS5g3tfnFaEeRx9tGpgx6wRdBWf4e7e6sH5ZvwxAPk1/BPGWKOJ30v8+7D9MZIyW4Ojw7WAMTB1hRr1qVGxBgygACuFbbCiVR5eA90/hN2SUdDLnqwrfw1lr01VL0BzxjsGxgpCEWqqWjDcn2VqQYLPKH6OCA0/A4cxy3MoJ0GhjT5F7HCMfQ2TgPAv3TQHPkA/lp7LtZKxhlKXbaw8arnF8yWR8k0hIOK3Ii2G2Xa7KHLXvIMC+9DCFTUig2NJwZ6oMOZgQhxML8h0CBafmnojO/H9U69Ivz8uMgMFjjtaQ9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EBcU/xi0Xuc0SeQNFVfHb5SLuKgUpVwyKrJ9z9CziI=;
 b=O+fOKjPc7ugMMrLDvCT/4FB4BtyXJPnDcRoE+r4s7xeEHrjrW4fJvSlubwx3bIu3BXAwWZprPU9SJ8FjHjdTf+MQeLeaHc6CfNdcNBekYmyzxY4uIyF1y/xtfTIHw8GLIpJFFRoR1X4iKOwphqjnkoeVpV+arVnUpKzZFPQf9nCwwzBJ51F3pqNlPcG+aNaZ08URN5usR4kmy+dB8Ub5i58z/q8XRh8eSINJ3Nwt4iycAInKfghlsW7XvAQyi/W7XZQ/L9p+tx4xmzfI1P/XIlyI6jV8ZD2yqnxVF3W77PjFhM/LljmcdCMvGdXg0uuNnmLqf7FHScWby8Tl64h3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EBcU/xi0Xuc0SeQNFVfHb5SLuKgUpVwyKrJ9z9CziI=;
 b=Xe32MwvytJdbRbIH1yZn1weVE7+i39kzqRO/cXkgUwR8ZSa8kOVhM6CB0pTVvXA0myVSoFs5nOT8862sfNgn+3YBG+LudbZrnc4S19KsFDITTuzVioYmj6dNWZA0a9Cl953I/48P32l5tgYWxJdR7la9YMy/GS+ilhu/mAofIRb8uKuST572rouFQj17BC4Q+SY1v6W0AlX2V/UQn5oH4p2rpDlFYXgbEJrEUlt1E1zfGiYo6CPE82MPinAtCU5o5pHqYovSC6Xxcfk/eebW4s+GqOVcrGwZoYX7skQTbTgp8N2KlH6v+lQR0PZo06Sd+3QV3D0irpwBe8sPsHJWYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI2PR04MB11241.eurprd04.prod.outlook.com (2603:10a6:800:29a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 17 Jun
 2025 07:29:09 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:29:09 +0000
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
	shengjiu.wang@gmail.com
Subject: [PATCH] arm64: dts: imx8mp-evk: Use fsl-asoc-card to replace simple card
Date: Tue, 17 Jun 2025 15:26:46 +0800
Message-Id: <20250617072646.3226865-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI2PR04MB11241:EE_
X-MS-Office365-Filtering-Correlation-Id: b2180719-6c80-4d9d-6410-08ddad70a635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NUZpcAw9e30ePChCmbEWSvTPVHqWhm/U0JOlwLiBexq3w+s5LbCnar91oNBZ?=
 =?us-ascii?Q?Jm3UuzyPEmhxahkURLx2iMJtqEIAiHPtp/GK4TZkGiuB+nFRU9k/BrZy53jl?=
 =?us-ascii?Q?uZGNQPvHjelYOMfJZUDv+B7r/kR5P3jOml92A1WCs5GOfEJI2tlrH7o84h70?=
 =?us-ascii?Q?bCvKyvuyoQ15HibkPr2iV/I0hE7/FFRH7jKgxrXYMHF28HlI/wkC2aNn+NBG?=
 =?us-ascii?Q?7yl/6rinZ7RQU9iGw+hykFkckg+n034xVXU1DRP4/gQQNvJyeA/Hx59AcYwV?=
 =?us-ascii?Q?k+t9rHLOdEywrVQB89yoHKYshDVOgFKMk7TUYhU1p4GXkP4rCZh8fN3t9NJU?=
 =?us-ascii?Q?UTNAe1/bsOBIcAryERWUWofRyOk+35f28lKtHGgvfEI9d181hkyk53o+dn42?=
 =?us-ascii?Q?i3aQyzQ0RglUlXXM8VViiAd87yHAGTP4j9a17XjhGbdzHXKaiC6i9iUvdVH0?=
 =?us-ascii?Q?jmtQu4c+HjlBSzPaOCebFksEI23Q5kSuTjOeoKfi58wW+TaAozUhv/m9gSg3?=
 =?us-ascii?Q?50/DyAtPo4TX9Z3LV8Oo0z88OctEW91sFbt86F9w0v+cnv1w8zkokQ8Rg7NO?=
 =?us-ascii?Q?9Q0pzSRqF2gepl2I6MFKU2kYfi2vxCCiuNCrTMS9ND2/RE0kV3H8b1oMYW9l?=
 =?us-ascii?Q?h2sSj6g0QqO3sKfTe0Y0Yy+74WiFeDgERZoD5/ZDfCMHRmJMQmcnAn3UD/HT?=
 =?us-ascii?Q?ck8Xywv8AeOZEglAl85K4WWpClNg1S9e9JN3awuoc1L/3y0OWpXazNWYpJR+?=
 =?us-ascii?Q?Y4RdVbPi1Nd0LpbHyrGEZg3Zb4JN5yhKvY527Xf8Ut2eWAm2N4/LL0E8tpnW?=
 =?us-ascii?Q?gepmh9+Kze99Ldcgl0TKFDCxwAhXRMVX2HCtUupys2B7sHUI3fKBhZx/Crgl?=
 =?us-ascii?Q?kLth286rv8OKgQ6x6Ue0uGT+E1aKqOPymmk4WHxKX4Tq4WnMOY6o2SloQedE?=
 =?us-ascii?Q?NOSiyp33f70CXSbXuLJuCPRhzxf8fc1oa1ZjCB3e0dOJvNM/ZYTXZpO1zJSS?=
 =?us-ascii?Q?D5eReRVg9uudOsbok9c+8ribP46+03OyRZae6FZ+HP67jfnuuF/Nlbmklb/W?=
 =?us-ascii?Q?dOTog2NJzvNvJtYAFIjUk0fDLBEykL7fcX745Z+WkYsI3gkl8AHmHd3xMOFY?=
 =?us-ascii?Q?yoTG7+uVqCVTz3ffBBLAUH3I7q4pkOusfFlD6B9ioPfo3d5CLU9JdT28+LvA?=
 =?us-ascii?Q?58T4JlNBVuCVYJfOCiCadsLAduCfb4andjSc+bQcmSvJzL/DktdXHEVPMnkw?=
 =?us-ascii?Q?fUux8ZsSMWWRoiUz4OkSdwDWWBWf9EqoCCTQ2N5mMqRYH0u09BLNcsl4n2Gx?=
 =?us-ascii?Q?YqFNdWHXmHLw31Uaw30fXtns7ERJa1Z+BOiok0V+K6TPxShbv76EFgL6hZ7F?=
 =?us-ascii?Q?7qOGXRMvjPTIAKvtQhqPgYPzOTjsPpazQ6zOt+dzlMP46zLqteQXKRDRRzqk?=
 =?us-ascii?Q?M7N9gTJGdlJySjXkKe4pR7Ecc/ffUHEmwtdvJs1cfySdhyIHEhVDHBOg9ipN?=
 =?us-ascii?Q?BmSx5/zJpBhv84Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Ehp2OtSCBFIKePYzeAooN1ENOFOP4aJjfi3KRll6T4GyRJWXZ0+uwBLd6S/?=
 =?us-ascii?Q?vo7SgjlWmKbi6pxH/pKtsZBc03ZjbjJKPgYLnaB0qts+nuNu3N/XqVK8gi/o?=
 =?us-ascii?Q?Gkr24KdmlQKHtcOmdO5fok2qNK4m5/3MNPho4lJ33vXpUydK7l1d7Dx2TYbU?=
 =?us-ascii?Q?kidK/0YCwT+0OWLdY5x7dROIQvzj8b5dtYkO+zUV/SnAj/d6seAQNmM9IW/4?=
 =?us-ascii?Q?f40OQ/A36emsE+V/6TdLZvOdx4Wm5Xxg2fmLGqed+18dBk8EwN0jfnsd6Awc?=
 =?us-ascii?Q?1KH8gFUP62q7E8LVjyvB7ThTzmHV8txgJqMA2fyJUEJmDjy6H2k1DJ0ACexd?=
 =?us-ascii?Q?n7ZGqFEaeLZs51pG1ull8b5NOrovoy1PNANsaPG6R6U7Wz71G9CdxEzIU+JS?=
 =?us-ascii?Q?gN4ymgKBPSk6JIbd0cSsKjDWDKw4nJgwb/1S2t+J2G069oPIMgrmBK703RNP?=
 =?us-ascii?Q?61nNljiY2Yk+d7DLjLeK1OVvw5/YRupGOhhJDK/v3+92iINmPHxxhH/pD0wc?=
 =?us-ascii?Q?GMU49sTWTiet2qIba1trVXjTFita1yS6vZiPr0RTyzcywP/QyDHhpMViFb2y?=
 =?us-ascii?Q?5lZEPC6e7hqAuBh5J6azw03KtotF2tZe+6NMEUyLEvslA+u3vd5yDHqrkAlS?=
 =?us-ascii?Q?e+DEdDBD88QnXZkP3RF2r7rQ/mk1C36UWsquBcG3I86IUWrRZqvoMfkyTMaO?=
 =?us-ascii?Q?yhIjZl/cZT3PljaR/ArlcV0EpvfMeCTagVvRdI8mlINifjT169UsbdvQxuQn?=
 =?us-ascii?Q?s9u9Hb5xVdsIkAuPk8OJCWuAp9dug1XIHBpDU1KetsX6BR/+rPYoWakM+A1V?=
 =?us-ascii?Q?ID9tteeebwppiPU6DmIeH7QNc8M2RCq57Fkzbr0I7u9cCjdNAK6V+5CAQx1a?=
 =?us-ascii?Q?XXGXMKSDSX/zl5Bq5U+V180EUociHx3NeUhX5Z16yo934CAu+SQW+ywrWLz1?=
 =?us-ascii?Q?bGCsjhNEqUMFJF4uAi45oa9d1SAYuaruTkrdzwbTILidbOOQA2yXNMjec8Pt?=
 =?us-ascii?Q?XxKY8yYnqCqBy1IhcMqR16zhAcm/M0hue8eZd6OK9pHtz6fMXZ9SgFG8Lp23?=
 =?us-ascii?Q?TnoLyC+S7BGDcgSfmmyZDRDDZpha+bqzaMH+d2C6Z5G2cmrHGvMS/x8S9TqK?=
 =?us-ascii?Q?CsQXkdKGLhTxLY+puy4WXQ/5xb5tajuRz41z/mIVQ9YGeUwsgbrSB0da39Ju?=
 =?us-ascii?Q?a9L4TWrOljT9KNVga3NUEYrqsKbW5MpzG8iu4YQCkxSFNDPUcbjs8i+AQm+e?=
 =?us-ascii?Q?fs9U0QR6myEmmv1KNZcLU1MrsbpeFek95tcuYqf70zNlPwGr0s5xCv8y41gD?=
 =?us-ascii?Q?RJqYG7O41xJyuKDeobbziFtfSxEgD0LK/80FcsDuPDns7Q8n9Q2AiUqa+jUy?=
 =?us-ascii?Q?jA9pOBz/vZdZImX7M0ai2hqM8zBx2rrikQbBl8z0PDsry8CL9zkGj24f8FQy?=
 =?us-ascii?Q?jU3M+KGVI9lwXetbz/7gWbKqpU2chrxzYkn/5A01Qew5syIjLH05ZRKiygCi?=
 =?us-ascii?Q?7rdkhFCL7Y/ZgVU2OBwFBcTy10mDfehVxNOv8lFJbHlTJrvvZ7e0apThSM+G?=
 =?us-ascii?Q?FA/9JT9OWJ4tAN3RAoZYVwoTZBIRDzL2LFm7HP3o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2180719-6c80-4d9d-6410-08ddad70a635
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:29:09.5615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gALSt2t21doO2Ga8F9dphLU0RPxE/EuccN9oW7ZzfI+QjH1pCFCV2hifdMiESRXjj3pyqi0H1sW2svhbW8M1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11241

In order to support Asynchronous Sample Rate Converter (ASRC), switch to
fsl-asoc-card driver for the wm8960 sound card.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 62 ++++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 1ba3018c621e..c0cc5611048e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -168,37 +168,6 @@ audio_codec_bt_sco: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 	};
 
-	sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "wm8960-audio";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&cpudai>;
-		simple-audio-card,bitclock-master = <&cpudai>;
-		simple-audio-card,widgets =
-			"Headphone", "Headphone Jack",
-			"Speaker", "External Speaker",
-			"Microphone", "Mic Jack";
-		simple-audio-card,routing =
-			"Headphone Jack", "HP_L",
-			"Headphone Jack", "HP_R",
-			"External Speaker", "SPK_LP",
-			"External Speaker", "SPK_LN",
-			"External Speaker", "SPK_RP",
-			"External Speaker", "SPK_RN",
-			"LINPUT1", "Mic Jack",
-			"LINPUT3", "Mic Jack",
-			"Mic Jack", "MICB";
-
-		cpudai: simple-audio-card,cpu {
-			sound-dai = <&sai3>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&wm8960>;
-		};
-
-	};
-
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
@@ -239,6 +208,26 @@ cpu {
 		};
 	};
 
+	sound-wm8960 {
+		compatible = "fsl,imx-audio-wm8960";
+		audio-asrc = <&easrc>;
+		audio-codec = <&wm8960>;
+		audio-cpu = <&sai3>;
+		audio-routing = "Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"Ext Spk", "SPK_LP",
+			"Ext Spk", "SPK_LN",
+			"Ext Spk", "SPK_RP",
+			"Ext Spk", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"LINPUT3", "Mic Jack",
+			"Mic Jack", "MICB";
+		hp-det-gpio = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		model = "wm8960-audio";
+		pinctrl-0 = <&pinctrl_hpdet>;
+		pinctrl-names = "default";
+	};
+
 	sound-xcvr {
 		compatible = "fsl,imx-audio-card";
 		model = "imx-audio-xcvr";
@@ -319,6 +308,11 @@ &dsp {
 	status = "okay";
 };
 
+&easrc {
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -952,6 +946,12 @@ MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
 		>;
 	};
 
+	pinctrl_hpdet: hpdetgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0xd6
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2
-- 
2.34.1

