Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0B18AFC;
	Fri,  2 May 2025 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204368; cv=fail; b=U+KWgfsnZ680sxglRapjVDpO4rvp/U4Za+41tzELKsQLv+sJhrb8dssDxifUr9sq5B/PS2PLLAuQQWYK5cLNDV5s+zKg5wOEx60kaRDr+I6jZ+p1WMCLHtSbLRIN8IgQ6r0D2ZLwMyyoJV5D8ylR4dNcoskjckj3dNFecybnbV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204368; c=relaxed/simple;
	bh=j4lp+g0DcDF64oUNh7ZjeKObgkA5+THyG1tKMiQa9Yg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uPWMFzaFbfzLYTFP0mjTuAzOa9ZSER/BHznE7W/4Gf+Sfxk7GRlVLbYpjwUHGjJxSrrlOVvW41yY/xWwNFWaLvHpGvWR+xwljNewZlZhR03r9iy94BdojUw3FsPb6iFnOi175V1I2ngzOMEyusWY8O/ZD3umGL1heptcuwGR4xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JWl8GOLu; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JWl8GOLu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI6uZ6QYL5RGA8ioYey5mFPg36qhl4Bdmi6ujYjJsgH0dMtR72cGQ9JSgSraD2RQ8ZHlazu7kBmMbSLuv6dwZVhTi0RZn1mf0nH71maKjOMuFRTjybbsxh3ARBhYkL9E8RastEf+1hhGF8urLKytHcp83bkWpVQ597IuvhgOTBSiR2x4WNtvI6UkW9AEUfc4tW72Pnx5CS9ehN85mUkjiayupfA7T3JV2HikkxE3eyRYMVoT3BevWjwWou2kLOw0x30M04ZDI/9A34f5/Ad25yxAaXQ0w4MHSihWzNHHmJL32yLS+qcDbM/cU7pCTDm89twMMSzmrqRFm0uGm20T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFOrQf4HLb8B7drpBHz4SS5gtpR1iB5DGS9GUXRfXJE=;
 b=vEZCDpgKTrJ3Gypo656st8P/iiuByqxQpbdXl0kgwChumuyjJBBJibEc2g3dpIGzpb82lUnPF/KKXG1l4su+hXIDfXf8da3LtRgDiem7wUxxm+gY83bSrH1CyFHJGcpk8xqjxcm2GzJqZyZ2Eu7ao3LJcY3jkDsW941kTyYNgw6G9hLhgWoMVdO5hD7EHfqpFuabqByWivOMyl2tkgD8GN0cVInp0saSPbL/55sdtRc5iBer6hxvSJJVz47luXvJDTTfVvTJ3nloeFx60IJjYN+nhVkPFsKLhjPHm30OI7ZKx637hug3lSB2TrpgHeGxoZYV+7jk6fzIJz8tZhXb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFOrQf4HLb8B7drpBHz4SS5gtpR1iB5DGS9GUXRfXJE=;
 b=JWl8GOLu6USaI1od3Nrcia2ZTMYM/3FJJG745QLxNa8/kYIoAEmQRygiu3CKibshex5ctjALHnUKmdkf4xqfiD51TrgSvyTksgENRH+YguYoN0+UF1CilCd5QXiJOGqea1heSuk5LyT3XgOgBYLsZYHuHvTvuzwnt9oR8gNmL3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by BN7PPF915F74166.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 16:46:04 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 16:46:04 +0000
Message-ID: <fcd9c879-5a42-4fd6-b292-8e3605fcd4ee@amd.com>
Date: Fri, 2 May 2025 12:46:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] platform/x86: Add AMD ISP platform config for OV05C10
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250430171429.1043759-1-pratap.nirujogi@amd.com>
 <19b7809a-db43-4134-bd81-2ace25907035@gmx.de>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <19b7809a-db43-4134-bd81-2ace25907035@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0086.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::20) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: 24368e98-6904-4536-dd35-08dd8998d41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUVIUUxNZ1dyczJDWFd2bWRjMVoxY21hdjRWbTh0RHRSekNMaGVieXR1MFVT?=
 =?utf-8?B?eElZd1JYNW14MmViaW9aTU85bitsbXQvNDdTdDVCZ09uYll6SXgxTnpncVRa?=
 =?utf-8?B?b2dTdm9aSEVTZnl0bU0yTDZoZlh2NHZsR2VEbTZ3TFBVb1ArZUVXOUpLZWRa?=
 =?utf-8?B?dVM4bXN1NUxHSjNOdjdwVFdQUGlLYXh1blU4dDZDUWZSbW9hYXI1Wjh6WER6?=
 =?utf-8?B?Q0J1MGg1MkQ3NEFJRExlK3UxMDBja3RoSGVJSjh0bEtOR1Bra1l6MU9lVkhC?=
 =?utf-8?B?dm9FVi82d09vcUlQQmRoTnFMUi9hY1d3Mng5Y2h6OUNvWkIyY2c5RGUwUXhJ?=
 =?utf-8?B?YXhsM2FyQnc0Y0VZQjZUQzZOOWVKL0MydHlSK3RhcmNZOExxYW1SR2Jnck93?=
 =?utf-8?B?T2prM0cyUDNHZkxKVjJsSjlMRjJSZk4wb3huUFF2VnUvalhrdElDMEhodWRE?=
 =?utf-8?B?MFZVRTB0UmlnaFZmdjZNUFdyRGVHempWdXV4cFgzRzRKcHF1N0JSWU0rMFU3?=
 =?utf-8?B?RGl1TkcvaTlNL0dnNWhnRkJBUk5RdWpCdkQvalpNcjh2U3J5NnA3andmajlo?=
 =?utf-8?B?ZEFnUUFYUkxZSlYyODY3NEQrVGE4bVJ3Z3RScVBIbS9BWGlPRFJjSTVkRUZ3?=
 =?utf-8?B?N0YreUNSd1N6NEYxOUNIS2ZSa012ZEJTRnBoNkFKOUk2YURZVzcvNTdySURr?=
 =?utf-8?B?L3dpODdqZU1Cb0FMOGRiY1lnZWhUem1LTW5ob21GNFRpRm9HYjREbE5VZ3Vr?=
 =?utf-8?B?bmhvNmkvT3JLRU83T1pXWm1wVWRONTFvSE9Zc2pTTXd3bGRyY2tLSEhFQU1y?=
 =?utf-8?B?N1NWd3JZMDBEWDNCZ1VaVkdpeE5hWmxnL0ptb0V5VVgxWUltcEkxaDRCcFBp?=
 =?utf-8?B?VXYycWYrRHdBSy9FUTZrY2toSlloWE1RRzdPYlhoNXg2U2F4YkMwQW9vMHY4?=
 =?utf-8?B?eGJEaDNHOGE5QlNqelY0bTRHcVBjc2UraURHdjJvTTR1cmJ3OG92WFNobUpk?=
 =?utf-8?B?RlBCdjkybEl4dkZQMjJsU2hlOGNTQVNOU0tYaXdDY0g1b3dGUDI5R3B4SmhF?=
 =?utf-8?B?QU9UTXl0eGlDNFYvVlludFJMTURzdzU5N1R5OTFOUlpDUmQzWklKSjJpUDMz?=
 =?utf-8?B?QlZ2OEgxcDRLbzl0Vm80ci81cFhkcUZmUHczWDlGam5MRXVNQW1kOUxzTG1z?=
 =?utf-8?B?OHQwVUkraTE4SUlUMWFXS1QxZ1ZxMFJzdnlaQW5XU0Zoc1RQSmcyTXNNUm9M?=
 =?utf-8?B?b0NUS3ZJWVNZV1Bnc1dWTG5EYlJPOTN2QnBwa0hDWS9HZXVMZnM1VGZCSGhK?=
 =?utf-8?B?RnZsOHhNV2E5ZnB0REg5RE5lUTl3ayt1dWZNek1RQ3ZpVzZmU3BrN1ZNakhz?=
 =?utf-8?B?TW15aU50SW9EZ2VLdXp5K0QxY29reUVhTmMxUE1zUnZTUjFzVVlSYkFRdWR6?=
 =?utf-8?B?eEhkNU5TWjd0bkdhUEFEZm8zdnh4cmVEb3ZBUERROGM5dHRWTUFBVEZYNHQ1?=
 =?utf-8?B?OWJMZ01aSmhXb2hyNmRDanBYcU1YbWNqTzFya1YxZnNBV2hTWGV3UG5sd0ZQ?=
 =?utf-8?B?RDZ0UXdmMGtHdlpRU0NDQXdyLzgreUc3aUtxRjJmQy9iZkppak9QU1dtMjNC?=
 =?utf-8?B?VlpLMTIrZFkwMStvK1JRangvRFNTa0tVakc0YWFCT25uRlZHK09QRDJWSnRB?=
 =?utf-8?B?MU1nM0UyNFNhbTN2SEFjYngrNHVIN3hjQk9xb0VmTUt1ZTRna284TEkrUXEy?=
 =?utf-8?B?TVBIbzRWSHVobWZSZlcrdXc3eTNOZmpoMWpmZ3hMWUMrMWRVbThiMXFhNU1X?=
 =?utf-8?B?b3p0UUVRRmJ2QjF4NU5OMFllYmg3d1V2THdzYnR2enV1TUk2aS9KM0ZIRmcr?=
 =?utf-8?B?a0NQNFJTZFQ0MTZHSnRoTjBtTGJQNUFYb2hYemhSTTNoalRHTXB3ZHMwcmNl?=
 =?utf-8?Q?WEKNgQ5vavg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wmg0WVJuK0I0KzFUMkhhdm95Mit2ekxWWUwzb1ZmVkRjOFUyZ2gralFIRFRh?=
 =?utf-8?B?ZCszWkZEU0tMVC9vSVFKQWhaUDBWUnVibjlWY09kRkg5Zjd4d1hYWituRHR5?=
 =?utf-8?B?VGtKekEwalBvSzNyT3c1ZTY2NU9scjBUWStWMHhncGg5ejhpZnFrV0xxeDh2?=
 =?utf-8?B?Y2VEbzVHTHFYcHJvUDlQTE5WRzRLbWhWb1Q5dDNtdUtXcTVGd3VqcjcxM1RC?=
 =?utf-8?B?RzFLSTlCUVEydGwwcFQzU3BnSElLRm14T09HOWVrQ0dSNGhLd1dLMjhDNDRz?=
 =?utf-8?B?WkZPUk8xQUp2NkFxS0w4czFHY25jR2lTT2RqbHllTGRieTd0RmNvUUdobzFD?=
 =?utf-8?B?eGtVQkpabEtPWGFBM0doTkNRWUVhNnZxb0kxNVBndU5UOTZUN1NyM3lneGhv?=
 =?utf-8?B?VkRFSk4zbjFhZmd1bzNaZEdGdmhlclVDdnFOaFlTNUhDL0pmSEd5TzY0NDZk?=
 =?utf-8?B?N1ViMmRiTDlBUUZDbWlreTZFQVJVc2dQTFN3TmNjN0MyZWh2NlZrNThLQSt3?=
 =?utf-8?B?Q2JDWmxSZGlJQWhjc0JoYzlidzhoQUpmSGFGTGhab090N3F3Vm9FWVhweXR0?=
 =?utf-8?B?b3QzejhaYkNzTFRIeW15WERSd256TWU1K1JPTldxaEdrNmEwUTNadFcwRS9p?=
 =?utf-8?B?OXdpaXVMWlFRZG43eWdwWWpJam0rLzVGMDdJTDVvaTAwWDJSVXBRelN6bjc5?=
 =?utf-8?B?c3NQcU0wUnRPYVMvY2dkTjM4dkxzc1A0UWFhVFRnRklRVHExY2J3MzhkdmEv?=
 =?utf-8?B?cHNzOGNqUUV5TDFobGpuVzBSOHFNdWlsZitnc3hkTlV6ZWhiaVVVeUk3ZTlY?=
 =?utf-8?B?MzhVbWdnYnNPNnRldEp3K1M5UlY2dGIrMlhxSHh1M3lWam44Y3FablJPS000?=
 =?utf-8?B?bE5MNy9rUURRWFFVV3dwMkpWQzdPZmRPNytZMWliWDJOS2JJeHo3QW5ONXNS?=
 =?utf-8?B?RzZEU3p3WVdPNURabHc5QkdaQjdTeWV3c1hvZHVuZTkxZnc3emE1YmNzak1P?=
 =?utf-8?B?WlcyUjd1aHdCcWRUb01Uck5CV0JGR3RxTTd2TmhoMmxVYzJueUg1aDk4b2hm?=
 =?utf-8?B?ZXJUSGtVMmRITjVjZi9BL1dWYm1SbW5TTWp4dVY2UjhYUUZYblVsZEhCd3Vq?=
 =?utf-8?B?SCtpMU9VTnJ0U1ZXSHVTT1JJYTBiem5tb2x3RmVtOUZoQUY3bnVVbVlkRnFE?=
 =?utf-8?B?UmdIREF4UWFselBMVjYrNUVMc1NucHJ1SkdGVXFlcmRjZ1kzeGtSWmVDTkxl?=
 =?utf-8?B?T05pSjMvektWWDVVaXhFRzRNS1ZvM1NHMkhWc2oxb3kzUnJ1Yk1WcU1peHhK?=
 =?utf-8?B?S0NtSnB2amZmMGpxcXpISzBSc21MRmRmZUdlQjRLRkZad3Yva0ZJOHZrb2tU?=
 =?utf-8?B?NUFnWEFlZGFVL0NxbUpvSWk4OTVRQTczU0w5SE9CdUNyLzVMOUJmTTV4bito?=
 =?utf-8?B?Nks2ZVY5S0tjQ1Q5cUlkTVNyMlp5SENQR3Y2UGhFMXJNZmxyZnQ1SnR1Wkk4?=
 =?utf-8?B?NDdGaWRRdFpTclVxNEFvaDZZc0p0b09IQ3ovZFB1czdQMDVLQnRJUDVyWHQ2?=
 =?utf-8?B?YitXMmVFa2hPTXJyNzdTaTM3emJ2Ny9EMkxEMTRnTHo4NFFHaXgrN01HeDBo?=
 =?utf-8?B?UGYrMjVBS1Z6aDNYQkxFQkM2QnBBbDVGb1lWNnB6MGk3eEwwREFZSFp2Y3pE?=
 =?utf-8?B?OE93OHJGdUpvWjBCSk1XV3RBR3ZyRW9KWDZGYVJoUVNzS0F2bG5zRzlIQnor?=
 =?utf-8?B?ellGaVQ0WmJwQ090WlRISGlaYVprbmRHamwwU0RhOWJ6Ny8wbTN0UUluVWQ3?=
 =?utf-8?B?VlRvMldHUXNtVWtFRWpWZnoyYUdBeDcxb0tMaXc5amxvYXlodUVUVFdyR3Fa?=
 =?utf-8?B?Q3dQellyTlJKczRJNk5LMEY4MFN0OExLY1lwMkJsSFlSVUF1T3dTbTE1bGU3?=
 =?utf-8?B?NVlGQ211MlZDS2kvWTZzdzlNMllPVTFKRXRCaXVYNk1DV3pvQWY1T1Vkd2c0?=
 =?utf-8?B?V1hiNzhtQklKalQrMk0zcUdqbmtBNnBmYVREeGE0UHlUWVI0Z2xYMnVpelpR?=
 =?utf-8?B?enliRlZBTGY5OEw3M1RVdGQ3cENtUUFRUTlUSGZSR3VxRld2bXRsY0UxM1Jo?=
 =?utf-8?Q?OJIbPUz6Ab2g26r4T7DY0QHyY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24368e98-6904-4536-dd35-08dd8998d41f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:46:04.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEPJC5/3V0lRYuQ4722qI/8LTnPIQdykVsQXRZ+yCoQwhkYs9LW3eZouqG8iLWvhbVupnUnY4ei0Niuu+ojVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166

Hi Armin,

On 5/1/2025 10:50 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 30.04.25 um 19:11 schrieb Pratap Nirujogi:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v7 -> v8:
>>
>> * Create I2C client instance incase AMD ISP I2C device is registered
>> prior to bus notifier registration.
>> * Remove unused and duplicate variables in 'struct amdisp_platform'.
>> * Remove global variable 'struct amdisp_platform 
>> amdisp_ov05c10_platform_config'.
>> * Remove dependency on CONFIG_AMD_ISP4.
>> * Call software_node_unregister_node_group() incase of amd_isp_probe() 
>> failures
>> after prepare_amdisp_platform().
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 275 ++++++++++++++++++++++++++++
>>   3 files changed, 287 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/ 
>> amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>         This mechanism will only be activated on platforms that 
>> advertise a
>>         need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal 
>> processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/ 
>> amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)              += hsmp/
>>   obj-$(CONFIG_AMD_PMF)               += pmf/
>>   obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..6164915d8426
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,275 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", 
>> ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform 
>> *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
> 
> Since this function can be called by the bus notifier and 
> i2c_for_each_dev() you need to protect
> the i2c client registration and the assignment of ov05c10->i2c_dev with 
> a mutex.
> 
sure, will add the mutex protection here and submit v9 shortly.

Thanks,
Pratap

> Thanks,
> Armin Wolf
> 
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", 
>> info->addr);
>> +             return;
>> +     }
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp 
>> i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct 
>> amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +             if (ov05c10->i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp 
>> i2c_client removed\n");
>> +                     ov05c10->i2c_dev = NULL;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device 
>> *dev)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!ov05c10 || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(ov05c10, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform 
>> fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client 
>> instance */
>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");

