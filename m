Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A061F416D;
	Thu,  6 Feb 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858421; cv=fail; b=YcS6A4ztMjHCKjiOoCtKnN+mDRox2gv8cOPVgYO/tw1zTlb+/kIgIAVHV/CP8DWrea7Xs2Xjb6uWjSWg9F6TYw7zvAf26NtDWJEl+TqYbxOKv/Z0EIliaxIyqwOVuKl9FFgx2nC/4bUbP8DT/X3ruBUew3kUVTuClOSs3wyYfsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858421; c=relaxed/simple;
	bh=u2JAUPiaoz/OzsVddlemkJs8zzjfiRwzx5TBQ7klS0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dWiK9o0wNlZBHw48+EntYfi9TkObY85JTEq/LAhzL9P2nbrZbPUFJCEHcEI8gcXy8MhsR9scT6mxdQ1rN6/CxQ0IiVHx5bMT604q/zxDEb8fXirPGrGI3BqlYWeZsAfdkle8e4fHQ4ZpcudEXBhLv0RwaXGe1nCAoyZPMxrmpZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BZwKKqu5; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BZwKKqu5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZwiH2zQpSLD/kw0bgmBzeKBwFq+TEfqZlwQfxy9tWtzmu33cSgD8BXBOVMnbjrUB79RfBrngm1GASRg9Gc10YheE5cJ1GtcIAFB2ApxHFghf3xoL9HwgK6ktLwCQd/aUhDV02/mtHmsjSOH7oLeQNqi6PsB5iure1lzqDl4XFhAAReCSg/KzsDKoJ7nC16uaTyCtVYpMgIcj5CF2si8+gC74AF6ocEbhRt2Zhc9R3+uAjUeBOY9wmw3mvfKwNsd4x/HFdJY6zETvw/5+wAjMnb5TYjFon/fkV5fKYeCzTAawp1oZJCWjTWtlc7UoIxZgnjGmS/rM3MXHe1DQAC6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBXJX/jm4Q5Zjt5mLbOhxSL1AWO8jiyxaxVZFKjD5uo=;
 b=taNgxLkhQ4RXh2OWMqGe8hj5FmPTlW+IA0mWJUhhW4/4JoGz9XNriy+OC5N+5Q1xHUnrRF82tgyF2IqVR1UWXr9avRhzTRCWpPgExw9RRPyfbxiQEQKHdkjDSu7TJ9ikTl9HtByooaCY1BZ01qbWs3kJ0AkFysDe5u4q5kJ2gUkILjuVSkWkz+iJ5FKIVk4QqaYPOvwNyFjOJAkk9SOZJGDde4EDQ/fGta9kt+YeQP2DvrCnWOxP1SgLFRoB4TFj8iKdXDYDmosb3GVgEtdF3qjjnqi7BHN6G/e7NNl9QDB+ZdMCTB9vipc8qMb5iLxrUIW/vfYwtoqeWn+xGqmkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBXJX/jm4Q5Zjt5mLbOhxSL1AWO8jiyxaxVZFKjD5uo=;
 b=BZwKKqu5SFbytUMPaQ8BTYVssCt+vsOn9inLMUVVc1GjYJkwM6G0beZzoTow6Sk9/5eN1NOcYqy90xwXtrRcqc42C4F35zEQMCHR/D7n+Og+DEZIycXrW6c4HFLXp9Mb4psUfIVI9Ida6mfQRu4XJBMS/ZubjtxMhOSoNQeT2XNFmliOV/0rIb5AiKIe4P5jL4q92aXeqryUwEyY2Qj7jqxYgU+2myMpI7CGmIFebCM3BuZ4WesXe0W87zZOL9Vdzeb2ABpX+OnzDV00WPdG2egVDypdL7ANm8xUUpDZ7jtHnFGY5gVTXjtZQsoo9JuvkOa937r0+kkdsCLVTzlSSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 16:13:35 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:13:35 +0000
Date: Thu, 6 Feb 2025 11:13:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 3/8] ASoC: SOF: imx8: use IMX_SOF_* macros
Message-ID: <Z6TfqBpITPugtGmf@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: f327da03-23a3-4315-a96a-08dd46c9356d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OW7KGhOOxhJeu1bHUgKxvD7QC2DDV5iO2SPpjhOR0TlLCjJcZbWq5mpZyCOM?=
 =?us-ascii?Q?3sI3WZMnpMiOoTOL9oWBCOHpv090FPgF8UsSOwP23dfTkV3CrJgC7FZS2cuD?=
 =?us-ascii?Q?JBSbzE2UayHMaRzvRloymFfiTRRXA3q9XHINri6LkBjXfHRQ72A5vy+uTYIR?=
 =?us-ascii?Q?oagook7T2Sdc6hOauR7T1ab82bMe2TAGmbfuAwD6DOzGGJhNXAD3/XppZcOa?=
 =?us-ascii?Q?+THFw3j+hNXetTS17IuxdOnd+tHm70tZZG+FT5t1u19o5699l+C5c/NcM/8w?=
 =?us-ascii?Q?m1yREbURqXCnEbf5UPucCi0lBOqHr2sWjoEo5yor72C5wGAmuCIMUfctbO/x?=
 =?us-ascii?Q?bpF2Z7J8Dy2D02npF+fDIFj4oFgBVgg4DnTub5NyMW6p+pRHWrZlboXKwVgn?=
 =?us-ascii?Q?Qjx1uVOfLqv9gnN6L/9aqxVlFimIl9XlBNRm9AoiUSKdtCc19cOKiDd6p/fq?=
 =?us-ascii?Q?HTloAftHJGCUyGxEQy7mPmywuuPFicpB8cBT0V7ESieGoPncLblA1tYui6NM?=
 =?us-ascii?Q?/COzq431jxtTiSfCVdPn50maagpBs1nL/XShxneldA5b0runwzErIOlZFzME?=
 =?us-ascii?Q?80Z2Ypok1pq87uYPRAlPCeGtmW6iQy07FsBqlB23vCcr0ZxrJYAAxUjiewVe?=
 =?us-ascii?Q?4+aAb3EeHHsVvzkYt3TRm1tn2NwleNxRpyxek4wsT3gsd4qFBxDomEpKI63g?=
 =?us-ascii?Q?BkBEWRGTSoiSG3XeWcBjQu0VFF+ABqOOKT+DHhtZXZxPYC0QptnxvtA2nsOr?=
 =?us-ascii?Q?O/xn0aDmUDaOQgEd7oXjqgUmWtiL19k24CX6LPhbsfu212ASEMwGRi7YAPi8?=
 =?us-ascii?Q?AEUj2ddhZUEPn9gxxrg6B4kiEOoYvCuiUTi7p7OV2XICUkHdbxU4D/AmSSwp?=
 =?us-ascii?Q?KkFvXbHw6hdAyp5i1L6szgJP/yQX24TYSb5FVAdOAgGl9djWlG6au0Ennfjj?=
 =?us-ascii?Q?0ro7flxAZaZoQiGZMA0E7pjMj2Hr4g9HGkRVBB0XwljfkmlNft/ygVcEzH/r?=
 =?us-ascii?Q?31mBTqxCsQYiOL7rvjv1KG+dh6eZnMEeAdg4FfVvvGW57IX4/xicg9RG0SuK?=
 =?us-ascii?Q?7WyyNwXsGunMhHAzhAS2skhO766/swP9IuLRiaxmE75EkJaqrDyGzuAXsnT8?=
 =?us-ascii?Q?ODdD2EIJGZatuL52BXee+AOsYYDnmiFlJoI2sxw5MVQf7HI12qRG2IC1nyWj?=
 =?us-ascii?Q?LVja157gEdSxP29qShkvqr+duqxmSa2sn8pYb6drEIz5+VXGt9OlX7C8Ohw/?=
 =?us-ascii?Q?ul9fyV7cnz6CLrE/dQHM+A3Acj9wLQyU90NO+W5MlOLU5FGTj/ZaKADdc7Qy?=
 =?us-ascii?Q?8v0SL8qzB0+yicny9QGN/bAXrGsReTT33vieBovPPbgr/29xd50df1CHtz5w?=
 =?us-ascii?Q?uKAL0CaJS4dqd2dkNUMD/cKlfEE8T5WHh6ShAwYaI6bN0gkdZYna/3TCJVr3?=
 =?us-ascii?Q?SAQgra1MGxBx6W3a4Vgy3ErixMDeLw5X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jaDs05fFqYgStz8mVxZZVIey0F92bsqK9Rg8iLaVtGHhxHBj+QzW5u3PCyEn?=
 =?us-ascii?Q?zWDISX0fkpNvlBAbVrreeBFJYjtVAUEHAABXbj3ffQLJYZvISDJb4w2ulA/Q?=
 =?us-ascii?Q?JG6gIY6pmt4C3+X8P7A5cDV3O9QZ6T4A+rxuncCX2rmzF/3r+MIM5MevzJTs?=
 =?us-ascii?Q?k/LMERoUmQQ5X4pbLNROYfbSZ4eSZCniDKMl1YG+JhRSbgQesazMqoewHPIf?=
 =?us-ascii?Q?7s099EokgYgaAJuIIxQLBQhzbS/FuXj9GBt1QhoYYJOkKctBXUE0ks5EYi9W?=
 =?us-ascii?Q?x09jy8Avy/EYBhFwP1kM4XVP8OljAY5UJCYEh+qYOAdtm1MS5dY11UbEMFt7?=
 =?us-ascii?Q?kO+QSMrE0eKDboJWa0EbCb9ojDVgda8P2+9w4emvcvaxYfkn/K0ll9gmauPu?=
 =?us-ascii?Q?QJUyHUhL1zz53xqjG/gQhHldXjVFrc5lxMCHPJEoqF2KvHEEIAZS3i4f9z8A?=
 =?us-ascii?Q?r0ZD8VsLqFjDSEa3IuhuHGalCZZmxedz1Wdm343s2TTkMSaK89hTCYrboksV?=
 =?us-ascii?Q?2ImKvZdCsrjEkEHmirgySXUBZ50vs5m4e5RjdjHepiZzeEH77yPVqktUmvKE?=
 =?us-ascii?Q?S8cb7GwoJ3PfVWHNxKiucOUnA9DZncj5CS76VS9AcOYJmm/O327MP76843JK?=
 =?us-ascii?Q?CpsPh/mfDu9BQUqwk69AWI5tQKj8z3GYayGw8CjlSXsGMUkPbq3++0nAuzCn?=
 =?us-ascii?Q?asHIM6MWRvLdZL7ekCCEJkkfGo6zIQBJ2IrXnz8X8nVvSoNQvcs1KhdeSEgx?=
 =?us-ascii?Q?L7ACFL2ZzuPP60AkK2jLCTh/JcfX0/asuke7fX+RXDqHwnEeABmwrguwX9qi?=
 =?us-ascii?Q?LSEMh5+R8vTP59eCdvw2Z/06JXSzkSFfU5UrU0ydIllnkh5pBEbsM6nV7+hU?=
 =?us-ascii?Q?DuYCZp6myW74fr3zUKEWgkVV+DJMhJ1ysj1D8zJqV/7ydWtjHeqolTAEmTrh?=
 =?us-ascii?Q?5ivPL4otNdzBvmpE3CiIcZcfhteE7CsJGyzcYxCr12pdbV5THJ3CvfYOZoy0?=
 =?us-ascii?Q?NStyfIl0tKbV6xjlBtf8TvPn2HhK8DmmZkDX5qmrlUBkMYmASsQ+5k0jOJs2?=
 =?us-ascii?Q?hpfJlOMuyFWB6LKAnsESLgjDDnKJ5nlGhN/iBx0DunpznLDl8PBqK3Pi41xe?=
 =?us-ascii?Q?WHs5efE5qi0tsY/XbTMVP3hN9hAk6S2dvEGUNn1NDDu0MOwK6nj9+BiTOesm?=
 =?us-ascii?Q?HSfsIEiIbsUuz68bcnBMkbaJUUWXFmuZ7JR8gAlP9kxv++udqnMjG6bBJiYu?=
 =?us-ascii?Q?iqkTMTx0kgfbGRCj4pno8sj4azgzrwV+1hr1RPh7rMQQfqB/K4no1UtZl5Dv?=
 =?us-ascii?Q?KstKt4k+ycByv1OXAhC1HhJGYM6ax6+nXuNcsQPnun33t+lSAB22NA2MzVEd?=
 =?us-ascii?Q?gHmk50HLdg93aoasX/GuHixqMqctBTEDGMyScgSV2vhqvAlPzHltrgrxNRtW?=
 =?us-ascii?Q?eQKTI99V7QaOIpNg62Yn/24H4nU3BqKoqF0iNAMG0En98FFJMQBmHFMA8qjT?=
 =?us-ascii?Q?Plji9O6BDgCtYCdpVMvUj4qn4w2BnjARkrM7jr56XCEofqWHCzY7uzOiNyiO?=
 =?us-ascii?Q?rMBszEm84RthpLQISZj4H3TzR57iT4FFAOUZK1LV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f327da03-23a3-4315-a96a-08dd46c9356d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:13:35.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crbvtd3w9jr6xeWcdk0pm3mD59wRHtcmiDQjszpq6voDr+6Qkn0f1rpoXIbe7rZSPy6mpinSmLQ5iKoUuGI5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

On Wed, Feb 05, 2025 at 03:30:17PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The definition of 'struct sof_dev_desc' has the following properties
> for imx chips:
>
>   1) FW path is the same for all chips.
>   2) Topology path is the same for all chips.
>   3) FW name can be written as: "sof-${machine_name}.ri"
>   4) IPC3 is the only supported protocol
>
> The structure takes quite a few lines of code. Since the intention
> is to add support for more imx8 chips in the same driver, we need
> to try and reduce the number of lines taken by information that's
> not particularly useful. As such, we can use 'IMX_SOF_DEV_DESC()'
> to reduce the declaration of the structure to just one line. The
> only information that's particularly useful can be seen from the
> parameters of the macro.
>
> Of course, if any of the assumptions don't apply anymore, driver
> writers can simply declare the 'struct sof_dev_desc' the "old
> fashioned way". No reason to make the macro suit multiple needs.
>
> The same logic applies to the array of 'struct snd_soc_dai_driver'.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c | 71 +++++++---------------------------------
>  1 file changed, 11 insertions(+), 60 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 25e3296a1e5e..52dff369d9cf 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -119,28 +119,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  }
>
>  static struct snd_soc_dai_driver imx8_dai[] = {
> -{
> -	.name = "esai0",
> -	.playback = {
> -		.channels_min = 1,
> -		.channels_max = 8,
> -	},
> -	.capture = {
> -		.channels_min = 1,
> -		.channels_max = 8,
> -	},
> -},
> -{
> -	.name = "sai1",
> -	.playback = {
> -		.channels_min = 1,
> -		.channels_max = 32,
> -	},
> -	.capture = {
> -		.channels_min = 1,
> -		.channels_max = 32,
> -	},
> -},
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
> +	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
>  };
>
>  static struct snd_sof_dsp_ops sof_imx8_ops;
> @@ -238,47 +218,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
>  	{}
>  };
>
> -static struct sof_dev_desc sof_of_imx8qxp_desc = {
> -	.of_machines	= sof_imx8_machs,
> -	.chip_info	= &imx8x_chip_info,
> -	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
> -	.ipc_default		= SOF_IPC_TYPE_3,
> -	.default_fw_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof",
> -	},
> -	.default_tplg_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
> -	},
> -	.default_fw_filename = {
> -		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
> -	},
> -	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
> -	.ops = &sof_imx8_ops,
> -	.ops_init = imx8_ops_init,
> -};
> +IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
> +IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
>
> -static struct sof_dev_desc sof_of_imx8qm_desc = {
> -	.of_machines	= sof_imx8_machs,
> -	.chip_info	= &imx8_chip_info,
> -	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
> -	.ipc_default		= SOF_IPC_TYPE_3,
> -	.default_fw_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof",
> -	},
> -	.default_tplg_path = {
> -		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
> +static const struct of_device_id sof_of_imx8_ids[] = {
> +	{
> +		.compatible = "fsl,imx8qxp-dsp",
> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8x),
>  	},
> -	.default_fw_filename = {
> -		[SOF_IPC_TYPE_3] = "sof-imx8.ri",
> +	{
> +		.compatible = "fsl,imx8qm-dsp",
> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8),
>  	},
> -	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
> -	.ops = &sof_imx8_ops,
> -	.ops_init = imx8_ops_init,
> -};
> -
> -static const struct of_device_id sof_of_imx8_ids[] = {
> -	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
> -	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
> --
> 2.34.1
>
