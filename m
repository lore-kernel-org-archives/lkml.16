Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B72296D0D;
	Fri, 23 May 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017070; cv=fail; b=lyHS6blC57ZEAdOyPzWVkytEG514PmDJhMv449H9PfWDv3F5BXH2bn+oRUxLAaqiz6O2NynQ5AEyVsPuNiLM5HVTkjYVLn5m2+nz9K1ADBZ+fxGaXkRTGe+P7NTyDKlNG4pM/xNIDlFwI6eIexEWKaNhxtaV0ErtrI1sL1QKtZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017070; c=relaxed/simple;
	bh=sVFhXaBOsj0U/SQTRsdnJ2hKyDquU1A2MNA6+x4YtrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHV5E+ZrpQ46EuT22OfYJQitcTPJeWmoyaT+EdGmIQ+FxDE55OfPtnMhrKrNG6h84j4ZA6crx4FjZrLCDUaWqoePKyEMX8hwR8IHZy+9pX/C8pvXe1EnvxdMoSdilhFN0Lds9GST1gVTN/0Zy+zznALfxg+6xIBgSGk3q5K2Nbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j6a0NORx; arc=fail smtp.client-ip=40.107.105.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j6a0NORx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkwMb0Kw4uLuWYHP7CCF0Cpoq7Lh83SAYWHeJ15pVqJZxlkleWq7x5ZMkexadp2UIOOhYkuor3MduVhkAnlYN06N1HHw12XbwUiT3BL0aQoqvmHgIWTTbnSc+2zpWPNITuCB3gAg1/MKTv2feyU6tUk8L2SbcQzIgsb6pU87q41mOEGqI1O/1nV/VWUaS5VMYQArTATupSliliRzS4lrZ9Ra4y1O+gYoPgBVk+dsHsEelsKwKGtkl/5O8sdJMD3CQGOWF/BJwLQ4XnX3zu8GQWutkba1o2gOIQ3/bAxKEKSTRufoyemxo1QN6GH8DS/kY5iWlF8HTe6vBatIZZX6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LkMebaclMd1+Q1uoaItYBND9qdmyvCcCVNADRPJyco=;
 b=JkAZtWP8YQVkaD95BFFN69p+IW4ykI4UfkgwyDxo2XIVO3GRCHfzDPVkmjdjzXe2diGa6zNVKoOYqU6VPNdiA0gAKlkuOajqFjt8YnJ7o++A15NrcdnKt1Ejtj3uHIQCJkbqvcEI2DAgvICA/nLryJ1Fh2uOf0qwX3DRF2In1pghMIRceNFot73gq4udO4nUU/lOKPDXaJaEbHwm02oxQGRXYMwYBmcNTtrcow8n/yWh9HI6834qmgjCf6zTqFY+95yUHfD7W/frDMV/TwFvq+9ulDwmnEJAGv0cMhT1aej9xiUb/w7Wjgw9QoEMkW6od+8jC3GsmF33QY1ozG/15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LkMebaclMd1+Q1uoaItYBND9qdmyvCcCVNADRPJyco=;
 b=j6a0NORxa9Y3wJEfI+f1OufvbdM0G0pqH4mtu+sPvctP+SmVw1F4O8Rx6K6ljqoP1EUp1X3nsp4P+Sqf/3O9zEDwmSKfIPtPbjb0TOdwsDA7oRBgbZcuyKsbn4OmPf6fOYoipY6+x9cgWVhAFfnBSBRdWwsUc7rxO9p22eLWFiV2EgPaiFrYbi64tm+svdwbf+zf8Yi0hrQpjmF6A6AhS1lfy++HY5SLZIVNGd/xPVXrnFJ4GAy+HrYoeLht83jlYqEVmMkvAy1gxW+cIlVD9AyrO8ZEWypcAUUPNYslvCAeGx6G8RY1rcLmCmPVLoLvVr0LH8Ubg8jrfc6Es4m4TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 16:17:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:17:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 2/6] ARM: dts: vf: remove redundant pinctrl-names
Date: Fri, 23 May 2025 12:17:21 -0400
Message-Id: <20250523161726.548682-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523161726.548682-1-Frank.Li@nxp.com>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d4cbc9-34d3-42c3-ac5b-08dd9a155a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TKUKPQ8/L+IoIsYbxrORvTxZzse/eGNEGEwFH8zAj0bPtWW5AsQ2QRv4jwMz?=
 =?us-ascii?Q?4fij6BautPvrpNkYnkucE0ZKdG/HeV1DP1v5x56AhKE3f2rRNqHF/KS/aei3?=
 =?us-ascii?Q?Sgmm0Wwkd7DbEs0MMsAiJDzkKvSttQg5mV7QD0ScTR1NSugZhCf2zB5s/Ejb?=
 =?us-ascii?Q?tdvFIG5/6E/JKXv5wjVP0zcFPjqumnncp5l+us+5w/7F4BPoGrg0sXj39NJy?=
 =?us-ascii?Q?chiHRpn7CEgs78gnswXHqvDUvCsF9TmJcDsl4866XDxfolhcZbx9vjIBz9x4?=
 =?us-ascii?Q?yRvb2VKrgZ0ESJHcVLPjXBjRRpv99TCYSMUN62SzdpiN23fo7HwcreXyMA7q?=
 =?us-ascii?Q?86/QyFscL/+SWKS0lXM4kAsoH5qJqqsZxUPa+TnYclYs0jiXBGQSs48Mdfx6?=
 =?us-ascii?Q?U2r5Vms6Yq0IUmNLoHn/ZTJd+3flAxvXuoWO5SlotPH5F5d/HSMxz//3/7g+?=
 =?us-ascii?Q?9sk9pMYCBwSKg7fZm1kpvkRmM+zIJu38YvSFhQhaqBoQvevuqzo/8ICVSZJr?=
 =?us-ascii?Q?ACjyqgIeGa3NzZNXyzFJm6o/kNb5KFwvcl+tiTrUuCL5HPP8rMbb1+Vwi8wP?=
 =?us-ascii?Q?9mN+E6g1h01Z4kmtnVhSr4kaMdDt3zlDI3TtkxUOJAMoTegfOe54lPc1+xS3?=
 =?us-ascii?Q?Oq8H6xVFO82Z/AuARpYChIxJk9qDhh/wT3TR9J25FwXq+lXW8FCPbssvy2Wd?=
 =?us-ascii?Q?0stZeLSLSlTlAO44Ub33s+hgybqz+Ym6rmrZVOqYpiOjltfEm+u4eTMelYZK?=
 =?us-ascii?Q?klaFMdtjFjEKYx/dIMbEYBSVsVOnOxb+ODwfyMVMmy1KPOTnyqFnDq8zssFN?=
 =?us-ascii?Q?WPNLkw8VLwCRpuwkn94BNC2GLRnN1ovsNEeT6KNxLqL4eW2slEnLGa/GI3lD?=
 =?us-ascii?Q?/hUuPe6DzcW0QdW88N/O/YBjzZfEZn8jixZAhnHnJwcZr6P1HqxE4GLT3hQx?=
 =?us-ascii?Q?eYWdPnSQNlL/HAxwRhfnf92NLtD0s45ITh6Qro7na2xFBL3Jk8aUUVD0AgvT?=
 =?us-ascii?Q?FSxEp2br53r65v72n0LPXpD2x03t5xpVe9aXh/cvPVdnBCtVUNYhionlF5Zb?=
 =?us-ascii?Q?oa0ntYFxxSMzoYE4EGynr/A01VJvUsXwAgdLVXe53vqHwuCvpjOZUiTcjJBv?=
 =?us-ascii?Q?8XnegBVMDItuoNodn2/5sPX/ckjYy08rY5NVrKm8kXD3G9M79b48x01aLS9d?=
 =?us-ascii?Q?A14qByPw46RP625dlSfJfgx8YmVmy/6fG+U4rUgMXIjqsPpXk2PAd5zgJ3QI?=
 =?us-ascii?Q?uRW29fMM5yrvKbYqsxQNCUSD5/HMRMr/aD3OscWuMgHqiRkIKkMTyx3apaMF?=
 =?us-ascii?Q?3TdpfBVlf0ag2sKPwWHY7dyPE12dn0XZLoTmtNmE6oSjD97uAn3enVRNN1Tt?=
 =?us-ascii?Q?VXiyMmIlOzmitBRaZd1BNeNpazgNnJGmHQio34kCl0gG4Uw8yfw/YC+8NX+5?=
 =?us-ascii?Q?bW030QOTiKKl2tXxdSy+6IDxZsqCAiuQqNsUbgjhlgNrOnZkXOeip+k6kq86?=
 =?us-ascii?Q?BLrKOkP6BJ31CUs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UTSvvsrzIYxNaOP3BGeocdtWb7hFDMJp9uOQTC3QnSGLUnPrgnjA1SjU+bi?=
 =?us-ascii?Q?O+wWYXa+8LlfkTWKbKN3eC5UY/u+JGrtsDhgLdhP4Jap+W3i861p7fo/qzka?=
 =?us-ascii?Q?tQAMSGJUsNfWEYKUPvzUpykkkUY/+OkddNz4W5Q2OaMBDyJnswAIFkaBC910?=
 =?us-ascii?Q?vFtm0h/qLCVx3Ptew2o2LFzvDplAzltlAly0I2m15nv11sj46v2pxbeQmLhv?=
 =?us-ascii?Q?tzzuIW3flKcLbeQwnRrJ1OITS/G1AzVAYWihTUFDHtqhgWUYHWUbv+spFgsj?=
 =?us-ascii?Q?OMY4U8sBX4Oy597T+1T/s21XBF8TnIY3JiBzlrLQgFs+7G3U86OVLs4W8O3u?=
 =?us-ascii?Q?p2G0a/Med4t/QyjEScCwUOyB7/yhqZuH9urDGK3YvCbXHVarAY8pi43xdU2f?=
 =?us-ascii?Q?8xf5BepmqWKGNZoJOgn2YZcZ8fum/LQDS1asoG47mD7gAbMspEugQuVuKnF3?=
 =?us-ascii?Q?oOucgcciXSPZ4ZJ3IlPMeky4HlGvkG3+aUdxDN4UZi8vVzgVYNHXI4DuJZQl?=
 =?us-ascii?Q?zkanc1JA2lLl3/WxWAMZ/9Hf20icKXmm/l9/eI3wHaTGKhUElJmLzoPRa/nf?=
 =?us-ascii?Q?sei/E182YzzK1sG9FsofNDVK74Gb0ipyyBwk+WbQirk/y3VvMf/x3Gcqmlzl?=
 =?us-ascii?Q?EyfSrf56SkyQcsoXw3Sb0Rf3Qi/BsMIf8dj8g+q0wUXiLeNXHuDOnlCspShz?=
 =?us-ascii?Q?GDbTZlJCtIutQbYHuUfFzs+Tqco4T4bVuZHliM5ASX48aOFEAqpjT3D21zHy?=
 =?us-ascii?Q?IuHHTcE5qRI+YZd4A1xtJupWeT7WdAIiBgBxB+2wVk6qnDx4E1zK36uWdW6N?=
 =?us-ascii?Q?V5m+mQTrRR0pVWLQPRPi/q5SoWUnoJhH8kRy6V9gWVw79AaWDlUez3uu4uCR?=
 =?us-ascii?Q?GCm5XzHRXdtYI/6cwQpaAtLmVfObF6a6CrANPwUer4ccBijOEoqn5U2pD6Dz?=
 =?us-ascii?Q?+dOp6dXBI+qWhx7UJHXSVLhTZAIcN1BraPdWWlZDYyVlQQrGg1vDIGYuDRIe?=
 =?us-ascii?Q?rSGIS58AzbvLALW9X+PTKLKt74d4bsZyzW5RRYMP5ZD3k0AOqaLHvE/74E0B?=
 =?us-ascii?Q?eGMhp2VNgJVQceFxtCbE2trHjAEd/75TEAeTEoZcW2PneG5uhDOfXMCeCEhY?=
 =?us-ascii?Q?Cjvi3bx9jNdVnabMW1/2XX6EtyaVFD21LR3jDvV4pxfyeAuqsXe68ea0AQdf?=
 =?us-ascii?Q?5EXvnfaWXx/Pwud0twyZBBq0uSKFl7tAo1Kusuc8zbqGzIpFpbpoNw7zk0v9?=
 =?us-ascii?Q?uoTUq+dkqahf3AvG4Zme9TE6BUgMi2rMzOpZoULKU48rOkIvt5oHbQTWtFTi?=
 =?us-ascii?Q?K1Hnc5f2QaQHz17TsbWDIxAVCQkZ46pJ3FT49J7VnvZrAxWqXW4XDlKPyPb4?=
 =?us-ascii?Q?oXX+QoHuqtxcnhCB6dGGKxTJfJusXmZlDYXhYLgtf2P3nqSTEdBf8IwABkSx?=
 =?us-ascii?Q?RMtShfRii2Y+Mxw/nX+h91E0sDHafwoQIpeaxE6B7nNlQxv5AZFqdZgvEKG8?=
 =?us-ascii?Q?S2tciovTftITqaTw6m5EqemMznSTXtC0o/2sgMLRh7ZQPHCJgLvRNpAuQFzt?=
 =?us-ascii?Q?w9SOwtlrPSVuXH6VZRb7V1nOt+nbRsEzi/LP72A2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4cbc9-34d3-42c3-ac5b-08dd9a155a87
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:17:46.4391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICsK3UiNW+fYMSYFXM9b2ZeCqxlCa7N66C8rkcE95ADVXcRJDYOf3I/Vz0B9o3B+L30AaCgyo3UrtrAK4nvoxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966

Remove redundant pinctrl-names because no pinctrl-0 node to fix below
CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: i2c-mux@71 (nxp,pca9548): 'pinctrl-0' is a dependency of 'pinctrl-names

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
index 77492eeea4509..62bd53917eaff 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
@@ -623,7 +623,6 @@ eeprom@54 {
 
 	i2c-mux@70 {
 		compatible = "nxp,pca9548";
-		pinctrl-names = "default";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x70>;
@@ -662,7 +661,6 @@ sff4_i2c: i2c@5 {
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
-		pinctrl-names = "default";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1

