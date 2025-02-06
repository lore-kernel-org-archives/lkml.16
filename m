Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494D01A316D;
	Thu,  6 Feb 2025 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857950; cv=fail; b=qiMVL1wrNX3bbyqnmPtxUJtqjfD3ehb9GSQ4QdaZ3X0Ao2T8TMDpBvTyCh2yETJA7kTOEuGIONS4ZrotMoKm+af2dDOFIkF2hx3RybVRxnz+DYDzapv0drVng+Mh4ltky3g2t81ol0qWyC4FIQY1Z78/HP86KTkcqO0hvwAcis4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857950; c=relaxed/simple;
	bh=aEw2odLJIVt2/i7FjXlJmvnB3gvjEmoc3f/C7iWL6m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PlDfFYp976OC9ktH4UDzufKZPS7KDZBtLZ2UDKvTOIjyrjcFn8FvMXoSvGNaU4atms+LObl0xBdPmuX+6g1905WASj5Nno/RaiOqLOByS+/vyjNqZTpY4DLZGx3GPSIMJYhktqOxF7gxZXvJ74v6jdp9i4L9FmxPkw5JvClUJBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DI2xXgnb; arc=fail smtp.client-ip=40.107.247.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DI2xXgnb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XleiLc+NE2UCMnhv1Vo25HSrETiCmI03Yh/3KgwTOBZ4XL7YCnD8A9P9ljS+yCpOTUMOq9OMozuTGO4cIBoL6EXIvfVSeTzPpBoUPE2z1YTa+X51jrn9/AVSMbxf++bS09QsuGJamRnRWDsaYch1KiN05lkXkorz3Yz47Mm0EidEmVXb6TW1BtUMVEYsplSipvFFNZ2yb92DT5YaaOm4neBP09MaYTbjBdQXUWvDFtTBtqvRIHZAwpb8SsoDxHuihsZnwHdOzXyZe87CEcJa/wUgQRgRisbeiwUeotpiis/8t1EqF6k6MPkpYcOof0an8fGcH+OHRVPlKc4YOaEUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HU9rE9u30bwMXPO/SQK7mnR+8Tp74A4SRLyrcp96wpE=;
 b=GxFpimTtVmvFaD1qhf5mwWNfe6dBvB3X2ajEY6gv0dwL8nlerriGsIjEiNbIOd9UaBm+5WU3lnOs9qWoWq2Oorasi/f6fyQSELszJgkG50uByvCQInUQ0QEIVe4Z0Oaau5EXIHFXQSyzpgvwmLeb3CV4SssOmpaGg2qdOs7D+JAsr4lP3Cc9VUaN+YGypgZPw/hVUH2Vojsc1VJ0oThgql4KOCAWNWl1uhRKJ0iR7LWp8/cDWWXZwG0ttXz1OnS9jBJX1NIGDrHp9iHug6qLPZ/ZnvX//3soKqEIxQyACljpu831kQFq/X9ocFl9u5VP2zj9o8PuoP0nyARrkINKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU9rE9u30bwMXPO/SQK7mnR+8Tp74A4SRLyrcp96wpE=;
 b=DI2xXgnbHRpcoxnWGc7aitN2jlbi0say4Zz2mhsuOIpdo7or2g8NK/5v5/Wh6qtyrzftviBfXTfXCOUnHQyPIxLhGsDL02xv3qKV24Yyj2JgxwRsXJnepXiVqYdd3mWFNEQ16c/E9RqSC5j95B52M64LddUfvOY45k1kzfE/peeBRWcXOLOyFLZznnWY0UpOoQHerK5Wf67+FDh1vyfzbBSjNOg7Jo0ZU+8l3k7j2PXDqGX8YTQkbVDZIhv4ubGjrVles2DIe2W2nY48a3eIlYGUidS3VTFk3ChrZ+wBgykMXD/9w74ONJOxX7gjIan1s1LQeCiocpCsUec1kRgcbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB8016.eurprd04.prod.outlook.com (2603:10a6:102:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 16:05:44 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:05:44 +0000
Date: Thu, 6 Feb 2025 11:05:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/8] ASoC: SOF: imx: introduce more common structures
 and functions
Message-ID: <Z6Td0SUXBZGD/s3O@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 671b94b7-ea1f-4226-fb66-08dd46c81c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B9vG+gYdm2Li1rLd+c72qsueFC26fDVD9vUkKYtwsjvVjS7EO01/Qf1ySc8h?=
 =?us-ascii?Q?r6bKik5ZxOMj1oX8xCfuLiqFqeMdvSE3mIc00oyqNOLVMPed1mkOrDs8OS11?=
 =?us-ascii?Q?Vr5fGSN4A7u4MdL1khdQkDT0CrZblzeQeZq4BAqFhBywpNT/NkSjZ+MlaGtS?=
 =?us-ascii?Q?Z5fA87xfg0rucz/4fYVrSIutjx5q6WKNcHRmGN+mKVRPporaeS1/lpzBSffz?=
 =?us-ascii?Q?q29Rq9y0QKJXdFdxyfO9kQ6ODx57e6Iq3pDiMZSHtenbb/75xbAENqijOiki?=
 =?us-ascii?Q?Za0dp1wB0aRtJHBPI1rA01Mk7ajBn06QuZYP/NsF8KS2e+41TsJnjHUGdG3J?=
 =?us-ascii?Q?XlH+W3cAo0VrwLZ9WWUc9ZL6VD8G8peGIlkkQn8Dgok8QZrRq/xjXTOkYUUX?=
 =?us-ascii?Q?CCCDL/V7cZBddEqBaierElJE0Ze1+1CUSLNhI4edJOj0o9k0wj0wL89QvPok?=
 =?us-ascii?Q?EquRtxOUsFDzxoDmjpirtD+UqeKuYNQDph91qFl7ChgDfMgaaoJnYPBH6mGy?=
 =?us-ascii?Q?JRbsPnukVdtE5mf57ohrfzbeXxwZDhBrSFg8sVIx/1G6wTIXoz08QuG4tmHu?=
 =?us-ascii?Q?EJXquZoRjE3QhYkevtNu3TQd2mrgYgUIA+ZY954IaMbJv0CCR5NbLWMrhsWS?=
 =?us-ascii?Q?WQ7JuKaaP/uc3M6dSTfkXxmlb6ij/vmR0txg2GIxYxyYonlF62L1u1zVYtXW?=
 =?us-ascii?Q?QwXoum29slhW1C9GkDxqMgNqbZK04aoRWoGFCk0g4anttapSiUV10URBswiX?=
 =?us-ascii?Q?ZjDVxBnpkmF67jf8oBHxHVEWuI4ier96G2VdXq66+AlZgC08Uem88430SH8x?=
 =?us-ascii?Q?oYjBqOjaSPu0HyplsQ8uodlIquU/Ic4TWl7oQxZ3e3h9YPIB10vkCjzjOCy5?=
 =?us-ascii?Q?pO0zNSXHDPXGk0LHxD+8MHIah4qsj2hRj6pWYx3Yv8FFcC1eYYJFwyDghQXV?=
 =?us-ascii?Q?NkfAcyYzjOl2stQKJREwRus4C937XtG7kMScAyqMj5gYfm8s5Mc6rOVkxTrJ?=
 =?us-ascii?Q?YtQDUQQiyQ7PLUfS/ICqwQswyKy1Rh5hYDAcMmEWfNUwGWQiFMgEHbSV6Ey9?=
 =?us-ascii?Q?Q1CxvhHA9JFqf7ILcGiSSk2BpNWcelNI+wfCnLXAzqKNR1BEeL89NZnETLYY?=
 =?us-ascii?Q?gGPYKGiABaHwJC8tcHAF8KNF55cd3T066BeV+oNdNO8tSnUVmU81ACorYwnr?=
 =?us-ascii?Q?bU2o+KhcxYrudUf2wHQk97XOgTI303BwCPxxh0NinbBrBQx5g88J1hcF/pZc?=
 =?us-ascii?Q?3IND1iB+7+xiWfHa1GH9G9FMLu7k4/y0k0a2direcC1/tie+Gcx6InSho/L4?=
 =?us-ascii?Q?0qR5/ZuWVlqtI5xzoH2kM6YN2tDeoWuVqHXFe+GlbsJhhGT834KvRURzBMFr?=
 =?us-ascii?Q?FgUXlEjx5Dm6xtno6t7RWR6QIrZuCegpyXYRgyKdiVcVt9QLH42dCbykOCrG?=
 =?us-ascii?Q?QzoEdK7VYLUO6ruDVonkVaPthn00GNl2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2StolSwDNU+W68x0mheTJli4nLIF3QAFA85UD4r5Pt0BNXWqQFDQuzwRXu1?=
 =?us-ascii?Q?bohi8p+CYkwPDm2Fd8GlPLCnnMF86QSm7itgK/98TmtHOh492xq72o/EMeQj?=
 =?us-ascii?Q?BE0vf4IAqzXTvOfbS0SMpp4AURpbth4UABFWJMEgMAwcs+MuQibprE/5dlIr?=
 =?us-ascii?Q?EKjB/lGBs50FJJWT+7SOUBKYyABXQD9VVolev1QJF0haoNIrL+aPSwJIwz6I?=
 =?us-ascii?Q?P2jVp5kUvDEQ57MyjA9oFNlgfl258aktwofvwiRG6L0IyQqHJa6bfdRCgGvC?=
 =?us-ascii?Q?sz2n7ENVtGlXv3BvAgF2uOQJl33TerMLISp1P9BopDS4QLQ/NR4FUDduoh/d?=
 =?us-ascii?Q?9pT6uhLmd1l1K5E/hntcNsDZe+jeYFmCkERhWCEUInGsu2D0Oew4AfnJnZWs?=
 =?us-ascii?Q?VU7355xABSDCDtXZhrfHPnyrGBSDvFc4Jmk/aQ5ppl0VtzD/WqdAHioLbaQr?=
 =?us-ascii?Q?VnRa5Xp5H4B3xIH3fK6R7wrvko4cu0cNA0MkF9EkGCowk/1GjtIEO76i21fG?=
 =?us-ascii?Q?eBfuDNDV6POwk7dR79qjGD/x4PVWWEGlytleLd3Xetkaqk6uj6kSYIm4sxRs?=
 =?us-ascii?Q?v3UXT9G96n49r5kSCj0ONdyGL4d/mb5EjCMRkHUOxRroOu6s9PIiLwXr+Id9?=
 =?us-ascii?Q?dz6oDasSo0n3wy1zmWnWG7+y7gCzn8VvlhxZGhoyX/0BenKgB9+FDemsrx5v?=
 =?us-ascii?Q?/KRz0inZm12c3SUu1cS2MS9yciOcLK0ZxmLnPtXy6fq5kqHtAYWswpsNNpp2?=
 =?us-ascii?Q?ziq0cK3fyCoepa0KOC6NjBHupSQ1OKl4AB+nyWwIOss0rhosle1ez4WAOgQU?=
 =?us-ascii?Q?WQlBbtwfwLQ7kE8pbogwPOXN11uRg2vQqlNOaqNvjADNLFI2gweEcEqycxIh?=
 =?us-ascii?Q?/wmP6KpJvOkltW8mXlNXMbfCI8thl3SlGP/gNLwv5XFLiWjR3+3Vy9jzpHOC?=
 =?us-ascii?Q?/5gmMYHrZ/SQbQsW0DZQwgy0new33C5iLqYAWxcoj7W+0OjIVvkTtvDM26Eb?=
 =?us-ascii?Q?bob2ujDzBPvLazcNdJvodgQeGc+jyok/J5T/can1451CXsMwFg71HAEbatUi?=
 =?us-ascii?Q?7UQa1blLY/S1JnuX5I1ZPENMfMq+0X2u1E3dHNuySQwar1nfeyp5keZdRWZZ?=
 =?us-ascii?Q?2LjjCYQfCTfTjBQNSj0Lp/mXtNS0KQRHAoqKBOzVz0dwbn2wgoUfhSCElzgD?=
 =?us-ascii?Q?/PTjVYn5odYDJ6x9V7hoX54vdk7yRxZRricxXTLM+7ErgPlKuMxBj3U/HX6d?=
 =?us-ascii?Q?xLjqQCrJ8JloUDsGnkBHbzxVOHfEYFMklNfeAMoo0Tj37RcM1aF56b5Mrq4T?=
 =?us-ascii?Q?PIU/5C6htXdURrytrOuTbx5ya0wjbL0Piaa3/QI5AiDC4F2abrpdHg5Atccs?=
 =?us-ascii?Q?E+iZf+DOIfjTkk5CUHRQxqaoiwEapg0jpQCYBUL4HRlu3MQ4w7UA5kqTtNuZ?=
 =?us-ascii?Q?y5omqFntGbTSciVqeq+PBbgyH0d+160oyfPdP7N63WKPH4b8LRd3VI5rqnIt?=
 =?us-ascii?Q?Bs0bMseNAa9uQ+g7M3rJvbanYqHy7ArGlvStgHKk3jzpmEt3z0XfFMBWMKTA?=
 =?us-ascii?Q?Oshuj0qAkol85atnp5c1UWtZsdAZ9hKj0meRqlet?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671b94b7-ea1f-4226-fb66-08dd46c81c66
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:05:44.2644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdBkspz4QRrV0zkxdEPy1GJvhQV+W9UfL+1sMQW3RqydXn2aR2s+KV2qVLnZm4eZtKQsveOAJeDOHN6z+TzUkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8016

On Wed, Feb 05, 2025 at 03:30:15PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The SOF drivers for imx chips have a lot of duplicate code and
> routines/code snippets that could certainly be reused among drivers.
>
> As such, introduce a new set of structures and functions that will help
> eliminate the redundancy and code size of the drivers.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

some nits

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  sound/soc/sof/imx/imx-common.c | 432 ++++++++++++++++++++++++++++++++-
>  sound/soc/sof/imx/imx-common.h | 151 ++++++++++++
>  2 files changed, 582 insertions(+), 1 deletion(-)
>
...
> +static int imx_probe(struct snd_sof_dev *sdev)
> +{
> +	struct dev_pm_domain_attach_data domain_data = {
> +		.pd_names = NULL, /* no filtering */
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +	};
> +	struct imx_common_data *common;
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = to_platform_device(sdev->dev);
> +
...
> +
> +	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, common->clk_num,
> +				     "failed to fetch clocks\n");
> +	common->clk_num = ret;
> +
> +	/* no effect if number of clocks is 0 */

this comments should be common sense, can be removed.

Frank

> +	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, ret, "failed to enable clocks\n");
> +
> +	common->ipc_handle->ops = &imx_ipc_ops;
> +	imx_dsp_set_data(common->ipc_handle, sdev);
> +
> +	sdev->num_cores = 1;
> +	sdev->pdata->hw_pdata = common;
> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> +	sdev->dsp_box.offset = get_chip_info(sdev)->ipc_info.boot_mbox_offset;
> +
> +	return imx_chip_probe(sdev);
> +}
> +
...
> +
>  #endif
> --
> 2.34.1
>
