Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD52367A8;
	Fri, 20 Jun 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407995; cv=fail; b=VIQTJH6ld8NOiM2kkJhBmBxwJH8SZofQqYHpjWNKWxUNOvMU+nSmtK9pz4aNdZBpcJIyyjNYX2FMBhk0oLxmJQZZRvAv/GTgT7g7YCZZscNL0A2MNjTTsMg4HRNwpAWxKrZEAZ0YR07T4UvbCYy+7BsnM+hRCDdXX3HXmVX5U9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407995; c=relaxed/simple;
	bh=Ji7LCfTTv1ZKfk2wt/bYvEF8lXpTIgwcfqMgmktETeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGn2R/b7IjC0lAa6fPn3yfMo9X2eHNxfbHBvSOeR92E3OGrqTI4TC9rIGdcvg4M58O0s+Zu0gW6UYpjKAnAkTJFjqU2OTVT5R5giHInwCZsrI1ZcslrqvjnXjJJr/HARfHZrSvwG7aEsUvTtOLls4Kqt94Wqy+UbziWu4xUDCy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e4uJyPSR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cGNOtq7+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e4uJyPSR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cGNOtq7+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5ioA1008732;
	Fri, 20 Jun 2025 03:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=RzlP0oYBlR4u31qJwi
	0JRRKRnWafOFRPGvrA+KwISuQ=; b=e4uJyPSRXxcGlaVwDWzjqc+me8JYwtQb1q
	yeJCrcz8+eTuRj88wrd8YVwNlicMu8J4ZYs8t9Mw+Ia2eoLrjjTAvReXujbDUdTf
	r96Smj2gMPNy55C+bmNREHmE4wP1ls8D703Bg09A8qdb0Nh0kyN4O5/ywGJVrvtV
	akEh3lWhYRrAQSBBUSyqEOkkag206EjCap6gV4XVmEQBdU8AtADHaqrqcCmtiANS
	VQXZh6To+E8LAUv+TtoyxMlq0h/oYpqVw9S+07qzp7fOWrJ+SE8oXWV5WtbNJToe
	7C7icfo5A9kJwQMf332Nott6FIfEgSoZ+WZ5PbhV5EEzcZk3NWlg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2129.outbound.protection.outlook.com [40.107.244.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47bsfnuuvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 03:26:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2nTkvffBKb33D5Z8n8qsxgI6xJ5MdJ7Xqq3zxcqAZR7055pQeR/gQv7fJyQmGzBzus5InCaIBVAxRxlk2s25qH4uzgwc2IjN3z40GyeBmO3R6oKLPbxNbRoeyyxa3Hc9Tnkp3ZkimsqofWTkvCN5gH/QtQbFU1zJa4IsCQqLkc9cKglUVRcCjV2XplYilWx2XU2ddTrksiLgT4KMhW8bNTU+4pjYBw+Y6RoeOb65eeH66YjeyNb3pdip2qhQE1EETYgSHyU0Sudw4tOPSxGsWYEV7T1aeN+7qSLmWe9aQVVy3RfN+m7dL5nF5eu5e2owBfDYCxdkE9qA3jgz8EoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzlP0oYBlR4u31qJwi0JRRKRnWafOFRPGvrA+KwISuQ=;
 b=JVJOKnRo8+P6Z+RITc1aLoju69wSRmhRDotN8Tvo9mMNpOBN+QiVIQrqCRizNdGzwpSLXxfD8J4mgHTb0HDerFuNRc6uQfR1JUj8gi7cx1xS0PZkmu/JJ+1d1NO/SH/G/t5drmrV3/TPQz2Mc3hYjBaaE6Hj09VczLGbGqBsXnx7D8eQROCZ/B7TF/tO6so8Cj+QEpi+M2JI5C8a71IPlHNUfKnJGGhFFF3mC1u0pHtDzO15XVpUPjj0KnlrcreGi80cZBSRC+634eC5tEayXOsecdydeMGn1dsvgs+rj28rohowAZVtzAJ2n9Yk8IlOjEe+IHQxI7KRlu4qSrLQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzlP0oYBlR4u31qJwi0JRRKRnWafOFRPGvrA+KwISuQ=;
 b=cGNOtq7+cszAugsDoz8GvHfDa46BHne9Y1iYm31VWA8hF68KGFq42HBjDr8mmQYgviBuyWcrKutL9g27uDUrdFv5WfYI2vg+a06AqYqaiqua8M7Nrs28Z7Yxvx7fgF5NShszWCb4voN8NkeX1RmW8aoQlNQbxAAKyz46NGCjJXU=
Received: from MN2PR18CA0022.namprd18.prod.outlook.com (2603:10b6:208:23c::27)
 by DM4PR19MB6486.namprd19.prod.outlook.com (2603:10b6:8:be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.14; Fri, 20 Jun 2025 08:26:05 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::37) by MN2PR18CA0022.outlook.office365.com
 (2603:10b6:208:23c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 08:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Fri, 20 Jun 2025 08:26:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C19E9406540;
	Fri, 20 Jun 2025 08:26:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A7A5A82024A;
	Fri, 20 Jun 2025 08:26:01 +0000 (UTC)
Date: Fri, 20 Jun 2025 09:26:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFUbGFNAISmamfv8@opensource.cirrus.com>
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620021403.624303-1-shengjiu.wang@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DM4PR19MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 07218997-5a67-4380-ccf1-08ddafd41815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I4tj5d6/27201h7NTfIgYj8I4EInvm4ypPa/bUL6oN6eIyr4dKo7ymRmO8e9?=
 =?us-ascii?Q?qTc+5BTbi/5B245taXwMarAMIf1MaZMgt79+HPW2Cmc93+3bubG+OZHuLM8z?=
 =?us-ascii?Q?et/hddRYe/CFQzxHoZBUCaSqO1hKktyjnAHPuKh30D3WIJsNpaBDfPyatrmC?=
 =?us-ascii?Q?YQ4D/kLuN8XxICnHpvz45d67qRBxKASAVQvq2zqw9ZCxJLBLESziTWiLX5IZ?=
 =?us-ascii?Q?OAloIil5EEJokGthoDSijHfwfknJx4m8g9XtTRfWzTWGuvL+xnKt/EW7YGUm?=
 =?us-ascii?Q?UjzfjczMxrWpDwICJhyYhw8s6cjKiD9LfycPKpQQTfMfcXs6OdVdKnxyIf02?=
 =?us-ascii?Q?kFnB+orkhVLJzThZuDfw+qMr3IKmK1nL+D5mevo4fsVfnYxE4Z0ZYRL1bba4?=
 =?us-ascii?Q?XDqOHblgAX0++PTyckT/gmc9XlyVUVo2bSksG6yosZMylomrNMtYka3pwDf9?=
 =?us-ascii?Q?cL5cN7NIKqB8Ndg52DMhM4RIvdm7LB6qG4ZUjLyJL+0fT/0U8xQb03B+bEdY?=
 =?us-ascii?Q?UtouaKVuFJXzY0zY/skhMr7nxUlT/9HTyA6GJiFuy18+hOX/PRHUjnrhJ+Gz?=
 =?us-ascii?Q?Oapu4oQKmTpD5NTZgu8aMRNK6bDsnv+GRnE41OFCd5dz2Btezh77IvYKtlEY?=
 =?us-ascii?Q?SWHlRqpX/+7BoLX92EMX1m+yw9CxynYzk4WccHlgM/bizDaC/0bdUHLH/4+4?=
 =?us-ascii?Q?yX/YyOTajPp6FVrzBGecKG8P7QulmHgaLPfHlPa+bQEZULVn4wzkqSB/+DQa?=
 =?us-ascii?Q?YU02lPwnCA56m2CsKh+GXvAQeHSus0rVN10+ud9dIuzMLhSfC6FjSTxKVJBf?=
 =?us-ascii?Q?JE5azxnSfVdugWuRgJkUTHLeeZetVvNj8QBBlECjQZopgY/H8DqhEZeuaKOx?=
 =?us-ascii?Q?GdxCcQe9sK0WYID5u1adHeBCtcR9MoFuabE4PcfIBKImgvo+w1XaVdKgcuGM?=
 =?us-ascii?Q?S9RaYM4XNoMt94rKCzRStFnpcNG01jvsjz+3/xjFxTS9+04NlOk49qiIJlqZ?=
 =?us-ascii?Q?1jh2Fcz2UjGZweCeoiO4inRdznc5NQLqZ9x+4b/yaiKsPNVvcwPAK06jHWYi?=
 =?us-ascii?Q?WaQV/VK3agogjaRxwOQJj9u4VGdMxPxqfxpjvIy+qULjvd1y4JTIm0E9m7gG?=
 =?us-ascii?Q?pkojz9XwxRDEMelBjHN614afEClAxEEjMC4lqJV3Od8OnZ51Ze5eexfsFj0b?=
 =?us-ascii?Q?poqosRHpj03BOypUxLvox1G1SOOvKBLIzq1Gg1qSCkgT7NFUYC18NgHmKmNI?=
 =?us-ascii?Q?3+gTC9GMOFadCimaHX6hRNor/i//7ycoDc2TWVnHNQp2DnIZspNRV90OKSGC?=
 =?us-ascii?Q?u0gM5NQHOibrwQqT2/mKwTykokRx1O8U3/SNVNlStALIdIJJkUfzrVJgc8LZ?=
 =?us-ascii?Q?OnwxRgKWEoEqz5c8GsNcq3OgE5fcDO2d6DIfeDKLXqdPDDr7qVFLz6lXaUhw?=
 =?us-ascii?Q?87dY52bROZJqAqdLtcY/++GoDvuy47CbWyyfdmXq70ekxwtLZwqN4cWHJv0K?=
 =?us-ascii?Q?/5e5P8X1sFrp6lwrsxEL+d1r2KcFREA5X8WN?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:26:02.6363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07218997-5a67-4380-ccf1-08ddafd41815
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2MiBTYWx0ZWRfXzT5IChXFiNuY AOLMgYm+CYDfUSp7XAnNbCNr8VITtiBZDkiVw4ov8C1QWmLfUYACNs6mOvt1IX8n6rqrN+TwjSF whRJEaZ/s9f8dhSSLPX5IhjsUCKI1DM0me53/BA3RYwMm9T1E5H5QhUXqEqRkMcqsSMuF96mC19
 1Ob69mrVHJAEYuX0WGGoZYJlWSwrZ93xHNMArPZOEwmmKrI/QBamcDOtyKMTG9g1J11kN+2FFpb iXvSXhDcaqf0jXSeA8bmnn9MaMzPsSZk2ColjolG8fq9H6ADd2g91AR74LOuy6syD8lfkksO4J+ luiDxBroFjKnvfGTb6m0dZeD4Cp9qwEYEPHKpgd0ieJ5016ep3twXSBjfuUuQeZnxY2XMbDZbmw
 9ees2ZKEquxsWeHI9/qTv/RNxy6mCPr0yQZ3nGp5BQGWsGJ6j2ptWVL1nM/jyG4mycu1noJk
X-Authority-Analysis: v=2.4 cv=Z4HsHGRA c=1 sm=1 tr=0 ts=68551b23 cx=c_pps a=/WqipjsCZPjtkRV7ouq+ow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=_IFTr307chJb2K7bLdoA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: kdfbXYRx25djqiBRBORQYBC6dHSVJyKs
X-Proofpoint-ORIG-GUID: kdfbXYRx25djqiBRBORQYBC6dHSVJyKs
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 20, 2025 at 10:14:03AM +0800, Shengjiu Wang wrote:
> In some cases, the sysclk won't be configured on init, and sysclk can be
> changed in hw_params() according to different sample rate, for example,
> for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> the sysclk is 12.288MHz.
> 
> In order to support the above case, only enable constraints when sysclk
> is configured, and check the rate in hw_params.
> 
> So overall there are three cases that need to be considered:
> - call set_sysclk() on init, then constraints will be initialized.
> - don't call set_sysclk() on init, but call it after startup(), then
>   constraints will be configured, the constraints can be cleared with
>   call set_sysclk() again in shutdown().
> - don't call set_sysclk() in the whole flow, then there are no any
>   constraints. The clocks depend on cpu dai.
> 
> Enlarge the WM8524_NUM_RATES to 12, as the supported rate range is 8kHz
> to 192kHz.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> +static int wm8524_hw_params(struct snd_pcm_substream *substream,
> +			    struct snd_pcm_hw_params *params,
> +			    struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
> +	int i;
> +
> +	/* If sysclk is not configured, no need to check the rate */
> +	if (!wm8524->sysclk)
> +		return 0;

This is kinda the opposite of what I was hoping we could do. The
idea was to make sure we returned an error if we can't support
the given rate. So if we don't have the constraint, we check the
value in hw_params. This looks like it checks in hw_params only
in the case the constraint existed, but in that case there is no
need to check because we had the constraint.

Thanks,
Charles

> +	/* Find a supported LRCLK rate */
> +	for (i = 0; i < wm8524->rate_constraint.count; i++) {
> +		if (wm8524->rate_constraint.list[i] == params_rate(params))
> +			break;
> +	}
> +
> +	if (i == wm8524->rate_constraint.count) {
> +		dev_err(component->dev, "LRCLK %d unsupported with MCLK %d\n",
> +			params_rate(params), wm8524->sysclk);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
