Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FD8BE5;
	Tue, 15 Apr 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742537; cv=fail; b=npw1zHrtMfhPx+ZVWNM638qGF08qG2DFu+NJFtspbyZYGXCsVa8LMuKd13UbnqTr0gjfQmKyr7BnO4vlYQWabXL/3WfyRv9spYAJKFnuf/XCp7tAXnj7O9OzcSvQ+IYfEaaYnyX51neeJgmTHw/TwGN2LRBocqFFL8WU78WZxSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742537; c=relaxed/simple;
	bh=4ElWKaRlnX8qBDjkX5hfYqRIV4etkQGYwOLBWh9MV8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p08k/Tm6J+0bRPfc+4zhPuqxC3QppsBWE/M116eTbvLhxEy20dGo6tJEedfFI19vxuhJL+LR/m/Hi7J4Lr8zS87dGRJYNiRaD9wicsjMuL7oFnx349vC6Qc9QeS2/wRf+uZXUN9arPB0MR9W9Fy8RiqoaE3/DhKS0Bzs5pKK2k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J5o/38Tx; arc=fail smtp.client-ip=40.107.104.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J5o/38Tx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3qT4FSlqePtn+DSgfqrDcmHoYWRBYxG6hT4JHgeJGTTBda+LA4V3QW7JGVPcnhbGVAakGX31RcGkV0YGDYN528Qr6otLH0REYTEYF9t0v0HGnFhPOJeIkK3eQM0giY0+m+DDKgAf5oWVUw8+F8xDQVnZTyhV0TUlfizMYtHCuzSAUYIMZCBpx295XB8sLJ4G/cCquWHZDBi5IX5goUdrQQDCK+Ny/3o7L8V9yTrZ63x1LaS0mRjNzsBEglpwrReH0FFOPHGvhDSU5fnfEOHOrpODJ3Hx9GEAKQloSQbiXESvbXii0d/uiGipkiukmD034InqWy8y79azUGkn8ja6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTB0eJQAfddvh3POjKTNSrpu/R9Kmvef7Re71BN9SuU=;
 b=FqLk56UTb2aokyNDa/bjzkTWHpG/7Q8d1YtjpleM1j6TRejRRhtCjARMS3UtDbGkAl8shAepo4imWqwO2wjLSAMpfre860HWIN8jknIxY0vs/iAHpzrdN0GOFfO/G5F/OamYdV3fWqGjgCwg/tVhFYAy+IOfvCrKYSZoo01s8b1liDWBxPSjWmfvDOujN0boUP+Rvg+alxXgX6JK8Y7x8eGErvzq91dA0GxU2qm0oUhqCKopViy6qbIl38MF4pDa9PBp3duiUf4VttC6ZAWODqzB0x+io/j2mdcfSqYX5AAiUq31SVJAoKXvZFXrwpxT+ZNQ+RXQqVmf3TTFVd4vtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTB0eJQAfddvh3POjKTNSrpu/R9Kmvef7Re71BN9SuU=;
 b=J5o/38Txa46pbLEwlqXeOg0xAOE18xkjkAVjTI3pAJNe10lFv8cBzflDRom7P1PcissvDVWNr5Z6FybEbTnetxWEhgLRlXGvU/WqMwRc12gTilz0CL4wZImEJusJsV60nwCR2Z8l429ZZYcsLoNP8rBp/pTPc4s3g8fek/7s/SSDqrvDaUDtHjmlTUpB449WsA6Xnl8aenRewa1Sh+TJiGlF5H8FcvmFKg5oFhzSag2b+g+Pbwl0qERy1luG/n71XntM90CJa/RKiLO+fhF+VnxarNaqMODoz5P2PAJCqV9ACWzicY8smNLINEC1c5Ty0ggTDJavq8brjvKNP1B4eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7957.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 18:42:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:42:12 +0000
Date: Tue, 15 Apr 2025 14:42:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 09/15] arm64: dts: freescale: imx93-phyboard-segin:
 Fix for ERR052021 errata
Message-ID: <Z/6ofNXe5Mu4skh7@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-10-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-10-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acb0cd2-c9ff-4ba0-6157-08dd7c4d3ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/wWBOlU909gvm8alovIKnGj+tNQKD+dYjvZd+rUfqK0iToA1k7tvD56DeTX0?=
 =?us-ascii?Q?vcPERWxj989icHTAoD8Mp+/uqJ4wkisGrNDoRNkQgqaHxp2X04y/8SCfLv0X?=
 =?us-ascii?Q?5m5q+cjpQE6c1elV8RXvGuriYdLBYgiOEyHx97iNcK22QmCWGYpA0FFOsQzw?=
 =?us-ascii?Q?6O/qhffPq0RCNuSFGyQ8djrFC0TWEl8XBD+YXsUe59x4HgkJ62bVX9Afkb/X?=
 =?us-ascii?Q?M7nwGaKriHvZykP3Q5/P9XIq7WY8Y9DnwOjGUumD9k9WQX/ImLXeA2rgNMGt?=
 =?us-ascii?Q?GFiPJrBqhjucym1O3Jj/Mgfkx3Xw8zCGYhprmCKX9N+vGyZhPpn0d1G8bTOR?=
 =?us-ascii?Q?Vfz/7f33/l+y0tmsyKHFMn6he7sTzzIXliG1Fcx8D7nSSKh5fqtUNFDVutwY?=
 =?us-ascii?Q?MkmYarPaHJPRhY1KhomrcTCYqg0maf4v+Plh+WfBS+Cn4Z1omnJlxvk65s3b?=
 =?us-ascii?Q?y/xYf6WGs112iT2Hm3mvJ/ybjFGyVimpU37RL5SYQ7bJ8XJ7ZXkDndyz/9Xw?=
 =?us-ascii?Q?6lEOj7w+StnP/qehdgnikFQYGRPYEf/RmAnxqAEbBdGj3RCfH1B0qp0F/NIM?=
 =?us-ascii?Q?NO+U0Vs8tl8uI48BPfADAoev+rl1sV/hkPeX0Q6SXEEGu2UHSMQZfsneCxEl?=
 =?us-ascii?Q?ABZbMXyiFyYJaKjoCS1IESt3TBK74gQmsmg+RiVEeE8c/OG0S9xvDwveIe1b?=
 =?us-ascii?Q?YDDSX1xxGBZW1H2+1dNQLscm1/qRvgympexMZ7w2VCC9N2BMKMYtyG/vOS1i?=
 =?us-ascii?Q?XMGFCLAMUWBhLNAxvs2jTfuzCn/VfpnmoiaYqaaAzbPqR4AjLPO7heNiJ87s?=
 =?us-ascii?Q?Cuftr7Sa8avOqgV5tO4HzktO3lz9qUzAGLiuMmwG2EiblRhKDO55TYcSgjJp?=
 =?us-ascii?Q?EIAtNWKEmZu4Pt/b6edVivd2HI0FpY4enk8X/xuH6tbdrN5YNPadSRV0EHO+?=
 =?us-ascii?Q?pgQlX1L2Smpsm1ax272l8XqpdOFtjgix2ugxxPkSOt9I65YBsQ8OC0swGFWs?=
 =?us-ascii?Q?swrCuk0c1D79m+PAhXK4w4cvT9gwDKpMIaIa5jluZpy2xMP5jMsuisMGUWr4?=
 =?us-ascii?Q?pZ4smaU4A9RycE+MJCVYSZijTxpQUoIwJCCcsoU5zjaEp4z1gLm9bemSXM4K?=
 =?us-ascii?Q?d8ctUZPQv8hh3M3vC78baqbxqKs1BJXtsiNB4CCpTpsHRIZmCuYZIuBxs416?=
 =?us-ascii?Q?vJH6++rWbiHaFkHF83InUxBTJ+ag450ner3+F+1d6z9bPNHeCKJiSvHGN32I?=
 =?us-ascii?Q?dMFnUSxxqKju03dn6jHL1mw3pfbK/OEOBBGddlGsvIpc5puswJnAjooReY+5?=
 =?us-ascii?Q?kEYFU8SEnDKc9w8HH22T+kFNMdOwdqbhgm0w+qbDAqnMjCaJenuYfOLW1dhr?=
 =?us-ascii?Q?jQBFj+mbnOXHkqX7aUJ1wJ+49FUULEisPKw/YItflfcNDf5xUQcM2lqcBkuD?=
 =?us-ascii?Q?q7iW+qrme/Noag5lNk0QIWuTVRCW/BCNvuwL3leWkbXueu0dpX0jCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGAfS2FG3UkY9y4EtFRp//cx5tcYKLwC6HTLWGqcTqePr5NIjUKl885IQko+?=
 =?us-ascii?Q?1vrtEU3o4RKyJXRv/i0f3fDMmTaO+icLUuz3K4bmZc0jwl2nOURxc3Upx9zJ?=
 =?us-ascii?Q?hcEVg54/wgAdb+IgltMo322JjSmFNju0JxDexAKws+WSbMnrTl8hK/3ag6pq?=
 =?us-ascii?Q?Vfbru8EwBFHVCnXK1NQj/peG2dbzeYQEYEPpfsYRcc+QQrKCQg00rb8+f24o?=
 =?us-ascii?Q?cEx2FxHXVOSnQ2X+3TUj5UBHglUhKQYXMGlSZXJ+rI4BYVd7Ghf2gIV32LOA?=
 =?us-ascii?Q?DCEdAxxEeh/2bx2I6PRu8HSXmz8odI9KEw6xv0Xzu4q4qTnUxOAle90xRXUP?=
 =?us-ascii?Q?oq7YpPaj8VRy8qmbTfdETDaeh1PVOu82HoqGYNvb24omFqaB+X8oerAQRxCB?=
 =?us-ascii?Q?JgaTbN33Waf/OOmU8nOpQ/ktglkj+E52m+CQk+7ZJWNpvpeX4dvjc7tqE31y?=
 =?us-ascii?Q?ZdI1RgneXJ0ojbyNBlUYPZBAyBX7j/oUK6vgulw+1rwhFQJmo2K/bg6Z5Uxi?=
 =?us-ascii?Q?/lCpky1XOozftNi8qiF1qSCTqXX7sxRGkAJrosRvMMgQhVqm5fT+0ar2egyV?=
 =?us-ascii?Q?evXn1juY15Nk7GnpZZX2n2ZXtkpbOHrfb+GIUiE4eIfqHuhQZ47xpHwLNDlz?=
 =?us-ascii?Q?qnV+s1jp/MyMPFJitXZMwRXMEf2A+diatDZBEhcN3VOzfNUWCO9RsZSV8NhH?=
 =?us-ascii?Q?QQNOEYY7Rjc/8l9As8IiEats8fYH2y+ALgD3zNI9XknXCPHpdrNERirYZLWy?=
 =?us-ascii?Q?7/S+N0YwR4E78wDxccvKpB8oUQIKQPB5QNIIrieEml5T3CisLuYFIo+47S1a?=
 =?us-ascii?Q?EZQVk4hQyKZSfQsu+FNr/a5ODVYZoLeky25M3mynnnYjTnqkEtrcOxjanHsG?=
 =?us-ascii?Q?/RgbNdNn0RNPHPpUuzSqcN+mQ+781ecLJoXyRzE7+W1s5CZhhvOsesa9VqQd?=
 =?us-ascii?Q?naIFa+ddSQOQcDuJ3Xh82VQdx2zCoTSuipHF4bC3o9VsMY/Eni6OBXtN/X6n?=
 =?us-ascii?Q?JH3ky/MEpmeScA9ZnWl/vF5ec+wyOvfrOorABCJ4oyGU8vSkM0AQky8CR5Fa?=
 =?us-ascii?Q?thKZiAV0VktXD98KtLzBHX3hROYmQBo95jmw0HZrFgk+ec4dbIo7wdAgi3mD?=
 =?us-ascii?Q?D/qsNp6ZigVCaDN33OrlGRsnnIBtGyccioZWpy8q7bEN0Y/Jr+j40+y7iGMb?=
 =?us-ascii?Q?QeePTjuSUO//TNgNalUP4SQqpnAzFSeMhyed5Il+MKaWDL9mIUVVK/YXcDDF?=
 =?us-ascii?Q?zw437eLvRKGxidUJyCdJF07XCRjEXpVj/cP2MUsYMYXMSjHyuF+ubkffZH4g?=
 =?us-ascii?Q?IEBegVg5JXbmo9Y706FfEjOj9vBxsBTZP0RawpxOy1apYws2OpkgofqLN/m7?=
 =?us-ascii?Q?eOJ8NEFZ0pg4KtV1Xb8234LKXXV7+Mui7SUdbCe709zbkcOhZrvvvPmqtcAC?=
 =?us-ascii?Q?TUehdx7Bsn4101tXyKGrfTpA61Eczah6usTK5JSpaobb/XeZ08Qm9lNZQyHb?=
 =?us-ascii?Q?tr23d8pHFFJZCgN0+uaM8HmULypB7HRCjZyuOv3/OMAXZvDQ+n3KR5C8Ldzr?=
 =?us-ascii?Q?q4KoOlxidjjQYN6k6KVxMCeYQE1/83KQFwnLZ2vH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acb0cd2-c9ff-4ba0-6157-08dd7c4d3ba7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:42:12.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QotYzrWOyhtg0lfQi2AxVcopUf9bo3LVKNXihwdwjlglPJQpTcg7yWp8hKmvN1d2h9ohS3jZq40anI0P299Tzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7957

On Tue, Apr 15, 2025 at 06:33:05AM +0200, Primoz Fiser wrote:

subject should be

"set SION bit for CMD/DATA to fix ERR052021 errata"

> Implement fix for i.MX 93 silicon errata ERR052021:
>
> ERR052021 uSDHC: Sometimes uSDHC does not work under VDD_SOC low
> 		 drive mode and nominal mode
> Description:
> uSDHC PADs have one integration issue.
> When CMD/DATA lines direction change from output to input, uSDHC
> controller begin sampling, the integration issue will make input
> enable signal from uSDHC propagated to the PAD with a long delay,
> thus the new input value on the pad comes to uSDHC lately. The
> uSDHC sampled the old input value and the sampling result is wrong.
>

nit:
  add 2 char indention

> Workaround:
> Set uSDHC CMD/DATA PADs iomux register SION bit to 1, then PADs will
> propagate input to uSDHC with no delay, so correct value is sampled.

the same here

>
> This issue will wrongly trigger the start bit when sample the USDHC
> command response, cause the USDHC trigger command CRC/index/endbit
> error, which will finally impact the tuning pass window, espically
> will impact the standard tuning logic, and can't find a correct delay
> cell to get the best timing.
>
> Based on commit bb89601282fc ("arm64: dts: imx93-11x11-evk: set SION for
> cmd and data pad of USDHC").
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - new patch in v2 (split from #8)
>
>  .../dts/freescale/imx93-phyboard-segin.dts    | 37 ++++++++++---------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 541297052b62..525f52789f8b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -75,39 +75,42 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
>  		>;
>  	};
>
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc2_default: usdhc2grp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x139e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
>  			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
>  		>;
>  	};
>  };
> --
> 2.34.1
>
