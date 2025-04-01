Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394741EA7D6;
	Tue,  1 Apr 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542318; cv=fail; b=pNYAG8zvebVq+26PrTy7wEXDseyDMJb3myJsfoy/AJOu71+Y4GVndVHms4DZ6OVnw9p5zDZQDnVOedauSYZsbzj6xk+GuZ+IOHZQWsu5rpbwfhLGxDXiv53rsFAHFIHB5ZPGR3zd4ONQNrnvHtCCb834ySsoD1CLCOgBKT0PMIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542318; c=relaxed/simple;
	bh=XuWXnYM+GR5fjhMnRqdczuwmHageswcDY19U6YlzABs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fNfGsMQZfFWPuaPqmJOh7ajbhDCPC3e+X/sNpMUDj9zCty3fJsRymTOlPRmU4NkpgD6ParNRi3W9448vjaIHbay4gtqschTZPefsQzI5whj9Ktioxh3kjjQztIhcHIBU7hVgQFodchOKz8z9gawQocf0Or1QuznhGToY2NNkQ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XIgwmOe/; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XIgwmOe/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKsyti9krjOxpRM0CD7agr7XZgBgCrc0kTaJJot8B7HkjzRQHBtHo4Xj6YpnPeXq+g2fiAbIuNkIdPkp/snz9MfeMWQk07rTB0ey9aCwuzfN+3qJMf4NtRstTNHYLPoxxTgfQxXfOA8YyXh74x1HO4bcFxh0IC3elujpUVPelgmVHVKACEZ9x3QzzQUuQopS+lw6ekJhPyYOK7WqE1B93kG9ub2SbN22Ro3MDAYgCCWCZiKiWdOQOvl7BcHNDnZZpMbNYIbpUpQZaLAe+Dsg1rLraQbE2x9Uy9RbbL1jbGSq9X86uh7yUfb/HJn59uk99NnRSM0hmR6h72k4fhiyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NO5o5KNyzW0niD21qJs07RyDz369Ectug0Q8Y739jz8=;
 b=A4e4W+uRggo+yBaIeRd6I6tmkjAUEbrVnUWqGJ5MLT2SZALGdViyyLXUDVQBpUsOD4Azg4oKaGiy/KSy/WZoELErzi961UlRFTafIEZrSM+90i3enBOTPdQFTbeX8sj0JnPwpAqH3zOIznc7pkxN/V9hnd693j2+m78Ygq7Lcu8ISPv/RdZWWK3pDEwrXKC5z66beb6oc24HIXg2YtfZL4M+sa1Gwi2Kr/YmXUIj+FYDDy/gO3ufux6qLDZlSsF/VZq+EIxZ7eXn+uv/wHvp2/ciGae0prK3E1n/WL98vbHMAz0NdC25q5Bn+4AkXoBCcF+QhBfMk3wGV6LcG4S0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO5o5KNyzW0niD21qJs07RyDz369Ectug0Q8Y739jz8=;
 b=XIgwmOe/OujJ4mhk0jBpU0GQT6ZrrN2OD+JPM+hrPL2VBGEJ3mxbr1ptbSMQ/RW9amuzVVNVjjYF0nrYzQDngRQcd81xiTdYGqOKxYOkqWuWMylw2/CSIiYS+sRlhOUYt66FcZ8MQxECQ5a10MikRa5uAnYcPoKmP1hXLkFd42GtdqDKVfkAT0UhhUWBfeSbJXx2OHxvkWVIPwwGRs/E1TmJ2tdoXQarWCN64ttsxqfyXDWZtpePVY5T0m4HqmZONYgCYUXghAMMkU9Fq7j7QD6imNExWI6P8EkzUJu/B9yq64GPT5WEPGTZ3bHLfT/8eyJPpb/e9i4/kWRLGguVfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 21:18:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 21:18:33 +0000
Date: Tue, 1 Apr 2025 17:18:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: imx8mp: make 'dsp' node depend on
 'aips5'
Message-ID: <Z+xYIdS6HBVAc61r@lizhi-Precision-Tower-5810>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-7-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-7-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 9058f580-7feb-451d-299e-08dd7162c1de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6nqhYbP+j5wMH7TUxHHr1stD5GBt2K+s4IVGyIMss/TMUh2YxDGHG+bfWc4?=
 =?us-ascii?Q?gsQYquHdUQxF/2zky32pieVWFohEZM/vIInWqpkNIJnmq+/1qxZzMcgtY2v6?=
 =?us-ascii?Q?UGRcyusWvNqBWD6Z7tCYb0yJ6N+F/an1WDerQd4VSkr7QZ+Xbdl1dVakrFJ1?=
 =?us-ascii?Q?tj4T2KmWPp8ucS5JBljSknuU+kAQn0oOsW5kEczGmiDwyx++Ng0FAGO7yRUD?=
 =?us-ascii?Q?wZ5z3HGT74FF+j4sCHHGlaitjs2Qi+t3PwIqTT5Chs4fF4MutEO5Fv6VWPZf?=
 =?us-ascii?Q?r21VKSsYHZAU4pvxBeyulcrIpTuTQLKS8DZBA74FvuYD/0LaE2aqVrrZPulM?=
 =?us-ascii?Q?GNeETG3Slu8lk7ePtn5NZfXP6jR4v4PPjeuCHu2pNLFAWDScRYLYqUZCB3+O?=
 =?us-ascii?Q?XoUU+u/T/SOVmzvb92YQqVY/VA6/uSeNF5wNl8IWH+i+AVsSiXW/BkZdQIa1?=
 =?us-ascii?Q?lfFwhMmLZgx6RKtIo+VllpLhjHDxPOjlAsnkNxRGQDX5gojK/IKFnjeWVlbG?=
 =?us-ascii?Q?596Vnq3Xa58VUoZMgdoy8Kh/LIRlha6Ey3HE3bAmq9DOqdD8xaD7jy4WS+w5?=
 =?us-ascii?Q?lAgRvd/3bxKY2ln93Q7l4glInjaQNiV0Nuq+KWWAkwcwSDfbf8iigtzrOPko?=
 =?us-ascii?Q?EJNpjYeZZhAqbCUOOxUbjys7BqSa6fyUUZpTO1ZG7oD8rGPsmokb826sPYcJ?=
 =?us-ascii?Q?zpfOJIfe6ThIbzlvEXJg8fkYXDEu3thjYH7Vuv9RHDcE/Vybi+8k/bm8wdFn?=
 =?us-ascii?Q?XyuZWEz/yXQyywEzIZvfY6zEo+tJnWd3YyfF6Tv9izjE7ezavliOHv8+hFeN?=
 =?us-ascii?Q?9TmUdn3FY+ZwYKpJL52I3dbDgBjzJihHB4xcBqPDbhsS77bh0MDXxSl+lwOh?=
 =?us-ascii?Q?2ozia3nxeLWTXFK0Tq7hL8vX8G7WNFgzEoflTn0LY4nt5r8R1j4ulZ36l9Pw?=
 =?us-ascii?Q?/V1EbmUJtLY/fV5D1b48GS1bcKT49X9AV2pzd764JJ7S+p4nFwB0cv3TGE8M?=
 =?us-ascii?Q?lC/dTJb1qhoZ7bu886zHf5BnogAZn85QRbnbB6efUMNLMPzm7o49OFK21Cnh?=
 =?us-ascii?Q?GhJbfa4T/rq+fwOJ4SA1myRX6KfPCIqpHEXqHnvYyug8eR/HBkb2lvBwUp3K?=
 =?us-ascii?Q?WFvuTC3R0xPqPTyebvAJ2kBA/Pm89ABEJ5+qV6zrYodsSCDzjUL15Zoz2irg?=
 =?us-ascii?Q?bZzse/t+vEooaFCQO7Hn6TfAZ0kQJiDCFJ8sJ9TmL1m9i6pj25Inu1TYRO9N?=
 =?us-ascii?Q?1leoFHgmWtbSYjr3KUzkLnXARSK92ZduBcQ/QsNxKKMHL47gI77VcQp+ypq/?=
 =?us-ascii?Q?T9RvHRb8IxwWPyuVCQ4u7COk4o0WzoFILcnM50ppiZ/FhFOsZAQEqZAgpfOQ?=
 =?us-ascii?Q?JgMgpgDctZQo35qsryeI+xrM/vttx8zxs1fjYDjTpllosK3M+g1EgUt46RhM?=
 =?us-ascii?Q?1xKAb9B3p76Hj1q59ciBKVMmSbShPL/6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?go38XtDlOOJngnSugJMo1WyjW4T17ubwS0RfX5BYwvdKsF3HjYTxs5zAWuQz?=
 =?us-ascii?Q?A/2K0GZCExPWX9TVeEiZ+7ruPasUukIRo4ZEzBebNYWLyJFpFwI6wMaomb5n?=
 =?us-ascii?Q?xO3tHmPvCKMERij7NKaFSXuRl6SfW2FMIFMplzlKvq01EWZfTEtlyAl60bDW?=
 =?us-ascii?Q?LY/qhO4oPjad/ocTV4tv1YaYKKSWvn/AoBIGyHWL0v4YGd+XrehVc0dIEHik?=
 =?us-ascii?Q?mrQ102MPXoevo8ZZG5g6ySOK5cRxzVQYPxsizMU+TX4qaDuWukSCrg3tC0oG?=
 =?us-ascii?Q?8BuxDpc/G1SdMUv/ZcPdZarBcrgWU+cEygZw94We3DymogqX0vTRr2x+modT?=
 =?us-ascii?Q?Nbn3Epxbu2xjc6ZjxE8LQMk/2qV1DnLZMzdyVRpRVT4TaIAug6wd5L7ShGaR?=
 =?us-ascii?Q?L3chxf1p9PsZxN38RohmrO2SUoTLhl4+W0exTwO7wCJZ3P1ZeLuvTyb28x60?=
 =?us-ascii?Q?dfYVgd2e+MV6X19pH65jJrV22I1ZFbCjqiJ5PWdkOVlzvci4anGI/iWLY56+?=
 =?us-ascii?Q?8UAOVWWyPTw75fwgvIV4hUM+44Y442ROpQcTrOKeTK+xeBjKmRBPOr/ehRX2?=
 =?us-ascii?Q?8nqExenxY/v8ZD0A2D6CwRO6FO3Hpfh/baUceSB0zI8/vLlII2CBrONoFLtw?=
 =?us-ascii?Q?Id+yR2RzSTd7d4m91V2PXpGITfj+AnvFGOhWE4m6LKQIuDFYQFbZRidxWZx4?=
 =?us-ascii?Q?8P/kSNQ0LREjdcauAU38X7n5KPmyhWL8IjIVfHLRa+1JT2RK5v20QX2L/0MH?=
 =?us-ascii?Q?Oo9yahwNdut/heC46pSJfJX9My+eFMN/ZBT/yvGF5S5qDVQxWP8j/4OGvblf?=
 =?us-ascii?Q?P8ep4zibzYzch0EYuyS+vDvxRt3Gj+fngJPqrp/NQbMdXrtgrun18/7ZVEmh?=
 =?us-ascii?Q?HkMHUE32k2BpRGRrhZwYBKdNBQ1MMUuB+6XUHVXTX6XzDPoQC+6VyuMNTAZs?=
 =?us-ascii?Q?m30t2zSBa7rb4E2XwCUst0Z+B1cWtJlK8DPTFb2gs6Gwgs90PFzY59AD+hJc?=
 =?us-ascii?Q?BVCWHLs1b04rP9vZrFXtZSK0QxIGBWjaOfUr6BuTfj4vcMKDqTb15yx+aeIV?=
 =?us-ascii?Q?ntaD86uPRw87VDgKIeeMxmaaL4R1+RNWeOe0wrG/QuqlLpagX3HSKytAnJmT?=
 =?us-ascii?Q?vBpn0LG1h2t1qk0MmaJQ/1rAmEBl+99x4xIajrsB21eZ+x8AvhVspXkzz7gq?=
 =?us-ascii?Q?pLHQNjsZA0Cc8HhvkaWuToa5hxqGt0bDWz+h6F6HZ49tFJUSSVNpfjRN8xaf?=
 =?us-ascii?Q?DvrplUllRPWuOszMslyVZBWFNfv+TD0tfqWG/cyjlo8JCH5sO8/9h4hdp9jI?=
 =?us-ascii?Q?6MV404S9dHG//7BLZHCgwtQDmcCQI0zL0rLDx2tUu4YhRP9ZN/n+ty/fv23O?=
 =?us-ascii?Q?qsmqMufHn9r+AifIzHfO0+Y4IzxDFMy7hLbKtBXqbHQE/3ZT7MxYuKH5DZB2?=
 =?us-ascii?Q?O3Al552S0CU1p6m/M644jH2WUnYoBY9orYyIGDR95IDPMnMRJz7/4AZL25UJ?=
 =?us-ascii?Q?BKPolFLAyzlySV/5XAh6Lw4+HeTkJxyVFav95iNr7smpEu7lSaAZPFb2fUZy?=
 =?us-ascii?Q?pGcFQgcvAH7x6aA0Nzc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9058f580-7feb-451d-299e-08dd7162c1de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:18:33.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAhfcuhgGeVeZO7YO8+xMeeIw27jfDfN+FrDxKavmum2oGBe6jYu5cbUI5/pZnDlZf8KMBMHcWrqqko02jNdxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908

On Tue, Apr 01, 2025 at 11:44:04AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The DSP needs to access peripherals on AIPSTZ5 (to communicate with
> the AP using AUDIOMIX MU, for instance). To do so, the security-related
> registers of the bridge have to be configured before the DSP is started.
> Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
> property to the 'dsp' node.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index ebbc99f9ceba..f0f0ff5edea6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
>  			mboxes = <&mu2 2 0>, <&mu2 2 1>,
>  				<&mu2 3 0>, <&mu2 3 1>;
>  			memory-region = <&dsp_reserved>;
> +			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
>  			status = "disabled";
>  		};
>  	};
> --
> 2.34.1
>
