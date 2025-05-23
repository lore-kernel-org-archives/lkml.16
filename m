Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DC81A288
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986670; cv=fail; b=GI0sKRYA87jVp0UEo/4iXzjToQoII4KYNHnA7/R0ydgzDtOhreC75dgmqDeQNZwLLJLAhcrKxI9QFffKxlxCRlDlM0B6vHKTAkE21dPlUiGoEcP5l0vzET9pQbPj6HY5nMInQ2Vsg5RIOIWni47wFJGgrct1XWSQ5NJsAnSBdDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986670; c=relaxed/simple;
	bh=RFyDrHYXkZrXg/fNwMP3n4z2J2QXV2xeEasj54RgeR8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P3xUjwTbLaHb3c9Z56IK2sJABPjEUgfLzZk4ZKv96xdvDZqYnIm7zqbmennsIJ+Ycc+5CAsJjDBTNuXa4ryz20UfK6+lWEa8v+0xG+TEOzUcP+//V3XlL2ijSoCY32DdXpX9vF2iUNOqhHtoz32zLwwrAVTwcLjdbqlwj5gKm4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gbJkXnbf; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gbJkXnbf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSJ2NNCKTUnDD+2KgOGtLbnl71c5WchDqWQNYtlHXg4HVHxLLElFBJ/yB9RE87yZj/rkcXHuslXvvsjQcknik6Q1tO0L+78JDvoKL80UWRhYpvV2HmYJSh0K3RQUBHgO6RaQjMwroYykJOurFGWcXX/ByWFFVBto+FRBtP1RTGAkdFVezTh6+512Xg3PPZsls26EJtPrQ674AOAil0cK0n+rxFYKjc15qBjTEjGn9NnTETCHxqzkwdfRA9XvBGJW6LqAT87TL5FprK9oOz8kKXZWd+3lGQMVbmmreJaKo61KbJ3zC1FmIQRmcNxuKficuDKEbl/rMUy7zw330TVCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rwN82lIlPdStoh3c7HWLCAq35nR+07Mg+fWcBhH0pE=;
 b=oQNpfwGNwDIdiOfvIsdwwde0WAZS/wh/lgIxerEY257dc8UQVynO51fBUtHTIG4AGXNS6ddMCaUlZUZWWP7k8jFZDo6eRmI/SCTMyC2clcOEZ3PR/4awDfHGlmbj9zuxwWK/gbvzjQmrd7IBu0Zeo0tnkQwrfBtndJUtm7dphCgxgVf4pUGh9HptlSy7kBHqrvMGCrUCa599zIjMqUrGVQzKoxbdeokfw1rM3RIpBsjEd4xu6fzhAVNZvoMEN6Rn+O3lxD4u3l+KmyCpvVdNuMe6q7yw2FY27d2X9SxAXI0AOgekBNhUr00Q8obJLt/zjFRCH3KwI3pZIOgNmnvGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rwN82lIlPdStoh3c7HWLCAq35nR+07Mg+fWcBhH0pE=;
 b=gbJkXnbfTlUyvDIbownO9AnNOajiBADVIoxFepNkR1No3ZFWsEFdKjegzlegCap9K6z4HN7JTvQb4TUSOOK1lSdMtPvNUPA2ZqB/fJAEenSHJ99utWMKVLNWeKKQxdL1Rmhm7/Ryg7CqXZmgxdc8TetGbRPGz4rcmVmShzNDhbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 07:51:05 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 07:51:04 +0000
Message-ID: <231ebbc1-2110-4d82-b4e9-5a1b1220d9c4@amd.com>
Date: Fri, 23 May 2025 13:20:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
 <25cb53a2-f90e-4a70-9541-2aee51d71561@arm.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <25cb53a2-f90e-4a70-9541-2aee51d71561@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: be3c5908-c9bf-44a0-2464-08dd99ce91bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW5iSERBTlVBTVJyUVVOWis3NjR3T3BWTE5ob2c4dzVkSmQwb1o0MGhRZkMw?=
 =?utf-8?B?SGpwelgzcXU0TnNPYXdhT1EvMjZJeThvS0FuTCtNc0tWbUw2eWNudnFoVG4r?=
 =?utf-8?B?aW5GZGsrYk1SNXpTWFpRY2w2MVdZTTcrSERSQ2hxSzJPeDgwZFM5QUJzMUdi?=
 =?utf-8?B?RTFrYmtYK2J2M3hJcjVCa0ZsQ2lHbW9UZkY3MWFzekIzL2oxbDBaUTZoYVIv?=
 =?utf-8?B?dUJiUEc0U3oyQ3o5SmZ4aDVYQnZNWEpaNkRaendDUS80bG5FLzVRMER6YWhD?=
 =?utf-8?B?RUtJUVkyRFduOHYvcEJTWHRMRHl3V256SG9yZDFycXdhK3VhZzIraWFWWTVV?=
 =?utf-8?B?ZHIxVGNmdk1jWExpeTNjRjhpK1NVWjg3K2hoZGk5d05YSFQxZjBsRFlRNEhz?=
 =?utf-8?B?WW1kcDlJb3JkOHFXakJVYm92OWZRamROdjFNN05oaGUwZGZ3bVFYUzlKZCts?=
 =?utf-8?B?SlJnWjgwNG5RQ1I0RGxtcTBJNUNGMnU0NlBnSkVETVJGK3lYbjhMdXRHbFdm?=
 =?utf-8?B?YTdWS09Eczd6MGRyeUlvc2pndXBCem5BTFBDMHpFRmhRRTQyN01yVVp0cUE0?=
 =?utf-8?B?WnR0bkowQU1xbEQwL1JiSmd2R0xsWElUbE5EVjVMbjlHMVpDL0M1b20vVVZl?=
 =?utf-8?B?aXVqUVVPWkh4YnZPcEdBZWJVendxNWE2M3c2NHJRcVpBRkZ4U1NKOUUyY1lH?=
 =?utf-8?B?cVBsc3lObXdSeGJ0V2puVnlsYWM3VWY1QkpHakxaVWMwMTBDVmpUQnlDWXFJ?=
 =?utf-8?B?L3J5Z0NTdmtYOUNDamx2THlVUENESWU3by9mRDlqQ2RkM2wyc1F4OFY1MnRH?=
 =?utf-8?B?VzJwMXZRZFBsVzRLOVhZa01sSTdKVEFSS1ZWWjVrT0hyOHpGK1ZvZXNSUC81?=
 =?utf-8?B?NW5lNDNMSlljeExJckVLSjhkcTZ6aDd0NHlvTTQ5R0ZaM2QxZUpDaWJ5VFVh?=
 =?utf-8?B?Tis4TmpreVBYNEUza2IzdmxEWGVWZVlIdnQyc3dLYkdtd2lPYng2aW9vdzZ5?=
 =?utf-8?B?VkRINU5CaXpreDB3ajZNVGs4RlQ3emtxSzV2ME1JOEhNT0dVU2dNeHUyMHhQ?=
 =?utf-8?B?bTRlY3Y0VlV3TGlKZEZwek9ib1ZVVDZicysyQkhDVTJTdHFzaFhadWZWZkFy?=
 =?utf-8?B?WTJJVTRLazBYVHdPUndMWWs0ZFBZQ0dCcUVuOFZSRC9EcndpSHF6enBvTkdz?=
 =?utf-8?B?NmU3WnNMVE1raHM0QzIvN2I0UkMzN3pHV1dmVFk1VzZZM3UxblREdDVkV0Nx?=
 =?utf-8?B?a3V6K005YzdySmhtd1RjQjUzZ2swdHNIdng5TFZBN28rckZ3bHFYSmFlRTVm?=
 =?utf-8?B?WG83RC9FSTk0NzE0aFNTYUpoemNwbFdPcS9UdThkNVRwK0JyeGFQMC9senUx?=
 =?utf-8?B?M1VWR0xOamw2R2VvNDJaYUdodGtJZzhuZ0kvRmlnZkV1VDc5b1FsaEtGa0VR?=
 =?utf-8?B?RTBNR1hSMERLa0w0c2tJNHAwU0pHbHIxdEM3QXc5Y2VXc21hZWF3Q0VmTTJp?=
 =?utf-8?B?VnhCblZGM1QwbHRmenBEWS9sc3dsUE5iajNJc000b0xsNWs5MlVnb210OXpT?=
 =?utf-8?B?VWR1aEtaYkloOGhBam4zV0YwVnlTLzNTY2FkNDlSNXlPaUJMNWVJUFZsVC9K?=
 =?utf-8?B?RE1UbGVNdkxNSEo1Q1R3aHpON1paRjFiNVcyNWFFdUkxb2dDNXlveHQ3d29X?=
 =?utf-8?B?ckU5ZEExQ1M4a1RVbWIzeWNncXVmS0xKRmE4d3BCclc4K05UZTV0YkpScFBy?=
 =?utf-8?B?TzkydkxMb2FOdmpxbzdlZ3c3U2RCakNvV0ZsOXFSRTlFNGpDc3lGRkVsOFZJ?=
 =?utf-8?B?VHJzT2RIY1MzMlZOd2IyTnhMeWdBbkJQckRkUnUyZTJlTTRGVGUvL0ZXNTNs?=
 =?utf-8?B?ejkzMWlIWGM1UzlUbHFxRGJSZVVqUlRudUY2cEJ5SnVyVU9NSDhhMm1wWm1Q?=
 =?utf-8?Q?azyTL9HcHnw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tld1YklqOWZjR2VwWmhNb2tVQ1B0YzBBWDdPYUEvNTIrMUFMY0VTY2Rxb1N4?=
 =?utf-8?B?VUZLUis4bFg0VEFVTmFYek5ObzdtOEpMZjNIODUvTlYxbnhFdHZONjFpVE5y?=
 =?utf-8?B?VkR5OW15OS9ZWFFNRVlLNUdTOUQvME1mWE0zWUtJaVJSZDh3Wnk4Zk9rejUr?=
 =?utf-8?B?S0cwN0hheFcxR29Pak1KdHRGbzVEVC84ekozTi9tWEsrNkN6NktCRTBPdEg1?=
 =?utf-8?B?bzhOUGwyRk1QenMraFBTZTVVYXNBemRRZmZjQlp4N3JVanRzQlRyK0ZLelZu?=
 =?utf-8?B?Z3dYWVFaSDNRYkxDb1lSWCtwaWNEMXNUb2FVbHl0ZVpZTnJETk9NTCsvYmRu?=
 =?utf-8?B?MjBzQXRRMEd3dzhJVjE0TjE5dm9rRXU4TmlNTXhvUEZkZ0ZneHBrcU9UMWVP?=
 =?utf-8?B?bytNcW91N2tISTBkNDkxYS96QXFSNDBYOHNGdjhkT1YvOU5NTGI5cU1CWVVF?=
 =?utf-8?B?VHV3SU0wYjRkdC9sL2hFWDA5WlJpd0ZiTjcxeHhpaUNMOUV1WlpQcXBDVWRo?=
 =?utf-8?B?c3k2aE5UQTQyWTR0YkZQQmlqcUpITlFiV0xoYlJTd3VvZ1dHQm1rMTBnQ1pK?=
 =?utf-8?B?Y1Z0cG0rM3BJN1FqVU1mS1MxQUsrQXI2b3ZFTGV5WThCV0Iya3BBbENwUUpo?=
 =?utf-8?B?dFlOV0gwNnNqUFRheHgvVDFCYm9YVjllV1lyRnlWMlh3ekdHbXlRMU9HTnBt?=
 =?utf-8?B?QWxVekhCdHk0ZEVWV2Z6YU14bDJDTXNvVndBVHY5ZHVOWVVGa3pYWTFCMUxG?=
 =?utf-8?B?c2k1RFlvazYrUWU4QTREWFRJRDVxU2d3a3pTcTR6enhnWXl3ZVphVURkVW9k?=
 =?utf-8?B?NStDTXZsU2VHUnozU0xHRC9HM01MTWJZZ2xnSEpiM2JvRk94bUFHWEdtMHEr?=
 =?utf-8?B?UFNzZmZkNXNVOS9uV0ZpQVloVUFFMk8xYW1MMzZmNEhvUGpiQjY5b2RYWXla?=
 =?utf-8?B?T2RFSzNSVSt2WU5tczNqc2hWc1FqbXpETDVIb2xtUENFVGw3WkxMN3RWQmg0?=
 =?utf-8?B?K2MxWFZld0VqRVZTNGFyRTI3Y1RjaWNnbFdEQnIva0ZpSElyZjZXTGNLY1J2?=
 =?utf-8?B?YjdWOVRibGNmSXZTWFUvT0VhVXViWVdFU05JTXdleEh0NlpMbitQbE5FbWk2?=
 =?utf-8?B?ZERSTGw3OFc4UFV5RDJvTDNRRVpFSUFwOUVjV0FHNDQ1VXFmZHJ0a2c1OXlS?=
 =?utf-8?B?SnR6VFJUR1lZc09ra0hSZGNYWnc5b08yS0RkMmlVNkdoOUFsbDVGRTRnUTNV?=
 =?utf-8?B?OGVCcENlbjJKdW1iV1dHNHNHaTlKbG96ZjN6Zjk4cHppM3lVb2hjSjJnRWFE?=
 =?utf-8?B?TTdOVVJlcHVCL3YyMHBHTnVFd1NLVENiVGdLV1R6T29vVS8yZkkyUDI3dVRW?=
 =?utf-8?B?SStTbU9rWkJaRSs3YW80SDJKNE9WSHFVVkZxcExWNzRQMktRb3YrSzVhcThX?=
 =?utf-8?B?TkcvNzFIVzB4L3RyNFdoaVhjbnI2ZDZlaW9Va3poRDBLNDBvTmR4NDVhOTh1?=
 =?utf-8?B?SWRHVXlQdnI1dThPbHJtemJxbW1UYUdiZWNMeXJid1NQZEh3c0JDeThnT2xO?=
 =?utf-8?B?WVdYQnZiY29uRlBIWC90ZGJWL0JEcjVTVE1HMkFpMGtBc2x4Y1I4b2I4Wmpq?=
 =?utf-8?B?ZmNSeTVZeGJxS05nVEd1bmthNnBTK0E3Y1lxaXZoVkkvaktVSlI0ZzNvZkN1?=
 =?utf-8?B?akFoZnBZSUZUVnBXTHJrNkJzS2Zib0tzV1BvWndNVTB1Kzd2OE92OEEvMlVl?=
 =?utf-8?B?K3BzcEFKejZnL2E1VjFxNFNJUnZJb1grYWxVQlhTNFdyUjVSYUtWMVRoS3Ft?=
 =?utf-8?B?c1VTRXBDTUlGR1lIckRqeGp3Qmw2TmJ5ZXRnTDNoVmZ0VVJhbFp5VHVyb1lP?=
 =?utf-8?B?UlJwRGtNaHlwaHZmYUV6ODdyR3dPRkxuTENtNkpSZ3BnMHFIRnNBMk5kdjJL?=
 =?utf-8?B?Vk52ZFN1MkI0dWR5TzN0ZzBESDd4YnBVNisySG1jNmwrVXV1WHFicnJrWEN2?=
 =?utf-8?B?V2lIcnk5OXlJMmNlYms2REJ2eTZKZ0xmMkFta1F3TWNmdERSdFNxcDZhUDRP?=
 =?utf-8?B?enpDb3d2cnRKVzA3Q1o3TGpoanY5dW9vd2FiOVVrdnliRGd5L2VjcEthRDl1?=
 =?utf-8?Q?s1JRmyqw7q06FLVct3ZD/djYm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3c5908-c9bf-44a0-2464-08dd99ce91bc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 07:51:04.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYqw+0PR3MpaaeWZ7ewYiLfd0ZrbNGF0KJSXY52TmysF1I1PDx7MBQXGncxiRao8EV4M3se+EOw23DOcniGsgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531



On 5/22/2025 3:37 PM, Dev Jain wrote:
> 
> On 22/05/25 3:04 pm, Shivank Garg wrote:
>> folio_mapcount() checks folio_test_large() before proceeding to
> 
> 
> It is not very clear in the description, where is this folio_mapcount() call present?
> 
> Are you talking about is_refcount_suitable()?

Yes, The issue originates from is_refcount_suitable(), which internally relies on folio_mapcount(), which contain the race.

I'll update the description to make it clearer.

Thanks,
Shivank
