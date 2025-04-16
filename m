Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FD5205E00;
	Wed, 16 Apr 2025 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793908; cv=fail; b=lTtF4P7GGmeu6Pt05AU6r10+mJ3AvsN4dzqIcBBjwYDkSqsLpiOLzDpcYVWxbG4O2wXc879wdymC2KU65KRVlBp46V/KiyhwNVRbqHy5sv+/2NYuGQlP5S91g2uja0Ro4Il9yXG01vUEDuseh9SEa1m2h9GOpaR990h1u/vozVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793908; c=relaxed/simple;
	bh=Z5iiucz4iRMY/CAXWG8QlZvFXzgUQu2OoQNcNBBNdnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsBf9JUGXDrRhgCiSjXYaGR/R1ib4L9YplKj2SYgnEyCSoP3xmAJH+L8iwRi6iQv8R9SjuEDMuodXNsP0k+LU/5gyRgECflk35i2TtSP5IbyF9LiZTKtzSwIG4cQ9vDi0qFTepLrZwv+ZJIbEkmojIUB27pQCCXVAJ/VALmzSR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W/8V+GPa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PorRVHtf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W/8V+GPa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PorRVHtf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5wZnH007151;
	Wed, 16 Apr 2025 03:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=I441p5U3eB74h6+wQnpMU53ywGVpRCKPsXzsXpu0/FE=; b=
	W/8V+GPaoI52N2xy/KQrr3knFPI+eugFfYQYmr1mdh3wiHlAoV+Ic+Ut7QBwl4dL
	zP2j+lprJ3nWdlwoIc+ac90GrAglrgoGqKlHvX/7VmCcJe6BRsdcXCms3XxJF3J0
	yeTjk6V4soHhsbvQmmesMDad+e3cUodIBviRdIxJunSydzCXxEKKPRzEAY7VH1jt
	9lAvyCOZYvvt3MTxOJCSAk49DcYMJDKXP5s2zS2N5xbXNdy9Phb3XT3TKUSxKJrs
	J9JoqWLinwePHbMda/cFYJaig6xTFE5GejFmXid6+SUU853R4StxlgIfo3NX3EGz
	0cCplBhvuesCQeRPuh6w0Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt2cka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 03:58:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jqv//GuAMIrZH3i68Capm8ej0MflR2LMC9JZfr845VyOZQQ141bgFcWR9/dfi/GiLH9z4qvO0IpHqL7cQISq+wSL/97lHHO+yIq1uUn5nfTQfLYueLuu84FssiLPLmZtMoIQQ0FMdkmF2ADUH97KdxrRmRla7H65yn9v+Dp35L3SpTe+IV+vsxOn+LkRzVZBO8y2AWFU5cDTKF3vXJi0QXrta4u8zdQ//DX/TSSEiXenVayAQK90pVUJHg8jq5qYhUU5RB8PLkjEHYclzqM09YIUoiQo3mf8XdMn2ZKjVChmQsNKUkLekahVDphD202I5jRpYbx/i5PSI3MUMjd4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I441p5U3eB74h6+wQnpMU53ywGVpRCKPsXzsXpu0/FE=;
 b=zPxu3z8HvJaDNT+1Vt08YIAQVHnSz2snhE1vqMVDCeb8RwEwrZtybw1kEvtsuYs9P86dihvFItFvUFbgtzrBYgxG4OOcwbL4r5EvKsPDQWZvUiOaMaR2otgftCaDyRiId9dRBZH+e0sXb8SVQeR7aGZHtD3MmRV40eFkXhewgpd+ShoTI4Vj7JGxzxc3FlUMgg3DJ8Pd2EJAJMOr9YYS8R0BqfjmdZEFMxTBSChX94AHKaPltNjOTTkXdKi1enJ+SHjrmDxRyydAK8TXTcDkXSW5O3a3mgo4mw3f+gSAnOBi3en6GLfSjT+q0FsK9yCsr9BQc7OqOJ8DM3mumP1N/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I441p5U3eB74h6+wQnpMU53ywGVpRCKPsXzsXpu0/FE=;
 b=PorRVHtfMdNu6no4tWtUzEpN4hnyZJHSXbtW5Hi5fbyc8/Uls15Zm4GJQ4axJWSXXzgijrHQIqhnlqu03mqJAZgS1UUZoYr/GMfp92qejZ5cZymvPA90o6PWXeNbKcgesSyLNzYuXXEGZNWrBcToT8AQaH3pktQMeiGETAiyH0Q=
Received: from BY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:180::15)
 by BN5PR19MB8991.namprd19.prod.outlook.com (2603:10b6:408:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 16 Apr
 2025 08:58:08 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::ae) by BY5PR13CA0002.outlook.office365.com
 (2603:10b6:a03:180::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Wed,
 16 Apr 2025 08:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 08:58:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 191F6406544;
	Wed, 16 Apr 2025 08:58:04 +0000 (UTC)
Received: from [198.90.208.23] (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 01FD3820244;
	Wed, 16 Apr 2025 08:58:04 +0000 (UTC)
Message-ID: <b36eff33-9eac-485f-8b3f-105425a65bfd@opensource.cirrus.com>
Date: Wed, 16 Apr 2025 09:58:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: cs48l32: Fix spelling mistake "exceeeds" ->
 "exceeds"
To: Colin Ian King <colin.i.king@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250416081204.36851-1-colin.i.king@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250416081204.36851-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|BN5PR19MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a38d399-1c4b-44ed-652c-08dd7cc4cd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXQ4RituR29KZmJuVlpBLzFVeWozNUVoaG1ud0NNellqd0d6dGpYZ1Qycmwx?=
 =?utf-8?B?MlB4d0xwSms5K28yV3gySWdjOEM3UFB2azFaSFV2U1prNWxuQkJ5NW15aldZ?=
 =?utf-8?B?TVRIeGNndmFzVFM1ZHhrRFRaZHBXa3JjYmhmbTl6emJYRGdNRmNRVS9ySThr?=
 =?utf-8?B?OG1xektNaFlrcjlOQjVnUktGNkhyQXRsWTUvUnhkbCtyeEVvV2JGdnRkMHVa?=
 =?utf-8?B?MmZjenZxbUNQSzZmaGR4NHN5VStrK3VJUzNFVTZwNkUwbDFCV0ttVE8wVWRL?=
 =?utf-8?B?Q3dVNkJLem05WVg1K3VyclJPb3lwN0xISTZhSnIvK01ZTDROdlNxTjJrbk0r?=
 =?utf-8?B?VHZrNVBnYUhGMkNqS1M0L3BNa1JsK05UclliMzBObFNETmV3QXdIQUtybGpw?=
 =?utf-8?B?QWV4YlVmY3R1TnNuS2gyaE04NXZISGdmM0hkSUxkMmtFNGlaUGo1dTBWa3lC?=
 =?utf-8?B?WUtrQkEwMFBMK1JGeFZLTUtnUXNJRzlDcE42UmtHSFJUMElCNXFJUWw2MU96?=
 =?utf-8?B?c0JNbFpFcEVqTks0S2oxOFNhdUE5M1lkUm5aU253SEdtd2JGYnN0c2JKNGNQ?=
 =?utf-8?B?Qk5WV2FDOHlwV0lJZzJXKzdFSldmQVM1WU1mWTQvSGovTkR1THlmSzVMSjlO?=
 =?utf-8?B?K2ZKWW9KQWRwbXovbHY5KzlsTVFXS0ZhWDRWUDQ4ZHA5SXUwQ25FamlZZGpN?=
 =?utf-8?B?eTVMR3d4YVF1QmdaWTdCS0Z5bzhKVjdUdml6SkRKOHQzTmhPVytUQ0RGWGNq?=
 =?utf-8?B?V2w5SngzRUVsZ2tPV1ZLT2licTRmNGUzY1BkeFVGMzIvRmdxK09KajhEMXI2?=
 =?utf-8?B?QUx0OElPZlBoNnJ3QlhoK2VGSW8reEtGUkZjM2gzWjY3MUd0Vm9na1BuZE0v?=
 =?utf-8?B?bWdhelBEaDhwRWhWa3VRVUhSUEhwaWJITEk2V0NaRExKdFZsWlhNckc2elNk?=
 =?utf-8?B?YnVjWWZnSVNkd3ZFeWhaMmp3cVlZTW9TdXRlczNnMWNCVkFhbEdsdnNGVDlx?=
 =?utf-8?B?Q2NmL0MzOEljdndZMG5NbnVZdWl1cnVuVmlkZThTT2hjTUV3eC9pSVZtYkR3?=
 =?utf-8?B?aU1zdi9WcS9PZHFtOHVUeUl0ZGtCSmlMNlJJQitJeE9DQ3R4YW9hTTdzWkdz?=
 =?utf-8?B?eDdZU0F4NkltbFNTSmoxZTE3VkZIdUw5UmtYZDUzUW9nSTV2Y2VyYUg2VEdF?=
 =?utf-8?B?RVVQZCtlNm9iRkN0bksrclBkbGk3SGRrYW4xcGNYYkFRVDZpTDB4N1JER3A4?=
 =?utf-8?B?RW1Ib3lSbkJBcmlKWC9kK21PM3lqNXZlLysrdnFhRmJ5QjZDUVZnRmh2RXc4?=
 =?utf-8?B?SkF5WXJRRk54YmMvNEVUWHZxWG5DVjh2TnN4dGxETlUyWXY0bjJtcEtTZHZV?=
 =?utf-8?B?YlVoR1N1WW4vaTh2Wjg0OUhCUXB1MUtkSFVEZVl3TTE5a01xS2RFYXhtbmc1?=
 =?utf-8?B?M3grbnRUVFBIQlFiNGwzcG1aUlpEYzExdjhBaGpuWlVlTlZmc0VIZXo1SFBX?=
 =?utf-8?B?S0IvcmxxeG1UT3hZczdPRHlJd0pkbm5kMHMzeHJNTmlGWk5rR2c5OXJMQzE3?=
 =?utf-8?B?Ujlta0dJbEZMNlhKS3NDU21Kay9YamJUYno4cXZ2RUdrQTRSeXRndDZVcTd1?=
 =?utf-8?B?NVhzRlc1YSt4T0pVVUZtNmRJVTE1R2c4UWFmWDFCZ3VLYUF1UVBxOHNpMzFC?=
 =?utf-8?B?SGlMRHNMeElpekVZaCs3QlQ1NWRVTXBCTWMydGgzQUpHRGVYMGJ4aUI0OS9K?=
 =?utf-8?B?OWxOckdzYi9XdThYRjBOcTdsNm5QT0p0eldkMjFIcWlsVjJDR1VsRC9YK3Ay?=
 =?utf-8?B?RnVNYVcvaXJ1R0JtTGRacjZINlhFemtmcG4rWVl3WUZUeVUvZ2VzQ29YdlRG?=
 =?utf-8?B?WHBOTnRvalAyOVVwUC9QVGVha0l6aGlXM3Z4WjVFMkdUeG40NmRGbUdNZVBM?=
 =?utf-8?B?OHl6OS9LcGNiaTgzbTU3S0lFQ1R3Wm1IbVhIUEZ3RnFjRXc2NUM4b3AvVWZt?=
 =?utf-8?B?Ykp2ZUF3TnVaTWNGUnoydmxyRTZXTWNLcXgvYXpScU5hTzJXbi83OSsrdXFX?=
 =?utf-8?Q?2Cz8Sr?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:58:05.7857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a38d399-1c4b-44ed-652c-08dd7cc4cd99
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8991
X-Proofpoint-GUID: osxhjFHpSiKg815rj9QBtuEwo0ilvfOk
X-Proofpoint-ORIG-GUID: osxhjFHpSiKg815rj9QBtuEwo0ilvfOk
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67ff7126 cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2VonJlKf7bECpTrnxgUA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 16/04/2025 9:12 am, Colin Ian King wrote:
> There is a spelling mistake in a cs48l32_fll_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   sound/soc/codecs/cs48l32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
> index 4e2bc09773cb..8fd0df671730 100644
> --- a/sound/soc/codecs/cs48l32.c
> +++ b/sound/soc/codecs/cs48l32.c
> @@ -1802,7 +1802,7 @@ static int cs48l32_fllhj_validate(struct cs48l32_fll *fll,
>   	}
>   
>   	if (fout > CS48L32_FLL_MAX_FOUT) {
> -		cs48l32_fll_err(fll, "Fout=%dMHz exceeeds maximum %dMHz\n",
> +		cs48l32_fll_err(fll, "Fout=%dMHz exceeds maximum %dMHz\n",
>   				fout, CS48L32_FLL_MAX_FOUT);
>   		return -EINVAL;
>   	}
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
