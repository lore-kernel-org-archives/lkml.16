Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA63C20C00D;
	Fri, 25 Apr 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745586414; cv=fail; b=UY75D+nHcDcaWZKkTYEpP5vODlGUcEPHHWUVs3jUQctVecnD5DHTJvk14zL3PVgN+b5GuSXJUsWk/te919qBmFRB6ZRJClq1RYnR25N3shpaHYwUmrDUNikkfbqqLb0jLAk8pCFOOxPlrY6aDYv00gVzcs3DQ6TOXrWWNqxDyfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745586414; c=relaxed/simple;
	bh=/UpAN0X0uEEReD4rOd6VqRscEdtqTPoaiEiMyu7uIbM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ROFaE3a3FDdxJo7VLLteSF32zIbKf48Cm/XoA0Pp9rtrGXjB/WjAZIqnZblgzaw0Y0Uozsb/ztAV+FgYTJy33XZuxMtth9Td6FCn+Y8ZIBWivbA8Sv2+maso8TAUo+n+EdkGw45OqE33NaRXcEq/VFhmr6JwfYDYFvH2bFo8LDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mEZmUA+/; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mEZmUA+/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEhR2mByl0sGLF+wpAyDOqp21aXa85P+4BTYmLfbGDcE/9pcf+Z4IhqMKS1Kwb/s2OIF4Srpaq3d/edwB/yrOj7zSKmAXEQNhMhH9VrLkNqxN2QSbQIRoUsjYRHGmB0fn/ut8XbfCKjTaCwMbEvXHv0Qh8UDOuXw2WcuV8toKptn9Hx0I5pNt9zpaYESjc3FXGzNkJjm3PtQziF07V6dEWHeYf6u8kHP7LI0dYSYkA5jp1te49m4xwZHaI1tZ3g0+huNqXk3x1MFn4W5tOvThLdWnEK+Gqt9eoVMghYMLYSxXysFaPqFNBvHBk/9/A8AG0cCQ5GarPCpST0o78Zy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSktWBXpgSVyeEYHWn0gjvNXost+qW39QONOx5ga4N8=;
 b=OYhaH5xlj3dKlurVW2UjnFc4du/dSh4UtR20i0fwlOSlMPFSD8z7BrKEpeyKIkyIHRSgCwHe8EH2zWDw2l5gHveotAfmT0k5uinGKdIIw7g6CJmktF2AgwAyrj8U3CUQ1sgl5izOEexWDWl5bG8lNuDOaCEVptA2HRF0ar2tNrh8GRyAhgSherJpOPdwHu9Jz5FY50PaKR0fEvWhhaG8NuKSu/YP1iF1ve1iRUn0dQsy7qwEn6hxshGAt6EX64hz1NjnpiSNn5xLvhdeawWDdSRjLLlyAgmLl+JheKPH27CHpZsd/iSm/H5jFmGqBCQ3C9ZooeEoK6bG2AiHHgr2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSktWBXpgSVyeEYHWn0gjvNXost+qW39QONOx5ga4N8=;
 b=mEZmUA+/lKqXjltmI8eu27igdh8Bn1Ij6q9d4eWMV0cEn8yDTJ933PM68MWnFlNaF428WemulK7eDqcwZS47/TnsLZ+kWCBcmy8238BfwzW5/3nAG2zrStqPG2Y82XPJIx/MsjwVabYh4wb+nb5VKW2ENixf31MGSZajJRQceGyViLRX2hd2p4k+wYkSLU9nN0xlvblL549aAN8wvXwi10rzVw3LbAUF417NXZUI4735DyiIpKR9ngNt8Ew5/lqYQ7kQ9GikgVioRHePqBE50GLYCa6BjMnRyRe7hKZcwlCGz2lYqwox0X3PdZR1sgZJk8UtpUIsNMsalu58invDcw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0620.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:06:48 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:06:48 +0000
Message-ID:
 <MA0P287MB226276F718923FBB7E097181FE842@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 25 Apr 2025 21:06:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sophgo: Fixes Coccinelle/coccicheck warnings
 reported by do_div.cocci.
To: sboyd@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>, xiaopeitux@foxmail.com,
 mturquette@baylibre.com, inochiama@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <ecc1f40a-7c6d-4d3c-80c9-7379ce068bb8@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0620:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccf39ef-d875-4b5f-dac3-08dd83fa088d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8022599003|15080799006|7092599003|461199028|8060799006|19110799003|5072599009|440099028|3412199025|12091999003|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzJSTzdCc00yRVQrSHczbXROTDFNa21mZ1FhM2g3RndXejZDQzdsT0hvdmFn?=
 =?utf-8?B?d2NmcmxmRXZ1YjUyNVVQOEVMMHEvS0I2TXVtbE1rRXJ2UjFWWFoybjNtNnBs?=
 =?utf-8?B?RVovTU5YQnljSEVIUTJPSHZobGxkS0JQaTNhNjRzaHc5ZWtGeGVxZ2JZNEI1?=
 =?utf-8?B?cTFKYTN2QmEvWW4yMmJXQjJra3hGdVFnbWQ2Zm5IKzBmVVNMaXlGM0NFSVp1?=
 =?utf-8?B?cXY1WnhxM1NVKzRBcEZXNGxZblVMV3didGYvSmFsa1VGQU4vU2p0dmZaeUlm?=
 =?utf-8?B?WXlIRTJCMkVCcWwyVGE1YVYvWGhRWTVIMlIrdjRiZWNPeThsTENzVnErTFVZ?=
 =?utf-8?B?bzZwYTBZQ0JlL1RRRVBBMTNsTzZGbW50UUFZaGMvVU44WGdEL0xEdE50OVJ1?=
 =?utf-8?B?eEpRa0RhbVZ3c0dIZTVDU3N2Yk83anR5WG56RUo3aS82TUpQQXNRejNWWTFS?=
 =?utf-8?B?dUJZMVJJZjhwa2s2Y1ZqWHRZdTQvcW9MbTRkT2NGSlZRZ3h6WHZtdGw0cHNN?=
 =?utf-8?B?anZudnVUY2o3UERzVE5CV0ptazh4REl1aEdWOVkybnkwTmxMK1k1d2NMekpt?=
 =?utf-8?B?dSt2bXNBRXlNN2h5Y3JwcUtUaG1ZMnFESlBHSDZrazdGVnVBdkN5THJZV0k1?=
 =?utf-8?B?TGJVMzNNN0Jaa0JPb0REV1NNNUEvTUZnSnRoSmptZHA2b1U2Nm9mei91NWd0?=
 =?utf-8?B?c3pqcGxxMFFpRld6ejI5RWVBTi9XMW5hcjlHME9tKzVER0xxYjRnZlZqbFZH?=
 =?utf-8?B?ejVMc0JuV3ZnK2RYa09kTGVQR1AyWDU0T0kwMkoyN1IyUEZYSFpINlBmM3Bk?=
 =?utf-8?B?RlJXcDBPQVI5all6WFA5UUxkUXFIcW5WNkNUeE85Y3p4b3RSNWxBRTIxajN5?=
 =?utf-8?B?TytnbnlIZ0hKajFoYXVXSGl2ODhrNzBBUUphMmJ0and2UXBERlEzcmExUU5L?=
 =?utf-8?B?Qmd6ZW8rU0VzZTZiK3lEVExibTRhbWRzUDdkaVY2V3hIL0ZIOXJYYW5uc3p4?=
 =?utf-8?B?T25hYkVEc0xaTnZGMGZ5T1ZNaDFtdVJ4MWRkNldsK3R4TDluQUlTekFqR2xW?=
 =?utf-8?B?K0ZvUklBQUpEMkEzLytQMldLK2Nia0lFWjV2WitOTU9PeHRJM1ErYnNON2dp?=
 =?utf-8?B?VDA3NExWLzg3dHFZQ2hMU2FZL0gxOW5FMWFNVWltRjBvT2pvcnBUUWczeDQ5?=
 =?utf-8?B?RUZRbXhOV3JjTW1wVldmMzRqRGhhT29VSmxhQWVlNmtWMU1oVS9zQkY1eHJx?=
 =?utf-8?B?RTViZWM4WmFabEtUOXdwTEkrdE41M1AvZy9WUnVlSW1uYzhhZlI4Qmo0TkN6?=
 =?utf-8?B?SmgxWGdqdnFBdnlHMXhwTEZNQTQydHVSV2ZObityK0NrblowcFdyWk82akJs?=
 =?utf-8?B?MlJXcmpEczZwTnE3MnVZWDltd204UElHcTFQKzRIZ0J1MlNjU2UvMVhyYlRr?=
 =?utf-8?B?ZjRaMXZJMTJkRmJZcm9DdDV4bm9zMzNSZFE0OEd6WXhPanBWdVFpMmVjYWxi?=
 =?utf-8?B?RHRIeXZpUDNoOFZZRWFrMkQ3dEtTZVNOeWxQQkE1LzRtSDRlQ04vWElrWUd5?=
 =?utf-8?B?RVJ2ajQxYVI1SmxaN1paaW0yMjZ5QTVYeTFpc29LN0gxVE9Eb2RacXFRdmdj?=
 =?utf-8?Q?S2Lp6uRRnTp0gzGD9UnUhITeZXOu/iDd1tEQfgKivmJg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEx3dFdGL0FQd21UU1BrR1BOV25vRWtsRFQxYlROZlIzRG5WazUwRncyOHhY?=
 =?utf-8?B?YWVaZXIzaTY2b3huQXF1VFZ3RVcvSjdWeGM1anZ2NWlSemtjMkI3bjJMT0tJ?=
 =?utf-8?B?aWlWdlI3dGhrenpKUUFNZmJjbUZtdHdXczRURHIzY2toNXkwVzdCWDdhZEZO?=
 =?utf-8?B?b0VkRGxEN2Q2dnBvLzVhbEU2cXo2OVFvUUMza25TdE9hcDNRYzlHQ3ROSWRu?=
 =?utf-8?B?ZG5qK1N4cW03aGdaQTBJK0d4TVpHZ25uc1B6YWFPYmNwcWh0TnlNbDV2LzRw?=
 =?utf-8?B?SHZTN2ZSaHpQMWNhL3g4Um96WHJCZEZUdklNWnQ0Q1ZKM1d2MTJ4YlJ3eGtD?=
 =?utf-8?B?a3I3Z1lsRk5EbzRjN3lhTHJIc0oyZ0tLYTQ2c0ZZYVkxTGRoaVFIczZ5M0xK?=
 =?utf-8?B?ZGc0YjhXWUlURDBRMVdJY2crTkhDeVRNdVZaL09zd1g5b1o4SmFheVNWbFdr?=
 =?utf-8?B?dWdHeDZnU1VMZDVWL3ptZXY1WkNUMzVpMjFlUWJDbXJVNy9mcUttOXFBNFBQ?=
 =?utf-8?B?NXlnbHNoRWhaMEY2WG05TXg0ckYvc0N5eGFnRW1uVTIxbnJUbzk0NWl6aVF0?=
 =?utf-8?B?Vjh1WnpQN0luMDZqWlpXY21xQ3AyMkZ4dHJMOEdWVTJ0MzFoSlEwNnFWRWlG?=
 =?utf-8?B?NUF3SUg1MXBXbTFBWkRBOHd2Q25ReG4wR0drZlkxY203UURiNElwMENRaHhF?=
 =?utf-8?B?a1o3S3FxenFDZU93ZjJjNThzMlBzbmt4OWFNbEU0SUVYQXRDZ3dWTWVHVTJL?=
 =?utf-8?B?emV0Vzc2WWR1b2VkNGFQc2hFMjNUeGhjQXBDbjgwOFlyeFNrbFl3ZnZsb2Yw?=
 =?utf-8?B?TDNjaSttSlI4V3lmZWllTkhQZWdxcVhISXNoTit2RVRBV1YyZ2N4S2dHZ3Bv?=
 =?utf-8?B?N00vck9la1NqWndEazVYZGVCQXR2ditDRURsb3lUdXVEQTJWdlFRL1RjaUZ5?=
 =?utf-8?B?VDFzYXQvM3NNUFNnT05zMGtiZllmMXlCbC9ZSCs0OEVLeGxmYzRHbm81L3cw?=
 =?utf-8?B?b1VhM3dMdlpxRHFsNEo2VWE2NzZ6YVk0RURPbCs5eW5kYnhOUEZITG9laWMz?=
 =?utf-8?B?dEpEdXNqQU45alRMQ3pVWElnMjg3OHBmdm1sb1o0eHhHRm1ZbnpvYVhrSm5W?=
 =?utf-8?B?cEI1c25nYVhRU0hwenB3eXhzWnVVNDU5SktmT3c0K1h6YlZ3elpBbmhFVWN0?=
 =?utf-8?B?MFZFT21naWZDTlpkK0UwY0NvbU5LUnNGTm1kYy9lSWRCOHJHbXhaNEMwc0Zx?=
 =?utf-8?B?ZE04anlCbkQ1bFJTNFUyaEpNQ095VzdQekFQOWNwTTFZc05Gd1hGcHBmL0lU?=
 =?utf-8?B?ZTlTa0NzRDluNnpkKzk4QnNoY0dVaTcvVjFGNW8zaHl3N1dIenJKaGtnSzR0?=
 =?utf-8?B?VzJjOGhUSDBqem04dkZGSE54eXQzMzl2NGc4US9BWmE2WDlrVVhuL2hXTFpp?=
 =?utf-8?B?bTZ0QkJVaG5zc0NlbWxocHQwbFlVcWgzRjBJdkxjNll5TDBoMGdoeFIyZVVX?=
 =?utf-8?B?YzNZdk9XdEoybFl3MEVKRHJmMWk2T1FieCtnZUFyRHYyUU1ySFlLWS9UcDNm?=
 =?utf-8?B?SCtLSlY1MEZ3MHpkNTFva25pdEdnMVpyZC95N0F1cXEzRk1Ea0luUG1UTi9F?=
 =?utf-8?B?ckVIY1VqdStKeFNXbC8rS2pTYmRaaUpENW16WlpqK2lhMGJ2S2dkdXA2dm0w?=
 =?utf-8?B?Qi83Vk9XSUg3N0NtNmdHbG9JdFNiRC91K2VFL3NFSW5aa3RiTXNaUURsTFYw?=
 =?utf-8?Q?VqE8lW/FlNEZIp0psY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccf39ef-d875-4b5f-dac3-08dd83fa088d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:06:48.1392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0620

hi, Stephen,

Could you please pick this fix?

Thanks,

Chen

On 2025/4/7 11:21, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
>
> cocci warnings:
>      drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING:
>      do_div() does a 64-by-32 division, please consider using div64_ul
>      instead.
>
>      drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING:
>      do_div() does a 64-by-32 division, please consider using div64_u64
>      instead.
>
> replace do_div() with div64_*() which doesn't implicitly cast the divisor.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index 1537f4f05860..e5fb0bb7ac4f 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -155,7 +155,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>   
>   	numerator = (u64)parent_rate * ctrl_table.fbdiv;
>   	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> -	do_div(numerator, denominator);
> +	numerator =  div64_u64(numerator, denominator);
>   	return numerator;
>   }
>   
> @@ -212,7 +212,7 @@ static int sg2042_pll_get_postdiv_1_2(unsigned long rate,
>   	tmp0 *= fbdiv;
>   
>   	/* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
> -	do_div(tmp0, rate);
> +	tmp0 = div64_ul(tmp0, rate);
>   
>   	/* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
>   	if (tmp0 <= 7) {
