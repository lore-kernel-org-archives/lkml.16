Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D42185AC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750919259; cv=fail; b=gepCcZf2ZG7BtNbSC9y78j+ER1zICnWX6CZui26BGxX4jBm7syl8n6+iq5Tniac3JRNL2yKzsdEkaRNaTHbYfaAMx6cmVG5qg8Qy5+1b/rlwSx8ZoREnkeecRd4diC/Ymbk19mfNDyOqnsAD4ga/aCXikvtsxhbCBDT4JH8cfsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750919259; c=relaxed/simple;
	bh=+SKbq5W7HncYBVTvYMi4SfZXYgnOfz0zFVNAP5d7/Xo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qdfq39BFgTukF4JfWq5UZGCFXbBfnSdv3qPkvrZB7wfkchAoFurbv41fshoDvpP2OAXV4YypwqosL0ofU9y1MqSkDZAg508CmKmZj5fb6FkMd/Org0P2aiHMLRNyd7p0cEJ4PawSwe2S36qWlNFmCG+y4Jyxq/u2KqQp0tFA//Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NCNeNy8U; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NCNeNy8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siuVMKqzIvqXuPcVnjWBeazuTXorYCrTSBULUuTOG71H2tKGb2JBmwowVZXSOeR3H2Cxi5kg/uutG2YGX2qjAxl3MtL150yDpOBp3plqMNMpNjAOfOYMdyYzgnO6TEdgwtpNcOGmL6egq5RyR32znE1/HhknAZe9DuZFxNRK5fpEKm4mjO4xkxlX0nyOIerZkbDcgzC8dzd9El9CqI0F05WJYAlIU3DeOkgXhrjqFNFKOvwIUqMqLGg6BU9ex4MilS2grlKW4l0LuD4Zc7CERWftuBQZWdSoYq9jt91bE0+kx594biK/h/w1J/mlzOy8Gxl5LD2ycv/WlXnXJLkHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5IvHdpvAipueJVfA5kgFCdmGOhXiU83lc+4aKDBiN0=;
 b=NQKC96G8Z4P7QtFpIqsGbi5qA85SxBiGjvueIsgT7M6x5IwZx/Hu0XqablfufqVb0+TXPvjfwgjx3rFkHrla9bxZnRrbj8RuEzB7lNr1YkRnYAhxXdDfdcCoL5s/RO9tf+cn4PnWuHkIaZoROomr4WGYYz1v4MnXIIKeC5J3WC9nwGykwp7wIWE4x5fAzIMK8cFmTKF4cuJEhhiIHzMhBya8VrxauaUU1T4yYe/tqoxQ/8cVCaX/VjGujazYCMN5dwkChYQvYM+QTbD7xGu5zIl3gr2VubS/FTYW7R4myw4nkyqzWJViAUIko9lUK+BRjVcXn8y2RaZhmyod33M3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5IvHdpvAipueJVfA5kgFCdmGOhXiU83lc+4aKDBiN0=;
 b=NCNeNy8UbNbeEvwztPKZt8FfmAFYuhzy8mT4BA8S3uYCe+ZTlkJlDrImzM+3xJ/uZkIYjPIvNg8PvfznraO4WHElLA1bU9KYy/8GGlKkewu1uzpYEVP4QIU7FMMnXARdOl8skWJsiqXPyI0mCjTAu/VQBZ0d1D6dLM9P9ZKSwXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Thu, 26 Jun 2025 06:27:30 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 06:27:29 +0000
Message-ID: <02c6c58f-2c2c-42eb-bde6-175de71f7d47@amd.com>
Date: Thu, 26 Jun 2025 11:57:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2 03/13] mm: Scan the mm and create a migration list
To: Harry Yoo <harry.yoo@oracle.com>
Cc: AneeshKumar.KizhakeVeetil@arm.com, Hasan.Maruf@amd.com,
 Michael.Day@amd.com, akpm@linux-foundation.org, bharata@amd.com,
 dave.hansen@intel.com, david@redhat.com, dongjoo.linux.dev@gmail.com,
 feng.tang@intel.com, gourry@gourry.net, hannes@cmpxchg.org,
 honggyu.kim@sk.com, hughd@google.com, jhubbard@nvidia.com,
 jon.grimm@amd.com, k.shutemov@gmail.com, kbusch@meta.com,
 kmanaouil.dev@gmail.com, leesuyeon0506@gmail.com, leillc@google.com,
 liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 mgorman@techsingularity.net, mingo@redhat.com, nadav.amit@gmail.com,
 nphamcs@gmail.com, peterz@infradead.org, riel@surriel.com,
 rientjes@google.com, rppt@kernel.org, santosh.shukla@amd.com,
 shivankg@amd.com, shy828301@gmail.com, sj@kernel.org, vbabka@suse.cz,
 weixugc@google.com, willy@infradead.org, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, Jonathan.Cameron@huawei.com, dave@stgolabs.net,
 yuanchu@google.com, kinseyho@google.com, hdanton@sina.com
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
 <20250624055617.1291159-4-raghavendra.kt@amd.com> <aFxzEFhTDOyL4y0e@hyeyoo>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <aFxzEFhTDOyL4y0e@hyeyoo>
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: da1c8baf-e2f6-40cc-e64b-08ddb47a869b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjR4amdPUktPUlI0UW9vN2tpZlJURGt5S203dkd6bUxyY2VQckh5RlVud2tu?=
 =?utf-8?B?cDBMZEg0aW9Xam1qL3F4aFdPWjh2TUNFSEFKMlZRNFpUckV3VUZzRDU1cHc5?=
 =?utf-8?B?eHFMSVFObWlUbGhjd2xQbzFsd0FCMWRETHlPTEZVbUVpZnNBWEhJUVNTeHZm?=
 =?utf-8?B?TkU1MGk1Si83YjVLcUhMbDVueTdpSGc0bDcxLzZjOVRYMnVUN0h4cDBMbTBq?=
 =?utf-8?B?WEZIZFo2TklNQWtUWGJPc244WmpCQVNkY0RMeUtCQWxLanBQMXVoRWI3blAz?=
 =?utf-8?B?NHVudEZlRWhNOU5oMEVpUTlQb0xKdEZyd3oxbTZucmZUK24wSFlrMTVZeU8v?=
 =?utf-8?B?TnAvKzlYTjU1VkRDYzNBbmd3T2Ezc2ZmUXpzcmNweG9SaVVxVURQWjNjVVZC?=
 =?utf-8?B?SnNzWjJrVlVlN3h5cVFtTURXajh1N3pjTnpndHcvbzlHM0I5LzJCbHhDSksv?=
 =?utf-8?B?M3FUay9aaGdJdTJwbDZQNUh5dDJsNVBTOVIvdVR0MUUzUG1rR3RWMnNCZEI3?=
 =?utf-8?B?QVhhUWszRFB0cExDQ3V1KzBtZkNNVXllbEZFR2E0dVJVS2E4U082TzZNbHpK?=
 =?utf-8?B?QVpKUHVVR3dUcytXdXk3R3cvKzRRcGxoNHhSY3p3K3BSTDNJbWw3SUNPb2I5?=
 =?utf-8?B?aThFUDcvellWeng4eDZmWTJ6RUxidmlqMG9KVTBGU3pYSnA5eTQ1WkNPQmk5?=
 =?utf-8?B?Qm5qOFhMSUdLNzZsdDZXNVdKa25IemhXeGIzNjFhcG83K1BLWnBMNWZldDk0?=
 =?utf-8?B?T3pacjlUWHE5QzVrMnBjalArTzBVQTQyZythM0NvUlcya0p3eWtjUCtwOGxs?=
 =?utf-8?B?RTdELyt1ZEtSYXZRZy9CRUk2QS9leXg1QjZiQXc1Y1k3RDNOWlpYUXB5M0Na?=
 =?utf-8?B?OXNUc3laN0hkOVBaUVFYZ2FOV1pNMlNkbXcydTdYc3NGM0U4UmYwd0xRbWpt?=
 =?utf-8?B?SHFlekpQdklSTGRiRjJqaUZTUkZWbzJrbzV6bmFUL09aRnc2cUh2aWJGYVgw?=
 =?utf-8?B?U2NSb3FUcGtsWGw0WnVhejZPZzNTOTFBRW1BQWFGNE1rTUFSS3JiYk92Vm1J?=
 =?utf-8?B?ejc3TVdySWhvLzJtZDNNZXJrRXhETVBzOG1DYm10Nmhyb0pOU2hpbVZuV3dN?=
 =?utf-8?B?UmNqVHFlZXh1NnZFejZjNU8wRmc0c00yVWVJZ2NzWms0emRHS0sveTFtUXJt?=
 =?utf-8?B?QlJiVDB6Nmh4N0FNRkMrMEh3SE1GSXA0ZkZVZkpLS3RvdENoQUF4S3pJV3ox?=
 =?utf-8?B?emw5cmwrWFkzSEd3anFEMTJwaFRjaGpycGFpUFphUExRSGs2R1F5MzFVWXVZ?=
 =?utf-8?B?TENzM2JoRkdzZlVISDdmVHl6Y2dBRnJVOUh0UTZSZmNSSnJOTXoxNDNSazlM?=
 =?utf-8?B?ZzFYODRZK2J0TWprS1NLSWR3aTVDdkpLOTZaWit0eE0wTkdSaVF4dXAwMVhU?=
 =?utf-8?B?cU10aVZxSWlUenFwelpTVUxNOUIzU282SHp2QjJ1T2FuV1k1T0NuTU5PU1BR?=
 =?utf-8?B?Rmo2aE1CcXZqek50a0FHUWFlUHRSbkgxcFo4cWprWVpUZll3Ynp3VHJsR1M5?=
 =?utf-8?B?M2dENEl4dm1nY0g0SSs2dlZjUkRaK1VJbUxkRXVyZnVGdEZjMFY2RkdIaVhW?=
 =?utf-8?B?M3BMSG1NR2dnVFBVcncyVkNPdmVVUnpJZkwwOGVIaXU3M1lvSUwwK0tOOGVi?=
 =?utf-8?B?ckVERWNOdkg5T1RwZ0tpbVZTYmJYUjRmSlJWZ0JCb21kSzVaeDNYM2VWQW9v?=
 =?utf-8?B?b0lEZjRsQVJiWThUZ2c4Q2FYdW5GV3ZwYXFyZWVCK3hxaloxWHE3cDJldmtS?=
 =?utf-8?B?NElHbWdXYUxKZlZ4L2hsYnBzT20vaDJpOE1FMjBGZTErblREUUp4VndpU3pM?=
 =?utf-8?B?UlN4Sk5qMVJaM2ovdk0zaFg1Z2QvR20vOWlvc1pybFBFbUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Myt2dU1yWUZmWlRJdk5sOEo1VjI4YzhLRFN0VUkxNUZDczZPNUI2NWtnZTRM?=
 =?utf-8?B?cURSYk9UWERSeDhKNkh2S05MUlFwMWpvZml1RkloUklWc25ESnFEWUZsVWNn?=
 =?utf-8?B?SUhMbW9VWG8yY0JTTFB4K0N1UFY1ZGhHb0dob0dJYUpDYW56VXFKYlcxelRS?=
 =?utf-8?B?WEVCZW45UnhBbVEyTTB6a3RzK3NaUXdZYTRUY3lTRStjWnROKythOGRrcXFQ?=
 =?utf-8?B?WmhCRCtTMythN2dqaDRPWGhyWXU1bTdqL0pqM25aazZLZXJETkEyVnpUa3Jk?=
 =?utf-8?B?UzdqaUxGVG1EWndreWlyYU96OE9qRHdZRkljaHYrUGFSczdpTGxxZDB4M2Vs?=
 =?utf-8?B?TU9qZ3UwUEpGMnFJMlVwMy90SDdsRjl1Ny9qbHFNUWRjWFZoNCsrUkxUNW1z?=
 =?utf-8?B?bnFXUEltRUJLSmxKeUdwaFgzdnVKOUx0SmFLUU1NWHdYS3YxZUlIL1pkbnRE?=
 =?utf-8?B?NFpFRjgxMENqdy9NOG9yVHZDRXdWajBCay90S2tzblo3TzRSWElNeGZ3Uldz?=
 =?utf-8?B?MDVyNE5IZnV3MStDU1pya0F0UjJtMCs4NVNFOG1QTkhEZmRNWjFEbVQxWjFG?=
 =?utf-8?B?R05yU25CU2RPejRLZ3FRSmdFa2VLM3ZrN2pzMkZkcnArbnVhRjRCTnNiVHFI?=
 =?utf-8?B?WG84Z1d1ZUNhUTNRbWhWMk9YWGRTL1M1NTFmN0xKdmxtV2dRdmpxSXJKRnpu?=
 =?utf-8?B?ZXBmVElzQVRNOUZtNGNEcUsvLzl4UmVpR1doN1ZUbmFSOHZ2b2tlekpOVjI1?=
 =?utf-8?B?QXF1eXhEcVFEUHJ5NUZEMER6T1daVTVWbE0wTXZBbzZkL2FtQk9EbWlLbGNL?=
 =?utf-8?B?blgyZ1NPU08zSHZabGZqVHBtTmlHRTBmT3R1bTVCTXZXNHRxZDhaY1J4RUky?=
 =?utf-8?B?YmlKRUtNbzFXRVFyR1Q5SnFudEFVbWdxa3U2ekl3RlJFQkF6WDRVWTEvd0RF?=
 =?utf-8?B?Lzk2Zk8zWFhxTUI2eUlEZWVCRG1ESmtoWGIzQVJRd3EyemIxdHB2NjlrdW0w?=
 =?utf-8?B?UlJMbU1FQkJ3TW5GVEFuSjNNdXl1SHRXRWhXOCsyZ1FYdW1nT2FXVUluREhy?=
 =?utf-8?B?dG1Yb0dVMk9POEtXMHBLMmtuNGRtaEhSOW9NUkk3eVNEWVFWTmMzOHk4ZlFN?=
 =?utf-8?B?VVpESTAzSEJ6Q2RwcUkxRXdvRTZWM0NaSVdBQXhFK0xQcFZVU2JQeU9UOVdr?=
 =?utf-8?B?c1lpNnlkcjV6cnBkemNDWkQ2cHUwSnhWbzVSOHlSMkVBdk95Q0JFYmRob2I5?=
 =?utf-8?B?aGhGME95QjFXZnA4QndjOE5qYUFkWmJPQmxVNm1WWVhwV3Fmb0RxS1RIY3kx?=
 =?utf-8?B?VWJObm5UTGR4blZLWXVNS2FMaFNUUTJubmpFdlZPZWxGZDArSUJVZjBrVnFN?=
 =?utf-8?B?QWFPT2ExajhlMVNPNUM3SUo4MEVBT1NIR2VPZHlHZGxGa0E0a1pWTU5XbmJU?=
 =?utf-8?B?M2t4MDVCekFMWVpvZTJqZzVRSVM2RWw0SlpFYUNXeDdyMjZxWWdnK3JLbTZj?=
 =?utf-8?B?eUp4N2E1WGFiTnM4WWQvaUNVQkp4cURQQU13QTlYMFZuQWNnSXpxb3krWVg2?=
 =?utf-8?B?ZkhFMHdSMURPQ3hiWmtiNHB4Z0ltbzJ4Ujk4R0c3WjVaTHpDdVMzK0d1YWJv?=
 =?utf-8?B?T3lDNzhETmx3Z0Uwa2FMY0FZUFptSC9IUW0zQzNaNjQ2eDdOMVB4OWd2OTVj?=
 =?utf-8?B?d1gzTFUzR1hKVXc3R05RR1liS2ZEU3BvREZVVndyMm42SGhhQU9CTDdEdEJG?=
 =?utf-8?B?MUljc1BtU0RWNlYwZHBnZDNCSEZNaFZYMGU3TThIWDNuRFExR2JZSHVSRGRn?=
 =?utf-8?B?UXZudklnS2g3K0tjYmJYMnluc2dpUnRhaTJJOWNmU3NxOHN3MGxaMzB3RFBC?=
 =?utf-8?B?d1lVK1g0NzNrbFVFSXF0SlhabkpEZjQ5QXVjSFBUaUhTMXh2R29qWHlPTGs2?=
 =?utf-8?B?NU5SbFRPSFZyV2FySjF5QTc4MUFBWTEvbWVSVldPVmZIVjYyYklhdHlwZG93?=
 =?utf-8?B?czRwWDJmL09mTThTcG0zOG1ZZ0l2NHJ4TkdUOHBER1A3YzBPblk3dUhNUUw0?=
 =?utf-8?B?K2xQeFRLUnl3VTJxV1FBUlpKcmdzNGxVUEVSbW1LNFBXbU5aMzJIaXVkTit4?=
 =?utf-8?Q?lmkL3QdNEqslsGggsOk/MWT3X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1c8baf-e2f6-40cc-e64b-08ddb47a869b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:27:29.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxVIZbA/w/lp1nIZjv7iAgqMD5IQnbJHcC+gMZULEDaBDhsNO7Npfk2BwAEa8D/NZulcFg5D0l1ZlnLMiF7QDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389


On 6/26/2025 3:37 AM, Harry Yoo wrote:
> On Tue, Jun 24, 2025 at 05:56:07AM +0000, Raghavendra K T wrote:
>> Since we already have the list of mm_struct in the system, add a module to
>> scan each mm that walks VMAs of each mm_struct and scan all the pages
>> associated with that.
>>
>>   In the scan path: Check for the recently acccessed pages (folios) belonging
>> to slowtier nodes. Add all those folios to a list.
>>
>> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
>> ---
> 
> Hi, just taking a quick look...

Hello Harry,
Thanks for taking a look at the patches.
> 
>>   mm/kscand.c | 319 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 318 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/kscand.c b/mm/kscand.c
>> index d5b0d3041b0f..0edec1b7730d 100644
>> --- a/mm/kscand.c
>> +++ b/mm/kscand.c
>> @@ -42,6 +55,8 @@ static struct kmem_cache *kscand_slot_cache __read_mostly;
>> @@ -84,11 +122,275 @@ static void kscand_wait_work(void)
>>   			scan_sleep_jiffies);
>>   }
>>   
>> +static inline bool is_valid_folio(struct folio *folio)
>> +{
>> +	if (!folio || folio_test_unevictable(folio) || !folio_mapped(folio) ||
>> +		folio_is_zone_device(folio) || folio_maybe_mapped_shared(folio))
>> +		return false;
>> +
>> +	return true;
>> +}
> 
> What makes it undesirable to migrate shared folios?

This was mostly to avoid shared libraries, but yes this also
should have accompanied with EXEC flag to refine further.
This also avoids moving around shared data. I will experiment more
and add additional filters OR remove the check.

>> +static bool folio_idle_clear_pte_refs_one(struct folio *folio,
>> +					 struct vm_area_struct *vma,
>> +					 unsigned long addr,
>> +					 pte_t *ptep)
>> +{
>> +	bool referenced = false;
>> +	struct mm_struct *mm = vma->vm_mm;
>> +	pmd_t *pmd = pmd_off(mm, addr);
>> +
>> +	if (ptep) {
>> +		if (ptep_clear_young_notify(vma, addr, ptep))
>> +			referenced = true;
>> +	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>> +		if (!pmd_present(*pmd))
>> +			WARN_ON_ONCE(1);
>> +		if (pmdp_clear_young_notify(vma, addr, pmd))
>> +			referenced = true;
>> +	} else {
>> +		WARN_ON_ONCE(1);
>> +	}
> 
> This does not look good.
> 
> I think pmd entry handling should be handled in
> mm_walk_ops.pmd_entry callback?
>

Thanks, Let me check on this. Some part came when I was referring
to idle page tracking.

>> +
>> +	if (referenced) {
>> +		folio_clear_idle(folio);
>> +		folio_set_young(folio);
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
>> +{
>> +	bool need_lock;
>> +	struct folio *folio =  page_folio(page);
>> +	unsigned long address;
>> +
>> +	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
>> +		return;
>> +
>> +	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
>> +	if (need_lock && !folio_trylock(folio))
>> +		return;
> 
> Why acquire folio lock here?
> 
> And I'm not even sure if it's safe to acquire it?
> The locking order is folio_lock -> pte_lock
> 
> page walk should have already acquired pte_lock before calling
> ->pte_entry() callback.
> 

I saw you clarified later.

>> +	address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
>> +	VM_BUG_ON_VMA(address == -EFAULT, walk->vma);
>> +	folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
>> +
>> +	if (need_lock)
>> +		folio_unlock(folio);
>> +}
>> +
>> +static const struct mm_walk_ops hot_vma_set_idle_ops = {
>> +	.pte_entry = hot_vma_idle_pte_entry,
>> +	.walk_lock = PGWALK_RDLOCK,
>> +};
>> +
>> +static void kscand_walk_page_vma(struct vm_area_struct *vma, struct kscand_scanctrl *scanctrl)
>> +{
>> +	if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
>> +	    is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
>> +		return;
>> +	}
>> +	if (!vma->vm_mm ||
>> +	    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ)))
>> +		return;
> 
> Why not walk writable file VMAs?
> 

This is mainly followed from numa balancing logic
" Avoid hinting faults in read-only file-backed mappings or the vDSO
  as migrating the pages will be of marginal benefit. "

But I have not measured benefits either way. Let me try once.

>> +	if (!vma_is_accessible(vma))
>> +		return;
>> +
>> +	walk_page_vma(vma, &hot_vma_set_idle_ops, scanctrl);
>> +}
> 

Regards
- Raghu
