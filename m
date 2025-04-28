Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1027CCD3;
	Mon, 28 Apr 2025 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861940; cv=fail; b=OBxb8pfgVjWv+s5aUK2DkVoDFWJ9k3gk5GatEKNpjd3FtmxDVyYkxnidKwS5rw6sQCqefWmLWrlr6tTzA5OKTEw1Kb/4JQ9u/VJjvalN5W2fyE59JDV7jwfLVC5nHz6V9AiNn3vujIs4YJ/OpTkwCcNTTqRiWhcV40SnyweG36w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861940; c=relaxed/simple;
	bh=COXOJ3xceGRDTliTgdl1akHwKm5IrwrxEERfiaG3l9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw0xvlZic/Jjkm1kTKWqeLe1ydajm/YFmYMksF0aqk2fglgzBr4VFtYZ9a/6kn3h/cg7XxzzR3GwY0WTou4BIZurqSH6WtHxDey0wWrY7xZGhWs2UwPp7JkjjD5DVXWm5rGfVNcAH9RbQaPV+4KbbhPZKjqdIrW0vBTr/qtMrrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p0PZm5A6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hsZEi3Gd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p0PZm5A6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hsZEi3Gd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81SYt013255;
	Mon, 28 Apr 2025 12:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=clzNn3YuII1L3ICe0tS3iDVykcNPHIrRn/UqA6iEmjE=; b=
	p0PZm5A6EkzzcqxxCeakRTEL7h5yQB7lpdzg5gu7pquVd/cSEFuZW3ITBjxdlMRE
	rool4axKBKl9Nz7cWHs0VmJHI20c4U3mizz6XYq30Y+jHC20ZvZl2GptrWlRwN5V
	3AIVUJs0ILXgJPOS5lzQT0Ghu5sCtVbErqjMKvtbs26dO6Qo8IPeKYc9UFu72dCI
	o7lRc1XzgvSWuBztZ4VyenVBe90mNUmRksxKqthgIqrHkTuoHRQEysVtOB01Ihqv
	rBbj/Qc8b9rFwKRPHXzi6UiCiK/kH5IFTfAzJAevtnK55SYrQ1Wr83uyQNsxobfA
	PKsfWlokyhWt0Lal3sg3zg==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1ajck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:38:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiCJqrFCM2t9hc76hg+OOWAl+jcLc2LxATHEvsSlkmPXA2N4t2KEE9KeMUBxO1PbUMmIA0aRqb98LGDOtDdZUBHkOumu9jrOvycACfPLsYga7DRzkykgnT5iKYw7+Ui4vyCDILghX7gihBHj0iTkuzFTL50eTSjAWMSBZLHJ2638MgfeYhtsOjkMnVfozia6sVOwZAL990WzFM+/P8idVmozyV3muqxxfIjj9gILqWEzrNGZq2e/61SzeZfeLjA5WBjqQ4Kv0ymT84gtdV4VBrs+BKrZyYo1dibJ+pDN0h3jAKUv81GzJj/VNFDuNnJDy/TDo0r+esuZORphcmRuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clzNn3YuII1L3ICe0tS3iDVykcNPHIrRn/UqA6iEmjE=;
 b=Ujt8BmN4OdHQSqrz5MUu4lLgNDjr2p4KZKyLsO7UFVaFVe5uoD4LkmW12hlzaVIi+i9iOL/YylF9TH91yu+1Fn99B6W8gWXGO+ReS1PCH9KYMtTSR5eKIl2Gf+4XsR+EukbpaaEIkXh++Y+t/JjTEdG5POysUiyHh535vXqHQ2epIiLuoBy0M56h/M5Hf7oz/hgQde9Lc5fuT2tR4UN7G0nYrMcVqOLtqyzbjhYnyfqHc3w3jnNva7Ep2eFhbXMt5tSRhFkNE2Io6HN1eCSCtZOrSnw350c9mrqHvln1YxS7L1euhjSv/v0IjhFYTjC2njRBGCBJy7l/JilFqYW/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clzNn3YuII1L3ICe0tS3iDVykcNPHIrRn/UqA6iEmjE=;
 b=hsZEi3GdIN+Ypyj6IKVBW6FQ1Ie7pfdt8971OoNXrwf6QzplrR2EWcZxtkkbc15s82oEcYl11Jmhqv5TNoAWrhZRnpCV6Aoo9g0E13kU3NgIkGGFGo+9zbiKDZaSsce1a9EAy+CiiAnw8542cx/6u9m5s3QRmagQPsOebKWWBCQ=
Received: from DS7PR05CA0025.namprd05.prod.outlook.com (2603:10b6:5:3b9::30)
 by PH7PR19MB6532.namprd19.prod.outlook.com (2603:10b6:510:1f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 17:38:44 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::b3) by DS7PR05CA0025.outlook.office365.com
 (2603:10b6:5:3b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 28 Apr 2025 17:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 17:38:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5B9B8406543;
	Mon, 28 Apr 2025 17:38:41 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C6D6D820259;
	Mon, 28 Apr 2025 17:38:40 +0000 (UTC)
Message-ID: <74422acd-258c-415e-8dad-751437e114bf@opensource.cirrus.com>
Date: Mon, 28 Apr 2025 18:38:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: cs35l56: Add initial support for CS35L63 for
 I2C and SoundWire
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-5-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250407151842.143393-5-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|PH7PR19MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: d42c6838-3163-4b7e-bb21-08dd867b8538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHBWZnI4L0hCTWZkMUVoRGF2OThTZytVSTRuT0lmOW9udEF3ZUJPUnEwQklR?=
 =?utf-8?B?dnVHUUc4dnV1aGo4R1B4K3Nzc2syLzNweFN0Q2VlMUE2QlphVm85TzIvRnFl?=
 =?utf-8?B?Y2YyTmNuL045ZnBXRmhLTkZscDd6S28wbDF0bldYL243MFFmenlQeDNGcmJC?=
 =?utf-8?B?ZEhET2F5czc2YkdUL0dEZSt2ZE5BcXhYSWxMdU9YczhzWG5OQlo4RnFFOWVp?=
 =?utf-8?B?RmlBaWFoQUJSaTJJSWJGWEhyRnV5QWkzdmg4aFN4T0V4YlZTbUIyc0w3dUdu?=
 =?utf-8?B?YUNJT2hEenBqa2pHaEVOSTlBNm9HeXZVREViVWJxbFd5NVQ3M3owclk3RVQz?=
 =?utf-8?B?a2cxU1d3c2N0U1JzNTNpSTBuSEFSdUEwS1lYYW9VWTNhWktQY3pVVnMxbXV5?=
 =?utf-8?B?V0s1ekRSbXBuTmliWW44T2Fuay9vbituNmRmRDNKcjBLSkZ6YTJxWlZFcTlS?=
 =?utf-8?B?Y0FWQVVCRFpGblc0U3FLdE5MSDJZblN4TGpxTDE3YWFjc0RvWlIvMjNyOE1E?=
 =?utf-8?B?cVRLSTEyTFBYd1Q5d1pVZnBBSFpVbW9UQ1Z3eTlvdlBSb3RyaStab0lnL2Iv?=
 =?utf-8?B?dXFiTVVmSlNCWXVvTG1zeERKN3FnanVCbkpsOWk4L05VU25sYlByWDRWcnl4?=
 =?utf-8?B?UFRSYTF5cnJzbHRjZkJYRVk0Ny94UzFkMThjdTJiK0xVcjJid2JTVUZzVW9o?=
 =?utf-8?B?QnlCa1dwKy9idjhtTGpsYmZEL3JjR0RqUjRIM0FpMnFrOHBPU3VZNWJWUzBm?=
 =?utf-8?B?aVB1L3E4b09mSXIrckRQZVdOT2doSjlsWWo4cDEyNUJIb2duRkdya3FmV0Nk?=
 =?utf-8?B?MFloOXRibVNFY3VobE1mUEc3SWQ0dGYyU05ad2NTTjVtanpDWEsxaDdQK0J0?=
 =?utf-8?B?eDJQRGFRV01jaSs2YTNLNVltR2kwbEM5YTJHQW9GWUF0b2VnT0hqT082N2Fl?=
 =?utf-8?B?WGtpNFRWallpYjV2ZkhVRTdrZ2ZudXNIQXZjeW1qYkVqaVc3ZThEZ3l4MUxN?=
 =?utf-8?B?U21hN0dNVXFodUFEME9OM0p1VktCZzZsbE51U2RsY0tMemRqTXg0M0FHdjlY?=
 =?utf-8?B?d1plWDdvamxCekJjS2tTMlpBRENvcm1HZndnNVF3UkIyUHBYZEhBbkNYR2g3?=
 =?utf-8?B?NXRUNGhYOXVET0Jvc3NEWW5XV1AwTWcrbTVOdE8zY3Q1S216NFNaTXZmSDdB?=
 =?utf-8?B?V2xjWk5KMk1LZnNkd3FEWWVUWVdNT0QvUEJsMGdycEJJTFdDbEVmdHcxNStw?=
 =?utf-8?B?MGVTa3lBSlhzY2pxTEZrM1d2VlZiblJWOXBKQ0t6TDN4WU5HVDhXcVpmMVlW?=
 =?utf-8?B?cTZkWGNaeHZwSVBoVDNlTXpRWGhib3YxZkhwSHN5TEZ2Mi8xb05qL3p3WDl2?=
 =?utf-8?B?YXBIS0NHZWxzbUVoK0dsWnZhTmJUaGRKSGlBTkxzMzdRaEJDY1JxVnE4Nmpx?=
 =?utf-8?B?STM4TURYZHNXWkxZTnU2VndWNXE3QXVqNWdJMW0raVlObldxQ0tWa0E5OVBZ?=
 =?utf-8?B?ME1KZldzMCtocTU1emJNR2ZnczNvUjhuMmJZMFVQa3Jic3g3VUVrM1hsTEs3?=
 =?utf-8?B?RXEydVBWU1hhWXlaYzRzYkpOazlxQWkvQUxjNjZPUmtaOE5CZjUrbVRYMVZt?=
 =?utf-8?B?UmdUd2VrY1RnK3dJdWZuVlpOeTFBL24vcjVFR2pNYmJTNmtUNDc5eERDOFlt?=
 =?utf-8?B?TG5HeWx6NlR5ak9nWFBEYmtHN25UKzhKL05adVdLM3VaekZmVFF0NGxDYk1i?=
 =?utf-8?B?dnNIWFlqdlVPSzdRdE1lVWlwMGR5aTg4RjNycjZQVmZHaEFXbmlkVEk0QVJR?=
 =?utf-8?B?VjhxMnlxQWQ1OU5rM0IzUUdBRDRsdWJobkV3a2pTN3ZjdW1KUnUvRWRNRTNt?=
 =?utf-8?B?NlFvYnN0WjJyYW5NRFZXVUIxR0hlWFpsUlp5c0tHVjFNVUlqRGpwa2Y2bk5a?=
 =?utf-8?B?TDNBSjRRQTZKZExPOHllbnh0NjFZOWFjdFdQNnd6ekZWUTY0MDFhVXJoRFBm?=
 =?utf-8?B?cnNuK0loN2UzMkZZSnRKcW1GQ0F0cXNMUy9kMFR3SklabTRnd1F6TTVtTGJO?=
 =?utf-8?Q?qhl8gF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:38:42.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42c6838-3163-4b7e-bb21-08dd867b8538
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6532
X-Proofpoint-GUID: vFfGgzevbokIzQii97RuuMiEPnRxEBK3
X-Proofpoint-ORIG-GUID: vFfGgzevbokIzQii97RuuMiEPnRxEBK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX8QN0GAe8tBtk 4+e9gllWObLSWpXW16qAvI9V2U7dI1dZDkuCxAauorQf1D0xQDIsiwGkjuIyt0jPa2s7wiUqoJB Gz5h5KIz3CD0u7xSqe5CEsNcfzpX/kfHvQKAzpa/aw1mXlEvIzGE3p3uDCdgKUFTTH4wU309FI8
 nKb4I6p35r5mmI/2kgQnmrj8AiYR2/ra0SwIyG4450B14fJZox4KGM3/tZ8dnPZGMAFW8jj2bhJ zTXqJiNoitjeYNibC8L2EYQOOUCHX8Yj0Hp2bnOqlnEJ8tj5LCaT9gimsnDAo3ukS8nTgk2hUiV pBWVXTOUv7YdLzpJqKd99l6CIoo4Vrv8ifWnr3+jj1JyWO8sDZVcsxlyiquLrN4Z7vnp1o/6mAn
 po6a6a0VAbBE2l2B6yOcAQGtU6kj06odi4E0ddN9O3Vc2uaeITkiFdUegUaLJFiu1aJNvLOY
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=680fbd2d cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Z8BDXhKzdqwPZSzAG48A:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 7/4/25 16:16, Stefan Binding wrote:
> CS35L63 uses a similar control interface to CS35L56 so support for
> it can be added into the CS35L56 driver.
> New regmap configs have been added to support CS35L63.
> CS35L63 only has SoundWire and I2C control interfaces.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   include/sound/cs35l56.h           |  12 +++
>   sound/soc/codecs/cs35l56-i2c.c    |   6 ++
>   sound/soc/codecs/cs35l56-sdw.c    |  74 ++++++++++++++++++
>   sound/soc/codecs/cs35l56-shared.c | 123 +++++++++++++++++++++++++++++-
>   sound/soc/codecs/cs35l56.c        |  23 ++++++
>   sound/soc/codecs/cs35l56.h        |   1 +
>   6 files changed, 237 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
> index 3abe4fbd2085..e16e1a94c8a1 100644
> --- a/include/sound/cs35l56.h
> +++ b/include/sound/cs35l56.h
> @@ -104,6 +104,15 @@
>   #define CS35L56_DSP1_PMEM_0				0x3800000
>   #define CS35L56_DSP1_PMEM_5114				0x3804FE8
>   
> +#define CS35L63_DSP1_FW_VER				CS35L56_DSP1_FW_VER
> +#define CS35L63_DSP1_HALO_STATE				0x280396C
> +#define CS35L63_DSP1_PM_CUR_STATE			0x28042C8
> +#define CS35L63_PROTECTION_STATUS			0x340009C
> +#define CS35L63_TRANSDUCER_ACTUAL_PS			0x34000F4
> +#define CS35L63_MAIN_RENDER_USER_MUTE			0x3400020
> +#define CS35L63_MAIN_RENDER_USER_VOLUME			0x3400028
> +#define CS35L63_MAIN_POSTURE_NUMBER			0x3400068
> +
>   /* DEVID */
>   #define CS35L56_DEVID_MASK				0x00FFFFFF
>   
> @@ -322,8 +331,11 @@ static inline bool cs35l56_is_spi(struct cs35l56_base *cs35l56)
>   extern const struct regmap_config cs35l56_regmap_i2c;
>   extern const struct regmap_config cs35l56_regmap_spi;
>   extern const struct regmap_config cs35l56_regmap_sdw;
> +extern const struct regmap_config cs35l63_regmap_i2c;
> +extern const struct regmap_config cs35l63_regmap_sdw;
>   
>   extern const struct cs35l56_fw_reg cs35l56_fw_reg;
> +extern const struct cs35l56_fw_reg cs35l63_fw_reg;
>   
>   extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
>   
> diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
> index 38c391d11c78..073f1796ae29 100644
> --- a/sound/soc/codecs/cs35l56-i2c.c
> +++ b/sound/soc/codecs/cs35l56-i2c.c
> @@ -37,6 +37,10 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
>   		regmap_config = &cs35l56_regmap_i2c;
>   		cs35l56->base.fw_reg = &cs35l56_fw_reg;
>   		break;
> +	case 0x3563:
> +		regmap_config = &cs35l63_regmap_i2c;
> +		cs35l56->base.fw_reg = &cs35l63_fw_reg;
> +		break;
>   	default:
>   		return -ENODEV;
>   	}
> @@ -69,6 +73,7 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
>   
>   static const struct i2c_device_id cs35l56_id_i2c[] = {
>   	{ "cs35l56", 0x3556 },
> +	{ "cs35l63", 0x3563 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
> @@ -76,6 +81,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
>   	{ "CSC355C", 0x3556 },
> +	{ "CSC356C", 0x3563 },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
> diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
> index 2e0422b41385..13f602f51bf3 100644
> --- a/sound/soc/codecs/cs35l56-sdw.c
> +++ b/sound/soc/codecs/cs35l56-sdw.c
> @@ -393,6 +393,74 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
>   	return 0;
>   }
>   
> +static int cs35l63_sdw_kick_divider(struct cs35l56_private *cs35l56,
> +				    struct sdw_slave *peripheral)
> +{
> +	unsigned int curr_scale_reg, next_scale_reg;
> +	int curr_scale, next_scale, ret;
> +
> +	if (!cs35l56->base.init_done)
> +		return 0;
> +
> +	if (peripheral->bus->params.curr_bank) {
> +		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
> +		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
> +	} else {
> +		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
> +		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
> +	}
> +
> +	/*
> +	 * Current clock scale value must be different to new value.
> +	 * Modify current to guarantee this. If next still has the dummy
> +	 * value we wrote when it was current, the core code has not set
> +	 * a new scale so restore its original good value
> +	 */
> +	curr_scale = sdw_read_no_pm(peripheral, curr_scale_reg);
> +	if (curr_scale < 0) {
> +		dev_err(cs35l56->base.dev, "Failed to read current clock scale: %d\n", curr_scale);
> +		return curr_scale;
> +	}
> +
> +	next_scale = sdw_read_no_pm(peripheral, next_scale_reg);
> +	if (next_scale < 0) {
> +		dev_err(cs35l56->base.dev, "Failed to read next clock scale: %d\n", next_scale);
> +		return next_scale;
> +	}
> +
> +	if (next_scale == CS35L56_SDW_INVALID_BUS_SCALE) {
> +		next_scale = cs35l56->old_sdw_clock_scale;
> +		ret = sdw_write_no_pm(peripheral, next_scale_reg, next_scale);
> +		if (ret < 0) {
> +			dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	cs35l56->old_sdw_clock_scale = curr_scale;
> +	ret = sdw_write_no_pm(peripheral, curr_scale_reg, CS35L56_SDW_INVALID_BUS_SCALE);
> +	if (ret < 0) {
> +		dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(cs35l56->base.dev, "Next bus scale: %#x\n", next_scale);
> +
> +	return 0;
> +}
> +
> +static int cs35l56_sdw_bus_config(struct sdw_slave *peripheral,
> +				  struct sdw_bus_params *params)
> +{
> +	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
> +
> +	if ((cs35l56->base.type == 0x63) && (cs35l56->base.rev < 0xa1))
> +		return cs35l63_sdw_kick_divider(cs35l56, peripheral);
> +
> +	return 0;
> +}
> +
>   static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
>   					       enum sdw_clk_stop_mode mode,
>   					       enum sdw_clk_stop_type type)
> @@ -408,6 +476,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
>   	.read_prop = cs35l56_sdw_read_prop,
>   	.interrupt_callback = cs35l56_sdw_interrupt,
>   	.update_status = cs35l56_sdw_update_status,
> +	.bus_config = cs35l56_sdw_bus_config,
>   #ifdef DEBUG
>   	.clk_stop = cs35l56_sdw_clk_stop,
>   #endif
> @@ -528,6 +597,10 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
>   		regmap_config = &cs35l56_regmap_sdw;
>   		cs35l56->base.fw_reg = &cs35l56_fw_reg;
>   		break;
> +	case 0x3563:
> +		regmap_config = &cs35l63_regmap_sdw;
> +		cs35l56->base.fw_reg = &cs35l63_fw_reg;
> +		break;
>   	default:
>   		return -ENODEV;
>   	}
> @@ -575,6 +648,7 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
>   static const struct sdw_device_id cs35l56_sdw_id[] = {
>   	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
>   	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
>   	{},
>   };
>   MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index da982774bb4d..76ddb1cf6889 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -47,6 +47,13 @@ static const struct reg_sequence cs35l56_patch_fw[] = {
>   	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
>   };
>   
> +static const struct reg_sequence cs35l63_patch_fw[] = {
> +	/* These are not reset by a soft-reset, so patch to defaults. */
> +	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
> +	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
> +	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
> +};
> +
>   int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
>   {
>   	int ret;
> @@ -64,6 +71,10 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
>   		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
>   					    ARRAY_SIZE(cs35l56_patch_fw));
>   		break;
> +	case 0x63:
> +		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
> +					    ARRAY_SIZE(cs35l63_patch_fw));
> +		break;
>   	default:
>   		break;
>   	}
> @@ -102,6 +113,36 @@ static const struct reg_default cs35l56_reg_defaults[] = {
>   	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
>   };
>   
> +static const struct reg_default cs35l63_reg_defaults[] = {
> +	/* no defaults for OTP_MEM - first read populates cache */
> +
> +	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
> +	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
> +	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
> +	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
> +	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
> +	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
> +	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
> +	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
> +	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
> +	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
> +	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
> +	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
> +	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
> +	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
> +	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
> +	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
> +	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
> +	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
> +	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
> +	{ CS35L56_IRQ1_MASK_8,			0x8c000fff },
> +	{ CS35L56_IRQ1_MASK_18,			0x0760f000 },
> +	{ CS35L56_IRQ1_MASK_20,			0x15c00000 },
> +	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
> +	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
> +	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
> +};
> +
>   static bool cs35l56_is_dsp_memory(unsigned int reg)
>   {
>   	switch (reg) {
> @@ -199,7 +240,7 @@ static bool cs35l56_precious_reg(struct device *dev, unsigned int reg)
>   	}
>   }
>   
> -static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
> +static bool cs35l56_common_volatile_reg(unsigned int reg)
>   {
>   	switch (reg) {
>   	case CS35L56_DEVID:
> @@ -237,12 +278,32 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
>   	case CS35L56_DSP1_SCRATCH3:
>   	case CS35L56_DSP1_SCRATCH4:
>   		return true;
> +	default:
> +		return cs35l56_is_dsp_memory(reg);
> +	}
> +}
> +
> +static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
>   	case CS35L56_MAIN_RENDER_USER_MUTE:
>   	case CS35L56_MAIN_RENDER_USER_VOLUME:
>   	case CS35L56_MAIN_POSTURE_NUMBER:
>   		return false;
>   	default:
> -		return cs35l56_is_dsp_memory(reg);
> +		return cs35l56_common_volatile_reg(reg);
> +	}
> +}
> +
> +static bool cs35l63_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CS35L63_MAIN_RENDER_USER_MUTE:
> +	case CS35L63_MAIN_RENDER_USER_VOLUME:
> +	case CS35L63_MAIN_POSTURE_NUMBER:
> +		return false;
> +	default:
> +		return cs35l56_common_volatile_reg(reg);
>   	}
>   }
>   
> @@ -405,6 +466,11 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
>   	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
>   };
>   
> +static const struct reg_sequence cs35l63_system_reset_seq[] = {
> +	REG_SEQ0(CS35L63_DSP1_HALO_STATE, 0),
> +	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
> +};
> +
>   void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
>   {
>   	/*
> @@ -426,6 +492,11 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
>   						cs35l56_system_reset_seq,
>   						ARRAY_SIZE(cs35l56_system_reset_seq));
>   		break;
> +	case 0x63:
> +		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
> +						cs35l63_system_reset_seq,
> +						ARRAY_SIZE(cs35l63_system_reset_seq));
> +		break;
>   	default:
>   		break;
>   	}
> @@ -844,6 +915,9 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
>   	case 0x35A56:
>   	case 0x35A57:
>   		break;
> +	case 0x35A630:
> +		devid = devid >> 4;
> +		break;
>   	default:
>   		dev_err(cs35l56_base->dev, "Unknown device %x\n", devid);
>   		return ret;
> @@ -1080,6 +1154,39 @@ const struct regmap_config cs35l56_regmap_sdw = {
>   };
>   EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
>   
> +const struct regmap_config cs35l63_regmap_i2c = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.reg_base = 0x8000,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = CS35L56_DSP1_PMEM_5114,
> +	.reg_defaults = cs35l63_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
> +	.volatile_reg = cs35l63_volatile_reg,
> +	.readable_reg = cs35l56_readable_reg,
> +	.precious_reg = cs35l56_precious_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_i2c, "SND_SOC_CS35L56_SHARED");
> +
> +const struct regmap_config cs35l63_regmap_sdw = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.max_register = CS35L56_DSP1_PMEM_5114,
> +	.reg_defaults = cs35l63_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
> +	.volatile_reg = cs35l63_volatile_reg,
> +	.readable_reg = cs35l56_readable_reg,
> +	.precious_reg = cs35l56_precious_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_sdw, "SND_SOC_CS35L56_SHARED");
> +
>   const struct cs35l56_fw_reg cs35l56_fw_reg = {
>   	.fw_ver = CS35L56_DSP1_FW_VER,
>   	.halo_state = CS35L56_DSP1_HALO_STATE,
> @@ -1092,6 +1199,18 @@ const struct cs35l56_fw_reg cs35l56_fw_reg = {
>   };
>   EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
>   
> +const struct cs35l56_fw_reg cs35l63_fw_reg = {
> +	.fw_ver = CS35L63_DSP1_FW_VER,
> +	.halo_state = CS35L63_DSP1_HALO_STATE,
> +	.pm_cur_stat = CS35L63_DSP1_PM_CUR_STATE,
> +	.prot_sts = CS35L63_PROTECTION_STATUS,
> +	.transducer_actual_ps = CS35L63_TRANSDUCER_ACTUAL_PS,
> +	.user_mute = CS35L63_MAIN_RENDER_USER_MUTE,
> +	.user_volume = CS35L63_MAIN_RENDER_USER_VOLUME,
> +	.posture_number = CS35L63_MAIN_POSTURE_NUMBER,
> +};
> +EXPORT_SYMBOL_NS_GPL(cs35l63_fw_reg, "SND_SOC_CS35L56_SHARED");
> +
>   MODULE_DESCRIPTION("ASoC CS35L56 Shared");
>   MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>   MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index a4a1d09097fc..cdb283ed938c 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -84,6 +84,25 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
>   		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
>   };
>   
> +static const struct snd_kcontrol_new cs35l63_controls[] = {
> +	SOC_SINGLE_EXT("Speaker Switch",
> +		       CS35L63_MAIN_RENDER_USER_MUTE, 0, 1, 1,
> +		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
> +	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
> +			     CS35L63_MAIN_RENDER_USER_VOLUME,
> +			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
> +			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
> +			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
> +			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
> +			     0,
> +			     cs35l56_dspwait_get_volsw,
> +			     cs35l56_dspwait_put_volsw,
> +			     vol_tlv),
> +	SOC_SINGLE_EXT("Posture Number", CS35L63_MAIN_POSTURE_NUMBER,
> +		       0, 255, 0,
> +		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
> +};
> +
>   static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
>   				  CS35L56_ASP1TX1_INPUT,
>   				  0, CS35L56_ASP_TXn_SRC_MASK,
> @@ -886,6 +905,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
>   		ret = snd_soc_add_component_controls(component, cs35l56_controls,
>   						     ARRAY_SIZE(cs35l56_controls));
>   		break;
> +	case 0x63:
> +		ret = snd_soc_add_component_controls(component, cs35l63_controls,
> +						     ARRAY_SIZE(cs35l63_controls));
> +		break;
>   	default:
>   		ret = -ENODEV;
>   		break;
> diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
> index 8a987ec01507..200f695efca3 100644
> --- a/sound/soc/codecs/cs35l56.h
> +++ b/sound/soc/codecs/cs35l56.h
> @@ -51,6 +51,7 @@ struct cs35l56_private {
>   	u8 asp_slot_count;
>   	bool tdm_mode;
>   	bool sysclk_set;
> +	u8 old_sdw_clock_scale;
>   };
>   
>   extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
