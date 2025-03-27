Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B781A8F84;
	Thu, 27 Mar 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091315; cv=fail; b=n04XRoTCe0pKaXLJNx40GYC3bQjngS2tvjZENO0JhBeADtgQ6VFHM28y7M7gxw4OHVvP8lPvMntZCK6/EfBDQzyVGPN+iWN4RX+mLrH9XYXqpVZXK5KxD7FnBMZYjnmmHBdUgYlhG02UGOkKTATkRbjL3reB64+YhIt0FO6gyMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091315; c=relaxed/simple;
	bh=P/8eJrkcTFY7ffdI2HOmtCgr3XLIYZOp0fWAXup/EXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dTdFv2fkHfk5shuIHXTDGzGJQcVPazl6CJV5aVDXThIOYU3ByaVEyucHDar9OUchcdxOFlF2hQSKUB1CITkSVCdTEBbFlD2Z+/lGdVN/Ti1G7k19PBXGVbuIZfTuj8KKLLc73BQjXZHkjGIiRcz3lTtYl29hzKF4+utRz/hKg20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EgPnj9fC; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EgPnj9fC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzwOxtkdr7UKxjhCDdcFl/9NeyFKhpInePlG56zzYTVFlX8iL4rLqGoCE3KBDPt+xDlWzk4gBc+Y93MKNUspYJ0MeG8GAvLxclhs+EXPtZlX6lGitournbBAiQHNpCja+/4kuGfjBGmO3YgZ/b0o7Hw3s5LJaQyJR52pZ+o8j1CH3J/GADUW05mhGYAMB3D38elUe+Kol+5Z9aKpVvRn6GwxNNke87vQVRSCpgUTQyrxCLIJ4JwW6Dx7bpKoe5URwYTtAE5vLcdDWxfvlg1t5+4eZu7jbNIKGJXM5/CmPPmEYOY1TEbb0EIR2dUCclA1PSMa6Ie0BBXFd6QB/tbjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjoGlCh1TsgjiyPECYjuwmpyGsscgipoHdAUUxeAyFE=;
 b=Sxjy7NV5agSKhcVBGe4LyVIR+a0PUrcfQXS7aIfVL3/Y2US/OcabSkFOxQFaBay2hNv2D9hHaKv41AiTNTvZWG6kmy+onu2WxEh3RUXt0tL1EwICUHuSTHlD3te2JL8hlajFn9i5QCmdLSmTJ584Wna7J877QhfD7m7jySGLAiK8RIxmXEjR3Nb9jhwxORUTLc3Mp0Cd3V8Nql5RB0P3gkGmGnzokQEDvqOMWNpxKkLrcjJpRQkeVa1HyfLnn/mN/noTWo3sXSN1OJYc1sLBHNq4N5+e6ag4zXST7Qz9f6oOI4AcnniYWAd4259UZpASMtgXp6LcZnWynusn6V/vmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjoGlCh1TsgjiyPECYjuwmpyGsscgipoHdAUUxeAyFE=;
 b=EgPnj9fCbgv9CyorLECBCO/cCbUxCLdLScEgP1k+JAswjMVUM1p/LPzse/+bGzbrKkFOzcYiY1dqGb0/Dug/G4dm3PO3KUQikdiJhwfDQgWIR9jgJXYlv0EgW5xWtRZbl87vj5GN6foB8AS2Y3jfwywPodifgXPV+dQpujH1tuWPyrJMuarAHPUtATNby8rOQzNIP/vb+MebR6ZRq8P4xHZZSJmJqp4zJk48Fe6OghmBxTC71p/EA4e4VGectOG2AL7P6WOupSItM91XVzgqJi6aTAiU66Z15oFvcFk7OOkobFyD1sY9JtFs1b1MuYWWR6rX2hBl19OoMJ4ktm38bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9241.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:01:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 16:01:50 +0000
Date: Thu, 27 Mar 2025 12:01:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/8] arm64: dts: imx8mp: Add pinctrl config
 definitionsy
Message-ID: <Z+V2Z296gJsl2U+V@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-2-4e89ea1676ab@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-initial_display-v3-2-4e89ea1676ab@gocontroll.com>
X-ClientProxiedBy: PH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0789e96c-863b-4e91-4cf3-08dd6d48af7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YQJHufppB/KaQgtEPP+r0W7RRviuU1/fC5ncVok3u+GeiNirTp2fSNw/yB1z?=
 =?us-ascii?Q?dfi2oxxSelOwTKstHyvMTX6F8P/FKFGg7jwiFqoE/FiLUVT8LJcAYCve8GBW?=
 =?us-ascii?Q?k739lPEmi4ydRHA+wfMS1y0+OQTUGxT+SHP32OlIvHaoHfj6SR1QxrxmY2YG?=
 =?us-ascii?Q?wRj1feGjhE6ZHBDDCMs1Lf3Tgtywev+fv67lWzmewOo2ADYWZ7obbA5sIwa/?=
 =?us-ascii?Q?aA/zOr0Ge3RdDOWOK4Lrd8nHOKbHnw7WZDh7XgyCIXPEjVKC8Geka5hxzpZh?=
 =?us-ascii?Q?xiTU5c1ct0RqzGwdO7+iFxhYXrZOR3cBzbKpne26fX0pmZupIC9c3Osr7SlS?=
 =?us-ascii?Q?eutJPUl26DUWtGig/dukjQu6b+HROI7iMO4QbXRMHxMT2d625QxIZbb4oWyE?=
 =?us-ascii?Q?Y3ukHHCTar47CbrWnweF8nXx+lne8dEEVT8MuCV2Z+g78nkMXTWJHrMcoFeq?=
 =?us-ascii?Q?/nDhwPOKWeyXaHFL3tutDfaw8Yx+NJdoScapVC+17gOAKDUkZWZltXtezDwZ?=
 =?us-ascii?Q?jAvOrrejdtkTrmulWZliwzKLJ6l+VQ+KyBEnjeFosyVrePLODTtknIPIEo5k?=
 =?us-ascii?Q?VlUOp60jyrMVBRwmRrCwddj8n6YtlKmpS2uEZIvwMiemd29gGAktjTl9k46g?=
 =?us-ascii?Q?SgGH7KZQZXYREhZdmU0L0qkEUecCwGbyTurnC4HLhuxmgh5Jq7n9DoHTbXcz?=
 =?us-ascii?Q?AxixVFT5sx2WzczMUUsU9pK/CdxehfQrkt3VsUry6E0GB6n0jmkvqoVFnF5j?=
 =?us-ascii?Q?xIVnNyVfSxVaJS3N0bZzDRsiZonr6gF9RNheSgJ0drobN/j3UMWI3iC4N1X5?=
 =?us-ascii?Q?BoK5uvh6zHtYfzxCqXXG/WCITJBKCmoGJZ4S1Bf/NM98GmSoFYH8jy18dpno?=
 =?us-ascii?Q?TR6z5Q8e8ag6Y9kfxK3w2r2ux+0Zyl8k1h4jYJQANv9WVE6vjq+v+sQqqdIJ?=
 =?us-ascii?Q?OB8L9QysMC92vvG2fRmiJXioLUHjR1k8ngEyv1ooggxoySNsm33kig6Rfco1?=
 =?us-ascii?Q?RY+uIREA1qVocyJQIzX5WOuXNP8u8W7hdEr0Cdp+F7Um9rBQxHX0ktfDvZKq?=
 =?us-ascii?Q?hQPo1tL6Ljv9CMVmqXxwN5HGPGDPADr1X8a8A/nZZ0N3hrr5HMVgswOdnypu?=
 =?us-ascii?Q?Y2nKSp9gB3YCg9Iw0vahxoX52vblNGDrmkkH4SYIV5H+Iy1nm0IkL0HinUR4?=
 =?us-ascii?Q?ctIkR4pO7rI2zOCMVZbpI7G5+5ki6A2VRjOEvmV4xBnLlRsvtrpoiRXNgqiY?=
 =?us-ascii?Q?Te/y5x1hckgZ2BVDNEABruUtJ2lkXat1yqydnLNx00EHOsz9yuxr3aDGQZRj?=
 =?us-ascii?Q?eLnvEuBCpPJSjJca/4w0IiC3AUvV1/gGGk8vl1LKwHJK8Fh+fEAQpFXg1MU7?=
 =?us-ascii?Q?lESlN5AvjJC3IY2BmzeSyG53SG9Y3rVoo1SQf2qPGGlVvhLc30ZvCKtbQ/ps?=
 =?us-ascii?Q?EZbwh5xCpb+2/XgoFSvpDg+rv86X3MON5LAyr+DKdlJZAXVSLeNK2NgYM32h?=
 =?us-ascii?Q?KwWuEAl3+fKa6VI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jb7G+tu6hvQMWWS7IjBnvw/C8qa18WXohLLK+8Zvp4Dvcj1LSvbpnzN7Z3Gq?=
 =?us-ascii?Q?Jt+iSQWTzaD+O1Jv4P4577+Z8/3ECdwDBgApq9qnYn674gF0UX48Ptb+fSSH?=
 =?us-ascii?Q?MPCrrCvot3Nuzkhlf4Jv4XxZZNZXNFvpW+D/jnMPWR90xxmqJ5gAaYq12OFH?=
 =?us-ascii?Q?N6xQLvJgz6MceeaLe+wR3IoZkf7c5zAjC/y870chk995qaqvvCmr5vGGvlrG?=
 =?us-ascii?Q?bE5m3HD9I2/npV+Ts+92QBn9jfwWytVoR156ICgayj6tj7zcWmvCXVT+lrE0?=
 =?us-ascii?Q?z71peLrUY5ZQo215M7zD9OyBOjjF/aCAlkHgIFGVPVtvw4OZTw3S4KeUXWyf?=
 =?us-ascii?Q?hgI+W+yoplU0bpn13ECFk0npn1FRzYnLLyUshBHQHblWnJQ2xnAFImN3FHoO?=
 =?us-ascii?Q?MfD+ZRlp4Myutpk+pvzNOdwfvAOkUaU1xDxtbiFD/kzrURk32uxI0Iq1ZPsq?=
 =?us-ascii?Q?P/wyrMOjzb3aH9RMSLe0nWZlBNDjPKSKytlE6SUVnIFcSWBOCVV1o1CeyMWK?=
 =?us-ascii?Q?AeaBpcsUh1GBMzPtUeARGeocqrbUeXqoL+XLP4sMFr5ZEHRN1TP1yJCW/x97?=
 =?us-ascii?Q?F1mhYo3JqbMaGveZfxgVH4h2R318pX+QD42QYTgyy0Y9CAJeHrRpb+qEiT7X?=
 =?us-ascii?Q?9rQDZduTMX3ZN0mKU/vPexW5mLqzua/uKXYVMrwVTk8wYUDQcU4K868rIuUu?=
 =?us-ascii?Q?sOlRBZPZFFWFPPBT3pZ1vF5R+xG+bDzvYC8W2tLUvzDaortOfvlv0NsOE9Ht?=
 =?us-ascii?Q?ndgtGuNeFfvr0T3EtpNiHimNPOXdoaskTXiDcHewpDTc4PPzoBeNr/3mRzDY?=
 =?us-ascii?Q?V7BenFiVOdA3Nx98dj8qj/H6q4bhUtgrmTWf30YlXbxgxhajqhQjLiFcbdAB?=
 =?us-ascii?Q?M5ZP6A/9fWQgmU+MmMVpHkECZMwc/EdengkJCWRvgycjs1DRYIQBFpm7DE7z?=
 =?us-ascii?Q?09xS2h543uGZGhN+2oePlOfaDiWH2nepIV5/9eE44qrURCGMzLeqM8hp2ovE?=
 =?us-ascii?Q?ZC0gPmz3XTsqWZaVE6Aw3ohTNT5WGHJskjzXPHJA6JrzCFC+5AKokDzPxQhM?=
 =?us-ascii?Q?DyoRmunw8wOPAw46w47XXBCCrZGdTZIeKTMdUtUtuY0vVeFvMxiY2CBHWTtN?=
 =?us-ascii?Q?c5e4Xe3l9PgK8IchaALFiKnYgITze/6i5qlj6+pg2XX5l/tZtah3poy4m6zB?=
 =?us-ascii?Q?4PGZEGjsSXAlYMR/ufhbPrqrGOfTTCpEEe77YoerBHayvvX9XHm/qq+qw8pj?=
 =?us-ascii?Q?GnbK56tBGpWz3GRyjD9fs1r95z599XEmaNFfYHpkA6KtnQmLSPTUAxEKZdcI?=
 =?us-ascii?Q?6oU+L9O+rKdnCHdfm5ScvCbbaNayfuiNW2vYo8Vp7a9PmToRl3XljygUAPMf?=
 =?us-ascii?Q?We0G09IQOrnn+MSAPrDFAOZVy5UbznAWZRJuNotMm3fyqQfMW/35vHO6Uj3D?=
 =?us-ascii?Q?YdZik8o3/rXSfAeJp39Y/3pVLpqpODB5apUkW5ta9x6v1MYuEDZJImH8z6vI?=
 =?us-ascii?Q?5jOwUNCu+QdV/eiBjl0Isd6y0pMAVsVuwNX+F50qqmq39kJWKJzK4x9DGBNo?=
 =?us-ascii?Q?Tmr4C8ZYvzkiIYOtSUUQFhqkKgbz7+/BHUuOXwYU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0789e96c-863b-4e91-4cf3-08dd6d48af7a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:01:50.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nXqwzUM7pL5NMedZuH9EU+xJrJC/rrh9XavlNkJFhD3Z3d/M/ojkrQseoAw4Q2shVwnDzdW8SLwMvz/w3+Pxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9241

On Thu, Mar 27, 2025 at 04:52:37PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
>
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 0fef066471ba607be02d0ab15da5a048a8a213a7..34a6d3090926b8d9d7c96d1b0b01be0ed05cbd27 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -6,6 +6,33 @@
>  #ifndef __DTS_IMX8MP_PINFUNC_H
>  #define __DTS_IMX8MP_PINFUNC_H
>
> +/* Drive Strength */
> +#define MX8MP_DSE_X1 0x0
> +#define MX8MP_DSE_X2 0x4
> +#define MX8MP_DSE_X4 0x2
> +#define MX8MP_DSE_X6 0x6
> +
> +/* Slew Rate */
> +#define MX8MP_FSEL_FAST 0x10
> +#define MX8MP_FSEL_SLOW 0x0
> +
> +/* Open Drain */
> +#define MX8MP_ODE_ENABLE 0x20
> +#define MX8MP_ODE_DISABLE 0x0
> +
> +#define MX8MP_PULL_DOWN 0x0
> +#define MX8MP_PULL_UP 0x40
> +
> +/* Hysteresis */
> +#define MX8MP_HYS_CMOS 0x0
> +#define MX8MP_HYS_SCHMITT 0x80
> +
> +#define MX8MP_PULL_ENABLE 0x100
> +#define MX8MP_PULL_DISABLE 0x0
> +
> +/* SION force input mode */
> +#define MX8MP_SION 0x40000000
> +
>  /*
>   * The pin function ID is a tuple of
>   * <mux_reg conf_reg input_reg mux_mode input_val>
>
> --
> 2.49.0
>
>
