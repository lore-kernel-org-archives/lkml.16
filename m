Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8723234987
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814625; cv=fail; b=okZodoMlF9RzbpnNefD0BlxmR1engpnV52lrScY7hr5Q6LxCcq+mJxwzU1r7dJkTzKi0HZj9ngYGFhWiHwms1sn1PGwzDxYIrbfparrPXkavFwrfMGzjB2ubA7hoT6l3aMbu2UbB986KNav1382W+XNPoVoP4+D2lXkNguV7Vrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814625; c=relaxed/simple;
	bh=YyHZT3d+hGf1ycysCuo2rFVHfvInsZOXL9cu01mtTKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIEaS/0Xr1maHzxCVNtNhTZlxFmhfXi1FsxKOkLG3T+o15AEW6MBVYNrTnmQ6FOcU1BK/g8e0BYJpia0dnEXd+Z9QTxGQGCCLi2gnVC9NCVyIMIl2GRbjHCwStKWfkxEEfir2nfSZ4YReVwomRLp6aByo2XnI0jLSp0aN9CZAiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=03tgen3r; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="03tgen3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AThd6koEcJjpmNAu3LO6JhyfwI+N1zSxfAiciSCFr1eoWbZgHorppFDAWF4tCOJHDWQeSGEa68eVJrz+zTXSB8InQCCcLMEOYMYzA6vTvBHCdKSYkmWvPH7RbXM2TPVjeX9JN+6QccfBNUVKY7FdqkR1J6GpojFT9n4Qg/uHwBgEgRQK0flVmhDgHE4bxIoHeKlmnOgH6Tt9SHDjB8ourGl31Hu/0iKtyeJnkU07w2QUw4/gkOQzFObnnjH+/KFWgAh9fDBV7IBJuMb3smiBYhkISEn5OtjsGZl0ni5Y8QvxYnDlej5GjgPPlwNuo+02msJn9Y/0tzfupRgYrn25Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VQ0ngAkiMVh1sIFmUYAtBMFFYeBOEQbdTCivu4Eodk=;
 b=qxfxy9A8MHHLiRraSxtEDQlLbZUJts7tAjiLlnvr90Qbn2oQ5RUxYqGq5Vsa00nLzrWiYGvFkDC2gNhfk5u6k0bDYxDLK4g9t7TM3i0gGtn18FQFnVgRsXX7ZGeC5BxtDxixmyU4rgkF1GOo4SR+O5dCZg/PHVre5j134aa5cMeHLDdDrQuFv4tdYTOAyuHqWy96bQzgt/de9MbgTxK6kYixZ1+rQNx+RnYtlZVyeH+mJRpXRcl8LgU5kskRVH7w6t/3exQzQ+7Y84whz5UjnFD3KbswLKUrhd2OJCuLiIRQee9K0svofbWeLXtFClhbqgapG7/SpU/3/cGp6kD8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VQ0ngAkiMVh1sIFmUYAtBMFFYeBOEQbdTCivu4Eodk=;
 b=03tgen3rzv30So5Ha4GnOXJX6uCmUXz9NoO+vif80FfMzxNUnW9BU9k5MFTQCUDUCPdjC4YoFH/ACm7SM8+2WwvuHgwph5CHAc+p9mvEANZ1GVFurERha495EZfpTS1Pmkov4DPwNmotfnZBAKWCyVSWPmqV+4P7GRlQTriAank=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 08:03:39 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::46) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 21 May 2025 08:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 08:03:39 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 03:03:32 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<joshua.hahnjy@gmail.com>, <xuezhengchu@huawei.com>, <yiannis@zptcorp.com>,
	<akpm@linux-foundation.org>, <david@redhat.com>, Bharata B Rao
	<bharata@amd.com>
Subject: [RFC PATCH v0 1/2] migrate: implement migrate_misplaced_folio_batch
Date: Wed, 21 May 2025 13:32:37 +0530
Message-ID: <20250521080238.209678-2-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521080238.209678-1-bharata@amd.com>
References: <20250521080238.209678-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 897d14db-da90-429f-39bb-08dd983dfedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EibvMinFQLLCvEPoS22goV8FFJ2f9dbLm8wUhBrmZDCKyyiE6BeXH/0tfgYh?=
 =?us-ascii?Q?by0A8eyMVCO5IIAy/q6Fc3sxHQ9rxMp9MHUcND+z/lxQubb0ATenLR/gOVHN?=
 =?us-ascii?Q?TNRqNfhERib1Zo5VJr+9MhR8TGIZl24NaLzXZYUdiPmvZU5QJYRG/vieK7bc?=
 =?us-ascii?Q?61XBOeTOKPPuc3wnuMv+W+cezMsLsaVhOZY5JhWjKsgHKtOPAV3XvAtfBvHJ?=
 =?us-ascii?Q?xPobAvcf/udv1QcwWcqrq12jHKpHgffM6joNDK7MB6pyPUuBT4C7F+GMN+vg?=
 =?us-ascii?Q?fD5Jwy4hSBOgFsuQJzLGJe9tshFheu87bg7F/6AcZOe0IGFColgBvG0N+2DU?=
 =?us-ascii?Q?LGmjigDcsndYjZ5otXPlNSNu1e7z+w1woBeETFrNdHtO6Q/6detoiid3IEaG?=
 =?us-ascii?Q?fMyfspjZgWfSogFWXSCqW3vpMTQpooPGQ94fciBoSENaqxyXRw+/IPBoTZgn?=
 =?us-ascii?Q?WHDs0fZioTclYoBUoklvNQ3BsSjDcgWY0lRZThcM+wp1+H+4XWeycPVeTe+8?=
 =?us-ascii?Q?IRCSY45HJ4ieSof3DTOPdRxrQekSrY+PrUy0L+Q6lGlDyAnMbEhQxTC0/iNy?=
 =?us-ascii?Q?Mkh83guOeMCbG7Aiaw5buojTnUPrmwSVfT/cxehfEqzSvtgXjnxajF0Fneug?=
 =?us-ascii?Q?TdJ8EfWbreCW7O161JzYiCUq47K/OhULvaHxez2pU07tIPO4SCD09w0S1wvo?=
 =?us-ascii?Q?NZZZDNbua2RXG8kRBdcavz/jKoJebN7Bq3MjcEmljOWYqvdK6eX1CTkTmjn1?=
 =?us-ascii?Q?y0IgmFf/eObg+U7OsE3tXuVnUAQuLX4GG0rbkYSPeuNtfMxjWaK4Yu37CQnN?=
 =?us-ascii?Q?QRSEuOg1BBapiXcc3zGdfsOS1ZK0ITa+W/cpGR0XGpt1hFWrFPL6Wbgf5+Jg?=
 =?us-ascii?Q?JONesJZqIYvzi21XPc73Ym/Tgu5q6g0YnSRbHZp9mkLbc+YUXpQGzyCmyaJg?=
 =?us-ascii?Q?pEw3c1vdLfJ0QJVmDsy++J4BMvWasMehGBFxHH+uUYdxJgB9tIaTxSmY7pLC?=
 =?us-ascii?Q?HbqEcUWqj3froZz/wo2bBCNYiJpS38AZ/p/zioeLRisKkHaMiC2r8fxbEoNg?=
 =?us-ascii?Q?DItLyoAUDbUfTD0AQfOLLmcgO67AOo0scP+xtfQrryIVoAj06tfObSecBVRv?=
 =?us-ascii?Q?SoL+SGE7EKUvqA5lnVrRBAAVImuhlAsIg7DSGcoY9mKz/W8y8zXayJF4wG4z?=
 =?us-ascii?Q?hoM2vUpL5hKqq996P42qPbX5WcNA2sf2RZ8aVdnSlhfWg4Jch4keutfmwYr1?=
 =?us-ascii?Q?iNBRnByMsEngoWPGwGY9rbDID49CuLopl0jDURFhCAcEd/v0X5wHqogO3NT2?=
 =?us-ascii?Q?cYxT/SWdBsJ1eN8I2aE/BsUMeCPKlnxyDzREgrOQzfuOQg6fr5qVMFJdSiGz?=
 =?us-ascii?Q?njMglwn9np98BLXseN1t+H3eye1HDnAjr+F+T1RUbZYAAurMTwlQLuppetK4?=
 =?us-ascii?Q?+AwvlH0GeTcCs4qzbwxaMlIMm/6wxcBaoz3uxwAHCNyOtSTZ/Cf6WFLHb28m?=
 =?us-ascii?Q?/49pX1VYXgpBeXLgMd+phi+Lk+wOim+4nSUh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:03:39.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897d14db-da90-429f-39bb-08dd983dfedb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

From: Gregory Price <gourry@gourry.net>

A common operation in tiering is to migrate multiple pages at once.
The migrate_misplaced_folio function requires one call for each
individual folio.  Expose a batch-variant of the same call for use
when doing batch migrations.

Signed-off-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 include/linux/migrate.h |  6 ++++++
 mm/migrate.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..c9496adcf192 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -145,6 +145,7 @@ const struct movable_operations *page_movable_ops(struct page *page)
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
 int migrate_misplaced_folio(struct folio *folio, int node);
+int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
 #else
 static inline int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node)
@@ -155,6 +156,11 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 {
 	return -EAGAIN; /* can't migrate now */
 }
+static inline int migrate_misplaced_folio_batch(struct list_head *foliolist,
+						int node)
+{
+	return -EAGAIN; /* can't migrate now */
+}
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_MIGRATION
diff --git a/mm/migrate.c b/mm/migrate.c
index 676d9cfc7059..32cc2eafb037 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2733,5 +2733,36 @@ int migrate_misplaced_folio(struct folio *folio, int node)
 	BUG_ON(!list_empty(&migratepages));
 	return nr_remaining ? -EAGAIN : 0;
 }
+
+/*
+ * Batch variant of migrate_misplaced_folio. Attempts to migrate
+ * a folio list to the specified destination.
+ *
+ * Caller is expected to have isolated the folios by calling
+ * migrate_misplaced_folio_prepare(), which will result in an
+ * elevated reference count on the folio.
+ *
+ * This function will un-isolate the folios, dereference them, and
+ * remove them from the list before returning.
+ */
+int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
+{
+	pg_data_t *pgdat = NODE_DATA(node);
+	unsigned int nr_succeeded;
+	int nr_remaining;
+
+	nr_remaining = migrate_pages(folio_list, alloc_misplaced_dst_folio,
+				     NULL, node, MIGRATE_ASYNC,
+				     MR_NUMA_MISPLACED, &nr_succeeded);
+	if (nr_remaining)
+		putback_movable_pages(folio_list);
+
+	if (nr_succeeded) {
+		count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
+		mod_node_page_state(pgdat, PGPROMOTE_SUCCESS, nr_succeeded);
+	}
+	BUG_ON(!list_empty(folio_list));
+	return nr_remaining ? -EAGAIN : 0;
+}
 #endif /* CONFIG_NUMA_BALANCING */
 #endif /* CONFIG_NUMA */
-- 
2.34.1

