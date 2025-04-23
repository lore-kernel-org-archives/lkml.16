Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80F202978;
	Wed, 23 Apr 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406623; cv=fail; b=MpvlRwlSvwNKWJ1g4H0IuPz/mrDpyhEslt+KTavCvalGN6YuA6bBP4DvemXhAzPQ7xIgW2ZPG+ZxOcrDAke/Vubp2Q1+RPXulzoZcBMGX9APGkqWXVfrgna71DpeRe/bpddoYphosKW8R+EmJN5TkVMP0Qu2Al4vJs7BE9Zx9SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406623; c=relaxed/simple;
	bh=WAoXqXdUrlCGyMN5kIWAYBBned0Q7ltNNfZYL8ATY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQJC9ydKQ+tJEqMqDgmZqUCJB2PZ1OezfLdSQLmYPl2gXFHWbTsBMLZ6seWkcLtyI1pAWpQr5+4jO9ZUVp4hMJIMu1JH3gqZGfWTUl0K52g4iGBjAtiYW+U9pgHfmrkAyRYGNrHViPBTwPfsZxYCih4IlwtG8OQzB6/ehI9+F+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QeVnUC/o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Mzl5vC3t; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QeVnUC/o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Mzl5vC3t"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKu3sb002410;
	Wed, 23 Apr 2025 06:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+WqhQYS7YMbCsGZsHHaE71PW6UkADL5HfR3ONNcNl50=; b=
	QeVnUC/oFWW9T+WTm5zEZ0sG8xpRQuDVH++XZsMbu3b3fIlxJ9uchtIpvAhqhASV
	RSsuTCeyA2a/8dHR8A7cUqpDX2xLnijGo4zoptDjsKQaOnb7r0HG3iyP+X5braAY
	zY87M2ep0ds9badqD0tip9bd1vmI3rsZXN5Duz1UxiEeNZz9VZTSh09ZeHg9qdDA
	FzQS53V9QF+aRSRWfcKf+rWFDTwYLylIMSgVVfRPe9ru73GIZKGOP8O/3bqQ/VVj
	RdYRASD8ayWKL1/98WecIEk31CqqI8nIq21MPBtMe1BKPT1cSEL81AJZsL/AN03/
	zCC96U6p5yQGJoX1/LvFrw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 466jk18t08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:09:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN5uhcr9HmGQoIkwlkAdBvOIXJdYdII5PPMJkrYyvumqlcCTuJKufJbb8jXamuarrIs7ruVbl7J9XoyK++khHnf6vlVkKINHJAdXRpJjJenm/I1PwA3hFfUGIfr9Xy3EJDGGfDB2E1U5vG4dWYbWcbHYO3Se/zbWk39wmJigpUrNyhC1eVmXpzoTxVCiy/p3Q5RO16FA5fgEE8xFJLinARUXlhjQa0sn1uzic4zzaLWZP/+3GQF8jExkSPWHvswKzDNwZeucK2McHKP/pJlt/GK/cnBJZCV3TGWxqctcS9cwLxeIU06FjepYFAXo102JvxGBrNzyj69pKyU0UlNOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WqhQYS7YMbCsGZsHHaE71PW6UkADL5HfR3ONNcNl50=;
 b=K10FOr2jB1pMUH1bHmSEypLvBmhw6dYxd8rNpB6mBp60P6aq6y0irex/SFDlstX4yondsBbjaI8EG9ChLY6sBhZfXqZHbYqBCURFpFwsVoJmMMWZJrYF9V5KCTFCsWJ4kiCIbSjECalPbJgA07p2qvzT3OMaRf87m71Ca4DsTayadky2I6A1oHses16ykqjhqXPGZzAGwqHQHmS2MMVh4i52qdAGRTGXmnk9agBAMohbkS38Hqu1DCHGEB3buMXcf1PCFszvYpWvhJ68a58U9uNvPGC3pSBgvANHG96G8077jGi+qUV/O6IJnAiQdelDXFYp2QXC5piyw+x6TXVZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=apitzsch.eu
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WqhQYS7YMbCsGZsHHaE71PW6UkADL5HfR3ONNcNl50=;
 b=Mzl5vC3tVZ/FSocqY9r+IQpxgv18C9o6HvzZ3VDXhbUK4d1XR2tshu+0LF/kwy4y4hrPqznghbChxvyxwY0tD/ErVXQW6CyVFPin9MtOkjZN6E2ix6BWrtbyyBuTjjxB5mRDiHzQ9lG493ZAIBqZ0cJcPclEzjCxMXboPy9idus=
Received: from SJ0PR03CA0384.namprd03.prod.outlook.com (2603:10b6:a03:3a1::29)
 by IA0PPFB68DBCE99.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cc7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 11:09:27 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::57) by SJ0PR03CA0384.outlook.office365.com
 (2603:10b6:a03:3a1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 11:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 11:09:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 58C3B406541;
	Wed, 23 Apr 2025 11:09:23 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C675B820244;
	Wed, 23 Apr 2025 11:09:22 +0000 (UTC)
Message-ID: <8c49fe8d-460e-4587-8d37-1208aa7dad7c@opensource.cirrus.com>
Date: Wed, 23 Apr 2025 12:09:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: wm8998: Add Kconfig prompt
To: git@apitzsch.eu
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
 <aAZS8XVHtw5zxD2d@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aAZS8XVHtw5zxD2d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA0PPFB68DBCE99:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6d1140-d401-406a-819f-08dd82574e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXpOYXhnRkhIbitRUWVDYWY5dkNMVUtvYzd0eVZLZkVCYUxHcXpXZ0hhTWtO?=
 =?utf-8?B?SUtQVjJpeEpsQjI5Y3p5ckhpdHdOcmlESlRYcjA0Z05CNW53cWM1aDlCeDlD?=
 =?utf-8?B?elg1bU05M3hITk0rWnhIYit5dFZxNEhyTjM5YXgwMTN5ZC9BdTZpMG8rUklB?=
 =?utf-8?B?aCtzb2RmekVmRmw5WDBrb2hHOHBlYWc0VzJ1cjNycGpncXRYYThWcTBXdFRu?=
 =?utf-8?B?UE1zdVV1NDF4bjluRkhzZFpUQlVkNXBKOEZvVDZJUVo3ZkJmOG1BczA1bWR3?=
 =?utf-8?B?a1o3MksrY1M0Y1R4QWRIMWd3TCs5Y1ZGRTN1b3FoNnkrN0tCVnlINzZrQmRz?=
 =?utf-8?B?YytMMEtxYnJkdmVwR2Z6UHg4RGtGNnZYb010VTdydXN1YndYUGR4SXMwcnN5?=
 =?utf-8?B?ZXlndmsrWXM1VUZvbjBDYUtpeFNQUFlFazY4RDQzeGZTajhCUFZ2d1RNSzMv?=
 =?utf-8?B?ZktXdzN4OFBscUdDS3NFWXgvYTcybFFpVENzR2VyZllpWkVEZjZFVEZ6US84?=
 =?utf-8?B?M2dtdWduM1BpTjNMSnRFbUtQaG5COC9YTE1qUlhBTkg3N1RXazlVcXNPNzFm?=
 =?utf-8?B?VXE1ZmxYUlZQeWNMdUQyZWZQTWtQNTJqN21tN05qNE10YjEweHh5WTRCRCs1?=
 =?utf-8?B?eVJlT0w5Z004TlZCN21EbTQ0V0lZZUdmWFVySHlPdURXaCt6aytXTk1ETlZl?=
 =?utf-8?B?ckQ3UkRoNCtLaEZZVjdPY2FnalNrZG9JcW9EbTFDSmcrS0cyZnhJKzl6Ujlr?=
 =?utf-8?B?VHk5RThSUnRFaWpKY2xRN3dUNllTd2pZMFJIb01jMWM4TG1memd1L2dZYlpG?=
 =?utf-8?B?MlhwSmpjQy9zZXZvbWV6OXVIbGwyNWZPc09rZ2ptTng0eUxrSWZJVUQrUkV0?=
 =?utf-8?B?anNIUDc5aUg5LzV5TmNmSEFYKzM0NE1ycDNFVU1sNG5QVUlqRWQyVlEvL0lo?=
 =?utf-8?B?WTRvWGovbXA4WmhyTXhsai9pK2tQelFMZSsyMURnTjhFanRQNmRVa0oyTGls?=
 =?utf-8?B?UVpJVmJkTTBOR3JsR0tuaWw2ZXJDdmN2UWorMkFhUG9VQ0JReTIrVDJHcml5?=
 =?utf-8?B?c096YzVxSTZUSnBDdGtKZ0M3NlVOQkJBa1NCTW9lbU1SazRONjJyRWdwcWVB?=
 =?utf-8?B?YXRVRHZhV3JhY0d2NDU5WkVwN2JWUFA4bi9zRHIraGQybzBEaXdQNlNmTUpZ?=
 =?utf-8?B?Sko2QVVud0tjcDNkRUdTbENZbFJTQmV0UXI5YTIrM3ZtUmgrZDMzNlJ5N1ZY?=
 =?utf-8?B?K0Yvb3k5OUVQcE8zcmxma29jWXhzWWdzR2YxT1o2d1J3RTdJM2NKSHlWM2ZD?=
 =?utf-8?B?aENMcnhndmNEcWxoVEN5NmttUVR2TW5Ic1FJODVsaXRpejhnRElKcGxxM0F4?=
 =?utf-8?B?ZTNGbW5kcU9vYU1RVXVLRHBBOEdNL0lUTElFdld5QTZOUFRHdHdKSlFuTnVN?=
 =?utf-8?B?N1VzQWxQY2tCcjNuczdZODJLek0ydlJIVkRXd3M1czloUFVuZ2R0NEg2YkVl?=
 =?utf-8?B?Nm1lbXJvN1drOTRpb3JTSW5ybGdxTEtZUURORU4zUTM2aU1DZVpyZnlPVzRO?=
 =?utf-8?B?V0ttVTcxUnlvUjhkUU00aDVLT01MRy9WTGY0OHhHTFF0eUw5a1FKT0owR1Na?=
 =?utf-8?B?M0taUjZmbWF1bnNwZWRzcGRuL052djNBOU93OVZUVW9zN0ZoVzgzZ0pUdENM?=
 =?utf-8?B?NndUbHJXU01HQ2tSd3l3N01yZXFYMU5FY3kwRDl5KzJidTYxd1Y3WjdwbkRk?=
 =?utf-8?B?UFY0d3lFY3g1dUd5cDVDM1RqWTVDYXkvL3ZaMkNhek5rc3cyTEEzcVpPYWoz?=
 =?utf-8?B?TEtzMlNoZ2loWGhaWlBKYkJhR3d0bU9ZVCtqWmxaNElCS2w2c1IyeTBEZ0pP?=
 =?utf-8?B?cXArbksyNlZjbDhYOU5TVnBGOXdENUQzbVJEczJHTldxWG50RkcyVElFelZu?=
 =?utf-8?B?MlRNanFrRlp0cmVDMUhVYUxHTUx3RWpMRldoeVdqaXNHb3ZVOVpURXRlRnow?=
 =?utf-8?B?T1JxY2xuUXpGY09QOHBaRVpNcGNsajhWR1l1dVhPU2IrRWtuZHlBSHVGNFRS?=
 =?utf-8?Q?+Q0D1N?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 11:09:24.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6d1140-d401-406a-819f-08dd82574e9e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB68DBCE99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3NyBTYWx0ZWRfX0x38ZRjlhk4B N1ugYYnBXPF5mhVkOsbb16pyrafiTE28MWGjAZymdhye0XGpsMNzEgy77vQiPrbEQhhsO20LD8+ t7LYjRJCyknhPqC6y93YSoE7blATsXpkx68AarujtSilzHh9jqToirYIt9sXYMsexYd5XwRB3xz
 41lf+l/NxiGGCDuGEryjhyViCl97DoTVGs/gc+CCFDBH7AyP4gvMt8BJMqH6nu/Ftk2u83n0XCb rN5NinfIXMUSEirM6lND4EwZVhWRwM+rfPfyj8TYLOYZ4nCh+TMzdqWyP4ldtOoLhgNWCqyj1Gk isye0DiXqtyFqc5Hmh0DbGgxaZUB4Cw2CiKNLgmrOtBfLvhFKI4Qal5DbveE0xHDtNITc0FmfEH
 R1Al63nIqKFxmmsXUK1MOtZ9DzaercOCSKADUW9Gq9qiHsTQZcbAaOQ8+eG/AhTeasw9aFwf
X-Authority-Analysis: v=2.4 cv=FfM3xI+6 c=1 sm=1 tr=0 ts=6808ca75 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=HDjIzE35AAAA:8 a=w1d2syhTAAAA:8 a=vXcfBBiw0l7KqHk-plkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=y3C0EFpLlIT0voqNzzLR:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: ip61lAkbM66a6WkNXsLg5QJsZTfXUV-K
X-Proofpoint-ORIG-GUID: ip61lAkbM66a6WkNXsLg5QJsZTfXUV-K
X-Proofpoint-Spam-Reason: safe

On 21/4/25 15:15, Charles Keepax wrote:
> On Fri, Apr 18, 2025 at 10:22:04PM +0200, André Apitzsch via B4 Relay wrote:
>> From: André Apitzsch <git@apitzsch.eu>
>>
>> Add tristate prompt to allow codec selection.
>>
>> Signed-off-by: André Apitzsch <git@apitzsch.eu>
>> ---
> 
> Generally its good to say why one wants to make the symbol
> selectable, usually its to use it with simple card, although at
> least historically I think simple card struggled to handle the
> required set_sysclk calls for these codecs.
> 
> But I have no objection to this being exported:
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Thanks,
> Charles

Yeah, I just checked simple-card and friends and I see no evidence that
it has a way to make the necessary calls to enable the clocks and PLL
on the WM8998.

Of course, the intended machine driver might not be simple/audio-graph
so that might not be a problem. Though a more specific machine driver
could simply select the codec driver it uses.

This is why it helps to say why you need this change.
