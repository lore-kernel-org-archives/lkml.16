Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F253FBB3;
	Sat, 19 Apr 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745056762; cv=fail; b=hUA+Shn40RN/ob3VHsXIqtF16eb9w2yhDUsXwlvwCK3S+2SKYJgNeuCz68VpUBfRnuaC6jaMO/dBNCDTZuKUgDq5SfdP1GqXxIAa4LdkpcdLv09YgE4HXGJ4gwQvCLKldSVmPo9POX1TTvXi7w8S58poTIJ/NO8sVWTTQOWfTjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745056762; c=relaxed/simple;
	bh=30OJNAg/WCBE2UhKoyM4ri4stQsk+pp0WndIcEdBlpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTwXbw8Gd5VTwhoeoG9OftAl/Ls5MyrLsNBRX+Kg2J+4wswvyZSdczsbQd9aoMaMkTIJMfIY+GLI2ort/So/0puGFRTUdnGQI/wueY5zXryTE92A/WjkVx5daO179sApOmbB9HUm4GGSdJHdikMp33VfWdlcms/7BwGnI5BdGxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=keTDbKiJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gw6vcUX6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="keTDbKiJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gw6vcUX6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J9x5ZC028186;
	Sat, 19 Apr 2025 04:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bJJyUeEx+Soz03zaT9mNB2alwnCfKYx95FG7/FVliUQ=; b=
	keTDbKiJEGW/Y2s30Y+WnIhvrn+eWsoYR87W9wmeaxBj8Lf4wsVLcR6dIgqwmD68
	07hx5LK3dGkPHUIfJTlyLhuc7Q/5g9+72oV8Pn0AGNOiHoJrumIeX7QqKLymfnKv
	YtEtCqZldvdgd9XP6DUD3ggba37dKKMMVGqcBMn6iAmAOKCmrx/klJPRw8Yp8JV/
	GByEYI6Rucggy1EzstXvxoa9AafbCO43lVGFW0Hy6l+JWUOXYqeG/SPkU/QbsDbq
	y074wJanKsINOLajSKWXWNlTSzQvqr3s86zxJyPO/QxYTpB6fGr75X7IznEgK3+c
	E5OLNxKS0/3CtRNOhqGgUQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46488hg1gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Apr 2025 04:59:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmZ1aoTXmAqO2CovPqrq/OZ56RM8fEmUbelJeJX4vFDFKCWkoOY4ZToGu9q3OqGe4Mh2NCNxuQyjv7gXe8SC0WI8drsoFYi1w71vCOxZ5wPcIrYnKe8KP1nKEHetWMiZ739xzIYR1ybmrmiomboRu9mt3bDMFnESgKcWOlEVbDnrzQSYrnsV+4b7ChL8ip9ZDIuUEAEa35kGwWztxByriTnV9b5GDU+BY+jcUG4Y3QxDfaG/pmtLPfjrpEhZKfUQRgdxXMeQD/Zenioxw17VDgLWS0ggs8j+Ogpc4o86osYzAU9HdSG9JQLiH4zyx//FBohPeDY0Zo/3OKGX4+Wfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJJyUeEx+Soz03zaT9mNB2alwnCfKYx95FG7/FVliUQ=;
 b=X/dd8AKtejDsIgoDMKQNqyOMLPXvz5hSvjYUa6JRoiONvBHWiB6itw/+nBIDKMCoIAgcPcAWdpzeN5M5LII0Df1kgbSA5cqaqGiP3FyvId9FaCo1MMt4CVlUNwLoWV3EU7rrgsOk8KfWoa6Eb9vz5qGU+2Bu5/CfVDO+iw7LL5Z4IkQu6k90eSE0fRpqxGdMUtBK19kI6hmVCT6zOxCwmtAODtQp0jDwLngn1p9Ba6Zts+veITdPKGsjQAW+tXaIWhXhcfOv5tG8ZL7vL1T/W+bfoUpv/UZEY1Fj+pXvYpMUy4vpOUDy33fBlbPRlK2ffcfbeV5xPsJg02ozB0pa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJJyUeEx+Soz03zaT9mNB2alwnCfKYx95FG7/FVliUQ=;
 b=gw6vcUX618hQz/MkHUrQnQC3vaR94yz8adAK/Qvjc4QwuycOG1DpirCxERMKMEQ1ASZwd7lFCn2yxVfzo2hYSGdCNlZ+TG5HS8c9PN8NXOTSd2OH32rULugU+NqD/yAl8nq8BuZ5jzX5TG9qNVgr3hwJQkSKAKwj0ZfsuCD2Rc8=
Received: from SJ0PR13CA0089.namprd13.prod.outlook.com (2603:10b6:a03:2c4::34)
 by LV8PR19MB8352.namprd19.prod.outlook.com (2603:10b6:408:201::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Sat, 19 Apr
 2025 09:58:58 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5c) by SJ0PR13CA0089.outlook.office365.com
 (2603:10b6:a03:2c4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.10 via Frontend Transport; Sat,
 19 Apr 2025 09:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Sat, 19 Apr 2025 09:58:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46111406541;
	Sat, 19 Apr 2025 09:58:55 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1686A822562;
	Sat, 19 Apr 2025 09:58:50 +0000 (UTC)
Message-ID: <29fa2bff-1e07-4c07-8902-26193d506ca1@opensource.cirrus.com>
Date: Sat, 19 Apr 2025 10:58:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs48l32: Use modern PM_OPS
To: Nathan Chancellor <nathan@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
        Qi Zhou <qi.zhou@cirrus.com>,
        Piotr Stankiewicz <piotrs@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20250418-cs48l32-modern-pm_ops-v1-1-640559407619@kernel.org>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250418-cs48l32-modern-pm_ops-v1-1-640559407619@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|LV8PR19MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fabac30-e396-4064-6fe9-08dd7f28cd14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|30052699003|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk8xNjhGdXVUOW1sWVR0d0RyMG9NTktWaTMyUnN4U2lmUmY3TWl5N2RweHlj?=
 =?utf-8?B?ZklFTTRMdzMzd2xJblFKOEhkMVorUHBUOWp5TG5oSURCb2ZHVzNJbHgzOU9v?=
 =?utf-8?B?RkpCL3pQTFBPT3J3NSs5OE1EYUlDUUdvbXVHT0RFVlRNTzNLbWkwN0VqbnVU?=
 =?utf-8?B?eVRxazhFWmJuNjVGd2NiYmcra2M4V0hMUTY4QXBsTWEvWCtNTzk4SDFCMVJF?=
 =?utf-8?B?cUlMYzI2aTBYeExRazV4L2RkRWxOVGkzdEV3WUpQWEpBRTVvV2I0K0hHZDVy?=
 =?utf-8?B?ck5IVVFNZjNPWHM1dFljR2dSek5xdHZVSjhJbjhGa3RMMXlmWXFyWG5KUzhE?=
 =?utf-8?B?aWNWbmZ5c1ZSdTRVNnU3dFZGS1dzakNDK3lhajRRckdMOGVsU0lCa2w0NkNM?=
 =?utf-8?B?c3JTY1hVbGE1eUlkcnFqcHh5M0JqdG93ZXFuYXpKVldUc1FBTWNxUVBkcjg3?=
 =?utf-8?B?UmZrNG5TQjUwajNYYkNaTHV6TmZ1K29BOUozaUU0cDhZS0s1bERWQXhqQmM2?=
 =?utf-8?B?a1VpS3lyeCtlR3hxaW1FQk4vaFQwcUFwNEI3bVpDV2xSelBQT3licUJOZnZO?=
 =?utf-8?B?VHhCTzVQV2RKTEx3RVRyWjF4eHpUUVN4U3F0VXJra3FsdVBYbHduU1Rmekoz?=
 =?utf-8?B?UEZuRFpyVm5qeU55VkR6bEplYWs3UndrMU90bForcm5wV29mSEdlWWw4TGpr?=
 =?utf-8?B?dU1yL1lYNHFjVUZ3SUhMbWtmaHF2THlGcHgyMUI0OEF4aGs2NlJUSlVVSUo2?=
 =?utf-8?B?eXZhTjI1b0EwQUNWUXY5Vk15OFdrMWxBTEhRVTNNRkpqSEw4c2F6RmgvL1dP?=
 =?utf-8?B?YVlEQnNOYklwM0dLMWlNY0wzYzhXUEpSTTgrWS9ubmlmSlBhVVJKS2Nzb0pm?=
 =?utf-8?B?WUtlaFlJaFVxSGsxRVMzaHJ1c215dm9YUzV4YVF1ZEVzN2Y2ZjJVUXFhaTRQ?=
 =?utf-8?B?eUNsQVpnQmRmUEI2ODkxU2JhV0ZlaFNmTmd2NlhhclpCTWVYMTB2NU1sellp?=
 =?utf-8?B?YUp3eDRkcVZuVVh3QW44NTJpWEw0aXNlN1JzZDNSSnBybGtsWTdGMUFFQnlX?=
 =?utf-8?B?K1hJL2VJZFUwMmxrOEN4VWMzYWt4NUhTUW52TlpGQ3NsZWFab1NuZ0xuMUNK?=
 =?utf-8?B?MW5KUTB1MFJWVkdPajlCMlVFSjh1bmlaa0xFZ3gwK08wclkyOVhpTGRXdWJM?=
 =?utf-8?B?OTVVektpaHJTYmNncGhYTEh3akd3VVdmaW9OTlZ5M01UVG4xbVVOT3QzbEl3?=
 =?utf-8?B?SUtTbVgrR291eE5LemN4SDdxOElCcjE4bitQNzFRcXBTemlZUTRoTUR2aTlx?=
 =?utf-8?B?N3Y5SUlOVjAwdThBcDViMnByTG1jSmY5Q0cyYXgrRjFuN21HbjhCdlZmbnNE?=
 =?utf-8?B?bWR2a0NzL2FteGs0QmxDVGFlQ2F4akNQdTJSa3VUcmI4d1BFMmtmOTh5K0hR?=
 =?utf-8?B?anB6Rm9UK2c0OXFtSktCNFYwelUzd21CNFQxRTdQbFRBRTVyOGhxcUgzRnZJ?=
 =?utf-8?B?MnhGdjcvdzBZK2FIVmtJMGY0WVl4dFpNVzJ0Vm5YTml4VVZNWTdZZzFXUTVJ?=
 =?utf-8?B?endlWDlTMU9rdGhzd21HTFhoNWNhamFTQkZIcUxEcmd5Wmp2NG9QLzRsOHVh?=
 =?utf-8?B?UXFnTlJmZnFIUzZERkZMK1pFZHJ5WkVrZlRabUtjNThUM0dxTzE0elZGMGNL?=
 =?utf-8?B?NDFRejFRZm82S0Jld0EvVFVCY0pYNSt2aDV4bnBlZVljWk45cktIYStTSXpJ?=
 =?utf-8?B?UC8xdGdTK3BKekdFdTRaeGVaRWFScElvdDNKNEJOTlNiTlZnUWxuZ3Y3dnJM?=
 =?utf-8?B?dzBqVWRRUFhHWDdDUGMrcjFSSllwRVdrWVorWWJOS2Z5M0hKQ0tvWWQ2SCtZ?=
 =?utf-8?B?WHVsNDN1bDFucEhUVFpoNVM5ajZQMmt4STdOczZDUXNkSmVpeHNzSGVybytJ?=
 =?utf-8?B?SjdRT3psYkJFSDVuL3dUcVMyOSttZitFOGY3RTFkdXRxdFpHTFo4QjNwU2NY?=
 =?utf-8?B?aXVGRG9xQkVHOUhjYm95NnBRNTdkUm5KWjVNbmI1Q2hncmpYRmYxM3hPaitN?=
 =?utf-8?Q?mqzY/i?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(30052699003)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 09:58:56.9285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fabac30-e396-4064-6fe9-08dd7f28cd14
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8352
X-Proofpoint-ORIG-GUID: Pz0xPZm_WTeP5FEUToD8kbNgwzYdS8Rx
X-Proofpoint-GUID: Pz0xPZm_WTeP5FEUToD8kbNgwzYdS8Rx
X-Authority-Analysis: v=2.4 cv=K4siHzWI c=1 sm=1 tr=0 ts=680373e8 cx=c_pps a=t4e0UQJdoJrPmzgCWb9hsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=2Deaj2xd2OV0ttB7t7YA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 18/4/25 21:36, Nathan Chancellor wrote:
> When building for a platform that does not support CONFIG_PM, such as
> s390, cs48l32_runtime_{suspend,resume}() are unused because
> SET_RUNTIME_PM_OPS does not reference its argument when CONFIG_PM is not
> set:
> 
>    sound/soc/codecs/cs48l32.c:3822:12: error: 'cs48l32_runtime_suspend' defined but not used [-Werror=unused-function]
>     3822 | static int cs48l32_runtime_suspend(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
>    sound/soc/codecs/cs48l32.c:3779:12: error: 'cs48l32_runtime_resume' defined but not used [-Werror=unused-function]
>     3779 | static int cs48l32_runtime_resume(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Use RUNTIME_PM_OPS and pm_ptr() to ensure these functions are seen as
> used by the compiler but be dropped in the final object file when
> CONFIG_PM is not set, matching the current behavior while clearing up
> the warnings.
> 
> Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   sound/soc/codecs/cs48l32.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
> index 8fd0df671730..90a795230d27 100644
> --- a/sound/soc/codecs/cs48l32.c
> +++ b/sound/soc/codecs/cs48l32.c
> @@ -3834,7 +3834,7 @@ static int cs48l32_runtime_suspend(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops cs48l32_pm_ops = {
> -	SET_RUNTIME_PM_OPS(cs48l32_runtime_suspend, cs48l32_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(cs48l32_runtime_suspend, cs48l32_runtime_resume, NULL)
>   };
>   
>   static int cs48l32_configure_clk32k(struct cs48l32 *cs48l32)
> @@ -4057,7 +4057,7 @@ MODULE_DEVICE_TABLE(spi, cs48l32_spi_ids);
>   static struct spi_driver cs48l32_spi_driver = {
>   	.driver = {
>   		.name		= "cs48l32",
> -		.pm		= &cs48l32_pm_ops,
> +		.pm		= pm_ptr(&cs48l32_pm_ops),
>   		.of_match_table	= cs48l32_of_match,
>   	},
>   	.probe		= &cs48l32_spi_probe,
> 
> ---
> base-commit: 0b0a18f1bd72c64ae845a32d975f6d4c727b38e3
> change-id: 20250418-cs48l32-modern-pm_ops-3e4b5860e366
> 
> Best regards,

Thanks.
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
