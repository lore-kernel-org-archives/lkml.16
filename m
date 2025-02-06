Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2071.outbound.protection.outlook.com [40.107.103.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7367D237160;
	Thu,  6 Feb 2025 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859231; cv=fail; b=N7jgVMvuVsyKCzyNqxY3RmJMnwPa724yth1SfpaNgGaCC1MOdbj9XGIstlLy9bG+faL15rKG+nd5iQuiQr4jYVKpJkDdzNFuxGTBsSfeOZpbjUY+MjzwKL46iKEQvjq0ng/5916/5WJGuHqLKVX14mPGzWsN2NPDBWJlaLAALdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859231; c=relaxed/simple;
	bh=c26LbcA3C+ARDICZB6SB3npvyhC50Fyx5Da9wZ8VY+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFlzeJ5YLyY3dxTgyL2CkieIcrLtitTiBcjoptCVu4ABzcfg0BQ9TXIvMglST3H6X/p4xVDbzxOnGQvzzeU2kVtDD3vdql6YYXyvb+aHE2YBp9/Szoaw8XdahG9LN5ppjlNenbYjmmff6IntOk/3P8X2J+IdpNbDACR1iG8UXaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jLmaZrPk; arc=fail smtp.client-ip=40.107.103.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jLmaZrPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w17DRpA2jczFIDseeK0/K4usF8EvaLjmTnhPCmRmvpGLJL1AxL17HDp2pYqNgFfVKe2gCWF3K7K8khmEDaSdh/oiyA9JqVdz/kJlhhDuJPaumCOQe5xtmNLxdxFeQagLgrAqdyXZe8vRlzWqziu/ArdVqUgZEMXFEaI6vAygBAIS3pnyL/ALSPxVocFjhRInqPFq6er3T25FhvNfYl66o0f4H8w3n/K/X3BVEkYItosSzDfdkKQ3aIj9oLPdYoDJF+gnw0h1/F7eBcmNt6bh6/4NkRHI7FlShkoieazvxEJVPK7tUUr6FOI2sNd8WfqKp8P3df+xvvBiOoKe0AXxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NE9cOK9nYZFSF76wgDzFZJ9qlrfW2vS8seS0hCd1Uk=;
 b=KYI4mxrzyfXMYfAbg3vor8kTr4ClvCC6O4Rz0TPeMfjoYJ3jO9wiuX0YnD9r8ospKbQLs3ThDi337Lfk0MZcsWIYDF++ChyegQXbvXUeealKuZJOgaZ/vGG0Rtonh7xNnGLph446i+PCoGBCRrwmFnfyEtk+QjwHdZJfOeSBDcK1VT7fjX97iEqY2jdCEAPNrYxQKgErRbiMG/DyUcTLHPwqAJZtmz5ZY5bBv/lDVyqiNBgA5Yyd0ycu3bUYtbzNG8tffffermWJZ83p3IJ+nqIf+6tRy76LJuV/BxD3pU9xDrPTG64+HUlZQZzIxcMgTW+fvh0Sr7985+xCSbEj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NE9cOK9nYZFSF76wgDzFZJ9qlrfW2vS8seS0hCd1Uk=;
 b=jLmaZrPkSLCPHU1BSV0qFgWISG4QXDPoUvsrt7ZmvvrahN+DIHIugadtYj5z+pZMLE86QP2eIRIGpyapbp0Sv6A8Rc3ITXY8P+iQvapetiZFKx991G6JHoKtE6ZxwzUnxbrZ7gfvFnbcb7rqDjINibccVFSZlwKkg946p5dsuzk2CYYmzPsWFgjXUNjqqv9Cuv+EWLhty6nO9omWSQUg3zK5Irb13kn6Rb1L+vIjd2bKDKAPse6KAQyJ3mllSeyIzZNo4XofEczKNJ+3wnj7hT/y7dlQo+wnXPKNb170fJNcJOQ3WTR2K4tzj7tpu70MsvMY57zr8OYjGOVHDnwgow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI0PR04MB10464.eurprd04.prod.outlook.com (2603:10a6:800:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:27:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:27:04 +0000
Date: Thu, 6 Feb 2025 11:26:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 6/8] ASoC: SOF: imx: merge imx8 and imx8m drivers
Message-ID: <Z6Ti0hn+iANzm6wd@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-7-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-7-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI0PR04MB10464:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3e81bd-7f8d-4417-cd71-08dd46cb178d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Go6gK8eVTYX4faje2IxkCsR1eWr4S9nk7LbWxio7aMajOu4FgOZgNR+rjkOc?=
 =?us-ascii?Q?/phN1zGUi1eW598YsnvRPMM48LRg7io5B5j1FODpbcc3J1+nPyeRKtpJ+U2j?=
 =?us-ascii?Q?3OkBEpayeHAPLKXtmR/IF81s8J6ibEr5EE6W3cwOPvcgEW9JzeA7CQRhT0gS?=
 =?us-ascii?Q?zjdeUI8P3v5debR1z9HxaTJ4l5VULdx3vFb6PrLiexLBHpKBa/Z2i9/6anXT?=
 =?us-ascii?Q?jEwBEDyTfj406mirGTaDH+sjqWUmTcfH36vQHSdukR8IJOL+iOUnujLjUIhH?=
 =?us-ascii?Q?2/8WQtlCd6LsoQ2bs2zBwtr4YAK1iNf67RuvshVOuADVvihq2zPSfnvFqM3R?=
 =?us-ascii?Q?m2obhrY/YVkTt+dkarSVhJoL3O9AA1+Wy2G+gnO9QzxVT+b4EqaX+GChLIoF?=
 =?us-ascii?Q?hobGrC1z2C1vyBtuxMaRNyuQdJZBF/8Ha2lJlLoYCtLNjlGesX/IYirPa8iJ?=
 =?us-ascii?Q?ch7ImPVLKMq0q4yI4fmBOCRjQgkkih8s2oQeaNg5u+MvVl4RysS5BAJOhs45?=
 =?us-ascii?Q?BWQeveouS8UcMYkDoX9ULtvcVg3cA2V2vOh5/bZJOZUs2dBeZtEsYBAqnxLh?=
 =?us-ascii?Q?8FKQGP64Ww/+YI5+SKwlHOogYv9IW8UdOrVg1p0iDAm1SeoyUKzM89roC13o?=
 =?us-ascii?Q?FmwOX6MirVxCen0DYmJv36FTF7eqb1TpB1Sg9R+3LIQedOGYOBvKiYhUHqeA?=
 =?us-ascii?Q?llOEO1Q8chYZZOmv3YWjSXbRPLRlOKFIMPtTi/Cft6n5pbpn7Yin7C1heTnb?=
 =?us-ascii?Q?EA/+QTzjGlk4ucBIGUssEoC0sq+o/ExVEGX5uTcxtOPQe8nHPfNI3XSyejlM?=
 =?us-ascii?Q?5ksolWu23N7CMitui6rJoY7fOWWS3GBBx/5X5to7/zC0Yz80jKSenGLTsSCH?=
 =?us-ascii?Q?Hvz4zQ7rQYpThVdpolHawpPtKXyMxnh2jXz08qAvwo8da3Mkzgk8Ty8YPfYs?=
 =?us-ascii?Q?qy4JLcIagWIjPXwGCVAvE8W69zBOYxv5+hO1jbS7rlu7Rgz9hOKDWGWWZKEw?=
 =?us-ascii?Q?PPORjtgzk4tdLq3xo6kukdG6/DzW8WehHp1QGWEotzW8DBiL7Apo2fORrBzD?=
 =?us-ascii?Q?KzU3eRamGf3PYo3sNrFQZhm3nRO6swLcxgZsoVWfogYAttGP+ZQB1HoafqBG?=
 =?us-ascii?Q?Jrq5m2eU7bFQyHFhZBnmpP2YRStgHbnBXrc2ndIpgejULpvhbk/LFJMN8Z1j?=
 =?us-ascii?Q?+kUh11V4fpab2f7nyC7Gqaqv9yjcGfgO3HZ7zCKNV22KPc4M29bMTnAlVLbL?=
 =?us-ascii?Q?bLuHQHlqfdwKr//Qv35BXhOGOW0e1/jW/9bSpkABKDS+cVNKMvLC/Ca/YNTe?=
 =?us-ascii?Q?NlN4ddPL4TBocYPmKSl5jmg0db8naXtSozm1VMwCwdxOceIYdQ8GUPqYvSPm?=
 =?us-ascii?Q?LdZFNnzFTPmva3QSa5cbO7+5aXC+mSAQaM+FrxjKQi9his9F3XyDqKfmua1y?=
 =?us-ascii?Q?8jZVkwqSQgrfyQls34g6bk99wDOb9ALa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tvSqWWB6mBAWtxVqq4Q+8gxe0vPLwHzlErjibETMEFokB3B+rtbvSvZ+wolg?=
 =?us-ascii?Q?68Lyek5bU9ZWfx3c9nXYHgDwClLS422KdrK+rc4sotFB+WT9ZYte1ojm+Jqb?=
 =?us-ascii?Q?89pSF24as4c66AVeSzLYsgxZNoFQC8DxlP4tMKAtVd3bS10wJeYb6pdF38w9?=
 =?us-ascii?Q?f1iOiR/Aj2vbBk0Drc4k7pZyMzE48zuBq2hT8O/NwAD9touclS1g/UYAMqv7?=
 =?us-ascii?Q?ImGdXIy4qps2rSay7rfb2ExdPrXz8B1nYmjbwwH98ZbHIIsBLgP1KbHHGxUH?=
 =?us-ascii?Q?KOyLMi52cZA2lh+sYfsivxKRMH2VGgO0eoAmF5EXXcdx0Z1ED78hPje3p7Di?=
 =?us-ascii?Q?bvFOTksIMvhHvmmuLj1wyRyP6fOXI9//UIZsBqMkxyePtgSWLCwYfNTO07Fb?=
 =?us-ascii?Q?6y37A+I6+joGNsdUg14XYy7erHj1UT4MsYZ+2h7I31Jliomq5YOnKZgGTaZ+?=
 =?us-ascii?Q?tT0HczaWoy3vqVepkkkP9xQIvIB6u92dW5EH8niz4ZWTIz+Z6rKY6YxMOnjw?=
 =?us-ascii?Q?HGY6KHTqwCE8y6KBXan6goWuExk+xlsV4ahho6qV8H+FnfCuDDpY33e5WcWr?=
 =?us-ascii?Q?b++NSJ7rszR0zxvpBKYXwOfPQsQ7Od99uveuxWCfbLCkUiwu84LauAIDU9il?=
 =?us-ascii?Q?DZYvdlGK7qdSpXkO6knmx7itFHhofGsi8kpY3IT2sNrY6dwlXiltV1EYt69J?=
 =?us-ascii?Q?YhTDE0v81SxJ47ImpC3yPvqwZwGBUebswDHCDXCTdHRio0QXY43jDCHMq5eb?=
 =?us-ascii?Q?EiVVk2sG3UGZHrK7ghLa40pCZb3itO9NwWyXGQh3L2mHXwnEaRMBWWAu0wEi?=
 =?us-ascii?Q?wjISAyO+B9L2d9VVt4+a5/0YgFxbK19Q6YuCXkufRCbzLm2PsgdSn5KBLEtw?=
 =?us-ascii?Q?1sIKSa/5uUnNzubl9Yz6owKCKkz2qIJ+0j8RRO47owjsldAuC106OuVhJikv?=
 =?us-ascii?Q?p1YMoOFpwTu6E4g4TNpXFIOVE4QIJjb0alLJzcWAcZNWb48JR2h7LNAj/iZg?=
 =?us-ascii?Q?9HUZK/dt/1BNWXRm+el6lsMizuhQ9K0hWU5I8fzFzM6y/KmzJDV/FEkteMa3?=
 =?us-ascii?Q?dYybR5FWy9/Y5SLWX/Q4SErmAkRqOgDdpZH7xrs5QfA7IRnFrOOmuOf83NhA?=
 =?us-ascii?Q?HzEgoicTYNg6Pby/a9pwwKP0Z8w9Vrb1UyfrEB4NRJmyzxfLcTNSztg/27O2?=
 =?us-ascii?Q?YvLa+GizWtjHzThysuNTj2F8FmQ8guRTSoosgdHP2w8QiT6zzC4U9YeM0wAr?=
 =?us-ascii?Q?2eFzdn0B8Nd0hInKY1pyNdquMrSmCEoPI1mtY+DUnH1CXWDG1Jo9JvtfdDVO?=
 =?us-ascii?Q?p2c70rQjaev3C5oaRVavIgvEDOwuguGNLOzS29zz/YM70+cDXg90eBc7euSX?=
 =?us-ascii?Q?wqgNcaTkiXuKgfnwAY7JtuRFCV4ww/7qVYE3w5znE9KiI2RvhcUStmKiTzr5?=
 =?us-ascii?Q?EZ15uKDG0PyMM9KbUvEImEwre7s5pjZxnbi/dAtc0B+Icxm2ZX4ljlzTpj3i?=
 =?us-ascii?Q?gL1fzQyGCcnH8tYrQ9kX8LMAP0dZwUD90/1IjBXmv6tRyeo2Af1kisxD+ANS?=
 =?us-ascii?Q?RuIa5ZlsScd9D9mNtg4BGug6HBo2FRc+yPz35vbJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3e81bd-7f8d-4417-cd71-08dd46cb178d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:27:04.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLIyIgFCatA+6JqNmqG9BIQa57Em+lTmLUpEIgIO8gVeKULZ63ZPQoDBMlLOR93d4BJQZbTnNE7+7JaQDIKNvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10464

On Wed, Feb 05, 2025 at 03:30:20PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Now that the common interface for imx chip has been introduced,
> there's no longer a need to have a separate platform driver for
> imx8m. As such, merge the driver with the imx8 driver. Furthermore,
> delete the old driver as it's no longer useful.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  sound/soc/sof/imx/Kconfig  |   9 -
>  sound/soc/sof/imx/Makefile |   2 -
>  sound/soc/sof/imx/imx8.c   | 136 ++++++++-
>  sound/soc/sof/imx/imx8m.c  | 567 -------------------------------------
>  4 files changed, 134 insertions(+), 580 deletions(-)
>  delete mode 100644 sound/soc/sof/imx/imx8m.c
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 4751b04d5e6f..92fdf80d6e51 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -32,15 +32,6 @@ config SND_SOC_SOF_IMX8
>  	  Say Y if you have such a device.
>  	  If unsure select "N".
>
> -config SND_SOC_SOF_IMX8M
> -	tristate "SOF support for i.MX8M"
> -	depends on IMX_DSP
> -	select SND_SOC_SOF_IMX_COMMON
> -	help
> -	  This adds support for Sound Open Firmware for NXP i.MX8M platforms.
> -	  Say Y if you have such a device.
> -	  If unsure select "N".
> -
>  config SND_SOC_SOF_IMX8ULP
>  	tristate "SOF support for i.MX8ULP"
>  	depends on IMX_DSP
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index be0bf0736dfa..852140bb8104 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,11 +1,9 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>  snd-sof-imx8-y := imx8.o
> -snd-sof-imx8m-y := imx8m.o
>  snd-sof-imx8ulp-y := imx8ulp.o
>
>  snd-sof-imx-common-y := imx-common.o
>
>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> -obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
...
>  	return 0;
>  }
>
> +static int imx8m_probe(struct snd_sof_dev *sdev)
> +{
> +	struct imx_common_data *common;
> +	struct imx8m_chip_data *chip;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	chip = devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return dev_err_probe(sdev->dev, -ENOMEM,
> +				     "failed to allocate chip data\n");
> +
> +	chip->dap = devm_ioremap(sdev->dev, IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
> +	if (!chip->dap)
> +		return dev_err_probe(sdev->dev, -ENODEV,
> +				     "failed to ioremap DAP\n");

It is okay for cleanup code. But I think the IMX8M_DAP_DEBUG should come
from dts as one of reg.

> +
> +	chip->regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(sdev->dev, PTR_ERR(chip->regmap),
> +				     "failed to fetch dsp ctrl regmap\n");

The same here, it should use standard reset interface instead.

Please remember two points, which need be improved later

For this patch, it is fine because just copy old code to here.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +
> +	common->chip_pdata = chip;
> +
> +	return 0;
> +}
> +
...
> -module_platform_driver(snd_sof_of_imx8m_driver);
> -
> -MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_DESCRIPTION("SOF support for IMX8M platforms");
> -MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
> --
> 2.34.1
>
