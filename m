Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4C19ABC2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634854; cv=fail; b=XdgoZZ+cpTthnx+hKEq7LMYdaBJT0LO1gLKTHisD4FAklg35jvU8OQa9eJV1LVIaJbMqhoKYeSxjKNpDG0oqfie/W0Ih5LUNq/98UPZwzg/bu6gR66e/+WV6ppAqyQAyX0FQ+yORKZwpVb3rBHwaR7Epx90Yd1P1ht9Z9ggk5oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634854; c=relaxed/simple;
	bh=ZJ0q7gRoBQBANU38C1htiJrcEOQKiU/nZmnn9nL1Kfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=feMNZbVtA/lMI+LtDyDskW4yuFx8hFib+cRDtnPnT6Tsz6r8B2VYswiFY/4lW1qnSNfEBcxXJq465lx7b2LMCReGp8WPS5tHx2HUrKIYasaKouApEW5oFCQW+nRUBfu8EcWwZnwjXfwljbcTiKSEQ7iW+GmUrJfCoRvrgovPtcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DJPuxO20; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DJPuxO20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcTY71JmWQDRrT5kDuT/xuJmR6r8DMB9vEQPpqAo5arLanbQG7mKIrTo8BuYsc2WYHWqGew25GtpjSpXbAJpMCF0Mzx6liJGJtR1z7YHUS/vZ8Lyrk6/4gpD94KLGaAVEhjvgQ7OrykcS17Opg60LQZoZhZAkk8aLluQwsOv8/r1W3qeB03jyzjy5MKJRw+lBAZDppnuAMAkJwvcjWdiDNIBx8V5S1G+UBnTYN/vHeE5KMVzzvDf3/OZGYcWr94+piVN11HnHQU3Ay51Oj6IRz5Hy5HYCZGDeeaShLjHH4Fedz8JBzHzQu5tQyNyvT+BH06LoRYpr6mByl3Ep02IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2gajM2gwSLC4fetj0TNlYJ2M1MY81R2cKGkwiZNqLw=;
 b=xNcI9eq2gQmPXa6Qgq9ZA5TnptvAftJYLsu/qxwaTtKRxJG49LX3QkQuVlsovX295tEy4cxurGY31gHj0gDtRY5fkDXvVHyJQb7PSn4CBzXEjwxK1piSVOZvfC+xNJVNJDw6BpZV9ZxzY/v0XwOtQ05r9UuzoinKb3wapy925FvQUhbUiEwoelwCP0fgxNk5BXP3S8BmqceIj0GQvaEUaYN3aCi6VyyJFXvK99tRVJocElE/1onc9NXwyf+2lWV7WHK/IVUzscUZHf6ocC7VrbiOWLN5fNSKQ1Y71IiDFGaCPFIcN67zjXTw81++u1YPsAPbujfN60lYd16GwnFGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2gajM2gwSLC4fetj0TNlYJ2M1MY81R2cKGkwiZNqLw=;
 b=DJPuxO20qg0On9k3IxQ+OI2DfdKiBRpbY+a8ZCWOYNlDwejBMo7vTstkrysObyODSADsbB6x4CPyYXn58NXdeK7UxJZDUls8PuMGklsQlJpsSF3afPQfp6676DHIC45rSn9wnx2R1kb5X7wAlODYNzw4FvMb3YMk35HLMqzkQtsYxn/LoU6hdGKOYiwUm5zryBNw54bO7NWQ7HmNigHn+l8DeiwXIDPDUT8Oip6y5byuOY1hQqg4Fmq0pFASNCyeoNenBnAsqlVIib45rUWQuFmQAsIS4S8euaBZFuqsz/xIfUnkD/mJ4Gn64CDqysANA68B3nejfmqe1G08UU/bhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Fri, 30 May 2025 19:54:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 19:54:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Fri, 30 May 2025 15:54:00 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <17E8B9A7-2E38-43E0-AEA0-248711BF619F@nvidia.com>
In-Reply-To: <41b9f35e-6ce9-4d2d-a2d5-f1021648ac37@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-5-ziy@nvidia.com>
 <41b9f35e-6ce9-4d2d-a2d5-f1021648ac37@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0442.namprd03.prod.outlook.com
 (2603:10b6:408:113::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e7801b-4e81-49ea-104c-08dd9fb3b9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dbSVNOF600ALweKKVPSvgaFOFZ87ScEy3tjUwjttBaZB/kx0xaP1ImLwHNGb?=
 =?us-ascii?Q?EqsLGoh+qyleo6mJ5QuWd34L4lXV1mgmPgmvI9lJSDXbw4/LQAq2QtlTcd/+?=
 =?us-ascii?Q?J/ncl0a8lv/CoD7miH7P8QNXv7scsbR4CynrWvu7U2Mv7BT2tv2DLq8T3xZm?=
 =?us-ascii?Q?dj+9pu/o5Jsr5jM4sCjptppaXnyHmjd1Xnyfl4SwMR84+DUbwBjZSdKijtOw?=
 =?us-ascii?Q?FS8uL+5o6DFiiQRP5Z+CI4iEw8+uowyj/CK1MRzi/3T6XhetbNz49sHv2uj9?=
 =?us-ascii?Q?IIiGxR68F+lHftRPYa949bO1saC1JAtcCJeqWZejeS2eHAZ/ex4ZT1+aDT2d?=
 =?us-ascii?Q?chzpdl7Y43+GcMPZgFdlwRems6Ii+xpnN0l28SvRscaknavPQksvmwff0ae4?=
 =?us-ascii?Q?x3c+6aoblIc8Iyxly1Mdh3TGJ0poG5cgHIv42T3r/a44DVh4PSl8xBcEfOgo?=
 =?us-ascii?Q?7lrEAOkORvz55pBtJ0Ihm8zn5E/oEy1r6urjQdWamseU7AG7fuM6rFWU73si?=
 =?us-ascii?Q?jo9gtMymDwORauze1DPG7a3PF4ep2mFolPf5r/oYhcTcvUq4Yw1MWmsga1U5?=
 =?us-ascii?Q?7yQlUTr+iIopMs+Lk0T78sBTdQD0fpXvzY5Ogljh+IR+33/Gkn6iBpKd6ze8?=
 =?us-ascii?Q?c9i0V0kDZ+h01+e2z5l7Xekr1SNPLgBZ7pO1hLiC0RXRhmSRhIthlChHN74H?=
 =?us-ascii?Q?M0RBQiSaRWgtz55v0962qxszThrrP3GdKDzgMwPunLT6crnMSBGl+wisJ87q?=
 =?us-ascii?Q?A/j+LzWuuMInuA0QSfqnXp9qpZhB3Yr21cdO/4PqNW3uK0PzZRGCJYLQAj6h?=
 =?us-ascii?Q?fa8OxAgg/nrjtBNGhi0V0MNha9gTAEWlg+MYv9YHpxcRi9S5EP+j2wYeYPi6?=
 =?us-ascii?Q?7ZBqDQ2xaxSiLqdsfE1oIKs3FCVQmd97LmZm45lJ9atQcVLNIy0KkHkMc5LS?=
 =?us-ascii?Q?+EyUxhCfBOLHy6bRVFIG1Ong77fD2AbB+Tw/OyoQMO1I8EjmnOtkhVEhYQjA?=
 =?us-ascii?Q?ud/vuWdi+ZPOquLCNT2JAyrnexvn/6IcC4adr4YcC3kA2fV0cJJ669bhUUAY?=
 =?us-ascii?Q?O0JH5KhFJq/FF51DswNRISwXB3plYCMPebYBvExdvQobk7/lnR/NJeX50cRg?=
 =?us-ascii?Q?lOGXgx7v925Qpm5KNmKAvvd478Jtd5YwnTyUQnLJapAO4K8SO4y8IZrCMWQq?=
 =?us-ascii?Q?PRgj1uTu/fTh4y7uO7PPfIoywhK3fIalU4uJQdroo+92WuYXxNFgsQocpfPR?=
 =?us-ascii?Q?2Dm47FoWd019FtBMLl3jYQ2cK4DAgT/ToDp7sDefZ59XxPx2wYkSE+qpXKcN?=
 =?us-ascii?Q?zebCOrnjXlk5/8bLx0s8bJHEvtda1QdQaS7f/9YqTfXiScuL2sc2eN8JBlZr?=
 =?us-ascii?Q?g44P1sx98G+OAHX4yttYQafInXjyF/AUkV9h/DU4NhFllvbFZbg8aIm1JhD5?=
 =?us-ascii?Q?JREdH4ZeFWU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AGPJdtCajegSVULGYD7OoDGVCvd5D7i2TfVEpMF2QnnAjD0V0RjKzhY5l9FI?=
 =?us-ascii?Q?d0TQf4C4f573P082L68NzUzFRJCUF57ZWSkACRRVEhtOPBRdfg0PHicwQBNO?=
 =?us-ascii?Q?YZ231n4hgV91d8iZIFk5GpqAGkKbL4amuzdE7eOMUD6j9KvXG8i7ccsol7J0?=
 =?us-ascii?Q?Pq0ouTs4vodBBapUZFHwchhczMyY7trSVSaRmL+/g3fT2BAT3WeafvQyZ2hD?=
 =?us-ascii?Q?bwQe2T42FW5XqNNQiBjVcHOfQHZjsYCsi6kF8ryHqpMg5omWewOh/LreQQwC?=
 =?us-ascii?Q?Ir8YWnkTXuiajCmUMbs/BOFa1Zzp4MEp1nQlLX1yobi3DR0727Rrq80s5Kxj?=
 =?us-ascii?Q?IAfiHaXciV1UkgmiCpPfiHEyxPvc8QN+45zNLbH2A/Wu72t7ZAUZepb5MxAw?=
 =?us-ascii?Q?KouirdKb1IbuaS2TWEqqdyjm/96eENijxXdawphsZRj07AHf1ObEvdqw7VkB?=
 =?us-ascii?Q?I/Rri7k5hSXRGez4A8M9iM2+Sxc75NjU+ptJP+JVIMddciwh4xnpdKXjqQz+?=
 =?us-ascii?Q?AUQt0eGs+K6fhO9TFK5E9SezQMU+CfLi1DQ7XfE+mA3BCAPXXDa7MuQa9HOe?=
 =?us-ascii?Q?MGtXTsWwK0ef6ZSuqQEQtLU8eken58kfdYOrYunZjc2W0/FA8SeEXLwtQfpL?=
 =?us-ascii?Q?SnYRS4PCFE+aDTlUEBc6Lhwia08sX84D1TrhaM1eKukEPvUZ8JeJ/N7BC6TH?=
 =?us-ascii?Q?nyDeq5Vyy0vRWTaCaHEWiAZ5DXHtbn1apfaKWA9Cv3WvswXzpqdxy2oo3kJA?=
 =?us-ascii?Q?4BIJvs8QBf8QDkvfT7dNK8T+5ul4nMYvBkvC3V6m2NUfVkWVp+D9nzmF0rxH?=
 =?us-ascii?Q?K2+d7eU1wjrU0oBPkBHw92ElbUVoV66Nuf3oHdmB/BFNKXkA7idw++XMm0eD?=
 =?us-ascii?Q?x3csLt7uWvAfaAjojmXP/wz/m3hyl6S1bupjP+ovwcqQJKnkDlhCC1ieUKHr?=
 =?us-ascii?Q?fRTbogT1xyOoyHTBHc3J6rBnD+b/29vJeclSUwhp/jATK4z5xmYcUQngXMXd?=
 =?us-ascii?Q?qW/JxcqHqdqag+cvIqfKqrzvEnB2quUhhK6o/UA3kokpnaj+iqQX4dYMLjWa?=
 =?us-ascii?Q?bAALwdF/yxmSPAFAgkVfhN2IzXgPlvOKJKYFSoCrJZXEIs+NLKET/GYhBKBi?=
 =?us-ascii?Q?ueDYvxhKmEROnyy85pSdB1pUOerGWkaBtCrRVHVZK0iYytPuC63bHJ69fUDG?=
 =?us-ascii?Q?XGgNYoFTxkw8ECEZJS91uGrxPKo7cZVyE1a6siddFwVIUqeV5BbQ0fRIrqQS?=
 =?us-ascii?Q?YdhEO94rcbKrQXilY0NEwpqpHbOCirsPPKOupOrKpSW0XxNP0/HvBdMXKJov?=
 =?us-ascii?Q?SETMssxFYL+h3D0oFh3T0I0rGfc6HhyG2TTBNqE2cwdYA/naxMDinZQ6Fjw2?=
 =?us-ascii?Q?VbMJxKcR7gGpTDq41HFV0ifhu84CFtmlZBzyOvHU8ELTDhv3yLtpykRAY/FR?=
 =?us-ascii?Q?xbm6m0+QTWVZ4uS3fjFvuhrQ0w1YqZekTZ1MBkA62tfTsVyfW/WxxCtEs+N8?=
 =?us-ascii?Q?K+9gwNcks6xvjRcWHaXz3Z1iP6W46H6LdPBKHS/2pesi89MFAtERE5+FsN7i?=
 =?us-ascii?Q?9JSsiQ+gB64NG6GQLhG0pA/vfun1Ex+KpBrPGABk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e7801b-4e81-49ea-104c-08dd9fb3b9fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 19:54:02.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wm+/7DPvkg8stkWcFxiDtrypwvzhcvDHliOfZIXtmHjpzspnmbBVS/qXwJyP6F0u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452



On 30 May 2025, at 15:52, David Hildenbrand wrote:

> On 30.05.25 18:22, Zi Yan wrote:
>> Since migratetype is no longer overwritten during pageblock isolation,=

>> moving a pageblock out of MIGRATE_ISOLATE no longer needs a new
>> migratetype.
>>
>> Add pageblock_isolate_and_move_free_pages() and
>> pageblock_unisolate_and_move_free_pages() to be explicit about the pag=
e
>> isolation operations. Both share the common code in
>> __move_freepages_block_isolate(), which is renamed from
>> move_freepages_block_isolate().
>>
>> Add toggle_pageblock_isolate() to flip pageblock isolation bit in
>> __move_freepages_block_isolate().
>>
>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types=
,
>> so that one should use set_pageblock_isolate() to isolate pageblocks.
>> As a result, move pageblock migratetype code out of
>> __move_freepages_block().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>
> [...]
>
>>  diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index b2fc5266e3d2..08f627a5032f 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -188,7 +188,7 @@ static int set_migratetype_isolate(struct page *pa=
ge, int migratetype, int isol_
>>   	unmovable =3D has_unmovable_pages(check_unmovable_start, check_unmo=
vable_end,
>>   			migratetype, isol_flags);
>>   	if (!unmovable) {
>> -		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
>> +		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
>>   			spin_unlock_irqrestore(&zone->lock, flags);
>>   			return -EBUSY;
>>   		}
>> @@ -209,7 +209,7 @@ static int set_migratetype_isolate(struct page *pa=
ge, int migratetype, int isol_
>>   	return -EBUSY;
>>   }
>>  -static void unset_migratetype_isolate(struct page *page, int migrate=
type)
>> +static void unset_migratetype_isolate(struct page *page)
>
> The function name is a bit misleading. It's more like "unisolate pagebl=
ock", right?
>
> Maybe something to clean up later.

Sure. It can be done when MIGRATE_ISOLATE is removed.

>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
