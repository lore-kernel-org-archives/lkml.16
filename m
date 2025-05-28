Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DFA28C03D;
	Wed, 28 May 2025 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444882; cv=fail; b=NuC/x3u/p/9TubTA+74d8XPTdfSzOtoC3HBHoRHAFPNG6iuOpYYHEiTmzu1AzWMVgmVNw4YI8zqUM2q1Y0QYnnhpakqups3q8KNlNpOrK2Y5/lv7CWgDvXhzWG+CnSNmn5b98xw6s9/CxIbUOvNTufN8dXaXglqVe5G3+mervOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444882; c=relaxed/simple;
	bh=1VJNhRxjzLoiLG0jCin8+9p0T3UXuFMLQyQet3KyjkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eX2SqraV//wJPLx5bZSChVZPjw26xYhrX9sEfdfcaqgijo2owy9+XR1j3QjWg8mCfVNES0X4FRcpJJKF1+6s/0f4Knomgy+yA/UHSyoRb6DLbXXHtFiPgWlmuRBm4Ef1e+VFKMn5kTRDUL1fWj8bC3gx1n30H9MN3VOmS6uSkz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a/3FN3Va; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a/3FN3Va"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcNa5mvh4HjJKlNuXnXphNqr3tkvulJkU0ui0qhRflSPIIz7kg5RuamrlbcCZ2L1niGlVvaDcT/vfpejDeiLJQpxIPV6SNrszXXSe6ocXRO2BZ4HWE7lmMzJWvqjlr6E+a5stCtmNt5uBmeVbkxfP8I+6uCrYezExuK0dweXOyi918VpNLBJvINGpiSENKySQV0lsQzlcxg/4bD8fJedNh2eydt92wOGeAXeqGMow1zxnC9k0tFm/1e8644e53/Yr9Ij2k19GYMc5/BwkjNwYPIq1Kd85KKUt+0HjwVeQRck1AszKD3xcX+X/VqQuluRnK5wQErzHj+Npc8dJioyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVnHX9bjxUNxWpN74D8xyacIIk2WPD3cmokCGrrq/+8=;
 b=NBbg6mC8Lyyz9avF4aWYB8HcwUJttAfRyqzxbNzg2ab5NEG8LwjjY/8ZA1tYXlfVWmyuvDtAX2I6pjWWgZF6A9tb319VweBzYuKudSngCEwNdix8+eaYoJwzfEpfH0xTueYtn/m9JKacwovUL9PnXqSXta4bHeEQyCTQcwIZTkpyScZstObPbt7w+dkVOQbgsXkr3jurbO2/v5ndrzYxnAG3VIcx3VXqPhuGm8jg8Fu5+fYh7jqErogw+5wAmJyLDrTKj+6/4BXbMGdVpaTid3cK9Owb8Cbgcq1blt5KEd5VRE1fsraexaHnu+Z/8WTJ6x/r72PUrBmXCPvyP1j+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVnHX9bjxUNxWpN74D8xyacIIk2WPD3cmokCGrrq/+8=;
 b=a/3FN3VaVwQSZ1row+D8eOj5vjPnHK+9ad3X60kurzwE/p1sh5tm/E0wFigbEuHtwLNkUZw6/8tlhG2UHnYRzRLS9Tt5m168Hpc9mFsN+J3GZq7hwUSfUoG0I1/0wyyDiy3HdLRPZzwv8cYnZs4l/qd82DnS/YcMOv4EuqSKK17vM+NN939KV2e6ygOedIeEWfsI5iqxcVIIp3CGYJ8QC3uTF5w47x6pGgWYpBo/1CBoHmat+nCv7c1k9zqQsM8ikKgPhzmr3cB3qh1MRr1eVovY7DGU70o0Rc7pcGGGCRLxYcrnYcsxANU6AxUpSf+wDF62mxqj0r6Gice4ruQfsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA3PR04MB11250.eurprd04.prod.outlook.com (2603:10a6:102:4aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 15:07:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:07:44 +0000
Date: Wed, 28 May 2025 11:07:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: imx95-19x19-evk: fix the overshoot issue
 of NETC
Message-ID: <aDcmuyWySD3QNUaz@lizhi-Precision-Tower-5810>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
 <20250528083433.3861625-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528083433.3861625-2-wei.fang@nxp.com>
X-ClientProxiedBy: AS9PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA3PR04MB11250:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd14fa7-712a-4f6e-c14d-08dd9df96633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzX6M0oAX55MztK1QhxbINwSzNDAuY/otuRzrsbYj1PwMh+KuODRLXc8Lx/A?=
 =?us-ascii?Q?zXn5O+jMOauZlb2XItxtWfXzcKSYuJVS1N48EqHuk4JLMUU2jfHHZdTP3AW4?=
 =?us-ascii?Q?2iIJBL3a7jSTmczJ/ejtdca42eeZHgFJTob/062sOuYXu4PM6mAGWQ5SNcE9?=
 =?us-ascii?Q?qFztUTC0D7lcdZ/9ZLqaCRMomVGuLAzCoVgmZZP3depu/zETX+25gyhU9uT1?=
 =?us-ascii?Q?kVVBfezOvdItxSVT5LQgsQgPk3nO7NrNWm5sMGJpsfmJCAeHKRXh6CXPH3Fz?=
 =?us-ascii?Q?XtN09+SJdhJUWJ1K9WMhm7eSq4KX2ohEmrrRfj7zX6FwT0PeKmxTVoVr83un?=
 =?us-ascii?Q?M6OZJNxHGIAKOSlhbZs5UlrTaTqTyjali51PzQIdt/DzIZxvBiN4DMxHsi53?=
 =?us-ascii?Q?gaQ2iowigpfwaatwypRNG/FBbXR/0Pzbfv7SlpWD9Yu6nJ963mlg8mKAWO7o?=
 =?us-ascii?Q?bwthaUcfdOa3BUpwuS8qCfaCd3tqCw3MnUhTMzZ6XhyHnj+e8PYKkAgcCqTB?=
 =?us-ascii?Q?xbuY0rJ6ZejFmFLMY6ktqxS85DkDRlaJ5tau5GyFxwk+mi3iTkiRAdbs4y/C?=
 =?us-ascii?Q?yxp8r6FYT5VgwDDooPwOJkwKho+HKOakGagE9+2wR2oSlFeVPT6XGEStqfSh?=
 =?us-ascii?Q?BItyqeAjRK9PbymJ8XXuejzZ8dmQYsNXraqIzBcrnnT420XzD3xsrYFTYsvW?=
 =?us-ascii?Q?Ti0vIo3DEUp8xRbwCl+4Wyeq0Yrr9kLPNdSGPMyDvCDuNrYWPbK0/Rg9lRbl?=
 =?us-ascii?Q?GyUObogNYqIGNWQqZz0YVu0rcl75CNROoYAy3B9MKWBXsNDelRdSdJe/TXFY?=
 =?us-ascii?Q?P00+z7201Orkaa0IcFLwSp0LVCxdX2C9JIA5QyoQtdPMCL3ysqauFLbXoqYJ?=
 =?us-ascii?Q?3dqNnqZoNH7LEq5jBBM+Ced8UV7YsFnbO3CMJA8aY1H39WmXaImTi2TWDfsR?=
 =?us-ascii?Q?AZ8C4JOJzgDkdkAz67H0jg1hn9bytdwxKOi86dWcuawskiBe7tn3Rk58QTKY?=
 =?us-ascii?Q?fRMJovFGEjlL1qOUGJO1eWcfUL0pmHPrcLZHK3k3sqn9k/i5BrrpiRo5SNSi?=
 =?us-ascii?Q?RQ0DCeW7oaVQGEhkM7vRKgKhUtPcMfkD6Nb2EQwR68Xi4KfY+Kcbk7U5GQDQ?=
 =?us-ascii?Q?E00GBHlwHSiXO2xMLC+G/rANjxE4/HvELo/1k1wqSaKkvqwa8v6g1rmXjX1v?=
 =?us-ascii?Q?WtxlhVtrS5SsZu3QevfquM4gdOkf9AtCPyLC4Nzw8kKyGPNo+cejF9krnhGZ?=
 =?us-ascii?Q?6xdeCmU/5OxuICLJzWp15bcyxrIOnfJ6rNe0TRCGlwPxsXjmhO31B360Jsty?=
 =?us-ascii?Q?G9OtSFE998vRKJitONasQZaqB5C/J5FIMZJrOjDsliTvbS3YiaDcF27V45eK?=
 =?us-ascii?Q?+dDo986xAxhaVGNC7uG/F/fnOhk8vlvEbrxiIkehWlgOXJ6YeWZ9y3Yuzede?=
 =?us-ascii?Q?BYhmbodzblUZ+q2ikv3ZC+MLUXDlh5HX0LPZcg5jWmulz7MsL9ZQvhiKm/Lw?=
 =?us-ascii?Q?KefiujgwzZp6XkE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NMIqYneL2IRAqyR8BETX8gmyLev3l54GifLL2TjdxvbsN9CK2f0CsP0UPkN5?=
 =?us-ascii?Q?qcz8WZreVz/58cKSBmKBL9uPnAT3sm7d1OPHLYcGXCkVs9Z4UvqsrCtrwjvj?=
 =?us-ascii?Q?yP8DJZzzpv8pEf3kolavv6gc1vl6pcrPKSUB828aqXT5cCVYa0gh7eJlO47T?=
 =?us-ascii?Q?bRHyOb4TSkxy27+6i2FOZOe5Qz3KZEuf7i4cVZCMh5xWPrNF1roLBRYsiMDv?=
 =?us-ascii?Q?YQ3Sf8yfdU7pjZE6J/1ryP/SVHflJYSy98flLcnQCQpP8zI7IUn3rnYbafnf?=
 =?us-ascii?Q?ZvfABhfhkDu05tOm2agttLmvaQq9+FxV4zWjMZsSQJz1ZNO46DuoOJ5uRTjV?=
 =?us-ascii?Q?qjEX2OLkz4Eeaokt8tcLTFKv0LpvusliHb3KMDHNtOX37Ra0a8LZnsPvxZYp?=
 =?us-ascii?Q?zxaOvUiiYWJx1A2yMooGtgsX3E1ABsYfFDJ4k3KsTPLVsD7qlHWrww+W3fJY?=
 =?us-ascii?Q?yXojb5D71fkvbdd+Ji5SfT1TCQqmDR8Ce5tuX9fG8gu7z33RW+5M7k8cZABo?=
 =?us-ascii?Q?PEOkdL0nfVqUZqvEK/kf964nzZjJH8GewuQA/7e9yIym894UGxi9G4btGxBQ?=
 =?us-ascii?Q?r+EdUhVngVC81N4xbZdnzYBkEzDVV3qW8kyonoh4pBnZ1NGcyXcKTTX7mfKV?=
 =?us-ascii?Q?s22ouIgxuGfD0gurNZzSOPkPII9W2yrLmEW24wXC2cqUUjfmA+YOF64TdiLs?=
 =?us-ascii?Q?nWCABJnvR908fzbl0JVLTy8TMKX+nBpn8WLJfF2h418a8z4/O0qRipnCYRJv?=
 =?us-ascii?Q?twnAB1LuHm5Ax/dsGl3pYdFjxdwoqY44qKKNWQqqrFQcinFZmSCMVwdFBjwr?=
 =?us-ascii?Q?2mT63pmz78FhonmM3RmVVjENYQR55+yNHeIEHbnaQPsSn/4hPvPuF198yyLW?=
 =?us-ascii?Q?vxrFgvXLUyTjwqYw5uzqP8WCTlzIpXgQ8VhVdu9VzfYEiLf/RSb7+nyWInY1?=
 =?us-ascii?Q?0M6IvM2t3lXVM9Lsq4uB+sR5JtbTF/BLRPBlLVV0tVk/CrxKjgycDFpD7rZ4?=
 =?us-ascii?Q?oWYhXU+hVZgTaUCHQg7D4otZHgu7ILSx3fM7n/B6XA1trxbrx053Z6e4R0jE?=
 =?us-ascii?Q?F8tP/qrGl6SMca8t5RTHLytPuwMi9OYPOT1HP67DRl1hscOtR8C25wBUXOnn?=
 =?us-ascii?Q?uqVaYjMdN8u9c0ZKNY16TpNXbXcJmAR9Mtuz8m7brOqtvaPKb3cAMz+NCAbV?=
 =?us-ascii?Q?yaca8Ta+FTu93o7Bj1qSKkZ8YneAyrMPw+EGhDDLs0df9Pv5/Uw5Rhx42HiU?=
 =?us-ascii?Q?UF7bgZ8ueOH1L8O4QNCZyev4ppnDNIFPqWHKlx6Rw7ReMTTBU2Md1V1zW/jG?=
 =?us-ascii?Q?6XHnoq31xbKqIbR/j1UW6hongbb8IhhEGYWIUOzMZZKKtLAsGc5tiDbsWBfS?=
 =?us-ascii?Q?KW900kwoEyGql8s8lbcmwOpe1yOlB9Av1WB7mNfDukP7U7QyP0WNhCHXOkDs?=
 =?us-ascii?Q?BNhhJWhppE8WBhxlsiMe6oyJXgfa9lxBcC5OxzR5TPApH4OhZptnW2XngXaC?=
 =?us-ascii?Q?rLrs2AFXSUuPRNsEuKgC427bHtspWMWFtbPEkGISKY39NRB8UQRb4tcdM2eY?=
 =?us-ascii?Q?P5gJG17A0jVDActbnLo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd14fa7-712a-4f6e-c14d-08dd9df96633
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:07:44.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZCWUI8VkdlVI18Uw5OjciJ1GFYW9GChaovQeQxrXYT6S3nPE65GC55fTjeaIJQOnrtuNOXaFFT+cliYUDraGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11250

On Wed, May 28, 2025 at 04:34:31PM +0800, Wei Fang wrote:
> The overshoot of MDIO, MDC and ENET1_TDx is too high, so reduce the drive
> strength these pins.
>
> Fixes: 025cf78938c2 ("arm64: dts: imx95-19x19-evk: add ENETC 0 support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 6886ea766655..d7d845231312 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -566,17 +566,17 @@ &wdog3 {
>  &scmi_iomuxc {
>  	pinctrl_emdio: emdiogrp{
>  		fsl,pins = <
> -			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
> -			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
> +			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
> +			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
>  		>;
>  	};
>
>  	pinctrl_enetc0: enetc0grp {
>  		fsl,pins = <
> -			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
> -			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
> -			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
> -			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
>  			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
>  			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
>  			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
> --
> 2.34.1
>
