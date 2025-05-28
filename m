Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38028BA9B;
	Wed, 28 May 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444903; cv=fail; b=CgIp37yoSKa1f5gv07+C3MbhqjrAv2CcE9YEIdkVoV930FkEC1UoNNfXIeGu6HWn9uHVOsPsJR6bei3+zlRRuExwwJZ3hEPTPLtlhnOqrVTNSN3AaO99d5AvMJwY0EdrEGZVnZ/MXr0lIE9kU3g9V2MTKeU0O0Xfu/2+PrEAYqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444903; c=relaxed/simple;
	bh=CJJQfk/Js4H6LNs1uA0HWMv1CqbWrw5X2cjPymg4e94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GxMUpQvx9K7b56xpcpHQi3Es1AwnI7SC5+ofUAt8Z3YfoTZC5aCl2wlHQdd2equ7dIrZMrbtUlP72HiR9mcPXjoLKtiVjbve5IsqEkyDwwOjywA6tLAyS0aqSK/OwOaPTgg4JkNePNCujnFT5jxzjHN/xODmIjAU/hQNF/xBx/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PM9KS47K; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PM9KS47K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtSzGti6MnbaJUEl2ZxT+I4IP2np0tl/vum5zR2YQUeY/OR/e+gJKAOp4JaXL4p/DIJhANguh8KqPSYnsqHG7hcTu+N5wK3T7ZXs/j3wNMAdK6D+LuHHQj/WG5oJMXUQOax3/gSg/JmwA16/Vux+UmsUN1i/YMB3FeshwrJgBgX8/AdT1BBD1V8gH9SEq+9etJYEXSq/yVKlDqxGTy0H6KhxaZryN3vtJLeV1DmCmZefu2t3YjTqRhmRCIeuT1nxG/0mTEw38UY1Q1f9eorlg+bA6Lao4HL5uNyur9AheIo37GGAKV+WOljKi8rMU1XHRpWPuNwNM9NEINOVHMixhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgRyuc1tlcuAEiLoRvj9YDojwwp0s1sKT6QsYbZrxKA=;
 b=Ud3ueSe7CNghfPbo56MdpKlgDr/NcFQU7yJruwK49cOK5hg4dVHczUlfn0St6k4A2XKRZ1InfRXC5e7ND3uzp6gBMeYJdpv5Q2ENJAl2JH77fetODJ6C2HMWPEHG4NZA6CA6ceulv3rnEYVj2wrI5Y/7gmi5u5Sm1C3o1HmmwF93/m67rdwnv7dhRB/JRCwlPrvvo72T1wM0kcqcAM+UjwGoE+qXSgkhKEAzkiT4GTsikTJaQabd4qOZUJ2SDQOGachF4HjIt/blIsbxKT4mawkQ7h9+2kF0cO+9H6CMTYTnuDaQUaS0wQZ8p04g2RQKKgvCV9FrtYkmwcj2F+dVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgRyuc1tlcuAEiLoRvj9YDojwwp0s1sKT6QsYbZrxKA=;
 b=PM9KS47K96LyTPs4NH2QKxJQFJLogg74rl6rijGM67MA+EyhJe+ygr5Jq9BlR9uNOstjKXJp+J78XlZEeSdY7tVmY+sJQ2pdUheiMQYoqpVLezD8L5Oqbo5cJw4PzhfIX8QIzM/z4bVCtMd/ajtdiFqTzCNkZB3ba4TlKPL6AS+tnPLDjt7dEpqvL7xnBa2wmm5l0MysRC4aJJclV8/nGlbFilBYOz9v+nhnzw75tWi5Op7dvaLHSiFfwixrYFrwCQJRq8slJTflyC2ETXe2+1JepRnhj3m4MqmZU05bOVkmLxboj1dvo6pcmBE2kn2zSgmfi9Z5uhifUlAUhjXHvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA3PR04MB11250.eurprd04.prod.outlook.com (2603:10a6:102:4aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 15:08:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:08:06 +0000
Date: Wed, 28 May 2025 11:08:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx95-15x15-evk: fix the overshoot issue
 of NETC
Message-ID: <aDcm0QC4PMEEZzX1@lizhi-Precision-Tower-5810>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
 <20250528083433.3861625-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528083433.3861625-3-wei.fang@nxp.com>
X-ClientProxiedBy: AM6P195CA0097.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA3PR04MB11250:EE_
X-MS-Office365-Filtering-Correlation-Id: 489ce511-6573-4475-687b-08dd9df9732d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+d9R9jD4VvulV8eTFHIwaHGxyNE4CB8uhzUj1ndS9gwpEw0nmm4Y0nJt09Q?=
 =?us-ascii?Q?3CPiUiIwr0TVkOJlXgE00FPsceUvpqq/iXCD7U1E0dVn3K4d+YtbkmsfJ1Tz?=
 =?us-ascii?Q?cc5/zHf2o4oc6AKpOzOq06drn+08/PiYKmD5WKSG3NCiRzZrj56bxDw9jVB8?=
 =?us-ascii?Q?y887+DwJEtwL96N+JMGNXLFbZlzuEeYoquJVFELooPMhcwux71/mzg48AgAf?=
 =?us-ascii?Q?PdJPM4xMKQ7tyqYS5VNcfOYjBhFOGWUh0K7Jw1MS1jVdFKEBrjNzBv8AATTE?=
 =?us-ascii?Q?MqSoNGQ+2u/5buvYNC/PjDHsqOahUShE75Q1vOZAOMbxx0edYOf4m96aqKKO?=
 =?us-ascii?Q?JKQI1C+s38HOet7GF0WCRxjpfB1QJTx+qfJfAzDH7NKtTP5Co8PFlr9zfW6P?=
 =?us-ascii?Q?cctqU61DVM6RDnGVBkOXBSA9L6VQtjbX7IyJNsOJdzq35jzOwDYilnMSlzPB?=
 =?us-ascii?Q?iwIWa2uQ+eL0G+wHcb9BsSv7MdZbysCnSH5G00da3Xmuxd1R2upk6slDeWYl?=
 =?us-ascii?Q?LbmBCRvO1H6AvuBlnthrO1pZkl+G4BgwYT/rJvLG6RJqz1tmK3SgRaxF2U6r?=
 =?us-ascii?Q?SntFDtO9lIP3Tm5BQkq1AcihpvX7ItrDxy54B0vv8VweTbWZVetajcBtTYrb?=
 =?us-ascii?Q?ktLGPg5MLEzIJPTIDkrEd68lUYi0mCz7IDckXzbf69OcYHQjCgiB3izqY6sI?=
 =?us-ascii?Q?PFpLUpyNP9QpVbPVWgKprepozrVCNSTT34RP+SOMSGQYMfTsHNoZkt6qdkL7?=
 =?us-ascii?Q?6qoGfkmcrhnkvJHXqY3WVnmKs6eCtSAUtYo2oQHTsu8+S5+sXJVVvdC2PjPu?=
 =?us-ascii?Q?62otDNhkSnuiLp4SlYBK/K7wAeuSsVbXMzX9/9je6UYXxrcNdl4j8TJap85I?=
 =?us-ascii?Q?9bsy0NX7IG0Z53327IRBPU0s8H6v/BOfyFD4f/GkJ7Q6qb03k+OGSqCdfdAI?=
 =?us-ascii?Q?1ga7vBE1o41RFWN2rpQxHKGvAQ+ZUlKvJBiwc3t0TLCoc9gq00+tSPg7E0dZ?=
 =?us-ascii?Q?5cQUs3EBEvVTAq0LxXGIvs8woiulN3CKEjHRJ0raFJ0ytotQf5lI2E5bO+Un?=
 =?us-ascii?Q?2Ty3LS8ADqLEalWDZHtPB2U38VqOdpUAAInZJcXa6ndMVF5Qi9gqSfikNySl?=
 =?us-ascii?Q?mAJvyzbrPnWF2G8EO8DV3uyo4QyRWvhgkLyXLrq1IVUCFs2K8CMV5LSyj1Ov?=
 =?us-ascii?Q?WOvtkH/bDlJM1WOHOlwYQ42gr8f7y6To3VBV6Ub3CV0ZL1LHtAJZ5wNme/0x?=
 =?us-ascii?Q?D9Z9SQvUW6fAbJJ3097U9UzAuDDf5BZB7yaCfrVz+Oi1mYrH8TDa3tMU8wEb?=
 =?us-ascii?Q?8teaJDbQX8poXLrbcJiDU2+A1lTJK5yYrEThswjIAZBCjzC99/RYYcZEJAUQ?=
 =?us-ascii?Q?wniDfllyI59llFaKe1hEkBUBsTcrZINMZW3aQ0fJX6juXTKcZeDBl/lVPIO6?=
 =?us-ascii?Q?14LQo/sPowLVyPvjV9ptetWeU7tmD/ZSjMSgt+UDGyEF+G2phKEVc7b0EcqQ?=
 =?us-ascii?Q?kFKRsqCGuIQD/38=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9iLjBGwyJTbARbh9+u8IaaL5eTYwcRlY1ALQ7RgVfFu6uXUGtGEx0kGYB83C?=
 =?us-ascii?Q?LpoAphaedLbcSnXxeE56d9MdPfENFcN4GgS4IDgMiSTESJ7Pf7Ii1VxWNYh7?=
 =?us-ascii?Q?ZqlHawb0I936vmnUG5ENNxpSYrZYufPg+QvlOFa4A4BGdQql/B2xMjsp+UOF?=
 =?us-ascii?Q?ilG6M6jQ+ZFMZF8ea7A/2K4QWDMZsJvbPXnSCeulVYuiMx6zUaPRAIMrl709?=
 =?us-ascii?Q?cpOXEjPGIoIwQSQ/I3o6QUfD0VjK7j/K4Qm3cB8fwWO89+56Nhx4hmOvrAQX?=
 =?us-ascii?Q?O2QxJXGqExVD6HFvCjTPWklx3RULk1iWvRALBJnGercRj/ymjWgq32mdThfC?=
 =?us-ascii?Q?zeZ826yVb7FvP2km/F5smaJig98uNj9E8+HBTsaL182Vr7CbkSymZOQ6/91N?=
 =?us-ascii?Q?PWn0JlRQYoL/66K7FSRuJG/YhreCDfk04cdpvolSLvvGiBUn0RQQlW5mlc/D?=
 =?us-ascii?Q?7JwpoonMAcaCxG3gk1A3bUDxUHpbJFWdOywW3b7Xw3Cf73Z0o/QBpRY0/4bM?=
 =?us-ascii?Q?OyMoh6w9vY5UjHpUh2z3a9M6dO5hW1hpkTHKHlC1z123lwn4acxmIFg5FyQN?=
 =?us-ascii?Q?6+73a2uTflFr7wwLtZ0KwrbOtWgFW8osPJ1HPB9MHx48voGUO+3s3GR67KKM?=
 =?us-ascii?Q?2reKkbyLlxa6xj2GQWqnFog1zJcuOLf4uG5G7UCrDb+2WEW0m0T6LJbjcpE7?=
 =?us-ascii?Q?Sx3Q2zorHCC4R4iPJrpbcFX1rC+/SaRtIkjdPTQHm+4MMvJNJhjMofV4kfCs?=
 =?us-ascii?Q?GTOBtkS21R9TMKh2weWI4oNbpK0r/m3CVVA6cVKhWgjpfiMWb9pcUUb29bI1?=
 =?us-ascii?Q?ujNXG9eMumxUVKSwQyFCMFoxDvavjvoK7S8KbUwqVasz0ruROdGdsnh8Gjh4?=
 =?us-ascii?Q?m2+p0VUhUHS0tacKYmshWEHFC2a7QWCYvohqNmyrbaWIXOMUx4JfrYQ5lyk8?=
 =?us-ascii?Q?4ipc5y3UkA2lqrSHJCG9PkpGsg1TeUkYPTXt9PWpyxbx6gSTsrRXsbrvY52p?=
 =?us-ascii?Q?nWJg5SngmPjNyDGGvlfuMp/hVSnd8bFXiYiM97WsMkvR/M8L44/J2pAPASls?=
 =?us-ascii?Q?2U8fL34p+wCg0bheHvDkEkeyyRI7L5k/2rRmt+H5tkF2dXj76FMcVkj8hCbl?=
 =?us-ascii?Q?jybBivv7MszC5T4yPKMahp/YRxoZIq6Ob8DSNJDtDul+rx69zYv8qHv01jXS?=
 =?us-ascii?Q?BWUnSauij0tqf+9/lRqVb71HEeeHLRBZHvpsDImJoZVy7+M4p3b3Gd6pOwk7?=
 =?us-ascii?Q?urdGYYO7YoucjGgqogpVtUS3ckDssrb78Mv9rglTLOvLNDaf3Zy4YSXQGdea?=
 =?us-ascii?Q?0P97Z+N/iIgesWbWExWphchYnyTOMPXMmNl5Y4/wvzraNydZElnWL1X3Hx2s?=
 =?us-ascii?Q?KwVAqy9/gksP2Xx6jmzzgakIY9qcqwwjlEI9hE3Mg5kmuWq2LB1rrvz2kMQB?=
 =?us-ascii?Q?mdW3ISX7p62UW9iDqLVF8xY241rru9y22qzuitX65weNroDoN0RclHm9HRwP?=
 =?us-ascii?Q?pQAtyPxrwgdcBVgfvrRco2LxO9AUVUppM82euPci2Dl0IrCssxsfJljeu1p7?=
 =?us-ascii?Q?NCXTuAtV03Zp79YQFFDhX7Zh2IxNdI5tkBXhofIE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489ce511-6573-4475-687b-08dd9df9732d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:08:06.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHi76PljxKgYSxYwgqIt6lsiXj64LpVYQieLauvG2VXx37Rc91S9I46hzWhMvnn387F02loSRhxnYeSumWacXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11250

On Wed, May 28, 2025 at 04:34:32PM +0800, Wei Fang wrote:
> The overshoot of MDIO, MDC, ENET1_TDx and ENET2_TDx is too high, so
> reduce the drive strength of these pins.
>
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../boot/dts/freescale/imx95-15x15-evk.dts    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 6c47f4b47356..9f4d0899a94d 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -574,17 +574,17 @@ &sai3 {
>  &scmi_iomuxc {
>  	pinctrl_emdio: emdiogrp {
>  		fsl,pins = <
> -			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
> -			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
> +			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x50e
> +			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
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
> @@ -598,10 +598,10 @@ IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
>
>  	pinctrl_enetc1: enetc1grp {
>  		fsl,pins = <
> -			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x57e
> -			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x57e
> -			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x57e
> -			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x57e
> +			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e
> +			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e
> +			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e
> +			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e
>  			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
>  			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
>  			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
> --
> 2.34.1
>
