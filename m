Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD8298984
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788590; cv=fail; b=dl8JURoFn9br/MaydVEp/mZRIIqXzNBmju/DCOvzcq99dylmy/h1IwCXX7sT9Nf2NoZJuQPIGcSmbp1JAIG8pPTclMkEYtMv/nsmUnmLav8hSnrytdxfJuJjgJkfwSk15mtuWNtgsxXsLvN9D2l1gQikJYriFPvRBLuEZy6diHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788590; c=relaxed/simple;
	bh=DsrdvNRUQ1aPTSPIdvesC7XRJldUCxDZSt+/7dzB/xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CsiFrLdIYQc3LBlIZYyQx0guH2OEbPsHPyT2vB3vkrhCwvwU8b0Xir/f5ocyrdmQOisgbfKLj2O/e7u0ihv1JCMwUJsppzan0TXAbFNS2vhn1i1hzLgi1p1Ee6qAaG9isuCLi12lJ7XD3/M/1z9MvnxLog93f/KbC5pQGwVlsKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mg8MZNk1; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mg8MZNk1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRZ8pzHc+sQzfqQXyGhLI8yyAPx/xLUSfLl8jtsXd/Z0e8ucHa6slcStCxTTKZZGt9S2S7EPuS0Q959jxaq62kvIs+fvh/jBQ/JgVQx1Ntx1k4k+eGQULb1eXnqYS8ziNsgn5UTT+koXwlpRn3eIFkcbKfzrm5Y5s97Hu+/nZvPM8w/hdZbrAPEGYvP2giFaePcc6GqJmTB9CObirJHFaYYL7rLMrBPmu781gDnC3YjUwRoUvfO2358C+mGErFdFju24BjL+Nv0NKI2/UueG95Q736ROCnDOS0gynRl8NH/n2g4sTtsOvJN9noKkCWcqGPYBwbjxK3KZ0tGdN6FplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJpJIPIVcZe3uPWCmIwZxxD2r7+jB8pVvy+skPHokbU=;
 b=TB2wNd2a/hqhQv8rtrVMEKenp/SoZJv1cT7R92ApGf5Ezl6EKl/1MFz4RWAHritXqBEdBjI1+KCq6UofddSpwLuHiZdZArzqRaybP8PTc47qU4MdDo85Df9vudsjQf6a05rIsdLW5SeJVL0JSK29adQjbQp1TvV/uASfi5AuwG1rs4KYDvCGTR5mrICC47FAp5JQwRPAVr2A4vgbWFY8A5MqfDqlmW0BEztnx6VpAlSQaKeRVv75F3YuTPN/jiduOb1PxdlU6kwT2538wVtR7VGqwL4Rqu5iBzsA1nNfc63OqB/+CpeyZWVRiiNkW2EebWp7pmHaqOjX/mtXQTVrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJpJIPIVcZe3uPWCmIwZxxD2r7+jB8pVvy+skPHokbU=;
 b=mg8MZNk1tQwkzZccSpGD2KdOojW1Kex2XaICt8WGhYY3NZ5IuOFrVb6tPHOLbduLLFuJ5/grVEabHmSqutbSxUzxAp2xIaGvWNaA5EKAvUj+mnXj0yugIcbrXPhCPEAd4YIBg0nl1zBx3W7qnQ/SZHV3gkMhaz7L4QdfCoGD0jKiKzYlc2qYcMz0WTJF6zdoFTZWKxgzYoFamg1VaPT47qToFP3LroPmh6Oep6ZGlP3eoI+BzgUegzWdp6qxt4l0oKlgvzKwk1WNrSqwKCzwf0B84tnmBoMq/XAnDVMkOaY/zbW0AQO9dj5we1RSg09EaOA+G4cVFuk+VDe95tXRQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 18:09:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:09:45 +0000
Date: Tue, 24 Jun 2025 14:09:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: cdns: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFrp5DKw2OKe2lkS@lizhi-Precision-Tower-5810>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: af03de3e-c839-4f2e-a5bf-08ddb34a4c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?coT6L4e3850immYklgIH4iZTxXWY95g2+/7+TYu5aKa6ErcOVD9xrjBe4iTd?=
 =?us-ascii?Q?dVxmRljqGa5BMCVEd7jw7RXRYolWugeq6u7jVWJOZLJY+kNTM6ZShpXi5sYf?=
 =?us-ascii?Q?tvuea8Sss6+hrjvRqSg253vuNJJazkRWcdd+lkjRxAek/kiRz3aMRVCzDlB4?=
 =?us-ascii?Q?5JiY59B4/PsZqG23HDWGnoWWCdHkBHlmm5cLqo627MG9ThgfFW1oJvLcgAna?=
 =?us-ascii?Q?HKntOxIktMaSI7NrWgzDAWhzKm0ggxXn8a8BB282PEgWpGnFa+81ly90gG3M?=
 =?us-ascii?Q?TavGjLvPhr/yqXH24Cl23ecQS5NjfDbVVBwVK6Tv/8JKfYQZFJKwaGA2hRmq?=
 =?us-ascii?Q?MhKEh342Nddg5xecBlJ7FxlRubxlV357kAwE4gn1zb57JLr4Su9lg7QULz0f?=
 =?us-ascii?Q?0aSkNGPhj5mgN5lps8j/h9eNbhPgK3ph0amgqae8JmkvtSmv7IlR1qEPNk3l?=
 =?us-ascii?Q?GW3TqFwLbFqdrIvjGE3z6wckYfZkcxuhiqCoxU557x+VoMYb4LcGv2VvDG3F?=
 =?us-ascii?Q?1/MF2T1b3xMsYJ9goNT5LxA8o+UifuwTib3fqdTMfUDHtrOeHXo8Y/QroFF9?=
 =?us-ascii?Q?5tnzXTTIVVgNXse5ulJEYB1wmUwy1qAwHe8ZY8iCby7UELfwqyhtl7quXz2W?=
 =?us-ascii?Q?5Y+rATB/r5hcNjYH/eGvWYA876jMWX8rvEHr8JpO3fp8vUhR3z9ysw2TXr3k?=
 =?us-ascii?Q?CyHs0hCc9W4mxm/+3onCFFHz40qOnx+elv0Cdv10Yw4/jMxIN5P1SyYrftyB?=
 =?us-ascii?Q?Kvo+OatAHW3GLKCs9LM5Z5qT1RZnKgm1JJBIXoadre6px1YkpM20VtcIZDxc?=
 =?us-ascii?Q?e/bjFV51xlpa62js7VRuCe63FFCyHLFvNM3F5PFAVyjb6Rn7iIlfRAw9PVEc?=
 =?us-ascii?Q?5FdI0Z/Te/RUDefDD0sbKO5awxHKBsDv3FKpn2l61svPlsqri4+4S3VyC39Y?=
 =?us-ascii?Q?YNXNGHyq1ZLCbeOKZvfUDsvGHkT2VlUz62yVt3pkk77PW32ctg5gznMN+6jn?=
 =?us-ascii?Q?WbzLyqy8nJScdkCBRHlkbP6L+WraFq68FWzb7H0HxOMp4EPl7Fh4lgXzlHD4?=
 =?us-ascii?Q?0foghzWQOcT+haGDz2TV/kX880Za/d1I6FNcMP4NOMczISjTglPJxYAZ4CnF?=
 =?us-ascii?Q?HLgOPcS/nb59judxC3dpD5ms45Tudh0CZPPTU+MKT94ZhZdVVHn5AcS006cV?=
 =?us-ascii?Q?Ynd3aBImjNa/OrX3EZ86tkWDMi1fULXGbq6DAVHNrmtzcRvC7PcjRhqLtHg9?=
 =?us-ascii?Q?Ja9QcO5nt82Rmd2Cbr0kkjot0IRD9gMdeEFveVgMMuvS8ZX41IL57VNeffA1?=
 =?us-ascii?Q?P7j2dZI/33Q+YjZJHrYp5JjNAaYbYc/a+7Lcm8BVyNiyKMhrdVLtVw9lnfOC?=
 =?us-ascii?Q?7Y88J3PMfb4wWyuE0KXbxTMpzPHuI7pSyIEDyRK0+RG5A7k8k452fISHCyBe?=
 =?us-ascii?Q?91jMLQuVV6YQlQk9EGkTS4/fhK8o8WACph0Cjt0qEkk2QaPRwe21GB4YuJY5?=
 =?us-ascii?Q?ZXKg5oepVIMVaes=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84Za6VTNfSgHFWnqFV70oPaBF/vMTO+1+Qo51FQps5fnpIdmRHQQD3nO7pAX?=
 =?us-ascii?Q?k0RB6lrKcYjbiFUMYsnRFuRVJWcxhnnj34DOBr4/MgpA4RamA7xd2d/lAfOh?=
 =?us-ascii?Q?l1rUCwmtQ2wEaDZMM5dhVcEtUTnNP5X705cfCaErpsKkiBg9bVr8Wyo9427v?=
 =?us-ascii?Q?UB9J2TOEG/9xSXWPI3+xro3/1pDCS+fA10p0mO/5Mhwk0hTpVwPqWZ14c0jt?=
 =?us-ascii?Q?cLf0mmwdiyL4kiaEdLCpYaGy29M1iYx439eHqICpQKlB5w0efngAK8DvfBXO?=
 =?us-ascii?Q?8MBq29XrlmExSmPWHS7EQNTmlmj7j91KsbNTS69tqEjtONTjNFP+IH3ffMpY?=
 =?us-ascii?Q?lZHxTlM1iZc/OG/9rwqvO2FCob1lEZJeDKs5dfwKIHOh/K0wq0C+pVkZ9kVh?=
 =?us-ascii?Q?6gK+oe4ZOLXiqBsqWGMpRi4VajfS9j/wDLwvRHbaK8rtSMuejFoolLgiYF1e?=
 =?us-ascii?Q?2+7fRuaWTKxp1IyNC1c+TKUPRSTAoMwqKOicPf0/fQdcPXKGMMA3yz5SxP+U?=
 =?us-ascii?Q?HEjwkMSrA+aHzJ0tI6I80lPBMcDjSGWBaRk0H9S2tBxb/vBi6vViozlyViRT?=
 =?us-ascii?Q?MD53y9PFlY1Twy7UlnMkKGsigt9XQcGsE3OoDsYXuLAEMZKEqgLfiaGUiDfN?=
 =?us-ascii?Q?uS0v/cqcfIaUCPKzcUtxe6u82GSPe6c35iIq2vr99ya/eOzYDMyqejvnfu1x?=
 =?us-ascii?Q?e7DR9XaKDNwrQ3fb8lxVUADE5vr+9+lSUwdTKa6uR0LABLdwhzbV0uMX50wC?=
 =?us-ascii?Q?Co+W/F4ZcQwWAHn9cdUy/6R+WuW2kU7Qp8YLYtAEX9MlqGof6E3raCE4j3Vk?=
 =?us-ascii?Q?DjELTNRqCpil3uCQGl+WZ6dVdwnmKpPsFXHdW2RV0u2LQ7EPSxR7jgjdhZvi?=
 =?us-ascii?Q?pTxSBHMZRxBBbu49FETNk3WSaeUSuAownNLlr4JX0eYyyWZlVaGyIGoNOdGp?=
 =?us-ascii?Q?PZSIJc0MtCmRJ+E2O1yQ/n7ESElxmRjtf9MfMBDvPY0FnbD50pyNwTAl/vjI?=
 =?us-ascii?Q?tHfisOhQYPCyWfU0nNFZyiqhOVz0aF8fQ5d5A9q2D02i8SJXQ/QhxIzQZbSx?=
 =?us-ascii?Q?f+ibml3fHin20Pv5rwRPRe432pwmEPUDR45hFAIqHzSI7oLTKOkGLPQnjU1G?=
 =?us-ascii?Q?FeVPGK9v/XGzV15kl06SqJX9zyRd3ivhTkhIPdweJUP46iTHs3VHNH/CNkw3?=
 =?us-ascii?Q?Fmd86RULY6Tv81jvoOIcH3Re6AwfczjnaNOEJTeUAkL+YXnO59XrQG8hJU22?=
 =?us-ascii?Q?pRSqxi0OZwwn8p7NdKXgE86LsWrHoCB0kGkXEWMp1wYemBd0Pkf5/WETS4Vg?=
 =?us-ascii?Q?bLZqCM+K726SZ0GH7QkK0+SCtRetRmRON8fGtwRhYFZbjLiYSSFPSV3Mm0t+?=
 =?us-ascii?Q?MVn72JKv2rAS3xUaZD5zPMpFldZRVJFJYWAWBleQswHH04QIdOzA6PT7FF7w?=
 =?us-ascii?Q?6OBCrsDsSHyUsg6gFx4/LH2g4rL0mlQbY/hEBEOjcxzPKsg6AGswsNrXgODo?=
 =?us-ascii?Q?1Vur9AcWZ6RVKK6tDU+Bodq8SEBLYp3Pod4PdDjuFlmbT39TaPedwh3o6lO3?=
 =?us-ascii?Q?+jgKl3JuwpBPrgVXsL+Oj5gAV34i/wdm3DhQSiH2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af03de3e-c839-4f2e-a5bf-08ddb34a4c6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:09:45.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XHjTG1cukRvVjU4SzWYk3d0rirnBzmH7r/YbS3Ji+W1eRDPnqfQ2bWJnR6BvDAnOkqSyGprfopLWmpVX49C5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837

On Tue, Jun 24, 2025 at 11:06:05AM +0200, Jorge Marques wrote:
> Use common inline i3c_writel_fifo()/i3c_readl_fifo() methods to
> simplify code since the FIFO of controller is a 32bit width.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/i3c-master-cdns.c | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index fd3752cea654954ed1e37337754e45fddbbbf68e..321c04d2109ec1951f2b07a9d1b88c6aaf055c95 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -23,6 +23,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>
> +#include "../internals.h"
> +
>  #define DEV_ID				0x0
>  #define DEV_ID_I3C_MASTER		0x5034
>
> @@ -427,25 +429,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
>  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
>  					  const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + TX_FIFO, &tmp, 1);
> -	}
> +	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
>  }
>
>  static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
>  					    u8 *bytes, int nbytes)
>  {
> -	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp;
> -
> -		readsl(master->regs + RX_FIFO, &tmp, 1);
> -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_readl_fifo(master->regs + RX_FIFO, bytes, nbytes);
>  }
>
>  static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> @@ -1330,12 +1320,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
>  	buf = slot->data;
>
>  	nbytes = IBIR_XFER_BYTES(ibir);
> -	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
> -	if (nbytes % 3) {
> -		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
> -
> -		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
>
>  	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
>  			  dev->ibi->max_payload_len);
>
> --
> 2.49.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
