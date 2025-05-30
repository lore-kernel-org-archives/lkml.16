Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31694264A61
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628026; cv=fail; b=RNXD33UYPYVR/nZZJuV/MPv9BXdQ2fkWdjyPTIkH84Dd/dAbdgXATtfD2Tce/4YHUSjje7WEAte7KEG+sd/2cNWf3HhvpjYrVm7b0YbeNNo8Vfd+h3Ywk4NjRPqYp4v0G/w0/7NsAx/W++Oy+lQCJN4xxBma3ZovPESmBC8Hrns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628026; c=relaxed/simple;
	bh=erdNFWkBLWDDbX+4pJrT/festDEtRKxQ4OQfy213ZqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FWhqEVRsbpvSCdKD4PhqKaEZx/+/I5+wU3puERHcpi4sk7G2CZ+5jrcWOh0AofEtxgxqr2cSuPkroCDhCJLcjMNHduJOLDSe0i3SQMLf8lqsWC60D8wH/syL/9An9PPfU4w1j64OhY96GxNScoNkg3bp8oE26AgFs2jPkLv0RZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JfP4cpX9; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JfP4cpX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nP4u5QifpBTC5yKIGpThIEjqJ5rrA5ncGObCALLpLe/9a98ERzGUTI9JwhcNe86ZzdoW3GVGcaGLfdqkGcnhDl3fW5Nj4h9SM2uBjk6beLO6yK9CjKBOIiWVr8Dz6YSDUcDCdScM9xv1Yesi53/KLppQGHNqqp9/P/0ROZkSho+m5Akb62SUNVoHRMxih8G+1mTuGQygPff+OkU9A0t56FZUzHtSDTXSW9Pw5kRxG2r16yBeFI039i4FmJOd+PshBsfS40A17audHvNNW559UZdD+3LtIgk4gHvPHp4KcBGFRY8WaYrPH2xBA0qXEm9s3W7UucKyabdYnLOzMBtrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLp+5LpjpfzitoYpYAm5mcZokH062Py9Q/zkftWOTi4=;
 b=rMmDCpm3DGwIDip/SJUML279uqJe6y/pDMmjU51c9DI2Y7wYosCVsLhVIgKDAa0c7tVFoTt4OQwZE5QUNizLeghZ7H9j9O5ZiMw/WFYoaZz3en41FG9l8b9rw51l1zSxHIAnMdmUQdu2XcfkdFpA1jqlCbNk1TjCCnObAsB1RCRGYNBgspO3bL85OA0UYiyQ47+/xYmMPa8lmUg3XUIAtRluOkEr9Pr3Ah0ZYtjkGUWkNkc77AbsJgbzOpWIt+yQz/usPRMmPzn/W/x7zh+WTJEC3RfAikmwO8vcOScrPnoU/fUTZ4WtMZS4sc1alBu+jEssHw/F2RLaDPWOM7S8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLp+5LpjpfzitoYpYAm5mcZokH062Py9Q/zkftWOTi4=;
 b=JfP4cpX9MR1aq+Ceu6r3ga9pXz9swGobRR9qbYVdSXj7V+5Aaf8obqu5o8hYR3TJ7d5Eu6JtKSNtVwWSBAjHN+cGQsZEYfPjIUzX5PewqC2h2CjVPTsdI7J2uzSHsfX7j1XR4UqQOxH++AzO4YmJIZ2waIWYrAG26Q9l0smSA9bsAiuhOptnzF1K/7Q1Jsl8waywsE0EJ1qWoh1NqVbWxLh04fgISlfUSNauyAn9AMRTLc6g3GtN/V4WhlDAkqHguuVO1RRNh/Om+2QgD9rEazhn9wMffiEWdRQ+p3wqCmpnHHYIPbca+EtNK8AIwU5hxYfb1ynyy+W4fveF+TE8pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 18:00:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 18:00:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] mm/page_alloc: add support for initializing
 pageblock as isolated.
Date: Fri, 30 May 2025 13:59:59 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <54E90DCD-0F18-4EA6-85A6-FBB5F3DEF95E@nvidia.com>
In-Reply-To: <4ff13fd3-3bfe-4c29-81dc-5e6c7aaa7af5@suse.cz>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-4-ziy@nvidia.com>
 <4ff13fd3-3bfe-4c29-81dc-5e6c7aaa7af5@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:208:23d::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d92dc0-fb53-4db9-f9d1-08dd9fa3ccad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8C0Bzt0RaFvdaQ/DvAgkAElifLo5xIj03xcUcgyp5fRgbXOLDoR4MmEt+zyg?=
 =?us-ascii?Q?Q9KWyOh6eJ01SCEtmeI3QOI7qil38RZfU9yXzabSa3N0gI3sDkgDWCGqK58Z?=
 =?us-ascii?Q?DXtM4BvQz6i0ORgPh6BqnarGq5N5iCMV94/LzSM8A0k/27WyRzMQhweS/HSM?=
 =?us-ascii?Q?Jkajj4i4ReNqqPxe7zU9JF0Nx3RqvB7oET33NXeUZAQD6yrnQsCjCHLORsot?=
 =?us-ascii?Q?hEO3Bek6U5Xq3XHoKwehpX0eZ7tzdkO1VIP3SLmvYUYDNqP5ll3kmAJUt/gc?=
 =?us-ascii?Q?+O3+xEncDY+u9KImjSitACy5gVv8ksW2RJpX68GtkY+sPAn3bA8yLYDj2ecj?=
 =?us-ascii?Q?rUrlaz9tx+TbgoJLT0V7craReFh3Q8pgcViRrXLyt+33cVHP+CmE5fTbqfv3?=
 =?us-ascii?Q?zM4rh4XZiyD0HlDXVqMbRaQIWhJU+KLR9CY9d40B7zomDMBOv1/dB0XLkkPk?=
 =?us-ascii?Q?ihkeV7ioeLo+RqpFDrsxPoOuLYQgW50sKLPKTm2EkaqEtg6VjyINmrbbvW98?=
 =?us-ascii?Q?OXBfGAR3qKXu/vK8Mxoln41AD0o0J0R5TguOWqE5w82UmqaoSE/S2v55sIi7?=
 =?us-ascii?Q?6SEdefwwCkTjd+oYRRZfObLBx0mHILjI2PWGEGDe0nitbKorTiGxwAzNg0FI?=
 =?us-ascii?Q?XwjXTNYm/FwnnQ0sEiim8NL3V86saoLJ+M6O8vP4jkyrTzAEiHrHR7sdGEmI?=
 =?us-ascii?Q?dbgDjwmOQ79BEqK6+zbQsmYzvbZ7F7EAYifjF7TpjE2bdnrOVu6PhA8/VXra?=
 =?us-ascii?Q?y9saJD+GNMf/nI933hc9Oc2TTrVktuaQ7+h6qHWo3Ekoqj19E3/9L5Rqls0f?=
 =?us-ascii?Q?k6WWHb0VklLr5YDTcauEFmGB+QnYb9HNcAFXmnvdtvVSNU1/ovEXkjtKuY7L?=
 =?us-ascii?Q?0Z1iJvvMdQ3y52TX9R4zGUuJ1a3rEMKtFx7rI5RKgvJ/KD0mOI2ovAULhfNv?=
 =?us-ascii?Q?COv+NbhUOa+9+DFA0QbU4V5nNOesKN3NNubBgy9njtJnJr5RLkBtd+4dsG6u?=
 =?us-ascii?Q?2wlJtQNuKxxjTW5+U7TFB4lnF0JEEsiCIawTDyPhhiv9Ar9Io6e/iPuYI2Gh?=
 =?us-ascii?Q?Vb3oLamb6BIx+mlY8Uw+BVJbVP55QLPP0990kgga2s+YJikXHS5+ZpmynFQH?=
 =?us-ascii?Q?CrczZLS/ohGFvPi+6QdZa2TvY7lM+NTa0V+gl9fN8sG2WTBCPutIVLXIl/PV?=
 =?us-ascii?Q?WQr66C0p5CIy77jhbl3jbYnYGG+7+mv+ZRtBAbA9kGhay5iBMjT5dAgtrixJ?=
 =?us-ascii?Q?OX+5FUqzrm+T5naRKGiwA9TEtPM9m0/HLnNwf/jXY5fKk8aDQSSnYPaRfZdQ?=
 =?us-ascii?Q?+xuf0GvNfypEq4LKEQ8McSNrH8Zs6CCqcVIxRgoD1xBUcIgF+z8ewbzTv95U?=
 =?us-ascii?Q?KOljHBizlswOE33yBY3uYHNwdXNPXhrhesUOPt0YpjMCIvmHJOsMGh0332qZ?=
 =?us-ascii?Q?7UwCWNNJYpU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2fb0o3HOXaU8NuMZvUJ6udeiQUhJFNa+WyBJmtatxqOGjra1r2n1GEywwYRQ?=
 =?us-ascii?Q?vB54XY3/EauLUsdu0Pxq3PZ+s7YOsZmn4mUnvjRpg2nRWYKn89WyYYGWRVEj?=
 =?us-ascii?Q?1Dg1ZOE6KoTnGLKwZ+95rqytpLtcPJ7LzXrM0GItYkEqc0JyE2gDDMq8Ps0g?=
 =?us-ascii?Q?iXcFSlaCynlR0j+p3W4F//NGYSs3JkIIkEgSw/0xmnPh9IarioAVGMRshlnt?=
 =?us-ascii?Q?9N5/8D9mxxPKT5GceHWaEFjPgwuYxhx+N2tb/pEL89KTyuvfuR+rJdWeIJEd?=
 =?us-ascii?Q?ZUOs1SSRNKLQGT0ULGaT1m08Qr4fYcM27zOgkZdl0dRUl2vzk1xceyeQpOY2?=
 =?us-ascii?Q?up9XKMpwVznUoGeaqLRUg593De7QJ0OZ5grDoM2mO8Qmh/mHWa82Y5Ds1I2s?=
 =?us-ascii?Q?1s5L3vDKXnj+iR7GyS1DIS7ztSBD3mzneW6BHCYrN1LUS3dX6FpUio92hnwt?=
 =?us-ascii?Q?ye3Kr+pxj5yijVAxAoB/bS1946xc8b3DBf+JRWl/NUxiglCOnaTnvkbM8JUU?=
 =?us-ascii?Q?X1zunc5yrxZMnqxKR3YvOjx5h0UtvQN/eldqs24xHi10FKTyQeT4lM61mwYD?=
 =?us-ascii?Q?xbvmuqxb/e6Bp/Al0P7PMt4pe4KWeCxUejeezsfR3A2Fltn9ISRg7MaeWSde?=
 =?us-ascii?Q?LTO8ch1GkDmzpgLRo+Yi74KeZ4SxrSg3eihelmOW8iQ0Bz3Io23N85RevcRw?=
 =?us-ascii?Q?qUp82kprnthR5e8p4w70j1p9RY866VzhCQngot0+ox7I5ro4BHzetz2u1A9e?=
 =?us-ascii?Q?HsdUWRn/k1L6vK4ofGAGwxcC5u2aWXLznxDXklT1X5KMNycup6HNuFEaHqWo?=
 =?us-ascii?Q?goO3kADab5icWY1tjsTBi1f/4BZCdJ1KDAwW320DxdhnZFFGf5Yq7UZIIR3b?=
 =?us-ascii?Q?2a2kMebd5I6ryp9Ss7gc1T8icgzBnyJMJWO/qtFLEvogEjsThaUH/hkZ9AMB?=
 =?us-ascii?Q?GQUXz+KuWibjMb2PwZ8NPlJPjbe8YIdees4jQfc+Tw8HCr1HN/DJ6Ad+1c7b?=
 =?us-ascii?Q?NGGW6R0LOAbh8Pkvxw0ArDLgcK90Avq4m+OWZT/cBS2mtDoeF2hCFtcJlavj?=
 =?us-ascii?Q?xYPVtU0KRkgilp+WjMFAfrWyUZJT42MyJu9OH5miDlTiSM5I4Qzr8sas2Ztl?=
 =?us-ascii?Q?myEKna4iJSRuxBqoj15HVpReBSS52BSdJny7lO14EsG/DTgvPcFSKQ1G0KeZ?=
 =?us-ascii?Q?YbfXY17tsqGyfqJMJeMUBEmHXWcZsDR07JyolC77G3OGF+UrW8OZ4bwbmFAu?=
 =?us-ascii?Q?dWDNtPoBdqyefPq/wQ6mXRJIJK2l0YkHN+jBOAZ3fJyLXdr4T8Cs+ucILBMh?=
 =?us-ascii?Q?ws9IPFBXgp6ulfbM+8Y+L0RmZADN8FqJXxmCQelE6dUkZhMgxuBiMhtsGfkP?=
 =?us-ascii?Q?AxoaWAXbNAnD+94e8YnWTWdOhsHIjqBZk/eqi3nAOE1F9ffqSaaFON02AhdG?=
 =?us-ascii?Q?9CHvJuBTLWKaFb1Sr3Czfh40NxjZyZXWgpofghEvufZIfPwY944cnEG0YvLz?=
 =?us-ascii?Q?dm6CSEFn1iaPiKIM2j6QFMZPZccHiGtw8ViPIwLYddUWib9ZJoAL4jOxRahQ?=
 =?us-ascii?Q?wnFtH07feQRnxLi4t21IGHbpRIolIvFARAZ4O9AC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d92dc0-fb53-4db9-f9d1-08dd9fa3ccad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 18:00:02.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3StBVhw0VbwH3gbYzSst9bBBFo64TQGgbfFe6ZrZ31lBERzuRVwumYS4y001zUSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

On 30 May 2025, at 13:06, Vlastimil Babka wrote:

> On 5/30/25 18:22, Zi Yan wrote:
>> MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
>> to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
>> initialize a pageblock with a migratetype and isolated.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
>> +void __meminit init_pageblock_migratetype(struct page *page,
>> +					  enum migratetype migratetype,
>> +					  bool isolate)
>> +{
>> +	unsigned long mask = MIGRATETYPE_MASK;
>> +	unsigned long flags = migratetype;
>> +
>> +	if (unlikely(page_group_by_mobility_disabled &&
>> +		     migratetype < MIGRATE_PCPTYPES))
>> +		migratetype = MIGRATE_UNMOVABLE;
>> +
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (migratetype == MIGRATE_ISOLATE) {
>> +		VM_WARN_ONCE(
>> +			1,
>> +			"Set isolate=true to isolate pageblock with a migratetype");
>> +		return;
>> +	}
>> +	if (isolate) {
>> +		mask = MIGRATETYPE_AND_ISO_MASK;
>> +		flags |= BIT(PB_migrate_isolate);
>> +	}
>> +#endif
>> +	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags, mask);
>
> Nit: I think this could have also used MIGRATETYPE_AND_ISO_MASK unconditionally?

This is the fixup:

From a701327561cc5d28ffccc66b7bfdabf87f32aa23 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 30 May 2025 13:22:34 -0400
Subject: [PATCH] init_pageblock_migratetype() fixup.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0284d74b6d8e..80bbfc47c9e9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -548,7 +548,6 @@ void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate)
 {
-	unsigned long mask = MIGRATETYPE_MASK;
 	unsigned long flags = migratetype;

 	if (unlikely(page_group_by_mobility_disabled &&
@@ -563,11 +562,11 @@ void __meminit init_pageblock_migratetype(struct page *page,
 		return;
 	}
 	if (isolate) {
-		mask = MIGRATETYPE_AND_ISO_MASK;
 		flags |= BIT(PB_migrate_isolate);
 	}
 #endif
-	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags, mask);
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags,
+				  MIGRATETYPE_AND_ISO_MASK);
 }

 #ifdef CONFIG_DEBUG_VM
-- 
2.47.2



Best Regards,
Yan, Zi
