Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A51182D2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965747; cv=fail; b=RmXG+sAYRqOpWiJxlQJOV3Ua6pe8X1oiXVXWfGhqo4L5zEGGIZjLWaEankj0jerRuyQrOoxSY8m3EodPj9Ehl0pHnRJG8erymDSYoJXULdRE/PZNQXecmCUAOfJ+g6s1ODZE/8KpHClP1/acHe6fwUbCe77zQJp2Z/Ob+8JdQz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965747; c=relaxed/simple;
	bh=9bwNwZb3JOf9uIvwirfd2j3iJz8HTxibshEWjzsU5O4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ItbDdzeiXxyaQsTtxs88PtdRz7krPqyIjFj10xqCCHEC6t1wx4k2vkgypgNCYH+i5wrBlHjsOZaxjQS3czG8kauwaZLM6TNROmdZWWJTijb7EE8szVUmJ2LUsjbWLVawCOqJEQx08j7AV1g0KkjqDp1vlgOvOtuD1ExG7YuF1Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tKKS8MDC; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tKKS8MDC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5VHxVfKEXiVxLumn0eawC5xvTDOVaBNC9k5iyK63ekA3avIRVu2NhsXeCD4wlEFQvFJaXDQyMSIh+meiQoO8TABdVXVrodb1kG/UnZO+zYJTPkKXq3ZYT5R6//uiWztj4tYcbjPoXvgufymDqSenqJed+dl5us4JFsTnSRNxqkduL0eEJ+ntV0b/R5XFNdVaVMTRsz2tLPvyIs3pywe5jeflm1sOi1jx2ucdkPlARBKhOfShjU+riwbnddoBr8vxlA3GiRTVrV0KL5NnmOppanfQLkN0NXVQcQ0FH2g8eu5vO5Peq+ozNKqePpOJb0C1e3g1Coa6jySBUDxDa00Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9pIdRbTc1tnd/L4heX/EwZLAr0Sj9yO+2R71U8lWqM=;
 b=vTIHx3Wi1G7EPO6X3zG8L3A8IyT6XZllSR026/r7iMJ0YwoJxj1/132mGP6IqQ8XayzUE88yio0ZFs31Uj1O3d8mC/pqeEGOQGggoRSODCFRogmMNyYqMKfp5iz93ch/o70b0RDB76QP9R5wVjUX3Vu5WWhX0FqanuCYJ368SiA41idGSeC1dBi1tBdZW1lMVFCRzRVs/Lxbnc9bXbr4DBncONa8cHIcSwARbHIvnVhbDajDbgH2TqjRdbt3Occ34CptgkeTR367UWBG3rnkRVlFfv/L403w/5JH1MYDuTz/ChOQgvkBHLmUUc+AlH3hY4m8altVi5Ep6MM1rcYJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9pIdRbTc1tnd/L4heX/EwZLAr0Sj9yO+2R71U8lWqM=;
 b=tKKS8MDC90xrxSXa6yph8QBKZ8BdxHO8Z8VfwXZrfCJVpj9jdq0fR0qgzWn2tFgMRZyJRG4oE1uxx4XdNgWImuE0FrVdrYmHl3TxbgvLwjHk6rUDLCadnf9lwejjAsJKgk8ei7ExtYkR5PgHqxgaPhPTeR2ELyjma8DNe1igu0/JSURMdtI4td1lfzCs2ZWpXuKDhRccYIlrvwssjeaKC2enx931pRIwPGSurTkxT61QglGfPwz7lNbHHpRJfszpJkGE9U8ak4RVfJ3nEzXFqykv/i5NhLTvX9XVAbT6g3R9xBlkWAP5K/wxO56+gz4lJoYSc+ZGcOCjw49djGwmLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 15:49:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 15:49:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: david@redhat.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	isaacmanjarres@google.com,
	jyescas@google.com,
	kaleshsingh@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	masahiroy@kernel.org,
	mhocko@suse.com,
	minchan@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	tjmercier@google.com,
	vbabka@suse.cz,
	ziy@nvidia.com
Subject: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_ORDER_CEIL.
Date: Tue,  3 Jun 2025 11:48:43 -0400
Message-ID: <20250603154843.1565239-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0706.namprd03.prod.outlook.com
 (2603:10b6:408:ef::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: ae604407-8ba0-4a84-6497-08dda2b62952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CjG/0Z9SfUpsbJqdswclBPk1jni6LPTaMU4QAncM3G1JaCZjqovFy2jlTy0V?=
 =?us-ascii?Q?PJMzaiGTUTVxOD8mWMm1WZKOyU9zKbgeM+kjHqTVgWMr2CUWqXkGC2sxPyrL?=
 =?us-ascii?Q?2OaYJDhXachoX+S7ynZyxGUqRPEzbD+Vbb194sYrb+IVhFUsxAmaqRKSH4am?=
 =?us-ascii?Q?1/m+ddAumdgw4B0j0u7NN+Z8Aq/jWEItcF8gUA1JqT+2H0XppBQXOvr/D+Sc?=
 =?us-ascii?Q?ZyWLHwt1x8Hj6LEGGAnFvxOtn8v2gUMlL5Kxhs/GwFojpR3s9ptEBqc6nPzg?=
 =?us-ascii?Q?oo8a8m74R5LyFhziTIoE3YNP5VY7Lx1rsBX0BrybeS+8Bzt46wtYA5IgV6QU?=
 =?us-ascii?Q?+BpqfvW8uC4l9jQDEGiHY1zG0Oj0YzQLfWf+iOY03CzksFWj3wL9a2n2EEvt?=
 =?us-ascii?Q?LzZWG2p926Hvk3/Ydqx0dxnyAqpcs4oqgTLIuesY7J9cIdT0kwV5dHuGjAuN?=
 =?us-ascii?Q?zvVPjVKJtjrSBfa72xmjPxOJvWJ9HLBKJOK8PsSDZ0KcOcEPXo3jBVqAScLj?=
 =?us-ascii?Q?u91MBmFPe3Rf/y+vrHJo+Pj+BPkLjZJ4n6zAuVnCxGdIksOLxngt/LV4daYV?=
 =?us-ascii?Q?l+eZBf3RLAHWd99KfwAbomFVjFrhmJsmxMuZ7ilJBKqGluY9AxPEFy46jRGt?=
 =?us-ascii?Q?RWIR2hdaZUOj6LIszUeAi989/d9Lt8+hflvoIQwBQA6WtRMkerhOtWm60Gja?=
 =?us-ascii?Q?eLuBsSl83fg4QyUR5zIAlb0NOVN3kUjIegLk9qBJrCRH+lz+2aIykki5KNwx?=
 =?us-ascii?Q?yB7BJhTvkUnG6Wp61t28enLLY9clYvAbE5AAw4mzs0Nk53VWjLISDRkxbjHp?=
 =?us-ascii?Q?Oh24xWVAz1UIGO0AizuF03cSBdR5gsSu+kMgKCXfGNhj3Ze4emIgkzhU693y?=
 =?us-ascii?Q?aZA7Yw1lBhuJwPGe6O+JMaVDznxxGbuFoENPJSxLbWYw6Zxm9kf6uyRiABs9?=
 =?us-ascii?Q?phgBaYv+Y0PdjqeaYmZeApY7Y2zxdJX+8RfRSHZtE2kwNDWV6ALfOR27Tkdg?=
 =?us-ascii?Q?diBD9kgUV3UmBFlH5dhPS/Nk2Po8P00A43kqSkBMYq6acjAyCHdFC7Y5kjGW?=
 =?us-ascii?Q?LATRtnyirmHvnI61vOuEjEvPr8oAzV9v8MacRDxPaQpJuO790tDb81TEoWqt?=
 =?us-ascii?Q?3qP9919N78/V5+gjXJ6bAWa4ltA3fojpOrbyFhSAsHYpQqHwjw9oieMAhSE8?=
 =?us-ascii?Q?MIxZ5zV4pPxDcYS1ChxNr/IMWw8qUJtHT1Kv2SaIwoEn/JkdCGEh2GFxRF97?=
 =?us-ascii?Q?7I8LiVuQge9Qy5W4swDpyqxnhaD1RwOPvlIzt6DZ7Pm8tWa3mWEGRcoaT0Wp?=
 =?us-ascii?Q?vEP6p7AN5FmMgNvH1NZGueDX4DTP6WMjp01DccMv8jLCfTE3jfNq2tlpdvwc?=
 =?us-ascii?Q?K0UZde7UtDrfYNQS47BKaRrcDgT44+YiA6nWkyivshUkSwvkVeRiqFpbcIgi?=
 =?us-ascii?Q?fXOeIlRvCCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4NOwpQVS5Q150moxEz3hAEro5lFfROwz0hTOdnNX4JS5JHMiUEWJ1S8woRnW?=
 =?us-ascii?Q?o0xqNTU85qSpsvfAPLpU1XaSPUQnmIZuQ+5HaBZFqvaKJO1p3Pz6d5BDdIeb?=
 =?us-ascii?Q?Wl7+WLQ0fglpRcmyM5MwpVq2PMFLYnZaWBX4M/0Y782W+jxjmS8mkTrwyMqZ?=
 =?us-ascii?Q?gCIYp1FgpIO4IW+5BL90Dv3OvVq21Ih595kcmEcD9sSVd4isQwDaw5LLEIqX?=
 =?us-ascii?Q?rksWIBf/VtbYw1xHURfdFA00KunSekFDYjyPmxf202uoNTSMKnMQchbz1o7y?=
 =?us-ascii?Q?5yP5P1pYAE7qCCFNjYmaj8OlGj3S6qYARfMtu5axcDidtcyX/1ulXUZpBVYP?=
 =?us-ascii?Q?yjDvlGdsmuH5GLQhvpGmtnEWzqoK4dVSKxY2b91fmakpgYZm+xFs+66IEULe?=
 =?us-ascii?Q?dtBFxw4bGT70up4djXltcGGss9KwUeJ9clWKtXETPIvl4lIuQ1cMxL7dh4Hw?=
 =?us-ascii?Q?0/H73BfPUiucuTAtZD0qzr7gq+9ucoRsbAETlLLbxt9vncODN7uEf34cOArh?=
 =?us-ascii?Q?979WQy3si2CavznVKM+qNdfepLwh9Sp0vXd5lfFyb+1FGUVSOeedxB6GkJ/W?=
 =?us-ascii?Q?vqQhb8l5S8uP+vxacrmsOmftWoM79olvWj6FQ6VhEsWkCIwKuWt/iy7V0bXc?=
 =?us-ascii?Q?S0QahguCYdleoJ4JKC8C9f7eSBvKpmYvNCUxZ0W05kdDsjvvTZNroUv8rzNC?=
 =?us-ascii?Q?cIGNZyJlKQfbOg+2NKU/3QnLvRSvW5AivBEny8/+zE63E2LQydC76kwDJNJL?=
 =?us-ascii?Q?uodLiyBaESEBewupY3kqkHU0szPsJlYPDjH8B512C4O8aZnmkp2+brJ49RRI?=
 =?us-ascii?Q?bveDIDSSyKXi3RGxEBPntRBne0Laq3k3INCRxQYHcCWPLoYPH/dAwsW3lTjz?=
 =?us-ascii?Q?1+o9APjoRKWQBV2Wt804EpZThAsxY43BXUcP7ySOV3rBMoI6qtzNhG8DRpYz?=
 =?us-ascii?Q?VuZ48Pg0uZrQObQREmSWx68lFmsGE0wbwnc9TaywN5c4onOENRxsH3Suyoo6?=
 =?us-ascii?Q?n3zZNdp3AOcS8vvkSClPLpy4XA4kRVeTCYQ9gO89juhO1HnSeQLAkMNtbMY/?=
 =?us-ascii?Q?556yEBLBV4RhsAkD+uO9h7yFwB7Iex1HYv4MmHy3z5Fabx5wpVLCRqy+mIxX?=
 =?us-ascii?Q?tDTGrOAXs4AurKbufKYHa7sbCApNzcvGDTISDPKVMLJZNEQmFPCb8ZRgsi5g?=
 =?us-ascii?Q?eVHeA2zXn7VerfkoVnNl+Ut2RKGs9MxOwlsXNOhFz/1hEmFeiNuhPoFtV/Q4?=
 =?us-ascii?Q?FJt5gx1MiJsJ4HqLlEVSPIOLHOBGY446vvuxONXsRRv3PScpL5J7/T/C5cPl?=
 =?us-ascii?Q?BtKKFoBwZA3wXlusKY6N0UG+dDUvjOQOiymGawk7BEv4ABQ4RQ7nSXjK4/Xn?=
 =?us-ascii?Q?Tr1La1iBHJWy2Y1sBE2QOO0lKrPFuNC4zulOFnueEmLoHYWgQde1f6eXCbfY?=
 =?us-ascii?Q?YDfO1c6zWvKki9ZAuPHS0+gZ9Ihz0KWU2p3QPX7F+vgAq/bGTlw2hEnN1A9x?=
 =?us-ascii?Q?8ncQlw4niLZ8S/NlQLTqXVUNiIVR4UqPWOalaVjr8QuGOTalVT4SVz9OXh5M?=
 =?us-ascii?Q?NnP8E0FAnlQ058m2JXTH0fbZ9lanoYNR4PvnBoIa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae604407-8ba0-4a84-6497-08dda2b62952
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:49:01.9095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y464hKcdsDrvhidFv8epy69abWpmEmOwhXKF3zr4CPnVBYA1h3TnDc4RCr1MLnad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664

The config is in fact an additional upper limit of pageblock_order, so
rename it to avoid confusion.

Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h          | 14 +++++++-------
 include/linux/pageblock-flags.h |  8 ++++----
 mm/Kconfig                      | 15 ++++++++-------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..523b407e63e8 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -38,19 +38,19 @@
 #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
 
 /* Defines the order for the number of pages that have a migrate type. */
-#ifndef CONFIG_PAGE_BLOCK_ORDER
-#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#ifndef CONFIG_PAGE_BLOCK_ORDER_CEIL
+#define PAGE_BLOCK_ORDER_CEIL MAX_PAGE_ORDER
 #else
-#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
-#endif /* CONFIG_PAGE_BLOCK_ORDER */
+#define PAGE_BLOCK_ORDER_CEIL CONFIG_PAGE_BLOCK_ORDER_CEIL
+#endif /* CONFIG_PAGE_BLOCK_ORDER_CEIL */
 
 /*
  * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
- * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
+ * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER_CEIL,
  * which defines the order for the number of pages that can have a migrate type
  */
-#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
-#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
+#if (PAGE_BLOCK_ORDER_CEIL > MAX_PAGE_ORDER)
+#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER_CEIL
 #endif
 
 /*
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index e73a4292ef02..e7a86cd238c2 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
  * Huge pages are a constant size, but don't exceed the maximum allocation
  * granularity.
  */
-#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER_CEIL)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
 #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
 
-#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER_CEIL)
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
-#define pageblock_order		PAGE_BLOCK_ORDER
+/* If huge pages are not used, group by PAGE_BLOCK_ORDER_CEIL */
+#define pageblock_order		PAGE_BLOCK_ORDER_CEIL
 
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index eccb2e46ffcb..3b27e644bd1f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
 # the default page block order is MAX_PAGE_ORDER (10) as per
 # include/linux/mmzone.h.
 #
-config PAGE_BLOCK_ORDER
-	int "Page Block Order"
+config PAGE_BLOCK_ORDER_CEIL
+	int "Page Block Order Upper Limit"
 	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
 	default 10 if ARCH_FORCE_MAX_ORDER = 0
 	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
@@ -1026,12 +1026,13 @@ config PAGE_BLOCK_ORDER
 	help
 	  The page block order refers to the power of two number of pages that
 	  are physically contiguous and can have a migrate type associated to
-	  them. The maximum size of the page block order is limited by
-	  ARCH_FORCE_MAX_ORDER.
+	  them. The maximum size of the page block order is at least limited by
+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER.
 
-	  This config allows overriding the default page block order when the
-	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
-	  or MAX_PAGE_ORDER.
+	  This config adds a new upper limit of default page block
+	  order when the page block order is required to be smaller than
+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER or other limits
+	  (see include/linux/pageblock-flags.h for details).
 
 	  Reducing pageblock order can negatively impact THP generation
 	  success rate. If your workloads uses THP heavily, please use this
-- 
2.47.2

