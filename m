Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221C20AF87
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126350; cv=fail; b=Pr3uZ7tYaVdEqBqGWyRHdLRD2c1pwcUBqumKi0K6kAKf8R16CNrVtdT0s202h5sVDzgj1FyQ7dA8GclViLJtRkO1PoFdANR1P5BjJCv1crrRGO5JBBu6pnl1RvFMVIRTec66vOJTOxTJPeqDdrqjG6eeXOA40/m9nLhGFf/BbS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126350; c=relaxed/simple;
	bh=huZa/wTHPFvllAnSp3BlNifPS6ZRxyDvQ0rEGtwbJMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX1C6iP6aFMTSfLd6kqeqNLHYb1zzXlvRJIwP6+nRnWoa6/++0bNowv9Kbwz1sT9aN6W8deRphr5uPjo4Yqk7s+hkFgAOSgcUaTIfm/kk+LeDUAAh+Jr55oAhX4lrRXFhzeBAgmbyvmeTPbvtqWIvmBVsnFh5DSFMSxQCFHb8zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHrFJPum; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHrFJPum"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr69YQRFp1+eydqCEAyvFMnm/uNGx9UvxlgEJ8ZB2ssrIxj3FlstgFJyt4rWkqMNIEyr+d7A2IoFYgLAMutz6uMnYWUgdu4KDP9I6AQSQhapvyCFNjtWpcRhkusy+ZKPdn5RKojxqN4GAmVl0Nv2CyNdL/o1Oxh9pIZkov8s8LJbTt+YsSQPO/Fb+/qdShoJAFcziKxZnev1KopNaZ/VoRRohRUYhOlA/4Npxlhtc8z9jS8EF8QEFgOc+cuKkPWrFVIqYu5g7j/NwP8IBABNAw4X78wkOffSnrPAvIMqCh/FF2vc4Lz7Gdm35UXQDETe/GSM9ITKYLQehB4s/MD7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUrmxqacd0NkGZI9EGgRJ1d2aczUkKGq+xxx9NV0W5E=;
 b=M6lXBytLt+IL4ijRppCsL4Q4YBxLKmr+vpwcad+FbVJnE17J7WEB9UeJ/ZgpKs6cNM5s/1rBPBqdre+Kcg1IvwIF2to9xVSNO6gkXiKlMMz71xrVtOGMDjNw8xVzDcAPJ+FIzAQ7rXxaGLmuJnHE/eA6ZxFyeFIvM3CFJH2eMDP0Y9PLAFHX/x/4DUCTk7peUkjdefysWbinQ4ZeC7LVsoVuEoGvT+1B01Y4Tw0jWnAxGx1klbRufDmJoG1s6PVLjpvcHdgdnjsFUGXWY1woM1w//N5tmeXcjv687xbTF2+nZ7qK50RbtRdGO/+xPp2EIemmBHmwygBCPYrIbFgmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUrmxqacd0NkGZI9EGgRJ1d2aczUkKGq+xxx9NV0W5E=;
 b=mHrFJPum54fbo1Wne/fqIGf5YkaYbPXlZpn6UTXvxeFxZiqgtKNgpS62erQJ6VqmAk024+EIVwmmSIuE7IvIRXpjECtKM0mhk3/K/n+cle4nlKeLiAYdeksiUCN6Z2F5WVnGw5XgiyoAnjQVGVkaxgrwXWkp7g+pg1LTfM0VKbykGamwrRZSW9LebByjjddaLBIVPDCmgz+C6R7mf8g51cQ/GuydGfLi/iKthF5DpiFFozWhN8pqJCatrtb28n0SS4bZiW+eDaXwUTqOXji6n8nzqJ7TygZuNhudmSt0WzqOxUeOVVwm0swO/IYovAWA33P7kS48ziJj5v13XoSZUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:23 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v10 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Mon, 16 Jun 2025 22:11:11 -0400
Message-ID: <20250617021115.2331563-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617021115.2331563-1-ziy@nvidia.com>
References: <20250617021115.2331563-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0011.namprd19.prod.outlook.com
 (2603:10b6:208:178::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 05946fad-7fe7-4738-d8e9-08ddad4465e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U1kdoHu/ETHb/FWa+kz9Mrf1kCvFyJ8Rbw7OMj2LCcTHYQTXsNBI4guFaAa0?=
 =?us-ascii?Q?51RIpUHg2vcXxxnMu0sNh866C2Sdp1jCduRxxVyxZsh1B0SigAIiBA9Sh+Pw?=
 =?us-ascii?Q?idH+MeBVqYq3oNAw++56yDjph1KyJuuXqCiCpKuR1qq44+oq5LoRBNwraocZ?=
 =?us-ascii?Q?Q6VRaGgko0dPu2Wdwly+m8+wlIbyG96/pcaNbMXAy668FaSYeqEF/5TthF7W?=
 =?us-ascii?Q?IEfzQZ5CdKPmLPmMFmcvcPEDCK93M3Ad2UdBHJHCQSxpigDfzx+mpnC7U2VB?=
 =?us-ascii?Q?Atwefi1W/U0kWOv/WLwUf+q76MvjWwENPvxbgOZIKA3oeTtaRbbA+ag2c7Xs?=
 =?us-ascii?Q?IJ7ICyuScJ6/qSLUaJNIOIryrRRsmrcRHTHrLhOfWAl5eDWV/h3w0C47HSMT?=
 =?us-ascii?Q?u7iSRW5XRI4wnmkdEcfp93Cr4th0U4E9YCMn263ur7bPYL/ErsKTquULQC9z?=
 =?us-ascii?Q?UZ74mZ7qH1YCVUHNtqUC51uGKIudo3v64mGmB6sP2TR6RNtQtL+wd6pSUdnB?=
 =?us-ascii?Q?iC3E4XqTM37sEukHo9k0mCvk2htxqIcjUKpF0hS2iGoSKYOJ+bxRqtmTpDS8?=
 =?us-ascii?Q?LhuLhr8ejPaGWBn2wHdp9LFILMQVCL876xOFHm0YlY0/TW3WZUnf2GWFlYfa?=
 =?us-ascii?Q?KNpL9OPsETfFGVF5pD9L0oWzQeWIJ9EYDft8DrTnxe6Bb/d17BMsIe8KfFkH?=
 =?us-ascii?Q?hz4wU8LB48MaGmwKPYbFQe7v4CoWmwk16ZwNbDVNWvp1l90RPxg/BixRjmDo?=
 =?us-ascii?Q?Npr9TDmrW702+rRr9KUyFmDHZdi7Np1WDibR/4v7e5jvFehz8ZdskcWVbzNu?=
 =?us-ascii?Q?LqNlKfe/sS14ivUxYvYAK6XaEUqtotUYF5fQhmmorN4EfXM0GlMN3PNm0xJ7?=
 =?us-ascii?Q?9PMeZqcr2+v1FVuXiYem8UbwSy6BElP86vn0odkIzwDiVejjpeFwLWE2BPcz?=
 =?us-ascii?Q?OM35AiAmdVUUm5Mqn0jyqCw9UmjnC1ii+rFf+b11Vcrk/9nURcbjMwrxdAJ5?=
 =?us-ascii?Q?FPqEZTFzaBdNcYxjbrk77vvQgIAo0vUDdeDHrqmdkQ0qdCY+DCQrdQZsZ9zZ?=
 =?us-ascii?Q?RroEmBQerrJ2v4sJKEAFqO7wYG6B7jiRdpIPjAvHNFZGYT3fkG9hCk9ivgxS?=
 =?us-ascii?Q?DjV2VL0id9l9oTYMuoYaAHJPjYDx5fKnTzWHlzEm9Ezd/H/aGnfkWflzt6Kp?=
 =?us-ascii?Q?08qzxBjRJZ1u4YUKiGs3XOGY5P6k9VNSzRwN6hwz7Z321co5knUGwDaI7/ZX?=
 =?us-ascii?Q?rVa3nPOu0MpJXXn0p1JxDDuhv0FjbIvOn0ohigOAYKl1x/JOlOMt7qJ1QqDd?=
 =?us-ascii?Q?7B0oHxx5G9XlzyCQDAcQfv+KqzDgFKXszCloMbZy/VPLKIUC9etHd5Bst3Kb?=
 =?us-ascii?Q?B8OvmPUa7OiirHTPcgivuErTI7GE2Y4zBzodjSY01NWYpJwiJb30VhH0bkS/?=
 =?us-ascii?Q?qLO8fuzmMU0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jD7O44Vng4wK6eFOhSnXmRt5AXObv3JUBrJT2305vND1uOYg0ypT0EQV2/0F?=
 =?us-ascii?Q?IyaKBi3yAkO4buTr9QqNmlVReugM+ieoC30XMCB7WeOvUJiQvNZBC6O/SrtT?=
 =?us-ascii?Q?ne+PGrCAQnQ97I63lX42c+Ffq0BGTWb16DZ4n/DMriSpPTwz7IJDM7KBTAYr?=
 =?us-ascii?Q?zU/269LznjnB5KFQZPtWLTmj7QTD4Ndos4KwOBldtY9Gtv6TB2FsEQlQfhuZ?=
 =?us-ascii?Q?bcMmyX/J1K4mBkMRVH6TdZja2Glbg2pJA8QlZ7p85UAIxHL5xexx3K6/F+dM?=
 =?us-ascii?Q?xYNEG43orJK9D6lEw9woW0RCHDWYY/o3/jyIzmWBU/s7NvBu9XJo7t2SqOdh?=
 =?us-ascii?Q?cM2/wtuK5lzGTpixglYjdKF/wGsGyA+LKKSR1zt2ZRC9y1wdFQHInRguLa0K?=
 =?us-ascii?Q?qTzFTrromJwZkDw1nPuqCn1WYQmOuXv/x50+PEg7DynZ0M7yXvoevzyVEjRY?=
 =?us-ascii?Q?sH1k91iROeAjwz8uPHYMu6peBZJs0OGE5ou7jU40xD255oxOV4ro+ZH3QuWd?=
 =?us-ascii?Q?5E5AqQXIwRP4+KCdWHghRODJYmJ8K4pWZcZEitpWXw8aYRAP53ZyINVu6chN?=
 =?us-ascii?Q?G+8kkeCreaBcftFlrOw3UEsm0qJ40ICK09E4RqLPm6NocO3WhvlQvlJyboOl?=
 =?us-ascii?Q?5e1QDn6GbvfX4Fjles0beNr+TPnNoSKJ2h1m6ocX+hXVIDlNN61p+JfWJXjX?=
 =?us-ascii?Q?v+eTzBL65jcdff2X+bt+2GxhSfUU7HoINDzwlxkbHqbCOXNKTJtyJb+CI1b5?=
 =?us-ascii?Q?kXX41SQspTbftRh1QiwLLWHHc6u4IMAqcbCA+ZwSIzCwy+Q459T7sm5XmyeA?=
 =?us-ascii?Q?A98ADORRn4RYTsDYsFs3L5hBfG/VcMLW8kOxWbWbKBNm46eGQoYQnDMe1plW?=
 =?us-ascii?Q?GtvUWk+ZHLGO5lZtjzrqHJJfZ4PQNmw1iTaPfSbER9QI8FtF65hR8wCQ1AF6?=
 =?us-ascii?Q?Z4ANEf3/GU3GnzzbwJ1bpaWF74mAUV+5K8DrhmDbjIiqd2tWbs9ow/NP1hzA?=
 =?us-ascii?Q?nAYHv0DQlKfcau1A2SHylMnvcvxvlvqXKzXJ1Lcyo4l7+F8+QkZ4+X+6JbO7?=
 =?us-ascii?Q?U0GNj4HJFfSRKzVh0C/8sb1f/BchbHNPv6plcMDP4JpTFr2N3MbqMON05JCl?=
 =?us-ascii?Q?DkhzfbAJ7UmOt93q8ifPY7MtGNF5iJKEL0WOfEiiDzTcQa8bPLrNTsq1gOtP?=
 =?us-ascii?Q?FP8TZ/3NHGx5Kf7IkM1mKu1OIBrpEqNPFSTuPBWt8gS5slrERwZKEQZV3Dlv?=
 =?us-ascii?Q?LuoXvu4Nv/XRnlCnS9pWqjeM/pNcwXspOrXsV4SdcJzorFpPKIkt0E2P7c1F?=
 =?us-ascii?Q?7eWN9aZtHI2ypN9DglR4R4zv1dJ0ms+DdfREJE9O60d4cd6xHJ7ZjInWKRc0?=
 =?us-ascii?Q?TMQrGIzxgmlPq41YOF8vPs3bWiLDnczIRWehnCLmvUwF22mp70CaV+FSSWFm?=
 =?us-ascii?Q?XziUkqqik8ZbZf4eCEF716JbsMHldy0bOypYWZww1KhThUrGke8Ke5L8N5YP?=
 =?us-ascii?Q?qb7v3DWegzCBa0kSV0cqGrLezIzy8A5oXg3gtLvve+c9gJchHzJkukbAzOCj?=
 =?us-ascii?Q?OAl7hSihwdvFRBdYLTbAGVYlKQrMfq3Mls+8eqEH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05946fad-7fe7-4738-d8e9-08ddad4465e9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:23.8456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY7MtLapmvgKJNqqJ6h3sZ0i3iiImgtU3gTabB7KpmrTZT66LfD+Eom3CBoBc0Pd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
initialize a pageblock with a migratetype and isolated.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h |  3 ++-
 include/linux/page-isolation.h |  3 +++
 kernel/kexec_handover.c        |  4 ++--
 mm/hugetlb.c                   |  4 ++--
 mm/internal.h                  |  3 ++-
 mm/memory_hotplug.c            | 12 ++++++++----
 mm/memremap.c                  |  2 +-
 mm/mm_init.c                   | 24 +++++++++++++++---------
 mm/page_alloc.c                | 26 ++++++++++++++++++++++++++
 9 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index eaac5ae8c05c..23f038a16231 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -314,7 +314,8 @@ extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     mhp_t mhp_flags);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				   unsigned long nr_pages,
-				   struct vmem_altmap *altmap, int migratetype);
+				   struct vmem_altmap *altmap, int migratetype,
+				   bool isolate_pageblock);
 extern void remove_pfn_range_from_zone(struct zone *zone,
 				       unsigned long start_pfn,
 				       unsigned long nr_pages);
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index fc021d3f95ca..14c6a5f691c2 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -41,6 +41,9 @@ static inline void set_pageblock_isolate(struct page *page)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate);
 void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 5a21dbe17950..49634cc3fb43 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -1100,8 +1100,8 @@ static void __init kho_release_scratch(void)
 		ulong pfn;
 
 		for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages)
-			set_pageblock_migratetype(pfn_to_page(pfn),
-						  MIGRATE_CMA);
+			init_pageblock_migratetype(pfn_to_page(pfn),
+						   MIGRATE_CMA, false);
 	}
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7a7df0b2a561..3d61ec17c15a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3299,8 +3299,8 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 		if (folio_test_hugetlb_cma(folio))
 			init_cma_pageblock(folio_page(folio, i));
 		else
-			set_pageblock_migratetype(folio_page(folio, i),
-					  MIGRATE_MOVABLE);
+			init_pageblock_migratetype(folio_page(folio, i),
+					  MIGRATE_MOVABLE, false);
 	}
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 3823fb356d3b..79955ed9ac0a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -821,7 +821,8 @@ extern void *memmap_alloc(phys_addr_t size, phys_addr_t align,
 			  int nid, bool exact_nid);
 
 void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
-		unsigned long, enum meminit_context, struct vmem_altmap *, int);
+		unsigned long, enum meminit_context, struct vmem_altmap *, int,
+		bool);
 
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index ddc6c6c63a30..35f008364698 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -747,7 +747,8 @@ static inline void section_taint_zone_device(unsigned long pfn)
  */
 void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				  unsigned long nr_pages,
-				  struct vmem_altmap *altmap, int migratetype)
+				  struct vmem_altmap *altmap, int migratetype,
+				  bool isolate_pageblock)
 {
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	int nid = pgdat->node_id;
@@ -779,7 +780,8 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
 	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
-			 MEMINIT_HOTPLUG, altmap, migratetype);
+			 MEMINIT_HOTPLUG, altmap, migratetype,
+			 isolate_pageblock);
 
 	set_zone_contiguous(zone);
 }
@@ -1104,7 +1106,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
 	if (mhp_off_inaccessible)
 		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
 
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
+			       false);
 
 	for (i = 0; i < nr_pages; i++) {
 		struct page *page = pfn_to_page(pfn + i);
@@ -1171,7 +1174,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 
 	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE,
+			       true);
 
 	node_arg.nid = NUMA_NO_NODE;
 	if (!node_state(nid, N_MEMORY)) {
diff --git a/mm/memremap.c b/mm/memremap.c
index c417c843e9b1..3319e7cc2898 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -254,7 +254,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
 		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
 				PHYS_PFN(range_len(range)), params->altmap,
-				MIGRATE_MOVABLE);
+				MIGRATE_MOVABLE, false);
 	}
 
 	mem_hotplug_done();
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 02f41e2bdf60..5c21b3af216b 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,8 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid)
 	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 
 	if (pageblock_aligned(pfn))
-		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
+		init_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE,
+				false);
 }
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
@@ -874,7 +875,8 @@ static void __init init_unavailable_range(unsigned long spfn,
 void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone,
 		unsigned long start_pfn, unsigned long zone_end_pfn,
 		enum meminit_context context,
-		struct vmem_altmap *altmap, int migratetype)
+		struct vmem_altmap *altmap, int migratetype,
+		bool isolate_pageblock)
 {
 	unsigned long pfn, end_pfn = start_pfn + size;
 	struct page *page;
@@ -931,7 +933,8 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 		 * over the place during system boot.
 		 */
 		if (pageblock_aligned(pfn)) {
-			set_pageblock_migratetype(page, migratetype);
+			init_pageblock_migratetype(page, migratetype,
+					isolate_pageblock);
 			cond_resched();
 		}
 		pfn++;
@@ -954,7 +957,8 @@ static void __init memmap_init_zone_range(struct zone *zone,
 		return;
 
 	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
-			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
+			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE,
+			  false);
 
 	if (*hole_pfn < start_pfn)
 		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
@@ -1035,7 +1039,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * because this is done early in section_activate()
 	 */
 	if (pageblock_aligned(pfn)) {
-		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
 
@@ -1996,7 +2000,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 	/* Free a large naturally-aligned chunk if possible */
 	if (nr_pages == MAX_ORDER_NR_PAGES && IS_MAX_ORDER_ALIGNED(pfn)) {
 		for (i = 0; i < nr_pages; i += pageblock_nr_pages)
-			set_pageblock_migratetype(page + i, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page + i, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, MAX_PAGE_ORDER, MEMINIT_EARLY);
 		return;
 	}
@@ -2006,7 +2011,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 
 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
 		if (pageblock_aligned(pfn))
-			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, 0, MEMINIT_EARLY);
 	}
 }
@@ -2305,7 +2311,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
 		set_page_count(p, 0);
 	} while (++p, --i);
 
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	set_page_refcounted(page);
 	/* pages were reserved and not allocated */
 	clear_page_tag_ref(page);
@@ -2319,7 +2325,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
  */
 void __init init_cma_pageblock(struct page *page)
 {
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a6e191f86ea3..3fae0694aaaa 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -544,6 +544,32 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  MIGRATETYPE_AND_ISO_MASK);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
+	unsigned long flags;
+
+	if (unlikely(page_group_by_mobility_disabled &&
+		     migratetype < MIGRATE_PCPTYPES))
+		migratetype = MIGRATE_UNMOVABLE;
+
+	flags = migratetype;
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		VM_WARN_ONCE(
+			1,
+			"Set isolate=true to isolate pageblock with a migratetype");
+		return;
+	}
+	if (isolate)
+		flags |= BIT(PB_migrate_isolate);
+#endif
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags,
+				  MIGRATETYPE_AND_ISO_MASK);
+}
+
 #ifdef CONFIG_DEBUG_VM
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
-- 
2.47.2

