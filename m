Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57841401C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744606399; cv=fail; b=CkPQjyzcdwi0AZn0qSO1/z14QZksY3T2Nn1/+XsGrTFgXjXhR/ISuLQ+YZ9Ka1SSwfyP72DnvAwLEEXXbiI+rq7fBb3UyHa+9nxC8tK4DmekcG5XfIr12Ri7eT8/lJuTSfOOwpixbsKeihy1a7Ndj1ZP6VQDnGdLF5IMP0+Jr/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744606399; c=relaxed/simple;
	bh=8CDFztw1eCmbkPIUcujKh7HV1FhteXLfg57CtnR/piY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o4vyWDIUcs+mi2E65jxmOodHXdhjO6VnpMMMbJdjroqUnLh9wyjxEDPEum15e27MMvH7ljV+iv9+ahsKhYKtl/Bw8xwCB8KUU7DLYpWZ7oAfs7iammgcTJxveyR4SsMf1Vw0ib1MhhJxp3S0BY7h9flcV3D3R3M4LqyVpirV8aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M+gD7Ot8; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M+gD7Ot8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnq6e5I7XnKAXT8M2LBu7o7zOGpXT9t7sWoVGQ0HSXaojcQJvE7l/GCGcKt4uzau1Ma2Mr8oAa+yWmHm26CWqWmcPs4gFF5JZ1GFz5Hn/sUnR0zZQC3ReERfT0GQKLLJGjitYpuBrodpVqz3fi9yJP6Eq74TRDkf4Tu177hE67+9KV0A9Cx51lIvK+X5E3tDn9n4AaopZDsiHkmNGTLL0lCfh7QOWt8e7/gCKHSFu6P08FsxGXXYyWvVTlCNZiEvtA5dvOPqoS1TZEV/dpfgAoDy2L5kzYRwv3XefvbwuGo3zfUvq3Esw4TjTvq1KjZZjFzhRvwxik2vDMr1yici+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjIRRcuGD314OhmKO+oXhR24azKQ7tiDcIhEtQmCmLc=;
 b=ZvGjGImZcPZoQ4ngaP/IxTHutL7jyI+KGUOJl93rfgvmeuGW/KWXRTXqDiotYLgyrTzwHR2/hW66HAl4Bvq+UgLNwBaj8cy0fZPYAXp6Y4zBeFuLO3cr+fvcnrTOEZ+yNHGjCMGbR8oHkGU+BCLUbZK6jeqkRhVPUE2aOW8/nYE7haUHiyBOOkC7oyYjCI5pJwN+btb5IzhCisFPK16U80sA53hL68ybsBP2A8ABacXmZwWXMQofsAo92eqTgovK06WhDeKEv0q9A2nN+zsxzzSIbsjEsWTrZaOggEopN9k+5Bea62lTAQVeXU9EHAHhKjBUuhUaPaGZGo4AtfEw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjIRRcuGD314OhmKO+oXhR24azKQ7tiDcIhEtQmCmLc=;
 b=M+gD7Ot8geJNLSWpaj10Zp515L2PRj0PSXoooMyr1vxEXmo4MrSnASsUvlocSPvEW6XXO/Mtq9F/5Us/bHljy0ZQvzT9CquxCuEDpJ1eLqnoiqTE4S0Ny4jrdNNyVBhxo1/sVXTKFzI1KIpQvdgSA/3uD46AZzlmeszg/D4abTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 04:53:11 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 04:53:11 +0000
Message-ID: <255c8ef4-d47a-4559-9c85-c246855347c9@amd.com>
Date: Mon, 14 Apr 2025 10:23:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: implement migrate_folio for jfs_metapage_aops
To: Matthew Wilcox <willy@infradead.org>
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250413172356.561544-1-shivankg@amd.com>
 <Z_whZHPR64FHq6ve@casper.infradead.org>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <Z_whZHPR64FHq6ve@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::9) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c15fa6-3d63-43e4-c841-08dd7b10418a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGc0YkJ1TTlGK2lFOC8xZ21mcmMwVGVITkxWRGpWYU9WRnZDYjU3VXlFZS85?=
 =?utf-8?B?b3k2UDNNSU9rSkE1K2R3MFVWTnM4MXlnWDBDOHl4a0NCUVNPdUhsK1dBenRu?=
 =?utf-8?B?cER1enVaUEJTaGNwRDRYQzhYRWJQV3lmRlJDRVlmOC9XQjFGRGNEMkJEOEtG?=
 =?utf-8?B?R0NPTXZQMkNIZU9NMU5YeTRqekVuQ0ZFcVJYR3Rhc3VNeHgrQzdzWVNhWkV3?=
 =?utf-8?B?eDFYR1VzR0RWNDZkYjh5S1NuVkF2M2QrVTIyWmV5UUFPbVdKY0RSOTBHMXQw?=
 =?utf-8?B?cjhQVGhGbzZ4ZEk5UkZVb0I5Y0xETGpOV1ZTaUJXck9xTm1jMnlvMlBEcWh6?=
 =?utf-8?B?Y2RFWlFUNE9xNk5Zc2JkNHNBaklWQkJCYzFPeUlFMU5DSnJnQzIrUFdIcEhO?=
 =?utf-8?B?Q0pJZDVXSHFzTjZzMWg5T3lkdHVkdVVUOVJPZXk4VWRxeWk1UlpwSktlOElz?=
 =?utf-8?B?allubzB3TUk2dHRUbUhzclI1OHZtamNRdFJYVm9BZXNVdzF5eXpyRkxpeHpP?=
 =?utf-8?B?SitneTBEZW8vQ0lWVUlvMWt1VXhleDZqMWVRbndaV0k3enVjcnJxeEZpV2tu?=
 =?utf-8?B?S0M4T0RPSCtNWWx3SnRpc2dyTEgzYk4wWkVlSllLcVRCQmNPRFlWcGhCTjd4?=
 =?utf-8?B?SXdzNlUxNmNVSG1XK1NPVkdTc1B4WmhaU2VEUTgzclZndVlzdmp2RmljbS84?=
 =?utf-8?B?Rm1aeFR4ZXZFNHJmV0JFK0hTRTZsS1NiSU9DVVNVL0hpdVZNSHVyS0dNQi9J?=
 =?utf-8?B?aHg2UnNtSklhYnV5enMwQjA4S3RLZzdmT2J3cmNOaWp2eXVSdG1kQnBqWjhy?=
 =?utf-8?B?aW15SXk2WklJOVJLRmExd3hITEJFcmUrcTJDSGNWZUUyWGx2eXRwaElXUCtI?=
 =?utf-8?B?RW1QbUozRUw1UTVTM1Z6Zm9yZ0srRVlpUndsNXY1N3JxMU1IZ0g4cU5BNXBy?=
 =?utf-8?B?SW9Jck9XeStCV0tFb2N5M21PMzczSmkxU3B1MDArblZzSWVTYlpnUGpDTDZy?=
 =?utf-8?B?N0tEWlpPNFZ4NjQ5dnVmL2VkOUg5RnozWDRJeUN0ek5ZV3I3cmkvUTJQcHly?=
 =?utf-8?B?WTJXSFBVd2c2SmdzbGlSSWIySnV0MlRoM2h6Y0xPUXFjY2s4MmVnaDJGdFJw?=
 =?utf-8?B?TkpZRGdsTVlWUjNhTTIraVlScjRzR2JoQVNLMTIyVExTektmTENWNS9KS0ZV?=
 =?utf-8?B?WC9jMUJoNnNpZFUveSsyUDFpa3ZSZ05SdENDNU9yMGRvY3lIcjh1V091U0tZ?=
 =?utf-8?B?NmQ4RGdpMVEwSm9qdUZscCtJeVhveHVhTU5YWWIzbEZrUjZMWWdZWXZZaXhI?=
 =?utf-8?B?VkptUG5NWnpLRmw2NGRjMGJNczV2b1NsZE1Bdm81ZUpoZnVmaHVlNXNLQmQr?=
 =?utf-8?B?SlR2Q2J4R2VyTnZJektkVEJRMFpHVTBYWnBXNU1VVW4rMklUZ2I5UjZ1N1RS?=
 =?utf-8?B?cVNROWtXTE1jTE9XZkhzMkI2SnBGWU95Y1daVXRFVHdvSUhTVzN4eW9TQ2Zn?=
 =?utf-8?B?am50eGVsOExuYks2Y1NJRXJYeDhGY2plbU03dWlyczVOZGhLcDRsd0dZVDA5?=
 =?utf-8?B?aWVLUWxWUkQxWlRyWDJXZ2VraFk4Y3I0LzlRSFBWakZteVlXVGh1ZDlLcnl0?=
 =?utf-8?B?NEYxaEpzNzBhcy9sd1BOaFZxUHZLdlE2b1lRR2JDa2dKcmI1NXkzY0J5M1Ux?=
 =?utf-8?B?TTlIV1dTRG9TMUdRZ0hXaVJOekRyWDdiaVYzVTEybHBkb1U3SlE3VSs0NkYv?=
 =?utf-8?B?UnlkVENVZ2lFMG9yank2eG1lQ25XYmgvOFFvSGhuS2dvbUZ2bUJhWHgvN3d5?=
 =?utf-8?B?djlFbXd2VXZZeGc2VUl3UXVNay9SWEs0VVdFTmlrSlZRY3o1ZmJobHVISzhD?=
 =?utf-8?B?S1ZlOTdteU9zVm9wOXRKOHJicXYrNWJsSGppVHNlbFBaWFJRV2J2YlZqWlpz?=
 =?utf-8?Q?To/cuLJJNXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXdMdjBFUTNlK1JldmxOS2dHSll1Z29hT1JMaTc0UkswZC9PZHFXZ0FuYWl5?=
 =?utf-8?B?RjBhN243Z0p1ZWtmVXNGdjMxQzlERm8xNll6YTNqZ05QdE90S0xOL2Y1ZnJO?=
 =?utf-8?B?eHNicFIxUnVBa1U1Qk10KzUrRWM2TnZDMFgvcitoaHF5WXBxeEFMOHNjL05s?=
 =?utf-8?B?V1ZsVUFLR2Z2UnkySUt4TXRKS1hFY2VWTWdlSFBMcXlXQndWc1htMHEzdVVB?=
 =?utf-8?B?T2J5Qmw5THZYQ28vUjkyQXVPNkNkMkZtNTFROXNyT2dOTFduZG92V3Jzd0Vw?=
 =?utf-8?B?cjBtZHluNGx4bC9xVHY1N1F5SFJNcWJ5WlkxcnNhQ0RpSzRXVXg1YWtrU0Y1?=
 =?utf-8?B?WnloajJpVEw4M1dRUm9MbmJiTjBueTcyRWxJS2xleENqRjI3QUpPR3RFTFdM?=
 =?utf-8?B?M1IzcFBGb1VhQXJGYkdTUDJ1RGNMb3cyYm5QN0FGS25lZS93TmlQT0JFUFdi?=
 =?utf-8?B?ejJsMjRLMUJCYWhlYllQd2NmVTQ3VWpRUmpwZDdTZE9ZeW9mT3B6ejVydWVO?=
 =?utf-8?B?QnlXYndEV1F4b2l5blUzL1pJb1BWeDh6RWFrOGZBdGRlSzlUWm5PNjZMOEV4?=
 =?utf-8?B?UkdNWHlqYW1PdnUrZUVoUU1UdFZQeWQrdUlJM09FMlZvT3ZPTXlmc3NreUp2?=
 =?utf-8?B?Q1lYTWMwcXpsRDExb0ZWUUdUUWZ5WWZPNFA1YkM1ZHN4eVM4ZW5oVXIzenl0?=
 =?utf-8?B?Rnc1UXcrN2gwU2hUL09hbjNkWEJQSXZHR2hDQzJ5VWZnYzZnWmY4ZjlHejdJ?=
 =?utf-8?B?NDlqTFhwK25QQ0ZTRDdnamZsUm1CVXNSVFhnSHpMV2hNdng2K0p0dEhCWW5j?=
 =?utf-8?B?TVFMcFA0OWNUb2FITEd4RUwyd0dXWW9PcGRBTjZiVFBXa1BJdVpNaVRtekJO?=
 =?utf-8?B?NERsVUk1d3RMRlZPaXpHRVhra2lBSEt1aXpDOEZ1d2VrOUpkZjdLTzA5VENj?=
 =?utf-8?B?ckJUa1JuTlR3MTRveGY0OUNzMkQweDh2M1RHb3FCbWs0RHM1MzBWcWg1TDlD?=
 =?utf-8?B?UWVLc3BSMitOQWk1ZEE0YXFGOHk2ZXRVdWJTcktjeExFMFNPWFRFSFBxdGZi?=
 =?utf-8?B?NkUzd0FRQ3BIMUppMzFFR1FFODY4REptaGZtS0FRQW5MV2I0SVp5Ykt6d0ZM?=
 =?utf-8?B?S3huVFJScWMvdGlFeFQySEllMGZ5UHVEZU9ya3BXUGVKcW1yemVuTUV5UDdE?=
 =?utf-8?B?bngxcXQzK0ZqcWFoZ21FQ2twZUs2OHIxenQ1Vmxuek1rV2I5Zlh1MUVlZCsy?=
 =?utf-8?B?MVVHdHlIM1luSHp4bTdDTHFlVUJpdTR2TkQvdXpLcVF4emV3bXJkYUwxbXdM?=
 =?utf-8?B?VWw5SUZyeU1Hd0NkaVpDbHVTT1VWWWI4TFE5cGxDUzZhMkNFaG00S1ZZZDN4?=
 =?utf-8?B?UmtaVjNVQVEya3cyU3YvZDlTd1RsQWVEMHBCNEtzSE9DVUNQVzY3aTEzcDk5?=
 =?utf-8?B?YmFnY1FydGd4dDlpOFlMckZWV1hxeEYzTUNPempnb011ejhzbEZKNUFRRWVW?=
 =?utf-8?B?L3d2NjFYUjk1b1pBYUk5WVAxR2c4ZEhzd3BFQUYvUzdOd0p4QXRzVG0rRUxI?=
 =?utf-8?B?L2RRRjdSb1QzSm1ZTVRzNzBRRkRZa1hYWkxUdEF6MEQrOU1hU3U0aGdGT0Jh?=
 =?utf-8?B?UnBNYU94Vk9vUldiMDhsSHcvQ01hdW40OGZRRFdMRXdOZEFxY1lST3Z6bFh6?=
 =?utf-8?B?SyttVWd1dlJsM1hweGIrQUwreEtxYVNwaDNsNHgwZGI2QnNlaWFJL0FCK2VZ?=
 =?utf-8?B?M3ZmRGhoK2QwNGVTejUrSytaeElFRmtGejFlb1NSUXUyYkFoNlpvWGJISnJ1?=
 =?utf-8?B?TGg0N3hNYWZoTUdSbkxNM0dCeW1zS1RZTmFNbDgzRE5TcUV5MzFMREJzVVZH?=
 =?utf-8?B?QWVBdEU4L3ZCdUVzMzN4OWwwUW8vUEg4OXhQWjhucU9Va1pHVm5ReDYxZEtl?=
 =?utf-8?B?UmtXSTB3b1Y5NFVVY2Yvcmh6SjRiZkVhZTBRS3dYMTF6VlNYZjl2THZRSEky?=
 =?utf-8?B?ZGhYNEZscjBQRU8zL3hKbGVtZGtFdmJXTkdJdTFUc3NpTll3SS9nM01KVURx?=
 =?utf-8?B?V1hQNHNEVzFBSEJVVWp6SnVQdjRwQjNuRUlKa29wN0wyUXZ5UmJEemprWG5O?=
 =?utf-8?Q?NaOF0U8fw53n+DkcqYV3gNzkS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c15fa6-3d63-43e4-c841-08dd7b10418a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 04:53:10.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yws8gRPG2nYuOKpTYv/w9S07luvDyQY/CYDGlo9dLmtotgA+dNaJLYlqNIvGaTdYs9RVwa5NmGV8w74CLYwLYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447



On 4/14/2025 2:11 AM, Matthew Wilcox wrote:
> On Sun, Apr 13, 2025 at 05:23:57PM +0000, Shivank Garg wrote:
>> +++ b/fs/jfs/jfs_metapage.c
>> @@ -570,6 +570,7 @@ const struct address_space_operations jfs_metapage_aops = {
>>  	.release_folio	= metapage_release_folio,
>>  	.invalidate_folio = metapage_invalidate_folio,
>>  	.dirty_folio	= filemap_dirty_folio,
>> +	.migrate_folio	= filemap_migrate_folio,
>>  };
> 
> Ooh, damn, I think we're going to need more than this ;-(
> 
> static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
> {
>         return folio->private;
> }
> 
> struct metapage {
> ...
>         void *data;             /* Data pointer */
> 
> So we're going to need something like buffer_migrate_folio(), but
> specialised to jfs metadata.  And when we come up with it, that'll
> be Fixes: 35474d52c605

Thanks for the pointers. I missed the private data aspect earlier.
I think it's doable - IIUC, I'll need to
update mp->folio and mp->data to point to the dst folio info.
I'll work on a patch for it.

Best Regards,
Shivank
