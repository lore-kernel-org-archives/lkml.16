Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCBD233705
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586030; cv=fail; b=OvtoEtRyRXkUgq17q6bjUwgx9NFUHkukKwsHl0Pdc45zQ+uKcloGuEGHmn1dIGZzSl87GhNw50XfBjKOg0/HPZzdIjD/ZgifUmbu31AYBmUl/WDsiKqM+n8X6YslXe4PsWyqUnZNizjZe4ZsYZo2rhzfXkOlZvyMTWbyPFZozDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586030; c=relaxed/simple;
	bh=/c19po00Gbqqkjy25tIBRZBezWJ+K6mbSnS/Nea94Ro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=opUzfziQPfHukTnZcdiG7zOt2ZvVlp/tBnLqFq9TwtFuRGLhRi48jNVx1XSsAzTt2fyNGBrsNcF4L7qvwQNzDPJanVJaBPDT+sUkv1tGmY4ldB/Wca5J0XimVv3Lgd2xdc+otkU5uNFN2V0H7fOi8UVW/8Nl+G+wqo6sj8IF5BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FIrzZfYK; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FIrzZfYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGLOcqqQgR7RQRGMsFwrUWGVzx/bZmOhtWyA7TJcMCBLss3oOHeCHXpH6s1oFZOEJoW/r45DAqGMywpvdMY1qUJdfFIySnD7Nw6OBxpa6LDpiUJXMkILQVFFO2+dt+p6V9LyXBfit5PuJ2xuLsjtDpHsCFEflOW2wPL8H1r8/qQUWcRMbRe+QQxQxSE/FzRIH7dBZPQm2QO9YO30BTfdckJN2zQVztvhtUH24jXRTf98hCzGfExto31Kc+jbJW6xkCgDEoTm0Oh3eulpS7ktKVoyF1HVFKsocTKBa6FCsiALaDcZLJPVO4X+avPqGbjlofErjE4vk4NQHLdSZaTvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlF49xTggMmPdzukFZXP9W4IZWEnFqG9ACbpgQBsmlo=;
 b=mPQ2HvDvzmX2HQFo3XJJbidodmM5our5Wk4TbbrU/6Yya7HZBIYNxPB46F2MB/sFxbVT6mA05WLjTKQUzhFyZ8ONJFGNDFx3D0+mKTpFVkebmJpN06WcgeKCX2mhiEtgi/Db/SwtcEnC5eGNynAH4fRoFF8UmAJBizksncrRZa4js9VRNZkR9krW19qXjazyYmPEE+Ye+YyaPBu+g1IwuopEUmekqP1us3U/w7oqWg177NlqZWvfI1cExBHr2zrwNmx9Im0TYSMfad8yt8LHKjrfTCUt9kYL0WhpUdA/XapyoIEZVgECxamHy91EeX4W2SgCqPgrkLDMJ/fGU6hRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlF49xTggMmPdzukFZXP9W4IZWEnFqG9ACbpgQBsmlo=;
 b=FIrzZfYKSDv8HbOPmXysCGDT5mwfAlMcyzIbE+wdstWNwUPbaCqEYawlNQQ341kM4w/AbglVMqbgTpWtLrW64Z3hJrGGMN0iU3i73/5v9E6G50mPV54feRUbK2dFbWQAoV5NO1yR8fZHg2/E5zvQ4N2LLoOLyHlsXbYgI+i3y74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8189.namprd12.prod.outlook.com (2603:10b6:208:3f0::13)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 09:27:06 +0000
Received: from IA1PR12MB8189.namprd12.prod.outlook.com
 ([fe80::193b:bbfd:9894:dc48]) by IA1PR12MB8189.namprd12.prod.outlook.com
 ([fe80::193b:bbfd:9894:dc48%7]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 09:27:05 +0000
Message-ID: <0928be02-d439-4ece-9924-9146a2658d76@amd.com>
Date: Wed, 2 Apr 2025 11:27:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
To: Songtang Liu <liusongtang@bytedance.com>, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 zhengqi.arch@bytedance.com, songmuchun@bytedance.com
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To IA1PR12MB8189.namprd12.prod.outlook.com
 (2603:10b6:208:3f0::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8189:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bf0c4b-c414-481b-76b5-08dd71c88898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWRsSFFqREdxWUFDZUQwdVVZUlVYaEJUV2VpanhmcVRqazVlekR2T3lxOTBN?=
 =?utf-8?B?ZWY1QmM0QUVrcHJaN1pZSlRGaVN4R0d0RGlwMVNFM1Q5S0JXS1A5UkJFcUFJ?=
 =?utf-8?B?OEtVbzFtQ2xyV2ZxaUNqWkhMWGNkWCtBNE1tUFJlUnUzRGo3N0pvNHFyYWRG?=
 =?utf-8?B?ZmN6NGl5NS9zZWoxMExQUWJWQmdXaUpCQVAxblNNTFBPeTdCMTNLMm1CZjlV?=
 =?utf-8?B?ckxyV2RpYytOaFRscm95b1Z3cVdBUklPdS9rcDBpaU0xYXcyc2QzSGYrRnNk?=
 =?utf-8?B?TUFYRUdoSUhPWlkyWnlZZmJoaVFNeHc2KzZwT2pHcEVvZ0UySkhKVzZURVh5?=
 =?utf-8?B?N2VLcVdvbVR3NDNOUHVNcDF1SmdYZ1VZWmlVMFNKTEJtNCswNjdGcnZSVklK?=
 =?utf-8?B?S0JKMGlkcFE2U2ljL25kL3JwQVp3eWdteUYwMzJROGx4Umt0VUVwY2tVSGJO?=
 =?utf-8?B?ZUJTUU40cDJqWGoyQVJMeWphR2xwejJoalFFb1JzMVpYYllpS1VzNWF3ejV6?=
 =?utf-8?B?c1hMOE9zS0I2ZkFPV0RvekFVK0kyNko5WDZ1ektpb0pCZ0xESGZaQmd4eTVu?=
 =?utf-8?B?SmdJV1V2VVJuR3BJckpFTjNQMFMwUCt2WWFmM2JJK1dNYzk0SEJxL3pvejZE?=
 =?utf-8?B?aUsxRE5Sb0x4dkkwOEdNL3NIdHVCQytIZ2pSanZoZ2h6TkNwdHN3alBVZ3hB?=
 =?utf-8?B?S2N6amhrNWZjZ0l0b1ZWSkhJeW1HTTFFRVZPbm9ocXNscjN4cnh2VytFMXpo?=
 =?utf-8?B?TWNiZUdGbkxoQVU5dWh2TVFrbGM1Wm1SNkwrTzhlRVp6YW1rRVBXdStnWlhY?=
 =?utf-8?B?cUdwTkJ2ZlZTTTFNa0JRdmxyeWN1dmpyTm5rYW5vMHYxMDlVOEpZa2dXZkxh?=
 =?utf-8?B?R0xNaWYyQW1vdXZBaXVQT3hHS2hYTGJNSU5vQ0JYK3ZwNVZwUWdUVEJjcks1?=
 =?utf-8?B?Z0swNjM5M2Y1T2xCT1hST21IVE41Vk5rdys3Yk5TTC9NNmNhZjlNV0hLbmlC?=
 =?utf-8?B?MkNZUVQveGJnNDBvS3VoNDdibCtSN3c4RFdQTmNmams2Vk5BaFgvd0FSUXF1?=
 =?utf-8?B?allQQ2dyUFVBUHNGWENPTVNMSjloWUt3Mlp3dDVJRXpNVUhIUUp0WVl1M0Vm?=
 =?utf-8?B?SG4vcUJqb1pENXlTaDRFVlJ3Q2xqOXJMOHo0aERzVjlTTjNQbzZXbmJzRENJ?=
 =?utf-8?B?aW94TkQxendQeXViTS8wOVovWnZYaDRTbTFoU0N6cEh3dkFnWUJhbmh5RFhU?=
 =?utf-8?B?WHZ3VUN0R1owVk9lMW9OR2E0Nkk4T2RpczBpSS84bFZlRXZXSXB1K3Vxc2ZN?=
 =?utf-8?B?ZXRVNTdxQ0VRbXJWSzNiaENqeC9JUGNlbzBrRC8yRktMVW9rdkJwUEtjSm1U?=
 =?utf-8?B?M0wvRkZDR3VSLzYyZVllRmd4VWwzYkszL0xvb21kQnZSUklDY01Tb282ZXM1?=
 =?utf-8?B?NDQrSVFWRWYwa0VXdlVseDZGRHJwSXk4a253cTRuZWhLY2lsMXRzNFMvMlcx?=
 =?utf-8?B?Ty90MnpxaElaYXNsTXQ4eUFNeTJFYktQZ2tFSzVDMG42RE1XNFlDRGJPQjQz?=
 =?utf-8?B?SXNxQ093WGZOSnlUL0NRQzZZeDVBTjA4b05Tc3ZHaFhoNGNpRmttWGRIdzNh?=
 =?utf-8?B?YVlvRUd1Z1AxTmVCbnB6NUxtQXB0aUpMdEpDRFB2VGlSTXpWVVVDRnpQeThO?=
 =?utf-8?B?RjQ0eFFsRHkxRi9PU2cra0FuNkowWjZkSTVZWnR5bkZ2eVBiYmIySXNQM0JC?=
 =?utf-8?B?UWZMRWZmTWNqZG5DUTE0UU56VmtNRHM4R1ZwNDlyRGZiL0U4WmkxN283eHBF?=
 =?utf-8?B?ZTJ0aTZSMlptRHRVUkdqYXVnbHNXU0xGNFY4d2VLTlBtRkg5ZkszVDZiQTFC?=
 =?utf-8?Q?KXTKAB9N3A7wK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai93YWRzQk9CaVFtd2JZTi9wTld4SE5GSEJLMGdYWUNiNVVoUVgvM2Q4c3V3?=
 =?utf-8?B?L1cxVzUzNjJFMG5kM2lsbVlmY2RDbmUzQ3E5MjFVTkc3Y2ZWdzNOd24vQ09m?=
 =?utf-8?B?YndmMENoNmdDc0NVSWJ2VzBKc05lZ0tqd1VzbUlUZXpKQTlnVU1idU96Umt0?=
 =?utf-8?B?VlVTa3NuNWZoUDVSMFlPZDc0c25RY05QeC9Takw4YkQ1MitjZWVVeWRIM0g4?=
 =?utf-8?B?eEpydnE2a0p6d2RHSzhLcmFIaWk3QkZISjRoNjF1NFRCdkN1dy9jQ0g5b2o4?=
 =?utf-8?B?UlkwaElxVndndkdVcTA2QUVmVnlPSE9OaHJHU2VRTGxKR0N2YlpYdHZLajlp?=
 =?utf-8?B?N3l0a2Z3OTVpeGtMOU5kSEpOaWtyZkpkRElITWRRYTNKYW1hNjBvRFo2UGJH?=
 =?utf-8?B?bDkrWWlTejFlSStNZUU5Q2RWSXIyRU8xWDJjYS9ZV2YvWTJ3RVZZbzdiOUhF?=
 =?utf-8?B?ZUlRbzdBdmNOV01HT0MrU3JrRmF3Y20wM2hFbkpvV0J4b0E1MGthOTBCN2Jl?=
 =?utf-8?B?SEhGMlVabEwrVFp5RnlORUlYRCtOOFA3WnFET1J6QlRqYnRSbUtRMTV5alBo?=
 =?utf-8?B?TlQ1ang5bTlKSVVpTEJZdEJ4TzNBNmo2NHJ3TkZrNkVuN1hxZm45bGhJY2hJ?=
 =?utf-8?B?S1Q5NEUzNnFZVVZkZGlndWlXWkF0YUNFdUl5U2lvby9BUVQzbHpVbGdOTkxM?=
 =?utf-8?B?aFlSNWNFaElkL1lLQUpJN29zVCtHc3Fldk5iMUw2UHI4UkFCT1NSY2kwNGNC?=
 =?utf-8?B?dmhDOEhlNDMxYnZvRjhGYXd5MHgwVXhvbS9FNEFyYmVuSEpJRlN4cDlodUxx?=
 =?utf-8?B?QUY2M1JyWWwyYnBBajhsSGFieHFWMFp3TyswTGcvRmhsTnc3MUxXT2hiVFZ5?=
 =?utf-8?B?MVdPZTdQdDdxOTdQbzdkUHFFN29xSlR6MHo0OFZsdXkvWVVsNnYzVU1RRUNV?=
 =?utf-8?B?bkRsMFd6SHNRcUhzSjdKb0FCYWRIVjIxdWM3Sy94NjJ1MkYrUzZ1bjQxYzh5?=
 =?utf-8?B?ZWd3YklHL3U0b0NyVld1WXdQZ3J2NHE1bE1rWUFjQXVRaE9XKzBNZWI5VHBY?=
 =?utf-8?B?VHFwZGxUb2hEQ2lwcUJnaVhWeVo1V2V6Q2RKUWJacnoxRVFXTXMvaWZuYzJu?=
 =?utf-8?B?cnl2YmZxa2t0S2RqZjJmRHlOcEp6VkdGT3dNd2IvNFJJZmxudW5aeUI4RGIx?=
 =?utf-8?B?QUovUXZjNGZ2NFhKVUFNRmJwbFZQUmg0UndHL29ObGhWWUZWM3Q5d2s5Nitr?=
 =?utf-8?B?aG1Tb0VQejZ2YWNHKzRjNkFkRmF1eStobWxidkRQSUwvUVI3NTFnejlkb1Rx?=
 =?utf-8?B?QWl0aE12UVhQaDZObUI2eHk5ckNISFZtRVJRRzl6VnJ0RjZwZ1ZkK1VoNFk3?=
 =?utf-8?B?VzVNUzFZMThVUzU5YWcvSWZqMitrNlhXQmRXL04xRDVLS3hzc2N3VU9YVGxa?=
 =?utf-8?B?QUxwblZ3V215N1YzdjYzWDV6YjBGclFqY0NUZnMwYitsdzJnMkJjZStPMXdG?=
 =?utf-8?B?a1JVYlhIKytKKzAxbWFSOWEySkU1dC9ZaTU5MlYwL2ovL0xDaWJ1dXVHbVYz?=
 =?utf-8?B?cEdDZkpudWJ2aXpnNTV0UCthNGIzZlZhQXc3eHYyQkJ1QUo0bzZvZ1hYZmxL?=
 =?utf-8?B?MnkwZXdCQ21NQzJnTjZpdURhM1FmOVcwQ0tZdk1PMGRWM1daTU5DQnRzck1C?=
 =?utf-8?B?bG5Mdmh2Z3U0UitUWjY2Mjg4cWQ2ZUJoU2V6dTdqNk9qbk9EY3Y4MnNaYmdN?=
 =?utf-8?B?Z0hoSGJ4emY0SWhNRmYrUVhzQkNFN3NveE8zSjBERkFKZjJSckVLeXdnbEQ5?=
 =?utf-8?B?NDlYUDJrK3R4aWczY2hCMjVPN20vUHhjN0Q4TVEybVRLaldVRzBYc0IzSGE1?=
 =?utf-8?B?N0VnaUhqdERVaTgxS1g0UmhCc2xldFF4eitCK3N3RXhWbnV5QmFabGpLNFV4?=
 =?utf-8?B?ZU1DckRrVXVrRnpSTVZXVkZQd2lzWTlQb0hrbkF2RUdmNjJSSlI3aTY5NmxG?=
 =?utf-8?B?dGF0TDdhVnB6K3V1VG9NYURjNG9SM09UU3FXcS92dmhaQ1FicjJBbDdsUHh5?=
 =?utf-8?B?Rkk5VVJHSEgvYWFlOUpJWUhBZjdKeGt3WGRKKzBjc1VKS3ZhZU1YcUw0UUNX?=
 =?utf-8?Q?ehfrwQ74ynldtUFwklEHs6+fG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bf0c4b-c414-481b-76b5-08dd71c88898
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:27:05.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqsQ8Uv9mG3MvkYEVt6ZiaG/T59Rfeeqh6WCoIXQFZc2cBuAor2yY/DKEQmQvXffqW5pkgGCTr1hYszZr7DQzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184


> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
> 
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   mm/page_alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e3ea5bf5c459..6edc6e57d4f8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2661,7 +2661,7 @@ static void free_frozen_page_commit(struct zone *zone,
>   		free_high = (pcp->free_count >= batch &&
>   			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>   			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
> -			      pcp->count >= READ_ONCE(batch)));
> +			      pcp->count >= batch));
>   		pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
>   	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
>   		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;

