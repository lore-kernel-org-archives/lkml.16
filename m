Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEC2609FD;
	Wed, 30 Apr 2025 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027412; cv=fail; b=sZphvSeXy91sm8RNFml9nCi9O2095jkqMOSqDIaCEjNT2Ftb+Khi5QT2etA8JK2zWsVEYS3Mq164+VobmdhJm4Xzf8JuSLw4v7+eg+KccCVXZ9jtOIMEoWPyudsqxcsERQMoqi1mn49fPieKyNUlZXovOPktCVm5iwUzdAF0rWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027412; c=relaxed/simple;
	bh=erlAVSOWX5axNGUZPB3R5SG7pMCIFIL3Wq7gha3Jt8k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h4O09Ob03pJd9Aw7oT1PJJfvuWjc5K/rFIz61jvcsYzYLsK8t05coJOT+vaiqF4l8gmqlIicyYlGN6bfjf4isU2y+PXG1dZ0nNIIHBi8O8ayFGpuxXasNbzOxazt1EH+gJ2vaGQo+JzouM77un1SyqJgTGdl8GJ+EP3Msrupwxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f5mtfxkg; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f5mtfxkg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntzMpAUro1pKAdPBFmZAeECyppQcerQWykffZ3aDdWZSj53V682VuHL8OE2EoysQAuyiGYnSSx5dJAQr9UMtv2YCrqbLcQrNoQueqkj8JZ7LqfCs8O7Y3kSjl0nrHdSrzjbbgGqJ6cTZvX7K108wDmnWaqndK64pYJYhzWtj8gquyIAIhouJihcGH2abvseB5StCNtuoYvRzcN/zB8EHaOI+p6VWiYnENT9j81R7ENlGSgL9CYEyFyAOsZqNfuCvGjVujg7Quklei0e7efmP4RO+W2BdoI1VaP23CSRWcRyEfABWGTUfEl30+WWlsCp6ofxQ57P3uOeZjapvaVMqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyfXMkTr7rjECLANKaD7oUT1I1fllfwXZK54mZ1Mwko=;
 b=xRZGWOusSaeHIkQFamZXkLrhbf/FSs6o8h+WfKxCCzX4OX8GiXgc7YkiwoEZ/TyTLMJiPqvpqI9aYCtdBVnLsnA1oQtCoxlGTRRbQVdCv3hVN/CUGlE0+MKwp52WFLlPPIvbI8BNlXfS6062x0vgIXqAaC37NaQ0LkYMsVviTJuGAP+GnySuhYhlV7mNQbq6m/vyuLWVtEsfL0H7h8GOGl7qc6mjMY0P/p4wrKKcRkQ7bgx0knj7G9lLqvpHd5P1Q565g41UYev43AsL6IG52TaLNPRftFuXEjeNNamEyhpiMJEAU2KJXazP6BKklj0c9p6/LHpYFU5GmzPLFXjDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyfXMkTr7rjECLANKaD7oUT1I1fllfwXZK54mZ1Mwko=;
 b=f5mtfxkgY8bVrk0JNwn+2ZMgbBy/yPCPIpIcnb9z/ffev1AWiMRqoUYmJvPLl6YygYplrVtfTHvt0lgLym1Bews8iPIBEsbJq18NPbtcKc3nkEJr26GI8DLjbML/TvLhlVQ7QPYDDXgl8kwQWdbKPFUj04EGaWpsNayA7mC1VM7CJDCv8NURxpBavEVklN2F0qfvzMz1z/D7Ml1dTJcQsxAgtg4hWtBJukeOgG9rcd8yuJ+i/59iOMAJspbENggBKabQswbqosbkAfOD0FWCIvgNrzxv5rOh7EisdmgrZ/4ypR8gKNUhWnJCF6lQhD1X+xfyXMhTM8/FV7EFjIRvMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 15:36:48 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:48 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Wed, 30 Apr 2025 18:36:31 +0300
Message-Id: <20250430153634.2971736-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9dbdbc-18d5-4fe5-33b9-08dd87fcd1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N7zIg3VHppd8tGmLPzk1iu7HZFu5rVclpcJIclUAgxSlnIB8vVfDnaP7yGaN?=
 =?us-ascii?Q?f5eb5yVgshx8xRefybvJ65+1C3yy3dEHGxEHXaCbILjp6Mkc8hNVNRD6AGTH?=
 =?us-ascii?Q?i1AjEcHpjlqwMERREtrkdcxpMMcIyqyOJYdgPfqEfO8+wJXOkap4CkDHNl/a?=
 =?us-ascii?Q?H2Cu9SBvLWa96IUGOXdUGnap1oOV2MFEcHtkLpvYsYo/BTTioR0Ox6jEQEeO?=
 =?us-ascii?Q?lU0m12FiHeTqptuBQeNWOg1gjEJ/S2OJgdR04U7Q12Ziyb95/FTtAkILcFtk?=
 =?us-ascii?Q?efggZExpVM4EJVm/IiczdQ/YZQdJDDu0qzjJ2OrQsHiy7eshOk2OLK3/Qi/f?=
 =?us-ascii?Q?XK3mrHQjEt/LkrR+O54hSSEKVFbJJECKQgakOhJSKD1mxPbg8gqr8AFNPs10?=
 =?us-ascii?Q?vOGZLKVu4LG6a5R8cKTxiyJVrXuLSv4Aj556oLJIqUkAkBlcP+jEw1hmtjRN?=
 =?us-ascii?Q?mT9oCxL/Vifuo8yPfPZfiD+Q1iYfX3TbyEh5e+Jw5H0bfChbUuY45KHU/Ou+?=
 =?us-ascii?Q?4HuE9FkeVWiQgmvif3XFTtJGhdCidRTZHNjwXVX+H2Mmfiimy+2SE+hRx09s?=
 =?us-ascii?Q?1RmaTbZQrYptuF0PTWKBwbsVe8YIm2fYyByYwzA2itnUtt8Z0KoziG8rPJgm?=
 =?us-ascii?Q?1aOfkrphnUoBwBWgo2X6A8QUAb28/fHAMzCQHdhOr4RjGLbSdgJWmdX8RE9b?=
 =?us-ascii?Q?/wA1j/oHaXObWxf950ppfsY5lEdVu7dSOg3vxvw8Yw0rwviw75qq2d4/MFgg?=
 =?us-ascii?Q?UYb0VFX7yxg/nz91IsvuArkVi7VZnG6KWTzEGy+cfKAle9VULc4zMxH/SXOg?=
 =?us-ascii?Q?XpiAm80PORTrZ5uZkx56PkJ1aOVoi4IaAVnHsmXePwBVUGdPtjMECOt7akgO?=
 =?us-ascii?Q?ViRVtYNqkFZ6T+YtpOETuFS51haONAKzYUZHSZCD+70AXVUsKchV8IjHYrkX?=
 =?us-ascii?Q?45dOYnvpTOAHQ/ELPZL3LjesKPcES6PjVDXKSqkQp8jgWyog7qi8loUikcBC?=
 =?us-ascii?Q?BTc3Tgez905VGZadr55EEozTqO1/0QyoH/aMHO1NjQzjKj8j66mQRQ2Hv8QG?=
 =?us-ascii?Q?2AtPMP1UwY0eXR/xQjKgZo+ZgQW3vdNwLe8fBGcORh6T4k8+kt9CWv6LVLzc?=
 =?us-ascii?Q?u/Jve41xGeQ4odQbZUbxmNL7DClkbQi+pnzykVF69RojgRpb9jO8d/dv1o8I?=
 =?us-ascii?Q?43jbGPDX1wmeJ8oJRuA688cLh9zwDQXWTVyZNUtUTDVPvOBPuQUqa3y02+9o?=
 =?us-ascii?Q?50OFcmwipajLm8YX/1dtKfdjFSpN1B5l0Btwyb5FBahGyQXqCH5WVWyUL44d?=
 =?us-ascii?Q?ge95U39aldSvX8p68eSUl9P8y2AJiygQPqzylh7zhuQ0hJ/RKErtDKvRmXKA?=
 =?us-ascii?Q?PnIzz3LxVOtaHuGbKPNcAky0IrKgtwh2SO9590gpZLwQ4V1SNsDG+ED9JHwW?=
 =?us-ascii?Q?OxS1TdbAmTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IaYSHNNLqsXaLNvffO1Z6o0H7eCZHDDeIVn3hq6dxTYl7ygITQ2hDOrGAX8P?=
 =?us-ascii?Q?hNu8S5tZNZq1yU+BKi91W68mX6Pkwp6kw84shVGz5Z5i8ml2PVEFdDU/Ea0n?=
 =?us-ascii?Q?rM2NeUmKnp6XhPzHg9ixalrDzsnxHiqcEj+5BDd1ljpXXICo1Vc/tCfOqHcS?=
 =?us-ascii?Q?gLrP2ummDmLyuPiG5UN02YFWNN4ASOH7ivOZZX1YcY5ifgT8u1FAiJmttSb5?=
 =?us-ascii?Q?miK1PKfSIHvyAkp13a9YEFd5UCGN3lOrNMEwvTa10MwMoxD/FClparrAyj6q?=
 =?us-ascii?Q?lgWSSPoYtP3jeOolnhMjz69nebV7u6kPCYfcJU37+Wk3tokP6wXJ4BgEqpiB?=
 =?us-ascii?Q?PxjUIgRwzStE7hSEGJ3zzMu90N8oGoULEGUxh8V63IrOCDPcRT4ojMWAJthp?=
 =?us-ascii?Q?glfh6kjSnE4Ocir32EABdo4QqrSaAcncFellvGx5Jt4xzZce4eHHJB2haX05?=
 =?us-ascii?Q?iRrQ0X+zIqSFgS559R4DgkR7c3zCbO2EEvYCiWpkOk1fLwQxo0NBMxY0ppDu?=
 =?us-ascii?Q?HHLhNeb6Xpe8qBEx0BJCDOCToLbmm/YQt8c0Ebbx8/+etqV1YUChde3FZ0BV?=
 =?us-ascii?Q?IEEQ/XPoJu0gJkuIj4c4k+tZfkeVAJdYSsrs+iCpq+rfZNAkBLij9ZHDpTnA?=
 =?us-ascii?Q?qEr0OYRu0fbIfvT8bPaCJxmUg53Bysnd+DXIQKb+r6/5cJ1+4zO6n7NcskkV?=
 =?us-ascii?Q?ajcVfL33XQvpya+RdfHlXve0iBTfy5WpdiMIMzSVrTGWok0zZp2yGH1ZpmEA?=
 =?us-ascii?Q?XKuyWtaAixgqynd9j54jtRSahaA22/DVagpD3La6FD+Ffk4Kx9ViCzp9wyOm?=
 =?us-ascii?Q?KSU+FDZymJYG5s3sgGRvweJpAH0MhcSlaDf5QrwKTvp1vl2I1fYYV3KvbDdE?=
 =?us-ascii?Q?2578rPiHaNBnO6QWFl4W/l3MH6M8pG0bxB6Si8SP0hn35mj3avdnJ7lrhcLO?=
 =?us-ascii?Q?nKfz3NM9FS87iln0tSIG2UJkVWzdaXTA6HwAeXLkcXATywidfZsvhUd2w1FD?=
 =?us-ascii?Q?kik1kt4+tbO+J/IGZ69W3Sm/v+wz1wzz1ZmILqKc7BvfwYbHzgF2Rm4wh1KY?=
 =?us-ascii?Q?ZF8ajvgC2YZ5AGHvkZl+jehKuy7SidQlTkwNIMiq2hq3p3UWwtZF1NTjAJ0m?=
 =?us-ascii?Q?PwlJ2Vk7pSO0Z4JX63o5HU8wY11uOZ6iMJEcvTIdFfAEkWnp4aCQAz17+JeS?=
 =?us-ascii?Q?d+iJ5ZSd1qBDMfYlKQEAPeECPBg8KmzkMbXxjWg3OaxrkOGVsPjh2YHsxDPy?=
 =?us-ascii?Q?tlpUoqkH6o6Mlwsi1qtSVJ2LabAyU8F294a73CQFI0TS05ybjlNDOZhH5pV7?=
 =?us-ascii?Q?Qzya0aQcEMNVfxwQxkI/oDC4lSjI9Ew33UJB17L83+pfe8A/7Pd6/6FE+XOZ?=
 =?us-ascii?Q?Bh+37/ah0NU/rhG3fzGA5JEddIMEH783iyCGgASkBKC32W7kC56+ljScZswR?=
 =?us-ascii?Q?R6VqIPX8mtIHi3cTgsoMsf43LT5rA66nLBxXPFkOb6lvAHxHnnU/9FMqVt2n?=
 =?us-ascii?Q?ifQoa/+Jb2hjuWc99gxYv4AQUiFmkXJcsSNM4NxN3FoywV0aVbV75k033eLv?=
 =?us-ascii?Q?fvOc51UJEK4U1Nz84bk+jeEENv4eA4CotsrxrnG9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9dbdbc-18d5-4fe5-33b9-08dd87fcd1f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:48.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wcc4awvSaTQCd4d3I8mBl5/e4ZUP+l0Aty7Fz8O1JMc+aS5dUYkJZgeKK30DEAZia6NBmQRLyn0WIYSQhAfKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577

The MDIO mux on the LX2160A-QDS never worked in mainline. There is a
downstream driver for the QIXIS FPGA which is very similar to the
already existing drivers/mfd/simple-mfd-i2c. Since the HW works with
simple-mfd-i2c.c there is no point in upstreaming the other one.

Adapt the compatible string and the child node of the FPGA node, so that
the simple-mfd-i2c.c driver accepts it.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 4d721197d837..d1db38d6a027 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -240,12 +240,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2160a-qds-qixis-i2c";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
 					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
-- 
2.25.1

