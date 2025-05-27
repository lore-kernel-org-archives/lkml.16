Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899719DF7A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358158; cv=fail; b=V8AvmVCmTcz/bdcuYMBWy93p/IA+fkKMu8Xk/8ZEpArzjd84TY4cki006HZLYjNJyPgyotEGPjFJ/KWHUNuW9Wsm3XOWtkr/3v56ymfsLUJbZWtDVqIk6HItTtU7mqxfC4MZA8zuowh+n+yULLcasYCUrQxD1oOqaWdywKuVPMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358158; c=relaxed/simple;
	bh=bDGRI6AI6+jYFDhwn97iq2tm/QlfrGnFn5+qTx2KMfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ornx4f1IlP+Yl2xPbNTHE9bOGBFiHLnTzIFvaO/UMRyi03wuBjqk1SN3dFnLBWmNS7KSaN/u4CMJRHympMZP75RRWbu7vyS0wyvPdP/dLLQ0kbAfOATaEBThIdxf/9unZJpwCjuQSO7xfYUhOq1llUGSD4yeP6+OWNRQ/Iniixk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZaC+im6V; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZaC+im6V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdQT+mHm7p9Imoa0Z8DYipxaHmiqvN6hiLs9tK+qsI9Z9FZFmywvLiiOhkVu4dQdbagGhAS0M8mFg3w50/nYdTBF/zC7KhwAEVBrgUqxY0dEfzN99y9IBYD7eKnIAV6P3Tiq2nuf4opkn7AwTurDFO0J94Ay/DG+uXn6yAql9Kc9xaDMGhlqhct2dwHMv1cTiuCtrKeQPbDJtd1F+GNqLdDBufRfGHk4JSO6Miqbpik5c/v3X1vb3Q43LIHSrqLH4Yjg0LCe5Ma3nGzw9IqOMIdznFBDOU39ynLCpkA3/1WwPYbP1K06EdiHqHyP1/U5uncF2QWkdc7cweTV/Cof7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rRo8W5Yk8foXvgjX1nlwOj2RpqjVpAl/hZRobBjObs=;
 b=Itob4cmZjfRIucoIpn20Rutnmobz5OmXQJqh2uo0LZhG/H44p+R9IKEiWBd98uREZf8vPf22jXdoea13gWKvDvKnwSQFVeGyi2ZOJL+JaHBDo3nAkdEHUshMAH1ospV3RtW0tZAzTcH8RwxLXPoHx4dfTBvoXc3Oo7oUQfTuzN18VyOlJaPB60K7jXkb/gjJdz6Sgy535x4yMWOitp6B+0cyv19P+c/E5ETdFbrEBO02mzz6Gbkf+VKS0BkiIBUjw4b465tLAO2/ODrBHxLQYhnm41eq7U0/nGVXuV0N6D7w/3dzljB3I5UM3C/J4+WGzKW1KdoCvbKTHjM2K7D0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rRo8W5Yk8foXvgjX1nlwOj2RpqjVpAl/hZRobBjObs=;
 b=ZaC+im6VQ9xarKO51jMXzQqR7RPhhddDOiP0Gbv6Rgc/RNiIsXIrUtSyPkiYaLujnRHQc+3mPVVxOMBJCYAC+dsHFawsiRWpNdvnb4hVp+D5QRTAYWyb10T7HeZAYWUMLYQP3Mu6hMJ8EiBZU1v0S3VyrzvnfaZ8kuu22MXMdOob83xscGNhOd0SPXBGdNAVTfVlF6aH38miEPYnR/LEYjMDjHZlO+Tlyom4gOTISCWDFpsJmqc6AsKX1BEz0GXoRThaU4IQWtlOo1/zDZl9sLrkzF5Zf9x2sKmeTRkPYtYKuHYvg/IiYuyz96OfO/12FJNuR4wJeVnlK3ia/elqng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 27 May 2025 15:02:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 15:02:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Tue, 27 May 2025 11:02:29 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <FB393186-FE4D-4A67-9701-7BC4946AC222@nvidia.com>
In-Reply-To: <2d8017fb-474f-493c-84ad-df172987e65e@suse.cz>
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-5-ziy@nvidia.com>
 <2d8017fb-474f-493c-84ad-df172987e65e@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:208:160::40) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f479141-328c-4c24-cee8-08dd9d2f8148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWw2NkxCdm83UU9GYXFEaUwwTVFlOU9XQzdtQW80TkRqZ1pEa0NrNGd5azRu?=
 =?utf-8?B?dzMwU1FZamtOT0NYSFMxNGZXNkRocUtJdm9FakI5U2Fva1hNN0tOM01YSVAv?=
 =?utf-8?B?UHpJZHB1YzdSd3VVRnlMRWdoR0xRNlVsNjU2bXZNZG02eTEyZlY3SHBzMXpX?=
 =?utf-8?B?aVVRYlhoSkhvVkJERDhCbmNLQ3R4TFI3WE91azREcS81NmQ2SlFVU1NJazVj?=
 =?utf-8?B?dnFUdnVQR1NoNTdGV0RwbzMzcW82NDA1TzdBd09FUUVWRkN2ZmhROFpydkZE?=
 =?utf-8?B?YU42YjhTaUVNazlQSmNwM2d1TTM5UUVqSjJyQ3RYMWNtVWtGNTRmUmorbnpX?=
 =?utf-8?B?UXQyaHNwSG5PVGg4YkNpVUI0NTRldWxGNFFJbzhRTEVVSXVNWXF1NkV0ZVBC?=
 =?utf-8?B?N0Vub0E4VndIandkSUl0TlkybmxuL3huT3RmL0Z3OHc0d3NlSFFPS1FIUmFz?=
 =?utf-8?B?dlNrQ1E1ZlhPMEszV3RGVzRtUEJMeVJpMElFb25JVGJjdE50aEdVaXR4RXNL?=
 =?utf-8?B?NFduaUgzQjNwbnRlcDNaQy9KazJ1RFNzNzdDQ0V1aHhYRTY4OHV4MU0yYUY1?=
 =?utf-8?B?bW13bmJhYXhhd2ZveHFtNkpXdmljWVpsRDAyeitxb2Z6WXpDRHc4M2pMSTJt?=
 =?utf-8?B?bm1hNWxySjhTMTUvcjVmb29IRGRkZldXZ3FzWTFFUHBKTFFGWTVITzluaUZq?=
 =?utf-8?B?UFpUbU1LQ3RjMUlybUNmWjBXWjFZQllPbHJPZVIwTmxiREZFSU5HZ0dxMWlL?=
 =?utf-8?B?MTd1SXlyODZtMlFuRkUvY2NKOWtYWkdqZ09DZWVVd2thNkljajFDM2RVR2FB?=
 =?utf-8?B?VXFGZWhwVFZJN3QvODVZZVJvajBESlZVc1ZsZ2lpdTgrQm9Fa0VhbzdJNjZD?=
 =?utf-8?B?aFNjdTVIYmoxNzVlRkR1cmFQTHplN1ZyZGZLaDBRblE1R3h5S2NEcDN6MFV5?=
 =?utf-8?B?ejhGQStlb3FPcy9GNFkzVnUzUGpHbTVnYVlqZ1pCMmpuUERXa0xVbWlOOGpx?=
 =?utf-8?B?VENseHRLU3JSd0YwK3NPdHlGZXdhWnNXL20waXdKdGRYd1JrNENFSlN4Undu?=
 =?utf-8?B?TzB1a1BRa2twL2NKUXhLYUN6SktKZjBrRW5GaGN4a1U0ZWlORWc4UG9ZRVdC?=
 =?utf-8?B?K1lrK240MEZpR2xKWkZMc2tJcS91VGUwTVdvOGlXOTYwcGNIR3hibGJnSDVE?=
 =?utf-8?B?RXFaaG54R1JHWkJJVjRFMjRZUURUcnQ0emtuRnI3aVpxL3N4eFNhVHVtZk4w?=
 =?utf-8?B?Nng5WWI2bUJabUxYS0YwWDVYczlKb2NpQ0pNaDBvd1FkMmlzQTk2RHl3aTVn?=
 =?utf-8?B?RDBPQjFRL1Uvb2VEK1NXMWNkZ1ZJeFRjVnNPSHVqWUt4cU5BVzVSa2ZnVEo4?=
 =?utf-8?B?dXJSb0h5WVFGL3RxclBJUVFrWUx4NkgrRHRzRmpNTXp4ak8vYjlUWWxGZEJM?=
 =?utf-8?B?NWZBdVkvUFRIUER1Mi9MNEVqd0c2NkovOUdISnBXcGZDN3lpSGVKa3MwTXp0?=
 =?utf-8?B?M3RSQU1Wa2RTSXN0TzhqdEpHWGZ2YXlEWTRVRkJlc3VPMjN0ZlBLK1A3NnlN?=
 =?utf-8?B?Y3UwMlMwVXJHRFFyVkZaQlJEaitMejRLaEVpWlU5LzFWNm9nWTA3c2REa3Er?=
 =?utf-8?B?VVJ0OW9UYzlkTTdEdjF6bkJmZUF3OEZScGt5MkNTaEQzQkhHVzF5emJOZ1lH?=
 =?utf-8?B?aGF4WUhnalU4NExWV1AzbFdQU05WM25EOUVoaS9OY2NKYlpWU1p2TnFON0Fq?=
 =?utf-8?B?UWQ5ZktER09KOVdYMlVzV2JpbjRDQnNnQ3JqSmdHME5oeTd3OUlhSXlaL1VD?=
 =?utf-8?B?SGVyMVNiclFPWHVHdzRCc0VvMkh2UHZpaDRwOU1iRjJ4VkhJRFU0dmRObVhm?=
 =?utf-8?B?M0EyTk1NOGt1emQxSG5KVVFycWhMalRNVDJhWFpBZWdxTlN4ZWNZaDljZVp1?=
 =?utf-8?Q?PGKyknFKE84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZPbUJITDRmV05nbkdKTUg3SXZTQzZTV282Q2ZTNGFHVlpZaVllUGZDeVFO?=
 =?utf-8?B?TjRRRVhnVkhNOWI1RUVuNElTbmRJUDlQVXBQOEJzRjErcVp5WTJaWFdPcjN0?=
 =?utf-8?B?bFNEeFhaZm1oUEVXQ3BLcnJkbFk5bkNUWXBxUTUxTHZTZkhmWCs3MWhOcVZC?=
 =?utf-8?B?MDBsYXFFeTZGbU1zWHB0eDdOV1hJajNYcWdsdjl3OGhnYWRnSDJYNjM0NkdR?=
 =?utf-8?B?UGdyVmJEay8rZGc1eVlqdXU3Y3JvYjNTd0NLT21VTXRmSk1mQ1MwV2tORlJG?=
 =?utf-8?B?Y25KcUhrcmZPL1dWcTB4VlFzei9QTXZFeXNzVXlsUlpDd1NkR2dBTXk3RzJW?=
 =?utf-8?B?Z1pWRFh4WEpxZC9BWnBDNG9wSVRJZGU5bjcwQWNNaXhYcXk2QzlqQkdsWGpF?=
 =?utf-8?B?cU50Z3NuakpWY1BVVEZrdjhJc1NqY3FtS011ZStMYTkvNnNpa2N3Nno2S1Bv?=
 =?utf-8?B?a1VaMWNMbHJRT3VIRW82eGpzbnhONWdCK3NmNEJCVCsvRkY1WlNFT29qbW1T?=
 =?utf-8?B?T2ozUmFZZzY1TWZObGNCMk5Wc2JWMW5kQWJVY2d3Wk9WcFN3NE43L0lRUTV5?=
 =?utf-8?B?QkVNRnB4UlEzZVU3M0VuOWFTRnhqckU5WDBSa3NDc0RBbURqeXRVWDk1RXRV?=
 =?utf-8?B?dk1RdWhmUVNrN1Rpd296L2RSVUZEV2xab3lLcXFYRllLU3h1THIvMDRHVXpV?=
 =?utf-8?B?SkVKdmY5UFlzVWZXeFVyVmI0THVsVWNoOE4wazdLbGt5TnllM2VDY3FQOWNV?=
 =?utf-8?B?a0xGQnFVNDEvb1JjdXBucVRNZHVrYWRqSWYrbXBUMUFLRmZUbUJFeFRIalNh?=
 =?utf-8?B?cW5VUy9pTXdmMVU5dXhwV0x1UDUyOWdSWG5lSjhVbXR0TDJsamxYL1JSTnRO?=
 =?utf-8?B?Uk5xUjc5Vk44TDRlU1ZENGk0UlR4TDZobFgxV1BZcHJ3Y2UrYTJYTnE5M1lS?=
 =?utf-8?B?cE90ZDdENEFlU24zRWZCQ081MWJ1RHN1bUgxTlF6aHFSQ043VzR2MGg4L1U0?=
 =?utf-8?B?NUlUOGF2N3VSVTJEalQ0VkFDUzd0SERwcXVqNDF5elNDdURMUkovMjBteDBG?=
 =?utf-8?B?aHROaEpMc3hFZVpWRXkxU3VBUGE3NzBlVExXTFVWcFo2RTFqUTRxVmhub28r?=
 =?utf-8?B?MVdKRU1SUEFDRHovc1dUNVZNdW9MVzNURUkzaHA1ci9zQlRnUTB5aXF6QXp3?=
 =?utf-8?B?Q0VpS1VFVzZsWTdqUytvVGJKNWZkM0VTeFJGZkwzYlN3MG1TTnVSRk5yRGNh?=
 =?utf-8?B?cloyUEs5RWpCTGdxS0ZCYk00MXJ0RzNEOG9IZWhFc2xna1NVMVlIRXJSa29R?=
 =?utf-8?B?b3JPMXFxSUEwSkV5aklCQVhaemRsOHR2MzhBRzN5ejBzdUF3UWxRNUw0N0Rn?=
 =?utf-8?B?SkNPZUhRcnFYUDJnTmxrNEJWTk9INk5FUkc0bThFcWErb0t5VHJ4aHFtMkRo?=
 =?utf-8?B?aEZLQko4eFFGdWhqamJwRi82d29Ra0o2VktVbVF1aFd6c2I4c0J6WU1BOExn?=
 =?utf-8?B?eWgwTThZQUd2MDB6YXQxWjVtS0lGWFcxb3ozUkp0eXZkNXhKQUR0SDlEMXdV?=
 =?utf-8?B?SkdPbHRuWTl1ZWc1eGRablhHSHFqbmZJZVJtTERMbnc5Z0xrWW5EZFNNRnBk?=
 =?utf-8?B?UW9uVVp5QlowbE9LYlJHc001VEFmVlhaMXoxWUNaQ1IvYkY2MXlDc0FjUUkr?=
 =?utf-8?B?UFhaSk04Z3p1ZndWZW9LVkx0dWNNOUlaWksxWHdzMkZXcE5QVTZEeFlDajhX?=
 =?utf-8?B?aXZJRWxDb3pIdUVEVnlxbjM1dE1EYW16ZWRFckwxRnV5dHR2UlplSmxVemNh?=
 =?utf-8?B?QUJNN09HMXlpOVd2M3BHcHM5RUM4S2RPVDBXTkM0ME42TG10YlYzek54cDR2?=
 =?utf-8?B?ZTM1cGlPdklNd094SkZRWEdaOG4wall5VkdIcVBkVmxrQUlHOGdQRlhSTGRY?=
 =?utf-8?B?SENiTnhpQ29hY2d6bjErQ01jVE5nNGNLSkhHdlBDSGR3emhFbHlhUXNPajlq?=
 =?utf-8?B?OHFnVm9BRVVqOWViVmxHdzRMQkV6MXNRd3hXSlh0ZHRaaDFBbzE3TVhzZSsz?=
 =?utf-8?B?SFpoa0JwQTB0aVlaSy9hcEYvY0Q3NUNYTXpZYlVFbHJDc05mTllrTzZuMDQ1?=
 =?utf-8?Q?OAjx2KqvJsglL9vton16E2zkd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f479141-328c-4c24-cee8-08dd9d2f8148
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:02:31.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIbd5npIFX5PCElUDi88vtrH+mZe2A7jKSFVNgi/dxwOp7xzHg1EkISI23QeLKqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147

On 27 May 2025, at 6:50, Vlastimil Babka wrote:

> On 5/23/25 21:12, Zi Yan wrote:
>> Since migratetype is no longer overwritten during pageblock isolation,
>> moving a pageblock out of MIGRATE_ISOLATE no longer needs a new
>> migratetype.
>>
>> Add pageblock_isolate_and_move_free_pages() and
>> pageblock_unisolate_and_move_free_pages() to be explicit about the page
>> isolation operations. Both share the common code in
>> __move_freepages_block_isolate(), which is renamed from
>> move_freepages_block_isolate().
>>
>> Add toggle_pageblock_isolate() to flip pageblock isolation bit in
>> __move_freepages_block_isolate().
>>
>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
>> so that one should use set_pageblock_isolate() to isolate pageblocks.
>> As a result, move pageblock migratetype code out of
>> __move_freepages_block().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/page-isolation.h |  5 +-
>>  mm/page_alloc.c                | 97 ++++++++++++++++++++++++++++------
>>  mm/page_isolation.c            | 21 ++++----
>>  3 files changed, 92 insertions(+), 31 deletions(-)
>>
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolati=
on.h
>> index 14c6a5f691c2..7241a6719618 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -44,10 +44,9 @@ static inline void set_pageblock_isolate(struct page =
*page)
>>  void __meminit init_pageblock_migratetype(struct page *page,
>>  					  enum migratetype migratetype,
>>  					  bool isolate);
>> -void set_pageblock_migratetype(struct page *page, enum migratetype migr=
atetype);
>>
>> -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
>> -				  int migratetype);
>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct pa=
ge *page);
>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct =
page *page);
>>
>>  int start_isolate_page_range(unsigned long start_pfn, unsigned long end=
_pfn,
>>  			     int migratetype, int flags);
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 8fcbd7fa13c2..44a08b1a9de4 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -524,13 +524,36 @@ void clear_pfnblock_bit(const struct page *page, u=
nsigned long pfn,
>>  	__clear_bit(bitidx + pb_bit, bitmap_word);
>>  }
>>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +/**
>> + * toggle_pfnblock_bit - Toggle a standalone bit of a pageblock
>> + * @page: The page within the block of interest
>> + * @pfn: The target page frame number
>> + * @pb_bit: pageblock bit to toggle
>> + */
>> +static void toggle_pfnblock_bit(const struct page *page, unsigned long =
pfn,
>> +		      enum pageblock_bits pb_bit)
>> +{
>> +	unsigned long *bitmap_word;
>> +	unsigned long bitidx;
>> +
>> +	if (WARN_ON_ONCE(pb_bit <=3D PB_migrate_end ||
>> +			 pb_bit >=3D __NR_PAGEBLOCK_BITS))
>> +		return;
>> +
>> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
>> +
>> +	__change_bit(bitidx + pb_bit, bitmap_word);
>
> Again the non-atomic variant, but actually below I suggest we drop this.

Yep.

>
>> +}
>> +#endif
>> +
>>  /**
>>   * set_pageblock_migratetype - Set the migratetype of a pageblock
>>   * @page: The page within the block of interest
>>   * @migratetype: migratetype to set
>>   */
>> -__always_inline void set_pageblock_migratetype(struct page *page,
>> -					       enum migratetype migratetype)
>> +static void set_pageblock_migratetype(struct page *page,
>> +				      enum migratetype migratetype)
>>  {
>>  	unsigned long mask =3D MIGRATETYPE_MASK;
>>
>> @@ -540,11 +563,15 @@ __always_inline void set_pageblock_migratetype(str=
uct page *page,
>>
>>  #ifdef CONFIG_MEMORY_ISOLATION
>>  	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>> -		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
>> +		VM_WARN_ONCE(1,
>> +			"Use set_pageblock_isolate() for pageblock isolation");
>>  		return;
>>  	}
>>  	/* change mask to clear PB_migrate_isolate if it is set */
>>  	mask =3D MIGRATETYPE_AND_ISO_MASK;
>> +	VM_WARN_ONCE(get_pfnblock_bit(page, page_to_pfn(page),
>> +				      PB_migrate_isolate),
>> +		     "Use clear_pageblock_isolate() to unisolate pageblock");
>>  #endif
>
> We might be too paranoid with the warnings given these are all local
> functions to this file so risk of misuse should be low. Maybe we could
> remove later...

Yeah. In the next step, when struct pageblock_info is used to change
a pageblock migratetype and isolation state, these warnings should
go away, since caller will need to be explicit about isolation operations.

>
>>  	__set_pfnblock_flags_mask(page, page_to_pfn(page),
>>  				  (unsigned long)migratetype, mask);
>> @@ -1931,8 +1958,8 @@ static inline struct page *__rmqueue_cma_fallback(=
struct zone *zone,
>>  #endif
>>
>>  /*
>> - * Change the type of a block and move all its free pages to that
>> - * type's freelist.
>> + * Move all free pages of a block to new type's freelist. Caller needs =
to
>> + * change the block type.
>>   */
>>  static int __move_freepages_block(struct zone *zone, unsigned long star=
t_pfn,
>>  				  int old_mt, int new_mt)
>> @@ -1964,8 +1991,6 @@ static int __move_freepages_block(struct zone *zon=
e, unsigned long start_pfn,
>>  		pages_moved +=3D 1 << order;
>>  	}
>>
>> -	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>> -
>>  	return pages_moved;
>>  }
>>
>> @@ -2023,11 +2048,16 @@ static int move_freepages_block(struct zone *zon=
e, struct page *page,
>>  				int old_mt, int new_mt)
>>  {
>>  	unsigned long start_pfn;
>> +	int res;
>>
>>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>>  		return -1;
>>
>> -	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>> +	res =3D __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>> +	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>> +
>> +	return res;
>> +
>>  }
>>
>>  #ifdef CONFIG_MEMORY_ISOLATION
>> @@ -2055,11 +2085,16 @@ static unsigned long find_large_buddy(unsigned l=
ong start_pfn)
>>  	return start_pfn;
>>  }
>>
>> +static inline void toggle_pageblock_isolate(struct page *page)
>> +{
>> +	toggle_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
>> +}
>
> I'm wary about the togle action, as we should always know what action we
> want to do anyway. So we could just add a "bool isolate" parameter and ca=
ll
> set or clear explicitly? Allows for some hypothetical DEBUG_VM checks too
> (pageblock is not already in the state we want it to be).

This function was added to follow Johannes=E2=80=99 suggestion of getting r=
id of
if statement. I can change it back, make it explicit, and add
an VM_WARN_ONCE.

Hi Johannes,

If you want the non if statement version to stay, please let me know.


Best Regards,
Yan, Zi
