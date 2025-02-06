Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D851F416D;
	Thu,  6 Feb 2025 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858276; cv=fail; b=GNu466IKDrlPcZ1hz7opc+Pq+Gul5GT7x2VU/ZxKLRCyzcvab9QakLn2F8qdLZ7fBP061HqMikZyv+Z3l7WSeAcgFMCOH5mb8Ws5A4UsjZdzX6FX84CiOOuI01Fdng1wOGEuaUmKXESsatvozniAyjT4P6Ztfamn9RMR3Yjc0bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858276; c=relaxed/simple;
	bh=ijPJIAkIFJkkqQPzwQ5ThLoQx3GDxnhVaMhXiHa8Sr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sbQqIf+qtHkUEQY0EaiUI/JMH3rdTUx0pZcXffPNp/K+43tXzbi0CtwoGbRWx/ccwlm1tpJ4nbZ0QpDIikveEY13J9ymi7uBQpDhJFxgcMhLKA5RI0WBJVMEDpYBr0LAAlTFJ4T/bn8XaEzYZw72LP/okoyeunidPINcp26aSmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fOKwnGy7; arc=fail smtp.client-ip=40.107.249.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fOKwnGy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al4ySvKlyuqfUJN5ZH0n6V85/muH1uTbvJYuyXkoUg/XJb/kmBkCQawBHhuEFKJgyBu/HMsp4G0F4VAMtQWajr2fl+sBhAh95WCypTVa/KyaVe39FGUIqmbXnGTjtJlaRduFzts9Ggd+ZmSZvhEcUaZudyxd3onou1TVb8EYcMrnFCsOUguDZ778sglx/ENQSfiAyQAE9MZ4HzvRFwi97iTTgVS1EOmEg3M3F09me6CmlbNwLMPJ8YdRoZFMI381bt5pg/O5NGM8pYKK+wFI7SVprQjq5VCPTYMFTxJMyCd3nEh2ItNobmRSZ1wSsSMFWAGnbex7KBadi5+3aOgt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHQ8XSQeOsvFzMYWRPxcfoiTTRQCkQlgxMBl2UlRQIU=;
 b=ANAp2vGgacsJehTxHpy0sf18ZvKUODSuLn6D7qhd/K95SF0hiHLiGzVeySU+YlKUPFvgWOeHoWAYRnLa1K1nbUuQmgLZBBuwQBu5A8vFhdughvXm/c9VSyw8OQct5MEJT2xlZgZBoRGPZoQESg1AH0t1qU5RBVwoUsvtIt6XJsNYG49AqNUKrG3g7piLzpul0I6s60+5KvVCW/hhSvz23Ytd5F3Zy6IhC5mz09FUouuF9VStG2+ixRgfW4ktZErN7vVyClh8AX+BMEF2KfVm0vsZx39+3oyTlhgw9uRfGRrF8RRsRFLRnuxxXeQ/CYoApuOvGXsxIAbKTA39E6agdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHQ8XSQeOsvFzMYWRPxcfoiTTRQCkQlgxMBl2UlRQIU=;
 b=fOKwnGy7sQTpR31Cqlj6OXZnV6lVj6XP2LmtH89URIr/MqHxe5DW6zivEgXUSfqe9udtTh1umonEfB3l3Fb7X+Ev1Dp4xemtOkV2B6M18WLKwyYbowx7W4rLrt+qBrGfq2hslLyZBP3lKSoGNfDuI+wyJDmHQEnuAM2vcCp43kG0vt4RhwEibB6NBlQqNavehzXYdjFfPURvNYw/BNzzenssXkfhzTT7guAbEhvNBD+PsrfosYeckm48i5js7W2wYSyZ6QQmu/zjBFbjTcYrfurHXyAwhvF0WQ9pDFG8fihj3bqRdwizKwOIXV3/QZjljCtcH5tArtdeuGJDsqk6/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU4PR04MB10694.eurprd04.prod.outlook.com (2603:10a6:10:582::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:11:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:11:12 +0000
Date: Thu, 6 Feb 2025 11:11:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/8] ASoC: SOF: imx8: use common imx chip interface
Message-ID: <Z6TfGZNAnCEhm6Fa@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU4PR04MB10694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8fca19-d568-4bf0-f0e9-08dd46c8dfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tf0BMnoPBBTSdkP3aqy8P4NuMXAlrY1+OK1bEs30BHxiMo7IR4+DZat2U3Wo?=
 =?us-ascii?Q?XY5tA8+6oYy1E1Dm3Bkyig+8l1WNHR4uBCPDuJZQJJjw39/aaGpocLTPMOkD?=
 =?us-ascii?Q?yaXDdF7BR5FhWJa5HhZ60CaEL+VVrMj20ZGWxejLUhmkN+uUQaF0a0/FSz1w?=
 =?us-ascii?Q?Z1fQPs/0EMqbbnR0JxzscHJJH+1YvAeOh2+MEZjM0VtXWp6Sl2H0EECF4asn?=
 =?us-ascii?Q?rqQEoM1oK7qIkdiNRcbJkfGssde5zSpJjHzcUagZck1QDKga2JE8EHaXpy5L?=
 =?us-ascii?Q?glPje3hWiSu9aC1MTNqiEnYlLdewwK0jpat4FlLC3990PEjTayxsFOzKt0ce?=
 =?us-ascii?Q?sT1x9FhrYiSnKzhpR0lNkY73qPb8m49L4mPUiIKJDmv85bBNi8YFDg2SGH4+?=
 =?us-ascii?Q?KNnfMGqgXQtH7qLsL7pxQt8WcGw9GhhhfjA5pFGo9l4wSawKEhoOVgG7bR2n?=
 =?us-ascii?Q?dVPF5JNoxz7LKxeow+pYx/JoSLUkCu23Aa+g0w093woxiTIwWfg3Ks6akvmb?=
 =?us-ascii?Q?4uvsT0OF8tDuhf5GkfC5b1O/+yfluc00GP50j9pVzk01u4b4MvXX6+gZWnaV?=
 =?us-ascii?Q?gH+ir0eUOrFrWrBEyNmlblHo/AteJ2M3w/1a3AmKumUSspEwnyDloOd5aVhU?=
 =?us-ascii?Q?+W6o1fI2/UZNsEzcTbRB/Jx26lTqP4O4vMEzSt+MvTXB6/XuSml97PDES3oe?=
 =?us-ascii?Q?Ss9j2Y8u8n48Aw2bka8kNVcsxJpyUtb7AGuS9XAgXcriK4n7t0cJcnjSiYvh?=
 =?us-ascii?Q?evsmpXjjX1q6CK3P2AwDsAyribx9UGuylL74mv4PIjznH6e0BEvsIr7YJnuo?=
 =?us-ascii?Q?z1FlwF4ETg4QORBxRkVJPDJqio4r6Yx7K7QEE7YViZ3KpWo8yE0m8bo5m6aa?=
 =?us-ascii?Q?pl4KWHrlZntkI34VwTVbm/701xxUyIYQs0JC64EfHQIrnPOJtI7S6LI2UNXQ?=
 =?us-ascii?Q?wl5S11bZtV7UxyORBIgBFy4b4w/fRmJcFufqB7JTpOrqtVWUblpdchJvFwcw?=
 =?us-ascii?Q?DGD787FwbBdXh+IGifbfRzZyGbjoiptZeIZg0h9BHGazdsKoZybRsiIBlaaC?=
 =?us-ascii?Q?1RH4ikUKdr8R9KAVKTunapjjoH8/zmahjk7XJPsWgpQrGfUi5+U91h9Bvjwy?=
 =?us-ascii?Q?UHJ9nxd+73U/yweqXJdAH26/onYW9WQwNW0uuVQE9S4iX4qdXcMm6KezjHBZ?=
 =?us-ascii?Q?Un6KGMXNFSBOCtJZyEbXn/wEbRu5RIv8OFUiMlnxTR9H1XAoKtmbd4nczWAz?=
 =?us-ascii?Q?ZBi6VN0scNRmauTicx06Ht6eM2p+IuJftfQMnrvJ1rA49FeqiMcSC1Nu4JeO?=
 =?us-ascii?Q?1WYNBGnjrh1ajVVQwbMBSn+vXj7xdjneWO5BIMYyVHxm7hlE2yAOGjihJQTC?=
 =?us-ascii?Q?MTHXTxks9C1P3oLxNSa5EPBMx5769GF6EsFD5SCS4gwsA3GM6Qb5dcImah4P?=
 =?us-ascii?Q?LtHnBieL0zDN4bCeUYeC/dZqjnfISDLn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4dfKMhd3jp82Hak8QK/5vo9T267ryQeHuem2NV9fqf8RENcmskLeQksjXwD?=
 =?us-ascii?Q?JWNe02h2FcCVjTaBdgISYdYXX/7tNIhJu5rwWmmcl/n66CaFArB6ejXAiRDv?=
 =?us-ascii?Q?ZB8L249b0c+W8pGNbep7MTg8DIAha/w8w+uuUQqTASFoxw4ZS8YJGGjQeUtO?=
 =?us-ascii?Q?6BCEu4uS9ld4p/A8DbsUMVt6za1Ao68ghkOM63yTbgWeoWn0gX4eMOUOthBn?=
 =?us-ascii?Q?qNEsWO4pwcnR/Z836QlvZ8vrqV+vZgrYOslw2GLew6GnjCss3acmf2ekVzkj?=
 =?us-ascii?Q?ac5kc1/LQL+HIFroxfcekAIl/eswt5Z/ChsXt//QMoyBKc6GbF0ZRkOPEOVv?=
 =?us-ascii?Q?xlPfpWS2B5PTcI2s8/mzQFY5hymjNXKcm1nt6PBNyC3huhliNHfmrQPjqcnS?=
 =?us-ascii?Q?eJI2YIDnmUfkrsIWa1gG9Vq53MbKxNNEOwvsQHd9OmqE4hrCatq8TANo+qBu?=
 =?us-ascii?Q?v7y5+Y7ulQ2MXdP/RU5BDVDxeoJ5/hbn21eeFeH56wcpDn1wUUS5BwP/YNxX?=
 =?us-ascii?Q?rDQxPd2HQkDaianb31IYMgUpPUgjDUVvirG2iAg1vnUWEDI0S/kd9qdVgE2x?=
 =?us-ascii?Q?n8751ZAo/JpaUiFuSZrWx8fqERfx9V5fK1c8EsmtkcSLqgBSzax7aodwbnvW?=
 =?us-ascii?Q?pEUxgxoEsqFk/TUWc6vpL3jnJRdH7bkomihHQi+5L1jdf6k5SibRCKK4ubc6?=
 =?us-ascii?Q?ft9jzg1ovSR1I3OukaJIjS9VE/1rgP+/0bVIPU7wtRCzloe9I+N4LOI5PnTf?=
 =?us-ascii?Q?tElF3jQO+9CYBI4DT9iplQUsFPqNn9045AFqZ+dGmf5rxYuYjaZxev7ID50U?=
 =?us-ascii?Q?tVQBgou7KLC3k26Cg5D0cHYlQnVQGHoQWH5e+JKE1UFR2mwZ2tfDKF/ow6B1?=
 =?us-ascii?Q?4R5YHqZk/PiGqHOKNoKHHfxer3hXOkhsM/7EFkQMqzgh3xkpf8WNCXHNWi7K?=
 =?us-ascii?Q?IDaW/leYlCEto+TS492eGzB8RQnAg/dO9TcUZFbcgvQdznEn+HY2RV8m5gCG?=
 =?us-ascii?Q?LVhif9eq1dsFA7Ktm7FjHTOf6CDIMmBRGvfpdWRdmxWN1EJ3asnhf4nbKuas?=
 =?us-ascii?Q?KUe8p0+3c/+kRcg6MR+HB7wVdBbSqQHuy72KnxveD9irYnMiablWhf++axxx?=
 =?us-ascii?Q?r37XBLlznjZWrox1PluxAHV4VCw685rHloWFvbhs3CVMx/pvGHihyF3fsqDM?=
 =?us-ascii?Q?fd9d247hRakLaeVlyLFMlxwAUrL51oSc+nJEUtW84mD/71TFJO00GgGzOdf1?=
 =?us-ascii?Q?uMRPaM38j9p//Q1As5hmQ8TbBPYCO1lENPxtRm7ovpXFGJ3fEOH6a9Br7zmb?=
 =?us-ascii?Q?R9ktTtfPPBG+l1A/RMu5nUZLnRRqCzCQiek0ApI6cmZN0mLOnoESyvjq5Iu7?=
 =?us-ascii?Q?GsuYiBw4eTEDoELHS6ay/N3nSH1pH4U5JJZOkVWyxjUo+YI/DZO5gV/UJaxx?=
 =?us-ascii?Q?bsZG2N81guU4pgm2/RqDwxEmeFb/zRnSjo7JaLpp89kroqYcxlhlIjskEgOA?=
 =?us-ascii?Q?kxom0zCr5smOurJrOBkRaksIHW50w9eu+ahmWlojtdrCkTKEqdLfYj4pTAVt?=
 =?us-ascii?Q?a+b2mbXMWWJ/rs8vj9nxKtlFMwJxWAxece2A+brQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8fca19-d568-4bf0-f0e9-08dd46c8dfba
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:11:11.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjDPZXMRht/pAevRAC8tZdCYANzzg1mNN9zpHZeKKSHHtnKqoQW0qkO4rFvUJlOMBJt0qm09jAIhiOXqJ7THSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10694

On Wed, Feb 05, 2025 at 03:30:16PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The common interface for imx chips (defined in imx-common.c) contains the
> definitions for a lot of functions required by the SOF core. As such, the
> platform driver can just use the common definitions instead of duplicating
> code by re-defining aforementioned functions.
>
> Make the transition to the new common interface. This consists of:
>
>   1) Removing unneeded functions, which are already defined in the
>   common interface.
>
>   2) Defining some chip-specific operations/structures required by the
>   interface to work.
>
>   3) Dropping structure definitions that are no longer needed.
>
>   4) Adapting some existing functions to the new interface.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c | 522 +++++----------------------------------
>  1 file changed, 65 insertions(+), 457 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 1e7bf00d7c46..25e3296a1e5e 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -1,6 +1,6 @@

...
>  static int imx8x_run(struct snd_sof_dev *sdev)
>  {
> -	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
>  	int ret;
>
> -	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
>  				      IMX_SC_C_OFS_SEL, 1);
>  	if (ret < 0) {
>  		dev_err(sdev->dev, "Error system address offset source select\n");
>  		return ret;
>  	}
>
> -	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
>  				      IMX_SC_C_OFS_AUDIO, 0x80);
>  	if (ret < 0) {
>  		dev_err(sdev->dev, "Error system address offset of AUDIO\n");
>  		return ret;
>  	}
>
> -	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
> +	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
>  				      IMX_SC_C_OFS_PERIPH, 0x5A);

Not related with patch change, Can you define such magic number 0x5A,
0x80, 0x51? You can improve it later.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  	if (ret < 0) {
>  		dev_err(sdev->dev, "Error system address offset of PERIPH %d\n",
> @@ -142,14 +70,14 @@ static int imx8x_run(struct snd_sof_dev *sdev)
>  		return ret;
>  	}
>
...
>  	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
>  	.ipc_default		= SOF_IPC_TYPE_3,
>  	.default_fw_path = {
> @@ -666,6 +273,7 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
>  	},
>  	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
>  	.ops = &sof_imx8_ops,
> +	.ops_init = imx8_ops_init,
>  };
>
>  static const struct of_device_id sof_of_imx8_ids[] = {
> --
> 2.34.1
>
