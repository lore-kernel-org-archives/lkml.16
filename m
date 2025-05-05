Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020126.outbound.protection.outlook.com [52.101.225.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1E136E37;
	Mon,  5 May 2025 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424746; cv=fail; b=DlILr7yHW8StLSyPAgUF6J2Opo8nXR6ACvtI/cwLReYYCEMvHmZs9v/apY8+CDi+8e4ETr2E4W6MHILiMfRI7Xh9fUzxxQY5exyndFm7InmRx3RsqZt5lm900kgRgi7iz9x1zPE3yffsBooZj/GT/JtGcSF1eFW3Jcqca/LKOHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424746; c=relaxed/simple;
	bh=qWbX6AAvSaO91Bv8n+fwra3+x2oZP7kT8ENQridOu7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dlc1DoL8S+42hr4ZeMg+5+hQRL2h4dWAnQz4UiipZvHav38EjANWmLzBszb/6n58cFwR6qgBKd4yLW6ryKwqqIwasiTkp+37PG0X1iK/CjQtYuTgfDuHKSESnbQa+rIR2Wus4++RT9buzP6auUGrF97uPLXAnUqO+uhoxUDBJec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDfi+2f+YupNF7TV6MjVEApG+32MQT/3J8FD8/MqzoCF8jpQRY5Aai0qKYRXikfqPT8sr9lMooidJfU4+IxyVYw7M79JLbjUOEGJTASlCKVpiueYMCkb33MOMOgUYYbIS2J7g/rTWKQzgO45o83a/3bH7P5KLZ4WiXsX2nOOzhCG+q+Mbk6B9G7+xEvHtvyvD86fSqYH6rtdJGruaW5yVNx1giotga4UCilFtBov18JqUh6N95MFpmDcEnkSSNUbEb3/em0nGdXoYBlqYIw1qo9QJYEUkKcqL8zDBPqOb9efguGOgNfCBV3ri5fq47j/i+yVQ4lCMEi75088I/rPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mgbBpuH+vwgxATfGxsEGtyfbK3eFvsnmWZJVlfKaB8=;
 b=EjyUCZeDEaTzl2r7roFclZLweovR72P9lQcdQPv/VP78bqQaVJ73bAkhbVVpAJ1Zj+g+pyr9yvtDwMdyAAp5BpmOFzWQVujLyiSRI7j2gnOiko6ZqXi+1EfPXH8/3acu/vwQx3DuJmMjfUt3fcVe2ZQ/HIS68WXsca6kX2bMUkhFfbgHLqTlL8uwGwtbVhEvJTBxuEaVl6VWP7+zehp1Quod88+7P+NMkcWflQBwExFLQnEze+3se3JHGlyybQdaihv0VPvCw2PJmHfLivivkyiyf2G0MwV23NJVtDgwyfsQ5Hbi50URAY/25Nz7wlY9HOcp2S28bOoUL29zMC9Qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB1188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 05:58:58 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f%7]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 05:58:58 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: shawnguo@kernel.org,
	tarang.raval@siliconsignals.io
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout
Date: Mon,  5 May 2025 11:28:27 +0530
Message-Id: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::10) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN0P287MB1188:EE_
X-MS-Office365-Filtering-Correlation-Id: 6780f993-5bc2-4006-d550-08dd8b99ed53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9oRgeLHv1MpJ5JZT/rP6ewzryvdbmkuSGH8fgI+elDuG7yzXmvsMStxvUlnC?=
 =?us-ascii?Q?TUj9aUDd0D8NJiUkgIFd7nG1ImGd6e9G5404ItVBIytjLzBQo/8vZWF1pEzr?=
 =?us-ascii?Q?pEA8BkJS11zAzs6ZcUJ5FjDTj6TFNGn3nef7GaVW+O/2UfJsQNq8nxZcdl3S?=
 =?us-ascii?Q?1h4odAFcc2dmRWXyvBegXCbccR/tbtw4vDOQi+5ugY3hBk1FholZ60B0072t?=
 =?us-ascii?Q?MYMzJSYvc+gdzYFD9hum7xwx2YLI82hCQvwNnxuBqkkSOMlZajt7cUpBYTxh?=
 =?us-ascii?Q?Q+zbbTYFi5IgAm+z08/H+UyDGN7TgfgizuTQRy5+mbUNS/2XJKaCQxmDBytr?=
 =?us-ascii?Q?cgBNazovnCSL23/bw5yabM/vw+/2Ce86y3x1M+49d0CHsMLe5jRRB6sKpN6s?=
 =?us-ascii?Q?JM/gC7FYxFFdcSk9rpinD0gZHC+QGAyDL/GYpGXbSBKAYgfirsWiQlYcSnTe?=
 =?us-ascii?Q?NFK+ZpDza89cAFmBdh0i7ToPQKZ8DJJi7sCbdGbVvOgMMeMLT98eiB+lOcO1?=
 =?us-ascii?Q?1InyYPR3209xEga3Pwl/R2GFwxvu/37NTjHf2pgRjGmyoc0Lc6d1d2ncM98Q?=
 =?us-ascii?Q?9KCycjQNscjl5znxSBRdNub9QLAT1zF97WePK2spHyyR2ido5kuaqYGVGj4/?=
 =?us-ascii?Q?bQP9ORLAvCMckn3KkrFFlyMKL0ruIhIyY8Y3fvSV/GkDGJNOuj+d/hv/vXyK?=
 =?us-ascii?Q?RD01tEOX0rRKph3MLjg7Va4ngdHqrB/ctTbgaR0CKS+JObVyCtXqIPjp8Yqm?=
 =?us-ascii?Q?+97j7iRGF9+GHD8Gh47hoxYHSZQ8kZDRRgL+m+IbT9D2l2irO+rJnTSiHSeo?=
 =?us-ascii?Q?tBaz8yh558mslqrVACKA1j+RcNypUiou5Q3hPxolOcZ6xQRgGu7Hel9N8AKA?=
 =?us-ascii?Q?Mb27nK6H/JmcN8R+MrFBHaqNiqE+N7cKi2tHyF/SlIQLIUIbxMg/lzqTvZbK?=
 =?us-ascii?Q?DuSb0bSa0pmvtQ4a0yTjVXH6Pn9zqxZ63mDuCEy+bObAtbBiQ7StfwWuNFZO?=
 =?us-ascii?Q?2NPQqjFyflePDeInjrvqQB7sjMmityHSL26mABMOWWSS9yyrOZWTedNcBq9j?=
 =?us-ascii?Q?0waYqIx+XzYewvWRhtqjTVt2dOxw7PFp80wJG8bohdAjoOiH/uCGW0QOLRY/?=
 =?us-ascii?Q?L+AYnZDuq3u1H/s0iUtxWHJ30VnUP18LlUYLRestQFETxzy8saIG3/h7Nm2w?=
 =?us-ascii?Q?beEpFpm61hRwcISYsIyfyfIKT10/RymUy0PLkcRBnBJ8MPGvQkcbYMxxP1WX?=
 =?us-ascii?Q?lH29640wMwp9z6pCRgai/bi85TZBCHpJu5z0sB3fQQA18ihfWyWs/i5XRBES?=
 =?us-ascii?Q?hwx5McE1c+RHaMN3qxBdEaGsC1DTK2yn3+sMEOSkA3PE8MRxOSd1kDf/rQE1?=
 =?us-ascii?Q?qrThaV5NAas/nP4FyTHx8PK1GgMenwrMy/NfLq5IN9pdWKjQQ6gYF3GyFRsl?=
 =?us-ascii?Q?OcLwI0O2AJqNxNxf6BmGIFosdVD572AtA2qrXYYXRXZKwoQhFJnkgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U8XjjLyFNQqrPz6+UyqAk5EZZ0ueNDJLj/Jc3axuygbOkAXPVwwaA+J5RF9i?=
 =?us-ascii?Q?lUjZa0nuhryyTj5iVx5fy7KDZmae8aoH65mwarCpwass+COx7Em7iLA+ikLV?=
 =?us-ascii?Q?BtuBKNtJgldcWuDq07EZdoK88eZ46VCBDhTUS7VZFmIjzkLklwHIYoqmZl8g?=
 =?us-ascii?Q?xm5RVeEPU7OARH1zj+GfXx9xoUxgZQrL8SQvZ68V3WW2GRzmB2Hgr2LCsf2x?=
 =?us-ascii?Q?89ACSENVBcE3LeYMpx512DunCNWysbNvCFnIhBp6NRxFkaMHqCgQJu2mkc7/?=
 =?us-ascii?Q?0wZuY3/VhY5jfPFoCFOYbKjXeyX7wSotl4U6avjoaVWsM/6dv2/Ksm/bMOmN?=
 =?us-ascii?Q?XKnOmh9RMihpv2De3NR0gDaGRn/to2sQUDXxiQ1JtcI/gl/NsvNOzy+6vruJ?=
 =?us-ascii?Q?bU8sBMgHE5Wbgeui6Y2yYn8WkL6KcPSynDq9o9i34ltVnK8iodAz/lDGRgpD?=
 =?us-ascii?Q?6ziPjKJG5j8CNxmPO7ONKHRuLKGPCa71CVhnbxGSYIVDhcFW7R5zL5cSd6Je?=
 =?us-ascii?Q?6ImYfjorDCe+KueKBbVRiMXppQq2b7TtsuO+5snfUYpiMtcjt09gcd3Yr2Y1?=
 =?us-ascii?Q?Qy7vkMweZL8opHuaDuBPNa52YV0v/rhR/MOSl2c5/+aHhBqLp2HKM9CQV4nj?=
 =?us-ascii?Q?jMpv75FxG0dUl1EmAwsN6rcYAlst0DXpBIJee54TgdgdYGhPiZo/PpLZUb6v?=
 =?us-ascii?Q?YTR0lVsAJW8/YR8Ofq6GhTRRPBxh8ps4wRnhZR85O3Y/Eyth3R7M7OY/aeXQ?=
 =?us-ascii?Q?kB5J7coSSP5MGvRL+sv/rfv5cG6qg3HQzOv+rPNVQtePRJY75dkMOfsDZ/Ak?=
 =?us-ascii?Q?Z+ju36z2PBz1LgsgvqGV/AhwE1JAxgh7t1zsZAhSpY5ATturtn+aoljfEBpf?=
 =?us-ascii?Q?POvHwm8gAQxha/FD2NDcKxdCNhj2vpW9Sgdsz3u84z8GN1wqqiPwGUB90x52?=
 =?us-ascii?Q?21Ul1Lert4ulauR/KmrGTkoX6+OTz2Sy8hsi0vsq7O15QKeAebxRdeHI0Xx8?=
 =?us-ascii?Q?PqMUJmM5CMQ44qZqIxzCh6JTEtsWlcC5g2mNpPtrG4uE3V1QNO9827MfBU5j?=
 =?us-ascii?Q?UUjF5M4S+RFUYgKOkW+LICA4G3IyWebiYRuf4egWemimwyc+bv4/LE/SaSUQ?=
 =?us-ascii?Q?Y2Wl/G5GfWTCmy9DgY16v1MDuTJSko7J4j9dn6N84/kO1RcXtWzGl/M28b50?=
 =?us-ascii?Q?qnbsFQWNcSqda/3HK8nsn+V+H8puUWr19pbMQTy/8JlRqprcYswV5xq9ADZ/?=
 =?us-ascii?Q?Fmg9f22vvjvIfOfZCxXO3PWzh0KC1XkRMXEP+l+eesaOJjpYM66etwXxJS2X?=
 =?us-ascii?Q?fPrduE7t7Q78Jg9KP2pPE/jCI1y4vur35I5ao7bE4ZQzxDut2AFn26fRoJSR?=
 =?us-ascii?Q?75MDFEH8rjYyI5ghoK/8PT42+Ep23/B4ZpT5tAMzfbUYJRlH4hMmdV3ykFEm?=
 =?us-ascii?Q?RaFHokM6nxT8I+iv3WPsGle415OGDPJQ9lt6gQi70IRmbQtgw+F9kQld8NVH?=
 =?us-ascii?Q?2jRIjfbdPzNTEJZWqhD2Y/cg4KbdB7xeEewh3oOH7jjWNyN2iLWitsQuUqvC?=
 =?us-ascii?Q?HQ1wbj7WJ0QMoWvRUzu53W6Jf+cTA8U6q/LUE/5N5vkq5K2DM5fA7qrgld8P?=
 =?us-ascii?Q?YyiTBOesiUIgRLrqG8pIbe4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6780f993-5bc2-4006-d550-08dd8b99ed53
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 05:58:58.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vveDH4vKA1W1Jt4e/GPVX+eOxI6IDA/FiPfnZmE1j1i/N3GvusCNtnwjSHDq/e4PNvU1KZP+FYrISeiuO1OETXt3BzxCGgFZ/cQae7GYrujE6FQPosJYOmye0Df6+lZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1188

Fix SD card timeout issue caused by LDO5 regulator getting disabled
after boot.

The kernel log shows LDO5 being disabled, which leads to a timeout
on USDHC2:
[   33.760561] LDO5: disabling
[   81.119861] mmc1: Timeout waiting for hardware interrupt.

To prevent this, set regulator-boot-on and regulator-always-on for
LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
signaling for USDHC2 using a GPIO-controlled regulator.

Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b2ac2583a592..b59da91fdd04 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -35,7 +35,6 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
-
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 	        compatible = "regulator-fixed";
 	        regulator-name = "VSD_3V3";
@@ -46,6 +45,16 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 	        startup-delay-us = <100>;
 	        off-on-delay-us = <12000>;
 	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		states = <3300000 0x0 1800000 0x1>;
+		vin-supply = <&ldo5>;
+	};
 };
 
 &A53_0 {
@@ -205,6 +214,7 @@ &usdhc2 {
         pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
         cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
         vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
         bus-width = <4>;
         status = "okay";
 };
-- 
2.34.1

