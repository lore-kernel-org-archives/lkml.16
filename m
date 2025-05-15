Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87F2949EF;
	Thu, 15 May 2025 05:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286477; cv=fail; b=HjqvkGCg199IsWvB/J/NNRHl9ChyjRrZGUiTw2EKxlndzDs+SP4BJdKcNDp2WVR3LrdFkYN0ClDlYeZcMZsQ3kEhl75jBd1HMQ7k60JNuULUzFAQ3f4WbeYzEHAPKsdWJig0S+S/n+Rj8gibnmHPvr7+2YZkPHAjt4LOrig0240=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286477; c=relaxed/simple;
	bh=TFiKkLXwP9enDbez1Uk1sa5K9WGeQ8vVu7Nis0eddU4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m5K29BHQYNFGIzZPOg7B4VRBPzaET1v9jVuTa1aM5zM2Q3VKsJx/ZPSMN0xRb2jCDh3B4YSEiBsHESOTWmmqxl5WPUYnwnutK3yPHxN2SdoDB5GrT6srWEiKZzlqPXq9Z24hECkENExY6D5tNVO+u9ckPLYTdWBlLlOLwHsJ3O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fnkyeaHf; arc=fail smtp.client-ip=40.107.249.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fnkyeaHf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcAkWhJuMLtbbDlDizYvJGn9VXlhMRreZohU7J5I6ZkNPXvuziTkFV89n4nf9k8RedVf3IbjkHmODdJSUjUEDWd5W94BkePqw6Aelx7QM+hoBo8/z8ndnzWFgn9gONn+MPCkp0/7SLJQADIfygtr+qH1YdlSyIjNRQ9vZtRXBOev0skeTSxAyDHNZ600So6Qg7SHrca8ONgsgJgSZ1VjvTBuU+7tIjDahQ9ot39vAKdDb7cx4p6wqtAslIr7V9NIa7Hd2g99Ca8pdnGty4lKFVFEmsVbkbrnPwvb1tTwVdUqcBi1sSDlzNTxmPnhZy9IBCV2fWbyI2esB8Bw4qXheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W9Ft4zxRLJRrXGda3vgTiNotZhGNvyMwu77o8wQJ4M=;
 b=pEGgqMhZSEos/pCaDWGVlEHkob6SYW9UQlyE7y+jgRd/xHDgyY0VRwSI10MMwGUPcnxqMEa9mA+/IrtZCgFdFXade/6vPJXOroA3p0sPDli0WdlZNs4HoQsLkUrp9FebgMRACxAEVQfjUW9zuY8jSVMJ6lI/HU+v6uZ9MoWohE3jFlSDZgwXUeJo/d8926ROpT0oHw5weW7lIM4PImx3K2e5E5ElQl78bwQ34ca/npFeZyyhHNtpXrK7/teM/eKi9SLyqIVnaWPUGN2EvHe8PJ1Cn0ABY0yvCFgYTmTH4rC6ge7KlTxfPtmdl7qmYTht9Sed23y8Ik6JbyBsRRBNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W9Ft4zxRLJRrXGda3vgTiNotZhGNvyMwu77o8wQJ4M=;
 b=fnkyeaHfnviw7OkAFFe6RU91MAcTmdwNhI/vnbX8aWgWiyqOOC4DO8npAkjvPmIW3oOJeblo3Wm8zJpxP0Cukvp9GYKdN5aon1VKDBCjIPHvhonDtvqBzJJPjntcwfmRSsoazaboncX9q0/eIPon62RmMoCLEfyWKngAzwrf8W6nkW7ZOVq9gVnBdbAfkDAsqA3S8bUyVBssPOmc+SSMJ3OYV/Qtj5pXtGT+9O+itH70Y1zCLOeBRbXusRvrAb/9GVFLXVpIoOcjcNWQqvXasEZddI/7LGByixqGRA67ZNISmKUifq52ZwyzJn4XT7f3iGRHOJNzTxEh3A7N2sKs4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10914.eurprd04.prod.outlook.com (2603:10a6:102:480::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 05:21:12 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:21:12 +0000
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
Subject: [PATCH 2/6] arm64: dts: imx943-evk: add lpi2c support
Date: Thu, 15 May 2025 13:18:56 +0800
Message-Id: <20250515051900.2353627-3-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e995a9bc-956f-4d72-8b96-08dd93704e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cnpms/FLiDn70gk45MV0rk7DsZpdlVc1F37Cgs6lGBufbTDy7rtcmWgJVFDZ?=
 =?us-ascii?Q?+jHMD6EyyLUD6tpkVTsb5T6EnW0u4xtf70UiO4Bd7MBha4AO+Hv48QSiag/0?=
 =?us-ascii?Q?9THKDF02uQlqD/QhUgPtG7WOyMQAmkSBLQvtLuG6sI2apImwCLvAkLwX1rGL?=
 =?us-ascii?Q?jjVlSP/yv+UyxSgXNp3gn5+YXOFr/xf+B9RExS6W9vGzeC+Me3uFWLefcd2Y?=
 =?us-ascii?Q?JgaJVdW3rtqilnCAPMheagYh6LpykC5aw1FWR7F4fkRzGLlseK7FoTIPTNuH?=
 =?us-ascii?Q?dKR1aWK4OPbkBba9DcFwbVI2B9G0tv1u1e0oLkFzbe+hXqIm1+lIQsf8hfxc?=
 =?us-ascii?Q?ZVfFpdHCdBgxQ3srg9wRNGzUT/Jul9BVBxrbVxxy8yZlvkxhu7LxebaEoTk7?=
 =?us-ascii?Q?lBQAtstCfd2AyeJX1IzmDvyQS41eHkOwR6DT24na5JM6FSH3t0uFkiY3vFxq?=
 =?us-ascii?Q?At4T6XHaaLaCLTH2aaWnMMbLF/DXrisrr+/XAmZkdTqJQCgUlkce1Ee71dKD?=
 =?us-ascii?Q?HYJqrUhMhrME9h12RvYIki5V+xvYo/yMAXc+xOQXVBbi48MCdmtdjXJs4lL5?=
 =?us-ascii?Q?LR8RdESiJ/RQKIdUd0v6r8SF04L0Vihvyt2n4F95xjItt+IDpvg7vUssN+Pn?=
 =?us-ascii?Q?W9dqp1ebRMvVB+nLrDZZnlvHNpdS5VZer9eifpMYfB+QQTfYjbF8cewQdV1w?=
 =?us-ascii?Q?3berrSeUJSG/v4lr56+4lAWXsit+CRFo1yBbHqAy3eBLTNlocZGP+xU5KEzW?=
 =?us-ascii?Q?Rmw+m7AFHP1jv+qAHvcrjTYIchPK8/oyEHVe7Ebrtk49FpLiVLCm4/aY6o3S?=
 =?us-ascii?Q?73uA9cIi1O4XDHyKPtbLV27ionmxjxy6lWY6T4CdQOqY+EYA3e88NkhQrgDg?=
 =?us-ascii?Q?j55OYPOFHmNARcufxWqs0wLXl1zMzDxOd5rCBySeK0TYRkQRcNqMd6Mv+n+Y?=
 =?us-ascii?Q?f04zxUpTKIeE59JwH4SgJDGJWabvNzWJiS6vmacALFnH2ZWygNfjyNGFQirk?=
 =?us-ascii?Q?xelJZvndQNaTA/8R6aesTwzXkLKqnC0wP0rzWJoiIYbnGFlMdDXxlJL01N94?=
 =?us-ascii?Q?YYTx2zkB9/94IsLty4HdKRWu84CspeZVRltpju4iW0ZmugT+R4ZWjdVYga59?=
 =?us-ascii?Q?osTBz24pVV0H0G8VpG+54PiH7R7Qif9XupS3lv6UcJDsuMR+UhDhCNRz8afB?=
 =?us-ascii?Q?vJJBfwSTtQ6Kvdhm/65EKmJCnIDJyS7BEpTLfoyex6YCqijAH7eB7/uI5jBF?=
 =?us-ascii?Q?J0tQvPMC4W38cZBykL9jTaiD0lSyQmsgXrDV+oIBeW19qWtkY47Lj9dew5sd?=
 =?us-ascii?Q?dGWgrxGsfKkyHFuZ7XFmdTx9niuW/xu/hedhE85OGc6WJjLs3XYpaiaq/E+h?=
 =?us-ascii?Q?7Xti+1IB/WJfWfXYHovo2dBT7qSMaOQWHuRzSEVTXDqRK9Qpk7SYDMfx+3fn?=
 =?us-ascii?Q?pe3nHPHD/gLDZ7Ikw6o+180U9YiLeG1KuFiPNIAoILSsIYtirP13aq8KhU2t?=
 =?us-ascii?Q?hfQQyzX+bfpWX0A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vnb88rABuLzEpNAD9ht9tyeGYK+JmmSovCkz5Nyqi6t+/7688Uv1f2LDqBqC?=
 =?us-ascii?Q?kjBMTZATAp2RT0Q729HP7XBTX1knRr79Bmv/KQJ5CriQYzDYVJj13J+ufa7g?=
 =?us-ascii?Q?HubjvsKqM2A7MtTeRhXk1+lfwERq/mrQ0+7Q8nK7b0k/MtK9KE+q0uvmakcG?=
 =?us-ascii?Q?FwB0sLLqcWOn2PLIupAOk6p7FH/nOf0zo1tIL13dd6kT0/aHFtN9Jcl7XuUd?=
 =?us-ascii?Q?Tk1RgRUChzrvmHmQi2VmKz58op8aIMN4ipJorN4W4dW1xUX8mvilSD3IVGKA?=
 =?us-ascii?Q?ODhDtpxmd2tnzt3oooCaAPRWU8DhmkJFSNDOa+rHCyO5cUjEgE2FVXCRf7b8?=
 =?us-ascii?Q?d9kfKK1lyuuLwSCh+SwyhiRE8pS/BYSeiXw+7hbk/FsGJdpdHyZ0aSlu6UTA?=
 =?us-ascii?Q?M9cWM5AE1W4ygtOpkpueElV8AGPD2Q08NyGPshEmZ122CG6toJjE9AX7LYG+?=
 =?us-ascii?Q?zf41vK9OP1obVI+3van7qM9NnKBFsJrax4Rip+yXPT2/cbmH4r+y9w6U6sMX?=
 =?us-ascii?Q?VxTrBOhpZqIlqBIMivmt800Tyt2qsuUobNy/hMvURxsBDcjvveEXLZOyagUR?=
 =?us-ascii?Q?F0XZ1z1t1i8GsEW02bSmtrRILDWq3A2GSaDaXPDSjoJXFNepjPphWBWuJEcx?=
 =?us-ascii?Q?UnrXiUO/13wlVCpXvQHs0MjoWq58zGafjGBGIavq7jMFlUdLGlOPKa1PEofe?=
 =?us-ascii?Q?Lv2cD7BN/WLrFO/1YXIT66tgqmxBA97Q8ekKYWJT++n66vVFPQqZPxQ+AceR?=
 =?us-ascii?Q?qHoyEczd7btmwZrfKerH4YdS5a53o0dVFb268UPJuBJKwO9aqEUXtwrqp8lo?=
 =?us-ascii?Q?BQZG6ahuA4+yf7xzM/6frxoJEDjbInneYUof4lZlgBzctMuW22oB4iqPeKu5?=
 =?us-ascii?Q?Kskhq1QAM5y8pAE51DtqJ2vsckgtN/UP1jU7R8CPNtt6nHl9J4o+XswHD6PA?=
 =?us-ascii?Q?2f3SZypwwXmZtbyP8TPAyRR3AyQfsOUcLOqYe71buTDvFCuKIubh7Bt/zwSt?=
 =?us-ascii?Q?i2O9Vbrce0vhnVi2RFM8mmJ3X4GIz8emSmNO404+HHtJai6dwbrOh6U7kiBW?=
 =?us-ascii?Q?5417XtC6G9k8rLclk1tJFuteRMN3lAyT4hSfrhu8IKt0dDyDG3x5XxQr1KOk?=
 =?us-ascii?Q?Qec1ytaU6IzxvMMHF4TCvzm8fyHfsgeyRMH3fsB7dURP76qrpdBnYE2OpMji?=
 =?us-ascii?Q?mG9BeiHuEu4aQxBWyQSWFGKrQHKsBoqHCTme1yj7G2c1sMCwXkK2a6n6eFqy?=
 =?us-ascii?Q?em29jpu1yLvhQuyvsh47ce+Rbw+TSdRKXhMLwkHkZVbsk1FP6bZubRl/QL1/?=
 =?us-ascii?Q?1kl/w4UQ6XbIqJLqEg3HTO/lfZ7Ws9DpKIXb4ORJSujeuk+b0QoYHUoV0dge?=
 =?us-ascii?Q?jAs0nu/Nc/2KDafel4dtVXaRgQ+fIJgU46WMKS+a0gOi9HH4M83RR7nMbpWL?=
 =?us-ascii?Q?AIqLk+YNh/tdvn7XGNXdoDvrUPP5/TwNu5LtHUQ4wUVMpZYYstGvXA5zEPSW?=
 =?us-ascii?Q?vlLTBoIGYrJAMvVHdCzfl67bgzQwPM2/uBw4I0pS0WXbgbHvn8rMnS/cVzhG?=
 =?us-ascii?Q?nSuKFSPUUIePUGglSfP8ky29ENfc5mDdovkLmPBb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e995a9bc-956f-4d72-8b96-08dd93704e69
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:21:11.9710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoEhRNg91u8OpWrmoYLFruhiKWhz47V7V6+3bHPX+TaTQEJzsGYSaYkEgZmvyFNUS7P2fle2Ble6DJfsVWNANg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10914

From: Carlos Song <carlos.song@nxp.com>

Add lpi2c and i2c-mux support for imx943 evk board.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 132 +++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index cc8f3e6a1789..a566b9d8b813 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -12,6 +12,9 @@ / {
 	model = "NXP i.MX943 EVK board";
 
 	aliases {
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c5 = &lpi2c6;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
@@ -53,6 +56,113 @@ memory@80000000 {
 	};
 };
 
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpi2c6 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9544_i2c6: i2c-mux@77 {
+		compatible = "nxp,pca9544";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &lpuart1 {
 	pinctrl-0 = <&pinctrl_uart1>;
 	pinctrl-names = "default";
@@ -60,6 +170,28 @@ &lpuart1 {
 };
 
 &scmi_iomuxc {
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO17__LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO18__LPI2C4_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO19__LPI2C4_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO29__LPI2C6_SDA		0x40000b9e
+			IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
-- 
2.34.1

