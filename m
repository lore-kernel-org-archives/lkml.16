Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366B1A38F9;
	Fri,  6 Jun 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226270; cv=fail; b=JaHzuqsyvM2LrTs3sG8p+zJqMO2Gk8x7RQZwG7hbyKBMPD4L3kVsxhTYVwlCBySLssP/V0Xf4g8KC/05pZSYjWI6i3dBfffpXfuJ7kV92s7x11qU3P2scy4O7HORN0aPalqgLFrtDJt5n7pUgDCuMdFAoEwovZrvZLakn9gJUCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226270; c=relaxed/simple;
	bh=PxOPp+dTfMwP6HOSkWnSpYp3JTDUt2QTOgRWSeDxfy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iAPK9FbyxCJUE9Uo6tNsh7/IxtJU1AUX/JA0nSVJJ72b4BUt65/B4h1lt3fMTrUIc9IpIW8jtPXbg3cuXs5ZJfFKmG9OJtjdwMaGdHLbGOJT3DtFVCftA7ZcFEgEyg9BCqH5LC26t0zhWxI90DREyvP6L2OlMKglr5hCPFoWxmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gjjAtE1N; arc=fail smtp.client-ip=40.107.94.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gjjAtE1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/pwwt5LB2twGYEcQpxU5nOWl8m5n+XinMfBrZbAhtdBts9tFIoo8VOJVfA00Lv4Xc2lI690i/2oTleS8PRs6jcmXEnxZoDBKNFhEDUKA0dSXi0qfUnFlDZMZ//1737bGvsDfNrDt1gszYbrUWgAqJJQJeInovMnA0uZHxx8HlgYD4ZisXOUqjLOdvU0L0HT+3h5xra9m5BJwiWdcuYaPBTWgDctsb8vgElWWGVgDtw1Zuu9s2+Ct+fy3fiQPRpSF/aBiJgJxtcf9izUaepb6MryJRqV+uA6molup5pwqHbYdrA4rbFrWtOFGMKZ19VuMm3w9CRFQGvQZVIikyT/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3EAxmgg/6atJ6qXXkw0VvpEAxbaN1VBsyLJsohHUR4=;
 b=tfyuHZlflAVeZx4+nV1BPuxVaRZNDHOqmPpmkouP0rQgE/pnckxPyDOAlC+kO9wjISOzElT/ESTHSeA6zFrLBMOiIP+tJ0EHFUh4U4We6H0v6sW5zxLoHQGA6Hfq4NgPcCbG7kwSMkEH1JEi+iry/4J1EN2xkWdGJcbVlLTeDGDRBbaCiBhpjQgDV4qP+5Pq4Mfa6/n1ELFEn3UI1lf/uFzrtnHCXt3S2hh43FARLLs7t40Y5JOG2Gvi+cQeRT2+wQVstLgJkoj+5ViIdzIz/T7rvkCnXIU1fp0S4/jXOkOCM8qqv8Z1GVrv+X4URzuXxeMjPH9Tf5w0xC7SYknCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3EAxmgg/6atJ6qXXkw0VvpEAxbaN1VBsyLJsohHUR4=;
 b=gjjAtE1Nf1+MHHiZujFGzWAaQGRc3xgUY5akcdByfhX6lrQ5an8Zna5Ce8643ukO9v0VT/osGT0kRzvZ3ZC54bA3KC0KKfNFJUAIHV4acK6IHgViT+pPR4WPNFIEPsq8PZACg4ALT+J05MtuRkoRFDi+uNIr+ZPD5Mri52aKw1lIHL6mg5yoKGP2rjafDXavTGIkGkGnFiN12Ik3Ed933n+JqGvA4j5AnYCkjLWmv50DXMNa1xQrpAWIfZHoTgdmHWBB8uCiKOiiWt5AqWfpxmisb67769TdRVRw3hZUMEmVmS9plWqwEIBJ+tV5cqRAT2FpBVgdtkNzFzV1NF4dZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 16:11:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 16:11:04 +0000
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
Date: Fri, 06 Jun 2025 12:10:43 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
In-Reply-To: <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:52c::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a90bb8-a9e4-4c1c-bc96-08dda514bc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2aTDIR+ehSWXYQxvAfBAEAqQ3409QWn4G+1IjJzRevIejv9Snp9bJOp/EJb?=
 =?us-ascii?Q?S9pMo9WwUYpnijZb+ed5RxFR7Z4ZL7LCmGU7AyDvN3CUXTejuPgN2ThCuymC?=
 =?us-ascii?Q?8YbiQO6UtTnfY949UZ/CuV+HkxK29/BI3mNk0CBZXehSJt0fmvP9ZBpgLiLR?=
 =?us-ascii?Q?zSp0OGrReI6MI1i0EBrsNB2wn4Uehu7DYemcaY6XBAAdIsxFoxkxxwT3S1pR?=
 =?us-ascii?Q?bDsHSIKoMszxm67M391xTNSzI2L1/6qBIj5mCbXYOwuUbJ0/YPLCAUaaLXhu?=
 =?us-ascii?Q?Z5ve+ZJL0c0bwJnDEa3kV85mh4ubqcBKhnC1Rww6m6WbjHtsXc4Dm6NLV8Vb?=
 =?us-ascii?Q?05f42SmjWfo4Z6AoDVf48Aa3wvW8ieX2sNjdwWCsaNDkkruH4WIF/nD7yCBv?=
 =?us-ascii?Q?VA8RiCvc2XEG4UuVXOR+nJteGkRezLD2AMxgXgVtr2EyjIrYEc+VJDHg9JNm?=
 =?us-ascii?Q?VUKirBgqskiPmlErp1CpmQEF38MhbIjZDPD45G69zw5KhYnzYRFyka8advO+?=
 =?us-ascii?Q?xMY4oGxIbXYrwB0NjDEXl1ZIFad2y6MJIRfqX6ODY6oq9wf1kwdAQA1HjY1z?=
 =?us-ascii?Q?SDmvhoLLldLkBNw9dBuReAO1f1Eiqd0h2TEZchX6lg/nDJDPDC+UYm2SzmV8?=
 =?us-ascii?Q?6/EU6SJ+O7t20I/KpmvroSv9Hesc1YAfJvcvdRTkxMr9+GpIOxEdnakO12rE?=
 =?us-ascii?Q?xvLrxTmIZlT3OJAhCedvumhPLR2RaDO0rUDlDXgsV/2TCS7DsTvbO9EtreL6?=
 =?us-ascii?Q?NKnmHWw332+ZXxU51mlcIssgLldeSGJOA+/BOJx5C8uCrJX4U3Y/8uMnL1GL?=
 =?us-ascii?Q?cm+3Zi6wGZiDlM2T0VgfWvHXkeyb9rYA6FhNSrmwyEAICp9hHs2KvJZKy1Gy?=
 =?us-ascii?Q?3IZAJpP0/HaR89Hys9tL2uB5epfIBwf+8XHHx3piQwbojd6MytW2NRyqM2cP?=
 =?us-ascii?Q?iCsu5EDT+hr+JPHbIUagTJ5C4m1zk7/xgBst+sYO8CcZeotw7YMFEn81plOs?=
 =?us-ascii?Q?nrSr+jkCyCCv4meHILD4acNmpMwhrCeqbcAsCTXC9tSZewNPvNn7Mw/54gVt?=
 =?us-ascii?Q?QLGzZkQ2F/2/o0qoQ5SIjeFfjc/Aw/mV8pJia3azVCULrJYIO64TIQ4uOa1K?=
 =?us-ascii?Q?IAw7GpFM5EThZLr1ldv37rVHpQIn6HUNB3zu13E406BJUO0KQzvHzE3m7YeW?=
 =?us-ascii?Q?0G6W7FMQWw8XEzin+b7Ai//rZvWQGiJoth3MggC0OuSRYAFr8QshJxS8lj09?=
 =?us-ascii?Q?QhP36ahMxFCrBX0UtdenldFlu8sYTB/VG0tqGQMJjhNCArUrK+dP84g8aBWh?=
 =?us-ascii?Q?BFY4ysy5wYVOGGCKv26rtmroYWr6UUdkgpOnO8UKB7LXEJX9m/g64VE9iisG?=
 =?us-ascii?Q?BWvnqwBdxe89lCNPUfllnP/mXyImEfN6ZAJ4zj3KXmVpBzjvnyf4DaZ6nHJj?=
 =?us-ascii?Q?VP7B4eXVrHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ITfT5Hlh5/BhRCKBYb91AHGoPnDx/H7LT+a24n5t+5ysMZMyGPFrTn4P+7bg?=
 =?us-ascii?Q?+HbnqS59UstW66wNp/2bmk6ezN64V9InnhVS/M5xfOSX81FpbgA2kfOBBiQ5?=
 =?us-ascii?Q?SJZKW9p7bdkg/Oe9ZGJZVIp3wuk8cMtodTKplDC+VWsdKfAFXzJRsJwi6/Mk?=
 =?us-ascii?Q?lE95Pkg+Go5wsQ2YtjVggsYyTrQVifC0WB7E0nLmRMldE5kDEFijr9IZWBO8?=
 =?us-ascii?Q?6Bm7deNdlUNJH5OioJFMOv3HNWD73yHkk/zGexIgmxCEJT0Da9V5cv62wrtx?=
 =?us-ascii?Q?MTR8LSF2BV6yXd4d5OgrwgzVN/Hcz+EmgezEOe/fCge+arBR+uLZAYhbSZ0y?=
 =?us-ascii?Q?UlmqZu4ANVghEeuR9W8x0ssbuofj8C/TiykJvCesgAzmonxYJhw3HZLxRw2h?=
 =?us-ascii?Q?QX7/zgTpVMYL+b8U2SpHospoHqGVGM+L7nyMwjleiAwZC34zTUtPGtY52h2n?=
 =?us-ascii?Q?HQW7ThfWJqkhxwstjCzfDdgaqEOaXIJsVaseun5msLhr7Jv1WJ9Uk4DEoTOz?=
 =?us-ascii?Q?nM8/25SgW37JFIBtV17FrkuKtB79r1THRe4kGa/zRkyhRDB4HWV7bWH/AxEK?=
 =?us-ascii?Q?C+T9TthEnx0+xQoD8b7N9MEPZVkqiflFuKOXYTG0nI3ooGXzyb4Rp2vd28u+?=
 =?us-ascii?Q?umYFUTtVs+rukLtgofS0OVdcW6HSYfxmlvds30nB8Y8A+tjAT2jOw2UrxqjM?=
 =?us-ascii?Q?cAc8yYYhaSdqxbxWxa3TSXNiInsyncPu4Dd1AWZZdFlXCEkYddFdLWd/J551?=
 =?us-ascii?Q?z9ngnL2KygQD4PuoUMq+uKSTgTHC6aL65O9LzY46eyVYOfOg0TrBJIdpUxbe?=
 =?us-ascii?Q?4nporRAnCpx4gqibjLdOmeuZetHQJhO6qwjJqiQlEvv0Fa0Ahe6JN9J+cl29?=
 =?us-ascii?Q?KbND3oIkSt6eSCObQ+MHIL8XmDUYquOSPpcMedVjLFHrUi38t0yrq/3ryavQ?=
 =?us-ascii?Q?3nsjseQ4Q1/OC2sVY6ULlFm1bioEhps/eGWxzHO9ZnWmkjq/DrsgMVviyRtI?=
 =?us-ascii?Q?VfCeM+lO1u4ODZhIp9hH0aymXCbLbbj3Bf0q92ggbY+GZENFhaBOP2SNJbus?=
 =?us-ascii?Q?61Bnri8EcdaDuicaRbT0IFNvnIT7jUWHC3eWN6KydynTv1hr98A1u/VTqU+o?=
 =?us-ascii?Q?xknGI2UGAcAa/RhxTOli05xIDeMpmaVtC0a+Qmd0GRzrYoDwKSzwuFGaSw1M?=
 =?us-ascii?Q?7YPq7aWzCvS6sR7BdcMBFtc6wL9XfDbNZEWJsj2UI9bzDAXnl3MppIstFrlV?=
 =?us-ascii?Q?dHRTYAgxoSnoMz2UoAgA8Y4tUJQhCwnRVcdfeF1tzj/yBVGomu5TIJq2JGSW?=
 =?us-ascii?Q?qAIVmqoZe+4WMcZs5zz43AnFG/M+9uPA8CQPW848OPqD+H+G3rMnqmtXTW8s?=
 =?us-ascii?Q?X4Dxwg6DqdtJKFAkHpDIXgH+xDakj8dY+4tpmam0RA00nv2hIwm19C7BDR5J?=
 =?us-ascii?Q?hBpH9annpyBKVMCnMwwmsf/kn1SBUvXOIZMzQEyrze7IctRyeTLv5wyXpeHA?=
 =?us-ascii?Q?L6XqRp3Ypd9QcPsI/EKJPlb8ZJlNIDEFt8JLYwFk/WuWSc+GCdafVPxbqfIq?=
 =?us-ascii?Q?FDcFZc+hRtDRuHbmtLHzUYIv0SQUQPBcyL8yWdEI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a90bb8-a9e4-4c1c-bc96-08dda514bc2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:11:04.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NU7rOQh5AH7oijgt5djbSeWSdmnjMpwP+Lps5jV1eH+Z29ulFB6WnDYO58Q4a3yy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839

On 6 Jun 2025, at 11:38, Usama Arif wrote:

> On 06/06/2025 16:18, Zi Yan wrote:
>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>
>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>>> watermarks are evaluated to extremely high values, for e.g. a server with
>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>>> of the sizes set to never, the min, low and high watermarks evaluate to
>>> 11.2G, 14G and 16.8G respectively.
>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>>> and 1G respectively.
>>> This is because set_recommended_min_free_kbytes is designed for PMD
>>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>>> Such high watermark values can cause performance and latency issues in
>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>>> most of them would never actually use a 512M PMD THP.
>>>
>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>>> folio order enabled in set_recommended_min_free_kbytes.
>>> With this patch, when only 2M THP hugepage size is set to madvise for the
>>> same machine with 64K page size, with the rest of the sizes set to never,
>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>> respectively. When 512M THP hugepage size is set to madvise for the same
>>> machine with 64K page size, the min, low and high watermarks evaluate to
>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>
>> Getting pageblock_order involved here might be confusing. I think you just
>> want to adjust min, low and high watermarks to reasonable values.
>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
>> look reasonable to me.
>
> Hi Zi,
>
> Thanks for the review!
>
> I forgot to change it in another place, sorry about that! So can't move
> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
> Have added the additional place where min_thp_pageblock_nr_pages() is called
> as a fixlet here:
> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
>
> I think atleast in this context the orginal name pageblock_nr_pages isn't
> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
> The new name min_thp_pageblock_nr_pages is also not really good, so happy
> to change it to something appropriate.

Got it. pageblock is the defragmentation granularity. If user only wants
2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
kernel will defragment at 512MB granularity, which might not be efficient.
Maybe make pageblock_order a boot time parameter?

In addition, we are mixing two things together:
1. min, low, and high watermarks: they affect when memory reclaim and compaction
   will be triggered;
2. pageblock order: it is the granularity of defragmentation for creating
   mTHP/THP.

In your use case, you want to lower watermarks, right? Considering what you
said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
is lame, sorry).

I think for 2, we might want to decouple pageblock order from defragmentation
granularity.


>>
>> Another concern on tying watermarks to highest THP order is that if
>> user enables PMD THP on such systems with 2MB mTHP enabled initially,
>> it could trigger unexpected memory reclaim and compaction, right?
>> That might surprise user, since they just want to adjust availability
>> of THP sizes, but the whole system suddenly begins to be busy.
>> Have you experimented with it?
>>
>
> Yes I would imagine it would trigger reclaim and compaction if the system memory
> is too low, but that should hopefully be expected? If the user is enabling 512M
> THP, they should expect changes by kernel to allow them to give hugepage of
> that size.
> Also hopefully, no one is enabling PMD THPs when the system is so low on
> memory that it triggers reclaim! There would be an OOM after just a few
> of those are faulted in.



Best Regards,
Yan, Zi
