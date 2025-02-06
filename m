Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7501F4184;
	Thu,  6 Feb 2025 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858691; cv=fail; b=iQ/eJ8Y50Fpu0XviyvrIRiPZctRvODEVEb4Cg0EwL53CV8jbrNwOZ2ORqnLbUTBcmXKgxU4gqhI9P3MPbdsY1Og104vsuiGgvjz9uDv4Rd32BwDeUZ86pDnliC8om+mMCp8hXtglB4hszArj2hZlXOzofF9uL2+WfPccp3qMmMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858691; c=relaxed/simple;
	bh=yHAq4Qu5Mnph0vVhIPk0lkZVsjDcIgY3KgnR7pz30SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e1L1gzTrAZsDBrrb0xJOAYxJyuY/sy5RPdCwj7NakbtQ7gws2yp1uSZULoHbpY/8RbEAQlBoGijb/KTf3Fuvis6Ht9/oUTK1QIXSyP7AgDZHiMEWydLHAfgRVXTZyg6FpR3r8cfStqPrCUPK0gXcr8Ru1I0g6VmEmHvhIqp7QUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C2vKIxzp; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C2vKIxzp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsFUTRIoepcg1eZ+A/QGNfaOyEXf8viSk9QxviUAk14XkdI9QqrA4ijVxr4BrDkeiJOBzg+j/r4qrD6zsBvHI2dw/sr/R+BSQ1L4CjecuFsHq4cE04tVoPae6UDQTeT3yq2v2c39/Q0YIedW9WMDjgsp74dT9BmHESok5bTI/AWKktvjeYpcbRI//ALd3zkyRyQrRAoK9jyEyueUJVtL8oPVimunbq2fi/CJwoWKMOku2dcD6SJdIBSA5hAjsmHGwFBrrKZfIAWTZuoOSqcT/EbwMizM+yDxcpcWqxQjAgVratxwo+pJxHSJlaT6le68SwJUY/ELjhqiEtspsk26OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT5xLXdWMGM44fqc4roTZ8Iu83Yfwi8XYeF1IDoij+w=;
 b=rzl5fM3tSGU8pzJzNcuyPmnV1tMl4R9ObWn/rl/FZJ1EA8bfMSWsB7L/oIiwfk79re76RKvnlOrt4hA9LnCqYreqMRE4xZZ4qZD9UBQ1C5d9xlZnTNJRJ/T1bN+b+kMkVFqfVEYvmB0lihfvjuQKgSpldQUzJWQ4SEo5hb7uQfg/aPY+hN40hrWrh5J4giQ8i+ySeDv26gMVamorSA2neDBeaqVE6JOrv/y5XJtJtNPVKd+MBdmKsXxbJbKkxwOjXZLeWKvaVWIDNCOs08S8Nb8ROLR2KN62ubdqh6FgXdZfCjJ7Cse9eR+f5cnzv0HpMx1jDYoJ9YSml5wMNcErAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT5xLXdWMGM44fqc4roTZ8Iu83Yfwi8XYeF1IDoij+w=;
 b=C2vKIxzpWaVegN+U+/eVhbyja4ychVkf/y7xsGuU/e+dpr5isAWwS/WX7f+GOU7ZIjKrf9iIsK+DQ0xDPkWv+g15CM+nGzdKOaG6+NNd9mV8pUFOeEGSC+9UinmIo+DG6vTj0yJEB2QF+xbTGjILtwKF3ooJdfvOZLvuhYVsdLLpwQPOP5fdPuyrZVrOE92KSyr7Dok3m0iYriPQFe0aCUkOUhch03NJPcHrVnLgTBku0OOjxxA3GHkwfC/el+fwV0958y+oMuwyuuevjWhLEk1xVOp6lsm57+C68QlDhazre0xt12Fjsu2ofQ/pGdZMHPd3VtPtFoiradiKum1ipQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9752.eurprd04.prod.outlook.com (2603:10a6:10:4c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 16:18:06 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:18:06 +0000
Date: Thu, 6 Feb 2025 11:18:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 4/8] ASoC: SOF: imx8: shuffle structure and function
 definitions
Message-ID: <Z6TguAqGRS3eDhqa@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-5-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::6) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a52491-a7a0-4c9c-4ad3-08dd46c9d6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QUah7b04VntZHF61Ud2DfISAS3Lc+ZvcCv0uyVg4PPgmZEKdMPka/s5q9rYN?=
 =?us-ascii?Q?K3LOP78GUKpZLNfBXNZrBF0fHT0HcUXtd4Gj/RRpFH0wpY4i1w/zUuHQiAcM?=
 =?us-ascii?Q?GtaZ1k+DenbrWIudltvK6Q4qTbCs1oyszqJGsxVo2h3VJxMRKBQZsya9C19e?=
 =?us-ascii?Q?TKBEM6VuoUpXz7PLqBSe81psNzJe9WQPrGHroyvzWEb129ExMSPVHIccuU4A?=
 =?us-ascii?Q?0mEZOjAdy/DDRqKFkYmtMhraMkX20qL/hle1M8yZXRD/7/NCxoGyzxihnMxD?=
 =?us-ascii?Q?F0ToXmU5XWH8mb3MxvwLI8UsjQtkxEr94rosrV3tiFwwKXWi1YEaFN9d7g+T?=
 =?us-ascii?Q?zPQf8hQAoRHOdIrhvO6v2BELbWEFuWtvtAiLYs7zrbo2rW34klIjBscd0a8V?=
 =?us-ascii?Q?IRLp8A2yQs71pnl1nKPAsAZicYcrDZwq2pMfb5QXjPcmI14nvjATJhiUJzWh?=
 =?us-ascii?Q?rtVE/JHQ7vETFLLtqEgQCj7Gnuf2CKhkk7aFNGKXpCWrwu7UuD6qsMEFHn/R?=
 =?us-ascii?Q?46iGXLkj4FHD/pE9/Xag+ZIsr5bI8lU7UsuDyMqMVcvR51+m+m5GRSjovQN0?=
 =?us-ascii?Q?X+fJSZE9crLYEepDEBD0DeWmsG0pdjCmm2k+Es7RRRcJHzhHWmFrgTg8jgPD?=
 =?us-ascii?Q?4BX2YeELPlXReL+HeNlv0Zofq/WQday1uUtdFtexBLgefHGckW5J9Xd/O5di?=
 =?us-ascii?Q?zL95nLkRCZDCh87Cj1Kipay447/mfcr+z0cShxM/ZxfVSOg+uddvbRupGNCa?=
 =?us-ascii?Q?Hzf0VeDhKCsgSL/IbyOvAvlwK509lhas6e/F+RaoJOh8f8DS9Q4AIGlGvVpd?=
 =?us-ascii?Q?mLSPBeEyKz2djGZTjrEkZKHKx+2BhLn8N1YXkZs7wGBVZcvx37XddiU3eljV?=
 =?us-ascii?Q?yPMoVgt8mbyY8a53T1M/m3HpvDMD63nArOX7HJGCfcBLv5KbdmAf0791AOQM?=
 =?us-ascii?Q?ckBQpKsJL2G6BMjCaAsFKVVcvhO/5HB0mxFWZpcmUHeOLIrMEJf3/eTWY5GI?=
 =?us-ascii?Q?e9HBFMFXjA7HA+HElQKXfMsqYJj8QejTT2ZQGbBstz1XZybrU8LHJ/PmOaP6?=
 =?us-ascii?Q?l2r1pzCk2EGZXY5qii0p1jaiFk2jOcKEuLi6oF+E7r/hzQsg/hAH5AnXx3q5?=
 =?us-ascii?Q?XvUJignYHV87PQUKQnO8jKajnRsvtdGD3IZjrzsezfk8SZHN6rGCMhFnqLgC?=
 =?us-ascii?Q?s6ublbBjni/p4J4kU8vGDlkDbdIHjOOlNdHq3PGbP+8ZfLHiMw7Sno6Qzdjz?=
 =?us-ascii?Q?N/SCLhVAyl1LlnkzdE1gB0zjrCge4ttSnPkQPV9bLG7ADxzbery7vC5hYo/b?=
 =?us-ascii?Q?fjGfd04RtLKK8wJJfS52XuZdbETPw7lmkCmWZBjmisq1tKCaxksYhqjDHaTQ?=
 =?us-ascii?Q?fe8cX4eieiHYxmZrB0p4x2E6eWfDQu/sDtA3OZ7iXPhwm13iAjVQ3rVy2bKa?=
 =?us-ascii?Q?cxwWP89HT1Wo5ho4CUdvY0LA/ztngjvK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5X0GQD9BiFqjhlKaw+AF0Wb1wWp4tLn07w8RSKS4gzK7eJohLsqVVRVRruz3?=
 =?us-ascii?Q?qmUyLco3QIi/5vCH86mT3AeRD9ITwgw5ZnHOlzzXWJ96dJe9X+irkML3GMSm?=
 =?us-ascii?Q?dHCMwjEtHuyslBniF3IjUEL1n8hkOpFLytx9iiU1WQJBb1pJk/zdpIO5dABm?=
 =?us-ascii?Q?MmK7/tGjlsM2gefySToID3UBPLykZ7j9BejhFzLR3e/7f02TbenghnP9S31o?=
 =?us-ascii?Q?iMnr7FC+1x3E9Z5SraENppw+4dMn/SBI5QpmQ5YYfcwx9URFlCrhITIUVHmn?=
 =?us-ascii?Q?RJRqc8nMvwhy37ptip4wlOLrFPkDRKYQLKDW7dbf7pCWT4Or+OVvsuTOBC1z?=
 =?us-ascii?Q?z/HCTzCUk1n29KvmFDuSB7jObAQQNQxl5dtu/j7HAJk87oStNV/yiS6nkM8r?=
 =?us-ascii?Q?NGS9uUvxKX2mNscvSZJF9SSLKJEJYdxAUbi16Doau7FqlCl+mj3O8sMxoKZB?=
 =?us-ascii?Q?kMWVnGgxXJcBhW7+FraXOVaYUQ5PxhzfNFHUHXZ4VWqV2OQKAVgNPKfhsACj?=
 =?us-ascii?Q?ZpmKtn8LbU4o3IA2vE0RQ3Zp3FfNt87cIhdLbpUeDJGUpD9yxCbeop5G+Npe?=
 =?us-ascii?Q?0AkKiO0Ji6x1XPI43QUB6EcuEpB6qsDU/iwNeQWl9rHSm2t8xMI5Am8DkF1/?=
 =?us-ascii?Q?9I8FGLbT+Ps2VnOW1VsURFGB8Pf3gl/o1+tYlnni7zRgMFWEAibELRETgtoF?=
 =?us-ascii?Q?I9ZYpu196xIA4rZyiOHde8MLyj6Q8iOhFevAM8XZbRaXU7+qImNPDik8PrmY?=
 =?us-ascii?Q?IaoGgliplbxhLzmxcrd/b7UQlpOoxIaBymbOpAaCxpAQpbpbPUz160Q0LgtZ?=
 =?us-ascii?Q?fIO7WhwiWAktPIo+FaUKkMD61KRIik6fApPH0xZbyCJg8Q6cUVH6c4cVS5+Z?=
 =?us-ascii?Q?KlpzRo/PxyKNXmcd3Trj9IObejf3i2qwINgNs7GGrBz0rlKvkhegoMDqdXOO?=
 =?us-ascii?Q?qp5wb94Va6dGxfOC8dCL7/ffCxcDKW2pCsOHlZBOIGGfUbVtZ5jGW19GkpFF?=
 =?us-ascii?Q?2Qfbok6wePfv+MiwRFflKuYkPHPgSHcNLH3ECdCgkuDVgi8svBZ3wyzv4HVN?=
 =?us-ascii?Q?J6bblp+jPCnhxhy6/a5WskBQww6m5Y9wAF6JLkEMbFGZAHi5qzOmXJtbgoid?=
 =?us-ascii?Q?jtEX7ncB6LnMNa2V9cTkdsGJ7kJi+Clk3CNuQyHP4mtnida8maZbZuBZuSv9?=
 =?us-ascii?Q?0OhgCNm4h767YbAtaZF3ExIfQaKqy3mQdRYheKkkrBoOYVFUviWvjfp0aHRV?=
 =?us-ascii?Q?zB8a3ljjIgj05hsMW18y8+oPvAFin3FcErgpeiyt/sGGVg5jNVbSe4Lrxan1?=
 =?us-ascii?Q?Kra/T7ucpebyLpDwZ4WLcSZQAV5WcpcazAAll0jKfkkTl1l0Y5a+Xb+jNAPj?=
 =?us-ascii?Q?xXisV+VXdxuHJ00iODsslIgZO8Az2X6vEC87DnPU+T3KYcoOlQ39BtLVEJyu?=
 =?us-ascii?Q?dylgi8sEwCQdLVnvUe5s8GJ3l6KVM/mqVPQxDGproI8RhnuWwlKm+HiSTsE3?=
 =?us-ascii?Q?YHFh03Rlrf3pr0aOj3aCnMC55w8a0xaC4lbYoZer3FnHTA2IGyltdZp0etEb?=
 =?us-ascii?Q?Nv6qDC3C1jBi7NuoQ4iUmYvDGEKOEzPGihN8MSdN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a52491-a7a0-4c9c-4ad3-08dd46c9d6b7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:18:06.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kiYJLmarR3Xyt+DOiau6O5DQRhDz9ZOoFcNni6Km/osMDexicJu1sTMYf7eVd6CR8LdNxZpYXMX3eFz/0+eXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9752

On Wed, Feb 05, 2025 at 03:30:18PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Shuffle the definitions of some structures and functions such that
> they are better grouped. This is purely a cosmetic change.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

I don't think this patch is neccessary. It have not look better after
change position.

Frank

> ---
>  sound/soc/sof/imx/imx8.c | 86 ++++++++++++++++++++--------------------
>  1 file changed, 43 insertions(+), 43 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 52dff369d9cf..5d6524d695e2 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -41,6 +41,49 @@
>  #define MBOX_OFFSET	0x800000
>  #define MBOX_SIZE	0x1000
>
> +static struct snd_soc_dai_driver imx8_dai[] = {
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
> +};
> +
> +static struct snd_sof_dsp_ops sof_imx8_ops;
> +
> +static int imx8_ops_init(struct snd_sof_dev *sdev)
> +{
> +	/* first copy from template */
> +	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
> +
> +	/* then set common imx8 ops */
> +	sof_imx8_ops.dbg_dump = imx8_dump;
> +	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
> +	sof_imx8_ops.debugfs_add_region_item =
> +		snd_sof_debugfs_add_region_item_iomem;
> +
> +	/* ... and finally set DAI driver */
> +	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
> +	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
> +
> +	return 0;
> +}
> +
> +static int imx8_probe(struct snd_sof_dev *sdev)
> +{
> +	struct imx_sc_ipc *sc_ipc_handle;
> +	struct imx_common_data *common;
> +	int ret;
> +
> +	common = sdev->pdata->hw_pdata;
> +
> +	ret = imx_scu_get_handle(&sc_ipc_handle);
> +	if (ret < 0)
> +		return dev_err_probe(sdev->dev, ret,
> +				     "failed to fetch SC IPC handle\n");
> +
> +	common->chip_pdata = sc_ipc_handle;
> +
> +	return 0;
> +}
> +
>  /*
>   * DSP control.
>   */
> @@ -100,49 +143,6 @@ static int imx8_run(struct snd_sof_dev *sdev)
>  	return 0;
>  }
>
> -static int imx8_probe(struct snd_sof_dev *sdev)
> -{
> -	struct imx_sc_ipc *sc_ipc_handle;
> -	struct imx_common_data *common;
> -	int ret;
> -
> -	common = sdev->pdata->hw_pdata;
> -
> -	ret = imx_scu_get_handle(&sc_ipc_handle);
> -	if (ret < 0)
> -		return dev_err_probe(sdev->dev, ret,
> -				     "failed to fetch SC IPC handle\n");
> -
> -	common->chip_pdata = sc_ipc_handle;
> -
> -	return 0;
> -}
> -
> -static struct snd_soc_dai_driver imx8_dai[] = {
> -	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
> -	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
> -};
> -
> -static struct snd_sof_dsp_ops sof_imx8_ops;
> -
> -static int imx8_ops_init(struct snd_sof_dev *sdev)
> -{
> -	/* first copy from template */
> -	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
> -
> -	/* then set common imx8 ops */
> -	sof_imx8_ops.dbg_dump = imx8_dump;
> -	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
> -	sof_imx8_ops.debugfs_add_region_item =
> -		snd_sof_debugfs_add_region_item_iomem;
> -
> -	/* ... and finally set DAI driver */
> -	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
> -	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
> -
> -	return 0;
> -}
> -
>  static const struct imx_chip_ops imx8_chip_ops = {
>  	.probe = imx8_probe,
>  	.core_kick = imx8_run,
> --
> 2.34.1
>
