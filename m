Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB2367A0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622182; cv=fail; b=lHoKwOOJAk6t9btNIkbThSErrZZmaqmtGjLPs15q2MgF8jMIeAfRudX0DG2vnOXBNrj2KWATAGgW0jqLtp8hG0GhSPirxYuq15fBPT3iRcyhznKgOMuZQWidOYutsG0zx5yas2fn9EduFhRGTjvTUEkwUMuZ1e9UZonLUQmWk+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622182; c=relaxed/simple;
	bh=sFmvWoG8UWI82YJ/HyVQD4m849oUTB2wyhnSXUCWp+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mn2MqtuOrIGvro2NmRJqDDGPYJuqNb290L+gDT3O7QPm0pmqFWMl4mqnWpJtunQOhn8RbV20FjrgJo+HJyhlKCqA4D9EDtFJut/4gueRJAKpMaCj2FezCOVRiArpn3QgRD0at2Viy7yZOkAx68xc1C5YJ0VfpHZ7938uOHINMMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SQGEdxb5; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SQGEdxb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDd16J2m784gQKYYgA+nG9YDZdkQ98vRkmubi0T1XCKBYGIzpCZc1ggrR/9XOMPofLesq9W4nEZoCBqs+aJr6CvS2ukulTu2davJzpn6L5Yu25KX4IzxZblJnG9kHGb1TNZjzNZ8lc5zY6C8ka725sXeXjGUIDmzsxuMkmhYyssDM2h6DChlefDJUzByVSK1X3RZv7TK4RC5/nhM8rxxe6owoq8Zx7+aHTj98DxyTvRnp4tQzwsU+b45Hxa/UBz7ro3qBrCl4XTTUu3HLlZ2iNr97LSUCJYlAyRBODRyWS7hyiN7NL9aWfU5k4rwafzLGMSkyeielF8XuQu5XZgBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb/Fp+uRMUu3LWYISpfCe6+ZoJXs2ED2L45GhzmoFkw=;
 b=VrU1OvYf+bP4HfW+jNWX8IBpVTs1vjY8z/8imJ41up0q1fWg00er3WlRDUZPvd/UF7o3WnABSraSrGm2TKG5JX+zz/4VapwavsB7Mb3sBslbPJOws1gaw8n1XcMxfBt1qTsZ+urX96OkcZLSfQrr+NPtkO9C6MMyQH+GF+2TXtUWGl/D0Np/hfuUNyXU9Stccp3dPtuAJ+zmrLvng7GowKT5/RkVOMTMOsbDCamA8/Oweu9iOKN+uPPCYFFo4G25oN7FF61Uo80RYIVRx+h/2lQFHKsoHdgqozld2CNSFA84Vsj5dbJSIGfD2cCB6fakkc/beyLNBGV9VbTCSo4yng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb/Fp+uRMUu3LWYISpfCe6+ZoJXs2ED2L45GhzmoFkw=;
 b=SQGEdxb5wOZl/U+JqwQKWscf1bT9tq61mJQEi0Ie3MTlxjisoIbufdMEZIESVMssuB9x87R+Bo7FdfirXKMa3Kzs3ByvG8I0/zq8sRyD+6/Dqm6pmVXtmBCyL1/c+6urEtiM82x/gE7ZBs34qpREKNsP3FRQIeSENROwwmJRFMIp/3yZJykw2seoCZyTLjyL5KgDNZ0UYjOixTpLf8C7zbKytc1D+g8tFTC0W5xwAKrgSBE+cCvmqOuWpetw8X9RzWX5LXv9n29FH53vQAPZG2lzS/X/8ZaN8FJOY5yvJyp5e9obO0g0/2CNDJ6Wnom9XLfOFdJi/b9+MxuO/qbM8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 16:22:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Fri, 30 May 2025 12:22:27 -0400
Message-ID: <20250530162227.715551-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0649.namprd03.prod.outlook.com
 (2603:10b6:408:13b::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: eea8a2c8-ea08-4ffd-f0e2-08dd9f963ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QXIOsZ6AE/Zqw+XGItAxgmCkDxDFsCkfuB1tOrj7kW9QqxHZJ86EA/bja9fH?=
 =?us-ascii?Q?/sZWGLY9wAB7TnWy9kE7JZeFGeva9WyuG90D8Vsv2hOej8phKrYESC9PFS7q?=
 =?us-ascii?Q?WeRF7gCAHWUAirSVthyZEBkcC/wWhp10Fpdfco9my/Hlz0Raybfqexwc4Wtq?=
 =?us-ascii?Q?EOmUjyjjf5KXqoT8KBuFcSCGY685Rfsh5XS0Kcwzc//cW+KaLj2mLtTlnkxY?=
 =?us-ascii?Q?GDPZctINoCule3wqVZommZpAaOljc8af8mtcJhuQgIiQSxZqN+VjUn64Ng10?=
 =?us-ascii?Q?58LofmSeSv7+uiZbgyCEsRh03+VCA1rC33cHE2/vN1xnjsv9p4Vqrj5NeuXB?=
 =?us-ascii?Q?QHrHkabX+APM1duG0BkeVabtwy17VdfFLhCOYo5iUGWpGf9XBsvNpq5nYoff?=
 =?us-ascii?Q?CFiW/jDT3eGLLqmuTRCDdYTh+TbirSdazGTpI2tM0OMqcPB4brlpBQ/oFZpt?=
 =?us-ascii?Q?KlwtMHJ1b7w7SkVUVcT8fYnLVAurRcl2Dcs/W6BI2yA9b7XcZPntlvnu0yS0?=
 =?us-ascii?Q?uZ0SxM3wktAR8DuZopytcsL9NEeV5fxU4IucJqiSRRYxhKhjS+iEu02Gg6Ue?=
 =?us-ascii?Q?Mgqzh5isS/lpDWjuJDssS5tkSVgTTXRYXth7cPEVybk2cYlyg0XanLtWDbt0?=
 =?us-ascii?Q?MV+agk4dqdqlxz8FvDYMBS87dPT84cMREe12zMOU9ThKIjKZ+U5TJtldbkQ5?=
 =?us-ascii?Q?ECtX+Js4z3g02PX4VPW1qPHX/8RyyuKgGf/GUzu3FlAZPbj6+I49yoOIRuT7?=
 =?us-ascii?Q?icc3BvPp43TzI6wPFYO82K0t0U3YrOU4oMgyjUkqmSYR2lwNPd00//oTst7T?=
 =?us-ascii?Q?EwndOW3PSVz09dkp7OLSf+grihVsdTRQOrumJkSweU54P6UtufrQ3JupjHi5?=
 =?us-ascii?Q?emV/RFm0Noh0l9urm+nKdVAwMNYzoTgpwM9wgATGWY9/CJzFdLtFK1/KlVRz?=
 =?us-ascii?Q?PdrUaHR5gHSYxWKw+V0nZYmr+0GLv6tLORscfFP38xm8fhKR4vIGVeKO3L8J?=
 =?us-ascii?Q?+rKM3uXy+iec7Y/cHqWWNQD2gUtmUqTimILLrLuTxpH9DicBnoEqgF1xjTAe?=
 =?us-ascii?Q?vvTBKp54Rx3j+3sDqpHmh4eQkY22g0iSsKoktxNJnx5tytGMJIhCpcVdlOKc?=
 =?us-ascii?Q?lYV6JoQNHJgw0s/wrRNM6NpHMK1dGr1Lo15ActcLjRFSNTRgjpjNeJgO0lXP?=
 =?us-ascii?Q?wVAq1/fAwClcXM7wYCKi+WXq4iwn3AsifGeLFDiayzUB/UVFkBj2NmAObDvm?=
 =?us-ascii?Q?8UXyckafYlGnAhUPPLn67SixTGpX6pV5oDaHMOW+dPs0ikTWsgMOSanK2/ip?=
 =?us-ascii?Q?X7yZ9YwRCSJwJCLsSISlTAmid9XEcgPgdTTkykReXYLwNXFLT53703tU7fF5?=
 =?us-ascii?Q?fzkqQ9PvJqMQOVltnQGfWN00xiigsPS+Ff/0tFNNmUXsiZ1oV5D4s7Qwccen?=
 =?us-ascii?Q?lG8L/xLhcIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4VfCvKWpcCzq7IFJVfXPiIqZ2gI4Z9f+MT2qAJCnx5gh3XiHViItRDV1cGjl?=
 =?us-ascii?Q?0Koxag2o4Mu0ky4SnXiV5vVEutwLgURCsdzKHp3TsObvcQvxpBWaQ3k7O0GV?=
 =?us-ascii?Q?23svcUH4xmj3+q1dNqiZ/5EfnUTEsnMSh1n02bUfpGMvCadMP55BQNiBI3aU?=
 =?us-ascii?Q?kF29EbnuCNBY/MR8u2ChTrHIbNgS1vb/6ABCgOkP3GpwD70xE3Pz99ZFEsGh?=
 =?us-ascii?Q?1eDhSIZTlFAaqVVEUVeXcWzSkrbMqSRVEQAZfTkH2i5FYZsee3dViKhi44y+?=
 =?us-ascii?Q?2tNSfRcjjyT3HngKVXqF0yN5Ene356T4ZTah/asE59s8xmxxaZkdB5lAlsRN?=
 =?us-ascii?Q?NMqsoMfUv6k7NhiaiDtShCww4GcsMbildSfphVzj6KY/iOkLUep1yjPgkcGj?=
 =?us-ascii?Q?jSA2VgePbnQe9JA7OLjOMLcq8cGBhRG1Dm1wDNwXVk3AyOCqyLa5EPlKnBy5?=
 =?us-ascii?Q?nyEBp+eXVLOgFZvwcD6Y9IE7XGG0YU0aGLMjyfV285dfcCbtXT0sksIklmN5?=
 =?us-ascii?Q?Bddqi6KGljzirjuIEcwHZ0AI/tGE1uyUh3iX8xpdPD9lAVT6oev3cuTfKXRn?=
 =?us-ascii?Q?KnIhvSp1ijsDrOHY20/aTFXZ3H+nPJQoXyJX/E6h2BK8vwyC9qdv6zPAyiZk?=
 =?us-ascii?Q?LGUVPY4Tepu+hK8U66qmm+blWYQ989nKeBCx5XqCZEUtilBpBaQydtTJsqiJ?=
 =?us-ascii?Q?8U/ybGK7ZVOZIGB6g3uOytPLGpsZ0rmp0yuAuhuL4LrzSXzymyGZPOXEGzOz?=
 =?us-ascii?Q?O6yeZYZ+VPRr0vQG9skndlGHRB/reZnXpxt80NFm0s0x3AVHRIMfQt1+GnfF?=
 =?us-ascii?Q?VekKAfHpHk3C9eiWkk7cBvoIht7LtxOMQCgVBMObypcPfkxHGPIHm8xwXFMY?=
 =?us-ascii?Q?lzOn6mP+1qUZ3ttVIV8DW2oXD7JzLIPgzbzC7ZEcfd2/lRVSRMmyB3MmETQP?=
 =?us-ascii?Q?fPz2jq4XU/U8zhTHK7xmsacyykuDg3H4Z/kyBNgYPjt3JhcPfDrbStd99+mJ?=
 =?us-ascii?Q?HOY740MGQTMRepgfOOlLCh5mIg1ITyL1nRTJZbmd3tntp7lRKv1n8y8wr9xs?=
 =?us-ascii?Q?p9nr81WUIUSKmjntcNS1d7/EAIeUQ5syBo+ePmAsxDLgu0KmweNmw+R+4s7p?=
 =?us-ascii?Q?+J1oS/Kuj7aJql6DBx707MSKxMAwdnbHocNu6C+FZoHlMJ6JNlh+iGv6DXoN?=
 =?us-ascii?Q?anDmTJ5NUXQyibCGSekKoJvxOZa7ZNxebQJKfI8Ksutk5Zoe7UmXcdI9pLMy?=
 =?us-ascii?Q?Jaa0VTn+qDrN+oNQd/eFXarjWn0IIK4EgDnwqNCLJmaqUwBjwhdNlM7xpHzt?=
 =?us-ascii?Q?e1iqJ5Kbbjb3czUrxOSTnjkqzqRim6ZBPNj0UAd7y/XQszwveA6+NlLFx6A4?=
 =?us-ascii?Q?Z+C/a3k+OmJK019PehGvW5y9ifpz04i01AWzGI0AXQui9TqT9d8t7subifOa?=
 =?us-ascii?Q?Vuesgf827pELqQy0hQ+kbqbEXHzzAkhKZPN/dMk7KeeRQ6vp8qaUJrWZ4xIp?=
 =?us-ascii?Q?HYZ4griR7fukzHvs//XrrJGSor8QXuFsaJgHdhxy0In49xzAMeW76RY/vIfU?=
 =?us-ascii?Q?bZ7b4ct0fp+FbPd3HL3PjgHC0iJ788D9o/qbQ/RY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea8a2c8-ea08-4ffd-f0e2-08dd9f963ba6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:55.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1LCcF+GHO/46pB1yTSsy3/ii2MDy9SHOydL0MFwSh8s9AJqtJkLCmS3g4Bpoa5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding CMA_ALLOCATION to provide the information. At the
same time change isolation flags to enum pb_isolate_mode
(PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports
isolation failures.

alloc_contig_range() no longer needs migratetype. Replace it with
enum acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c    |  2 +-
 include/linux/gfp.h            |  9 ++++-
 include/linux/page-isolation.h | 20 ++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  6 +--
 mm/page_alloc.c                | 27 ++++++-------
 mm/page_isolation.c            | 70 +++++++++++++++-------------------
 8 files changed, 82 insertions(+), 68 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..6bce70b139b2 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
 					GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..51990d571e3e 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+
+enum acr_flags_t {
+	ACR_CMA,	// CMA allocation
+	ACR_OTHER,	// other allocation
+};
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+				     enum acr_flags_t alloc_flags,
+				     gfp_t gfp_mask);
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
index f74925a6cf69..7c4e2e703a23 100644
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
+		 enum acr_flags_t alloc_flags),
 
-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, migratetype),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),
 
 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -321,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(int, migratetype)
+		__field(enum acr_flags_t, alloc_flags)
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
index 397567883a10..9ee8fad797bc 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index ab66acd3e6b3..19cad4460cee 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2009,8 +2009,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       PB_ISOLATE_MODE_MEM_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
@@ -2069,7 +2068,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			goto failed_removal_isolated;
 		}
 
-		ret = test_pages_isolated(start_pfn, end_pfn, MEMORY_OFFLINE);
+		ret = test_pages_isolated(start_pfn, end_pfn,
+					  PB_ISOLATE_MODE_MEM_OFFLINE);
 
 	} while (ret);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a248faf30ee0..c28e5c2105e5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6697,11 +6697,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
 /*
  * [start, end) must belong to a single zone.
- * @migratetype: using migratetype to filter the type of migration in
+ * @alloc_flags: using acr_flags_t to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-		unsigned long start, unsigned long end, int migratetype)
+					unsigned long start, unsigned long end,
+					enum acr_flags_t alloc_flags)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6773,7 +6774,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6844,10 +6845,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
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
@@ -6864,7 +6862,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			      enum acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6879,6 +6877,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
+	enum pb_isolate_mode mode = (alloc_flags == ACR_CMA) ?
+					    PB_ISOLATE_MODE_CMA_ALLOC :
+					    PB_ISOLATE_MODE_OTHER;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6905,7 +6906,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;
 
@@ -6921,7 +6922,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6955,7 +6956,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6998,8 +6999,8 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_OTHER,
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

