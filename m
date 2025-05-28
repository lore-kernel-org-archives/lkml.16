Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF449274666;
	Wed, 28 May 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422490; cv=fail; b=Pu5lsMbVacIUBB7463flEUua46gd6lXXdJabGTjyho5Njhbdd0URxJfw4vM+iWWJ0zPngKTH8E6raRKIjlPlP++2N+axkZtoKljELJbp/VTYWUZDXCzL9jiBpOjjbtKP1tAUp/cjn/Q1PkcG2/+J3UF6Yrl0Wo1sAXN+KQyTklY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422490; c=relaxed/simple;
	bh=sW/W/7hdC+nGLAfGPqgi2gadU9GYtHRcuJ7I55B0EvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nd2h48z+xnfdbi00WP5zii90Vwx8pp+85E9AkVdZmBMdA6wCM1483drIQfPJBY5JI+F0RhPBXYr0eUPgBOCmzrkqNHuc2+Q/s7iUS3bs8qWAzKPTEPe65uqA0Rntm0ecxV4r9BxXZNataGe63ksVfc9RtnlIkpJXQdVAn3Or01I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jwnS+ldv; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jwnS+ldv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZXztnUfUBcYgbMWT/u6Tw4QNprlSMuuhlDxLJ12biitPsCs/f3WuieGJNFYdmpJAN43Jl+5gBLUi3j4c7NkzxhLZRe7mvudrnlniOge1f4KZi5coMP7dcio82cQZ+1dVtEYBSYZq/bF/aKU1qo6swBfhhmuqsi3QhpOIC1LwExAogT0Gk6p7g+i+G4qqjusJupCvAsLo9XWhoLJWazvI3BGp/Xb0Y9bEnYaLECfCduK4jm1geIm8XnZRIE0zTOeVeWw7rb3q74DJzGEd508qo1kxcQQTJeIh5LL7Kr2ptrnjzxBfDP1b0clPa6vSv7PMSQb03+bZiqhIHsNQKquDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVJvr8eCWPOP6qr4fEsePeYan88C7WzzuYUDCqIyodw=;
 b=biGW49FsIFARbv5DCy1wWWP/b7FWibyEZ3AULQJ5L/O6k44UAU+d7DNi2+aAHLcdQkE8DoUi8B8dUTJN9yuK5bhd3B9JYB0DJhquZTqhRuXV4lXH6DySKorvhEyUcu1CuEoxL9KzsM7Zu+mSrFuDrQqoNEK8nXU7PUuNB5p+zXjloVEIlXH0KJMtPF8LLk+Ezvb5uWuY+8qeytknSDqJwRHbwwx+eKfWscmnRfoh6GWOXTErtbtpGKo2GcumBKajh504GDWB7uYZgOGxRUcRKCbh0ZrVT3ygM0HoKgdtSxQVs8YpIetL9u5gY55NczTDL4FZhbzE5gXC7QOZeQWdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVJvr8eCWPOP6qr4fEsePeYan88C7WzzuYUDCqIyodw=;
 b=jwnS+ldvbKLoqGIHwBRjTUVoWTM8jFcAniXPr5EJbcfyzVUB0ZJwFnY9Qe7XQUc5Byt4dsEPLB8t0SIMGBifZEQWpHP/39Wngh1hmqmbX63g7AQ6BSXwJLVJTAmHiiiVhhRJOSYMP8tHfXEP3aL5Gc2AAYdSyz3/8XoBSguIggxlGq2qM96+TR94WeUn7bTAkY4zBV5SeoeHV/MNg7iX2RnLIEqf55MvD0OlWiMrCPQgluLBme5fiQiOOpnpw7EHcp4CWStuZpcJfb082pQJ4y9CeAdH8kj4iry+7HabNSaST//1AQbvzOq/jJkmoKgu/KeqH7zxA+9dkoPL7KEmsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:54:46 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 08:54:46 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: imx95: add SMMU support for NETC
Date: Wed, 28 May 2025 16:34:33 +0800
Message-Id: <20250528083433.3861625-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1927e0-4286-4d8a-809b-08dd9dc54b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LufMgMXbqDa97nT6y7vdXHixvFbPrs5QGhmL2BmupO73/QaRUz0RZZornTiW?=
 =?us-ascii?Q?P9EwCt/Rb7brhFlzO0AWUQWDXwhF6sTGmOfgYsjRvlfJLl8aI13KRN8DK5lb?=
 =?us-ascii?Q?F6eDisV5yObS3hmvODmrrb9xTw8X8WByzqC9AuA5qE37y5mLIkG6e1BDcfSH?=
 =?us-ascii?Q?Bwple4pme9SOg0w3wkci/JG2MyKs5F8iGsGPAvid8mYLwoS4nutB+DNATPVP?=
 =?us-ascii?Q?/ohyuiJbICsbPDLkul1mDgSGYZyGdGQHlnBks3ocAyOTJhhvRenQ5/JOyj9s?=
 =?us-ascii?Q?mZpGGZnd50HR11xK8/YrAyq2uWybT8Y6DMR36zIDdAFmUst3hhvhPkJMLdWQ?=
 =?us-ascii?Q?2qlJUtit2GOtTvPMdvQmXeuX4/VFEz7MOgN4zk8CMPYYmDpdkH5/8VLlI3s3?=
 =?us-ascii?Q?l0iFRq7quzd7f/orp374nSbYS+/ZqnymA8+Lb31paNIfa0D3x5p+ixOYufPD?=
 =?us-ascii?Q?5GH4dzx2PAa1tihLb2MC21nb4qmXWr5Xx2lm2+clcdz12dyn2qphquNGA1Ca?=
 =?us-ascii?Q?agd2X/+RBcFrL2ViWqiTBYTTsNoVA/U/JKYXlqeAxyf/t6jjV3kLDBgy6hff?=
 =?us-ascii?Q?/hRg9Oxc/4ctaZSkgc36DB3PfSEdQc7qttsqHt2/r44hHxhVNQsTL13cbzoo?=
 =?us-ascii?Q?bob+vKOgdO9v28f7F7w06aYoBIbKUx6h/nlxaOh7odaYTMDbvw16MJytaYNI?=
 =?us-ascii?Q?7tvFzfDpSDpHZuCypKOCyhZSD+Yd87wXr0PMY8FwL8ngLCAq/xO2lK00iisx?=
 =?us-ascii?Q?nmy/E3xA1LVYD1dGDoecnNORUHXYhU9Yq0hRMYG40iEQqqQp8ZrD3xYCctfR?=
 =?us-ascii?Q?5N+MzwddgWsl7TFHKI4lbC2ZKPGxR8v+Aal2sqHgZfsaFZ01OEDtEbh0rIt4?=
 =?us-ascii?Q?m+sEBBcXCGhLRF7MuktzrH/jWQZes4V/E6NrqDeULOTP1XPmX9Jmt2Lepl1l?=
 =?us-ascii?Q?BRedS+hW36SLg7U0StQXp4NmA4br4a2EPCK60Rxz7BjSuA20hg2jAS91zjmo?=
 =?us-ascii?Q?qgBFzHSCZBcydkUkTDFeRZU2dcJNLBKi1UpCsuNIEl0hnlyl2wLf+BAi1JVM?=
 =?us-ascii?Q?c999VNRXK++Q4wNWc67D3z7M903pfaQEGVViNIL+vioFnBUIH3xbRdSDcB+y?=
 =?us-ascii?Q?whVgZmJBm8Ua7X4FhynM55H2sXQKi6GWTay9qm2U/nHBGHsO+paeBveecpOR?=
 =?us-ascii?Q?ishRqrSLtT6nEwSKqCmt/JPGyYy1DpJM5WLZsEZecFl7DgxrzanxonOXfDx4?=
 =?us-ascii?Q?/Ew930Nh6vwCcDVtFsnUxC+irf/+TUMx1lbQyg5vLsrF4Us7rlWA7BabVDy7?=
 =?us-ascii?Q?K3lXFXJYYy1H9INictgLtGK9qC+pRIZU2sQvPsIK0/ZlFXFS4hXXqSAriraR?=
 =?us-ascii?Q?qFaShyGBQNo2JJ5Jz3DCsGnX4BRt9GLQ7zOQsSGpJCH4IVuNMqModgAWWRvv?=
 =?us-ascii?Q?NgSkzDK9DRUsnqoBzmndMdn41l3OXivDmC2Xu+upV5aMbuNCfuyyNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5GqjNh/sSkk57IG21ojxgqTGxfi5I8tkK786CXPRcvnJgizlWBAhJ34wttx/?=
 =?us-ascii?Q?j33W5LO218jgixspTmwKQrNkg9EF1HhloQS0o2rOFSD/ZMDqHRI5+ENbSUdD?=
 =?us-ascii?Q?PPYJollR3Y78kGdkbyb/Ws0P87OvW4Obp0iO2XttcTzGObQuqhuVLR3b1ha2?=
 =?us-ascii?Q?FvKbI403oC1m2/u5hNTVYzItiMoespl0/c+NySZMhtRg8qjGPSyr8IV7wbnw?=
 =?us-ascii?Q?Dg8dePCH32CmuPIv/DbfaoxQvdoggd/bXQfpk7wHc1Q9DSUZOfdNDk+8786x?=
 =?us-ascii?Q?eFv+KiGDWBxtFqh0/L7FIrP6wGrq8Bp0BQ95fAdZhwtAjdunc2s2lrxU++WF?=
 =?us-ascii?Q?UVlBeCRVhnn7x0n0Wgf+aC5wAM2izPiVuqYZWtU8hKPqeQt3xFDJf2cXT3D7?=
 =?us-ascii?Q?1IrnNFGzzKGk5PasWUAIeitbE4g6ZBfzWxSCVFR85yVX9fHXvlvBDSf0tJh9?=
 =?us-ascii?Q?bxFHm4VIibple+uuoj7NwvjSc5Vfb8CxxIraEffLJiBVJ+i+g9K52HYRgHXk?=
 =?us-ascii?Q?o/IpJPSErk+ud+oKEYB2yk3Q25ZVKe9mJxGwxBlh4tVWOmvJ/cKqptyMJ5kb?=
 =?us-ascii?Q?idlGwm+TE3UiQ+ZupYh4dM9l04aL24i7CKheCByTycDElxW3B5Xt7IiBAVVp?=
 =?us-ascii?Q?Zrm6j3oZiGSrOBVI08U/ZfPLeppTwPC0LNOpPUUKPC00Yzjk4Sv/ML6kHYJv?=
 =?us-ascii?Q?nu3Xr7ke6bEY/ZlIosmR8pepv3iVdEmQASuONsDDUjmW1K2GN6hXc94sgGd6?=
 =?us-ascii?Q?Td8bUlN0dFUb0Ftes9va/vz2kYEhfzRS5zvUZiCZHmqeR5WAdMHEKbJzRMSe?=
 =?us-ascii?Q?nmGxf9IT1jYnKx5MUFwtE2TII/UtEx/862zVEke2AMVsM3dCS46KYuLro5Wt?=
 =?us-ascii?Q?Vb6UFtbdZD7SY4xbWYV7/DELI/bRYVQ20ZlGf1GnTCYv1W+fTDtemGq5GIVC?=
 =?us-ascii?Q?Jg/Zk2xdrN0dOZMQ1UztUEPaiXRQrcskW5G4xKovcy0Tx160PjcHDlHULAba?=
 =?us-ascii?Q?XokF9xIbxaqbCZs7wBUQE6osEy6NvApOPWwAmqvdwt1GfpLKX6tETD0zupC8?=
 =?us-ascii?Q?39ok/X9NyTFbWxiCBmPi8yOA+TG+y1dfK8a/pwAFlwVCMcdcYJUaSNbJ/+nG?=
 =?us-ascii?Q?czXuog9rAI7O801oO3gSM3DfV2KDRg3F6xuSnXLoilYbKnBqYFZ/4YlLg332?=
 =?us-ascii?Q?nhTdMw1ZbmjZReUVmOAqQYhxK7YU0Q3Ql6ria5uAtnHaTsI1crgU8+mWm188?=
 =?us-ascii?Q?3qL9ldOxj8O1Iq4T/Z9Kd+2u87cjZA1cA7nbMlWpAFbt2bkLJsWNtrCS6bau?=
 =?us-ascii?Q?kO67FEUhJ6cvv4o/f/Z1Lko3E/Nfql0Wq2YkUYhyFAzscLaZR6J6dQqRaXiu?=
 =?us-ascii?Q?NOta2I9kEid6/RxjqXg/Nh7PO3UU40srriiVPUlvE0iflJyHpXx3q/eDk01P?=
 =?us-ascii?Q?FK6iCFS6KhDGqQB+nGP/Wx3a66njaw4NKxEuguURDTJlvQPVRlQpW1SHfQnH?=
 =?us-ascii?Q?Z8wiwu+7haYNzLzLeptvin1rZ4sqGS9WeVlct01q1bZ+eDk2kKH7B4oTdE3Y?=
 =?us-ascii?Q?mIMItehbe2Be7O/4q07oqPUJ/BEwa3UyQGdCcXSu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1927e0-4286-4d8a-809b-08dd9dc54b90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:54:46.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX2lo4eL0WSA9a04vdgulJePRBEWz4TTuA7Z6i3VCf+vcTBzzTbWGH52kyfwCVONCgix4nB3SMa3o+d8Q9bfZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

The i.MX95 NETC supports SMMU, so add SMMU support.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 9f4d0899a94d..e9a5fb36f5d0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -494,6 +494,14 @@ &netc_bus0 {
 		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
 		  <0x80 &its 0x64 0x1>, //ENETC2 PF
 		  <0xc0 &its 0x67 0x1>;
+	iommu-map = <0x0 &smmu 0x20 0x1>,
+		    <0x10 &smmu 0x21 0x1>,
+		    <0x20 &smmu 0x22 0x1>,
+		    <0x40 &smmu 0x23 0x1>,
+		    <0x50 &smmu 0x25 0x1>,
+		    <0x60 &smmu 0x26 0x1>,
+		    <0x80 &smmu 0x24 0x1>,
+		    <0xc0 &smmu 0x27 0x1>;
 };
 
 &netc_emdio {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 632631a29112..32a91d7b51e5 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1861,6 +1861,14 @@ netc_bus0: pcie@4ca00000 {
 					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
 					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
 					  <0xc0 &its 0x67 0x1>; //NETC Timer
+				iommu-map = <0x0 &smmu 0x20 0x1>,
+					    <0x10 &smmu 0x21 0x1>,
+					    <0x20 &smmu 0x22 0x1>,
+					    <0x40 &smmu 0x23 0x1>,
+					    <0x80 &smmu 0x24 0x1>,
+					    <0x90 &smmu 0x25 0x1>,
+					    <0xa0 &smmu 0x26 0x1>,
+					    <0xc0 &smmu 0x27 0x1>;
 					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
 				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
 					 /* Timer BAR2 - prefetchable memory */
-- 
2.34.1

