Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96FF280308
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081296; cv=fail; b=mRvsWC6iyRwiVEjjVdETyw4lJEZsCj39iAlwt+jwTsc3gcwPue3eKzVHxPYoXCskhfUuCqK2zx5Dau24n3pF156V362KTly+Sv5s/vs0wUU49AK6SqyDupO7aNJo1bgnwvcxqfWLv5jjJb2zLKY4otERvoYgo89Gi2soAPcUKL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081296; c=relaxed/simple;
	bh=Bt3HJyOGTYl0ZTU0QznJdstMl+UAqRdz5s6YjJPEP7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+X8zYxBEanEprE/qYpNn7vLEjgjVNgEPYbWP7ohQzjtsTqV1p0Gu0RQ5mPOpOywGsxbdXEdS0CAVduZpG+brI8Mx3tfGi753x9ix2MyCCmSOjAuB9HESAB8onuj8CKV+m4cN1Km4cpktEMWFzsa6MYSGGwYyOaaAjZZKvfSxyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GlIMHcFu; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GlIMHcFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e69pim68Be+DpRkw9IPxs+ZBMPDqt8fkxIu8wHeSzvVoIwD18WHHL7r6ToyAHLsculIjAyBvG+23ZN/6IfPIh+oaKhqWLLJ5hEPqbWv2OPDnlfil2i7VpIvC8wZpqvFBQevLEXrq+XLC8hCSKcUHh87XLPTu7H0OZfUDjlKlcU4OzQrnC2dDCwE9wgJ6ui7hd3Bkw4ZARexpkQ51LzVrU3zpfXdU2PTr+IqaaZ07jEwikfDhAya3U0mQm9Bk7Fd4JVIJnZD9ql7E6F5RoYwkokL7QxL2OUa8FxHaZmmLhHBLhX6vyeLj21Y5m6+3qGBiz/4EnR5xy4mNidME4FBVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3mRDONsPzMAFm4HU0KG9nvAO3KOHoNDJdu04HTTc+w=;
 b=xKXueX640sGRyeW8Ta2lqRIAjSXnLC15mvgsdd4ao626D//v5RknUkbdwMTjk7creT9xG5DxP/2h0ZM3ZCAK+sJTw8gfSK5iSPOHrwvulNEzrZF2dDK5Tkl4zKn8L5t38D0Q15hD8P27rXckEPLS//UqcDFOt5f51rOlgu3Wj02F68DmgBbIOb1xQzfIeim1Vr5TK2LIuD1wiNKJw2W6fwRGEOKxAbTMGJDDv5GItAMBjDts1h3a+i+RinjBWFaH/t40wyI4YhKZQT/AimjKHg0Gg7AO2PL0LU3+U88lyG1TFf7ibe1m3WHcCfTli69o7uL/MxelLvL5g6robowJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3mRDONsPzMAFm4HU0KG9nvAO3KOHoNDJdu04HTTc+w=;
 b=GlIMHcFuXS92a25bK8eYICie/GFamP6p5Xk9jXeTEclAFMXYGVu8s4bvzvnm8argts5w6gCLAkZg0pnrhLHEAu1K+R/ZM7MI8QF9L3oQRWW7DyH3gZQYTl9AUMCgseykKbx0YEF/yUNN5Aji7YZrGD1OytC4t4OfGOUt5zfw9OE=
Received: from DS7PR06CA0037.namprd06.prod.outlook.com (2603:10b6:8:54::12) by
 CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 13:41:29 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::8) by DS7PR06CA0037.outlook.office365.com
 (2603:10b6:8:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 13:41:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:41:29 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:41:23 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<xuezhengchu@huawei.com>, <yiannis@zptcorp.com>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <bharata@amd.com>
Subject: [RFC PATCH v1 4/4] mm: sched: Batch-migrate misplaced pages
Date: Mon, 16 Jun 2025 19:09:31 +0530
Message-ID: <20250616133931.206626-5-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616133931.206626-1-bharata@amd.com>
References: <20250616133931.206626-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 78af2e06-514f-43ed-b895-08ddacdb7fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qpchGhN6M/I4N0YfeTBpFyHY6svamUmMd9PDg1Vexes47YDLUG8NqNpCu5et?=
 =?us-ascii?Q?Hkk0JalVD869aTndUOcZMHKsjKEo3p1J7nahn9NwD2a/BIPRMyYWgeG8wvAP?=
 =?us-ascii?Q?jEZeMpEy1tCcT0eWINZNWdiHmjlF9kOE9tQP6/DNviSLfIHVhx5GY7Dmh5B3?=
 =?us-ascii?Q?J8gNs6tVzYxo1NLPAFSqIHmEydPb+du5+X9JlGBM71qbIhJoYGWjlD7HnQsi?=
 =?us-ascii?Q?gk1csZudZkVXgY49fQZ4TUYnv8rC/9aWydNiPKGdy6+JUUp7eAD0zUkZUFHV?=
 =?us-ascii?Q?Nkxjx54Dc5bai+Ro3zcD5/VWD5T+HPa8L6r5/EeTvOLEW/AYuVmJf8WhqkDU?=
 =?us-ascii?Q?nL9YqFjAiUHr1Y6WwRyIkNqhniHJuJD+tRqcTrTWwh2dGgZFVDY59snrzQbo?=
 =?us-ascii?Q?QQrQ0NHgAyjd9gU6Th8D85r0YU+VYGQxfbKXsUyHvEGiBbtFhnc8B/NsrSj2?=
 =?us-ascii?Q?ViZ3BJRrrrwGDI89+j0N/X8QhLOpvoYtQZhKucW5ugS4fBAMl1AkjNLrmu6B?=
 =?us-ascii?Q?4y4lilr1sastLXJaVhRVRyx7qZcKhxTCCvhuPy7Ykxyc3xLZMvdAlxFN+lj4?=
 =?us-ascii?Q?V3bm4p0JQRgiuRNLPv0KXJKiqAEIg/v9BDu2/p5wA5ROm+dKrOD47BhebNCR?=
 =?us-ascii?Q?F/FHHAz/kjT3wWGj8lWZ97Xftu59l4mTZo9xflsrNWiwSiOqAfRVglV+qLzF?=
 =?us-ascii?Q?I5JIsZXbK1RZH8eFO3i4l8CgWCfdRbRlz7cEJDAiHeKbwkeJkLLtkoNvuYg7?=
 =?us-ascii?Q?XKce4mQUfE3mImTihi5gG98W2XtMggkrGXBBovueF+4EZvj3qYt2Tb2PqSIQ?=
 =?us-ascii?Q?XnE02kVkBBzv83lYe3X0PaeVrpZrKV8txN+OL9HAINEViYM0RHjYuNrpjwlQ?=
 =?us-ascii?Q?Nl7zlCPQPyhchUUCJLxSUApomUV5j0wYLuR6ygvkJQaWT9NpBFsbNmwks100?=
 =?us-ascii?Q?+jky9JODoJOcmRQ3le0U9xd9K9g2ujrY4U7pTYr29fVXdBPpp2SWKkcJ+FV2?=
 =?us-ascii?Q?t8Z+kNqv8D7WxpdY4kWX859TvlnIvQZU+Ls1jhG2Qz6548ypWfVppLFv+sbN?=
 =?us-ascii?Q?Gap/LLtZ+40rmFuOtmYtt8xid6lRMfdvgvai20aXcOsSOYmiJLYUecioXFft?=
 =?us-ascii?Q?ZkBvqgIXbf7guIUm5kBiXO54LwcU1xDsM36xcv3wI7Oh30JZeylsF2U47iNM?=
 =?us-ascii?Q?LlApYA9fNKjxpKZPMRiqvZD4iAN1NJHi818xU4RUkrotXMhoiEIRcDvmZC27?=
 =?us-ascii?Q?YiUiutYYYOSk35YbcL25GYl/P6wYE5UriAT+a0yPqIilWjwQUO4AHWF3oa6W?=
 =?us-ascii?Q?Mfjzwxv4kNHhuzs/RDF2G/pQkCiuI+Z6IWZQH2LNImucBE+O4SmBkzK4fpkQ?=
 =?us-ascii?Q?Y/3EUwQ8uNeZ5duqq1SqlXhXL634/lo9a8o/V/SaplAyVOTMihjzWyCF17l0?=
 =?us-ascii?Q?j7ExTOL6NVWJpikX9ndIZ/MhHAb1IdkWSpUJE2cGIpYbuk/1rueFKn+mMSa4?=
 =?us-ascii?Q?e9i2JsAvbPohYwmB4Eiglh+ZV/BAnsKiuHko?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:41:29.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78af2e06-514f-43ed-b895-08ddacdb7fa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251

Currently the folios identified as misplaced by the NUMA
balancing sub-system are migrated one by one from the NUMA
hint fault handler as and when they are identified as
misplaced.

Instead of such singe folio migrations, batch them and
migrate them at once. This is achieved by passing on the
information about misplaced folio to kmigrated which will
batch and migrate the folios.

The failed migration count isn't fed back to the scan period
update heuristics currently.

Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 mm/memory.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..b27054f6b4d5 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5903,32 +5903,10 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 					writable, &last_cpupid);
 	if (target_nid == NUMA_NO_NODE)
 		goto out_map;
-	if (migrate_misplaced_folio_prepare(folio, vma, target_nid)) {
-		flags |= TNF_MIGRATE_FAIL;
-		goto out_map;
-	}
-	/* The folio is isolated and isolation code holds a folio reference. */
-	pte_unmap_unlock(vmf->pte, vmf->ptl);
+
 	writable = false;
 	ignore_writable = true;
-
-	/* Migrate to the requested node */
-	if (!migrate_misplaced_folio(folio, target_nid)) {
-		nid = target_nid;
-		flags |= TNF_MIGRATED;
-		task_numa_fault(last_cpupid, nid, nr_pages, flags);
-		return 0;
-	}
-
-	flags |= TNF_MIGRATE_FAIL;
-	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
-				       vmf->address, &vmf->ptl);
-	if (unlikely(!vmf->pte))
-		return 0;
-	if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return 0;
-	}
+	nid = target_nid;
 out_map:
 	/*
 	 * Make it present again, depending on how arch implements
@@ -5942,8 +5920,10 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 					    writable);
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
 
-	if (nid != NUMA_NO_NODE)
+	if (nid != NUMA_NO_NODE) {
+		kmigrated_add_pfn(folio_pfn(folio), nid);
 		task_numa_fault(last_cpupid, nid, nr_pages, flags);
+	}
 	return 0;
 }
 
-- 
2.34.1

