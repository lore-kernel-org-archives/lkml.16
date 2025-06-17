Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5012628BAAA;
	Tue, 17 Jun 2025 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150567; cv=fail; b=MxKDd5qWmQrD1EKICh3j9UVNVQi2V586u+4Vc/OCcgwqNZwQ5Inkydp7q4cN2WJF/xPWs7pX0ntMs1jPPXgluG4tga5ohZC9kW9bDOY4bUhqXTCdDMTJPq/Fe65DzILxv/+IenR3/M1NoKXCta7NHAGrDEQQ+Gf0+R5z5Z3DEHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150567; c=relaxed/simple;
	bh=NPokhNHtNFNnf3SOht4zkup+7GwFjeWgd9er+SNqVKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOx1jZFJ2GS/VFziCFLligxw5DA8/Kesi42CFbw0lt4UZv7mzjxMvyu/bDsb+fe0rW94u6jWcAJB8bDx3nD0AfKygPJeLmR5GwSRZG73khdya2eDltfN77py440fyHX1Bt8k4j1GBgkVlQS2mGszmp4xErPMOhqxNr6b9mdcHeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c+Y/jVwc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tQLRFpi7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c+Y/jVwc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tQLRFpi7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6slLI027246;
	Tue, 17 Jun 2025 03:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UAwjjBvfkemy+tFZfu
	QtUL3b0pIxEi4ZP107ZrDLcXc=; b=c+Y/jVwcUGSiAw3a1ACZHPihhDmZhAM3b8
	XJclxdkWgABYTt3+fx04yjWpjHqU0dNnjzoXM7ruLEGIklH2ojGKWnXaR/p0PhP5
	WKl5ZCGxLhfZJnEzfTZNA6uBdcc0BDnoWr4UycmaBoE9RwETv7W3J14aGCDfpa9V
	m6i6z+AGWgAdzSNi/5gXqgwQAyYzrNCR2i3e5UmHNHv/5/NyE9UtxSgd2iMpDc/D
	7OeDy/eCIsIJkouC4GYpDh5ke6o4juVlj63GULPA2ZzLeTvDSa7jNkd5S6iQcPKP
	2ytZBthF+APHGJxVpmRtPdM3oaQmrklShT48EtANluEDxPSF7YlQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47ap6as5s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 03:55:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBpqMMaQ74CvZpdCN9UPbDwLwn5bTTyTXWhLcuyqYbirF3Xh3Lvf4cjdjl6DAaLb3/d/2kwUJyAktBlokx5xaxdIYjXb2M4qjM0lQrwOpordxMpbIIpDh/UX6tqUm59khDeH1Xa7tNVv0ZADLIsq6zXC84GnjE4ZZyiAILEMeLP4JpIW1CJnpZvaVHYlt5+ok76xabjZWFBJiOB/9gN01mLLJom/YbYWkEN/v3GfyxAN4aPkmiZW7UamUJJfsvU6/nvZEyHNfYMru8uaiqJJPNxzHr1sPWQGTq0LvJuHeoocZqNcam5AjfM75tBW7v4sRhuLQoZzOvV/qdkYTNTIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAwjjBvfkemy+tFZfuQtUL3b0pIxEi4ZP107ZrDLcXc=;
 b=vbn1JEceSoxp52hxwNaXygpRkS+oMkxxyulPUy73Xo6ppaWMTGXPXWu70v4jM1mDFruKxEQ7wiclInJHNHMm2UNIPNz1rIygSAkzhy6+8FLh/IIYvauSZj+cxzmltvtG90mOZ1TsRzGd7QhXwrOKnRE6iDwPRyUKHTmYCgy17k6E4X+Tujy+sUWN3jCxJyAmEF4v6CMnELzUb2o6NV+0UMp3PxzcZ1DKeRi49Iuv4o1gyHKqTSgxgk5FEo5EPLUsa6NP+UZwRvAinUg5SCYqCjacZxAk190JfWH0gDKR4g7j/JgOTkH064H2APVX0OtZJ6ZZ3srFFRlG3Ud5laYynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAwjjBvfkemy+tFZfuQtUL3b0pIxEi4ZP107ZrDLcXc=;
 b=tQLRFpi7oAmPbsDjHtCvBSGTdW7C6UrjMrWDA/gmXS1LyZyP883hRpGAnqe6iOztvfDrTXph3bXrcpjAV13vQsUP4jnmVEHSwfBihrJ8y1pPF7LY3ehfFr2lXFRUmpILSB3qSdhTsxouM6GOzcQ3iyM3iM9vj0D/od6E3s0EK6I=
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by PH0PR19MB4972.namprd19.prod.outlook.com (2603:10b6:510:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 17 Jun
 2025 08:55:41 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::7f) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 08:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 08:55:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25074406540;
	Tue, 17 Jun 2025 08:55:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C74B82024A;
	Tue, 17 Jun 2025 08:55:38 +0000 (UTC)
Date: Tue, 17 Jun 2025 09:55:36 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v2] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFEtiKQ5RvvZEt5x@opensource.cirrus.com>
References: <20250617071833.3181378-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617071833.3181378-1-shengjiu.wang@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH0PR19MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d2bc7b-c094-4e86-199d-08ddad7cbc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ku5KYNTo8zC0KoIjD9dV7NofnFx6PtAnlzVrBh9hScxBwEoLYGDUvvbrlD72?=
 =?us-ascii?Q?GbN/rgK9OsJCeehmdCP1WB0tHjHxpuQlcitKaJY1iap6rHLZPwdvN5g7hJQD?=
 =?us-ascii?Q?H1Wl18OhY+VYsv+s195U+XocdD7pc0HWe/PmB1TOiCoRSQZUb2mIx3eJwYJ3?=
 =?us-ascii?Q?vScDS3Eu0j1X3Zvq5YYQW4JBIspIt6eo8IOJdjMGvg4ClTw3Ktut1kTlrpeI?=
 =?us-ascii?Q?IxJ6DL77yQsiejzJcyCA8ME9moKw2JSJe7Fgd36RtuVZCSiVxjevuTDdlmmC?=
 =?us-ascii?Q?2VYriQ6dMdXCAUhb0K9MqjO2I20G/Ti+Y1DJtPOwQKwDs2pJZ9SXxc9aMNHp?=
 =?us-ascii?Q?KP8O4K0S54DQnXD75884Vnv+S99mtCZPrnhHfr2NFBGDBmPQRPGbWBnZzPPy?=
 =?us-ascii?Q?1RV7pZVAHRSHuSqYkDWbbU1ODfcUrL8BDu5XE3LqduifRTa0kWicjzfqVtkx?=
 =?us-ascii?Q?GwZrkRbfEtkfctO4SYN016bMZlgdsneNi2chCQauy+ezgD16PJ6qhRxUnR8X?=
 =?us-ascii?Q?fqgdPAf5vbqq5JNO5hpmchADb2DL8q/v4xeWSsW8vThjtfO4TJg6+M9IWxPY?=
 =?us-ascii?Q?fIKjUc8OaENCbL+Zu0X9W1jOgX6lS5fULg9NX/APNxiqc1S4ki9bQL1AgQNk?=
 =?us-ascii?Q?6IRvXW0MOb3AKr8xgmeorSojDHppdCGhJ7CAJ/J7gwvtAgKVdcqi4l+9trr8?=
 =?us-ascii?Q?64oP5kRhxuaVcTlsTrlfFhh51gzLlLWW4zheTpk9ZkMdkmjQHVzVfRRYCbOI?=
 =?us-ascii?Q?jhadZVLzodqPHwYCpJVUEXeeweKBGL4/ESNV7Im78qRC8dYHYqVv96iW3YT+?=
 =?us-ascii?Q?Gq2RHW/icJLsnAgrmJVbX0IbU7PV6vvKziFuaWC4/qE0WEMR0aYqpS6/oNJ7?=
 =?us-ascii?Q?bcS0Y3X7mJ3QW8hKo9gFfuNV6qzmAzGJVsg+26+K+p3P775DyLhacYnxvqt4?=
 =?us-ascii?Q?DFVRYjaETQmk//jP6rGQzxD8E5yELwNlemqOV8x0lRN1OyyAWmW0gk1lS4IC?=
 =?us-ascii?Q?DmuRjaSyMOSXRBBjvxjBnMCjbEx6Zn+YIqqs8LMJ9TKstH6KJPx8CDqrBDKo?=
 =?us-ascii?Q?TP09Y3tUv8U+mjd+z6cFcF6dlLRrvEBm34fdXl113AjPfxGVsSna966VoLc4?=
 =?us-ascii?Q?jRtli7dcJcRtXK8XEQWiAgK733cwVblYVYBWuKAQgvonKUmcZS6q9mTyJcxy?=
 =?us-ascii?Q?3QOy8e4Mjjgc3BzDvz9Ckw0h/W7jkYhvR3PZsP8OT7KFGtLkurOH3sGdHDD6?=
 =?us-ascii?Q?gAvgHfIg2I3mUbB8ylgyrfNVwmDzNjaAeqjmw855F0iZTnsfSifK2P0vdhLR?=
 =?us-ascii?Q?ZJ8xQBokW3aHjhs6b3ly51uzYercQ/YhIuXv2TiVoqOVLFWB5wfKPUyD6wCm?=
 =?us-ascii?Q?lpWWY4NUT6YIBzQMeAY7xkWwOyG+XdERPX1t/VEr82lqaMLF3D0fVjpscpTY?=
 =?us-ascii?Q?AmCKsyhUOoTUOTcDKsuuItGTEyBLzaZj3NAKC59cqsuvrNvgkbRN9tOklpPn?=
 =?us-ascii?Q?fRqKyOlxwuAC6mc0jzSF2rGLd+pPCDT+MjUu?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:55:39.6786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d2bc7b-c094-4e86-199d-08ddad7cbc0c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4972
X-Proofpoint-GUID: 0UahwRdnNTlXVlrfWLtO5GyqWszbn8y-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MiBTYWx0ZWRfX1UxfGVcLBgSj mJU1GUum8O6Jynl6RYpD9YkVfIxk8Tmq72yfz3mPx2mYMejcFom9eO4qwctaJFMD/ONHY18uVfG qa5rHMqoc4NcnqZPzOgRG0C9JakqIOVQMsptPvPlDNN9EjVU7eQu3Bjo4iZyAeRSA9g9F2foBzq
 w9C80LDkHW+R/qBRcUNIsRYuWoyPAwBKhoj8t86sukHV8Pbz+u+mY8B8ljNQV7YjORDIFe1e83d jm1lFSRgwkVFb6cB+BN9WbgYkqzQv7BdjWAT8zXL53eJjt0PhV8pnyT9c7srPAiziXRRTbh8/97 Kkq/Cx0qV0TOQYXjlll5lhoPqjaQSDmYLXr6uOne0Zfp5FbZDtmg9MnSx3+9LezFddhJEJtC4ek
 4nTBdNcxcKp11zcd+r+qNX6XECHc/i/rvKt9wpRJLIICliBCpVo17GnG4u6QmTgjHRhwo/v2
X-Authority-Analysis: v=2.4 cv=F/pXdrhN c=1 sm=1 tr=0 ts=68512d92 cx=c_pps a=1x4O6yU4S3fpGp5AIrVd8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=2c2NBa5s2hA8G5O4QeQA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 0UahwRdnNTlXVlrfWLtO5GyqWszbn8y-
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 17, 2025 at 03:18:33PM +0800, Shengjiu Wang wrote:
> In some cases, the sysclk won't be configured on init, and sysclk can be
> changed in hw_params() according to different sample rate, for example,
> for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> the sysclk is 12.288MHz.
> 
> In order to support the above case, only enable constraints when sysclk
> is configured.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> - Don't remove constraints, but only enable constraints when sysclk
>   is configured.
> 
>  sound/soc/codecs/wm8524.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
> index 403e513f3fa8..5d8fb45db272 100644
> --- a/sound/soc/codecs/wm8524.c
> +++ b/sound/soc/codecs/wm8524.c
> @@ -63,17 +63,12 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
>  	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
>  
>  	/* The set of sample rates that can be supported depends on the
> -	 * MCLK supplied to the CODEC - enforce this.
> +	 * MCLK supplied to the CODEC.
>  	 */
> -	if (!wm8524->sysclk) {
> -		dev_err(component->dev,
> -			"No MCLK configured, call set_sysclk() on init\n");
> -		return -EINVAL;
> -	}
> -
> -	snd_pcm_hw_constraint_list(substream->runtime, 0,
> -				   SNDRV_PCM_HW_PARAM_RATE,
> -				   &wm8524->rate_constraint);
> +	if (wm8524->sysclk)
> +		snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					   SNDRV_PCM_HW_PARAM_RATE,
> +					   &wm8524->rate_constraint);
>  
>  	gpiod_set_value_cansleep(wm8524->mute, 1);
>  

If we are allow the clock to be set at hw_params time, we
should probably also double check the rates in hw_params and
return an error if its not supported.

> @@ -98,6 +93,8 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
>  	int i, j = 0;
>  
>  	wm8524->sysclk = freq;
> +	if (!wm8524->sysclk)
> +		return 0;
>  
>  	wm8524->rate_constraint.count = 0;
>  	for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {

We probably should clear rate_constraint.count in the clearing
sysclk case, and we should probably also check if the DAI is
active. The user shoudln't be allowed to change clock there is
audio already happening.

Thanks,
Charles
