Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B02A2797B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735916; cv=fail; b=HZmlIsT6jGMQ7ib/06jJBGRrr/N9MKv8qjIabpIkSjRXVD2XVRfnnN9cBKr/uZp9ijgBO9n6+E7bDntjJVNiGYB5ojUhbviD48EcZOudMSNgc34M50jQ/gdCjY1bXsnDp/GSXGHEUM8EpJKqgUMQzMmHalEbx4B1X6bIi0H8K4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735916; c=relaxed/simple;
	bh=47P7L8mh7yt1/eYqCwpdHpnSlurHuVezD9H860InPmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pdn1jgzLUBk2V5uzAFpTGknZmA76DvzC5CKSvmfAY7/sNEylw8HvYy14zXN1UFLFi3UK9dzpL07ywKPetgTTlLBApU8aCLIiedQPyZFdtO/l53oyufgLSyybhk7PuqANDtuZIPfEX+i5vlcuoWmYECM8chB71uqJEOsXM912plo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FRO1mvRH; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FRO1mvRH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpQ/JeF6nnTX6zGKHGPiIj2xH45XGhxr7EJmKnD4VvNo2ldWFYy6C/dBxuCzqvU2MeDQeOTIAwQFwycROyTnWkLbf0L8m6J3iifcoS3iUjHxeekLVLVJCPOVlCGFF5eB2SvzFOhXoCVYetLikWrIXmptM49rqQi9yxlxFvV+GTuyFkSKPriuS7BoGDxSLYv98K1RVsaDSLJQnpMTwgDRi7p6zXnthdNFB5aVdC5N4hcdzcpV3w3JOZ7hfWtR+OFBofO18bPgBM+4bN7QX/QD7NlaC+ZPlGJ4yhSO044AXSZcUWBeX8sdYYx7G6faf5mtVxhDq7JrwG3BaWzJXpF8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyQUm6LLKP1bRZqTutyWTWG+ETNmJEKFmqvxE2L7yMg=;
 b=DOY/NyIgxZs3VZtboRZ1b062tSB+Dd73LsGwPQAAwhG0TatDadhVUPiPAhbhMj1yq9mJBbds/W9qHhWKveLsRqR8RDW2W/b6m+CT7nd1tsmX8Pm+Zn1jC+66GXCdg/NU9ERC79TGeBoGKPNeuUPqNr4uni/BGGJuQj4hiD+i3z2wgzmuUl6m6sX6AWEZa8VIaEksOgBhbgJLgFhNRVKgKpTTz0NKASewmXV4Qq/zvXOXaJRpXTvJecQEp+/4WGR/q+7v83F/SvGoFLuY4WM0ovrp+9xcCF7vM7myB3UdKN9dOHJCwo8ev2+svbSGL6BB1S2efTdY6CMAYRmgpLA2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyQUm6LLKP1bRZqTutyWTWG+ETNmJEKFmqvxE2L7yMg=;
 b=FRO1mvRHSoxK1TWxO+rRgdH7bTUUbioxhUZXQPayvo3DeaLBe/Cz44t5A+213LYEQ8U54r6Iuuw84r+ftgbpT1QrnzafxL2GA8Th4sNVXkmpWK8QiSk3nVyVMZaDKGSsCGvq649KOyDXmsct6NEuu/bCnH+2/L22GdQ7IMPcCia0WFNt3hlK8w/x7ooSEJIg+KiiIcYqGTzkudDsyIh7aWGzhwDJyuquIsbA+GEEwaw0I0dTdW+6VJJe3ymBm4nu0yI5HE9edaG5bS2HbOyTuyfio3lNPK4BrAB2SRRY8tpLZyukEf0DF139lseNPTDSgmAT83dJ7Uk6XJoZAnODgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 20:25:07 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 20:25:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Thu, 08 May 2025 16:25:04 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <C4D87FA7-4B3D-440F-9E5F-B57561AB4FE8@nvidia.com>
In-Reply-To: <20250507211059.2211628-5-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-5-ziy@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:208:23c::13) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d648e19-bc8b-4b9a-e0f8-08dd8e6e6c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ow4fzg1TYemF/aVBfIKiHEXQOJvG1KafgC8qHti9HGejJrKMbsK9XCTGHWxa?=
 =?us-ascii?Q?g9zTbS82agelx5woL334hiw4x0wiFmTW4JI0LFBVaDjfgf17m83SHtb0PKpB?=
 =?us-ascii?Q?YJHve/704G0S357eLFzTKKOmFh4Fak1D/baL/iN5FDatxe29q/9m/W7D/nB1?=
 =?us-ascii?Q?T+qLN2BCUUtllMGmCxGFJ3UQ529WQB6EFtv0K7GAtn702UtnzKehw+Popksf?=
 =?us-ascii?Q?yHqexihoNqOrMzMCrtlAyNvOymYjbY2uc+/gXzCjLkigBSqaRvKPaIqw4fIA?=
 =?us-ascii?Q?OM3L5+K5ofssaI4hU9P9Mn57KcqN/9P22N5yFuJ9RwbiAmJ84td1ZIfT54Je?=
 =?us-ascii?Q?fm1fXSIaOhjN9DPaMOSWkbwbTNgFgiFnfej/cf6kePigItQDW8i4MRZUDjU8?=
 =?us-ascii?Q?Wj7bKjKwH7PtV92QObRMi0COPy69KMPLF6wa6wupoc+uFrdMX661tTaNTaGZ?=
 =?us-ascii?Q?8GUG7rWzZqfyQIcT2X1VY95YFApA81AeZQB8QLFpTpdiSnHmzjod/mHWA0q3?=
 =?us-ascii?Q?2ooFOag0vA7pnzEWPkbPuDnBCLp+YVAWEeghoDOPx8RD59lDeIEe/Cu6KHo8?=
 =?us-ascii?Q?zabWMIjyXaNHKV5xx5FtE5jC3xji+Oii45IKbLk07rkptGfJ70VPBKkgWdgp?=
 =?us-ascii?Q?JyTqyrmVtul9iqymIjSRE4vvdONoWiitHX7qLNPu5NLygXp1xHuPvEX6J9CU?=
 =?us-ascii?Q?vnHR5/OQ1wMFSWSo0mVXWe2S/qH2CWZV83APQRTLTn4cof0WiPZVBm6/j9JY?=
 =?us-ascii?Q?+6sJbIpasLIUgzrI2eiazaL7TdZIOGeJ0el+STBQ1VOzUUcLAesKTtredXBq?=
 =?us-ascii?Q?8OP6AWplyKhe5xaD80QrbqK1y99tqluuACqyt3McTo08dBnsGgZ1Z7Gy5pM/?=
 =?us-ascii?Q?z8pxU/gIlO0v+fKuQbXDYFw44Ov7q5dZAxqgLwQUcdY6hcuj8l3+2olKOKv8?=
 =?us-ascii?Q?jUHGHi9KrHRIzM4NuyATFbrCxr1Q8eXlR7lz6F+N6lEeJir9zDmmvgXagfDK?=
 =?us-ascii?Q?mmW/0bwwlENs9AfiRxCL+EHL/fuEdBXgRL8ALIWMQ+/2cOkJEPZqPfFtXAlw?=
 =?us-ascii?Q?zVVimKQbBDfbXdcAJRyRQRY/mpfluxrHBu2Dr2E+9bEvZrtgZBKxhx4s7Z/e?=
 =?us-ascii?Q?WjSvkFYS0ZLzWwpP5bxgPube+07lyWdtGoEexYeblZFApt/L3P/ujSkgN+vO?=
 =?us-ascii?Q?pv/zG04w+jRhH8hfVBr2IcdhFmUQ1cDGDbA8ylESx5n9jnYr7jtS55D3XCgj?=
 =?us-ascii?Q?U+EabFNNle4h7lS4A7y9SylrDu8VuNMEB/wARH/OBSBVkBz/Qazmh3WlXeac?=
 =?us-ascii?Q?t5dFmYW0XH5XHTagXQGf01ynjDlJfdsuA04fKwQqpkqNTg/WIQyno5iJHaTL?=
 =?us-ascii?Q?mm9ubEAsCv7WN7NF3HfUlr7iWh4H3eotli3c9aBTgQATGF1ZM6W9IoPzVjnl?=
 =?us-ascii?Q?6hJZCp04xbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5WpBv9HKsPtd2x8UYvRhwPIIXNBUtf16SKSxGWE7hvEt7sTpEHCNtfZAFYe?=
 =?us-ascii?Q?xYq0aGkrSPAmXz3V4FGvN57tFuwkfYmoCgPWF9jraYdiJvyv7dsSN3/+Wuoj?=
 =?us-ascii?Q?BOHGahnE5ZOAMheg2k87NWSFr9hse5q+bYsblE+eC3QRHbed7e75JT9c6Iqo?=
 =?us-ascii?Q?ph8AwgHT8CjnxZrANoAaz9bnAUY9W9tMe6xLn1dTARd1+jww7D8D11jCQcOJ?=
 =?us-ascii?Q?ya4fFqWSLX1VWZq8BUeyg4CFnVM01hEPXIRYAZQdin6Qv1UoWd/9yaLSCfiQ?=
 =?us-ascii?Q?TK6tHPZG7v8bzKL5yN9dJAF2fLtiQDDTAGiP2DujdBuYDIydkeZuQyCUzvl4?=
 =?us-ascii?Q?BpFbaac93SYjW5x8zcyKuY3AX3ZFlxmX+cahCZIzRD4X2RWcpAmDMj3ToR32?=
 =?us-ascii?Q?PvsVJ4R7rl7oWLyNLuiCPsh8OzgDC5yussiicqkG58fpuc3qm2UnETDvgUIz?=
 =?us-ascii?Q?Jb4phFfSb4C0JiRkSr55/qPqMUVJuhxQC8oifSZ9AQflAP5bfqFVXiYsh4/d?=
 =?us-ascii?Q?IaXuNBHEFoyGaIZTsmT4d8GFZgBHqpiqDumL9onWrMcahCZjRL2X9g/yRdA7?=
 =?us-ascii?Q?S7iQ2N+5pAEygLVieDrniQGWRrL/vmMij/rmxLjNhTCAiH7TlazKxB0BChHy?=
 =?us-ascii?Q?qf6zi8vMoZtrkWfKydxVo/Mb6InhgxYYiK8QNHcxK9xa2TCuZ7jrAnIPqYgP?=
 =?us-ascii?Q?Pg8CKy0kukYaQU6seRlOhCJ23RbI6tnzBaCaPrsdkZkFeMXWFadnCPClwQWu?=
 =?us-ascii?Q?83NWVlI+uF1Fw16BAd5OaDJwDbV65C0gdbi82cNNGOcLRd1AhOMBxr/VrpCx?=
 =?us-ascii?Q?zLz24LwK+QaJ53VYmSPmGWfRXTkZrQAcGO7p2UcQOzoszCBvNrcRsv781RIU?=
 =?us-ascii?Q?hSzGEBnSlknImusYdbzv6IqAEY9OOaIDku2IInX1+i3IbKMUaDVAw2TWhD9M?=
 =?us-ascii?Q?VfOg2U1V8Ln8n+xdJqeR3/tLFpTxBewraD9mKCPpd7z3xbvkDWFEOrQ950uB?=
 =?us-ascii?Q?2HjUThlk6Nfs9NFSOsDaz58HonWOvChGOwxt3/H1N13Tzbn2Z/wNbC0eR0J1?=
 =?us-ascii?Q?R7rlABug+yrx5UlbyqSJrzWSIEy3aJoMli3Uez+sSHHlGfA022KeltSsUx5+?=
 =?us-ascii?Q?U97qOUZw/u87OftuHuAU378JxZuYHyEUiUZ83jh3hthTDAG2/8NSyyBPLVwC?=
 =?us-ascii?Q?x+MzTzqNBpBYLpQ9bYxTrHDSlwozIgLNCxBFl3hyrNGzYJHZN65/qwcLeAra?=
 =?us-ascii?Q?KZi85WVDWeIpPJsix65214NkCwMTp702JL6LzJ8QRzlalL3eRtEqLzv1L796?=
 =?us-ascii?Q?dRwiKdrKgMEOiYe5y64c9ItBYjSS2uThAk0fns/2oFgDoWp9b74rptGsVAI+?=
 =?us-ascii?Q?2Zru7oRXnIdkRReqR4eJuh1SO8KefD9S+gl6yzjy1yMip+UiynK0KEp2CW+1?=
 =?us-ascii?Q?d1ckX7q5j6FZsMw9YgQGmipJtH1fauDxfxDegqMzgsG92dGAgkDcrMy69XqP?=
 =?us-ascii?Q?AsXvFcuRNMyW+3D/6gnXy9D/SNgmhhqbeLB0QoIbEGG7ymeiV6Th21Cw9avc?=
 =?us-ascii?Q?pb1XjYZghGUlg5KwQPm9Qa8jVApw7juZklH3wwlC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d648e19-bc8b-4b9a-e0f8-08dd8e6e6c4f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:25:07.2418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSQHXvBbLWMCByfo9/smbhoX/DmYawOa90t4qglvfqr4mGDzK7CZ9Z30s8N9n3Rh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On 7 May 2025, at 17:10, Zi Yan wrote:

> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
>
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to isolation flags to provide the
> information.
>
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So doe=
s
> __alloc_contig_migrate_range().
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  drivers/virtio/virtio_mem.c    |  3 +--
>  include/linux/gfp.h            |  6 +++++-
>  include/linux/page-isolation.h | 15 +++++++++++---
>  include/trace/events/kmem.h    | 14 +++++++------
>  mm/cma.c                       |  2 +-
>  mm/memory_hotplug.c            |  1 -
>  mm/page_alloc.c                | 22 ++++++++++-----------
>  mm/page_isolation.c            | 36 ++++++++++++----------------------=

>  8 files changed, 50 insertions(+), 49 deletions(-)

Here is the fixup 3/3 to address the type issue reported by kernel test r=
obot.

=46rom 3c439f1f09b03c8362b43c0ac05e5f174f1a6655 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 8 May 2025 15:42:18 -0400
Subject: [PATCH] fixup for mm/page_isolation: remove migratetype paramete=
r
 from more functions.

1. fixed test_pages_isolated() and __test_page_isolated_in_pageblock()
   signature by using the new isol_flags_t type.
2. fixed test_pages_isolated() doc: flags -> isol_flags

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-isolation.h | 2 +-
 mm/page_isolation.c            | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolatio=
n.h
index c176c938da87..20c3f98b5afb 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -45,5 +45,5 @@ int start_isolate_page_range(unsigned long start_pfn, u=
nsigned long end_pfn,
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_=
pfn);

 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			isol_flags_t isol_flags);
 #endif
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index a9d0e75db95d..5f00d7113766 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -563,7 +563,7 @@ void undo_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_p=
fn,
-				  int flags)
+				  isol_flags_t flags)
 {
 	struct page *page;

@@ -602,7 +602,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, =
unsigned long end_pfn,
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %MEMORY_OFFLINE is specified in @isol_flags, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -610,7 +610,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, =
unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			isol_flags_t isol_flags)
 {
 	unsigned long pfn, flags;
 	struct page *page;
-- =

2.47.2




Best Regards,
Yan, Zi
