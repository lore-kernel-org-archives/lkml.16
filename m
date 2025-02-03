Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76B17993
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738549450; cv=fail; b=LaN7+BftRMjry7hNTJHRp8UegT6aTMy+qMiWoOL3jUY8ZZVoMLhpFsgPqsAZzU+k02QNMszKl2fKc149sSuXQfnMhCS7xoQHc2a9ADF1Mji0QC8gTiwhvOhZqdP1SshRKzRyAtgAyRRdS2DII0i/s8SPAtPSQXa1V6i7TrjT+yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738549450; c=relaxed/simple;
	bh=prrODPLzqqgwEpOJEJQJBBO5HnYjWbXLV0I8v8A6i+I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L5vbwGq4sESVeVaP2XH3lL/4DhZWH0+fecNYkFoFAY1QNm/snMpJ7uc816L4ju4kRfC8URpjZrZa7/dlqVWji9+J4cWfJNrMaX1yG+3kzRYTc5wuRiedbm3ARvSI6HBKdWHR5/T2w/BB4+B2h/zhEXVA6dIGpauLRDvodFgejvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ytSiij7X; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ytSiij7X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGnPGoEZDnBsNq5ybdv4dthcMum9YpRXZ4zYwYhL2cV6wAvz42I6szbIR844anPaPie+h3fQik0ao1gRQQEWQYy4KR5ZME2YO8IpNYGXLF63ig61vxbz9ELvx/HrCf1BS0jH5mlGj1xo6jkXFNIqqX3PmiO6DtBLCvTrNLAF15hm44+iLged5CuCcIVe3nJ2+2KMNYXxz1Isnin4m9X5iLg7oQITw61ioVsbkM5e5gmVQCFF250umvX1wS0jvxsqFP91lTKsQRpnJ1p+h15/FmR7fRiI7cpzbBHLNe5xLHee6zQcKdElooTtoxwAYnQGtxNmmlqDGtz9Il11EXHhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qsVS3mDwYeGn4oLbJV2VGklCkT0ovzAXgYy6UmwiDo=;
 b=SWKEeh0PPG5tbpFWY/gbFTBQVaslVtwVz5TQgTZv2qJyUEJEXtnM612DKcS138B17WrjoyYgJ5jmkFsBo5MZc65O+CHBAaYskvvIIbDojYg1wzxiKS/qeyiPp2Y6yC+YN8SAf/2vsFo3om48SObkEiQ8+hds9ENqr1uny+zIeS42oMWmz9ineUGJ6HCRzE+mtZKqzyY3RJ0Focsan4qcCf1XFWa9RznPG5JzVIQh9pL3yuKa5kv4KzUkwPuGeUan4+T0ajEm+BA/zJN1xNdpIJjQzwGiddiKD5Nb22VrU2t32W4WYdNwGTC2LksvWkrNPtQijnJxdnmjzV+AVR5JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qsVS3mDwYeGn4oLbJV2VGklCkT0ovzAXgYy6UmwiDo=;
 b=ytSiij7XBsC2QWKAY2QXUoSSnNkj9tmqDqvrt08Nn0Um785QG0c5Ew6JGaf+6owmbI21qpfev/ejVXL+D0bp3381st2c52Q9AzBfrmdn3aRDGhmfCr4D2Dg2rtUSKC9JnEwPFwU+045ggrmG3dCjzj9UCtjlUpc4D7yBe7PYRCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 02:24:05 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 02:24:05 +0000
Message-ID: <6dfd5d11-4e95-4181-ac3a-d30c4c218df9@amd.com>
Date: Mon, 3 Feb 2025 07:53:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 lsf-pc@lists.linux-foundation.org, bharata@amd.com, gourry@gourry.net,
 nehagholkar@meta.com, abhishekd@meta.com, ying.huang@linux.alibaba.com,
 nphamcs@gmail.com, hannes@cmpxchg.org, feng.tang@intel.com, kbusch@meta.com,
 Hasan.Maruf@amd.com, sj@kernel.org, david@redhat.com, willy@infradead.org,
 k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
 hughd@google.com, rientjes@google.com, shy828301@gmail.com,
 liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
 nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com, jhubbard@nvidia.com,
 AneeshKumar.KizhakeVeetil@arm.com, linux-kernel@vger.kernel.org,
 jon.grimm@amd.com, santosh.shukla@amd.com, Michael.Day@amd.com,
 riel@surriel.com, weixugc@google.com, leesuyeon0506@gmail.com,
 honggyu.kim@sk.com, leillc@google.com, kmanaouil.dev@gmail.com,
 rppt@kernel.org, dave.hansen@intel.com
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
 <20250131122803.000031aa@huawei.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <20250131122803.000031aa@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::23) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8567b756-e19b-4ca9-35fc-08dd43f9d483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXIxOFpWODNsclVRcjIyRFBVVUdIRVVXMERucTVDNGxJb080UmJwK1FVQ3FK?=
 =?utf-8?B?YlZsMG5mczhpY1pNT2o1Ri9vMGNRMjY0THM5RngvMS9UWHZpTklEUVIyLzRs?=
 =?utf-8?B?Y1NDMnRWb3ZjcGg3d1E5WVJPcFllS3psMmlwV0JtWnBBQlNnS2ZnZFJvUUtO?=
 =?utf-8?B?MFpoOUJ6TW9Vb3hSZXZBNjdpUElRR1NRd01QT1hDM1o1cnMrSXo3SnAzdmVj?=
 =?utf-8?B?cHpYdmdjd0xWZUFCS3VnMVlzbHY0MDZEbjJpUzJVOVlYR1VSMFBZTXY4S1cy?=
 =?utf-8?B?dk9udkZYZkowelRDcXd0QjJxa1VTYmN5bnhrSmpuOWR1OVN2SnA1cmNYYWtl?=
 =?utf-8?B?c25oVHlWS042Vi9KL2hRZ0pQUGFMRkppeVJEYVd6VHUxU0lTQVZNaWVFK3N6?=
 =?utf-8?B?UkRWTEtQUEV6RjFpNDRnVXJCc09tbTBZKzNrZE5aNDNEc2pCOXJPWVBWZnFw?=
 =?utf-8?B?V3VxdWNXU1JjbmtFZEJiMFpnUWJPQ0JqVWNYbnh6NGdYYTF3MXU4TGJLSmZh?=
 =?utf-8?B?M1ZFUmVWQ2lRNytoWlpkcnVrMnU5dzV4SHYyNitBWmRMdjlUME1KNCtzWXdv?=
 =?utf-8?B?VDBJSXdCVXJEQ080RWw4dEJQaTZTeUo1NzVma3BXVXNITnFRWHJVZWRVNit4?=
 =?utf-8?B?cTZwTkoyQmVzc3VrZFhOeWowWlVwMWVua1FMejJKUHR2UitGVlc0OWJDWEEw?=
 =?utf-8?B?RE1tRi8rRTRaQ3dJK0lCZ1B4S3VkUVJ6Z2ZZYXNYWmZkOEdpdXMzY2tBOE1N?=
 =?utf-8?B?NGFhYVRES0VnaDFKZUR4NzBQVDFzWVhKcVZmczdUREthUXhPaXk4c24wbmtI?=
 =?utf-8?B?YTVnUExNSml4OVU0SGs1eHVWYnVXMy9GN0d3TXF0THUxcG9KU2F5MDY4MGU0?=
 =?utf-8?B?YVZ5OGtNV1YwSVFQME8ySVNnS1lqS0xWNmd4YXZLTHExVnZYY1BWSFN2M09L?=
 =?utf-8?B?MU1MRFVIR28zQVFpQ1dXL0o4bFVJSjBsTWE4SlVzMk1jdVlwRzlqaTJBWVZa?=
 =?utf-8?B?QkVHMWdJMVVFSndJbUpVN21xK2ZvRE8zOHl4TGJRU1lTLzkxblZoM0dZMy9w?=
 =?utf-8?B?WWdGWWRJWWZXaWpqdlhYS2NrYThEWGhlaHlJbzNaeUFRdE1kSUVCYzkzT1Yx?=
 =?utf-8?B?TzU4VlN3Ynp3WE5pbHVaZnpkeTBKRzFDZ21ZSGdIZ2RtWHhicktSM01xRWdU?=
 =?utf-8?B?UjVXOHZmVWpQOWs0c2JLamRCNTFBVTZjMUVGM2lubkowUU1WdGZVYmJ6M3Bw?=
 =?utf-8?B?d3dyNGtzc3B6Q0kxa1dvZDBqZ0RMM3NRWnhBV1BOb0MrVGVSTDFseDB2WUl2?=
 =?utf-8?B?WDVlVEdlcFBGcFd6Y0tZZXVhWlA5ZW9WYmVIdDZqcm9kOTdhcGpkaU9LTjBq?=
 =?utf-8?B?bEcwSVV4SFA5blNZZkcvaE94enhLd0pxcUhXRVhKTElNTUwrK3lzSHl5SU5Q?=
 =?utf-8?B?bmJxbTQwcVJSVTVDOTdLSVhtaFZEb3VySWJUanYwSE9ES3cvbVNFSXA4V2xQ?=
 =?utf-8?B?eStKUHpGUm44aHpySlRqYUQ5VDZCbUtFcnJIWU1JWkxoZnpaZUhKS1gzM2tx?=
 =?utf-8?B?LzJ4WGxzbm5ucUVDdHFBU2ZPZGJML1ZncFZ0Uk1DdjR2OHNtaEN5VzhsbEU1?=
 =?utf-8?B?ZGhJTWp1NlVhWWJFS3I3OFZrb3FNM09obEp6Z1FUc3NOKy9aQ0w2bDZSSXpJ?=
 =?utf-8?B?ZE5XcmlnMDlsaWdiaTczR0RFZWtwb1A2cW9hSDBKUVg0dU0xWVNrb0hMckYz?=
 =?utf-8?B?SXFSQ3FPcTZhNUEzWHZKUEdQczBzVmxLdzhoemhON2hJWFB0SWVZU0lRbUtn?=
 =?utf-8?B?VGxkWlY3cEl2Q3p1bE1TSkZPMmFqMXBjR2k2YnFhNndkZU10Vk14cXVHS2tn?=
 =?utf-8?Q?QJ/jLU7yWskSY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0JqcFBweVpzTGpwWkxORFFLWjdTZEN1UkllU0twckZ0NUs2bXNDcGVUK3Na?=
 =?utf-8?B?d0dLRnNpUWQ4VkozNm1ySnR1TG9VL3hTendMZEtzRWhHcW0xcmhzcnVyRzZo?=
 =?utf-8?B?UU9FdG5SL2lQbTlHMVJ5N1k4Q0owZVFJS0dwR1RzeEZRVTNWTTQwcXUxdUtl?=
 =?utf-8?B?TU1QVktURk4yd3RrSkEvSmpwVC9FV2ZhZ0x1czYvOHRsazc1T2tHb1BjSnBC?=
 =?utf-8?B?RktjeGZJSEE0ZHNQQ2RORktvalFTV2FsTGx4UTVCaStySkNaTEVFSXlscUtq?=
 =?utf-8?B?aWIyYStGb1AzVGlvMU1hbjJUVEJLSjlrcktidmk2OUd6MThoU2tTMjYxT1hW?=
 =?utf-8?B?eGJucUxOcFlHejBxY1dCYzBkK21PeUhycU1Xai9qUlNUOUZsdGRvVVIxRnFk?=
 =?utf-8?B?VVpnM1hTMi9GU3RTaGN3ekxyMVo1NTNSZmZMN3ZKY1NxT0p4STExM2sxcHdW?=
 =?utf-8?B?YXg5RTB5cWI3RGJoWVFsZXJSQnJtTTZZZW9WV0h2dzUvcFREZE05NUY0TnM0?=
 =?utf-8?B?MFhGQUFoS1h4VDhiTU12YTl3WWtnbThPSFhINFNvVjNRUTdGeXVCbWFyeFk2?=
 =?utf-8?B?MFU1YkpvbWJjVnFXbkRidU5DVUJZTlpodW9Td1JpQkU3aWRlVDl2dm9FZ0tT?=
 =?utf-8?B?bHgvVjAyc1dGdUh1YnRRUzV0eVQ5NWF2a3d6eGttNkw5UkZienVjSHdqZUE5?=
 =?utf-8?B?dE05WTMxd1p2MGxLVDZ1V0hnTEo4aUFjRU1pUEVyN0NWeDlZVmVqbkpISlZU?=
 =?utf-8?B?TUpxTW9UUzVMUWNxZDgySGxnSzdhRGZmeHN5YUZTRTVpeXN3UUhXVldXa2lh?=
 =?utf-8?B?K0huSy9iT2c3SUFOYmVBcXc4WEgrQjJRQStuR09xclltT1I2YUNhZk95bTZ1?=
 =?utf-8?B?WnVES29KVnd2RTN2a2NLc2xDekZYVFFSVEVSazgvWVp2RUZIS1hxN1Q2eWR6?=
 =?utf-8?B?ZjQzTnliZ2hxSFB5NTkxdkIrbWx6ZUdGaGkvQm11cktYeDdZdi9RYkJiVGlo?=
 =?utf-8?B?QzBhNkZNMzJUYURZamw1d1E2ZXhkdGdGb0R3TWFlaFpQTkcwNmpQRGQ1TWVL?=
 =?utf-8?B?MnRRdnVZTEM2YmZMRTNSUm9kU1hhaDIxa3dYNTNFM2VNWXVDZWpncnAxT0VK?=
 =?utf-8?B?V0tub1NtWEhrdU5raDFlV01EdHpUQXBHektPdHZqeklsOXIvL0p1SzdGTDk1?=
 =?utf-8?B?bFk5aTczajVDTEZDSUY1NStpWDVoVFJCa2hPODRpWDZRc1NRQmF5UEFLRElG?=
 =?utf-8?B?UUhBcFBBN2x3NTRMRHYzSkx0SWFicEdpQ1d4OTEyVmZoakZNS0h4Y0Uxc3Bi?=
 =?utf-8?B?a1RlbmUvMytYV0ovbzlDSFFibGFNZVhuRWJQQTJ2ZmtVcUJ3cDFjOUI3K051?=
 =?utf-8?B?Uis5TitUS1IzMjdYY2FxZUlmdks3RUhVdjFZZFJrZ1crVzFYa1RTQmRlNG1Z?=
 =?utf-8?B?eUhnbTJMbDQrd2lScDlyd21xU3EwMTlPcW5uWWhwRUF5WFZmVGdoTWpFUjF3?=
 =?utf-8?B?aTNFMWwwWUhIWmh0ZlhkRWs1U0JoZGxCamxIaW1XM0J4b0NDUDRFNXZHZnlL?=
 =?utf-8?B?RDhHUDNXbVRORW90UkdXZ3hPVlpJM05vVGF1dER2R1VoT09IbjI2WTU3aXBr?=
 =?utf-8?B?cU1CN3ZNYlM5d1VBZGpyS25FRVBzVUJ0aTVXQ25JemQ4c2N6VWVJR1RCbXBt?=
 =?utf-8?B?V2VvRnFkNmpJTGhjYTBwRm85Qk16WmYwQkpBTG8xd1MrbGpWMmlSQUR4RnUy?=
 =?utf-8?B?RkYxdGtKa05WUjFKTEtvMVVlN0F1NWVtdG9URy9YRDVHRmp2WXNWOWhVeGdh?=
 =?utf-8?B?T1I5cSt0YktYeWgvazJIQitzZXc1YmllVzBBcVErcmFTM1R0TTdIU0w1YzJJ?=
 =?utf-8?B?cHFtT1AxSk5CQ3h3ZzJDWTF6Q0phSFBZQ1UxMlBOM1B0dnphTGNzUHV3eEhl?=
 =?utf-8?B?b2ZMcHdxcG1SUzNObUZ2SFg3NUY3T0RvZ01hOTRmVUtlcXEveHlzSGtEMDFX?=
 =?utf-8?B?ZUxnWk9NVFY1eGliNHI1L1o1eVJMMGRzSnBoRHNVMkZPMVNUL3JWdG5PckN6?=
 =?utf-8?B?UVhVZjFveHVZejdabExHWTBZV2hkekF2Q1BpcXZOVTU4dVowWDVCb2hlVTZJ?=
 =?utf-8?Q?giNIoFu5iNtkB0NdTUTU3Ao6E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8567b756-e19b-4ca9-35fc-08dd43f9d483
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 02:24:05.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTn8WIWhKcrim86vFQ5qvjhpZ2OyiBJXKbMqWJIIF4sjTwErcV+A5xG3zVJAWNag9oD2iU5Rzn3ErL18ag6EzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459



On 1/31/2025 5:58 PM, Jonathan Cameron wrote:
> 
>> Here is the list of potential discussion points:
> ...
> 
>> 2. Possibility of maintaining single source of truth for page hotness that would
>> maintain hot page information from multiple sources and let other sub-systems
>> use that info.
> Hi,
> 
> I was thinking of proposing a separate topic on a single source of hotness,
> but this question covers it so I'll add some thoughts here instead.
> I think we are very early, but sharing some experience and thoughts in a
> session may be useful.
> 
> What do the other subsystems that want to use a single source of page hotness
> want to be able to find out? (subject to filters like memory range, process etc)
> 
> A) How hot is page X?
> - Is this useful, or too much data? What would use it?
>    * Application optimization maybe. Very handy for developing algorithms
>      to do the rest of the options here as an Oracle!
> - Provides both the cold and hot end of the scale, but maybe measurement
>    techniques vary and can not be easily combined. Hard in general to combine
>    multiple sources of truth if aiming for an absolute number.>
> B) Which pages are super hot?
> - Probably these that make the most difference if they are in a slower memory tier.
> 
> C) Some pages are hot enough to consider moving?
> - This may be good enough to get the key data into the fast memory over time.
> - Can combine sources of info as being able to compare precise numbers doesn't matter.
> 
> D) Which pages are fairly cold?
> - Likewise maybe good enough over time.
> 
> E) Which pages are very cold?
> - Ideal case for tiering. Swap these with the super hot ones.
> - Maybe extra signal for swap / zswap etc
> 
> F) Did these hot pages remain hot (and same for cold)
> - This is needed to know when to back off doing things as we have unstable
>    hotness (two phase applications are a pain for this), sampling a few
>    pages may be fine.
> 
> Messy corners:
> 
> Temporal aspects.
> - If only providing lists of hottest / coldest in last second, very hard
>    to find those that are of a stable temperature. We end up moving
>    very hot data (which is disruptive) and it doesn't stay hot.
> - Can reduce that affect by long sampling windows on some measurement approaches
>    (on hardware trackers that can trash accuracy due to resource exhaustion
>     and other subtle effects).
> - bistable / phase based applications are a pain but perhaps up to higher
>    levels to back off.
> 
> My main interest is migrating in tiered systems but good to look at what
> else would use a common layer.
> > Mostly I want to know something that is useful to move, and assume 
convergence
> over the long term with the best things to move so to me the ideal layer has
> following interface (strawman so shoot holes in it!):
> 
> 1) Give me up to X hotish pages from a slow tier (greater than a specific measure
> of temperature)
> 2) Give me X coldish pages a faster tier.
> 3) I expect to ask again in X seconds so please have some info ready for me!> 4) (a path to get an idea of 'unhelpful moves' from earlier 
iterations - this
>      is bleeding the tiering application into a shared interface though).
> 

Hello Jonathan,
Thank you for listing all these points in detail.

Agree with you all the points in general.

Very hard/tricky to find balance. for. e.g. if we are slow in finding
hot pages with more accuracy, we need to store more information, on the
other hand prematurely moving pages may result in ping ponging.

So may be we have to balance with moderately accurate information, but
at the same time optimizing such that we avoid redundant scans from
everybody.

Thinking loud again, apart from slow-tier optimization potentials listed
above, I also hope that we can provide necessary information for NUMAB=1
case, to get it to know more about hot VMA's (Mel had pointed that 
identifying hot VMA's helps scanning long back).

> If we have multiple subsystems using the data we will need to resolve their
> conflicting demands to generate good enough data with appropriate overhead.
> > I'd also like a virtualized solution for case of hardware PA trackers 
(what
> I have with CXL Hotness Monitoring Units) and classic memory pool / stranding
> avoidance case where the VM is the right entity to make migration decisions.
> Making that interface convey what the kernel is going to use would be an
> efficient option. I'd like to hide how the sausage was made from the VM.
> 

Thanks and Regards
- Raghu

