Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C520D509
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814605; cv=fail; b=VZG7mLJxz7cqZ4+y2LPZ0VTFYjaqhGIMt34tt1mzlv8ARZq840K5FgIccMwKWvYvCT7N0xvrKbSZw8RYWfk1tcR8nfumpGv4+klkGQdiNG0xvCAPdxQ7YRCmMsbiw6sSYOXCnWLk7FbyEzD1N9kKKe22mejiugTzSvfRcZEpyb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814605; c=relaxed/simple;
	bh=bRwv6/Aqdv6m7/lMqzPSZ/7n0G3oWTZ3A6oXwBg/Fgc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oq7LrUUVXkTN/vjwq6XOu/x5BPnKGA1igzywIerFWeMghgCDxhULicF6J0YxE6+TWFCuJPHW0QmidQvK9xZL5upP0Q8P7Xd0fXuT3g/RqCqkOO7R5HgI1FqzcHPUL2oY3tAqmNQ6zWeX6fsdxuVPw25TvNyXj95p9uX/q9xQB8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mrA6G395; arc=fail smtp.client-ip=40.107.94.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mrA6G395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7WTDJvYiLACmwk2LBfdMPQ+oU0hI0z61KlM9ohHm9atRtrOCX7snIgIanPKKr6jAEa7MsBH4AeLw0LmNACgOzsTijVLEctaGA+A71q4LeQjL9CRUyeAB8+JaymHhNH4ZkZQGthcmQSS2UoifSYXe5LPXZ75dNB0fE4JsXe2xfjzKKVKKinPxkOGNLBd9b5x4p0ykDbTXPH/Y/qjUmEL9JQeKmiYPjMMVPIjBRisEOgtB/0JueBmGnh7mlaKbrDJQg6I2I1/T630fmt7T+qIj0P/yq93NHdaYKANtOSOovcYcyXVT5mQihY9sFDMq4Tp4TTXTS+CAaPdJk63JRurbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck8YFF7os3IvOVIJX3TN8HuIwFzihQTyau2gefzP90s=;
 b=da3LldHnrOqtAryzTa/HQ+wWAtKhkloTbYuRqJGgHrW/4j7i6GQASZm+drilFbIhZv/23OczJ+kE2uUoNX7KzBt73C1rv92hQhpAYkk3AyO2ZMhipbfz5KmXGBAWWiQIHo0X4v75xHkJYFbg4Ttpv6H7sdswWHNCLZZ95RCfuV1B+CDqr78Oy4fBs1iBcRgs1qU7o6yTUY0jfLVBDCFfCIVYiheg/Rrn28HpFsw/Rkd8GDGC8748l84d2zzE6aKtm3l4wOweNx2QXYmVIln+LZXYHAVpAMSqRm/TWMhOxJINTRYILxEEjh08K+Ar5U1p2olBiKAi1kgfX9Qp0IWVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck8YFF7os3IvOVIJX3TN8HuIwFzihQTyau2gefzP90s=;
 b=mrA6G395JC4dSOm7NlKSQsRfcKfAfX0h/5F6fs10aejfJMlV2KJRG6mjd0t0iFTppMaFxI+jz/wfUjPq0JBMGe9llhDznBc5oM4GguTeqEso/IB9GguBfw6IthNYKB0LPREnH8conGltmD3AQpuZn4p8+b6PdLov09msY1oDbk4=
Received: from CH0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:610:e5::7)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 08:03:14 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::5c) by CH0PR03CA0242.outlook.office365.com
 (2603:10b6:610:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 08:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 08:03:13 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 03:03:06 -0500
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
Subject: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
Date: Wed, 21 May 2025 13:32:36 +0530
Message-ID: <20250521080238.209678-1-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e52897-17bf-42a5-1c7e-08dd983defc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f2gFopU1B4FG8zneS5EWVXWNQorM4sdqTslcbO6btazahsxJBZyzkf8DsbSi?=
 =?us-ascii?Q?+mTCBQ/6Rpq92YJ4yb9mnWMfk0ghxAR7UMuseOzDHt8S3PZFM4RvsVPPfqo+?=
 =?us-ascii?Q?TptgeCkA1986niCKpds9RwQkPtBlt9d8jCcyksn76thzddO6ns+g0grBwI0s?=
 =?us-ascii?Q?el7P6v5HPBiVMo3ACnV42ihPpAVorv5ptfwupxAEXGiUDyHW/E0I7ZxOE2xN?=
 =?us-ascii?Q?rv2YhRScPIQDQQ1XQKhiiEuz1DhUbBUkZEbsFrB4pcDQ5VpovwpXTOHVjD5O?=
 =?us-ascii?Q?kCNr7w8qLvU1oLkLkUjD49C5vKrk+tbi/jDU/tFD3zt6C/7XGYY7SnTPUkuH?=
 =?us-ascii?Q?BlxXTjur+vUAxLbfxT96ejnZaZI7Dg+3ttXWKyb6E2Xd8t4U3vf6IMM1SrNx?=
 =?us-ascii?Q?c7mo8l3JezXLZES7TFj+z/M904WrCjjLbSliYT82Gz2Ugj/jKQsIEB4BgfOa?=
 =?us-ascii?Q?Wpq4Nsg+7sI/nsisqwPH1YqeudD7jZnHbT84gYU7bC+YnC0Rf4QMdsGy1VCe?=
 =?us-ascii?Q?pjAIiOPsfvnefM93pGoQP7O2My96sHvhQJ/phZfA0XyZcqN4DrwLQQ6r4uAg?=
 =?us-ascii?Q?M2H1VVeu9vSmz+KZpvfL6kOrBQfG/Iw7VjE9aoocBAODvDuFNYf37OoB65g9?=
 =?us-ascii?Q?XJ4b+VrfKnVmYbIGi8QoSZS2EHXff6wOLK+cYd3QIHlMkm2SZozOpLnm2sV7?=
 =?us-ascii?Q?dnwGE1mcVTuU4PIyy8HX8b4oiK/L1Fj1KkHGMIvbOCDcGOL+XpfhtmRF9jmF?=
 =?us-ascii?Q?WktNX1iEZf1RJYQHOZkhM0y5e9xaYqY64JUCilsMU7SLKxcdzGizjBSvpeCF?=
 =?us-ascii?Q?1HMG0vcrPR2W0w78YhV6qR2vHBNi5seeTnKcyi9TAf5f1GhToXpkmh/oUJ40?=
 =?us-ascii?Q?1hHQBZwYxRAcBN0Hy6b5GteK5llNneWHPB2Nd2pLuRwUOAS+Hkbo+R5HX2WF?=
 =?us-ascii?Q?eTOavZZcX/VFNVtEBqr1fF31+spNoWcvrZnDK6v9IMnBu/Nu3HX0uDTKlcsE?=
 =?us-ascii?Q?EHsLp1uy+zIoPUIG7wsETjNBeAPpSIVqkTHiN+Juhu+nZ2MOxmssDAbpiRFj?=
 =?us-ascii?Q?Mma+h2vZ4NrUmJhCk72ZBKtmHci542497aMopBJ7Ubu5W9y7DnBR8rWmvVWn?=
 =?us-ascii?Q?+inzjoeW2ht+bWYq3Ku+j4mNWfk9q4gpf7tmZ+8tRzRHmXwMLRwclSHV/+mr?=
 =?us-ascii?Q?0ncp85qz5XFKdPe4NXbm7JwORYjVTmWPF1EZ+ZbF3WWHyiiPlAA7AG0NoLDj?=
 =?us-ascii?Q?/796OAVTii1eJs5woHxA/tVsvoEmcxMdoDwH0olbKBvj5kfb/VR1dZwTkops?=
 =?us-ascii?Q?6l1NJ3axIDGnZVcpSxfVemCwAabdl9ekezGCTyZ9mJ01xyZGpSK24ID94YIU?=
 =?us-ascii?Q?6SanJm/sw+Ft5extjhyJdNnvzi4ZUeUm4MXj3cMz1jiupYH+hfxbzVNHCd/o?=
 =?us-ascii?Q?Tm7MQ0Hzm7/p6JC9HLEHVxGRR2gtZRxH/9XqvUhjE2rhQSnvG0pccQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:03:13.8712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e52897-17bf-42a5-1c7e-08dd983defc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077

Hi,

This is an attempt to convert the NUMA balancing to do batched
migration instead of migrating one folio at a time. The basic
idea is to collect (from hint fault handler) the folios to be
migrated in a list and batch-migrate them from task_work context.
More details about the specifics are present in patch 2/2.

During LSFMM[1] and subsequent discussions in MM alignment calls[2],
it was suggested that separate migration threads to handle migration
or promotion request may be desirable. Existing NUMA balancing, hot
page promotion and other future promotion techniques could off-load
migration part to these threads. Or if we manage to have a single
source of hotness truth like kpromoted[3], then that too can hand
over migration requests to the migration threads. I am envisaging
that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
and CXL HMU would push hot page info to kpromoted, which would
then isolate and push the folios to be promoted to the migrator
thread.

As a first step, this is an attempt to batch and perform NUMAB
migrations in async manner. Separate migration threads aren't
yet implemented but I am using Gregory's patch[7] that provides
migrate_misplaced_folio_batch() API to do batch migration of
misplaced folios.

Some points for discussion
--------------------------
1. To isolate the misplaced folios or not?

To do batch migration, the misplaced folios need to be stored in
some manner. I thought isolating them and using the folio->lru
field to link them up would be the most straight-forward way. But
then there were concerns expressed about folios remaining isolated
for long until they get migrated.

Or should we just maintain the PFNs instead of folios and
isolate them only just prior to migrating them?

2. Managing target_nid for misplaced pages

NUMAB provides the accurate target_nid for each folio that is
detected as misplaced. However when we don't migrate the folio
right away, but instead want to batch and do asyn migration later,
then where do we keep track of target_nid for each folio?

In this implementation, I am using last_cpupid field as it appeared
that this field could be reused (with some challenges mentioned
in 2/2) for isolated folios. This approach may be specific to NUMAB
but then each sub-system that hands over pages to the migrator thread
should also provide a target_nid and hence each sub-system should be
free to maintain and track the target_nid of folios that it has
isolated/batched for migration in its own specific manner.

3. How many folios to batch?

Currently I have a fixed threshold for number of folios to batch.
It could be a sysctl to allow a setting between a min and max. It
could also be auto-tuned if required.

The state of the patchset
-------------------------
* Still raw and very lightly tested
* Just posted to serve as base for subsequent discussions
  here and in MM alignment calls.

References
----------
[1] LSFMM LWN summary - https://lwn.net/Articles/1016519/
[2] MM alignment call summary - https://lore.kernel.org/linux-mm/263d7140-c343-e82e-b836-ec85c52b54eb@google.com/
[3] kpromoted patchset - https://lore.kernel.org/linux-mm/20250306054532.221138-1-bharata@amd.com/
[4] Kmmscand: PTE A bit scanning - https://lore.kernel.org/linux-mm/20250319193028.29514-1-raghavendra.kt@amd.com/
[5] MGLRU scanning for page promotion - https://lore.kernel.org/lkml/20250324220301.1273038-1-kinseyho@google.com/
[6] IBS base hot page promotion - https://lore.kernel.org/linux-mm/20250306054532.221138-4-bharata@amd.com/
[7] Unmapped page cache folio promotion patchset - https://lore.kernel.org/linux-mm/20250411221111.493193-1-gourry@gourry.net/

Bharata B Rao (1):
  mm: sched: Batch-migrate misplaced pages

Gregory Price (1):
  migrate: implement migrate_misplaced_folio_batch

 include/linux/migrate.h |  6 ++++
 include/linux/sched.h   |  4 +++
 init/init_task.c        |  2 ++
 kernel/sched/fair.c     | 64 +++++++++++++++++++++++++++++++++++++++++
 mm/memory.c             | 44 ++++++++++++++--------------
 mm/migrate.c            | 31 ++++++++++++++++++++
 6 files changed, 130 insertions(+), 21 deletions(-)

-- 
2.34.1

