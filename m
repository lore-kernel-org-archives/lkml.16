Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E72E88B4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788657; cv=fail; b=EGQz1VVxeWgU+H/8ZA3ayc1Z7doKS0L8qhHQA4oGVw2PxWMSshXHL6VBa+kyKHIC5mCWmaS9/T345j5Q8Jo2AoVkOdJM+PxtIojN/W9oFOxVLENB2VYtngnGkEcDF2ZvMRLw8Je3UipQzGrvCB9JtzFL9cdf0RoVOXN7us/WsUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788657; c=relaxed/simple;
	bh=xE1TlXzFjfr4sILNy/eEAnDMPy/h4dfpV49sR+h4sWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l72ZRnSaa3/+mkmA/V18C3mMNPGF8bI2HQXx0tltmsHk6hJb6Z5B8SbXW8nJrE3axLhuvY37GMICqKzdzLbDPYPeDWY64a0aeYJ0TpPlkOskQEn5cvuesuTf9nGRNcpDJSdMtrUG4ziT2SK6Ohe1YOrkEgL672lSwJHh8Cim19E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=En7RqZuf; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="En7RqZuf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br1hhYaG2XP0n+G71fxK3Pkjf43tkjQ9ox2IyNXD3dwlWIUxB/jQ2DWaVfxDorfJInRl1hk4e9oymj/WCQkg774ex7YUByld1dt7Jdj5WGY/bxaabp9BDn1vZvmPoC77/14F4dftKNYxHvzEJ/bt9sYfdwbLkzEeQpQgGbHFHGB8N+/H5985YJHZl4O7LC+rPFsVfAtuZDOj/yUTUfmsYtWWYRjXf3HNnp1alGtTDAIABxa26whTgb1ZwpxSkbbOnD08TScOcRauLPls2Z1YpoAYmLOPC1Mpa+tcuIUFOAUIrtBWs1otDJuu5jzd5BeFOBUEBg8omlvJeNGCRR0/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYv5cMogO3MbuOaIa8MrxcW8HrTqlDIGidj5doszxok=;
 b=N5pO9GQE2RWGPrd74RTCA3/KPK1xrnbVYOpMQZTfEWd7AU/INTpdGPvNUmUZyde8rQjM5co0jSzx/nJO8PbKoFw61k+hO80+1hTRTLp0lQSrgw+5ibL1YLQf9Yw7Y6UOvD/TE8vDXcr6TrWTVw1Wziy6VOv6mMciiLZCrUqlbeqbMaNkGGdb4SUmGCQbqkqVpKBynSuhfwdXvW66m8BRQ+g2ogMUugTydcu/xL3BDYFuEYxfN5ykYwPBYUrKD2Zh48uErw9V9SiWtSzrWmqRa2jZ3qJNo4x8xQYDw2O+ZG6ctnWQ1CmAXMfxplgVuLuujjSg4WUE6O+TmOEf4e2Tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYv5cMogO3MbuOaIa8MrxcW8HrTqlDIGidj5doszxok=;
 b=En7RqZufpEgJNazu5mM1llbmgZJ0NKykeTbaB1qdJEpQ5wHu2o1GH+4GXt0rfIFDhxgWqGLttS6NmTmqk8oXD/pz80K8uxVoxlP5MjuN/QOyMy6zk4smy4grB/JJ37ADPQK9kBl572lDpJopjvDj7J4hUsJWas9xXjlbL5OTc7RUJOiXhA6qaRJpoS9WYtFsjTz0KVWe4VPiau9+w1SStakux6rbgzF2cEvk87z8rSNZf62Un3f4IkksbaTya4owycSj3WEvhQqbxZyfH9i4EfCUVvgaSd1cTP1V6VL1zTEclYumD6VCv4YmZrrVjXcTCg57b2bITKJAAP6csusYZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10711.eurprd04.prod.outlook.com (2603:10a6:800:267::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 18:10:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:10:51 +0000
Date: Tue, 24 Jun 2025 14:10:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: dw: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFrqJ0QahuNfsoWj@lizhi-Precision-Tower-5810>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10711:EE_
X-MS-Office365-Filtering-Correlation-Id: 052f172d-e93d-401c-c1d2-08ddb34a7417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lcWD6XBssvg5VCgEo1Cw66aDWqk8rPTRVN+Nm313P1bGidnDHmuoltzQJ72R?=
 =?us-ascii?Q?3kF4WcAovS+FSrljm70kD8xxhS372tNC1umq29MqQ5tKydUBLOhiRcFMkKk7?=
 =?us-ascii?Q?rYX3r2Czxk7LauLda9/lQuFz9MetKbftaGGV0wY0anYhpEMpZFdIcs7Akpzj?=
 =?us-ascii?Q?UpNYIh+qIUGtEk8J+He32cibGm00iF0q5VDFZoE1S5CN4yesSVcUF2h3fR+1?=
 =?us-ascii?Q?OAh1Lmu1spGTs3PHwgBZJ35HzE0wP8N1GHsVupfY+p/ooU5QI5ItUMOSVOC9?=
 =?us-ascii?Q?3C9oTgrM8r9sprYZVuXpkHCEdHLHR5NcG+K3SFwF+MuOZI00sNV7MwuyVLxX?=
 =?us-ascii?Q?GIa4iQjQoeq+DT+Tm8hhSBezaBXq+U0cs0BZvGAVeU1owWULymFQ+NiiCZRe?=
 =?us-ascii?Q?IMGOnMDDSn4HAn7iOdphr5IAvmf1F0HHpdEgJCr2BBQ061jpHN5MEDsiYEp7?=
 =?us-ascii?Q?epqhk/VV/bJjOwQD9CXYNSV7lfbIzjzabx+PB6tyOZKaYp6N7965s4dpPCHu?=
 =?us-ascii?Q?Qi5/9yPFOIH3qzsoZsrQ2ShtOxRwOq73lnQF8lLwP1Q7DvMvCcYouNVfO+Pn?=
 =?us-ascii?Q?RNxK2yK510osAbTkT2k7xioP1vK4yphTvSOJuAgGuoOmRPoARKqAaR3NKbGX?=
 =?us-ascii?Q?xM/eIkTk61RDTBKwkgUlRmcemuyxMXjEC35QvB8i2h1IZpvGPgFYc4N1ceUS?=
 =?us-ascii?Q?C31c4pq0MWtih0k6BUBtiQ+1pE2SJYf6l2bnS4jRHd7Du7VMup7naL1tmBw9?=
 =?us-ascii?Q?dPSMv5vamhKVoT5DNY72FIeMXKHHGJaQc9kTAnyRfFX12wdTHafLzfLAWlSc?=
 =?us-ascii?Q?kvMH87Acqi9wkr9/P8mTjOlE+quVa9YRpngicQdZxNj1VIJUlP1+GLcgpznK?=
 =?us-ascii?Q?JOIxGDAOJhDypw1c5zHa9P3XGkda+75f6o9G7EW+2c+zhah78TXoIJs5pQer?=
 =?us-ascii?Q?5kngre/J+shM51VfH8yBRbsf0QSNdWVdyKApN6wedKzkovmD2YvGGhP1Fva7?=
 =?us-ascii?Q?LIsWafM+1sZxv6zytkLHqXvm21CpOx5h9aEr/oPu7GtSqxBKM0foIdUdjzWk?=
 =?us-ascii?Q?ouxd209eumx+83wpx0saIdTHso3/uJUZJl+JTRCMzwdKRx95f/hSFQf3GjTm?=
 =?us-ascii?Q?UVa7yQO3AZ/42H6CmKsbGLd5v/JCpjanGx3PJMxj+BZ40m1TiHUqHWeo2QOf?=
 =?us-ascii?Q?sH5Zlk56t78Klzij1Xf1MeHEBvPzQB1ts4Fhcori5xKk3QNPJJRRniNHyS4F?=
 =?us-ascii?Q?DH3/F1mrmivk2PvhgeTjETXmDzdB27BAUU0AAHgLngz03QBz7+ociiHu936k?=
 =?us-ascii?Q?ZCjOHCbLEOwBd5eQ39ZOidZaDk5NA5iZPDeYb95eGKjdn2XlnI3ydkIHN29x?=
 =?us-ascii?Q?lrJmSd1VwbnqhfcXZQte3SHxYpZ9BAFyEekCGAmyXoWkP9OhPhOYXqxniUvU?=
 =?us-ascii?Q?zYtiZxOx+VUV9lrQE6D1RdiSUU1gwO3MN25HBOHT46ykLScNzZtSAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1UAtANFFjvvDxqSKSiipB6jkZ77rUFH6P3w6pzDT38RNtQv51hV9DtuLMRl1?=
 =?us-ascii?Q?PkYi1zpTl13/cpekaPRdLVEVGTgzLe1yzwdReuaxmMD/XyyfzaJpnCNnhwB4?=
 =?us-ascii?Q?RBOnSQK3dMh550bcSpAUSVdlCWQuQgDMlHkfnlboGwf29YAC0vfRJQF9Mo/l?=
 =?us-ascii?Q?LUcZ7iJ6asEuemjgsyVkbUmVO0ov+FQDmtOWF+J3TSRZ2PUlSkoJsuGxAxgG?=
 =?us-ascii?Q?g7QbOQ6HR/w+RlMZpx7I2oXa7cSRzxwHPcHDeAx4vFRSczFyKZsF/ep0wqA3?=
 =?us-ascii?Q?VBooG4n5vpIL/YpXIOr081sYHae5BUR0EPs77JzYEyJwnvZbwkgnOoDCLnBd?=
 =?us-ascii?Q?k6Jztt1OFo3xn+UxdaT/k8BrDxHn3/6jIVL7KbNRqcf/ycvtV1K1L6Vdz6Bf?=
 =?us-ascii?Q?v9ptokYgWmSPp+xVXcaIMANDpqfbvOHoO2RY9rx3kmncl4Lm+A5qDoAGZ+RA?=
 =?us-ascii?Q?AT9o64HN7kMioURz0CIC5rOuCLN1GYMnHlad5dvWWXq0XpXS8BKshHg4CKuv?=
 =?us-ascii?Q?J6aqBKJV9RXnXo+FVffEOmKIKLXvlOnTohoGxOI+DfLyui8YMv6lco6h+HIM?=
 =?us-ascii?Q?F5OQv9Qm9dMPmaSY1+87uPvgfWwWMim5b+P6KfWl1Nd3jjlpFfN/uU88PLKP?=
 =?us-ascii?Q?APJzy6jnIzPry5ijxYrO54CNhpgqqA9+ImD8XfdnhThBu0DKesnkOoLuFTgj?=
 =?us-ascii?Q?DtLeRwyDNPrlN44OGYQW3EvrqViIRKghYMD47LBjOPHpkyT3eX8WeHE9Dqn1?=
 =?us-ascii?Q?DJif/Oi5xDYVOgdkAe9+OmIi3CKHU8A0tp6C2BOBwMsBTa+Lz+jrsodjT/kq?=
 =?us-ascii?Q?Gm8/qPWQo49HmUJN+AYObw5mTdKd3NhyF0otwex24EyrmvbY/Vrre7UQwqmV?=
 =?us-ascii?Q?PmsRhoQ+MGVKWqfsaanu7fvXmHQ0MD2LrjIbh2GZDZlC1/h7Dp8M/CDlSIGz?=
 =?us-ascii?Q?msTfhma4+lu4H4NkH5dZi/mS8yG7dbVwLILkILd+B+V/n8HWeTdeDi5cQsNy?=
 =?us-ascii?Q?Zuc6W1BjmCsMIFxHfVel3D3kZrUpcN3pZHCXy5gckA902QDZ0jnzBYcF2Ycf?=
 =?us-ascii?Q?dWR00jDQTImEez/msYfbh4oJI8pEJmkCSql0rIYi1XlOHiytlJPjpNE7mHUC?=
 =?us-ascii?Q?ZwhapsNxO6/AEqTYUH37keE4y2xXB4kJV2AAWFle68CpEOLL29z09K0ztx60?=
 =?us-ascii?Q?u8CQLcAEOdfUUVa9JRa6pxHCesDcK5qqDa5Zz4nH7ubnfKtrJkLpbJzxIWbm?=
 =?us-ascii?Q?tLoPQHBKG4CO1Qig2V9ygJamRchW3uIv+i1+eI4vdOvwmCT2PAfRuaJNvAJ+?=
 =?us-ascii?Q?DC8e268Gm/cSa+IaJEb1GxHQmY8oR4eSjqQb+EUlwacsSm7n5SJmpwvYxwRt?=
 =?us-ascii?Q?1AraZubgCRAhaRli9VTz+knXPwJTBOHi70QNDGJgmv0IlsEdAFr+yUJ5EwnZ?=
 =?us-ascii?Q?giEneY+fE0J5YYV2GkU1Hh76ALwtYbNyMfPMGQd5s67orhXwTNl/lEbc4chD?=
 =?us-ascii?Q?M7kxMorLi1Eti9H6MHWt5e7+zrzA5S16VhKxH8zfwD5BE92t9LqWRTsBBG/b?=
 =?us-ascii?Q?4BRvPmz10HAti7wY0CQu8rmkvrAdgxFdqLVMkApe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052f172d-e93d-401c-c1d2-08ddb34a7417
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:10:51.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zcv4DMwSNK1yRcGSVXbl4dTDYDXmvw2eT5/DEHPUQYwG9fhIbt4xe38x95cnqgUKPPKfUZxGPkaJlY/8xr7vbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10711

On Tue, Jun 24, 2025 at 11:06:06AM +0200, Jorge Marques wrote:
> Use common inline i3c_writel_fifo()/i3c_readl_fifo() methods to
> simplify code since the FIFO of controller is a 32bit width.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/dw-i3c-master.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c1572ddf717c8ad473e44a3b8fcceaf..886f8b74defda31ae93248467d144f9c8c561581 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -23,6 +23,7 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +#include "../internals.h"
>  #include "dw-i3c-master.h"
>
>  #define DEVICE_CTRL			0x0
> @@ -336,37 +337,19 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
>  static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
>  				     const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
> -	}
> -}
> -
> -static void dw_i3c_master_read_fifo(struct dw_i3c_master *master,
> -				    int reg,  u8 *bytes, int nbytes)
> -{
> -	readsl(master->regs + reg, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp;
> -
> -		readsl(master->regs + reg, &tmp, 1);
> -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
>  }
>
>  static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>  				       u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
> +	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
>  }
>
>  static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
>  					u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, IBI_QUEUE_STATUS, bytes, nbytes);
> +	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
>  }
>
>  static struct dw_i3c_xfer *
>
> --
> 2.49.0
>
