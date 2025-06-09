Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DFA25392E;
	Mon,  9 Jun 2025 13:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475158; cv=fail; b=lqgqcv/5rKbvmYYaS9Af3kt+tUtSVT8nw6EbxdN4nt6WlTu51SpK+kevx+5c6fUAoHqc8hS5vkmmR9dm/CWf5G+m9XD7zjXVkwbT/LbW121OrNEX3fPVJqsRCRLIvG7uvJwie8uv5SDXih4ky2TXTmiea1B9C60c5pcuCmgiOoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475158; c=relaxed/simple;
	bh=QL6q2ygJ5ukKlIrdJP8yQc2sB9JmA9/TYKaDw/zjXA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odHhYwJLCpDj3/rYH+FZre/DNLnIAjyzXeQuP+dv9XkHb1xRwcU+nxxmoTsbUKDWidwREVVMDxCZfSAOAO1XWRGgG46t6EjJtYPycJx2rqniaYmqcewW7YKifsY1/EU6yoQCc+trHuuKVeRgpCgFaIHZq2z2vRINaSGIovogHi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GiIf66ic; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GiIf66ic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTEBV+ih9XJtHtvcCV2I+sfiSpKRVo4J6RUg50CLuuZpVNGoeYaHBYivCeFOwyi4Vz11KURvdkg2pF0uZKkZ7QM+QWZVsmOqTokQGR9y2nBcvwigObOvri3DgLEIvZdoYFFO5LR7xVeT6M56Are2wIpOGYEt9VQNeVvWw7GRJdd2jeH3rg2CaEh/j5lkc0qNFBov0an4jns3OAO7ArxXZcLqZyS73a4ud3SJetl9carankEIziMAUIiJcyUb2AEGzaYuTV0IJzXnsKho65gUfdjENnuH2o38XsjDLAjtGCTOPyWU/S5NuR3fqnB3kb6yrKCYF5IxTZySi/XNcgZEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQJEW5ZmIWl1ScSDscRnJdD9pgmv7U0K4M5LuXQXIBM=;
 b=NaBCD2GNepL/u9oe9yl53j46MFM8e7pgwayypjIwWUuXYr/cn3DXkTUYYCUryeqXS5xhYcJXYVPUr9OdMTscDbgD4SzbZ9E7h/t+kfsRU77/P2zLQd1BaqDbwm+ZH/CB9/RD+s7HShzwXQ5kKOFEZdChHkxPWsZ0mlpvn+fNPtwY1ARKkaFEUKVsHmbpQSg0Bswekvl/bBYhwDw1/pSiRWutwpnyK49cnWzKkQqEvhtay/LdrgaADtV/WLR0NkXk/hGx2xqk5cNV0xSmlFnYNqBuKOh1ceKx6dLvyamHZZlllhiMoAwzqmWeF97VT/Kx8KchhsyM1Q7vTRSWfnDfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQJEW5ZmIWl1ScSDscRnJdD9pgmv7U0K4M5LuXQXIBM=;
 b=GiIf66ickoxIHHVQiVu3pQFRBjN8ubP7JgSTvh0pcHJkCebz8gzgizwHtqx1I9/hOR+nd1dju3Y+uKM800URFyUR+6kCPBn0AFbYBN9uFntdDEB4HvBBKScb+EwV8gCg+uBCF/6m8PpKf0ZpPnmj1mo2kRyUqJM3yRkibM+zZt3X5b2iGfGY5yYd9qIrWWMV+liEQGAYQs8b1M1/RynPQvaJ4sHYyDJlA7lUgR+KkVdOj61eDK+dMaDK9duoJCPE0/MTR+7uJajYYOZ6dK0MrExVMWGQ5lWvlVQOto3RPyR0CIdKy5u3MXTGez0C0amZivXEg5c5QZfYW1UmTXiM8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.35; Mon, 9 Jun 2025 13:19:11 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 13:19:11 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 09:19:08 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
In-Reply-To: <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0265.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd31207-ad5c-459d-1f4a-08dda75838e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pzQcHGzqZoFTdB9P4UFj9AwzyUtM0M6Yv64R8AXAnrbP1ESxuP0VINbGkbI6?=
 =?us-ascii?Q?JLXnT+z6VNH+DHTAlnnKBa9UxF9+h0hkIHE97NsAhcgEBZgoHsoj6HuU+O7Z?=
 =?us-ascii?Q?k4fb6GG8gImoGK45PmalAPWmwHcLZROvHFLVWBvHBrMEfVqZAUTUcdq8V8FI?=
 =?us-ascii?Q?cULjU+hFflSYYGVHuf5l4n97ALgu/e16B0t+1A/5x8m2M3uHaw3Ez7UhF7j0?=
 =?us-ascii?Q?HhcxguVqxH61vSSFzWXeiu0gJPmrvD0ffpu4Aa0Fe1ts0Ds+MtMPTJk+atu3?=
 =?us-ascii?Q?adQD8TWF7+y4wUUzHL0nfpGEDz6y1R3MNHTqnXTotxutbTUD6/0lRuI7f/PL?=
 =?us-ascii?Q?kY/Meaquxclq+WV6H8k0Im5hlXH5ankDUqSuDsGmnJhAcFjAWsuIL103NW8a?=
 =?us-ascii?Q?lTMIkp2edRArCTZUdnEtokEW5ClnXWm6+nhnt6RCWkFo2QGFGzG0S6IznNv2?=
 =?us-ascii?Q?L7PvM6Jui5dRlyZiC5Bkqz+9kx/uQye2NnfjHeYa69D+9S1oDhcrFFD0CeYr?=
 =?us-ascii?Q?QL8D8IsQNzbE3KZCOHqriUv8FaVJ1DRdJ4bRTiY2NyIa8TnvqbKBrwlxdWlH?=
 =?us-ascii?Q?jWHjHfhxDmCx+jZO8gXOVg5ldCY7pj0N2vas9VIaSzki+pJWL3J/ipJ1ZviT?=
 =?us-ascii?Q?EdGnOu0kCRtdg1HRi8YvamII4lj7X1FlQe8MfBSiI9jnjRufv9zbZbUyp41g?=
 =?us-ascii?Q?lDK4+hskWRaDTTOMQhaOHR9q1O4p33mx4WtAlEttFLyx/8mVRzVisfDjSv8y?=
 =?us-ascii?Q?kzTeHsIadE5h5UBDQETpyn9Ma3F1GxjK1z93PNJ3Dp66VcAZcvZXRjh1ryQW?=
 =?us-ascii?Q?Af+yqIeznDDqI9rR+6qqVX/lpScwy4w9oRcvyn5wsEPJMFmT8iDyRLUdW9Z6?=
 =?us-ascii?Q?7yoNFfs8RRpQxwYEuo0SM82C/pX4naAsRfrrsQBb6m8nxAhc6OIiU5jOlPgI?=
 =?us-ascii?Q?WiV0gK6pSEhJHYHCx8Vzq611JuYu7TzKdic8UUDPkwQrlNI2nNEZlmLTl264?=
 =?us-ascii?Q?VXC4G7vT0th5Tz640wzOfPoyAlhzGTTnyc9EilgM4682HhQOzFsL+kCFSer/?=
 =?us-ascii?Q?bmCTy9RjSyLrb2IjnwVwinwkzoI2sr/xQPzl32bGPc3XZ4TXh2DuQOPQp/X/?=
 =?us-ascii?Q?kvxMrmDjjjxP32BAXitI4niM8Ye2FralDbhAO8SYcKXGggvgVagFpNQKPkeb?=
 =?us-ascii?Q?0Esrk6ZuGKWMIBxiXGstEz64bRKBptPH33eyTztRMh8hYbLiWeJPdY8iurv2?=
 =?us-ascii?Q?/tLiJTBq58iMTwyWN9ZQY6QY5o+7LcVZN+asoyUOZLM5b3ZZVaiar3UpeZuw?=
 =?us-ascii?Q?ySVt4IqbhNYhQBAQ/uE0jbDCmcoo89uHmEbu+lXrklxDdlKy9ngSMaXRs6us?=
 =?us-ascii?Q?wHoAt+SnRtpqbwEvejwx7bHeel+GU4lSmCA736SHWiuIJcyGLlimNj08tA7J?=
 =?us-ascii?Q?8mMNbFuQZoM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6B4TjNwIXJYxuhljEGJ9tX3oZvCtfZSlfnFBgQ2in+pvECWvhq6/sGt0aKdr?=
 =?us-ascii?Q?o6nBcgWYS/BMTfK9zN2ypdzFQfRkrLXdwWaoARvYBzJ4mumhyWemBk9kl8c5?=
 =?us-ascii?Q?hyyC2OjzIeRV2NU2N5bKQ3WkhYzpWYLrostMyDxrN+ONbnATux/amrB3FjZv?=
 =?us-ascii?Q?fUvY3WIblhYYqmLnAOKjj7YqWb3uVOKZxcF6lKVAZrRLu+93qR78JaxgAVSk?=
 =?us-ascii?Q?49HYFwNKDGbVdcREpf0znXnilqkA2S30zLpUxkg14eaYKPHSPt5SQXWghCHJ?=
 =?us-ascii?Q?9F3wX2asF9arnVdk9viEmglQpw0vcg1GIa5NjqpY20QJb2/ECaSVC/PmPYCc?=
 =?us-ascii?Q?7RoQtd6Wb/iZsb04TcEpGBTtiKUY/LaGGMv3kHUmDOG2gm+InR+JmvvF5CJI?=
 =?us-ascii?Q?snNd3FD4J42ctrcx8ja0LTWKin+FgOb8q3dZs1Sa5YAhIEFwpKRuhhIKeBaj?=
 =?us-ascii?Q?EKkenAVLG1i1esoMcX8RFn2pOJbOBuqL65OeB3jP8TYK07yeLVYAJ1zEl3oI?=
 =?us-ascii?Q?El8zgcNoJ2F6/20gZGcZzfGdXNZoBv3AjUE9onhGW9prwViYzwBraTMaP7Mu?=
 =?us-ascii?Q?+GL+uy3RJOSOzZ9Ic+1R5dOH6Qru7WklKJc+O/Cl6h08Ox+OMi4NdYfPi2tK?=
 =?us-ascii?Q?t4LAzL3dxZo0EvBCShqQ/IWOvc5B1qey3g+Hnjigf5l1F7UfrK4NdhqTdXSR?=
 =?us-ascii?Q?BVrTeJUXVCzglKJNBZdWm61XqR03pb3c2JtorJGXBSl+DHXP+QggTRACWHal?=
 =?us-ascii?Q?Lolm/D1WgYCefVRUHRS+2R10861/Z8DkSW+8kEPMyijuQq/7L4yhOxXKG1cg?=
 =?us-ascii?Q?ynjZd2LeXnjnXC9wgGzZoGpTluhuFm6n3Xqvs+A37V1JOqfwSoiibvI/2q90?=
 =?us-ascii?Q?OuNbTadp/53kl2fnyn8HPhdil0Ym6FkjMeGjy8cBM5UgdgK/MVtXDxzJ4A1R?=
 =?us-ascii?Q?/bz+szzVLQDsORDKwrsdlkyi49QmX5+4jNBAMDIWII5WyIAxGnYgHAOIh5nb?=
 =?us-ascii?Q?5aP0QvZKIDwvzbjIg4URjzI4rlCMNc1iSj8WA1NcZVLcYTkgMSp7TZJwRKLn?=
 =?us-ascii?Q?d3wdb27YrvBxjzjDpzn5PRE88c/0b3w7n2YkL6XPg4KmwIxeov+F2BOD6Ec7?=
 =?us-ascii?Q?3LKbEWn1byKzh9+2F1Pdi1xn7qLAoxPn1wnlRQ2CY4KN9H0+SH1xr6bd+9VZ?=
 =?us-ascii?Q?/5VBTNFtf71uvr6MBfxxvP7QO8Tcd7H6B7UyCj2CqYa6v35u3DiWSKkkSCig?=
 =?us-ascii?Q?HsmDCuLX/kwVVwaPrUdcxQwtA4OEnorCl9NwVfcvk9GSPjU5Ci9LN+KoUj8i?=
 =?us-ascii?Q?tsPnwahtnY/uJsa//LV39cd7psyWnFWV8ynEgNamDDCsLjJhqETHaW2QYZ2J?=
 =?us-ascii?Q?TXR6sZKYWvxyFoYcUEN3SGJEIGm13uorkVuxrng/p57NJCHQ3wk3l3zvo+/j?=
 =?us-ascii?Q?Xp8eF8YfPIkZxNX4VjvhVDb6UeyPOKkB7h5BKHk5Vc+nVLIEeYBBb3okd5Q9?=
 =?us-ascii?Q?YVnIWTIuNL0xbEaXlE2gL8wtec8TKwvKw5nym6w7JGykU0QKlsYIxC6Jm1Zk?=
 =?us-ascii?Q?tUYt6FwortLkgg59e15m2vfPOugG+2oYZHnlxrdC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd31207-ad5c-459d-1f4a-08dda75838e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:19:11.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxPP7ibX4GNxBx55P12h9f5rshOuBBMuypyznr+n8816WDjRRflfSHTg9VdxLvdz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643

On 9 Jun 2025, at 7:13, Usama Arif wrote:

> On 06/06/2025 17:10, Zi Yan wrote:
>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>>
>>> On 06/06/2025 16:18, Zi Yan wrote:
>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>>
>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence=
 the
>>>>> watermarks are evaluated to extremely high values, for e.g. a serve=
r with
>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the=
 rest
>>>>> of the sizes set to never, the min, low and high watermarks evaluat=
e to
>>>>> 11.2G, 14G and 16.8G respectively.
>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP =
hugepage
>>>>> size set to madvise, the min, low and high watermarks evaluate to 8=
6M, 566M
>>>>> and 1G respectively.
>>>>> This is because set_recommended_min_free_kbytes is designed for PMD=

>>>>> hugepages (pageblock_order =3D min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDE=
R)).
>>>>> Such high watermark values can cause performance and latency issues=
 in
>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, ev=
enthough
>>>>> most of them would never actually use a 512M PMD THP.
>>>>>
>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highes=
t large
>>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>>> With this patch, when only 2M THP hugepage size is set to madvise f=
or the
>>>>> same machine with 64K page size, with the rest of the sizes set to =
never,
>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>>>> respectively. When 512M THP hugepage size is set to madvise for the=
 same
>>>>> machine with 64K page size, the min, low and high watermarks evalua=
te to
>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>>>
>>>> Getting pageblock_order involved here might be confusing. I think yo=
u just
>>>> want to adjust min, low and high watermarks to reasonable values.
>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_p=
er_zone
>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the =
changes
>>>> look reasonable to me.
>>>
>>> Hi Zi,
>>>
>>> Thanks for the review!
>>>
>>> I forgot to change it in another place, sorry about that! So can't mo=
ve
>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>>> Have added the additional place where min_thp_pageblock_nr_pages() is=
 called
>>> as a fixlet here:
>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmai=
l.com/
>>>
>>> I think atleast in this context the orginal name pageblock_nr_pages i=
sn't
>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>>> The new name min_thp_pageblock_nr_pages is also not really good, so h=
appy
>>> to change it to something appropriate.
>>
>> Got it. pageblock is the defragmentation granularity. If user only wan=
ts
>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
>> kernel will defragment at 512MB granularity, which might not be effici=
ent.
>> Maybe make pageblock_order a boot time parameter?
>>
>> In addition, we are mixing two things together:
>> 1. min, low, and high watermarks: they affect when memory reclaim and =
compaction
>>    will be triggered;
>> 2. pageblock order: it is the granularity of defragmentation for creat=
ing
>>    mTHP/THP.
>>
>> In your use case, you want to lower watermarks, right? Considering wha=
t you
>> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,=

>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
>> is lame, sorry).
>>
>> I think for 2, we might want to decouple pageblock order from defragme=
ntation
>> granularity.
>>
>
> This is a good point. I only did it for the watermarks in the RFC, but =
there
> is no reason that the defrag granularity is done in 512M chunks and is =
probably
> very inefficient to do so?
>
> Instead of replacing the pageblock_nr_pages for just set_recommended_mi=
n_free_kbytes,
> maybe we just need to change the definition of pageblock_order in [1] t=
o take into
> account the highest large folio order enabled instead of HPAGE_PMD_ORDE=
R?

Ideally, yes. But pageblock migratetypes are stored in a fixed size array=

determined by pageblock_order at boot time (see usemap_size() in mm/mm_in=
it.c).
Changing pageblock_order at runtime means we will need to resize pagebloc=
k
migratetypes array, which is a little unrealistic. In a system with GBs o=
r TBs
memory, reducing pageblock_order by 1 means doubling pageblock migratetyp=
es
array and replicating one pageblock migratetypes to two; increasing pageb=
lock
order by 1 means halving the array and splitting a pageblock into two.
The former, if memory is enough, might be easy, but the latter is a littl=
e
involved, since for a pageblock with both movable and unmovable pages,
you will need to check all pages to decide the migratetypes of the after-=
split
pageblocks to make sure pageblock migratetype matches the pages inside th=
at
pageblock.


>
> [1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pageb=
lock-flags.h#L50
>
> I really want to avoid coming up with a solution that requires changing=
 a Kconfig or needs
> kernel commandline to change. It would mean a reboot whenever a differe=
nt workload
> runs on a server that works optimally with a different THP size, and th=
at would make
> workload orchestration a nightmare.
>

As I said above, changing pageblock order at runtime might not be easy. B=
ut
changing defragmentation granularity should be fine, since it just change=
s
the range of memory compaction. That is the reason of my proposal,
decoupling pageblock order from defragmentation granularity. We probably
need to do some experiments to see the impact of the decoupling, as I
imagine defragmenting a range smaller than pageblock order is fine, but
defragmenting a range larger than pageblock order might cause issues
if there is any unmovable pageblock within that range. Since it is very l=
ikely
unmovable pages reside in an unmovable pageblock and lead to a defragment=
ation
failure.


--
Best Regards,
Yan, Zi
