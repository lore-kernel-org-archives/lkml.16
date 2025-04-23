Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561ED264602
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390445; cv=fail; b=MJjaJpSi1qHO+cxAsFBSxJi1ym7o4mLmCVVH8hQoeWIQFH6L3XSSYKe3Chi+GUjHG3G5Kfm3Fu8Bi9g4qctyEdcVfnFraKevjKwrkyfVElPLiCJ87aM3q1okQDJiNbuZccxf08FXmH8D5iPi+ONbMJ3XclpaakmyebIeevafNeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390445; c=relaxed/simple;
	bh=eGR/NXKdvMCiEvPomh/Sj8gwsGYRXj3mMq4VvgZddMc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OF9Z8kgusXeUnVIfbFNrbz+A6h++rLZDse9iRpU9kjLN37j2KECADtAaMLKWCw80AruTHXBSsQbABsCzSYRV9P28iXOXlhVZHGzdTfaFRDn2rR6axw2eJGJ77M3kGzoAy2Y+seiyrCyNdhPTuaYpbw1nDdW4V7xY7pziWE1ipaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DFNJjrHM; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DFNJjrHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtlCmRtUIuH/cfcxEU1NkGVTlkXxl4oMZb/SpJSfX5bUoq2dehTtoJKLAcU79HkuR/qmAKjwg1Ddc5VISMontZxDhc839t5vX7+a73EHSa1m5f6WZwNL3UnBlNLKWm2+c99Rd0F09TK1gLVbn2sSmJjqWbCC0S5d/QBDVFlzRssK9dobeVIvhGMxSov5SRqFOGNn55pnbOjUU0r1dHh9jwNW/M5XnmpeCI+8g+DuWw2WwHwDcMnGvD/XykO4DpuUAWXfB5zH4WSac8bxRwBDK/bK5JG3MbIFghsNhu2gXolLrD8TVYr5tTx6+WItWmMp+9JC4jm2OaRwgRx4Ez6G8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYVC2jeYFZMGgcZ0J77KdMT5XzBn+wn81F4kuzUQJ/c=;
 b=UFbHHl7Hrst4NrpyfTi8EvcHoycfHUIemPunFTqAx5aJKEyY4f9GV+VL3x7btk33V77kAi2nV3tvboN3dYIeJ8rdvmTjnsldG0joAh6IkfgOBmAexBFvQ6BRK4MtrPkC3w1Z6Wu9w2BMZ+WzCG+ZqoO0sdnFZkkyXe1oVYafz0+m6yX6iEAxe9cS9RuTO00/AWx0l3lfU18VDk+Liu0eOrZxiRA0Xjhtl0s9ZEGEomP5B9IVFHOrftDSRyXOFYo5ZYcoWucFnbyFVPXHV+3o10nBhtr1QQwfpRr7UeRC0PaD0A40H6+yRoWbyfqvVvxQk5b0PvP8jioQE64b07DfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYVC2jeYFZMGgcZ0J77KdMT5XzBn+wn81F4kuzUQJ/c=;
 b=DFNJjrHMeWDclIcVfogQQPRxAaymfkztQWHf4qv4g2ECD9p+M4fhtMz2RNh6/E9u/T8xx/jwxtByv+G6bUbE0k592aebhytr8Dm3psEVrAORZFPSh7jOjO/TbI/p+EiDdMQRC5sS2a7EiORMh1iS9K4Bu7fxA/x6+IHYpwVlnDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 06:40:40 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 06:40:40 +0000
Message-ID: <35f08d6c-cc90-43fd-a24a-195b5d0e6d32@amd.com>
Date: Wed, 23 Apr 2025 12:10:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com, kees@kernel.org,
 alexander.deucher@amd.com
References: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
 <ad725f4b-6e45-42e4-ba6d-919534bc99a4@nvidia.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <ad725f4b-6e45-42e4-ba6d-919534bc99a4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::19) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: d23a437a-35b2-4e52-8e40-08dd8231c349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2c2UGxZRDNrREs3blNZczcwME1laDJxaXFzbHhCWXNZczdKdkZlb3ZCMG10?=
 =?utf-8?B?bGMxcmU5NnB6MFJQOHZVTFZlMXlGS3VPbjZqNmpvZVIvaHpFZjNXMHhxbTBv?=
 =?utf-8?B?YlBkV2hBdGlSNWd1Q2g2MDFRMUhHT0NhZi9CRm9vK3lpTDNHU0lQeC9SR2Nu?=
 =?utf-8?B?UzRmUU9OS2pNRXpiamxsQ002OXBwZnJHWmZJMlhJTlJESk5iM2c1cU1CVCty?=
 =?utf-8?B?NlMxU0FxajdjR2lHUnNoZWRBZ3B3dlpJSzJ0OUZKVHRpTVNqMGUranNHSFBS?=
 =?utf-8?B?OGR3dXpKdG5SRlk4SFVzRzdZUDNZRFgzYUZKWWtvV2FxZ2ZoRkk3YlhFTmdB?=
 =?utf-8?B?ZmdvZlMzQjVxMjBQL2Y1K3ZoRzU3TUtOT3lXNmVvWEEyOGV4TkUyUWZGOG5O?=
 =?utf-8?B?QUtIRlJkc1RBWm5UcGErNGFkd2EybExERGxIemNQckpialh4Mk8zYkVpVGJF?=
 =?utf-8?B?TTV3TWZxQmt5SzJ5TlU2b3NWYm9PMkhNbzhTU2NuRno0TC9jZ1dmMGlBVmoz?=
 =?utf-8?B?Zm5UT0d0QVhBaGM2UWlNRU5sblQ2SjhYR01vVU5kV1JzN1daUXpCU2ZnSExF?=
 =?utf-8?B?Rmx3ek83MDI5SUZFVVZ0N05RdUdJMnp5WVRXZiszNWRwVmIxN2hrb1R1VWJz?=
 =?utf-8?B?a1EyZ0VOcWY1N2lCcm5zVnZsYy9LR2wvU3p0U1M1WDEvMWlDNGxSTCsrLzNH?=
 =?utf-8?B?SWRmTHJTTk9FemZKN2lGdnNqRUJGWnRxMzAxUEk3SmVFYkdpUkVKR1RTZTJT?=
 =?utf-8?B?NGV2bGdQQVRkRFVvOVpOb0haZ1Y5d3JnYzAyamFGRnhVczE0SGNic1RCeWZV?=
 =?utf-8?B?andoNlVmOFZZM2h2ZVYvR0xlcUhFeHZUZkpzeXBlaHYyU1BCK1Qvbkl6MHpM?=
 =?utf-8?B?akFpY2FINmdqS2grSE1TUE5PaXZrRERTYUJjdE5TYVVSU0ptaGJ4c1E3Z0lD?=
 =?utf-8?B?TlJkTGhCaE1OMnRrRTB1QWR1NFVhRXNoM2xMR1F4MG44ZmVlQlB6TUdXeGU0?=
 =?utf-8?B?RWlVbWd1K2ZnK0ZHRkVvZW5UbWF4ZDlMb042c25IdUw3RVdOT1dNaXZSdnFB?=
 =?utf-8?B?WGtVNUVvTkY3cjFZWURUREMzUHNrVXZMdzBKQkFQd3RlaHJaeStTd0dzVXQx?=
 =?utf-8?B?UTlMZEROYllHK3ErRWVyZ25ycUU5MDJXc1QrSVZUT1ZPYURaOGdwVlZ4ZGow?=
 =?utf-8?B?Z3ZSYk5URTc1bHlSN3RTVkVPQUs1clB4MytxcGpBV241dnNRWWs4VFFxUmZJ?=
 =?utf-8?B?b0hiU09VYkI0dGZvSE5IVWhmZE41L1M5amM4M0lkWGQvVlQvQk5IcEhoWFhh?=
 =?utf-8?B?dCt5ajVnQ1B1cHJuOG1pbUpqZGpGNytDWmdCZm02SmlwSGdsRXhKWDlDcUd1?=
 =?utf-8?B?Z2NpSElDVTh3dW1kWnI3VUg0a2F6WEdsczdINENITFRQZnlIOEVleXNCZG1B?=
 =?utf-8?B?a1JnYlZ3VjhJdjNrbWduN0dmUEwxMzlWVFhvSW9TeFpWMlR6T25nQ0FkdVBa?=
 =?utf-8?B?ZTl6enlzK2hVWkJ6SnRSZGM1bEZRRlhJOWkvSmlnU0R5R1FmWTNzR05ueDBy?=
 =?utf-8?B?Qkczd0hnYzFkeVdpTkI3RmIwMXNlTDJjY1Jxd2FvSVE5OTBUQ0pVbXFlWVlZ?=
 =?utf-8?B?bDRUY0w2R1c2allLa3VBSm8xdjE0TmFhcGViSVBGM0tWUlc2blNDdkJjU29N?=
 =?utf-8?B?T29xUTZ3WkZMWWxqYUN6MzJGZTB0ZVVlZlQ5c0cxb25sKzN5dUZuRXM0MGRi?=
 =?utf-8?B?NnNFL2VxVzlHUkdEeUw3bVUrM3luM3lETzFzclJGMkdsUTlwcm9NdlI1MUR6?=
 =?utf-8?B?Q1BxaS9TbTA2VVYwQ1NJLzJtYlFabDh2VFJaVkxGU1RWZjhCQ0Rrb2ViOXFI?=
 =?utf-8?B?WS9MWllkdjNvS295QlB3aVMvbzhCRisvNys1OTZLUWxoQnQ1UGFLWWlQUzdQ?=
 =?utf-8?Q?acdp37CF1Co=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejhqMjMwTlkrblBBOFRxekpkRHFzVy9HU0gyOS9hK2FIWkI4QVZabXpvaktB?=
 =?utf-8?B?TThTS2o2YXNraDk0QUZyNytYdGI3dWkyMG1jV2FIQzJXV1B3VkRkK1Q3bmNp?=
 =?utf-8?B?bmhpSmszQzBaZTdHZ29sYzFuVFlXRjNuNjR3VTFhQ09DQXk0VkFwTDJwNkF0?=
 =?utf-8?B?N3V3cGpwY3V4TSs0TzFXbnJzSUxtWHZpUlhXamozampMZDVIQnRsd2hJNWVw?=
 =?utf-8?B?OUNjeTdNK1EwbHYzZW5tdC82RCs4V2pBNmJjMUQrTTUrdmRuMnNtblJaTFF0?=
 =?utf-8?B?UmU3ZEJsVXBQaCtqU2U2VnFLaC81Z1FZS3VkTWkxSUI3WGVmNjVZclcxSmsv?=
 =?utf-8?B?VTVndmllRU9DYTl4a0RiWlkwNVZ5ekxqY1MzVTBZeVM0ZVJBSFI5bE9rdVlC?=
 =?utf-8?B?NTdZcUNMWlpUNS8wWWRzU0JXcUxKUG9wWHdxb3FFN1R1djBCMk0rd2FaOXB6?=
 =?utf-8?B?N0U5T1gwTUNvUU9Ib3pPVCs4YUNGc3BBRmtKRUhiKzE2cGxyUlR5aWhIcXJr?=
 =?utf-8?B?bU1QSXN4YkxuU0xMWUdjL2hvWjVvb2RMRE9uRk1JcEg2SGRGNzhkTTBrQzRN?=
 =?utf-8?B?NUlKQzZDWTNTL2pUZjdEN0dhbndESW9YT0VCWDAyMml6R1pGWW8rUTZRWE1J?=
 =?utf-8?B?ZmZsYnlTRFdVcmpEUWx4UzRweS9NNVVWelY4aVJTK3hqMGdjeTB5OEk5MDVq?=
 =?utf-8?B?Vi8vak0rREZSbGFQemhWc2NkNE85RkN4NDl6aGxhNkN6OFZidkdLaUs4MFFI?=
 =?utf-8?B?NGRpWkxkenVkWFVwbEgvUkZVdWNGSDR1ZmlHNFcrQ1F3Zm8yUWRoZW8zaytZ?=
 =?utf-8?B?Y2FUMnU4VEFQZlZqTVVxeC9xSzN6cVdnSU5oSk1RLzYySVhueW9ZY1FPZDNP?=
 =?utf-8?B?U09MOUhkeStZMEpPRFZOU0ZUbmVVeGxtb1ZwVWluMFZkaXVDTGV6SFA1R0Jo?=
 =?utf-8?B?d1dhNlprZ0NUTjJvbmZtclpvamlrSktpWWxXd01WNmhmSDF4NERSZ0syMkt1?=
 =?utf-8?B?TkRJcVk1U0pzTmFtdGcrcjIzdlJTdG0ySzh6NXZscGFzOHpPeTcvbUs2SXZ4?=
 =?utf-8?B?OThIZnc0SEZaSUY0cGYyb0VFRTNCTEk5djhPUitWL2hOQjdHaWd0dmJpUTFH?=
 =?utf-8?B?ZEE3QUsvUlZvKzBLanluYjE0WGRuRlBIVUNZQzdyWVdOZ1Yzd3BXYm5RYXlt?=
 =?utf-8?B?TmxPcFVTUWRYZ2FnaStrOVVUWTJKemxzOWYrT1Eydm9qT3J3c2U1WUpjbDlu?=
 =?utf-8?B?a0VHVkdRdklUcjhuLzY0QlVvWXBITkU4Rmk5dnB4K2FqN3YydWx1ajV1ZzBM?=
 =?utf-8?B?YzNyYkpUZDRBWi9EK2t1Z29FMG5HMHcyRU43d2l4Z281cG4yc1hJcjJiT0g0?=
 =?utf-8?B?ZzNBSkNYYUF2cG9Uei9QOW0vblkwK2I1KzVmMG5sNFZmOHlYcklJbTdLY1BI?=
 =?utf-8?B?eUEzWHdMQitUV21IZ1dVbGc5eUZqdEM3dTdDOWxxU2xMcmtwK2FkbERLTEwr?=
 =?utf-8?B?R3NJTmlxZWllSGJUSDIrYlRhMDJlRi95TkVySE4vY1czdDBIbmVobFpQaDFY?=
 =?utf-8?B?VlhrdUxDaE4xaU5QK3JFRUdlZ2xxYUJ3VG9oYzNocGtnOGpjbjgvejJTU0Jv?=
 =?utf-8?B?bDgzdVJuQUovMTg3QWdHZlB0VGlyMnAxVGZrdnJLdFg4NC9DbThiVkc0QUF6?=
 =?utf-8?B?bWk3VHBySjRvVEt4cEs1UW9QanFDeUJTekdtdk5nTmdRNDR3UHVYSFNNN09I?=
 =?utf-8?B?TzVnWVhGeEhzd2w2L1J0ZStleTRvdS9kb1lGYjAwQ2kza1VMV2dtNGU4Y1I2?=
 =?utf-8?B?cE9uakg4M2hQVDlhQ01qYXJYN0dWbENwZW1VUDdWSXc1cGdIczFRVGM2dy9B?=
 =?utf-8?B?U05NS1o2ZU5rQkU1M2E0MXJsYzhPR0ZSZGlDQkRndktWY1ArUGtkUWFIZ3VD?=
 =?utf-8?B?ZUt0Q2FnQUtDREtva0cvYWpvSjZFOVZqcDVRS1VhSFE2clM3WGRSVS8zNjFu?=
 =?utf-8?B?UHZUREhoR3VJZEMreVpBTE1nU1Z3ZjhHVU5tWG5yVUI2aVltSDR4WUtuNFdC?=
 =?utf-8?B?cXdLRVR1d1Job3FuL0JzM09BRU54V005djlDUmlIODE5MEt6elFtdVo5SVVo?=
 =?utf-8?Q?JNKhXqxsq6N+oDPjqsYKVxSxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23a437a-35b2-4e52-8e40-08dd8231c349
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 06:40:40.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSpo8pxRAf1OBny8X4a28DYdLveor/fZbtlKQGKqNrx51Ahc9U4VeCMmYHMN4til/7fgB2UzAicQQW/26QQSug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420

On 22-Apr-25 12:44 PM, Balbir Singh wrote:
> On 4/22/25 16:34, Bharata B Rao wrote:
> 
> Could you please confirm if this is a new issue? Sounds like your hitting it on 6.8.12+?
> I've never tested this on a system with 5 levels of page tables, but with 5 levels you get
> 52 bits of VA and you'll need to look at the KASLR logic (max_pfn + padding) to see where
> your ranges are getting assigned.
> 
> I'd start by dumping the kaslr_regions array.

Here is how the ranges look like for the upstream kernel for two boots:

Iteration 1:
kaslr_region: base[0] ff4552df80000000 size_tb 1000
kaslr_region: end[0] fffffffffffff
kaslr_region: base[1] ff69c69640000000 size_tb 3200
kaslr_region: base[2] ffd3140680000000 size_tb 40

Iteration 2:
kaslr_region: base[0] ff3a9c84c0000000 size_tb 1000
kaslr_region: end[0] fffffffffffff
kaslr_region: base[1] ff73d27480000000 size_tb 3200
kaslr_region: base[2] fff01edb40000000 size_tb 40

Regards,
Bharata.
