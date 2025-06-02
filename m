Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486D2AE6C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883611; cv=fail; b=DKBxFKTMQ5HxaLXjn1p0zwESfazpzdydPanyex4HOdPGzIfa/Xc66cZEafPYq0EC9P9NEHu7NeISCN4o0uB9GNDSb7c1q/6CDSfBeqcz/TquLSIo2bf5/VOUVM2/+iAnkSwobn9Y74SvyaqfuJvaHWddb+q3JBS7HjL4uURoo1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883611; c=relaxed/simple;
	bh=3oGB38lirtT3oJDcJJwEQhHvIf2IQnPI92XHRfnMw0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sstk3FJMfYlzxxsnUcGDOQQMEBuS90WTS19BSJBzDyPI/WxeMru0VkIGCUkfVJERkL/7EPatq+ZQ2NjEKxFkP7c+ub35SvOciBfcWqReNPqP4Fpgc6jE0kiYR0nJsRe3etOG9N7A0Yqe5ZHObpKBf28H0GLFboQCs6e1xCLqu0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=csW27FLs; arc=fail smtp.client-ip=40.107.92.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="csW27FLs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylQ4XZTVMJeqxdvZK72/CMUDSUXGB7vx2EX4McZMY0YxzrfvN69WG/TVQhMY+WeFItQ1c5XF+1E7zgGVAYYVGIbAMQnx65vigAh3MKUaer4WHkNVhPG+YimjAtvU0t7B02TXGKJMVM+Hf7AFDx9TybHDYDFZmO+xIrPdmshcphiRyEviZ0+jmscoKSu5nZf9snb+7SxUqo/lHoXIqjnL0r4iOZc03Bd8Dx65X2srU4jHkiz5XNn7yf1gjOEucft5zs4N4f/Jir0DKRtxh7FRl52cMd3Kf0FhQCbGMUoaGQuEk8iovwdGZ+w0tJMehsLEvTIPqFostMj3UdijmR179A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUrqyZM7nxwdce6+sD2NXsoI0Swj/MtgEWal5D+m9wk=;
 b=y11dfLAXKJ5cv0herTFdvQacTdd47Lbjt8GQC5nippD0Dk1J3b+Fvl1USKXDXaJizxOwVAtSRc2g8gn+LRm4TWqBJNHNOdPzfgng2ITZVHJM6t4BmsEt5XYsUPiCrCW61Fi+uhAz6UnVETLCrUPy037DxO07//axjfR5QX6NiPQgSGSvhnVsYqf+fkg+ro/mQ5j7zdyYGHyXePwXNps9hR5X3C3BlUfejRTO1M/8TmLlcsvOCHFM4mMfgEBf/vYb0nTlnQDbWEjbZ9hiIirPnsIpjzJTA9ZdeK9a6PkEyQcpJDTNV6ITFhwrCumoJfppVjweCI03znsKoDXiNWi6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUrqyZM7nxwdce6+sD2NXsoI0Swj/MtgEWal5D+m9wk=;
 b=csW27FLsM75VNPumTjZx+0gtHuxTBR3Og40s8JsCyRlngxCfHZcj2JA7u48HvH/QfDxZEIFyOB1Ns0l89hTdpDrribxT1fMh2CL6g+uZ1Z2YS7sq+gcZUlgW8JYybfz1Gj2IMH7SPvhbp4MhAOn/cmZBHyk3hLTVeDyGew9caBKwjPyagNsrmqxAm5+OYsFvSsnsCv9+FSCJkpcZzYXwTU4M60hEMx7LU/imseExTt/l5E+P1iR76JISkhWagc9UE7SLJ3RyHLD4scbIwoXKKjccFqYSQ4KHbN6dNV2uAPFTOu476g5JCRgRPWf6dXWWaUdYjrkAr6HAHDF6LzrjNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Mon, 2 Jun 2025 16:59:58 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 16:59:58 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 <linux-kernel@vger.kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v7 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Mon, 02 Jun 2025 12:59:56 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <7BD9FB05-4125-4EA8-841D-9D08907D01D5@nvidia.com>
In-Reply-To: <20250602151807.987731-7-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
 <20250602151807.987731-7-ziy@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR01CA0055.prod.exchangelabs.com (2603:10b6:208:23f::24)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 84838f14-e059-4243-a0b6-08dda1f6e832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XskbN8TG0dSkV2A2JiVPFi6gtZlRa9kcWY35laxT+36s50vgQom0a9aXCHke?=
 =?us-ascii?Q?gynmCM3UMT/m6aE3V1TXquFuPAhytjw78Mvb4Y4XGYvFlq4BYDnqMFSil5o0?=
 =?us-ascii?Q?nR5APtbXhgKB/AVfo0bRmyDSGxHhqn81VWgRQhF+VzzmdBmsf6V9gZiwi7Wy?=
 =?us-ascii?Q?5y1n5pNGb/HQ/1wdKlAyyzB84kqQedMYQbiT+8T0AEeugliPKvfqZxlAWF95?=
 =?us-ascii?Q?zSdfK2/K+RoOkAhzayy81B/vuepjAq6EE/5hoR7TTKxtjeWPWcyC5fwAzCzt?=
 =?us-ascii?Q?IUvMlVkodXHny0pd68fbJajqVnWJG2RTpKbuP5+IMQ9cxSKzDYS0v1tmDDOc?=
 =?us-ascii?Q?HihcazA4H7uPOpRBk0MOjaQdhnkiLngzWmMchXioL0jLqczbgB3aRljRVonR?=
 =?us-ascii?Q?G6PaAORjlO+2YFX4os8VzT/GL+z5YveU8gz55iYGg4/vibcunDANIfJVQCMv?=
 =?us-ascii?Q?7/+dJaV56eV5aIHqsCiLzpQzU5Q3nM1nNKZ23jus28xNU+0JOMgEbp0ZpHSg?=
 =?us-ascii?Q?9VP24Xrj1kb/sdWR3VgYTxOO3Jg5dlwXtI8K4hzCFo4YxmBlky3O0Jj4N7bw?=
 =?us-ascii?Q?CeUyZ1n6r95zpdqiRxjk8scSYL4o4UzuSQQBp3sc7q9Soprz/BgN7odLiWRH?=
 =?us-ascii?Q?y9l2wvw06hfemCnO7+HBEwr0GL/GUXnkhsQCwnuOuPibUHX6JSJeoNv9fvfa?=
 =?us-ascii?Q?nT1+XoQsjTjwxvKK7L5cKOkZZMCffTtLOggYpMVIoG6aTyoqUdcO+4WYt3DV?=
 =?us-ascii?Q?PPxHW/1B+GJz0MUotlKIUrRSRJDOYKkUGEx5rK0V623+jkJisLsagQDJlHux?=
 =?us-ascii?Q?HdyipoPO1TB/P3c5iacheNiRX9Y5i7Pyo2Z0EWONvInGw8JVlMg+R6rPT/jS?=
 =?us-ascii?Q?Eeo5h4ty7UfIfR2H9cV4evM876PJMtG0gPHhQtUcpxBcCRivPLBKPJQLqQxQ?=
 =?us-ascii?Q?SA89tnI3aPe6QYKzyGDiwVa5QndU4nPudfciBCPKvy38gkL126d5rnxEMuiT?=
 =?us-ascii?Q?GnYo5pvGDr2ggh9wjQJ5sRE+6RTWBN4iJHXIu0suVoVwyvyOhJ1RaDZ85ylF?=
 =?us-ascii?Q?RCS4vMRh/eRyzk10B5hHjiDnQvkdkGoGsIWob8mJ73Ft/FjkeHIaU41HRCCI?=
 =?us-ascii?Q?DYXGowIxF3pjd1cwBYSVdsiN3abplmNFoDowsT7Qc4kb571q1QS4gAXko+d+?=
 =?us-ascii?Q?2G39yDH5uNj2oRMx16U8Lb0VOVbI7DtXf0NrTFEZ5uIqxhF64US+DJL1+t6w?=
 =?us-ascii?Q?gq8mGOuTrionIxz+LckVWl+hY3/8gZyMvgU1Se5inUUEawHgPUP3GFDsOZBq?=
 =?us-ascii?Q?ALtQcSDtSYT45AxzsmG12Qr7Y0GlvLUEmNOHslbdI7eHXg7Ojx7P08mn9GHz?=
 =?us-ascii?Q?d9VUAY4nL8hZAdNA9epd6BkCe9rNVhzEHRAsjInaY0OQ0mn5dqkYY7Gzc7vw?=
 =?us-ascii?Q?/OsPRNGH/cg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5t1UNx06xYfHKfBFQNFDUxQ/7dlf8Ci1+yvEBaHKcqlVUSvZmS3S3kz3WoZI?=
 =?us-ascii?Q?7RmNx4yWHjcx+vebU9bxXRjFnC/eVtWX78Iwhx1aM3WS78uSabmk0eN9K5Mz?=
 =?us-ascii?Q?+C+NcrIDh7uYr3O8LGQ6OlMpMq/DL6h4vvVbYJdcxRzvVDv3GjbLxOH7PFBa?=
 =?us-ascii?Q?R6HQoBZRuWxfZWs9aJoWi9VI4PUrSYatlQJp6dCJiwFMFTtQMHKrrwDVdMnt?=
 =?us-ascii?Q?qELLUHcoE8DyJ7vmYzACi0Tf+6zfOxBNEg3Ftu3ZxinG9s848S5vN+N439Zh?=
 =?us-ascii?Q?mKAqj1bkllaaMUOl3butP62c/vmxyK3HbUCypkjynHsS7Y6OxQedEU5SwdSV?=
 =?us-ascii?Q?4syC8M/0xdaOp+6vPFHyUkxg/etMhG9sjRrlPgoc51BOWYtryJCN6YLIAgq2?=
 =?us-ascii?Q?G0KrYyuGSd02kBP6kgOky6c+8KaXjfT4m+vyYCJ0lAE6mt1qog/bV8SbBiGA?=
 =?us-ascii?Q?LqzPytTdYJ/9N8QPdafFptHKArPeGBSAn/Sn4UKwfmPkKctcAXfh4HpAE7BW?=
 =?us-ascii?Q?UyrlMGTWcYVSKJU2iPHQ1RyfrpyHqpmbdLDjqfiWoKPHKUrACSwRw1MDcjBV?=
 =?us-ascii?Q?AnQuNBHbAztZuey0ViG90swIzhZKY5RkXOuEvRqX7qOLHwUV5jb4QbzbvcWM?=
 =?us-ascii?Q?/y3xMDa5KQE/qMYkeBmb55jpX831uICyL2EsAcfnHxNZgLXHahNO20qa2/iM?=
 =?us-ascii?Q?XBd+B1t91Uvxsm1P5yhIrai7gM113eDXPzEH2L9WGiC4yihNYVPpz3kqW1IG?=
 =?us-ascii?Q?X58Rrbp/+zxNbXo1SgGD30WJ9V64SACQwQV2RoYdroYvY0pfo7sVX+pYRg++?=
 =?us-ascii?Q?I+8Qu9cotiy4/Omaf5sOso4PMO5rGgnrlJxIb2y31ijHC90DjRASRStawYFP?=
 =?us-ascii?Q?C4NR6DgVm65OIP+WaEe8qqiGvtrwpIehB8zpp8c58Syurwi1nyaiWLzTycMq?=
 =?us-ascii?Q?QeG++GjVqhuPVTsY381PM9svDFVOUiIgaLtmZIhBW1y2ugrYpeqdmztp+LOJ?=
 =?us-ascii?Q?O74iTgyHuhh+UC7yv6kELNXVTxL9IpvlSA+90jT2cHUDc4i52/RuczmPYibn?=
 =?us-ascii?Q?pbTT7KcBz/IMhAFb5Vq0odlsJS2HKpoGH+wdzpLlwooU+ZIRcpmrrhL06Gfd?=
 =?us-ascii?Q?X82It8cpEwq8UccipPPpquDvYmuPf9K5daNeAQwiEJuWDqAYxlot47S9ye2Z?=
 =?us-ascii?Q?ndHINTbAS1hWF+10rN1ZbjY8UNk+IpUXad8Jtu2UXIYTFnN6+82zFjFBoG0L?=
 =?us-ascii?Q?LPCsx8qZb4aTYBNCslhRyZu/HoT4lhMVfqmnFGlS3r9w906409FnOQI3zGME?=
 =?us-ascii?Q?eHjAcayqx9sZy4PZyDGF21Emtb+iWi1PO/BMQ2h1Gu8ijkRcw2pfEbsWNGRr?=
 =?us-ascii?Q?tphLq74XU2HNJWYxqUy7bsOqqWMe9Iokz0xI0W/pOoDq2tyqoSo/gHu2oRmv?=
 =?us-ascii?Q?XkqagoviWj0O2pTWyuA1jHmV6AEVW7yBRYmEFJk7cNjXBpb0zsElLND1E3BF?=
 =?us-ascii?Q?IYD2qcDAfYFzdX/1JuUBQf1dOc1kO5kvVzH00Y4oSk5PzqS2j0ukXKxQCMKk?=
 =?us-ascii?Q?zcPw/wyBQAa/XhmV29Hs/d02HFJznpKPqdMY9o6Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84838f14-e059-4243-a0b6-08dda1f6e832
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:59:58.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pehExhmKySsHUt9A2VdfUo1X3ppqmODctVNS14C9pPLkbD3dT6avaQ7ImPBkMIvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

On 2 Jun 2025, at 11:18, Zi Yan wrote:

> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
>
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information=
=2E
> At the same time change isolation flags to enum pb_isolate_mode
> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
> PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
> reports isolation failures.
>
> alloc_contig_range() no longer needs migratetype. Replace it with
> PB_ISOLATE_MODE_CMA_ALLOC to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range().

This paragraph should be changed to:

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range(). Add ACR_OTHER (set to 0) to indicate
other cases.

>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  drivers/virtio/virtio_mem.c    |  4 +-
>  include/linux/gfp.h            | 18 ++++++++-
>  include/linux/page-isolation.h |  7 +---
>  include/trace/events/kmem.h    | 14 ++++---
>  mm/cma.c                       |  3 +-
>  mm/memory_hotplug.c            |  6 +--
>  mm/page_alloc.c                | 27 ++++++-------
>  mm/page_isolation.c            | 70 +++++++++++++++-------------------=

>  8 files changed, 79 insertions(+), 70 deletions(-)
>


The fixup to restore acr_flags_t:


=46rom d0205580ab70aaf93f3f7c04b53dc595ee387bac Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 2 Jun 2025 12:53:58 -0400
Subject: [PATCH] restore acr_flags_t.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c    |  4 ++--
 include/linux/gfp.h            | 21 +++++----------------
 include/linux/page-isolation.h | 15 +++++++++++++++
 include/trace/events/kmem.h    | 12 ++++++------
 mm/cma.c                       |  3 +--
 mm/page_alloc.c                | 24 ++++++++++++------------
 6 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 535680a54ff5..6bce70b139b2 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,8 +1243,8 @@ static int virtio_mem_fake_offline(struct virtio_me=
m *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;

-		rc =3D alloc_contig_range(pfn, pfn + nr_pages,
-					PB_ISOLATE_MODE_OTHER, GFP_KERNEL);
+		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
+					GFP_KERNEL);
 		if (rc =3D=3D -ENOMEM)
 			/* whoops, out of memory */
 			return rc;
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 17b92888d6de..95065cec85e5 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,25 +423,14 @@ static inline bool gfp_compaction_allowed(gfp_t gfp=
_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);

 #ifdef CONFIG_CONTIG_ALLOC
-/*
- * Pageblock isolation modes:
- * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
- *				 e.g., skip over PageHWPoison() pages and
- *				 PageOffline() pages. Unmovable pages will be
- *				 reported in this mode.
- * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
- * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
- */
-enum pb_isolate_mode {
-	PB_ISOLATE_MODE_MEM_OFFLINE,
-	PB_ISOLATE_MODE_CMA_ALLOC,
-	PB_ISOLATE_MODE_OTHER,
-};
+
+typedef unsigned int __bitwise acr_flags_t;
+#define ACR_OTHER	((__force acr_flags_t)0)	// other allocations
+#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA

 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long =
end,
-				     enum pb_isolate_mode isol_mode,
-				     gfp_t gfp_mask);
+				     acr_flags_t alloc_flags, gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(=
__VA_ARGS__))

 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gf=
p_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolatio=
n.h
index 7ed60a339a02..3e2f960e166c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,6 +38,21 @@ static inline void set_pageblock_isolate(struct page *=
page)
 }
 #endif

+/*
+ * Pageblock isolation modes:
+ * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
+ *				 e.g., skip over PageHWPoison() pages and
+ *				 PageOffline() pages. Unmovable pages will be
+ *				 reported in this mode.
+ * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
+ * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	PB_ISOLATE_MODE_MEM_OFFLINE,
+	PB_ISOLATE_MODE_CMA_ALLOC,
+	PB_ISOLATE_MODE_OTHER,
+};
+
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate);
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index e0bcbc43a548..efffcf578217 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -312,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 enum pb_isolate_mode isol_mode),
+		 acr_flags_t alloc_flags),

-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, isol_mode),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),=


 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -322,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(enum pb_isolate_mode, isol_mode)
+		__field(acr_flags_t, alloc_flags)
 	),

 	TP_fast_assign(
@@ -331,13 +331,13 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated =3D nr_migrated;
 		__entry->nr_reclaimed =3D nr_reclaimed;
 		__entry->nr_mapped =3D nr_mapped;
-		__entry->isol_mode =3D isol_mode;
+		__entry->alloc_flags =3D alloc_flags;
 	),

-	TP_printk("start=3D0x%lx end=3D0x%lx isol_mode=3D%d nr_migrated=3D%lu n=
r_reclaimed=3D%lu nr_mapped=3D%lu",
+	TP_printk("start=3D0x%lx end=3D0x%lx alloc_flags=3D%d nr_migrated=3D%lu=
 nr_reclaimed=3D%lu nr_mapped=3D%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->isol_mode,
+		  __entry->alloc_flags,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
diff --git a/mm/cma.c b/mm/cma.c
index 23aa35193122..9ee8fad797bc 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,8 +822,7 @@ static int cma_range_alloc(struct cma *cma, struct cm=
a_memrange *cmr,

 		pfn =3D cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret =3D alloc_contig_range(pfn, pfn + count,
-					 PB_ISOLATE_MODE_CMA_ALLOC, gfp);
+		ret =3D alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret =3D=3D 0) {
 			page =3D pfn_to_page(pfn);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 02a0f5621d10..c12442fdb579 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6695,12 +6695,12 @@ static void alloc_contig_dump_pages(struct list_h=
ead *page_list)

 /*
  * [start, end) must belong to a single zone.
- * @isol_mode: using pb_isolate_mode filter the type of migration in
+ * @alloc_flags: using acr_flags_t to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
 					unsigned long start, unsigned long end,
-					enum pb_isolate_mode isol_mode)
+					acr_flags_t alloc_flags)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6772,7 +6772,7 @@ static int __alloc_contig_migrate_range(struct comp=
act_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}

-	trace_mm_alloc_contig_migrate_range_info(start, end, isol_mode,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6843,7 +6843,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @isol_mode:	allocation information used for pageblock isolation
+ * @alloc_flags:	allocation information
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some=

  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6860,7 +6860,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      enum pb_isolate_mode isol_mode, gfp_t gfp_mask)
+			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret =3D 0;
@@ -6875,9 +6875,9 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 		.alloc_contig =3D true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
-
-	if (isol_mode =3D=3D PB_ISOLATE_MODE_MEM_OFFLINE)
-		return -EINVAL;
+	enum pb_isolate_mode mode =3D (alloc_flags & ACR_CMA) ?
+					    PB_ISOLATE_MODE_CMA_ALLOC :
+					    PB_ISOLATE_MODE_OTHER;

 	gfp_mask =3D current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6904,7 +6904,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */

-	ret =3D start_isolate_page_range(start, end, isol_mode);
+	ret =3D start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;

@@ -6920,7 +6920,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret =3D __alloc_contig_migrate_range(&cc, start, end, isol_mode);
+	ret =3D __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret !=3D -EBUSY)
 		goto done;

@@ -6954,7 +6954,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	outer_start =3D find_large_buddy(start);

 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, isol_mode)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret =3D -EBUSY;
 		goto done;
 	}
@@ -6997,7 +6997,7 @@ static int __alloc_contig_pages(unsigned long start=
_pfn,
 {
 	unsigned long end_pfn =3D start_pfn + nr_pages;

-	return alloc_contig_range_noprof(start_pfn, end_pfn, PB_ISOLATE_MODE_OT=
HER,
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_OTHER,
 					 gfp_mask);
 }

-- =

2.47.2


Best Regards,
Yan, Zi
