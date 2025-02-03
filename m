Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7BB209F35;
	Mon,  3 Feb 2025 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597238; cv=fail; b=e/TZe/EvF+mlNzfzF0snDGAjoG7cEhVUw5iK4/MST2gvfyI+RMY5aF+u9oqVUDvPH2rkaekBNHPR6sQssCpnTOvpH+vU4j1BO9AUOovSDPnvgYuvBUZ6s/KxIjWLPQUcmfd42vavNEXdQ4tqAnyfFE9PzJuKR8RjVtmEv0nT12A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597238; c=relaxed/simple;
	bh=3oJuGb3Lyw/GOV1yve8duXv/58LjDHxFm4qb9V2E2E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gh0c3/YVKe0dZG9qu1h8O6PnIiILcx8LpeSY0hHDkxoQNyIuOd/ErrcfqJ2X1F5+qbebMsKDqj97+xpiAcNlB3TRdi3uvhoqcYYyDQaZk9iSL/iZbrRbrRlRsAqfu5cxhNe7+fmKzPWck61Hc3iaInerctR1Ii0e5h3joNYE82Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O88DmE1w; arc=fail smtp.client-ip=40.107.21.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O88DmE1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFYPu0F/R87vDSCJdNz+ouT7xblU43WcQPbiG3LRsvj2e67SWN904vz8MtSQF3LvECz9dMNmd/wL3ft/Dw0DyfkoUWVYxD6Mxmojh0khb0UJPjD3Rt+7fUt6HLRnNNUrwWaYHsbMlB+soNg96Ej66VtfEIkFUNyOYC4CpvHzk17rkHTjyo+cTtr9XJJaVLy41Jz7hrnrjIF+ZwydNLv2B7BSg7HwXTbv1b8LxbzEEzo/wHCFr2spzKk3AqVFdJlz8XtPxBmrXKkyYs7maKiiiSgtc2cTOLPLdPrpegM/WXawuvYOyP1gW4mjPNUMgNVGbZMjrFM27bCDOW+ID90W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irKlTFnfw6mnP2jBGTvJamrXy393MfQ5JY5anTHSDbM=;
 b=HiGmHkgrq6zhmYpRAJ3eiIRC3gsUc2DlnCWOtJh9Nz3H9a85n7MQYNCKfTBqmPuzg2qvrAqmGWmBnJ/g0v8QwJsl/wzNbIZVx08qqeRjv82TSPQAErZP2c81T8yp52uf98MmKpsSPY0j2z/jncrJmpw32SFO7c2wq7McYeJ9jgaaU9Z256e/c6Yjh4Xy1QPpgxSB+xdbLkFI/J+qN9Ldbn68pZiXEXzhpiSappNE+XJ7ZMp3F82fzxcJ/IHVn8gQvFRPOeo1jTDDTo9O4N5okv3dgfSbgYuRrNSly8EqlhbG2Nf6PjNKtlb2YTyKncU/vlHERPvJDR6XG2cKu8s3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irKlTFnfw6mnP2jBGTvJamrXy393MfQ5JY5anTHSDbM=;
 b=O88DmE1wmY1PUKn8THOVTBN8X0x0YwpWuA94lnUhLEdNxkJ4lB9Ri73mH40k9NSKZIt/qvRTVJ0VSWJvfyseM4SbkBOHc5RCTKRoOgM4Ard0L1QMneq9UE1/Qda2806B0Rb+BSJL0suHta49rLVE+b8I5duTfxt/Y6hocSIPOwUjqpdnzosQpt3Li6N7nAi0DmeefuN5f+KMBW4jEGNYH34JE7zGYxk7IkZY5QRq3G6lxgiXE32E4xB1+Tuq0w1ChuL5HzBVWymMSajU+6SPaEER4aK2herU9dCUYBgiYhkvN4+l8efiSlj2GSIl8m7zUWLEP9AFjJWtkJ8uYVk/RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 15:40:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 15:40:33 +0000
Date: Mon, 3 Feb 2025 10:40:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: phy: mxs: silence EPROBE_DEFER error on boot
Message-ID: <Z6DjabeeuoKqfOkC@lizhi-Precision-Tower-5810>
References: <20250203-defer_usb2-v3-1-428182286ce3@atmark-techno.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb2-v3-1-428182286ce3@atmark-techno.com>
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a24708-1f39-4890-e656-08dd446918d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cAUNowJN2bBfcnbE7nAk6zuJAHEvRn7o25hU1ZuuHHXnDS6bVQwifa7LmN5m?=
 =?us-ascii?Q?AmbmjZSZ1v03N0hMW/EGWtH6JvWxZJzl4Ko++vWVolNfZoTbnwVUtlpR0b2K?=
 =?us-ascii?Q?jrhAoA2203zCvUT0a1dW0S9q12fVgh1u2I6gWA3wVGGC18eOV6KNB/KKpgOY?=
 =?us-ascii?Q?BTsQ8wur7OH3aV1uZfJiDBquu9Acvg0BQ/0lGkS2TxhWqSU5vfjEAjUpjjG8?=
 =?us-ascii?Q?S7m7wYt1BNnWyMccqyVMgVyN+R3zxisritQUnxeDz5+46x26eum2sClFmaQy?=
 =?us-ascii?Q?CH5tqs5PIXAc5lRCVsQSHAfmGAY0irwDwS0IfpDQtZxedVYqezO/VmcB/j94?=
 =?us-ascii?Q?yY2JDpJCvwbAMHl0Mjq/Ia6wZPMg/nnySeJD8BAV70RygEoY6Vn5QVLN4PJD?=
 =?us-ascii?Q?7q38lnJM3rBo5DLC6RTYVYgdOXU0Jbv0arlKdIrI13y4SziGWCKoEGaTsiBE?=
 =?us-ascii?Q?+bQXWezzGv8HCZvrstehvVtrG7XZ8Dt0gJPutf3jKu8YfQgC+e7wNCceQRwp?=
 =?us-ascii?Q?/D+Y+C6Ts4eUI+Y5ea05YmP4IWZXZ9Dw/M1zksCqd9i/QU613Ew2yz6O40l9?=
 =?us-ascii?Q?bYb6CcoPsHAFp0aoyHXxH/3Np2meQXCWNqsJX+CVNzz8Wkq2JyLaAMjWndLc?=
 =?us-ascii?Q?0A4C9dEbN5Zn5SKyDASZpCTfIJ5u1aOdPIec6CZn9fwL6Y8np77DL2ANeNyP?=
 =?us-ascii?Q?PA27bn3jYdl3zMjHX5tNEGwiJKb92SMRwyh+LpZi6oGYtDguMIfiT+C/BgbY?=
 =?us-ascii?Q?v4CQX4+iqiOp/GvJr6yVD+jFz0oDFvWk6X+tit0Z215KFqafZVydZwoiJaUt?=
 =?us-ascii?Q?SpRyoGzwzM4Cic5t7YZ8nADIA8RTh1o22r5RkyGwEK1FcLQBzpIKj6sr3FCE?=
 =?us-ascii?Q?d14HrbRtbvE7GEgPAwl+HugVK4BIaEPwDGHahcP8ZnB0XKnBy2jZkuggUARW?=
 =?us-ascii?Q?1Jv+fUYqiVP/FOJ7tAq9zC1UshJBYNehi4sfizptHT/BOsJrDw+4IT5IqOfE?=
 =?us-ascii?Q?k76PeuZhMC+DXFska8dJAz6f+O1Jg5bjMEyGVRVYX8OiQCgJcty2+eCbNgA6?=
 =?us-ascii?Q?FXN0Ugm9pilxZrmooFpI6ijFC9sj1VkvnnbKqrO5xhDaxkCh1dp6HmwAeVnS?=
 =?us-ascii?Q?fFwbpgRniLiDsnnQpltt0eGZ1jEl3khDNWDkItutpQeerbs9hvVAIDurCdJY?=
 =?us-ascii?Q?ljNXBJKQld41/76EPy0W6lLD7MaWiT/ZxcL59SJlqOxAqc02rZZB1pnWReHT?=
 =?us-ascii?Q?NXZ4paBqOCPu50AFVBKJ8j9bswrc2vTkTf8UPpGTFPI4bprwPvrFNKPEepRf?=
 =?us-ascii?Q?Ho6b5+/2/JcN/54ok7GT7IKeyoL8JgTKtTaAO3TraT6GznU3XGpw9Fk3k6hT?=
 =?us-ascii?Q?ShSAYMGXnRXkWCgAaf+k3xKVsshPuRGLmGAc9H0BGy6LaoeUA5EPigVtq9tj?=
 =?us-ascii?Q?d/BqDdoYuJRhYobnFGgL4E3/D7Cg5PfX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0MU0YeEffpR2+17XAJ8GqjFAIGHO3IX8AWjF/7IYd/L5+KebW3FFP1qX8QiR?=
 =?us-ascii?Q?brnGnJJ3aRHL3+Z/vgFJP07Vt76jhjBcpWmUNdSnTVEdDYfeyJe+pKChSjC/?=
 =?us-ascii?Q?O+FLR+UqlfAZAshyjNInLurcUHmoOqmixdhDoxHcPDPa25ssKp/E6Kv4GlOI?=
 =?us-ascii?Q?k4K3ApGBFlRezNOOc3PqTv2g0MuhURALqUOKxQUd4abHciagmp2EY51GUrrb?=
 =?us-ascii?Q?mov2LEQfLkmUiizu2dtQQpFXzPZB5zFk4ZWUt89VewsKM7Yfdug4Q3dgbzlN?=
 =?us-ascii?Q?fbEm+OO4Te/X+XwgJTz8qjZKU/UXWFvc2ZIs8VHSb8VeYnq/YCt3p79Rxuy1?=
 =?us-ascii?Q?5z6uF9Kkeb4lZdKUMieJvG+x3eyGRI1QePnQ1dyKpTtrRoLYIfGKdFzbeUl5?=
 =?us-ascii?Q?rRyhpWbZ+jkLCg1QzjK+HIjXQSgfSkWv/tYTKaHgWZLTycGeI7I542v3e5N1?=
 =?us-ascii?Q?td/qcthzcEz/D45jHpmZll3jsx3bwG87a5rsoDUkklGUkO1s++Vqw9B4Patm?=
 =?us-ascii?Q?1t/izM/Nhm8IdBJt5Rqjb9ak26rdEZdhlstwmIiUk9G8hQolDRi5EUABCTfw?=
 =?us-ascii?Q?wEfUGybfbMJfUaphwJl/moEJlYU/5uQme4Zuxe5xtRpYCHLJTqgMP4AtbH/0?=
 =?us-ascii?Q?B9SkUAc8P9k+K/6OzU9xejuLfm1trWYqQ732cTjmD7rLcGSjdOLIomZq6Cja?=
 =?us-ascii?Q?QYwNa6n+TTuqcK8odtCY995oA14yeKC4eeLlZIN2k6SAcUkxrwBoVKtD5m4f?=
 =?us-ascii?Q?9bTaZ1JipT+j+74iZgapmftByO9MVmCpT+9SfKz4I8S2gFxQTEDtnPJEqrVt?=
 =?us-ascii?Q?bJ2CDvGg8DOHzbkXMv6hheC2A8rvB+8kyEAIJYXwELbT1NyBAboxUCx3Ju/r?=
 =?us-ascii?Q?hb12bDk9VhJqsOY9o8NPO6jTdt7iQ1x3syO+QbyGy8kCICckrQN4xvRe+VY+?=
 =?us-ascii?Q?xBwOAReVe3zVNFIkZuuZj+THHDmSf9OvU/1I5rwdFGMQK54BJ4RcfGT4GFs2?=
 =?us-ascii?Q?49ZCDLjZGwPbrT6+pLcjzKUY5NVcOO1d1zy54OjRnRnT/82eHMclUC2kt1Nh?=
 =?us-ascii?Q?6hRoDTfhTEEZHJQ65hn5BLxm3ovfujUpeghB1JlWP1/PcmCmcsEZ25b7AVEU?=
 =?us-ascii?Q?mblrzxBqSuOVIJl/ctIq9xkzHwv8nMdoqm6RpjERtsK1v+Q4DmcQnCoYVurK?=
 =?us-ascii?Q?FxVSsYMMuJJmB98/NdnCNoai8WcRbbn4P6ds7ZKJghd8NiD/HYXHrEzFTx5Q?=
 =?us-ascii?Q?7KRfDbayXVWMqvcLG01MkEXSmH+Ap144EcxWnySxWiPMG40Ohs5OTE/JCrGY?=
 =?us-ascii?Q?xoVZdg1WZ20tRkBBO40m80zvf9J1c/G5UvTOnUBlYxbKCky8Qdi45prCMl9y?=
 =?us-ascii?Q?HEt8L0rqDlo/f1Z0FcMs0otiQyD2HUwketnw4vFA2Rpv5IEMZzrrapXI0KqF?=
 =?us-ascii?Q?PgKJr0g6tO589QdzhAUTCTkuGDrRpjrXBtbsnxmHv+Cglb9zv0EB7+BwuWhV?=
 =?us-ascii?Q?nKHocwZgDH6H5GGzbj4ZNpmr6imCA6ur+QlnLSDF7iqdADT/P9RqiRKpeamj?=
 =?us-ascii?Q?fo887J4f0lryDj5elyR8fZzmjwfcdgquhDC6Ttzl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a24708-1f39-4890-e656-08dd446918d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:40:33.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsFEBhhnT3d3FQEkSmHyW70ldumOxwf48VqkjqrtFVBa0SHw5sLXcx3gYZS7pGXS+qzfpLW432GaA8ox9ij0dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620

On Mon, Feb 03, 2025 at 03:58:41PM +0900, Dominique Martinet wrote:
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
>
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - add trailing newline to format string
> - Link to v2: https://lore.kernel.org/r/20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com
>
> Changes in v2:
> - removed redundant error message and now useless braces, thank you for
>   the quick feedback!
> - adjusted message alignment (that was also bugging me...)
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..7069dd3f4d0d9433d62d3c3b494c2f99858e1899 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>
>  	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> -			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "can't get the clock\n");
>
>  	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
>  	if (!mxs_phy)
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb2-ee26f66a01ad
>
> Best regards,
> --
> Dominique Martinet <dominique.martinet@atmark-techno.com>
>
>
