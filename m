Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CF12E3717
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751765668; cv=fail; b=FYu45i60MrezU+KB1SKuOqhTSGGrRy7yNZZ8b1xqxt9x4neR5S7HBtydzuMbnBhP5PcnTzg4s13DzInFdw0oTUeGE9+dNsRFhdlTRXXEervrbl1JkRB1F5Q5aWe0NSOez2Fj/dXIGYN60Zi/itj1AbhjFSA/sZDzqwE8shrBzfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751765668; c=relaxed/simple;
	bh=2pY8FzYmOwChhEDs8i0oLowCixboAaY2EnqUsKfglQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oreVEjpwU2L9i8wSLleixQnv072bBVQs37uwaFNnbwBhtnE+pbdsV00pOWKMj9Izt29hMYNN28A0EQLP2jtVazkNLqLuVo18BI80Wpu+wmWSVSEWBSRJ/BlaRjN9yRPTbHmyQNcKfEgWoFlBx7joU++5VXyUxDAiG7fScuuHfvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k7tO0QPl; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k7tO0QPl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1OkUjHCZjnoluNxnAUiYoERjuCjobq54ZarMpK9yh2TNDZ/kAq3JPtaGnfxtMautaR05B9gzQC0hndWObdLkeCsOSrrVx6UoClWPXWcVMILRtGLcOhDjurbg0MTr6UxZ9jJub5yValNHzaJMmYrpW69sSAdZMe261brIWbKI6+o3JuMC+/6QzuJInk8cvpdk5DmrzmVUMndBT1Bz50jzMb3CgCjweMAgzcuUj3/5NdcCeSNrCCh8SFu3mKfbrJAgy4Cek9NHAXNyb3mcdy/gfLgx0Il++r89jzH2KGLDHcXyIMZQZvf0Rtg2EUs6mEcPE5AGzRtLzbjDBei6qqiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSZl6HK65hQOvbbT0m7q77PWtfm2gjc/5vrFBbdgfjE=;
 b=ZXm/60GrvQuNIfKMosu8gGoSfGXrI5BdjOBpaopn59tstCitfHjVJd3CmzSfWLShZB06awot0i2XA3il5gnA2J4zkQ8JCaJUWMQPIU1BTXa/sIp85MnfSfO6jMTJH/ev0Z064y+dYbnyv0Bg9jZA8FAo2dnfrBSehpTmJsQRmcYZtCkW68sGotqzEhJ4Pnk7MOdhq61u+Ks2jIGjrBhJRr4Zibkv1WDAHo+54n/2ghc6cPd1i+v0CkmGYZzfoXppgip66lyl0H7vU2tXOPP86P3wYLUuWN9EupG+GbgxXXRmimfun2nkUcu/woTmO+54k+ijD1mX7dXNM3x+hCfYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSZl6HK65hQOvbbT0m7q77PWtfm2gjc/5vrFBbdgfjE=;
 b=k7tO0QPlE2vF8FW5fCs325nC9X48nh64Y+8SwwecqXwRTcsrWnxQQtxSarxff21HGrZnds1mp5EfR8Es57Ge9zQEKIrDqcKbLcKQZCtan6xZzZDAXKDHLVsWGhncbbq0qI5vt5MayWHOxhEO1sX7oIAbx6EozunCRetjdT8mmx7DC+O1bqkbNqH5izqtK7aZr+3CSnYi2IePSJKCtWZLe6loEBrNsLnZji1LRA+rGc/BY66y0fRXLxBOc0MC/SaMtlk6ouaPEgCMf4HWZa/GfAWVwNNwI3uF1rjSw1hwTpJ0EQK/4x+biluEdX9Qt1JUPaNH19j06AnaVslDnQkKaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sun, 6 Jul
 2025 01:34:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:34:23 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
Date: Sat, 05 Jul 2025 21:34:20 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
In-Reply-To: <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:208:32e::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: e362953e-44f3-4fe8-b6ce-08ddbc2d3c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WhM3ecyikKHvkhQsJv8LccdifND0D9IhsnhRO2JnhuGDNHqGdsMOaTifQhS?=
 =?us-ascii?Q?jrnYZzIwZd3KU48z7pRVov3FdQHnrXEcZOKVYfHGGIgFZTgcYMaiMCafQQ0N?=
 =?us-ascii?Q?UzgEWdAZ/YtUkM1xCCB7jZMWTqTNvZIaAxQMSrEUMhCkoeitBxdCcclPyKDE?=
 =?us-ascii?Q?z+LGrObzgk8fhvvOAScmKHQSAvXE6uXO7ZuiUfubtL+CcfgBhFUKlpkk9c2V?=
 =?us-ascii?Q?y6VkYYVtN8OdzpdWD7uS64U9Sk9xfg2zNu7F3MaebEMrlaXBGNV3GSi4TxY1?=
 =?us-ascii?Q?lPCNptLAbikSmTtE+LH4RZ1vr9O9tbk+tjE+fqgXpl5wLHDztCgGXYCa0vjO?=
 =?us-ascii?Q?EIxE5zKzhLEiHSWCZiNkGwRyDR0MfmIOPbrIv/z8f8Db3TQpjBzOu84YnROS?=
 =?us-ascii?Q?CITJwJgV8YD+bh7vFSB4/LDoU2tcs6diH4bwWPFy1WnP0NIr43cxq6yYO0Sj?=
 =?us-ascii?Q?eqmi+bNVE9k0CmT/GlMH/j7iiDo4IouOKJabHayFVaNi+oO3sfArlQn7k9xn?=
 =?us-ascii?Q?IJM2IZjBc/8UcnLjgSy9WqQWV8hZq76yro7rcqUMwG5JcYH8/Sf+GsWkXQab?=
 =?us-ascii?Q?kgoNUSFG7H90dgbTy1Dbm5lECKYdhFizQM26U1JhBCOrhxwI3HvK+P5Mw/Hs?=
 =?us-ascii?Q?BC5MHrqAEtkJY2dOk5KQUTyfMh3MjmHYbjrrCRA1aGCUZyR9Me6G9j9rfAN2?=
 =?us-ascii?Q?DEPXYHgV/TSkeB9ycvWPg8SQaUToaXOSQxcGPWoGjEoKqvWrL8+YyyaVzZsM?=
 =?us-ascii?Q?QmYQTohuTC9f67c6K76mOon6vm/C7c000JChtS0ssE0zUU6WCT9zQsYbH5cC?=
 =?us-ascii?Q?1xsXtjPtE6fyaMuIXbz5HmNfB2CEWmFxmvZiehmwplSMhJjeyE0mqHbu+R5r?=
 =?us-ascii?Q?GQWUNDP4P0mybn6Xk9Zvv2JdnpsG5bxEH4MVrpMHcD7EPQFIXtc75hoxUc1k?=
 =?us-ascii?Q?e0tg8W5r/d2YFptjoo/iYJvNzKoukKJ6r5iX4427v/KBn5hTZYbco6uy3hCW?=
 =?us-ascii?Q?mtvOd33T6ZZjpH0qva1RDyxUbbeiERsyquHp0u4jvs+cl5wTT2ezM6tVzqaq?=
 =?us-ascii?Q?M4ZcPgZGNg2yb5ndxNNgYcW8qb/Lx09NuGf69XEv4x2JSyIQPc5df0TxLy/+?=
 =?us-ascii?Q?0BZyYn4NJsYRhGbzAEbCeUys4JvBKsYT0dUFLjbZ29wgYfnMGNHCV0T3tSxm?=
 =?us-ascii?Q?zpIic+jM37gOBy059X6Dyve+ZTwVTOGe7ebMk/hp0T8dmOgGr+HRFg0TkOrK?=
 =?us-ascii?Q?F7P9pWq8IrLxU2daPytmA9AhKn6itmg30fyVtmxo43NzXCk9liw9Hq6BOMkO?=
 =?us-ascii?Q?GdlDnYOcrEvCWvGZ/bMnjkQ+EwjTxkz2uqs5sey0upLTnFR5E3Vx0UY0N0Ol?=
 =?us-ascii?Q?aqQf5936CcPRyngHM2QCq+L3k39oVMzTkzKJd4S+AFx0uiUJREtnTEm7vnCz?=
 =?us-ascii?Q?4rEMvVXN8KY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OcWxXA5Kvz6mIhpOIoKiiDgwVAk5Pt2x6684sFw4fEklREe0HDUCNrnlaxpU?=
 =?us-ascii?Q?3F7zqnJVw037XYMZZR7gqlcB49Sp1a2jYGLgB+jDLxyqDYerGXM/1G8FG9y1?=
 =?us-ascii?Q?3XGO0Q56VItJQiiEJaKzmQ+r9y8c7M/tRNhBHJ0EkYaOciNwWME7uZYVFXyn?=
 =?us-ascii?Q?cP4zersBXNB73INegYSYjLuGjUjeS82HCUfF4Jw/fCg7RezZW7oMCQYi3mSM?=
 =?us-ascii?Q?dlFwB+xYvC7PfAfsrGVZv5eOLM+M9vdzyViQ0RDQkxDO+2np1nWJvs5J2RJJ?=
 =?us-ascii?Q?CawbayRBJB6v2fMCetMCJXZVzdoVOlo+f4A6lbiSPQiAZsHcapqOGQ9zXiJP?=
 =?us-ascii?Q?XhJzOKZBc1bMVuGLpCxrUYg6jVX7l7KuJ1d9L8vDQnkaYNcNQpfjNTNZqRm8?=
 =?us-ascii?Q?gde2QMbqrAL1EYBB5tFILOybI1kE2Hh/W2YAwMCRC32lLWyybStrrTBqAiYd?=
 =?us-ascii?Q?0iIYHZy6hG/gv9HFTkJWGMkdk9pFZUcCPlb2fy0gLxnKmLrhAfNjvVGJk92l?=
 =?us-ascii?Q?ncvCBydC+j3RM9T0bvU7KrfCyPEyrspU+Dr7pZIPlt+g8gXKGbUYmF4OVWSu?=
 =?us-ascii?Q?gAkdoTse536uztQavKpk8u5GGHAEV5DhmQK7SK4wRysmUU2ox3r6aLjHgYg2?=
 =?us-ascii?Q?s7GZFvYrWmgP2PGNJaRocVH65fOO2zp31yLnyuL9SPYKDfp1rP83t/ZpWVj6?=
 =?us-ascii?Q?Qulv7IRRDdSb9G6eeS6rCOxKBCtG8KGxtI+CnBJu2IotCfTmCdAOE5HM9pq6?=
 =?us-ascii?Q?bSt69V89hqlUQk0KiYpTDK8KF/B7++uyvkiuV3nH/gQHJVRKJv+AIBqBNbrp?=
 =?us-ascii?Q?NschDOKZXFHVRB12dT7pOH5cPUSW2fOdgzK5MgZyvsN9Bh3E3aKA2VnOdEg+?=
 =?us-ascii?Q?phGQDg8wa0pKyrptY7zH6j2TqGBsSAh1v5RWKBZMEGv0uRxN8pqot3hr+kR5?=
 =?us-ascii?Q?PP8g9xAtJ4A35fEKeyrFS2bRfmmgNAoTlcukoem3W95sh7WXjfLBjttcyWMF?=
 =?us-ascii?Q?ixrA02cMHvcEriVBY4BujS6cZD8jOfeSn9UII3ZI+xyGkxWxNw2DIS38VJJo?=
 =?us-ascii?Q?pa8EuLqfqE96mbfECuEC3tUgdLVcTe20l4IJXF9uEWGnVaCoPZ+/Fz5cVC9r?=
 =?us-ascii?Q?A1Jyu4/FBWWOE5ikhUIPVfaRh3DqHEEYwvj8FK0gy5aud0Y/iOVcaBUG1dAi?=
 =?us-ascii?Q?6fyFJhRzrXqLfZVAcKYU+bbAcDs3tmWK/pvQ7LmIHZXQKgkwxMubKzSg8JAg?=
 =?us-ascii?Q?D3doLUKtHW916hYus4artMxfClBfLcLJi7u0l/+gU26mx004pvvYkT0395uS?=
 =?us-ascii?Q?hh1NyBV/cQRhA9nnyADUVZHwpNvU03meSH3sVCwYOlS3W4H46vhmCInbmMvw?=
 =?us-ascii?Q?jxerD3/XIKZ6Z67OCWvlrsV31JSouW3Nie+zAudmZ8stTK7zs3EM8PkCNRgh?=
 =?us-ascii?Q?W5XiJ5+n6fniO4nk5Xohuv20wbjvnPmL+aZ/0Hc8NaHnWZWQ4xXADTUGLSAh?=
 =?us-ascii?Q?tBHSD9zFWgsvS/qTLhauK5KU6nB006bUt7DSIul39GUe0CfUauOYx0MLxUsT?=
 =?us-ascii?Q?psbk3XOBmMOLFWg1y2UlF1WKD4W0kOPmVxX1tO00?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e362953e-44f3-4fe8-b6ce-08ddbc2d3c7b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:34:23.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s73dlXiCiV2VIqRYE5T4SHlHIySUoOsvuVkWt0axvr7uziXmt8l2VTJfh+cNRB7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996

On 5 Jul 2025, at 21:15, Balbir Singh wrote:

> On 7/5/25 11:55, Zi Yan wrote:
>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>
>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>
>>>> s/pages/folio
>>>>
>>>
>>> Thanks, will make the changes
>>>
>>>> Why name it isolated if the folio is unmapped? Isolated folios often=
 mean
>>>> they are removed from LRU lists. isolated here causes confusion.
>>>>
>>>
>>> Ack, will change the name
>>>
>>>
>>>>>   *
>>>>>   * It calls __split_unmapped_folio() to perform uniform and non-un=
iform split.
>>>>>   * It is in charge of checking whether the split is supported or n=
ot and
>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *fo=
lio, unsigned int new_order,
>>>>>   */
>>>>>  static int __folio_split(struct folio *folio, unsigned int new_ord=
er,
>>>>>  		struct page *split_at, struct page *lock_at,
>>>>> -		struct list_head *list, bool uniform_split)
>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>  {
>>>>>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(foli=
o);
>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>  		 * is taken to serialise against parallel split or collapse
>>>>>  		 * operations.
>>>>>  		 */
>>>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>>>> -		if (!anon_vma) {
>>>>> -			ret =3D -EBUSY;
>>>>> -			goto out;
>>>>> +		if (!isolated) {
>>>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>>>> +			if (!anon_vma) {
>>>>> +				ret =3D -EBUSY;
>>>>> +				goto out;
>>>>> +			}
>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>  		}
>>>>>  		end =3D -1;
>>>>>  		mapping =3D NULL;
>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>  	} else {
>>>>>  		unsigned int min_order;
>>>>>  		gfp_t gfp;
>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>>>  		goto out_unlock;
>>>>>  	}
>>>>>
>>>>> -	unmap_folio(folio);
>>>>> +	if (!isolated)
>>>>> +		unmap_folio(folio);
>>>>>
>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>  	local_irq_disable();
>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>
>>>>>  		ret =3D __split_unmapped_folio(folio, new_order,
>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>> -				uniform_split);
>>>>> +				uniform_split, isolated);
>>>>>  	} else {
>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>  fail:
>>>>>  		if (mapping)
>>>>>  			xas_unlock(&xas);
>>>>>  		local_irq_enable();
>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>> +		if (!isolated)
>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>  		ret =3D -EAGAIN;
>>>>>  	}
>>>>
>>>> These "isolated" special handlings does not look good, I wonder if t=
here
>>>> is a way of letting split code handle device private folios more gra=
cefully.
>>>> It also causes confusions, since why does "isolated/unmapped" folios=

>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>
>>>>
>>>
>>> There are two reasons for going down the current code path
>>
>> After thinking more, I think adding isolated/unmapped is not the right=

>> way, since unmapped folio is a very generic concept. If you add it,
>> one can easily misuse the folio split code by first unmapping a folio
>> and trying to split it with unmapped =3D true. I do not think that is
>> supported and your patch does not prevent that from happening in the f=
uture.
>>
>
> I don't understand the misuse case you mention, I assume you mean someo=
ne can
> get the usage wrong? The responsibility is on the caller to do the righ=
t thing
> if calling the API with unmapped

Before your patch, there is no use case of splitting unmapped folios.
Your patch only adds support for device private page split, not any unmap=
ped
folio split. So using a generic isolated/unmapped parameter is not OK.

>
>> You should teach different parts of folio split code path to handle
>> device private folios properly. Details are below.
>>
>>>
>>> 1. if the isolated check is not present, folio_get_anon_vma will fail=
 and cause
>>>    the split routine to return with -EBUSY
>>
>> You do something below instead.
>>
>> if (!anon_vma && !folio_is_device_private(folio)) {
>> 	ret =3D -EBUSY;
>> 	goto out;
>> } else if (anon_vma) {
>> 	anon_vma_lock_write(anon_vma);
>> }
>>
>
> folio_get_anon() cannot be called for unmapped folios. In our case the =
page has
> already been unmapped. Is there a reason why you mix anon_vma_lock_writ=
e with
> the check for device private folios?

Oh, I did not notice that anon_vma =3D folio_get_anon_vma(folio) is also
in if (!isolated) branch. In that case, just do

if (folio_is_device_private(folio) {
=2E..
} else if (is_anon) {
=2E..
} else {
=2E..
}

>
>> People can know device private folio split needs a special handling.
>>
>> BTW, why a device private folio can also be anonymous? Does it mean
>> if a page cache folio is migrated to device private, kernel also
>> sees it as both device private and file-backed?
>>
>
> FYI: device private folios only work with anonymous private pages, henc=
e
> the name device private.

OK.

>
>>
>>> 2. Going through unmap_page(), remap_page() causes a full page table =
walk, which
>>>    the migrate_device API has already just done as a part of the migr=
ation. The
>>>    entries under consideration are already migration entries in this =
case.
>>>    This is wasteful and in some case unexpected.
>>
>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>> PMD mapping, which you did in migrate_vma_split_pages(). You probably
>> can teach either try_to_migrate() or try_to_unmap() to just split
>> device private PMD mapping. Or if that is not preferred,
>> you can simply call split_huge_pmd_address() when unmap_folio()
>> sees a device private folio.
>>
>> For remap_page(), you can simply return for device private folios
>> like it is currently doing for non anonymous folios.
>>
>
> Doing a full rmap walk does not make sense with unmap_folio() and
> remap_folio(), because
>
> 1. We need to do a page table walk/rmap walk again
> 2. We'll need special handling of migration <-> migration entries
>    in the rmap handling (set/remove migration ptes)
> 3. In this context, the code is already in the middle of migration,
>    so trying to do that again does not make sense.

Why doing split in the middle of migration? Existing split code
assumes to-be-split folios are mapped.

What prevents doing split before migration?

>
>
>>
>> For lru_add_split_folio(), you can skip it if a device private
>> folio is seen.
>>
>> Last, for unlock part, why do you need to keep all after-split folios
>> locked? It should be possible to just keep the to-be-migrated folio
>> locked and unlock the rest for a later retry. But I could miss somethi=
ng
>> since I am not familiar with device private migration code.
>>
>
> Not sure I follow this comment

Because the patch is doing split in the middle of migration and existing
split code never supports. My comment is based on the assumption that
the split is done when a folio is mapped.

--
Best Regards,
Yan, Zi
