Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8C23FC47;
	Fri,  7 Feb 2025 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941848; cv=fail; b=F1wvtgI+YaCcaXs4T6jLEBVjKu93g0OjT7cBzbUfFSnFcKuSBm2L8Cz1Xod6ikratwU2vrKHtBpGSWfjCG0OL62OhWUWKTTTuwqa5h/SHS2R/WMK+asEh+unLLzE+xaDAxCL3GIVzB67a796AXFnW745le2TsxQBROEXJ7Gq7WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941848; c=relaxed/simple;
	bh=I5bv0n2TQ6+7VDIZnGZ171P/ny45eeatK47joSwNexU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YCqkijktv7kluUjCjtsWy9jhftozuBR2hrEKtDG1hshIcR8CBrG+7Jd3pnhgL9mIRzNDj23oGouJM/sUrSeY8DRZdq4Ugduzsj2tHkzL7fsf3W1eeqhYidgxS7FOcWvAT4CfBlvUxTQY9VPtGupqK2f8DvTMi2Udyw5gxRUl0Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kQCVTbYs; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kQCVTbYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLhOYxnOpOgL7gGQWfu2eAaz7kfcYw0nKJhbiZcxp3RA1XpcSzyeEtAJJ272loAHVuNHxFh0BfUeGZpPQWg98yMsgIWEoghORIIl82DyydaiUnOswxxBqyuqTDVTblQtpYu7xr1ckE26eul1QphhlWZmLUtDdLHhbViqa6GrCrcxj+hfMT1sVc8MYB/AGJB+A9hjrl55r+Un9ghTBZ/MVWsdQVD9O7RMgq85GVqQXGe0s2kv5W7qY5Xd2U2orBf83Jz88aYfgFI24s9yN21H+2/itU63158wK1I52iSLJllvwHzVWHdaygngIk0zI9UF2UoyE+BsKcaKPV5CMTG/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSAocelOVmuMIXnrWDNd7GjBl7HhesIkMlPZJpnWDE0=;
 b=EUdxv8DUiXSjo8jRd46y92lyXPF4oM7a8zkPB8CtLcOlmREzDSqIudmzg/d+wycZpLKT5Ql2M/Zs8VTMMFPt9av1uNQCz3AsVkiAak9krTKWQJd1pF66utY5PAw4DRvW/rbWft0kSuGpF10ge8A1b0kM+5mUwJ3668U3sBwWP/4KcTlwnmfK9phaO5sqrNXNlydaeY4dDaT0JOGqGPBpYRm1dGNZvRmTafGGqY4OjPDPR9GVMjiYFLT63D/EJv4cg2SobVTJnO3ipRvIS2RwMHyYMCRz4zVYgM5fCDdKpQyhqnyRhvKYiLCOeNiij7qqTRSapVRR3z/TffZWheaETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSAocelOVmuMIXnrWDNd7GjBl7HhesIkMlPZJpnWDE0=;
 b=kQCVTbYsgZvo9eHLlRgVDv3zHZABFBR3mR5eaDb2SzmsfWL4WbcpBm4RX8CRh7/+myDBYu23Z/R6rBoJa562Ka7+qzqcYPDdEam0iCAI/p+CbO72RzpnI9i58ky0YBeN7mGWg7/5CnJJQO7QcVnM1K0KrilMNlfegWKojwU3ypnOytzNgtI2LycscKRM7yRCU8rvEIgLAzDATKwlDWIX94Nug3V4XTeyzA/lbwUxMihwkvybI1grogdc+YlZsKUCqPT+jEnOcDnX1X2LMihHtLLgzIaT8HTMNcYpeM3HPe8s0KvgOyFjtu9iJHbxnyFPQLao9SqkriG7/C5j2r3VVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:24:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 15:24:02 +0000
Date: Fri, 7 Feb 2025 10:23:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] arm64: dts: imx8mp: Add i.MX8M Plus OCOTP
 disable fuse definitions
Message-ID: <Z6YliptvK/T8TBBv@lizhi-Precision-Tower-5810>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-6-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-6-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e09d7e-fa4d-46b5-9217-08dd478b73c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NiNIZH7+HOSc+IM96RQZkbVkI5yj5PS0HuGIhBAHNhsUREHiB4le5KuMMwo0?=
 =?us-ascii?Q?qmhxRmKqOVgJMEzGY/O6WwD+PI0nhTBOA1kCpULKzD9u0VV/aMunHmhFfUy9?=
 =?us-ascii?Q?QOTYLAASrain1eYro8NvbIgcH+Bu6t393ReNWmiXo5I9NgmnYndeWN2yBuWp?=
 =?us-ascii?Q?17F0nq7td1K/42FU8Js1ftpg3ebADZpFXId/z+ug5fwGzXxaXwHUP5C8SasV?=
 =?us-ascii?Q?B+8KR8BJ7qguc2AkGbaMXVn54h7sG0gpZ6mgyTGG3hijCTslROaQiMf2XlwA?=
 =?us-ascii?Q?cCNEzXteTXM8ktcVS+WVvV3JqhmVeyfljZscrKOsN3zsRh2SA5p59gA1sWMm?=
 =?us-ascii?Q?0uOXkIli4qs8ZATaV1ELGvJr7ig/ItZ9xuLgHbpooLj1Q2f6Ent6TfNyJGrz?=
 =?us-ascii?Q?DqmqDm5gVQ1FbIXudJLqtvbLSBSUyBQ22tApkASFMb6jOF7Yx64959rLgFla?=
 =?us-ascii?Q?4W7efPHEhxlgqPVWfRUDR1dWWHSRlzUMLcnZsqzwgl7QPKmGSggmbbVNvIjP?=
 =?us-ascii?Q?GfevATZIvchMFVEq2Xw1Hj5/nrCncc5THvpO7zJUyRtv8Mfa1wrPmkO/c3qf?=
 =?us-ascii?Q?8LA5lrnxP1zeMs1lyXJSuGggvphYic+9otZDT+7NqJGI1/9bd56tCml8Pp6p?=
 =?us-ascii?Q?aMyhyjLkrKDeJvaFER+/6ripUsA9L7eo5NQeMUcZO3G0rpGjLKi9YZ6aEPFc?=
 =?us-ascii?Q?8U/Rm5HWZuxPT8LjO9QLLVqORJJnCbHzo0jSQWvEcIxzJ9D6bUz2wlS2bwO5?=
 =?us-ascii?Q?gS2EJDKaSIN9PhZoFJWmwcxJgHRSTMAYfYjQ2spytVNulx+7xr+138n4jjWj?=
 =?us-ascii?Q?ieF38gNPA57fuv4tpXA9wkyRLEA53HVav9D5nes+znusG6hRQyktenVjQg3D?=
 =?us-ascii?Q?3KKOGgjDqLMnxuxkCNuuL4LmBI/0W5fKB770PaAEhZcL/Xa47gEVUuQo3kEW?=
 =?us-ascii?Q?8/OzhnotUVU3bQvJx4WyFnUbAxmcYu0KeWHqSm+wmrL4hM66p2J/X40/xR00?=
 =?us-ascii?Q?Hm/ZTPnOOco9aBwgwDyptEbSmgILm6IRE4px9E6o3wjY8NCwAK1prsICCPeb?=
 =?us-ascii?Q?9WoB7ME++VknxLgVgS4YQjJnZZkxIH/vOX/jdYLRHXQ2QbIpBpQcGjmeRpQe?=
 =?us-ascii?Q?GNlS4s6qHPZZ73gPi1w3dRhTBCXwJ3A6ce5VXwx+fz6F/f34dLIRIlRhwo/D?=
 =?us-ascii?Q?kQbVG/Ok1anOBgi3Sos0mVBVAy5U0ju34U2kghXN0ifbn18KOTWrsrwNuyx9?=
 =?us-ascii?Q?OdOTik5YBM806qmDK+WnqpxcfdytVOMKjs0gqyFz70/n11H5viR+DXk6qH6K?=
 =?us-ascii?Q?Q0xFsz+IhPoc7WPmUW1lZxTtGTRB1JPrbOj1s0500a5tSo0f+brhqmtV/JG7?=
 =?us-ascii?Q?mLuB8HAQ8cQ7aAHdsrNozAQoSlluzq9+v9iP0nnomPgyUWwppHKmg7X062KT?=
 =?us-ascii?Q?fRak8Pt7seSqjY7/QfyCWlaJif+J2+2Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KAdPNLai53r0u9TM/86o7GOhORx3s38AXpfBnVsTC8JVhxT9RP6KmXfkVhER?=
 =?us-ascii?Q?FzMae4LjWO+ZU6WQNL1/rF9wyw5KMEpA3Gz6Bt6yxNIRqzkmj6jFeVXVpuX3?=
 =?us-ascii?Q?Hm+/+t63spKvYk7Gb4zrQ+8cJXO94RXFIyWSsXMF0OxOKrVY2LGFDDc0o3Rh?=
 =?us-ascii?Q?/0ICQ9mGVZM4tLT2PRtBYVRfLpaTCVUVzGNtHn6JrW6Op1y2uGA1UT4mZ4uG?=
 =?us-ascii?Q?LZDvbOFKgnuCnJkU1qme2ykjuyQsDi96dlLy6Y5RtNwiusp8+3exRshsw5ft?=
 =?us-ascii?Q?zq8I+4EJ3/4+5ouitYV2qOrIMsAvB0Qv3u16a/Xi+SIRlRqnIxO4Ltq5y5dC?=
 =?us-ascii?Q?Ux5UEMCGyjCADc2tuLU3XhzzzdVF3gIgJX13Dsmx5sIhNHVExqVAL0WEbmMh?=
 =?us-ascii?Q?CTJbqySaeTMWKGcQM3nYs3usD0pV+pcbU5/MjrQmedkwPEmGo7FS38D6TKx2?=
 =?us-ascii?Q?9qcfeYU13qLDk6omjxzHcZX2Gusb8nMTw9GckdU5bPBTl8DPwtEGpcFsm44g?=
 =?us-ascii?Q?3FhzI2awXwqSeWQd7kGyyKDRnNhp5z5U1Jiq96WOkJtfOvdmVFIMhX754u5Y?=
 =?us-ascii?Q?vHpiJpllqWVREijoaj8YWR59J7VC4gozx6d7o6oS3y8AWMrWOOohs4bI65Nv?=
 =?us-ascii?Q?bwLrn3ikx54JiOOHUhSWtqkZ4HxtBCp8N63qc8JYWSVsD9uA8i1mXs9o/+hk?=
 =?us-ascii?Q?nNt3P1v5B/0EVNf/7zrgMzfpOZ7RcOoGgJQ7zfNGxL5dN7lnLJU90RcEaTQy?=
 =?us-ascii?Q?7VA6tHjICUFvNX2Z6y5EW/s3RV2Q757KJ3/U5AS9JrhWLwvJpC9fVMw5qzRN?=
 =?us-ascii?Q?vbqHBUvwyC6kAuY6JqkGRPRsShe9nBj+hLp1ZSWGIHmfZ4n2+OG5FXb8CXTt?=
 =?us-ascii?Q?R/pIVdsLUZ8uteq++jt2p4uNyLA0ST09nSRrVe8HZRyfZFnxSGQUjz5l+xA1?=
 =?us-ascii?Q?KBVc1xfC5u6UZMQNJyIXYA3z3Wp/rdiwVcxSjWhB8GujPpIq8kt/ikHxMXx+?=
 =?us-ascii?Q?M/VAo5ssdxXHZWAbtGKHsoHoq/64pIZPQMrLBpnOSBrdIEBn4h+ykMxL+mIV?=
 =?us-ascii?Q?rrHMfqxJgANllxgLXiZcZZDkzyD+5JXTSul7xKLJUkIP+CEc02KG0YCjFtHX?=
 =?us-ascii?Q?cWbBdXvJyKu3XYaEpJVxDhIwg29CDrtaYpzWvyyK5Uq1RDYNVEmyOJYjI6su?=
 =?us-ascii?Q?1MEShosPivevLsz7WaD/hoMoeI4RKbrtq+8qHIFIZ3kgKhaW9HV1Ym84N91u?=
 =?us-ascii?Q?7sVzjPsc2S2wQGhIWuoGowDraHNSJT6gXGCtagW6miznOWGiQqvHcMVb4QJi?=
 =?us-ascii?Q?bmK6AsZdRtCuhvc4HU2+PEfHkul+cPZbyNj1ubbeF7FRmW3RBKdVXr37XWGp?=
 =?us-ascii?Q?LYJ+FhhHsMTi4ZBJPNE0SYNauB552CInU/+PHda7OGj0f6iEASXPh8nIyNQ2?=
 =?us-ascii?Q?9EFlDwnIqInQ/bxhEqpnqrm7QTXWVfNs3oFrRZFhrYzkB9ZYFeO67aNuXFY3?=
 =?us-ascii?Q?hHoFfWNGHlGMh2C9YSfrXvqMygf6bdUx7l4UhgnADEN2nZfyGg5zrIYYVDQu?=
 =?us-ascii?Q?u0KU7EfDvXUb5w9jJ3+fjEhAd7pNcmq+ApU0dy3l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e09d7e-fa4d-46b5-9217-08dd478b73c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:24:02.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0HD02NRwRdRzIq1Cne2UnxtmA1Rp+3lUPirpBXcVRurpWkns0Ofe97yBjbSbaa43cERzfPrr2TT7vp0pszL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

On Fri, Feb 07, 2025 at 09:36:10AM +0100, Alexander Stein wrote:
> These definitions define the location of corresponding disable bits
> in OCOTP peripheral.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-ocotp.h | 42 ++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
> new file mode 100644
> index 0000000000000..c9f49c61f3656
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#ifndef __DTS_IMX8MP_OCOTP_H
> +#define __DTS_IMX8MP_OCOTP_H
> +
> +/*
> + * The OCOTP is a tuple of
> + * <fuse_addr fuse_bit_offset>
> + */
> +
> +#define IMX8MP_OCOTP_M7_DISABLE			16 21
> +#define IMX8MP_OCOTP_VPU_G1_DISABLE		16 24
> +#define IMX8MP_OCOTP_VPU_G2_DISABLE		16 25
> +#define IMX8MP_OCOTP_CAN_DISABLE		16 28
> +#define IMX8MP_OCOTP_CAN_FD_DISABLE		16 29
> +#define IMX8MP_OCOTP_VPU_VC8000E_DISABLE	16 30
> +#define IMX8MP_OCOTP_IMG_ISP1_DISABLE		20 0
> +#define IMX8MP_OCOTP_IMG_ISP2_DISABLE		20 1
> +#define IMX8MP_OCOTP_IMG_DEWARP_DISABLE		20 2
> +#define IMX8MP_OCOTP_NPU_DISABLE		20 3
> +#define IMX8MP_OCOTP_AUDIO_PROCESSOR_DISABLE	20 4
> +#define IMX8MP_OCOTP_ASRC_DISABLE		20 5
> +#define IMX8MP_OCOTP_GPU2_DISABLE		20 6
> +#define IMX8MP_OCOTP_GPU3_DISABLE		20 7
> +#define IMX8MP_OCOTP_USB1_DISABLE		20 8
> +#define IMX8MP_OCOTP_USB2_DISABLE		20 9
> +#define IMX8MP_OCOTP_PCIE1_DISABLE		20 11
> +#define IMX8MP_OCOTP_ENET1_DISABLE		20 13
> +#define IMX8MP_OCOTP_ENET2_DISABLE		20 14
> +#define IMX8MP_OCOTP_MIPI_CSI1_DISABLE		20 15
> +#define IMX8MP_OCOTP_MIPI_CSI2_DISABLE		20 16
> +#define IMX8MP_OCOTP_MIPI_DSI1_DISABLE		20 17
> +#define IMX8MP_OCOTP_LVDS1_DISABLE		20 19
> +#define IMX8MP_OCOTP_LVDS2_DISABLE		20 20
> +#define IMX8MP_OCOTP_EARC_RX_DISABLE		20 30
> +
> +#endif /* __DTS_IMX8MP_OCOTP_H */
> --
> 2.34.1
>
