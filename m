Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A301FDA89
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584008; cv=fail; b=syEmB8PkzBybEV1RZxb6xdAdYnRFJwhiQhxrAl3MMWU2CQB70plQhv7GrHATd22o9Y9FsG3ZZEtj8qkhqFbbA4L68OWtWMIsXpQWqw2jGxDec4auhjF++QiUbyv5WplPTl+Wo/YhH2EFaj8m7nC5oTTQz7UHkQC9bsi49AaQAVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584008; c=relaxed/simple;
	bh=8y+Q6Sl7nCUj1zPerg/ke7VNmU8icUHD9VXuLyL1hnE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PmOI5diYc3VYA3BGS17T1hbuOwczwe9E/Px7QjYWdp+LzsRJvKonFZ2oss6amYUrU5VAqBwN3akoG9kdEGcNRxO7F198RnwCFq27+zGkdg6PUEssXGOlkT4rNK06Z1Qu1N41mPiyHjrAfvpPB0ODQGYAgEh35U5+HtksQE5aut4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F0zt4/o3; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0zt4/o3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdpwCoySiYL7IEllGQx5cAFs9vB2bFnc/UTZTQxl2022XgBwhwzLKb92mGBiyzGmxe67ihaNeBaij6l9hGA9FxoDIuOoC8m9YM+vfwOYTLP8qgUyTE4Xu/4FWFuAokQsLcIDQg36piPHCHOh3vtFIO+IC1jrMwUDYWHCOPozY1YWchq9lTF88xaFPywyxpUX5glTaNQpnQx5EyYpXS7od+xfrOxel0BnxrAnUgBL3A3OOOW5zb3cV1W+sW3bbPdVTqimGZhvNv0G37wCfROIPmkN2TVii2G+gkqfGPyAvHgKKEQSz4kTzEct6i/KUu8zUDKZ7udpSwtOIn32/oa2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YyUY/xhF30BK2tu2u7uRVdLevw7+L0RXNLMYa1Ms7Y=;
 b=Hz7iFrogA5XGiUlp0uf0lD9vwy6w9+P8ynJH9QyVSWqyaQkrhws2YimsBkyUQvsvw3nFVrNhht2p7nMGidDPH9qSeHHUe8NodaJHIH6QLv5FDSBpCT+/9Y1FPOGRatpZdtWKnZjrT6wfK05K/i2yqircgwRAPIIKtGJCr8h113LU54QkeQ038psLiGJspxXdAdUcLjnbfzjLzF0oHFCKGSvJeXLiG6JRpSYCysGvxTukRRguly7fzMdjAtmf1NCgc5vm5w7yg28DJbE16VyGWTyV75620bk5yxr73WbXY1erQGRknQ+9vLFPy/KuzD28JMjxQ1eZnyfNB31Gag3ptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YyUY/xhF30BK2tu2u7uRVdLevw7+L0RXNLMYa1Ms7Y=;
 b=F0zt4/o3UVrAfQDojexLdPbc6hZSHWl61/J0CTnlLQXaTkavpJj1fklvVIKgiwDm9N1B9z1/UBccT98rjr1CiaMMVshZ7xv8MU4kB6obZB2Qa/ojc0/GJCn/mVfqTnsFKTHA7IVh9nr9XZYkZ69q1c4Px0TkHzjxmyPbanvYghpMfPcoHYOtLJ5KULFieNnrbtMe2g1hWQR2PIOi0YxG6aJh4S9ueJ43HC5ddpOPm8LspLmORzZ20BKe7Av7L99H72pANX9SMZEpX83fiLC3tXMo6SUImNMJni7eORRKRj2DjztxzXw1JyhoYXsrUuQXINody5QSRBA99siE9GYJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 23:06:44 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:06:44 +0000
Message-ID: <85c325cf-0086-4e52-9156-519d98018df8@nvidia.com>
Date: Fri, 4 Jul 2025 09:06:37 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 00/12] THP support for zone device page migration
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
 <23F4206A-4D96-4357-8C81-C50A32420E9B@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <23F4206A-4D96-4357-8C81-C50A32420E9B@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2dd14b-55c9-4ba8-cce9-08ddba864752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME5tRkNQUU81M0lqdVo0ODkxdUZINWNUUHRIaVhmWi9uUUNBZVR6VW9nUFlB?=
 =?utf-8?B?amExTXY5UENYWjVkYSs5UHExRjNMTnc2K2E1bjdZWFZYSWUzUzVSaHFGRFF4?=
 =?utf-8?B?a3FEbjdjRUFLMWRuc2FpMk9tT0tSeUlpOU1lTk5oQzE1VXVtd2tLL1JqSjFi?=
 =?utf-8?B?VVRrSnlpQ3ZKcnMweitMNVViaDU5ZTY5VlNNZ1l4NW1Qd3VQRjVGYmgwcnZt?=
 =?utf-8?B?L2dxdmt6UVhJR01wOUVSZ1V3N2E0bnVJdE9RbnZSZ1JrVzFaUlY1RTJzVDd0?=
 =?utf-8?B?ZXAzSWcyWFo0Y1dKQnc4L1ZzZTN3WWZHQkdmUEtFSEgwdXdqbHcvdlpid25Q?=
 =?utf-8?B?eTl4aDhDeUxENHVKcnRPZkVYeS9SSEhQUGo4b2trOTdlakZOSUJUTUt3d29B?=
 =?utf-8?B?aUk3dGZBYkZZaExtTXFBUFAvRE83eG5tc1ltVkNKdnh4TExaeWtkYlVkWm5F?=
 =?utf-8?B?d2VKSk9SN1ZlNUJSeUpVNUk0UFk5L3FKV3lHZkNuSnRCNnJwYlZhTU9FUlJj?=
 =?utf-8?B?Nm9GSjhMUG9FWkFrOThVcWsydUNuYmErNXQvclNLUG0vSnQ0VTM0cFVsRk0x?=
 =?utf-8?B?WGZ2aHB2Y0VDRGMwN1l3Z0dQejJvRGJROGZtZEtOQzI5ZnNTYXdQeEpOK2ND?=
 =?utf-8?B?UVk1VlgrZXY2a0R6MDdBb1lqTmh4SHJXYThmYTVqYUNmZDZ2WUpCVXN3eTRE?=
 =?utf-8?B?a2RTc1MxaUE5aFF0WjN0QVNBUUtoZGUxVlZaQUNRMEJzZ1hvbVJlKzB2cGdG?=
 =?utf-8?B?eUNXT3FJQWI1TGI1dVgxOWxGZ1NJQ1JjSytmZDV6UHF1WWxEeWxZbHVPYlFP?=
 =?utf-8?B?ZnVoLzlkNlFrRjFiTTBmZytLTEYyM21BY2lUS2RVZlNvNDVENW1nNE1GNFNB?=
 =?utf-8?B?Zk42SWhTTDlHR0VTZHo5bGk2a1IzNXVwbW5SMHdtT3FNSGVsaTJiaEVuWGpB?=
 =?utf-8?B?UE5rWVZqU0s0WXBNdkZXSVp3SEZtdW0rMkV4OVRnVExxaU5vd1pJREUyMTNI?=
 =?utf-8?B?ZUdWczNrQWJzaDd3V3dZRlBxaWxWN0tyai94TFArZEZMK2tza2NZK3pGWTV5?=
 =?utf-8?B?cnp2VnRkOHd3cW4xeFoyMkZjQ0luUUVxTXBldVlvSTRIMFpFbERzTStpZU9L?=
 =?utf-8?B?SVVxdGJBTGFPVjRLZjZqRWdxMWhSUmdMZDBweHFsVjl3Mi9uYytaZjJFVy9X?=
 =?utf-8?B?K3VoTjEzQmpEbllDdUNLYjk1U3loZUlNdkc4WjVDZ3RnUkt4NHN4b3BmUHhN?=
 =?utf-8?B?ZDREZjBrTGNwZHlJYTV3dHhudnVpd2Nja20zWWVMQ3pCKzRZTlphNE9jaDE5?=
 =?utf-8?B?RG1UNmNQSklkaUx4UTh3dmpUVk1EUFBiaFZ6K1BFcmVBYUZLUFVDUms2NzIx?=
 =?utf-8?B?YjRtRWIxb0cvMXRhRVFzL2lVMWFtaUtmSSt5UTJTTjF1S0I1SjBTbUhMYTIw?=
 =?utf-8?B?TXdrRXVIMkF1MTN4cjcydEpRQy90bDdITk55ekJMc2s0MURwQWNHMWFZOE5x?=
 =?utf-8?B?VktyaUhya2lhRUVBdFEyaThrR1Jld1VNNnNxMEpEK3B3UTVWNFFjanUxc3dD?=
 =?utf-8?B?bWdsL0hSUW9VQW16azJuUCtWazU5UGtsem5xMEhleEVRTFEvcGNaZndrSzJL?=
 =?utf-8?B?ZUpLUnZZblljWUt6TXpyNWJrQklUTzVYdytzeWRhaEQwQm5WNWxNWVhNdytj?=
 =?utf-8?B?a3FOWWExUFl4anNIZDgrVGo3S0pvdDZOVkJQT0xsaEJUWWhlbWo4Y2NldGgw?=
 =?utf-8?B?MFkyRnloKzkvZzhOWFF5UTVrY3VZR01uM3Boa254dVVNZUx5allUeXhsSkhZ?=
 =?utf-8?B?T3hWM2g3TXhnWkhxUm10NzhZNnkyZ2tpMVVybmQzbGxvcW0wcFg3NG1FL3lY?=
 =?utf-8?B?K0lCbVRGL2hGd3AvUG9RakdSSXAvaWk0OG1uSjZKVWxQUG1sdkc4QzlzK2tD?=
 =?utf-8?Q?bYuT6IL7O7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmwyMzgxRWVwLzJJKzIrdk10dWdyZ21XTzlOOVlVajdVUDNxZzluWW5zNTdH?=
 =?utf-8?B?dER2ZkdjMmJHSDQ3VFltVFdkdzVwMldSeHVmcitDWk9aYVdOSlBtTFJLUy9L?=
 =?utf-8?B?OHg3SWJFQXVTeFdGTjg0N0ttelFYUllOY0ovdlJaWjhJVzlEVUp0NGFhNVJt?=
 =?utf-8?B?SVpyZlo1Z2FRaW9XczhESnBVU3VUdm5ybkFyTGt2UmUzMk5pVFRLYzdlbStC?=
 =?utf-8?B?NlgwSGlWWGk5VFdydmswNzNieVRYVjJ0ZkhFUW5ZQXJpNmFiWUl6VW1UUmUx?=
 =?utf-8?B?NEwyMkFmUmt2cTh2OEs5MXVvQ1I4WC9yc0FzYXZtTDBoK3h0Y2xkUGZDZXNo?=
 =?utf-8?B?Z2RBUWsydjRzdFlCSS92SHB0bW8rTU5JSmNhekxnTUJrcjY3aWJLZFZRaUw3?=
 =?utf-8?B?Y1JDa0ZDK3I0U2lxNmZBSW1zVUVBWFE3QVRiWmFtV2xlaCttWXV3MUN0RGMr?=
 =?utf-8?B?aVlENFpXUkpWRUtqRlE1azdZbWlBYjlOUFloV204bnJqaDIyL3lpZkcvRkNB?=
 =?utf-8?B?K0YzNzFSUEsveDhmNzNYK2JncXlXMmswTDVPQkd6UDRweUZ1OW9SL2E3c1VK?=
 =?utf-8?B?OHlOMERRVDN6K2M5UVRjbUloRTFwUEs4TkJoQ0F6djczSTFMTURDNlowWTB5?=
 =?utf-8?B?TUNBY0hJSlZqQjBmRDNIRC9vRHJUZWhOOWR4TkJDbjZoV01MTUVqdFptaFdl?=
 =?utf-8?B?QTJQTVlQaEs1K3hzVlMrUmxlTWNOeFJHck5zQnVOUWtwN2dyYjJiNTdJY1FM?=
 =?utf-8?B?L3dzdHpENkpDeTBXMFkzT2drY2VLNE8vR3RXUnlPdmpIcW9BUUk0WWg1Z2Jn?=
 =?utf-8?B?SS9SY3loelVJU0t4eFdUWkVWV25LRCtEZXYwK21RdFJLR3N2YThiMkwxN3FW?=
 =?utf-8?B?czk5KzRIMllTTmNtNHd5UytHampnbytBbDhsalk1c1drb2xOcGE5UW9SaWJ3?=
 =?utf-8?B?MVRZUFBCcmFZSzA5Vlp1dklLMzBIN1kwTm9xVUY0WHppTGlMRDRlVTlLZEdG?=
 =?utf-8?B?a0lMNHcrRVJLVjJMTWpxU01iL1RWV3lyY3gxT05oNGI4SVo3NURFQ2RnV2c0?=
 =?utf-8?B?Uy9SYThEVmczOFhiQ3J4bDhMU0l6enR2bWoyZjdYQ3VxcTh5eGhzNHZVWVh5?=
 =?utf-8?B?NVRnZlNuUEtFM3hvbktaT3p4V3pRa3kxbzdiaG90V2VPUDBHUTBpcHJBQk0w?=
 =?utf-8?B?NXpQbnlSZFArdk1yTlZGU0htbVN4UEZWQSt0SENTUVFKSXJTc3FGQ0hwQkFj?=
 =?utf-8?B?MngrdDh4Snk2TnF1ang0S3FjVGI2N2tGM1o1U1lYb3dyUUl0blFFR2J1UEw2?=
 =?utf-8?B?N0x1YWtKNzU3WXlwSURvK0ViSDRIaVhKNzFZUE1WYjNoQXRsejJPYmhtVHJn?=
 =?utf-8?B?NjdSbEMwOEZlY2QyMkg4c0xyQXMzbk5JcHMyMmlCaXFWd1lpUElnUWUvMDg1?=
 =?utf-8?B?anoxMDVBaTFKTVNxd2xwSUlZOGVjeTF2OGc2V1E3aXBDejd5SmluRENqRWo5?=
 =?utf-8?B?SDdjdUs4YUhzNWR5UnRmenV4aGQwSHZySklLZytRTTVtckltZk9tVVhFd1VN?=
 =?utf-8?B?RktSODZuQ0pjcHRMWW9JUzlsZHk1MXpjcFBBRDJPTEtoQ1RHdHZRNElZRW1o?=
 =?utf-8?B?ZFBMKzJFV1BscE1ZZHdTUnBYVkY4Q2tsL0RQckhLZCtLRjBHTFF5QVFzM3dO?=
 =?utf-8?B?dHZkR1g1ckFMRjlYT2tYSS9XQUpSaEt5Ukc5Z3BRQnk3WXo4VEwrNC9JR2Fu?=
 =?utf-8?B?TTFDUW5aQ25MY0wydkkyK2FRWDRJUk1lSzQ4dXpBNURDSVhnSzFnRFBzbFBp?=
 =?utf-8?B?MkluaDZXNmVCdStoOGNCbFdNUjRMVnBpN0FmcElBS1RyK0l5SGIwUHVoNmVF?=
 =?utf-8?B?VlJJaS8xVmZQcjI3RnBSU1RqR2FESGl3dElrVnN1NDE3eVd0b2MxVm9BSVVG?=
 =?utf-8?B?L0gwbzdndklxZXhWTXJlZWU0RDZWM0RxdGU1NytUU2Vld3JuUTljMzE3N3Q5?=
 =?utf-8?B?QWVXdmphalNKc0ZIemI4d0ErcHJpMXpOS2w3S3B2WnJqQ2tSeGVXa2UvY2s2?=
 =?utf-8?B?M0pDVUJLM21VOHJEU1NIRXNjWjlhQ1dXcDIrTGxOeGU3MHp1clpDZ3dYM2NB?=
 =?utf-8?Q?0+xKi7Bo8FM1LPhm+TfbxJROi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2dd14b-55c9-4ba8-cce9-08ddba864752
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:06:44.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E9sVf/f2q2Z9laTYbLLryyhOsnJ4W87YAaeIZFUiUrzhva/obc4GuoUox6Vs5bLkZitd9qf8iwKg0i5FJz7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059

On 7/4/25 09:00, Zi Yan wrote:
> On 3 Jul 2025, at 18:27, Balbir Singh wrote:
> 
>> This patch series adds support for THP migration of zone device pages.
>> To do so, the patches implement support for folio zone device pages
>> by adding support for setting up larger order pages.
>>
>> These patches build on the earlier posts by Ralph Campbell [1]
>>
>> Two new flags are added in vma_migration to select and mark compound pages.
>> migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
>> support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
>> is passed in as arguments.
>>
>> The series also adds zone device awareness to (m)THP pages along
>> with fault handling of large zone device private pages. page vma walk
>> and the rmap code is also zone device aware. Support has also been
>> added for folios that might need to be split in the middle
>> of migration (when the src and dst do not agree on
>> MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
>> migrate large pages, but the destination has not been able to allocate
>> large pages. The code supported and used folio_split() when migrating
>> THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
>> as an argument to migrate_vma_setup().
>>
>> The test infrastructure lib/test_hmm.c has been enhanced to support THP
>> migration. A new ioctl to emulate failure of large page allocations has
>> been added to test the folio split code path. hmm-tests.c has new test
>> cases for huge page migration and to test the folio split path. A new
>> throughput test has been added as well.
>>
>> The nouveau dmem code has been enhanced to use the new THP migration
>> capability.
>>
>> Feedback from the RFC [2]:
>>
>> It was advised that prep_compound_page() not be exposed just for the purposes
>> of testing (test driver lib/test_hmm.c). Work arounds of copy and split the
>> folios did not work due to lock order dependency in the callback for
>> split folio.
>>
>> mTHP support:
>>
>> The patches hard code, HPAGE_PMD_NR in a few places, but the code has
>> been kept generic to support various order sizes. With additional
>> refactoring of the code support of different order sizes should be
>> possible.
>>
>> The future plan is to post enhancements to support mTHP with a rough
>> design as follows:
>>
>> 1. Add the notion of allowable thp orders to the HMM based test driver
>> 2. For non PMD based THP paths in migrate_device.c, check to see if
>>    a suitable order is found and supported by the driver
>> 3. Iterate across orders to check the highest supported order for migration
>> 4. Migrate and finalize
>>
>> The mTHP patches can be built on top of this series, the key design elements
>> that need to be worked out are infrastructure and driver support for multiple
>> ordered pages and their migration.
>>
>> References:
>> [1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
>> [2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/
>>
>> These patches are built on top of mm-unstable
>>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: "Jérôme Glisse" <jglisse@redhat.com>
>> Cc: Shuah Khan <shuah@kernel.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Jane Chu <jane.chu@oracle.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Donet Tom <donettom@linux.ibm.com>
>>
>> Changelog v1:
>> - Changes from RFC [2], include support for handling fault_folio and using
>>   trylock in the fault path
>> - A new test case has been added to measure the throughput improvement
>> - General refactoring of code to keep up with the changes in mm
>> - New split folio callback when the entire split is complete/done. The
>>   callback is used to know when the head order needs to be reset.
>>
>> Testing:
>> - Testing was done with ZONE_DEVICE private pages on an x86 VM
>> - Throughput showed upto 5x improvement with THP migration, system to device
>>   migration is slower due to the mirroring of data (see buffer->mirror)
>>
>> Balbir Singh (12):
>>   mm/zone_device: support large zone device private folios
>>   mm/migrate_device: flags for selecting device private THP pages
>>   mm/thp: zone_device awareness in THP handling code
>>   mm/migrate_device: THP migration of zone device pages
>>   mm/memory/fault: Add support for zone device THP fault handling
>>   lib/test_hmm: test cases and support for zone device private THP
>>   mm/memremap: Add folio_split support
>>   mm/thp: add split during migration support
>>   lib/test_hmm: add test case for split pages
>>   selftests/mm/hmm-tests: new tests for zone device THP migration
>>   gpu/drm/nouveau: Add THP migration support
>>   selftests/mm/hmm-tests: New throughput tests including THP
>>
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++---
>>  drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
>>  drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
>>  include/linux/huge_mm.h                |  18 +-
>>  include/linux/memremap.h               |  29 +-
>>  include/linux/migrate.h                |   2 +
>>  include/linux/mm.h                     |   1 +
>>  lib/test_hmm.c                         | 428 ++++++++++---
>>  lib/test_hmm_uapi.h                    |   3 +
>>  mm/huge_memory.c                       | 261 ++++++--
>>  mm/memory.c                            |   6 +-
>>  mm/memremap.c                          |  50 +-
>>  mm/migrate.c                           |   2 +
>>  mm/migrate_device.c                    | 488 ++++++++++++---
>>  mm/page_alloc.c                        |   1 +
>>  mm/page_vma_mapped.c                   |  10 +
>>  mm/pgtable-generic.c                   |   6 +
>>  mm/rmap.c                              |  19 +-
>>  tools/testing/selftests/mm/hmm-tests.c | 805 ++++++++++++++++++++++++-
>>  19 files changed, 2072 insertions(+), 312 deletions(-)
>>
> 
> I only got the cover letter. Did you forget to send the actual patches?
> 

A script of mine stripped the cc from the actual patches (my bad), the rest went to
linux-mm and linux-kernel. I can resend if needed

Balbir
