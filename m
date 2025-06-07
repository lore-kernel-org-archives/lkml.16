Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160662F2E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749319259; cv=fail; b=YXhX0GudyL6z3ZsprbFhl2mEDtLW2RwipJYs/dl35bnsfIdkbHgwULecG9QbWn7spZkFtckAJxKLgSvXJ7TrZ9+1VS26FgxQ8GVqsw7shlVEleCdiVKHg8CyYgjU46c53pc5Ib/UJNyh8+5kgrJDF/ga3YO5fRKBJe6k3YGE8Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749319259; c=relaxed/simple;
	bh=ieyF/K0i9LrsuuSYL8VkAf8ZzHd2qZo59p/h1M3tTrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p+o946qiLvT9+fGLeVPzOya2PLi9cKSuGFF6HKuYNce5DscXrAI87CuUo6Fe7k+0Wc9X4EL5eIbeTygQDs3RjIa/debDgUD54NblQ69L94q5Ek42EMhuGpWaYdjtvxR5IGQq6CNfoH0kSx4qRgw8KybDHweyZPjYFzcfjq2/n8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h5iQ6lhn; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h5iQ6lhn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3zkoHBFciOCedRK4mImEiNpk1ZEuSAVnAg6jzvBjB6fKE5IWKwKka1UVrH7Q9ZIhPuE+0HWPwXyEYz3o7QsunsP3FnikdhnFDFJbe647k6A8iyWLycPeeGvFxw+Fv736o7yajbRpB+7+SDJRgGdpc68l8X6LpirxnyECgELKIH/14q9VyFD00ewoV3vJ/rwTdtevb4fy/MmZYHreONyzUurt9giaMrHP7BPxMdbZaI3mN8yTptzXQkeKrdzkWwCJ3fdPo80AqPiQYXJGvppAqx8bTlYi+qUY90pEnlLGR2EMzsQxluqlCgrWFFIkbzCZ/WH9ta/c2Olg1uw4kJKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgCvyij7lhQQz3o+rlZUM0DLLaDOsM5AsvqodayuL54=;
 b=CbooEfmsAeRw7ib8AG85oO2y3rOzJ85NKQ1fk5MKCQq5evsmHgGHE2QLawGf6bBvC2BfloZBm2J0J90ke1HXnMS4baIPQn9KvVU/cwyfChy4eTfDpT6IjL4teJcwVuFBrY6YUfXij3joUpnxpJPU/kHMAdMabLnrmyox8FQE2+feZT5hwSmdnR5f8LEK8N/tyzlGMq6FVI7g++KkxnwVVcT/JnKYEnjix0EOwOE5P+g94zHWXnVJNaNBVOKwZ2L16nuZVqv27BpCNiXbcrjOAQDHJ7Am4C2+GpheZ5bY+VFvMvT9iIdvVeEjZqyj3N4g8fyn8b9PHU4/JEgD6ChugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgCvyij7lhQQz3o+rlZUM0DLLaDOsM5AsvqodayuL54=;
 b=h5iQ6lhnCnlm8C1UeypgGPuSZWeLjA1EsshGHV32BcSdb0M9lWh3VhRHAJSVILUVs1c9jpVvcGma6Oz5/EE1RCFtfApLf+y/i9QKIAUJmSmDbjfNYdAoqyHcsuzKDp3wbFWRcgtDiM5t5iqvWAWty4lE6Lt1KYQ0hZn9i5Aqh0ymgBEGwuEpxmjspjTteTxUs3Jp2cx2ESyOtorEhH1zFbJlgtdgzQhvpZZBwSaX9LrMGV9TYvrLw8S7j2KZvcNDu9aTA9RDvFzOHRkv9g5ylrv/AazvvJXHdK5u8F+DhNb3a5ilawnLGT/kS9BmWTPl+CClgovy5JxccA9PZF2TwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sat, 7 Jun
 2025 18:00:53 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8792.035; Sat, 7 Jun 2025
 18:00:52 +0000
Message-ID: <8ce6c104-d2fb-4fed-a108-224a6113c227@nvidia.com>
Date: Sat, 7 Jun 2025 11:00:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>
References: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
 <20250607134214.GA158671@ziepe.ca>
 <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <04f52d21-baeb-4286-99eb-99edead514b8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f1e537-7db9-4fd6-137e-08dda5ed3e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFRPcmFSVnVXTE16WDlFaExqTG5RMklLMFhYTlBlQllORmpMYjdnY0pmZHJi?=
 =?utf-8?B?NFZNQ0pDdGxJR0s1M3JGaERiYkh6Q0doSHpzZHVEbXJaemcwUGozbnJwL0tH?=
 =?utf-8?B?aXJVUk85VXhNakZjSmRtc0Q0R2kvU09kS2l0Smh0Z0RLaS9ZeU1JbjFZQlpq?=
 =?utf-8?B?NGhSYTZkV3orUHNpQVBZZGJ0SzBzc3NKckszNXFuQWJoM0gvZGZCQ0ViRHdQ?=
 =?utf-8?B?Q3V1MDJ6VHUxMkt6Z1RHN1hIRGxsSEc5emJzamM2S1RYclpCOTdmaVphMFZp?=
 =?utf-8?B?Z1gxaitPVm43NDBvenREbHhqdVEzRGtCYVRBaEZrbVRlWUt0WXprdWc3K2xq?=
 =?utf-8?B?OHdyandaNXdMdE90RW41elBxMUxWSXVkS0dXVUd1ZkJOd1FDbXJHWVpJU1pY?=
 =?utf-8?B?RWx0VmxqWnJCanNmUk82UXpzQVJlUTVLR2FZNHZtYW0xdnlJZ2MzR1djNXQ0?=
 =?utf-8?B?NHVxV2FybnpoMk9QVUFaTldXK05RVlRYV1pnditvMFgvaldGWTZLY3pSd1JL?=
 =?utf-8?B?SHN6M1I1ZzFBL2Mwc1c5OVhWWUREaTVHd3JKRFhEcmh6MUVyc0NPWjRxNnJy?=
 =?utf-8?B?dWQzMEFrQ3NVMW9HM25UR1pHMHozUWxnM1UzVnoxRmZlOWo3VDQzYWcxbERm?=
 =?utf-8?B?YzRhMWhKUDN2cTNJbEJmU1JSOXNENXBSVERsVXJEaFpnQnl0c2c3NTdqeFF0?=
 =?utf-8?B?WGJ4SVBwMDE4aWZmNmN1MDlldG5kdVM5cWNUbFc3LzZLVmdoS3NYeFBOYjY0?=
 =?utf-8?B?RTBtRm9jc1VKYjZOeHBYQWlTdHFDSDRwQjY5RWtyNEJVTk1CcGtKdkwzUnVm?=
 =?utf-8?B?RGFZS1FwTWQvTEl5RkQ2QjVrUFZEc3ZXQnBNMkp6elg0ZCtkeTdLVld2ZHJz?=
 =?utf-8?B?c3Zaa2FNUjh1Ylp1UnJMU1JINUJyTFhKeWVFYkVxbGFUNEdYYjdCOFNQWnNR?=
 =?utf-8?B?MW5FRytZc05nNmhVQytpeXlHTjVqcHRnUWxPeTM2ZncxZFNBKzAva2lnQUl1?=
 =?utf-8?B?czdidnE3MXdDMlp2RG5rYzV5TmtFMU1uM2NWV2hEOUtGNXBDTllvQjIwQjM2?=
 =?utf-8?B?SERqRnRGYm1NRTVRbGk2dkhYTFdJUTAxOVRvYkNncHJTOThNNlkyb2M0MXBI?=
 =?utf-8?B?UklWcmUzc2lZVVRvblZFajBmSnRXVk0yTGlsK1hUaWFTem9UdlZUaXhjakZu?=
 =?utf-8?B?WVBpTEtZSENxREdUZVpuclpFc3lZNG9ROEhIWmRHZjduNElKU3A5eEl1YmhH?=
 =?utf-8?B?dkpMY2V4aWRsTUJhUzNrbmtESDYweTdBZnAwVzZNQzU5UVFNdWx3TGJVa2ls?=
 =?utf-8?B?Q0RMcUdVd2NmOStETkl1VjN4eXpvQk90dndraDRObHJSc3QwbjBNMWpWaHBn?=
 =?utf-8?B?b3lGcjRubnRMVWhRenoxSDk2ZXNCR1hMZjdDN2hIdTZYK3lZS29pM0pudGx0?=
 =?utf-8?B?WkVhTDVIQ0lLc1VSMS83UVZxOS9aUlRzWW82TVhWUnZtRE1UeE95K3M1eUl2?=
 =?utf-8?B?ZTcrSDB6U3c1aUg1a01RcEovWXR3ZmwxTTE0eGoxNjYzMUh0UlNCSkJuNXhL?=
 =?utf-8?B?UkxKODkzUVdQVHJKYy8zT1VMaXMxWjl3UU1vU1pDSHAvZGg3NzloaktNR0xJ?=
 =?utf-8?B?cXRSaEM1alFQTmhRenhxQkl3VnRRQ3lwazVvd3VHMnY4WUg5VDRBNzUydnZk?=
 =?utf-8?B?cjM4c3d0OUhVVWRobVhqYlNKOURxNy9NVHJPTkNueFRTdXh4dmt0R09GNlV0?=
 =?utf-8?B?dGNkZzF6ZUlzeDhYQU9SSmdNYk8yREM1RWNuYUdySkFrNnFhTVNvZjUyZ3JH?=
 =?utf-8?B?NXNsd3NXZVFSdFpXM29JS1JaSkRMQmJwcHRkZnZ2NFFVOHZvOHZ0MnQ3SFdr?=
 =?utf-8?B?dm1BRkFtZkJqeTVXRkZaSVNKUE1FbUg1R0dMOE9YNURNaVB4dE9EY2dYRng3?=
 =?utf-8?Q?31APVhN46Uc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDFYcjM0WUpHR2cwL29rakNKRDFySzJuSEFUZkxoaHozeW9UbCtDdWd6VGhC?=
 =?utf-8?B?a3QyMHdxcTBUazFia1ltVk5SOU1CcWtTR01uUVRLOUs2NGVzT3FSUnZEMzBp?=
 =?utf-8?B?ZEJGaVYyOGFyYVY3Z1JLZjIwODg1SUNwN0FGMUpHN1loTGorZkR3Z3AzcThz?=
 =?utf-8?B?MFF0aW1SaG9vSitZK2VUT3FLcHVDZklab1c4QTh3eWdRTHp3Rm8xQVJsNGww?=
 =?utf-8?B?Sm51UnhvVHJxU2wxT1F4M0xpUmlvTExXS0Jkd0RHL09uaG10UXhHTGtkWnl2?=
 =?utf-8?B?VDZvdnlwZ2tUOXRzWVFoUVQzSmhXaERQdk1ORXpQVi9PUDFXbGF1d2didHF4?=
 =?utf-8?B?OW5VU2E1dm5FbzlVUnIwK2QyenZ2TXJuSlZURng2bURSeTVlN3d3ZE0xWTBU?=
 =?utf-8?B?K0p0RUZsZEErOXg1MTNzaHR6YXRpSHdYd05WQm43dmdkR2VTL1BleXRNS0o0?=
 =?utf-8?B?QUJ6Tm4xbHlnTnhrdkxjS1hyd3I5WU9KYTZFUFdtTEN4YjVwemNXdEpZVU5z?=
 =?utf-8?B?dnYrNHRCN3Y5M0hFMXJ4T2YyaUFyNjV2SHQ1Z3R3aGdiU1hKL3V3M2k0a21I?=
 =?utf-8?B?Z3h3MFJwYVdQTnBIMEdxclNXdXNlenFKOE5jSkZKaVNCOHd0V2R1ZzQwdGdj?=
 =?utf-8?B?QjRKc1FMaVhHWWU1aTEyZDlscG8zaDRWWVFpSGhPTVJSMVRNdVZUMUtDcUlN?=
 =?utf-8?B?MXI5dHFQNlpOdWxXMDBSR2hxTEw5ZzNLQ0cyU2cwa0g2OWNOYlQveGxwQmUz?=
 =?utf-8?B?b3hXT1VSd2RNQmFyY2o0bS9qWmU3OTFpRHQzcDhVeFFYTHdGeDMzVGNIdDUv?=
 =?utf-8?B?bW9RTFA3a08wTnZENGYvV2F3VlZmcVNvenlxbjhOTk9EVFlZRnVMeXZrSmc5?=
 =?utf-8?B?ZWYwdjQ2ZGdCL0t6WVpGQjh3cEFrd0ZnNTkzQm1EL3BOZzNRRWd4RHlnWHlM?=
 =?utf-8?B?bWF2ZUhvaXZEK1VpY2h2R3pHMzhKNmxxQnFDdS9sdTB0YytrUXp6clRiKy9Z?=
 =?utf-8?B?UGJEQW5GWUd2MU5HZ3Q3SG9LMFVzQVZiWjFoUDdla0o3M0RzSVhWQkZrUGho?=
 =?utf-8?B?YUUyMi82clRIT1RsK3RzWndmYTZsd05wdnAzYVBqRXdIWDRmalZpNE96QUY4?=
 =?utf-8?B?Z0tsajhHL0ovWHpvdlZ0Z3c1ZGEwd3hycUpGS2l6NU1IeHJRWWJmOGg3cExS?=
 =?utf-8?B?anhxRS8va0djVkJSVmhDQ09LUmtmOGJjUmNCTEsxdkdNWDcvSlN0WWRQVFE5?=
 =?utf-8?B?M0pkTm42MWUzQkY5UFlsS3RBanZFanRqblVwRDdGcFUwWWRCWm5YU25uTXpz?=
 =?utf-8?B?d3o1dlNManJMcmtyZVl0VkY3VlRtbkR4K0FqNVRMODRTUHArc1ZzTHg5NFg2?=
 =?utf-8?B?M2g3aEs4OW5nM2p5RjMvcUo1R3J6a0l4MEJJaVlzelo5VW92NE5nT3dJQUk5?=
 =?utf-8?B?alhlTG9QdDZDMzZKOGtRUW5OL3RwTS93Mm16U1kzaklDRE1oL0lNYmxnaGhy?=
 =?utf-8?B?UFdPNmRNSzlqZVkzdDFnMjh6Vmk4UmtFMkpIenZFSVo1K3d5T3VBbGhqeFgv?=
 =?utf-8?B?ckNCTXp4bVJHUzUzWkxFRWpqaS83OVBkQVZ1WlNlci9yQjEzNVlqSDRBT05N?=
 =?utf-8?B?b3hTRGpwUU40NGdBOC9uMytGWnVqYjRROEtWQXplUTFteHFqRGgvS1hlWWly?=
 =?utf-8?B?K0Q5ajgzWlBjdXNUcnBaT2VXRytucHZHN3phNGtyOEp0a2ltTnpneE1xSStP?=
 =?utf-8?B?dDZvREdjemtyd2xuWXRlbjNGTEVFWnBrOHJLMjhqN0duZ0JicEZ3MXFZSWp5?=
 =?utf-8?B?U29wWVNxWTQ3MjhsckpmVE5PQnFlS3F4Z1habTNSSHBxV2REaFFWL0hVbTRn?=
 =?utf-8?B?bDBTMGVsSWE1NDBKQ25DV1ZTc0ZaZHUraFkzbDhNWkMzMzV0WGp5eUdmRjNs?=
 =?utf-8?B?WVZ6aXZQalFmcDVBWDNvTFlBanV2QkVFNk4rNW52VHdOVkVLQTkzR1F4ZVJz?=
 =?utf-8?B?eXZ6WG5Hak4xL3VJbXRVNjV6emdyZkJqYi9oRnJCRjFHUWgrT1dBdkd2dGdD?=
 =?utf-8?B?RHZhTVA3Mmk4YXFKVVBqWndWMU5kUEVxVWd6QStGTHhpdUkxZW5VM2IvcUFN?=
 =?utf-8?B?c0VuUUZscnFQcWhPZ3p0M3VSZDRycURwRElQKzMreDVYZmpWTUJ3WHNBc1lW?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f1e537-7db9-4fd6-137e-08dda5ed3e3f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 18:00:52.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/SQh2hJMTQr5bxiKFxdNNMCpaJn1IIRduveUjaIJLqVY+21iQM4NDNU1fE8JOyuuhaa0VxtDwsAd+hypxWlMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594

On 6/7/25 6:53 AM, Lorenzo Stoakes wrote:
> On Sat, Jun 07, 2025 at 10:42:14AM -0300, Jason Gunthorpe wrote:
>> On Fri, Jun 06, 2025 at 08:03:15PM +0100, Lorenzo Stoakes wrote:
>>> On Fri, Jun 06, 2025 at 07:46:52PM +0100, Lorenzo Stoakes wrote:
>>>> On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
>>>>> On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
...
>>> And I guess we'd not want a new interface for this like WARN_ON_ONCE_STORED()
>>> because that'd be... weird and how would anyone think to use that and nearly all
>>> cases wouldn't.
>>
>> No! Delete WARN_ON_ONCE and say the new global mechanism is good
>> enough to capture the first WARN_ON, everyone always uses it always
>> and then nobody needs to think about this anymore when writing new
>> code.
Interesting. This would cause WARN_ON*() to act similarly to lockdep, in
that the first instance is the only one that works.

That works, but if-and-only-if the system is kept completely WARN-free.
However, I have a mitigation for that, below.

> 
> Well that is simpler :)
> 
> I have encountered situations where I've had more than one and needed 2nd+
> but it is rare as you say.
> 
> My late night incoherent babbling yesterday was perhaps because I
> misunderstood David/John as to what they encountered in the past... maybe
> they can clarify...

I've debugged lots of production systems, often these were large HPC 
clusters and supercomputers. I've seen:

a) Long up-times, with (of course!) relatively small dmesg buffer sizes,
so that early logs are long gone. This means that WARN_ON_ONCE() is
quite often gone (overwritten). This is common.

The worst part is that if you go to reproduce a problem, you don't
see the next warning in the logs!! This is devastating, especially if
the site makes it hard to ask for a system reboot. (If you have
~20,000 nodes in the cluster, a reboot is not a small affair.)

b) WARN_ON() loops that fill up the dmesg buffer immediately, which
of course also overwrites anything leading up to the first WARN_ON.

However, (b) is rare on production kernels--it's more commonly
self-inflicted, if I make a mistake and write WARN_ON() when I should
have written WARN_ON_ONCE(), in a custom build to explore a problem.

c) Other printk-based noise in a loop, occasionally this also wraps
the dmesg buffer. Especially if a customer has done a bit of their
own "special" logging code.


> 
> I do find myself grepping dmesg to find the first warning and it's
> _annoying_ to do so, so this would be handy.
> 
> But I'm not sure it'd justify getting rid of WARN_ON_ONCE() when you are in
> a loop or something and now your dmesg is going to go to hell, still useful
> not to do that, esp. if you know there's no value to further warnings

In all cases, the ideal outcome is a dmesg buffer that includes (let's
fantasize for a moment):

1) the earliest dmesg output (showing any oddness with system
configuration, and what hardware was brought online, etc), plus

2) the first problem that is logged, plus

3) ...sometimes two or even three things happen in order to get to the
problem, so (again, fantasizing!) really the first *three* warnings
would be good to have.

So this is just a 3-element array of global warnings--not another
circular buffer, but a little larger than a TAINT or lockdep type
of capture.

thanks,
-- 
John Hubbard

