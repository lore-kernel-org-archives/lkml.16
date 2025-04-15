Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C851E7C24
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701756; cv=fail; b=kMh7NemxNvU3IGb+0LSqQflSOfqNXA9IQWrmsP2y1ERXCSWrSLf5Tsao25J+/aA/Yw9ask6JkbdUr75T++PWW5zMyjYExkmaruE2tV1eNFw1oZ/9Tkr30d0BLzl11OCqb27izC2h25x+obO9RKA+Z/ymflg7q0GpKRm8O0ti3MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701756; c=relaxed/simple;
	bh=tmuH86wuDR3vO7X+MaXOS9W2hNY3wyJiL4S4F7wNvww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IW4tUVwisLNJLGhndByR8dV6nr5ALSE3odE6XkkoWv3dsiE1CiW15cr1vuHlnUhL0fdWxkaYOpPhrHTh5IMzTbF/3opPyZ8UTbv9FaKv5rmkoTohwgAs/81Q6GDX0RZQTGqi7H81EmA9ANDfOSnKgGrFEdAqL9HWYPnTFB6Yn1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xH+8Zb8E; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xH+8Zb8E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWWLCXG0GDttq/Pb+Cc1SaSmfFh1kFjDhh3ZmPdasJZPQMm1xm4WMcozsykcDAfbRLH3Ci/Xdr03yPyTm40KIvA8CPrnuFaC80jt8rXl8pqiSnPeJrX1bUB+vA+m5I3In6nGxv3UQvuWbJLXvwMkHTw5bPin+3tCvz4DbcsnJ7MRqwHcUslB21QR+Mu7IsVaEGGXU1VY+N4QhuQdsl+ftgsBaNq5ECjAjRb013CKOXLTkXm0rQf6vgFwohOjwYKTi8Tu0F+0nwFcGc17rO1U4bCBtJ45WdwkcP9ZW2yC61mSc8UctZXiEBbT/ZOca+36rYUiVw0Ck4YIp5HEHxqYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeaoH0ep2gcYyR8DZFezdzU9NpmPIjahsh0zJin7MGY=;
 b=kHVAGlpuKgffyfJTG7LXmt3FJCPAL9ayojfZhS6cIKqlk8GduYk6da6RgBwuyP3aej1EKfuJkXJ2G2R4vhhN2kGtImza8iy5o/hps+hrMwnz+b/PjYGEW4PcKUw0tIgTfOIQr7eJ/E+SUQixxAUGiZTLdblU+OHCjqUbI5M2+ZDzbsBCiWGc3mMqQIhBkypXe3k6v7Wy+g83ncr/r0xrpzo/LEjHVxM9OJzu5XdLdpLsCuADlzivY1YHaFWKUr8Wf3Fg9Yqy08vcj6atpubu7jFciOGcBGafgbsmi4lHNAOkMoUUKY7thtxNyrgZFNmDJiXmgPUbkh965lMUklyOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeaoH0ep2gcYyR8DZFezdzU9NpmPIjahsh0zJin7MGY=;
 b=xH+8Zb8EEAZZC5Dw+Lre4/gKkeoVy5al5s5h/McAJgL0F2+ds+Yuau5762nrDwVd/e2/YkILLxB8MOt2O0A6CVrSMKkHzyFVeBfQdvRwNeAjWXeJ8E6RsclD0O00JZ8tmRv9NS2VDYe/mr5PGvaTyUeYhCrmTetujxvhG/7E7NY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4270.namprd12.prod.outlook.com (2603:10b6:208:1d9::21)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 07:22:32 +0000
Received: from MN2PR12MB4270.namprd12.prod.outlook.com
 ([fe80::2e50:d5b4:45f2:684d]) by MN2PR12MB4270.namprd12.prod.outlook.com
 ([fe80::2e50:d5b4:45f2:684d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:22:32 +0000
Message-ID: <134bd404-d741-40ec-a661-f897da5ca9ca@amd.com>
Date: Tue, 15 Apr 2025 12:52:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-6-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::9) To MN2PR12MB4270.namprd12.prod.outlook.com
 (2603:10b6:208:1d9::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4270:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: e943fee9-d574-47d4-830c-08dd7bee4787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXBrMHBxQ2dPTXRqNGRQM0Rrc3NYRTltamV0ZlVWU2hGOVZvYzBsblJmUk5W?=
 =?utf-8?B?WElzVXdBcXR4RVNraE5rZzBPbi9XR1FQQnY5djNNWkQ5QnloTHN6a1FhazJr?=
 =?utf-8?B?NHR0Zy8vR1g2cy8xQk9pR1dUVUxGUjZ2cHBwUWJhLzAvRGJNSEQ0c3kvcTNO?=
 =?utf-8?B?V1FDTnF2bVFVZnkxd3JMSDdZZmY4ZFRndWZZQUM4bTVaeU9hMlNKT3F2NE1Q?=
 =?utf-8?B?WjFTL2ZhOG0xdDFZZ0VRZE1wN1UvMHdsd0g3RnFuVUxoVjdzL0tvQlFMOEhN?=
 =?utf-8?B?c0xuQ2h0RW8wVWxRT1p3dTArUTNqakI3VlVLOVFrK29HekJjaUV6S3g4WXRO?=
 =?utf-8?B?Nk45aEtDQ0N6UUJUZm0zamVySnU0RE5hNDV0cklFanJiK1R3N3M0MlN6eTc0?=
 =?utf-8?B?RWJ0VnVweE9HSkNzU2kwVC9RZVpiVHh1b0NxT3NxTzJZTmtkMzllVGNKSVpq?=
 =?utf-8?B?Nm1nUlkrV2t6aXd6U1NZTC9NMCtRV1AvMm5HZGtUUlFFQ2UrM3VWLytRUWEz?=
 =?utf-8?B?a0U1OUFwNnZzbG02Vk1xREhkT2ZtUVNtUTU4cVFPZk96ZW1jWXJJaVZuKzBH?=
 =?utf-8?B?d0tHaVpNNXZieGlyUlBvS0IvWmpQZDV2NXRYNmZ3V2drNGdsTFNURndjUGxr?=
 =?utf-8?B?N3F0eEM0VWNraTNlYUoxclcwSmlwYi9oR1ZNTTNBdUZ6cjZtUmpFai84TG13?=
 =?utf-8?B?dVA0WjVPWTlEQU1zV3ZWcWhzVVBvYlZlQmRtUlVEU0VwTnFEc2FRbFYrTWMv?=
 =?utf-8?B?NVZxRkJsSlo1OHdnZ1N1VGNhK3pJWXVnY1hUT3ZsUlFKTC9iV3d1aEhSVlVl?=
 =?utf-8?B?S1VyUGtSOVBXMjRta3V1TU14QTJXTzV3Wk95ZTlOazlhMTRZeERHa21pc1hw?=
 =?utf-8?B?UFZYN1pJc3EvOVM3N3lIR3cwWU84ZVpQMjdhZEw5aDkvRThNKzI2U3Q2TkFF?=
 =?utf-8?B?OEhMamxLbFo3RlB2RFVpQ0k5NDFiVXBtRTNzSks0eWxrL29XMHJMZHJrZ09J?=
 =?utf-8?B?MjJYYm03UXRNK0k3aDVZRzR3Y0pJdFNJRE9nTCtnMWdxMjRYUVBjUktublFU?=
 =?utf-8?B?WXZaR0NVYVZodHM1MEtvWEdNRXJzdytqTmQvTWVtNU9yNGpJZFNiRkl4bzc2?=
 =?utf-8?B?Sm11SWFmUFIzdXYxVm9XQ050eGNzRjRuaFNMUnBHNVk2b3NQeEdvY1ZsN0p3?=
 =?utf-8?B?aWt5QURZK1JuSDYrc2NOUTdMUVRlR1cwNCtLMkJwbTRmdUpiNkRyb2M0T2V5?=
 =?utf-8?B?RkZkRmNUcXYxNWtzcmMwclVYT21MbklTU1I1TlIwMjRqUW5KRjdURGVkeVNz?=
 =?utf-8?B?VjFBTTBGZTJOZnI2RHE0ekQyRTF3UEsvZ1VobFlmMUtYVEFaMHhHa0J4Y3dB?=
 =?utf-8?B?NEptRVZlUy9DTlFtTkpYU0VkVy9Pc1dVTGVDUGVwNTBBeHFPMEp6ZlM4NTdi?=
 =?utf-8?B?b1czek1vZUFvaDNnbkxoWm9pNTBPM2NJNFQ1dWk5YWdIbDlFT1M5UmhESGM1?=
 =?utf-8?B?Z1JBNWIybDhuSHh6M1RnUEpMUTJyVjVaTk5jZ0FJNEN3ZmtXR0V6VTB1dUpD?=
 =?utf-8?B?cUJiVndhbmQ1OUF5dlBqdVh0eVowak9SQlRzdENRZGk4MHA0cFBTNHQxZlIx?=
 =?utf-8?B?Vlg1ckJGMDJrWUFiaFJ4cGVoMUU1aVRBdVBQY09Xb2ZHMTdWWnkwMFp4dXNk?=
 =?utf-8?B?RDQwTVFXNkxtQlF2NUpsaytRM1RZNTArSGJ0Z0lxREdSZnNlWU93bDBOdlVH?=
 =?utf-8?B?a2xaZVBlVVBQZGhiaTV1ZFNUWU9rbDNSckJaWWJIUHFTRHF1bWpMK0NaUjh0?=
 =?utf-8?B?SXNMU0oxbjhOTkowd09jdDAza003WUlJS3pYZ3lHdnBlR2UzaHFuRjA0WVB2?=
 =?utf-8?B?czBqU2xhdHZhbWNOenRwTXJ2WWhrUXRnTG9tRW5HbUxqUEtjMkdPOVREd0hG?=
 =?utf-8?Q?5hNISiSwRdY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4270.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFduY0pONkJXWGd3a3JSWU00b3ZHOWlhUVBmb08rczhPNEJoM3JVL2g4cXo1?=
 =?utf-8?B?MXpzZkEzOTNaVFNTaExYL0tvOVlacUpEb1V3OTJ6Z29McDN2ZFhidDN0bU5Q?=
 =?utf-8?B?eDM2cjhrWVlyYWw2M3pXNXJid240RFdqcWs1WTNteVA4ZDEzbjdWOHBDbW9v?=
 =?utf-8?B?d3JNbWtoKzBjemNVV2RoZXRtOE5hdmo1WXVxajQxQmtBQlJKR1FLMGUwWWxU?=
 =?utf-8?B?alBLdU1UalBiL29pa0pMUk8wYW1WZkw3SE9BdzY5bit5NGQrdS91N0tjMG5Q?=
 =?utf-8?B?MGdZdW1td3BqcDN2UmVja1NQQ1c5SzZCSVZoblpKNFhnbjNpUzgwTUpKWEJS?=
 =?utf-8?B?WVRERWxsVzUrK3BKSm1taDQ2SmliNVR0TWNTRGdsT1RwTXlteDVFaXB5RWJG?=
 =?utf-8?B?RVNZKzVBbldhQ2d3OUdqa0hTb1l6WFdxTFhWN0R3Rk9ZN3RaQTBzU3EvdDlC?=
 =?utf-8?B?NFFqL0VoU2JiWlhLdmRxandrWVhYN3o0a3NzZGRGS3d1ZmtiSnpGK3B5ZmRD?=
 =?utf-8?B?S3lnL1dxWHdGK3lib045VFEweFd2V3RUekZ1ZTU0aDhkWnRsUGM2bTdWRkxH?=
 =?utf-8?B?NWt0eGlCUXBzR2VUejZ0S3QrTlFzTTJMME9iSWJWZUNvWnVyNW54L21rYWJJ?=
 =?utf-8?B?WWJ3VUVBU3ZJTVRaUHVQZytMRGtETStieG9WTkpCMU1nb2hiVE1vSHA0MEZS?=
 =?utf-8?B?alRGTklWM3Y4T1lnN0cxbjhBQ2lqVWxMcTF5NmhpSm91ckVyYUJDSDBuYVUw?=
 =?utf-8?B?UkJCakpNTlF5Vmk2QTRZY2Y2dTREZkVMT2ZwMUNuUWE3emRKUDU5enh3YTJi?=
 =?utf-8?B?VnNmUSt4a3hXaXlFajBocFhKWmprd1R4Tnd4Q203aDllRTVobW5qYXVYQlor?=
 =?utf-8?B?cG5pNUNmQzVTamZtWC9yeGNxOCtscXBWOVJGY1dsQ05xQzU4QWp4V3lqd21N?=
 =?utf-8?B?bmw2ZkZwbFpMeldmRWVQOWRPVmgySnRHZ0hqM2NhMTB6d1JDeThEd3dObXhR?=
 =?utf-8?B?TGhYNWVMOXE4QTRGZzRqUDQyWnlHUHM5ZFZ6b3V1UVBzcDh5QVAzb2lFemZl?=
 =?utf-8?B?VzFpK2ozYXBNSVc1bjhSWFdnekRGWmV3UjVxd1pJVEhGa01LS3pEYlFRZzFL?=
 =?utf-8?B?WEJOQ0txRkRsZk01NnVkL3pBZ0pVWGtyYnZxMndlaUp4MHh1ZlQyU1M2R0ph?=
 =?utf-8?B?c0lkbVY5SHoySTJrM2tBMDhWTmV3NFlCRjVCajlnRUlDbEtqUFk1S25KTjZ5?=
 =?utf-8?B?WDU1Z0txOC9vWERyWW5WemMxdTk4YmdqWkxsdFBWaTRzanBGNFc0SXpzU1Yw?=
 =?utf-8?B?TUVvSmxaTS9qOFBhYWtLVFBGWGlUSC9sSjg2MzYxNjdXaUZIQ2pGSVE0SU5E?=
 =?utf-8?B?SjRIbUNmMnd4ZzJCZDViTmpubjJGL1czQUVFWEdQaUhqQ0wyUHZtUFpSTGVB?=
 =?utf-8?B?SGVMMWFuQ2FvNHNKNXJ0QUhjRitjM29qaVNVYkpJMzZNWENLYk5PS3pNNUkz?=
 =?utf-8?B?V1B0M3I1MTBxV01IYmwxaFREeDFOV2hha094Uno5d2I2M3JoS0s5cG1jdi9n?=
 =?utf-8?B?R0RnTkdoZm1QbzBQdGVJUlZtZVd4OXplOWE5RjBvS2s2azZKWmo2YThpV0xw?=
 =?utf-8?B?aFl2ckNLYm5pcEFNaUdaTlFiYUFlR05na2tEZW9rNjhnOEV2UUJZa0NkZjBi?=
 =?utf-8?B?YU9lZVNCSDNUd3lXOEljUUo0WTR2R0JJb0RJY1lac25tRTZBV1FHTHF3M01O?=
 =?utf-8?B?c3R0QTIxNVlSaE9yd0FNc2kxMWZxcU56M2UydGJLWTBZaVN1eUlpYWI5S3Z2?=
 =?utf-8?B?RGowMk5uQUVnT2tkM09PSUJJZ3gwbmtlbmdZYTVwQjRDM3F6VDc4NTJOK3pB?=
 =?utf-8?B?WnJxNjdmYXBCbDd4dG1PdXMwQ2dmZnlpZFY3VUVmOE5XakJBS0NzbGdKbkU4?=
 =?utf-8?B?QWwySWJDWHFDUm5GeWhNNFVHSThhMWZHaUJiYllxczduNU4vSS8rcjk3SnYw?=
 =?utf-8?B?Q0JraHJOcUx5M3dRREQ2S1MwQzBYR2NGUS9WQjVoVGFuMFNnRmROcFVDaGpv?=
 =?utf-8?B?d2VCdjVOdWZYcmpSWHJVd3NoK05WOU50UjliVFp3ZDVTdVRWSktucWJiZEJw?=
 =?utf-8?Q?NBrGqcrf1/hKtrFFbWZJpohP6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e943fee9-d574-47d4-830c-08dd7bee4787
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4270.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:22:31.9538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWkNc0WIWdH6FpWxsMohMw2koOOH98op2INF+XoEgjWyNXatYXYFXBe3iah4Of7FHmle2ceKLGHEkEoPSeTyfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903

On 4/15/2025 8:09 AM, Baoquan He wrote:
> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> indicate if the allocation is successful or failed. That is not very clear.
> 
> Here change to return explicit error values and check them to judge if
> allocation is successful.
> 
> IS_ERR_VALUE already uses unlikely() internally
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3f38a232663b..5b21cd09b2b4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  			 */
>  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
>  			if (!lva)
> -				return -1;
> +				return -ENOMEM;
>  		}
>  
>  		/*
> @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  		 */
>  		va->va_start = nva_start_addr + size;
>  	} else {
> -		return -1;
> +		return -EINVAL;
>  	}

Braces around return -EINVAL seem unnecessary.
They can be dropped.

>  
>  	if (type != FL_FIT_TYPE) {
> @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
>  
>  	/* Check the "vend" restriction. */
>  	if (nva_start_addr + size > vend)
> -		return vend;
> +		return -ERANGE;
>  
>  	/* Update the free vmap_area. */
>  	ret = va_clip(root, head, va, nva_start_addr, size);
> -	if (WARN_ON_ONCE(ret))
> -		return vend;
> +	if (ret)
> +		return ret;

Is it safe to remove the warning, or was it critical for debugging?

>  
>  	return nva_start_addr;
>  }
>  
>  /*
>   * Returns a start address of the newly allocated area, if success.
> - * Otherwise a vend is returned that indicates failure.
> + * Otherwise an error value is returned that indicates failure.
>   */
>  static __always_inline unsigned long
>  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
>  
>  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
>  	if (unlikely(!va))
> -		return vend;
> +		return -ENOENT;
>  
>  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> -	if (nva_start_addr == vend)
> -		return vend;
>  
>  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> -	find_vmap_lowest_match_check(root, head, size, align);
> +	if (!IS_ERR_VALUE(nva_start_addr))
> +		find_vmap_lowest_match_check(root, head, size, align);
>  #endif
>  
>  	return nva_start_addr;
> @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
>  	struct vmap_area *va;
>  
>  	*vn_id = 0;
> -	*addr = vend;
> +	*addr = -EINVAL;
>  
>  	/*
>  	 * Fallback to a global heap if not vmalloc or there
> @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	}
>  
>  retry:
> -	if (addr == vend) {
> +	if (IS_ERR_VALUE(addr)) {
>  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
>  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
>  			size, align, vstart, vend);
>  		spin_unlock(&free_vmap_area_lock);
>  	}
>  
> -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
>  
>  	/*
> -	 * If an allocation fails, the "vend" address is
> +	 * If an allocation fails, the error value is
>  	 * returned. Therefore trigger the overflow path.
>  	 */
> -	if (unlikely(addr == vend))
> +	if (IS_ERR_VALUE(addr))
>  		goto overflow;
>  
>  	va->va_start = addr;
> @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>  		ret = va_clip(&free_vmap_area_root,
>  			&free_vmap_area_list, va, start, size);
> -		if (WARN_ON_ONCE(unlikely(ret)))
> -			/* It is a BUG(), but trigger recovery instead. */
> +		if ((unlikely(ret))) {
		    ^^		   ^^
The extra parentheses are redundant and can be removed for clarity.

> +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
>  			goto recovery;
> +		}
>  
>  		/* Allocated area. */
>  		va = vas[area];

