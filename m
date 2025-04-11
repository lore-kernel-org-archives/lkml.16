Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE1E27CCE6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351342; cv=fail; b=CGfCup4w+kVI0tyLzNRXInN0FE4hQ2Gd4PXBP8X+Drhjq4JHE2c7oI7WXGByRwHbSZ4Uk2Km0fDv1AkD/ymeM3KoLyzfH3E4cvUpV/F41TDrC9GzX3wd98p63X6J4U8ESjiUZ0id2i2x/rUHDraBxxlnXTNrDVx/jvuNfZ6GSvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351342; c=relaxed/simple;
	bh=F0iGmoq2jVNrs2SxrNbm/lNVhKEU60lDyoyHRAv6bKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cb6Ljprc1c8VGjY+wneAFQNO5oBeWYMPbpmWzDzR5eI4gAF01p6gZgMFZdxOWvhQ1ILT5tDNAEd6WjdjhcTGs0kYh2KZ1o72M7xHIFyVNRTZUEVIuUEOf23sM9YEQz6IX4SHq0kklEpQ5/OZUOp5fA4Yeilq5sdlu00R96li/iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o/0WaRzS; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o/0WaRzS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pr2Q7kvLkDKB8xYhfA7l6mxW7yV19WOlVkwoS+68bdDw96VlMssci3DBEeGpSzQ6tbzrX60nKF+AXuNnCdV3od2L7z8Hm/nZywPt8vDXZz2UR4NWGsqfTvG6TgXwwDyA0m6Njn2LQ6/y86aOA9tCdOc4gsJh+bzkaVhXMVmAs9D6uHgNVxVOXxEOW2nnhk/F6qtoYqtOsAjtO83twEcZnIsT1GYY0v4LvIY9lh5jiZvpR1pr4vrNAt8yLsnmKqxY8oT7/zLi1+oY8aGLTLTMP6Pcn+Cd4oxNUo3CCYkd3MiPljppTAuJAIM6Pi6YtNTw9+F9NVjcx7zPyxENbJZ96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN2fg1wdaWnAWf8dXMKy8WPe26kxWc1crenTBjWJb70=;
 b=JskIAfjPzCFjlOA+wMtjYgGI+UMmY1a8MYL9C4pEs7FDR59zSRu7x/ItdIIB0oH7HGMBz34glf/fQJGYPAWj426Lz+p2oJP4a1/i2A2l4drUBiILW8VzX+2sNVua6JtMhSlvhDtt4CPxzxMHMDpM8toeOy3PGDUpwHufUIkhBcQ4X3wZ85biuAdQ0wiIa6tEkaKePYkC1gKBt9+sjPN5jC2ZJBxNdHNEhB1GMF+iMce3awFh8SZl2OaEy6ODe3z4SvB71q6fQenRQfv5+LByqN9Xv3Yaqa8vHpiar/Ri8ZJrwMbo6fuAD2JfNtKwwBhAmM1MZRQ8a8mBpvhS9MNOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN2fg1wdaWnAWf8dXMKy8WPe26kxWc1crenTBjWJb70=;
 b=o/0WaRzSDy+QphyfUwZaYFL2YY2hk6xaKWqiYPIWv2249eBKg9+F5dQDKiYrG3GJ+6plTq38j6BVXQ3CZcJKqoYOUDIq1372Vo2yX6hRWJSpPRpqghuC10Z38biCmAmX2CXKJTagEg008JkCgN71Z54rORRKkLieh9UnBqRPtik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by PH7PR12MB6465.namprd12.prod.outlook.com (2603:10b6:510:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 06:02:16 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 06:02:16 +0000
Message-ID: <c8b2a3c9-2252-4c0a-85a9-26fa6b519757@amd.com>
Date: Fri, 11 Apr 2025 11:32:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to trigger
 free_high
To: "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Nikhil Dhama <nikhil.dhama@amd.com>
Cc: akpm@linux-foundation.org, bharata@amd.com,
 raghavendra.kodsarathimmappa@amd.com, oe-lkp@lists.linux.dev, lkp@intel.com,
 Huang Ying <huang.ying.caritas@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>
References: <20250407105219.55351-1-nikhil.dhama@amd.com>
 <87mscn8msp.fsf@DESKTOP-5N7EMDA>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <87mscn8msp.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0114.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::6) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|PH7PR12MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5bf7f1-d265-4ae4-6cab-08dd78be6905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDEvL3liUkg3Y2FkdVBSVFVJVXVlbGhZYk8wYzArSlBaRDF3NmZET050Z0ZR?=
 =?utf-8?B?SmZNc2RJc01kOThKdFZxaTdCOVJFSFV0NURQYnhGeGhKY21PVGNydkVnSXBp?=
 =?utf-8?B?UVA5MWJiNDViREgrNVBHVDJSUm1mdWJTeTBYVUxsUU4wTE9QUnV4OWhmN1NB?=
 =?utf-8?B?VjNFcUZhcVQ1dFZUMXRtc0ZQV0VCS2MyUDdPZXhXZ1JWeHd5L2EvdFZnTTBD?=
 =?utf-8?B?QWp2c2cxN016YUl5OEZJUkh1UVRkeHpIL1Q1a2NxbUlFdVhYQzlWVlhNd3hD?=
 =?utf-8?B?YmdHYTBtQTVqWmZLNG9QZ1JKcktTWkFTejl1UGpvOVlucXMyckEvTG9WbmFa?=
 =?utf-8?B?Y3EwZWExbC9hOTJCaExIWnliNFpCMDM5bFRWcmRNRU9mREY1UXN0WmtWdUI2?=
 =?utf-8?B?d2pJMGJoVmtKQmlOZHpLLytoWVo1UzNBR0t2cDBPQ2xBU2hwMHlDWGFodjlh?=
 =?utf-8?B?WEhRZDl1Yk9RaXluY3pRUHpnRWxpQktnRVIzUDNkSTRMVzRUTzJPWlJhelhS?=
 =?utf-8?B?TjFjY1ZVdGpvaWc2OUJCeFpzaVN5ZWlscVR0NXJzRW52ZDU4RGlkZEQxVEt1?=
 =?utf-8?B?czhiN1Ewc0NhSmV0d1A5UUhOc1F6ZXVZRmU4cjJTN0NzbVREcnplVUdrTWlO?=
 =?utf-8?B?RjhSd2dRUkRIaWxjMTJCV2Q0ZGl1dlZhUlZhem8zYXJ6Nm9kNXpkdXQvVzUy?=
 =?utf-8?B?SDg3UDBYT2pPMDB2NTF4cHhxaSs4MTRHVW9HUEdkSFZSb09oV3NYZHd6V041?=
 =?utf-8?B?ZjFmQlh2S2Zyd1FTdUR3QS9UWWhqNWN3TFVyWTF2a25wR2M4bkxRaGR3NkVl?=
 =?utf-8?B?UzJTZC9hSngxa09aS2RkMjg1dUlHVFNRMWJVdGRuYjBuMFVLVDVPNjI5MFJF?=
 =?utf-8?B?Z0NacGJVc056U01NMUFrRjg2RXk2bmRFOWtBUm1HWGI4dWxubmgxOC91cWZw?=
 =?utf-8?B?VHRiRGlOTWU1eXdRN3hPYkZqVlAya0tWem5id3UrWnc3Q05hdDk4ZktQN2M0?=
 =?utf-8?B?dDRhWU8xWER2Tlc2OU04RkhiejZQZS9UVWd0aUQ0TkVTejRFUldwaDQ0Qnh6?=
 =?utf-8?B?czdBamFGc1E1akloblBJclNmWi9NRFFtYkFJUGdZSmZObHlYVGoydkhuaTRW?=
 =?utf-8?B?a1Z5SnZFOFl6SFc1QW9kaVdCVzJGYmFwNlBuWWRkWlJDNGZPemkrUzlvR1Jp?=
 =?utf-8?B?OXhydFpTcFZJT0VVTktuZEdmTloyRFVFTkhMNTFqZytYTWs1TnhqazlrVzlM?=
 =?utf-8?B?dGdiazhZZDBCRDl4Y0FjYjg0VVBoRW9pWUQyejZVUG45TTNReE95RXJWRHlS?=
 =?utf-8?B?M3llUVpKNlIrOWlMaEpEZXJNUEw1TUpXTnNxZkViZWhIajNnTTJCV2VBUlVj?=
 =?utf-8?B?WWprSEo3TXpxQ1N1UTdkd283UjFZc0xHYmpxZkRKNVdtRWU0dEV1QnI5WVZQ?=
 =?utf-8?B?WGY1U1hzVWg3NWJoMVZpdEVra1NKNGhGNlRYZFhPOEJnWm1CM2s3YkVQbUEr?=
 =?utf-8?B?ZllWbTNxTFBTdFhuYWhZWER3K2o3Zld3dFR2MGcwaFFic2t4RnpnU0VoS0Mv?=
 =?utf-8?B?YzZON2xzeUNJWEdYeUxMZUY1QklKT1BTVzdsWmNyLytlWjUwUHdDVm92R0t4?=
 =?utf-8?B?SDlFM2xhTmxIek9IRnpFM3Vna3YrYlRKZy9QaCs5bTlXaXlSYWd4Ty9qM1hW?=
 =?utf-8?B?S2pBRGd6UEwrTkxpSVF1SnR2NzBrVWFiMzVWSGFqN1BpcmJpL2hWSFRKMjc1?=
 =?utf-8?B?eEsxTXhRdHBrZGlPaXErTi9GS0JzRWdTSHhPS0UvRXFNZ2hEMkQyUDVpNjBv?=
 =?utf-8?B?eDNFMEc0bmp5bWIwVkhZQzk0ellKR0pDU3NLNVNBWWJwWkVVOVY3Yi9FYnh2?=
 =?utf-8?B?UFpRRmRrQlBVMTJzSlNDdyt0QWpKZEZIdngxbmtJSVpnNDNaY25EdTkzYmlx?=
 =?utf-8?Q?cSjf6CrhvUg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy9WT0FwZDg3ZE4vYWU0SWdQQ0NGb2ppU0o1ekgySUxXU1VJOXB6MTAwNHEr?=
 =?utf-8?B?dFYxcUQybzJhZGlxQ1hDYVo3RnZhZFE4dXE1TndDTGNpaXdTVjZHTWZ0Tkdq?=
 =?utf-8?B?V2dqWnhyT0VvL3RicE90TmZ1MG1jeXJWWDN3MnlGV1FYN0Z4R3pRdmlYU3Vv?=
 =?utf-8?B?Q0duM0lkSm56WmVPN05xL3pVdm9oeE1NNE5OOEhsV1pDYncwRGlEMjRGYlA1?=
 =?utf-8?B?ek5BWFBXWmF5Y0gycldneWVodmxMWDRuZHhNMDd4SThFNXEwTWNXSloybTRt?=
 =?utf-8?B?WjhFVVBWb3Z6ekRTbURDSzIrR0pLVmg3UDVJUFM0WmR5R0NacEQrRW80ODhw?=
 =?utf-8?B?cUJmZDFHQzlTbW1obFdHVEtuRDYvTzkxL2NCNWZxN1l1bW1HV29JNG5halpS?=
 =?utf-8?B?azJvL1NVeWhuS0RwREpQV2h0VmNRZnMxemxPVWYyYm1BRGJYV2k1ZFF4WGFV?=
 =?utf-8?B?ZEp1SW5FVFR5OGFJaXBvV2d2WEU4OVI1NlNETmFZV2dLS3B1amU4eG1qMVg0?=
 =?utf-8?B?akpQMFVGWk9ORGxrWVVyV2ExSm5DUktnWDlLSXF3OW5iK0hMQ2p2VHhtbzFK?=
 =?utf-8?B?UDJXMW84d3dGTXR6amxZK1lwTkpQREx3Y29sUXF0cFJjQnBiblVTamk0UXVU?=
 =?utf-8?B?R2JZK2lrTWgzeVk1YnhvUStkUm5hSmJNL2plenROakdkc0VWeWdQTmRzUlB3?=
 =?utf-8?B?SnNPZHdxVmRlZGZyR1g5elBLUkM0SGNDcmZDT3JhNXZ1c3NBQUp6T1pROTlP?=
 =?utf-8?B?TTZpS3ZialpUekxOaTNvZGwvSGNvQlJ0akVVelArVFhua2tISTZ1U3ZBaEo3?=
 =?utf-8?B?c1h6Y1ZxQjFpbFpHSktsVWoxVThWUkxLRW9uSXQxQ3RJK2pDVC9oak8yR2or?=
 =?utf-8?B?MXNVdjdjb082MmZjdEtHQ2d0NG9NV1JOMXNKVUd1MEpwYStoYkJXczhkbnZp?=
 =?utf-8?B?M2xqMjZDSkxYeTBmUFM0dU1aYTQzTlhscjBmeGdKQmExSTQ4aEpqazU3ZEY1?=
 =?utf-8?B?NE9KNTJFUGY1a3QrRDJUYUYyK1RmNnBGc0s5clpnVXpNZDFsN09DN3R5RHhm?=
 =?utf-8?B?a0w4dHB6UVJqOEtYUnh5aDFoKzd5aFg2QjIza3Z0RUxqMmh1cUVEWVI1MUIx?=
 =?utf-8?B?b3RjMnlyM1NVVmpyd244ZFFBYnRYYk1TWG1zdkpZRWphbGljbEF0eWVDeFZE?=
 =?utf-8?B?OVgvWitCUWppdzRPblh1M1NjWG1QUzVlQnhmUU53am9oNlpLVWQ5TXlMSWI5?=
 =?utf-8?B?WnpmS3h1aW1BbDQ5N04vWU5VNTlXZEVHblFjeGVSckZOMzlGMWtRaVNXakNy?=
 =?utf-8?B?YzFYaGNCNmdOazdvM044VERWZUxDeWhaWS9kYi8rNFl4R1pKZHlDZGs0YlJM?=
 =?utf-8?B?MjhDU2oyRm9EblVIcVhTbGFGaFdmVllPR3Zhd1BUelI1Y0dodHltbGFyV3pC?=
 =?utf-8?B?V29hR2xkOXJxTzFLQzJRbHJCV1BrbkVHeEJUUHk1ajVrMEJIc0tFRmlma3B4?=
 =?utf-8?B?aWJQWmVwUDRPMU44bXliMENlSkYwYnk0TS8zWXI2MWJPR0tiakYyY0MxNExR?=
 =?utf-8?B?eVhpVXljVzR3cVBRYWNZS3lpNGlGVk9EVlBVbklTTVNBcG9KMktaczR4aUow?=
 =?utf-8?B?Y1REVEdMMDMvNG1EMEh0dUdQS1AzOVBpejdZeVh6dFdJQVUvRUU2THpCMnd3?=
 =?utf-8?B?eFpXdURQOEVxNUQzdDRoUHVBRGY4djkwUHpGWXdxWXVibVhrbmFCWld6ZUV5?=
 =?utf-8?B?TE1UT3gzVDRzalZ4R0VVMlVlekxNOVhrS3VRR1hES3FzMmw3a0dlNWkvNzBP?=
 =?utf-8?B?RVAzU3lXVzdBM29lc29LdGlSdE4zTzhhTWNvemtCTVJmcUNKVkpPbVQrdWhD?=
 =?utf-8?B?M0tuS05IZGxUQmpqbXR4eG5GMHhPZkhzb1ZiZXBZTTdpTnBQaHE2aVVPYlBn?=
 =?utf-8?B?NStNNU5Fam85SmZmeHhyUUpIYm0zVW9oVDFBTmRhZ0w3QXEvQUVnc1RwRjhP?=
 =?utf-8?B?STY3MG9DbFlxNU5jUFVhZWIwOFJpc0JPbCttY2lGbXVEWjh4NjZhVnc1eWN4?=
 =?utf-8?B?aWVTeGxZdEJYS3Z3bEdrOVh3bXhFNGwzblBlMitvZzIyZ2tldGYxVzRmZEM2?=
 =?utf-8?Q?Uw07vCcKMJscVfyH1VRydsupO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5bf7f1-d265-4ae4-6cab-08dd78be6905
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:02:16.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQdnhfxPkHnLi1EvBX5PR21FTDiafbFs6lA7FO2YXnb0KsQA03cqchTMs65CcGsNOVBuE6l2bEYXBl/eSMl02w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6465



On 4/11/2025 7:46 AM, Huang, Ying wrote:
> Hi, Nikhil,
> 
> Sorry for late reply.
> 
> Nikhil Dhama <nikhil.dhama@amd.com> writes:
> 
>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>> which is invoked by free_pcppages_bulk(). So, it used to increase
>> free_factor by 1 only when we try to reduce the size of pcp list or
>> flush for high order, and free_high used to trigger only
>> for order > 0 and order < costly_order and pcp->free_factor > 0.
>>
>> For iperf3 I noticed that with older design in kernel v6.6, pcp list was
>> drained mostly when pcp->count > high (more often when count goes above
>> 530). and most of the time pcp->free_factor was 0, triggering very few
>> high order flushes.
>>
>> But this is changed in the current design, introduced in commit 6ccdcb6d3a74
>> ("mm, pcp: reduce detecting time of consecutive high order page freeing"),
>> where pcp->free_factor is changed to pcp->free_count to keep track of the
>> number of pages freed contiguously. In this design, pcp->free_count is
>> incremented on every deallocation, irrespective of whether pcp list was
>> reduced or not. And logic to trigger free_high is if pcp->free_count goes
>> above batch (which is 63) and there are two contiguous page free without
>> any allocation.
> 
> The design changes because pcp->high can become much higher than that
> before it.  This makes it much harder to trigger free_high, which causes
> some performance regressions too.
> 
>> With this design, for iperf3, pcp list is getting flushed more frequently
>> because free_high heuristics is triggered more often now. I observed that
>> high order pcp list is drained as soon as both count and free_count goes
>> above 63.
>>
>> Due to this more aggressive high order flushing, applications
>> doing contiguous high order allocation will require to go to global list
>> more frequently.
>>
>> On a 2-node AMD machine with 384 vCPUs on each node,
>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>
>> Though this new design reduced the time to detect high order flushes,
>> but for application which are allocating high order pages more
>> frequently it may be flushing the high order list pre-maturely.
>> This motivates towards tuning on how late or early we should flush
>> high order lists.
>>
>> So, in this patch, we increased the pcp->free_count threshold to
>> trigger free_high from "batch" to "batch + pcp->high_min / 2".
>> This new threshold keeps high order pages in pcp list for a
>> longer duration which can help the application doing high order
>> allocations frequently.
> 
> IIUC, we restore the original behavior with "batch + pcp->high / 2" as
> in my analysis in
> 
> https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/
> 
> If you think my analysis is correct, can you add that in patch
> description too?  This makes it easier for people to know why the code
> looks this way.
> 

Yes. This makes sense. Andrew has already included the patch in mm tree.

Nikhil,

Could you please help with the updated write up based on Ying's
suggestion assuming it works for Andrew?

- Raghu


