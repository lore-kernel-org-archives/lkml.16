Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591F81ACA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738215573; cv=fail; b=rnbQuaSs0vsUtEXE2FjZFIYRNUQNSeR1FqBbdD4tZy3EpkQBIGa0HkmPMTiB6Y7s9IUj6eQSmAC6lYHff+Ic7ZHLVYYzu//V1mRyHd+axjygyV9jks6EcDWd79BVBnfYtoBK5/ydfoEY6Uai5GQwawMgKrpc6JyTgkWdZHXYHmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738215573; c=relaxed/simple;
	bh=aewPFrmqOwMKZZYQSgcRb7c8QCl3o4KBe13tx0JDIUY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/onBzw26RmWBB7VljTB4NNoJUcu+kNlaKQoC0/tkiWpiPQRPS1DRgGAqXsokz7pk0nxKoxGYEsL+R00yT6YgRZxiKYPlgcNE5S11rOPLYCKvwxDUpVAbH9gzq921RAGNpW/VEAzTOKnYOqyhlDm+O9b++jRRk3WIIL3faeneZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pKqlPa9K; arc=fail smtp.client-ip=40.107.212.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pKqlPa9K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lW3MXDEk8lj4cIcJsbZfEdiLv2F+naAwSVWlMGR6lKEsH4qZAxzMSs+9EpE6injzg3TF1L2NY2VyWGkV2dWko3yrLM2Xb+Nowc7Yi5X2OvyIzZ61CFclhqo7WQN2CTqyxasr4I2sIjXsQudocmNreSLPV4U8C9QjFZMAtAGwAhn2zyxLRb3pc8Jdu1FM6ofmRvpOA5bvUbCqH/OhssfCe4xNBxcfCwZzAEIqbm1hPsyyBXwHTPYLmeh2VHuHtjl+un6m4LzeVIwtT+z6qzjGdMJsAGXWQRYIqAdQVHRJlP/2WrvZ4BYIZUd9HWQPtcd5zya/LtKTqM+CMFVV2nWpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEZyGu28VbiF4J/+l95pdRazBBFlHNNQK2V3q5fNvcA=;
 b=JWU+roXEEDnnOGd9rY/2QioWdjZHJqxwHjOXU0lmrzhF6p9kEhPUX0kLAeOlxWp0MJKLgBkPrCzwZPH9fGikwhv8weWvnUaSFUTIdGR4woNH02KMrJI8u1m+U547sxK1ZVQ4x7S3gUIj9F07wV2pCqiTda1JY47ORrr0Sj+pN91qKvlTLhdxFdobO8HK0rLEHVVqdQ3LWU6VTniOFJ1isuQTLwk/hrIffz/NaZbjQ8yMudjZeOMcXg7AHzEJpK2GGHtuG7ynGA91ixCjFQKry6t+DADYjDfv2mjyXBpEYy5YqIRw063CKYKmzfG8GawVcJOHc4dDUawfE9HAx9s1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEZyGu28VbiF4J/+l95pdRazBBFlHNNQK2V3q5fNvcA=;
 b=pKqlPa9KVReJjMaVGrHHhRG4EvbacYwmgzU+GsJOSKwXlUvqwsDxKJJmFa/bg+Ckl9UBXZ/3QbcWvSQaMZIbS1LkR+JRwbmCp77DqmFbcbbaZZiDJw3C09Cx2BpjGvSpEJ4blYjolkGuxeW3TF05jKSfkx+Orl/u/PVkx29e9zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) by
 MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 05:39:27 +0000
Received: from DS7PR12MB6214.namprd12.prod.outlook.com
 ([fe80::17e6:16c7:6bc1:26fb]) by DS7PR12MB6214.namprd12.prod.outlook.com
 ([fe80::17e6:16c7:6bc1:26fb%3]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:39:26 +0000
Message-ID: <4ee6a3e4-7910-486c-ac32-55db7a306a02@amd.com>
Date: Thu, 30 Jan 2025 11:09:16 +0530
User-Agent: Mozilla Thunderbird
From: Manali Shukla <manali.shukla@amd.com>
Subject: Re: [PATCH v7 09/12] x86/mm: enable broadcast TLB invalidation for
 multi-threaded processes
To: Rik van Riel <riel@surriel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, peterz@infradead.org,
 dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
 nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
 mhklinux@outlook.com, andrew.cooper3@citrix.com,
 Manali Shukla <manali.shukla@amd.com>
References: <20250123042447.2259648-1-riel@surriel.com>
 <20250123042447.2259648-10-riel@surriel.com>
Content-Language: en-US
In-Reply-To: <20250123042447.2259648-10-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::22) To DS7PR12MB6214.namprd12.prod.outlook.com
 (2603:10b6:8:96::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6214:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: caef9a70-9b23-4947-618e-08dd40f07515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wmt3TytHempEZHRwZFNtVzBkRVd3aUNaUCtKQjZrNkZBUjQyWGVZUDZwM2ln?=
 =?utf-8?B?dWd4UG85K0RPRU5TSFlXMGd6ZkZsVWZmS2loUCttMkw5dmJDMlhnODVrc0t0?=
 =?utf-8?B?aUtzNFFnd0djbk84RFl6UndJNERvQlowU3JLOUdNK0dzOVRka21tOWd3WmY3?=
 =?utf-8?B?TlM1bjQ4cXU5R3ZXbHBJWlBnNjQ1RjJ1K014TVMveUNicWJCby9FWXhTL2Y2?=
 =?utf-8?B?bXhlR2FUYWZDQUtZRVdIeFRVa2d3YWhsZG1tZ3FSTVh5ejV4VkdVM0lrRlBq?=
 =?utf-8?B?QmhaYzFWNkw5SXlBV0x0UWxHcys1alYzMWxtRjdSMTg3dFUya2lDdkFwS3d2?=
 =?utf-8?B?ZDVITDQ2cEIvang1NUVVYWJMZXhRS3JQN0p3UXhkbkQ4UHJHOHF0UmRFVHpE?=
 =?utf-8?B?U05jYm5UVmk5VFREWWRWbzFSNHo4b1A2bUx3RUtwRnRxdHBwdlN5WHFBNHh0?=
 =?utf-8?B?N3A1YWh5Zksrc1J2dkEzMnhOeWxCNFlqT1J1NFNVeDV3SEMycGtKSVRDMy95?=
 =?utf-8?B?RVdTQnJvd1VPYkxITUlDQ0wyWGtpd0VIbWlaMUV2dkhjOTR1NGNzSUg1ZzFv?=
 =?utf-8?B?a1JGMlU4djlNZUhlc0U3QnBhNjB5b3RJRVkwYXNNVW5nMzhsR3h5ajh3QVRR?=
 =?utf-8?B?Sk1zTlAxYVFTc3RxNmNPd0kzQnk1OE1qQVl6Mkw0bW02K0oyUHh1b2lFQmtP?=
 =?utf-8?B?UU1EdFUyWDlGTjg5aWxzN0pEV1J1Q3pETW8vRnI4NXYxYWlsczc5TzdHRFhx?=
 =?utf-8?B?NUtiVUZxOUpLN0dBSjZXWUVrOXIwdS9RWDIydFRFSUJsd2VtMG8xYzQ2QWZq?=
 =?utf-8?B?emRFNzkvTDlTSERFTDh6cjVJcVdJTTl3cSttS2hqUGNBcHliQjdCNG1BN241?=
 =?utf-8?B?OUhtYS80YmxlR0lzY1ZhMEtad1l2VEo4cVVEU2dCTEwxcnNxc1lzQy9iQUJV?=
 =?utf-8?B?d3g1MDlocSsrYlZ1SDcxY1Ntemp4VldWWmJSN0dzR2gwK3JBb3NvRHRvZHZy?=
 =?utf-8?B?L0xYQ2oyUWhoUlB6bS9KdGYzZ0lpcDc4NVRTY2ZHVmI1dnZzcW9vN3F4QzNm?=
 =?utf-8?B?aUxVZlRqOHhMTDhReTJKOUMyYnJUUng5d1hOQ3FTeHR6RUVBMU53WUJPci9Q?=
 =?utf-8?B?Ri9ydGFHY0ZRdE5ZeFY2clRHUFloOThjWlprVEtNb2k3cU8rWGMzV3NiOStL?=
 =?utf-8?B?T2xiK0VlbEhWS2NrYkxjcW1BR0FRQjhkMWh4RGFBMnI3b3BMMWRueDF1c2RE?=
 =?utf-8?B?MDdHczdnaHRsVTlKU2J1MjlqbmFFMUVpb1dQMm5ldlhTME8xcjdFVWFIWEYz?=
 =?utf-8?B?R1cwTmE5ZE1nYk5qdllnMFRGUGt5bDg3QWU2b0VyQjhwYTkvbzZSdDZuL05z?=
 =?utf-8?B?TVNNSUdTbDdFWm1PTkFTdDJpTjFHTktkelFRNCt2NGdhRHJhaXFkZWlLM3NR?=
 =?utf-8?B?S0plYVVKMTNtcXd1akVncS92M0hmRVd1c09CdnFHT2xnWWtUZmdPZTkyK3Zp?=
 =?utf-8?B?YTAvNEp1M3NpbmtDT2Q0bW1weWhvYXdvYjJJVHhpLzY4a0V4U1FPOE9zWkdU?=
 =?utf-8?B?NnRwMzh0dHJTckxwRXZQZFc2WlV0NHNhZWlBNnJUNzN3TUJQak4va095bEs2?=
 =?utf-8?B?VjhBdFRXZkl6UWRocVNVUk0yQXBIb0pRckRvSmlWcGJNUGdjWVN1aG0xZ292?=
 =?utf-8?B?cGU5dGNzOGFvQU9DV1dwc0lrZFhNZ3lidW1GalAzUTBReWo4RWpiZzh2OSt4?=
 =?utf-8?B?VlpBVksyNHdnOGlMSUNyc2l6QkUrWm5JQ0ZwUmZqZzFmbVhqTTB2NGVVci9E?=
 =?utf-8?B?Q2tvamJKUHdPeGx6Q05pU0plZ041U2ZxQS9YSmpiMkhDUW1BN2VHdkpUVFo5?=
 =?utf-8?Q?73rxJK4cm7XmC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6214.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ZKajg0TFJaU01Wb0QyRmord0xuV3VrUmRVOEZuUFFib3laU28wY2FFU0lu?=
 =?utf-8?B?a25OWmVhbUR6MktEWHgyMTFiajI3aU4zWk5JT2Z1cVpmVjZaNDFtQmdRVy9Z?=
 =?utf-8?B?d2dKQkUrUjI0bFZVYVNRUEUvLzRieTAwamhiNVJzZFp4TDRlRmVoVzRKdHVB?=
 =?utf-8?B?SXAyeUFPWVlvS2Nrdlk3MExabU9IMGpXd1A3VFpPRWlLc1RsSTVwdkErNFNB?=
 =?utf-8?B?TUFhamExcWVKeEM1Z2hjb1gvU2JrUkdPOHdPQTkyMmlaWEYrR1JHK3pwRzZ1?=
 =?utf-8?B?ZnlvWHBNakk4bU1OYjNIS3BRMnRyRGxMMSs3TmE3U3JUNXJDUW9NaHFYQ2NY?=
 =?utf-8?B?OUxNMHVJRmk3TEFtTVRtMWY0Z1F1M1I3Y3BRMFl0eWRoOElCd3ZvOWRBY0kv?=
 =?utf-8?B?NUdrZDBmaEcwU2dNbTNCSkxCS2U2QXdxUlpGQWFXa3JzWTVyNkxRb2pTazZV?=
 =?utf-8?B?MnFtc085YmJkbHFQZ0FrbVZ3UnBiZE1WcWlkRGtJU1c4UTNsZXNNdzdpeU9S?=
 =?utf-8?B?ZXdTWmJyN2lNWWs2Z1FJdEFLU29Bak5sYXFPWk5PN1QxYUJTV3JRWGVqMjEw?=
 =?utf-8?B?TEl1ZGFObThIdzVxclFSdkFINzM2U1pUZk05TnFpQ0JFUGo0ZWFlN210ODhs?=
 =?utf-8?B?cXBXNkxXdXpFOVRlSlo0ZjBqSUlMT3c5UWhsK0JUbkN6SDNnS1Z3NEZUN3RF?=
 =?utf-8?B?NEYyTTNDL2JKNGwxMnlPMTBPQXVsTUozTEJIZlNBV1U2Z3Uvb29lZGFpcUFP?=
 =?utf-8?B?NC9JWktLL014dzB2WFhzck1VRy9MUG42Wi8wbzlwSkNLdWF2dlBxRWI1TlBZ?=
 =?utf-8?B?VWxJRURCZTlHNExVS3BrSzNESGdYZDRCaW1LT2dNaVBmQUhrK3RrQzQrU0Qy?=
 =?utf-8?B?SlBma3BESEs1VTNyalkxU0dSbGJ4ZHVpM3N0allqaXA4V1F1VitxZmFzV3VQ?=
 =?utf-8?B?dVJmOEdHZGpGbkc2a3ppU29iaFpERGc5SWYvc1lBSzYwMUFBS1I5Mkc3SU85?=
 =?utf-8?B?ZmhtMXNGYkRuMjA1MnBERzFHTEE4TXJoM25LdWNseDFWM3h6aE5yRFZRaEtY?=
 =?utf-8?B?MnhCTHNKNHU5M2pkY3dvaFVMMjV6QVF4NFZkZDUreEdJOEFJZm9hMXpqcVVN?=
 =?utf-8?B?aHF2Y2pRMFgyM0h0bFl5QjJZY2RjUFBLU2xJZklPUEhPais5MVBUUVBsQXYr?=
 =?utf-8?B?NktaU0xvRHpIZkhwTHdBeC9xQzJXVndnak1RaUN4ZUpLQ29YelZhSEM5cXdR?=
 =?utf-8?B?dFFjZlpPSTVNKzZkUHdDZDlMNG02N1dILzZVL0lQeWFrU3hTUU15bXdwM1JD?=
 =?utf-8?B?Vkxybk1TNXhaOEhTMTNiTlR1RlRObEZ0bDZneTdpdDl6b01TZXBlazNPc1lh?=
 =?utf-8?B?VENNcDFsbXd4U0NTUjdTK3dMcEJNV29BTEN3T21ZLzJla3owSVBNUHRlNUVx?=
 =?utf-8?B?a2hxZUY5eG1Nd1VuSXl4ZDQ3RjVaNFY1Q3RzZVZzS3RJNTVnaTlIM1I0MFpL?=
 =?utf-8?B?eFdCa0QrSjRiUVFKcERTSUJ6VjIybjJWRzJkZ1F4aXNsdHdvVndrQ1BMVXBl?=
 =?utf-8?B?MXpuNXpENFlOVDVZdnVOZ0VkdTQ4THBaSDFRNFBUb24vektEblpGS0FPVkwy?=
 =?utf-8?B?bllGcDZkNDM2OUdwSTlZSjc0QXJKY2RWNnU2M3QzcnBZUVc5Qmgva3FGNlZq?=
 =?utf-8?B?RktFUytoVkptWm12ZGpFb251eDZDUWRaczFlcTBodExUUmRqNDFaUS8rYnlD?=
 =?utf-8?B?QVRkSzJXVHVkNDdnTTN6MXI0b2ZDbG5ZaEFuZWtUU1ZnTlNSOEczQ2NXUWlx?=
 =?utf-8?B?QzNOTUlSMXRsS2Zsblc4STgrWWFEOGY0MGJWUkNsRUM4dEN2eWErZGVRUm5D?=
 =?utf-8?B?WGZXOHc1dFlrZ2xiUTM4TmxTZ2gzdE9hWUx1UEZTRE5tTWR3VndUTy9nQ2tq?=
 =?utf-8?B?WnIrOVV6TWJYQzJpRlExWmhxTER3SGNTaGxsQ3pyMS8wOTRlRHZ5RUZocEFV?=
 =?utf-8?B?V29RQ01aY2lwN0lYVzFyRHlPZXpxVlNzMjZMOFJFVEV1UjJBRzF6WjJaUFpR?=
 =?utf-8?B?L2I1T3BqbEhaZ1IxTXYzTHdNZHR0cEdVc1pUeHBVMXpnOEs4RWMrNCthOFdX?=
 =?utf-8?Q?ZaULf/GHXznwKclG9tfHWoPI7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caef9a70-9b23-4947-618e-08dd40f07515
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6214.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:39:25.9966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeVaGGULCChD6w/s94C2giNhpJDMrJMdwI3hEY/HOr6L0Tf5rURgfdVqyAlqo2fwmdCCKDE0wCoClEn6QD7vVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175

On 1/23/2025 9:53 AM, Rik van Riel wrote:
> Use broadcast TLB invalidation, using the INVPLGB instruction, on AMD EPYC 3
> and newer CPUs.
> 
> In order to not exhaust PCID space, and keep TLB flushes local for single
> threaded processes, we only hand out broadcast ASIDs to processes active on
> 3 or more CPUs, and gradually increase the threshold as broadcast ASID space
> is depleted.

Since the threshold is fixed at "3" and does not gradually increase in this
version, would it be more accurate to update the commit message to reflect this?

-Manali

> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/include/asm/mmu.h         |   6 +
>  arch/x86/include/asm/mmu_context.h |  14 ++
>  arch/x86/include/asm/tlbflush.h    |  73 ++++++
>  arch/x86/mm/tlb.c                  | 344 ++++++++++++++++++++++++++++-
>  4 files changed, 425 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/include/asm/mmu.h b/arch/x86/include/asm/mmu.h
> index 3b496cdcb74b..d71cd599fec4 100644
> --- a/arch/x86/include/asm/mmu.h
> +++ b/arch/x86/include/asm/mmu.h
> @@ -69,6 +69,12 @@ typedef struct {
>  	u16 pkey_allocation_map;
>  	s16 execute_only_pkey;
>  #endif
> +
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +	u16 global_asid;
> +	bool asid_transition;
> +#endif
> +
>  } mm_context_t;
>  
>  #define INIT_MM_CONTEXT(mm)						\
> diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
> index 795fdd53bd0a..d670699d32c2 100644
> --- a/arch/x86/include/asm/mmu_context.h
> +++ b/arch/x86/include/asm/mmu_context.h
> @@ -139,6 +139,8 @@ static inline void mm_reset_untag_mask(struct mm_struct *mm)
>  #define enter_lazy_tlb enter_lazy_tlb
>  extern void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk);
>  
> +extern void destroy_context_free_global_asid(struct mm_struct *mm);
> +
>  /*
>   * Init a new mm.  Used on mm copies, like at fork()
>   * and on mm's that are brand-new, like at execve().
> @@ -161,6 +163,14 @@ static inline int init_new_context(struct task_struct *tsk,
>  		mm->context.execute_only_pkey = -1;
>  	}
>  #endif
> +
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +	if (cpu_feature_enabled(X86_FEATURE_INVLPGB)) {
> +		mm->context.global_asid = 0;
> +		mm->context.asid_transition = false;
> +	}
> +#endif
> +
>  	mm_reset_untag_mask(mm);
>  	init_new_context_ldt(mm);
>  	return 0;
> @@ -170,6 +180,10 @@ static inline int init_new_context(struct task_struct *tsk,
>  static inline void destroy_context(struct mm_struct *mm)
>  {
>  	destroy_context_ldt(mm);
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
> +		destroy_context_free_global_asid(mm);
> +#endif
>  }
>  
>  extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index dba5caa4a9f4..7e2f3f7f6455 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -6,6 +6,7 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/sched.h>
>  
> +#include <asm/barrier.h>
>  #include <asm/processor.h>
>  #include <asm/cpufeature.h>
>  #include <asm/special_insns.h>
> @@ -239,6 +240,78 @@ void flush_tlb_one_kernel(unsigned long addr);
>  void flush_tlb_multi(const struct cpumask *cpumask,
>  		      const struct flush_tlb_info *info);
>  
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +static inline bool is_dyn_asid(u16 asid)
> +{
> +	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
> +		return true;
> +
> +	return asid < TLB_NR_DYN_ASIDS;
> +}
> +
> +static inline bool is_global_asid(u16 asid)
> +{
> +	return !is_dyn_asid(asid);
> +}
> +
> +static inline bool in_asid_transition(const struct flush_tlb_info *info)
> +{
> +	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
> +		return false;
> +
> +	return info->mm && READ_ONCE(info->mm->context.asid_transition);
> +}
> +
> +static inline u16 mm_global_asid(struct mm_struct *mm)
> +{
> +	u16 asid;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
> +		return 0;
> +
> +	asid = smp_load_acquire(&mm->context.global_asid);
> +
> +	/* mm->context.global_asid is either 0, or a global ASID */
> +	VM_WARN_ON_ONCE(asid && is_dyn_asid(asid));
> +
> +	return asid;
> +}
> +#else
> +static inline bool is_dyn_asid(u16 asid)
> +{
> +	return true;
> +}
> +
> +static inline bool is_global_asid(u16 asid)
> +{
> +	return false;
> +}
> +
> +static inline bool in_asid_transition(const struct flush_tlb_info *info)
> +{
> +	return false;
> +}
> +
> +static inline u16 mm_global_asid(struct mm_struct *mm)
> +{
> +	return 0;
> +}
> +
> +static inline bool needs_global_asid_reload(struct mm_struct *next, u16 prev_asid)
> +{
> +	return false;
> +}
> +
> +static inline void broadcast_tlb_flush(struct flush_tlb_info *info)
> +{
> +	VM_WARN_ON_ONCE(1);
> +}
> +
> +static inline void consider_global_asid(struct mm_struct *mm)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT
>  #include <asm/paravirt.h>
>  #endif
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 9d4864db5720..b55361fabb89 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -74,13 +74,15 @@
>   * use different names for each of them:
>   *
>   * ASID  - [0, TLB_NR_DYN_ASIDS-1]
> - *         the canonical identifier for an mm
> + *         the canonical identifier for an mm, dynamically allocated on each CPU
> + *         [TLB_NR_DYN_ASIDS, MAX_ASID_AVAILABLE-1]
> + *         the canonical, global identifier for an mm, identical across all CPUs
>   *
> - * kPCID - [1, TLB_NR_DYN_ASIDS]
> + * kPCID - [1, MAX_ASID_AVAILABLE]
>   *         the value we write into the PCID part of CR3; corresponds to the
>   *         ASID+1, because PCID 0 is special.
>   *
> - * uPCID - [2048 + 1, 2048 + TLB_NR_DYN_ASIDS]
> + * uPCID - [2048 + 1, 2048 + MAX_ASID_AVAILABLE]
>   *         for KPTI each mm has two address spaces and thus needs two
>   *         PCID values, but we can still do with a single ASID denomination
>   *         for each mm. Corresponds to kPCID + 2048.
> @@ -225,6 +227,20 @@ static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
>  		return;
>  	}
>  
> +	/*
> +	 * TLB consistency for global ASIDs is maintained with broadcast TLB
> +	 * flushing. The TLB is never outdated, and does not need flushing.
> +	 */
> +	if (IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH) && static_cpu_has(X86_FEATURE_INVLPGB)) {
> +		u16 global_asid = mm_global_asid(next);
> +
> +		if (global_asid) {
> +			*new_asid = global_asid;
> +			*need_flush = false;
> +			return;
> +		}
> +	}
> +
>  	if (this_cpu_read(cpu_tlbstate.invalidate_other))
>  		clear_asid_other();
>  
> @@ -251,6 +267,272 @@ static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
>  	*need_flush = true;
>  }
>  
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +/*
> + * Logic for broadcast TLB invalidation.
> + */
> +static DEFINE_RAW_SPINLOCK(global_asid_lock);
> +static u16 last_global_asid = MAX_ASID_AVAILABLE;
> +static DECLARE_BITMAP(global_asid_used, MAX_ASID_AVAILABLE) = { 0 };
> +static DECLARE_BITMAP(global_asid_freed, MAX_ASID_AVAILABLE) = { 0 };
> +static int global_asid_available = MAX_ASID_AVAILABLE - TLB_NR_DYN_ASIDS - 1;
> +
> +static void reset_global_asid_space(void)
> +{
> +	lockdep_assert_held(&global_asid_lock);
> +
> +	/*
> +	 * A global TLB flush guarantees that any stale entries from
> +	 * previously freed global ASIDs get flushed from the TLB
> +	 * everywhere, making these global ASIDs safe to reuse.
> +	 */
> +	invlpgb_flush_all_nonglobals();
> +
> +	/*
> +	 * Clear all the previously freed global ASIDs from the
> +	 * broadcast_asid_used bitmap, now that the global TLB flush
> +	 * has made them actually available for re-use.
> +	 */
> +	bitmap_andnot(global_asid_used, global_asid_used,
> +			global_asid_freed, MAX_ASID_AVAILABLE);
> +	bitmap_clear(global_asid_freed, 0, MAX_ASID_AVAILABLE);
> +
> +	/*
> +	 * ASIDs 0-TLB_NR_DYN_ASIDS are used for CPU-local ASID
> +	 * assignments, for tasks doing IPI based TLB shootdowns.
> +	 * Restart the search from the start of the global ASID space.
> +	 */
> +	last_global_asid = TLB_NR_DYN_ASIDS;
> +}
> +
> +static u16 get_global_asid(void)
> +{
> +
> +	u16 asid;
> +
> +	lockdep_assert_held(&global_asid_lock);
> +
> +	/* The previous allocated ASID is at the top of the address space. */
> +	if (last_global_asid >= MAX_ASID_AVAILABLE - 1)
> +		reset_global_asid_space();
> +
> +	asid = find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE, last_global_asid);
> +
> +	if (asid >= MAX_ASID_AVAILABLE) {
> +		/* This should never happen. */
> +		VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n", global_asid_available);
> +		return 0;
> +	}
> +
> +	/* Claim this global ASID. */
> +	__set_bit(asid, global_asid_used);
> +	last_global_asid = asid;
> +	global_asid_available--;
> +	return asid;
> +}
> +
> +/*
> + * Returns true if the mm is transitioning from a CPU-local ASID to a global
> + * (INVLPGB) ASID, or the other way around.
> + */
> +static bool needs_global_asid_reload(struct mm_struct *next, u16 prev_asid)
> +{
> +	u16 global_asid = mm_global_asid(next);
> +
> +	if (global_asid && prev_asid != global_asid)
> +		return true;
> +
> +	if (!global_asid && is_global_asid(prev_asid))
> +		return true;
> +
> +	return false;
> +}
> +
> +void destroy_context_free_global_asid(struct mm_struct *mm)
> +{
> +	if (!mm->context.global_asid)
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&global_asid_lock);
> +
> +	/* The global ASID can be re-used only after flush at wrap-around. */
> +	__set_bit(mm->context.global_asid, global_asid_freed);
> +
> +	mm->context.global_asid = 0;
> +	global_asid_available++;
> +}
> +
> +/*
> + * Check whether a process is currently active on more than "threshold" CPUs.
> + * This is a cheap estimation on whether or not it may make sense to assign
> + * a global ASID to this process, and use broadcast TLB invalidation.
> + */
> +static bool mm_active_cpus_exceeds(struct mm_struct *mm, int threshold)
> +{
> +	int count = 0;
> +	int cpu;
> +
> +	/* This quick check should eliminate most single threaded programs. */
> +	if (cpumask_weight(mm_cpumask(mm)) <= threshold)
> +		return false;
> +
> +	/* Slower check to make sure. */
> +	for_each_cpu(cpu, mm_cpumask(mm)) {
> +		/* Skip the CPUs that aren't really running this process. */
> +		if (per_cpu(cpu_tlbstate.loaded_mm, cpu) != mm)
> +			continue;
> +
> +		if (per_cpu(cpu_tlbstate_shared.is_lazy, cpu))
> +			continue;
> +
> +		if (++count > threshold)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/*
> + * Assign a global ASID to the current process, protecting against
> + * races between multiple threads in the process.
> + */
> +static void use_global_asid(struct mm_struct *mm)
> +{
> +	u16 asid;
> +
> +	guard(raw_spinlock_irqsave)(&global_asid_lock);
> +
> +	/* This process is already using broadcast TLB invalidation. */
> +	if (mm->context.global_asid)
> +		return;
> +
> +	/* The last global ASID was consumed while waiting for the lock. */
> +	if (!global_asid_available) {
> +		VM_WARN_ONCE(1, "Ran out of global ASIDs\n");
> +		return;
> +	}
> +
> +	asid = get_global_asid();
> +	if (!asid)
> +		return;
> +
> +	/*
> +	 * Notably flush_tlb_mm_range() -> broadcast_tlb_flush() ->
> +	 * finish_asid_transition() needs to observe asid_transition = true
> +	 * once it observes global_asid.
> +	 */
> +	mm->context.asid_transition = true;
> +	smp_store_release(&mm->context.global_asid, asid);
> +}
> +
> +static bool meets_global_asid_threshold(struct mm_struct *mm)
> +{
> +	if (!global_asid_available)
> +		return false;
> +
> +	/*
> +	 * Assign a global ASID if the process is active on
> +	 * 4 or more CPUs simultaneously.
> +	 */
> +	return mm_active_cpus_exceeds(mm, 3);
> +}
> +
> +static void consider_global_asid(struct mm_struct *mm)
> +{
> +	if (!static_cpu_has(X86_FEATURE_INVLPGB))
> +		return;
> +
> +	/* Check every once in a while. */
> +	if ((current->pid & 0x1f) != (jiffies & 0x1f))
> +		return;
> +
> +	if (meets_global_asid_threshold(mm))
> +		use_global_asid(mm);
> +}
> +
> +static void finish_asid_transition(struct flush_tlb_info *info)
> +{
> +	struct mm_struct *mm = info->mm;
> +	int bc_asid = mm_global_asid(mm);
> +	int cpu;
> +
> +	if (!READ_ONCE(mm->context.asid_transition))
> +		return;
> +
> +	for_each_cpu(cpu, mm_cpumask(mm)) {
> +		/*
> +		 * The remote CPU is context switching. Wait for that to
> +		 * finish, to catch the unlikely case of it switching to
> +		 * the target mm with an out of date ASID.
> +		 */
> +		while (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) == LOADED_MM_SWITCHING)
> +			cpu_relax();
> +
> +		if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm, cpu)) != mm)
> +			continue;
> +
> +		/*
> +		 * If at least one CPU is not using the global ASID yet,
> +		 * send a TLB flush IPI. The IPI should cause stragglers
> +		 * to transition soon.
> +		 *
> +		 * This can race with the CPU switching to another task;
> +		 * that results in a (harmless) extra IPI.
> +		 */
> +		if (READ_ONCE(per_cpu(cpu_tlbstate.loaded_mm_asid, cpu)) != bc_asid) {
> +			flush_tlb_multi(mm_cpumask(info->mm), info);
> +			return;
> +		}
> +	}
> +
> +	/* All the CPUs running this process are using the global ASID. */
> +	WRITE_ONCE(mm->context.asid_transition, false);
> +}
> +
> +static void broadcast_tlb_flush(struct flush_tlb_info *info)
> +{
> +	bool pmd = info->stride_shift == PMD_SHIFT;
> +	unsigned long maxnr = invlpgb_count_max;
> +	unsigned long asid = info->mm->context.global_asid;
> +	unsigned long addr = info->start;
> +	unsigned long nr;
> +
> +	/* Flushing multiple pages at once is not supported with 1GB pages. */
> +	if (info->stride_shift > PMD_SHIFT)
> +		maxnr = 1;
> +
> +	/*
> +	 * TLB flushes with INVLPGB are kicked off asynchronously.
> +	 * The inc_mm_tlb_gen() guarantees page table updates are done
> +	 * before these TLB flushes happen.
> +	 */
> +	if (info->end == TLB_FLUSH_ALL) {
> +		invlpgb_flush_single_pcid_nosync(kern_pcid(asid));
> +		/* Do any CPUs supporting INVLPGB need PTI? */
> +		if (static_cpu_has(X86_FEATURE_PTI))
> +			invlpgb_flush_single_pcid_nosync(user_pcid(asid));
> +	} else do {
> +		/*
> +		 * Calculate how many pages can be flushed at once; if the
> +		 * remainder of the range is less than one page, flush one.
> +		 */
> +		nr = min(maxnr, (info->end - addr) >> info->stride_shift);
> +		nr = max(nr, 1);
> +
> +		invlpgb_flush_user_nr_nosync(kern_pcid(asid), addr, nr, pmd);
> +		/* Do any CPUs supporting INVLPGB need PTI? */
> +		if (static_cpu_has(X86_FEATURE_PTI))
> +			invlpgb_flush_user_nr_nosync(user_pcid(asid), addr, nr, pmd);
> +
> +		addr += nr << info->stride_shift;
> +	} while (addr < info->end);
> +
> +	finish_asid_transition(info);
> +
> +	/* Wait for the INVLPGBs kicked off above to finish. */
> +	tlbsync();
> +}
> +#endif /* CONFIG_X86_BROADCAST_TLB_FLUSH */
> +
>  /*
>   * Given an ASID, flush the corresponding user ASID.  We can delay this
>   * until the next time we switch to it.
> @@ -556,8 +838,9 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>  	 */
>  	if (prev == next) {
>  		/* Not actually switching mm's */
> -		VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[prev_asid].ctx_id) !=
> -			   next->context.ctx_id);
> +		VM_WARN_ON(is_dyn_asid(prev_asid) &&
> +				this_cpu_read(cpu_tlbstate.ctxs[prev_asid].ctx_id) !=
> +				next->context.ctx_id);
>  
>  		/*
>  		 * If this races with another thread that enables lam, 'new_lam'
> @@ -573,6 +856,23 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>  				 !cpumask_test_cpu(cpu, mm_cpumask(next))))
>  			cpumask_set_cpu(cpu, mm_cpumask(next));
>  
> +		/*
> +		 * Check if the current mm is transitioning to a new ASID.
> +		 */
> +		if (needs_global_asid_reload(next, prev_asid)) {
> +			next_tlb_gen = atomic64_read(&next->context.tlb_gen);
> +
> +			choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
> +			goto reload_tlb;
> +		}
> +
> +		/*
> +		 * Broadcast TLB invalidation keeps this PCID up to date
> +		 * all the time.
> +		 */
> +		if (is_global_asid(prev_asid))
> +			return;
> +
>  		/*
>  		 * If the CPU is not in lazy TLB mode, we are just switching
>  		 * from one thread in a process to another thread in the same
> @@ -606,6 +906,13 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>  		 */
>  		cond_mitigation(tsk);
>  
> +		/*
> +		 * Let nmi_uaccess_okay() and finish_asid_transition()
> +		 * know that we're changing CR3.
> +		 */
> +		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
> +		barrier();
> +
>  		/*
>  		 * Leave this CPU in prev's mm_cpumask. Atomic writes to
>  		 * mm_cpumask can be expensive under contention. The CPU
> @@ -620,14 +927,12 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>  		next_tlb_gen = atomic64_read(&next->context.tlb_gen);
>  
>  		choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
> -
> -		/* Let nmi_uaccess_okay() know that we're changing CR3. */
> -		this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
> -		barrier();
>  	}
>  
> +reload_tlb:
>  	new_lam = mm_lam_cr3_mask(next);
>  	if (need_flush) {
> +		VM_WARN_ON_ONCE(is_global_asid(new_asid));
>  		this_cpu_write(cpu_tlbstate.ctxs[new_asid].ctx_id, next->context.ctx_id);
>  		this_cpu_write(cpu_tlbstate.ctxs[new_asid].tlb_gen, next_tlb_gen);
>  		load_new_mm_cr3(next->pgd, new_asid, new_lam, true);
> @@ -746,7 +1051,7 @@ static void flush_tlb_func(void *info)
>  	const struct flush_tlb_info *f = info;
>  	struct mm_struct *loaded_mm = this_cpu_read(cpu_tlbstate.loaded_mm);
>  	u32 loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
> -	u64 local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
> +	u64 local_tlb_gen;
>  	bool local = smp_processor_id() == f->initiating_cpu;
>  	unsigned long nr_invalidate = 0;
>  	u64 mm_tlb_gen;
> @@ -769,6 +1074,16 @@ static void flush_tlb_func(void *info)
>  	if (unlikely(loaded_mm == &init_mm))
>  		return;
>  
> +	/* Reload the ASID if transitioning into or out of a global ASID */
> +	if (needs_global_asid_reload(loaded_mm, loaded_mm_asid)) {
> +		switch_mm_irqs_off(NULL, loaded_mm, NULL);
> +		loaded_mm_asid = this_cpu_read(cpu_tlbstate.loaded_mm_asid);
> +	}
> +
> +	/* Broadcast ASIDs are always kept up to date with INVLPGB. */
> +	if (is_global_asid(loaded_mm_asid))
> +		return;
> +
>  	VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].ctx_id) !=
>  		   loaded_mm->context.ctx_id);
>  
> @@ -786,6 +1101,8 @@ static void flush_tlb_func(void *info)
>  		return;
>  	}
>  
> +	local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
> +
>  	if (unlikely(f->new_tlb_gen != TLB_GENERATION_INVALID &&
>  		     f->new_tlb_gen <= local_tlb_gen)) {
>  		/*
> @@ -953,7 +1270,7 @@ STATIC_NOPV void native_flush_tlb_multi(const struct cpumask *cpumask,
>  	 * up on the new contents of what used to be page tables, while
>  	 * doing a speculative memory access.
>  	 */
> -	if (info->freed_tables)
> +	if (info->freed_tables || in_asid_transition(info))
>  		on_each_cpu_mask(cpumask, flush_tlb_func, (void *)info, true);
>  	else
>  		on_each_cpu_cond_mask(should_flush_tlb, flush_tlb_func,
> @@ -1049,9 +1366,12 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>  	 * a local TLB flush is needed. Optimize this use-case by calling
>  	 * flush_tlb_func_local() directly in this case.
>  	 */
> -	if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
> +	if (mm_global_asid(mm)) {
> +		broadcast_tlb_flush(info);
> +	} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
>  		info->trim_cpumask = should_trim_cpumask(mm);
>  		flush_tlb_multi(mm_cpumask(mm), info);
> +		consider_global_asid(mm);
>  	} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
>  		lockdep_assert_irqs_enabled();
>  		local_irq_disable();

