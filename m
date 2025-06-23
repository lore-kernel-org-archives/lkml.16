Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001725EF82
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693530; cv=fail; b=uEbReyEERHOu+pm6hSsST2VzjejHuNlRPiRC8/Qxl1hJsWPj2V8hwTDmuNr7VBm7qAFl3NueiFDATRlfW0yoG+v6HZ72nNzmezGySkcGEwysJaH+uD935QuIVe5pLXA/47qE4jAktofn3/gQHfgp4JLU9rXqBBcOA6iwlcm9UD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693530; c=relaxed/simple;
	bh=SbzgKcfkAE/OV6VV4wnhWNU9JfilGMLHNJlXOs8qtOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DsUYw3JC8CO8rXZYF+hLvhyziPQ+K0NKXfBJ0drfrgQBvtxF0hkqpgPRps4VtFHJyeWCbS108Ore6fenVydEwmPnVTdk4zse8qX9vsRtyiRQPf+ssj9hdVB/PkRBxmVukH3xtTnBwAgmvtKFnXr6N/OrBqqR6AQqBhIdgMBcSEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ExxTMcgo; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ExxTMcgo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSOV8B4Gn03CRHEtuGTLDwFCZr1zf+6kxwx5SIGcs/CTIpvvSdMoZDSfRt9cKreSxuOHHoJMJ52U+UrjH+hnudP3lBwZm6pBH3t/d3ZTPoTn8RWTiYHYmhHmLQkxXx37544JZJYr5rpUP45W2bfHAJKHZSbV5e8PYNnkM7z57MIhFqxsxrdLFX+5CSx0N2+VHQV20TsWuqF0OMhBzi4bN+319wM79VEjVI4HszpPCm+sLsx8fRN6+cn5VnQZB7KKzQHLN98YRjOrUx+sr7d8SftuSlhAKLlmULEIRjlyJ/Rs80q8eqZ4VCrKnz4PcOqVQTa4pQnTltg8c5MyVZJ43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr/2fRS/91twl8t9b/ZmZVXG4FPCkknkPyXjgKyL/2s=;
 b=gewH9/qNbSXZLJEL+haHLbE6ytUXuKrpfqIuENDZMhPH1R0cC3Uu/b/fBzwBl78r8fzoorE7zS41lgdLGlXRIXP1E3gGZ3wFHuzW9TEVrRgBMRH/GvJmwWj92nM7T2+dDJv2mgTcXg0Lvz/SabjU7aHjYPKUL3B7LKIPbT64ISX/LOEQVgR/DBR51xLm1k674WT9dA+Hs9NBnYYfFswCuVwXcwDEXARLMpfcLxb0W5NvdReILl4OtoSwQkBvvOwXcG1XcJbrXKELzmr4BnKMcdqaAk5mVjLw+aBe8mlnLvr9jhXRk4FD0PLBLN/YhdZCidXLh/IEfHOjFfeGdMLakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr/2fRS/91twl8t9b/ZmZVXG4FPCkknkPyXjgKyL/2s=;
 b=ExxTMcgogmm35lT2/dU9eQ28Evq5X2T9DfNnJ/0gcAx410CreytBDx/MapyEkOA/HJeRqsJ2qG8XlvcUf74FmpplhS0anWI8WY5qnoUyQOgPhYSelyN5hGcu5LNKtZ4UtYZWjC61tEK5iG2Wkp+x3aBtLDJ2YJnZZd9nqlcNOhLYG0ntUldt0z3GF2Mtap0ewEeSeNnx3nvbBrdLd9wEblBEMhszE4CuWkzgmLUl3PXwQA6IeQ2Us9NAWkctY6kl4SK4Ux/BXtTT5Z7tNmgeyTItxbc6+Tob3aWJF6SNE7QX84yr7HphO/Rj4PygU3HvTh/YPK9bJsrs+opR16Cwrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6820.eurprd04.prod.outlook.com (2603:10a6:208:188::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 15:45:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 15:45:26 +0000
Date: Mon, 23 Jun 2025 11:45:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i3c: master: cdns: Use i3c_master_writesl() and
 i3c_master_readsl()
Message-ID: <aFl2j4BvOxzl/2nh@lizhi-Precision-Tower-5810>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8f2b4d-7c69-4325-3df3-08ddb26cf8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ezhGeNz7ZH9SP5n7Gbo37k5wlnng8uXqKqKLr4sPNdJlldFkKggXU3c+90qS?=
 =?us-ascii?Q?pYxNk3CiZbawM87+hlDixtkVy/s6C0sc5p7+8btNgjAd5mwjsXWN8KjU4r9o?=
 =?us-ascii?Q?P6Y8tCPT8+AMNsIH/FhfkC7zndrQnEe/979mkhtAKytU30t1Q6ts0Vt6N8Nl?=
 =?us-ascii?Q?G2lhO7allGJyKDETzjD+xqBxnFWmo4n08yLdKB6gQhiEnjnflu/l4vb5/Bcn?=
 =?us-ascii?Q?MNfZb/XHXHbMBG9CVnIiN+lCy3FhoZ8R94OKblHMW9L5gNrWPhcFFIu+5F0g?=
 =?us-ascii?Q?ATTeqrZXMpuBV33zTA8tNG8sxmpUAPiwqM7MFVshw0MnRn9sCDqfr2pjdqOh?=
 =?us-ascii?Q?ae9lezZSSl4jVnx8+ocJmDGRwB3MbN5PHDu0r7cCfVYl/lup0BPkxAjm8lOX?=
 =?us-ascii?Q?eIs+DyVLs0s7K6Fxg70FzS4QzlhgCLU+UMCN8IlibT06n0Ui9L+NffzqM1iQ?=
 =?us-ascii?Q?agu97Mftkf6q7IsTn8o+8MhxExVdmiRuASNGoJz88ch1anFxVacb++s0vYLk?=
 =?us-ascii?Q?2tJM8Z7Eb28sS4ZLMhSBNL4ypdsaQueBROne5rKEBIwhWrFJ16Aciugjh+tv?=
 =?us-ascii?Q?S+qvC3+/f5Ngfr6HsclZbu9JB2+I/pw6ZA5MNVberBGDHvVzARucRPf8Xzi0?=
 =?us-ascii?Q?WYxNgmIjpq8l2JzzhyYdcl4ZIAuSMoX/UxXMOPRBwMjTeUuoSJdY8CYmaaWu?=
 =?us-ascii?Q?8tfwTP9CvZxZGeqq+LfpavwoRwDTzXfpyrFV9aihu0Tl/YpYVcZOoOUIxeEK?=
 =?us-ascii?Q?lJo26njOxg0h4TGZhX4gTSlwA+VLHIqw7Tp+RPG3l+QElkVH1lTHdqXf07hx?=
 =?us-ascii?Q?79jXXd31b/5aIPeyqPy38lcVMcs0FX8oHKXUHjzPaEEZfd2baihlGgwlq+Ls?=
 =?us-ascii?Q?CGJjic/5KASz/rD3HDe9JbiN/Ko9otYo//clateGk/CONTfkYUvzjrDIGD7N?=
 =?us-ascii?Q?xMW/UnDTpbkpOkBGNyEeH6qLobnAOdgC2nH/HumztbRbgIc55tRbn/d+NzD3?=
 =?us-ascii?Q?0yhKSeSD5g8S/7oHBab9rfcZDGq1TMPLxdPUwc8SWzRt55xa3E0ALaPK7uPV?=
 =?us-ascii?Q?4LHOFcF41Gk/7xHYuQLTBRwUQa1tKvyjslbzJOVGRQ8xkBY26cKRZKMH0Hxd?=
 =?us-ascii?Q?9LqoKfsY3BEVb0qOiHqp6WWA0ourNCmhi5rc+s0D4cCjaEFasUrLaJ9jVhp8?=
 =?us-ascii?Q?fSM+eo/wJ+Bp4YfPgQ0dkiAL1d0eVhfQuAffrXIfvW0Y+WMCDQMTjii4b00X?=
 =?us-ascii?Q?7m9yige+/xjHdjsO/+D5YZedqT7hR8awRLguQOGd2uKOL6zECLDFn37qSNFH?=
 =?us-ascii?Q?19Kc+D27oLuoCz4kDWT3ISUMt23cl8QpRKNvFMGykD3caoJ7AC7beXzVtS9D?=
 =?us-ascii?Q?xgYBMvIvgEheadYz+pnM+pC5GJyiMWYgjhctQbpLzjrGYnLoAaxSoupdaWSZ?=
 =?us-ascii?Q?kxENgI79gdaqr1s72jxyKpV7HOoYsai3FTteh82E+mu6KruPsInDzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A/8Ehx1HWS1tD0G3eKTEnu89UZGwZdtrQntzh3oMj6yag8oURqK7huSjWUC1?=
 =?us-ascii?Q?MlhtwInXFo7miauGTZYN3gJWRHZ3C0IbRTiM8U+m83sYlxKS1y8mMQJWEX+0?=
 =?us-ascii?Q?cX8raG2K8irRJr1cjdLebq0f4CnFh3qOAdyzaoAudhVDq59UfEt68TlCQF5K?=
 =?us-ascii?Q?RsnvN2PpaTTrvv2AUxUbPbOR4M+EYCI85QPLbd6EJiuI//2F7eZZkKtlB+iD?=
 =?us-ascii?Q?02/tZNoP0TFP15MiHnx/mB8GhVdMBhrijPvM8i7zXuHsEacI5Wl1XrF+dgzn?=
 =?us-ascii?Q?nyd7Pp+Bn5P/LUJC/y0jtClLt+JRa7XgYlR8T7+U0NxhXvjqKLcgrNkyPhEj?=
 =?us-ascii?Q?AkKOcNKIQKxvntDrTWhKbJGYFNVMSLhYktDAT06RM9RFTDR2AcebhMh0uRtn?=
 =?us-ascii?Q?2S1aw2ugzAL8kRQqGsxKwtmQU+GNkcgwKPPy0JIp9rVqoGcTqSyMdxcFbnAf?=
 =?us-ascii?Q?b5TyLh5ON6ZhxucN9feWXxukgB6Ij/FrjRq9kzbJPZn8Piqbez57GCwJ2uAu?=
 =?us-ascii?Q?9/2MN6aTGaCtrSgnTGSaVl1Y6TcCqR2egcRd2910ZPD2biGVrUOFJaYdR221?=
 =?us-ascii?Q?n9aTivbzwVfSbMszGui+hBfhfz74p01EwH7ubdSuHnVPqH+FkLm0LDgsJJ6D?=
 =?us-ascii?Q?YtdqW3s/Fh4nqoHwxUVrPKcQn7GhT4yb9p/Eq7+fwQLrkkefjKtyaVQ49uNc?=
 =?us-ascii?Q?psvooqfftmbGqeMLBuTnFoc+gCiS96rA9S0/z4nsHkNEt63mKFGk3MWz+Ep8?=
 =?us-ascii?Q?SBOfhljtEISh6yKY4lgNKqFxV4no4W+38c+a3ys8gDp6ZWPad+r1pGqWt3uV?=
 =?us-ascii?Q?CNRF98ddGReD6TLR6qtzZ3wQiuCJdretNN4nu7+edPeWoOb3xMvnHyR6yBiG?=
 =?us-ascii?Q?b3R8UlShJdGX/N/y2ErizOV9XMZip5MELN3p0FiN0fhLVWqPn2LXJV65K4T5?=
 =?us-ascii?Q?ItrKTHAgcXaCjD+1VawQhvJs2xwQoRfVZKlfLgZXNcA4MRlAZ4pRUflwP9Rt?=
 =?us-ascii?Q?TuJ9fAuaK4c7buGtRA5VkIB3DMpAZxAzlSISrpmi88Nl8HzDaDIW6f9XCm7h?=
 =?us-ascii?Q?UzXvoLOp00qBTRczOxSbEA+OGK3uRHzC5Qhg9gtNBYNalU5Ek7EwBL9IcToc?=
 =?us-ascii?Q?ojo5TKqlOPA9tHdqDkSfuwrdHtwkF2LyqgcSrTvSkS7QhUoOxhCEb22UREC4?=
 =?us-ascii?Q?Q24NZSfHEMC1wj5hPXt87ST8HalftA+l51dQDWuhqTnFeD1w/ft3K4aTNAZU?=
 =?us-ascii?Q?p5rtcM058cn5pk3MnVMJlM3ViagZ5FTaWpm5F28GLY3UR6jqahFI/stlnFS4?=
 =?us-ascii?Q?5KKlVJeY4WAj1hJsQfI3Nc6U32GRkDWU8uvRuCHW4UGqCk9+IPJE8QT9cAE9?=
 =?us-ascii?Q?KCUzgTVFcV1Z8vb+1liv70tag6mqZetfVxIswVKq+n0kFc5svdgTOAHjYKe3?=
 =?us-ascii?Q?i1EyDHMKLS3COqtXU8vMSVHZDsQEixN2RxlS3fmC0AJdTIiyu6uCeLgvHM6R?=
 =?us-ascii?Q?v2lWldhHMKOmHZiPqhspKbX88e1pkTSf9oba1oaGK12F3YdtMohQFHTaGRA3?=
 =?us-ascii?Q?tFRH/TurSZgC8vNcorQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8f2b4d-7c69-4325-3df3-08ddb26cf8f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:45:26.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqPrJF+vX/8tl+tS+xwQItW4Yqh5AUWVkkoQomWuby8zd3lkGdWv5WPPAUHcCZuf2hpfA30BrZ2dnQykaSMs3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6820

On Sun, Jun 22, 2025 at 11:18:59AM +0200, Jorge Marques wrote:
> Use common inline i3c_master_writesl()/i3c_master_readsl() methods to

API name changed, you need update it also, include subject.

Frank

> simplify code since the FIFO of controller is a 32bit width.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
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
