Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ABE2264B7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126357; cv=fail; b=PEpgXkS7o3QaOWWYsuWzU5yeeTytl9tQe6ZeEISYhW/M5i5yx+vpIp7O5Cp+8/SddXIwAFsiW+Mg9Zh1RjGi5sXGXP8zigAtq7PuRx8HF3qGiPJkG5E5kLVEwk1RamG+o2w6uXQwM0ZB5/YCQ/8iIVUTVurf2ghdG+fDPUrHB9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126357; c=relaxed/simple;
	bh=xRiDR74Jyib6V6XWSnXHVca7INXgcofXPM/jwUcbX+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2s4uDVX3B2KRu8dwSKQA0HwZHL3MlQB3Dse6TDKQls/riHvEUqjnY2jlFkjaF/FMDZkVFXlPtQB/kLQj2+wv21Uzk2K+Jt4qCNDKb++TSQVOnn6vmiHbUwCUviKDU/2uvcJ9bxEIYcKqsOYlxU+ce61BnkZJYkXPOAZAkIEn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HQ9KyR1e; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HQ9KyR1e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycs/EGsfBZ9SVCzNpGpp/k98KKubYQ4NPeIrVpI2cnKD9V8SfZW+yaIAlUC7ZUOrQqEsCjj5p1pg/r5pUwFaBvCXmz2LEp5mBFkN7zRxhaQyjER9R54plsZaAG2U7fhdf7vQYouCROX09Qh3+/aeHT3zGOPIdTmZNPaEkePuiaLGVMFde1wSCyOanULdnTwZ2oJGRy8Aj/TdHK2KCs1DDyQlaQnq15oDJMuxRALBbWNlxLMKHOoCGokZ93p7/FeisbYA0sxYWeMKkgATh0s9oR4xVRiK1WegE7FByKF2wrtFPVxEuGUf1+gSCe/FJ2oMK9naFdPMDeNXZffjuR69cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1eQEkxy8Ur/5LcvNruGIBU9rBmLt7aX6Z0A5AUlrL0=;
 b=R0IjY9hUxpufMLI1dkJc43gl84dkx6wvWf3j78ByQgn6BiDmfCCe+3YFgof0RjHe3/su0zKWvM+Znj3UUKihvToCT9ZmdWQOFFekNKXdvZhJqUq9QPNyvclJfMV191Sq8b6I/BtR9YvedNTfHmX5y4W3vEVZoWn6gllK9pQVyY2NgSeDn97aFA5nYUhTzy3CuDfAXmutxYgExMQEkYAfyNM7X+9tzTBNDiQ0uQjUH5TGYCXNIHIrKYlgmV+EcJnPufaVV28dnYahTPSkvU0G0zQFE6tvfu/OGPr6cuPcl47WyZ9DrzAoh1V3D0BTpAmqO62Wdyos6X5G9//TFKhpNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1eQEkxy8Ur/5LcvNruGIBU9rBmLt7aX6Z0A5AUlrL0=;
 b=HQ9KyR1elsZ5+qRxuNF2TDCEMW3ThtKl6hH4uCUq8hoCRUeaYF9ltZN1o+ty1TMRDPcM8NW2YNJoOTGrYNDQn2OmQnncZFBmoCAOxqU2apMcTDw0gx2esVVjK/UD86J44XuFSorqeasfthgW8f8e5HyaOZz/SFfjvW+9L0IX0kLhkiJtdmaIQwp7Oqr3GleQLdyMwG0c3oN80kkyJUElPjUY5s9aazNIjDaHfhrFD100PJExmf/J/oNpKWUkOTRqQSMTAixabgnaxkqcskHnUA38NnwkJ6VrSG3gy9rVl6/ndkkVoYUkxwOda9sFzuD1U0ZAmfZHPonqzXZ950fsCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:29 +0000
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
Subject: [PATCH v10 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Mon, 16 Jun 2025 22:11:14 -0400
Message-ID: <20250617021115.2331563-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617021115.2331563-1-ziy@nvidia.com>
References: <20250617021115.2331563-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0001.namprd19.prod.outlook.com
 (2603:10b6:208:178::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f29b93-49c6-4888-add1-08ddad44691c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vwmql2mjKuLLWVjZZ7Ke6AC0KGgMeF4d+9o5GWwt6Vd+hKZbrdTjc5rpyOt4?=
 =?us-ascii?Q?LSk89matjasjkUzOh+EmkWwL3vTts3vKXiGa80owvzRRC368DBX/xkijsfRU?=
 =?us-ascii?Q?hK+FNrR+Zlj34lGohqvCg99QfjUtjQF/U/vj4pZKfRds+0wt3RPFVgbIb2b7?=
 =?us-ascii?Q?voSfJghbhOaqct7eXqAMFy5z87psInbhwYCkDQUKDeJGmn38JOAbu0RYswQY?=
 =?us-ascii?Q?d0xgP9i7pw1xjzp1OJXw8oPVmVPEKT7ux9F+nxosrR9J9yPOv5aqd6UERkw2?=
 =?us-ascii?Q?vJKSrCAxQs8hmf6VIX62f13iOPyE/5X9naU2Z947vsSb5UHHjUbu+3WUh28u?=
 =?us-ascii?Q?SSPz6gnOEaASowQ19cyQuslzsOlkw/FeXblBO0fncAloLDoLq9Kxdv8hC/wa?=
 =?us-ascii?Q?6meBj62pLLCOOeuMfpiY1vj7mD7hA8I9eTyIfuvSAX9CKmEYmQJzk+PCibAT?=
 =?us-ascii?Q?KEnJZL9H5tCxaHOkx2Ex08wpRcD/Y9SS/NvBR/UI9zLl3aVeyhhNdPv4t/Hv?=
 =?us-ascii?Q?js2x3YHP343d5wVFdcLQVkL7rCnnQogGZ8V5rjAo5fO0iX8dJGE/uEZIooyd?=
 =?us-ascii?Q?7uZEcx5aQEBB8NH841CRaoQbMKs2X5yvIRnAV3+pGBTU7d6F1BJruSUCHf00?=
 =?us-ascii?Q?+cdfLUD9YHMp7WmCqsYJwub02iSWR723ksLaC01Hu2Q2Bk0TiQcXTPPtY+oG?=
 =?us-ascii?Q?y6XITTH0X2qQLCJhjW86s1LwvaWrNOo0ZVlUzoSp5jHpZgeo2EhpRNahZguz?=
 =?us-ascii?Q?jEHTfRzE0FZMy9yO/G8A24/6KvEnfUJEA+61++Opn9p4upzNMXW/1+PjHNfk?=
 =?us-ascii?Q?l6KUqrXxiY6H0KZXu6PyQPJavgviK9TegSyW+R5E+W+agjYY6k1Q+C7ToZ1z?=
 =?us-ascii?Q?Tzra+VLix/c1Top4LmPtPYgYMcdVcxTQ5Rh0rBKEKkC0/ZXdLkhSqlTXFeGC?=
 =?us-ascii?Q?baYc7tx+DZbVL/dqgJnzdV4XsRV/qDDBGBj01ANZ4Qk+AhnFaYsFlWiPjdkO?=
 =?us-ascii?Q?YephuDk7uhDSK3ud8N+eLy8lm/H/k847zlc5s6MvLHD21QDlQGA88P67TQGR?=
 =?us-ascii?Q?W3HsavX5lotdc68Qnl6ksWvi0rHJXSPQ3o2xquYuuUFesun15aCRYQrQzL1z?=
 =?us-ascii?Q?ObgVoAe7k2QC5ODWxv8BsEMB81CyASs7TdfNkasaxYYbzhWDfRQymoIf5sR2?=
 =?us-ascii?Q?2JE9NuJXA2bP6k+U2XdsBpzSuAYahW7XJRP5hyBA4cWr86/YnF8eYL8G55Bz?=
 =?us-ascii?Q?DwelJvNT0i/fZtVPDNK7lwdT4ZnzTK5FK6ikShfMrDCZNuYh/bqp2AC/2BiR?=
 =?us-ascii?Q?BYkK+/9zgw8AI8AeqS435vh8J5wXyFtfM4J4q67yNzIQ4d2bflcwrURAgIy/?=
 =?us-ascii?Q?UW0sGx85U7uVAROVXW2ue4oalm9TGK4XFYsdlrCgpvTswwmWscjHV36Mk5t8?=
 =?us-ascii?Q?/Kj5+hcLwoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQ+NkSFAExSx0PljfwVB/XR21yZXaeDaggGqxF5RsgHE9ZKuc+h0UF3DJkKD?=
 =?us-ascii?Q?UfPxnk5UgvUv6NlcEmfvZAwjHN8NaGCwuErxX9oNZu47hHoAsADaTAxrRgdD?=
 =?us-ascii?Q?m5bG46svbozS2IiRof33IrCfdxWq/t/4g3sTBxO6NyRqvCxsxe5PNDd6iXqA?=
 =?us-ascii?Q?uPz1SM9ekiuKF75VVB1mrEqp8xHXLkfwjW/Tvbt4LzT3FwZcEWpgCaI/ChxU?=
 =?us-ascii?Q?qz+Xx31Krnd+q1TNx8qqLR6HbenXNLLRDKBJawMfOkUwec21cq9Jh9iY7521?=
 =?us-ascii?Q?iMHQP66svKf1BPYqR0beLpGn+VBvTfhio6Tm6YiVyDUL61SJhAhan9qubupA?=
 =?us-ascii?Q?jGaPzf1Ox0MgV+9VEoZdHN3E+eiJDZucHX2jJji++oDhTKUhtrmjNwd1m82c?=
 =?us-ascii?Q?LUJ2rjnytEpzzIK7BtoiwXoWqcH+Ch83OjbaEnKdsYj3Ckvd1SYjymBESvZn?=
 =?us-ascii?Q?E/rlqU9r3eX0wJIuSd39Qsvl6kJ1c4ZlrxbfiqBw4nYRW+gJCKcgrS1jPJ8t?=
 =?us-ascii?Q?J1QNrKPGCpOqDCwvQjzcpzdhnnFfCVlRDpiygvs8cRGox7ijyb0MC+O7ycY5?=
 =?us-ascii?Q?P8xIQyeWXOMv6cejcYTC+/ibHTfgjqF3T3XrvXrHWyBfCAdfptnuZlp/UiRE?=
 =?us-ascii?Q?z7g577PA+C63VBpqrG6RUpJWWU11kpgPR64jNztD22WCoM7yRAFDCD334ylY?=
 =?us-ascii?Q?Z2BXv/i2zezWGEu7heJHACZewMl7Dc2AoNaOht+waaBT7ar+Pm0yMmrZUQ8e?=
 =?us-ascii?Q?p5dprNJPNiRaSM1huH667Zmo3WgeQQr0Y7l8PlbrJ66ZuJpG+DWrF88Uk2k3?=
 =?us-ascii?Q?b52yfCND+U++sp4Iu41XlZi4E1Z5CUGhBs75hQh2IjLS1iRfENYi+Fbk7CbN?=
 =?us-ascii?Q?Lj/PDYs/8rpcflC1PVYh2VKY2lhXtvj6YXeScXz04VvlwLLr+Uy1guKGXjkd?=
 =?us-ascii?Q?VBzkc9bQQCauut+TpeouM/9+XIxIBqelpJlVcmQjilYLm+vgubolFf7936cS?=
 =?us-ascii?Q?HEtgqywaMUbH34BkA7jqjJxvV+ms0Vquyeg01WGzoeDZGYaH8NA9PwkrJNpd?=
 =?us-ascii?Q?rZrPmqoj1vUGPFjzmG4TVGqY2GdzUpYUBxVGz6CTMIaZ5wlVr6SJN2OumStc?=
 =?us-ascii?Q?6n836nG/0QiPvv+WNY0YZhHmpouyFyvM48PHGlEY0OTq4m3ZtmmerdZqhlAN?=
 =?us-ascii?Q?/2X1YxMvt0Khxd7BiSt28qzEl0ARDyaoxZCfGy857tzKMrvKJbrcpMdo6lTA?=
 =?us-ascii?Q?dw3fHRMqRdE1xqApXUUqJd5hhikv5OyHufxHQQCzbOHvmEu49olmSupiiUL0?=
 =?us-ascii?Q?Hf1sgCO48GwoyDl6wKr1PP5PxUGR89uiONEkZY9WQMhQaQbnLoyNi/zs3e/k?=
 =?us-ascii?Q?ThMlwzDZ4jQHXbc9bcUF06d3zt6sz5aXLdmSa8iX0yZECdwYcim/joQDGjWx?=
 =?us-ascii?Q?pPWVMeQ8zQDoIp3dX7aAatiizNOjEc5C129inIQG7EMHw3YhBrpZLvbAqX06?=
 =?us-ascii?Q?mwzaKnymq5jKOTMhw8Mpl5sNAaz8HLNSMODP5VNvzvIJG9WLArS9fm1SFHIx?=
 =?us-ascii?Q?yy0fuErrtFdPT2OFc4ymnyvPeCf+2nJYgeAD0fh1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f29b93-49c6-4888-add1-08ddad44691c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:29.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdu8uH76QeArZxGs/szdYF6oomJjlbSNCzbuEqePOg/Exn+qIGAUFnpintWF9DmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
At the same time change isolation flags to enum pb_isolate_mode
(PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
reports isolation failures.

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range(). Add ACR_FLAGS_NONE (set to 0) to indicate
ordinary allocations.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c    |  2 +-
 include/linux/gfp.h            |  7 +++-
 include/linux/page-isolation.h | 20 ++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  6 +--
 mm/page_alloc.c                | 27 ++++++-------
 mm/page_isolation.c            | 70 +++++++++++++++-------------------
 8 files changed, 80 insertions(+), 68 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..1688ecd69a04 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_FLAGS_NONE,
 					GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..5ebf26fcdcfa 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,14 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+
+typedef unsigned int __bitwise acr_flags_t;
+#define ACR_FLAGS_NONE ((__force acr_flags_t)0) // ordinary allocation request
+#define ACR_FLAGS_CMA ((__force acr_flags_t)BIT(0)) // allocate for CMA
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+				     acr_flags_t alloc_flags, gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
 
 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7a681a49e73c..3e2f960e166c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct page *page)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
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
 
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
@@ -49,10 +61,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     enum pb_isolate_mode mode);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			enum pb_isolate_mode mode);
 #endif
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index f74925a6cf69..efffcf578217 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -304,6 +304,7 @@ TRACE_EVENT(mm_page_alloc_extfrag,
 		__entry->change_ownership)
 );
 
+#ifdef CONFIG_CONTIG_ALLOC
 TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 
 	TP_PROTO(unsigned long start,
@@ -311,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 int migratetype),
+		 acr_flags_t alloc_flags),
 
-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, migratetype),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),
 
 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -321,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(int, migratetype)
+		__field(acr_flags_t, alloc_flags)
 	),
 
 	TP_fast_assign(
@@ -330,17 +331,18 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated = nr_migrated;
 		__entry->nr_reclaimed = nr_reclaimed;
 		__entry->nr_mapped = nr_mapped;
-		__entry->migratetype = migratetype;
+		__entry->alloc_flags = alloc_flags;
 	),
 
-	TP_printk("start=0x%lx end=0x%lx migratetype=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
+	TP_printk("start=0x%lx end=0x%lx alloc_flags=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->migratetype,
+		  __entry->alloc_flags,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
 );
+#endif
 
 TRACE_EVENT(mm_setup_per_zone_wmarks,
 
diff --git a/mm/cma.c b/mm/cma.c
index bd3772773736..c0b2630a1b81 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count, ACR_FLAGS_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 224987824a84..b4ac226795f2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1961,8 +1961,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       PB_ISOLATE_MODE_MEM_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
@@ -2039,7 +2038,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			goto failed_removal_isolated;
 		}
 
-		ret = test_pages_isolated(start_pfn, end_pfn, MEMORY_OFFLINE);
+		ret = test_pages_isolated(start_pfn, end_pfn,
+					  PB_ISOLATE_MODE_MEM_OFFLINE);
 
 	} while (ret);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 64321f6b714f..858bc17653af 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6693,11 +6693,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
 /*
  * [start, end) must belong to a single zone.
- * @migratetype: using migratetype to filter the type of migration in
+ * @alloc_flags: using acr_flags_t to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-		unsigned long start, unsigned long end, int migratetype)
+					unsigned long start, unsigned long end,
+					acr_flags_t alloc_flags)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6769,7 +6770,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6840,10 +6841,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @migratetype:	migratetype of the underlying pageblocks (either
- *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
- *			in range must have the same migratetype and it must
- *			be either of the two.
+ * @alloc_flags:	allocation information
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6860,7 +6858,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6875,6 +6873,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
+	enum pb_isolate_mode mode = (alloc_flags & ACR_FLAGS_CMA) ?
+					    PB_ISOLATE_MODE_CMA_ALLOC :
+					    PB_ISOLATE_MODE_OTHER;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6901,7 +6902,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;
 
@@ -6917,7 +6918,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6951,7 +6952,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6994,8 +6995,8 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_FLAGS_NONE,
+					 gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..ece3bfc56bcd 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -31,7 +31,7 @@
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				enum pb_isolate_mode mode)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -46,7 +46,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (mode == PB_ISOLATE_MODE_CMA_ALLOC)
 			return NULL;
 
 		return page;
@@ -117,7 +117,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -130,7 +130,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageOffline(page))
 			continue;
 
 		if (__PageMovable(page) || PageLRU(page))
@@ -151,7 +151,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
+static int set_migratetype_isolate(struct page *page, enum pb_isolate_mode mode,
 			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
@@ -186,7 +186,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			mode);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -198,7 +198,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	}
 
 	spin_unlock_irqrestore(&zone->lock, flags);
-	if (isol_flags & REPORT_FAILURE) {
+	if (mode == PB_ISOLATE_MODE_MEM_OFFLINE) {
 		/*
 		 * printk() with zone->lock held will likely trigger a
 		 * lockdep splat, so defer it here.
@@ -292,11 +292,10 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
- * @flags:			isolation flags
+ * @mode:			isolation mode
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -311,8 +310,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			enum pb_isolate_mode mode, bool isolate_before,
+			bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -338,12 +338,11 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 				      zone->zone_start_pfn);
 
 	if (skip_isolation) {
-		int mt __maybe_unused = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
-
-		VM_BUG_ON(!is_migrate_isolate(mt));
+		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
-		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype,
-				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
+		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock),
+				mode, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
 			return ret;
@@ -441,14 +440,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
  * @start_pfn:		The first PFN of the range to be isolated.
  * @end_pfn:		The last PFN of the range to be isolated.
- * @migratetype:	Migrate type to set in error recovery.
- * @flags:		The following flags are allowed (they can be combined in
- *			a bit mask)
- *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
- *					 e.g., skip over PageHWPoison() pages
- *					 and PageOffline() pages.
- *			REPORT_FAILURE - report details about the failure to
- *			isolate the range
+ * @mode:		isolation mode
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -481,7 +473,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     enum pb_isolate_mode mode)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -492,8 +484,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_start, mode, false,
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -501,8 +493,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_end, mode, true, skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -513,8 +504,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
-					start_pfn, end_pfn)) {
+		if (page && set_migratetype_isolate(page, mode, start_pfn,
+					end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
@@ -556,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  int flags)
+				  enum pb_isolate_mode mode)
 {
 	struct page *page;
 
@@ -569,11 +560,12 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << buddy_order(page);
-		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
-		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
-			 !page_count(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageOffline(page) && !page_count(page))
 			/*
 			 * The responsible driver agreed to skip PageOffline()
 			 * pages when offlining memory by dropping its
@@ -591,11 +583,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * test_pages_isolated - check if pageblocks in range are isolated
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The first PFN *after* the isolated range
- * @isol_flags:		Testing mode flags
+ * @mode:		Testing mode
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %PB_ISOLATE_MODE_MEM_OFFLINE specified in @mode, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -603,7 +595,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			enum pb_isolate_mode mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -639,7 +631,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

