Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DB297120;
	Thu, 15 May 2025 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349625; cv=fail; b=BsQpVTL7d4IsMwvEThhUXAqKI60qFooPpCt06B57L9/AvJc4p7/YtDtWdCqrSskim+kkFoMBqHYP2r4XAzIfeVcw6SMTjK4L7MYgcZr5mtcKaHWMGFZzVj1n1em14w6T98Vsr+R+N6MdfCBZ6Lwl5VSdXdvJhCwioRV5E7Hia7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349625; c=relaxed/simple;
	bh=lCpWmcOSIMoylaUrG861vxvoCWyW3ckFa8a3nC9FAys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BFYU87v77MeiMvMvtK24FLNFzJSH3Qn8xH4a2t3RftonMzHfEtVS6U69/aBkASv5E9m8AqeflJrby2pwEqSfQ9gvxQqJtgGdIbp2giXevXA3cuSGROMh+oN1TMN3WM6kiUCLkv0NZVNUh9AXlVtsw2JIXUg24xHieyl5jknIAjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TEzWCAZg; arc=fail smtp.client-ip=40.107.102.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TEzWCAZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/Rv4prdejDhdNSp8ODJEC2xGa39nGcnYurV6f4ODIHChKxOirXqmSgpvLsVfbRFYSLGBJ4XUpG3P2sj0CfFdVbVywD6ZWaTUfBylnRtdoTEyBRMCgxOc4hTVCEr9PZGZvwgIPbhXhs1n21zqpq+Ps7m9TL5988swxJV66A2atVh4K4MTCX8D4M0f572FXr23/IAo3oRYQXW4FOgJwqXDg8nh7D8O56ccMj6yZJJMtWLz+UlbwvptOgqwdWL2DMmXVYXb+duKLQCmlOiY+ntaG2lMBt5M6GXgxxOcAhbV9uZkU/0TrH2hlggdGU6n79NfAIzR6IHrWz7dUw9fEj6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nnDyUw5rhvujopGdCGQd5mtcqP159MB3DfCoHUXBYc=;
 b=OeNtqIN//w09owWjd214zxF2UUq91AklWNOk2v+OMoQBz7fAOB1tKIbDsLO2zSK2/AhJ/1VaJqW3BXj9k0kUa1efrTLU7GtnjajHQj+nYemBSDQho1HtYVyy/Y3/UiHpsOTX41xPWCSjRWYFDtxt1AnpdGLYE1ZBLNaM5kwBjqt1NpX2wVgQE/ZoMRO/eUXuOTSs26pXkAWcr60If3FWK98WmvsWW5vrNkwBk9fherwf2Tv8yzMrt+7+xPJ4x+u4Xk56PtymTSZPsEnCeIIHgDYmfZEb9/3xQVTMqR6CnHiSQAPFlBbLkjOJnVYWltnXE/MwjkicG5Ew25jbRtK5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nnDyUw5rhvujopGdCGQd5mtcqP159MB3DfCoHUXBYc=;
 b=TEzWCAZgtqLp+T9+3DdyjpFvLmAzdkiQ8d+yjlFrW7kOBBgtomvcUK1bM4jLzukzDyP4M9dU3OPYhtB6zMz4bTbY4MfxpYeh6SU75VTSJxxLJl1g8SjcylBAgMTOk3pXps4MwFCPFHgfxpTmMHC58TL6cejZDrLUrp4mCsKs2Lw=
Received: from BLAP220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::14)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:53:39 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::8f) by BLAP220CA0009.outlook.office365.com
 (2603:10b6:208:32c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Thu,
 15 May 2025 22:53:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:38 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:35 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <babu.moger@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
Subject: [PATCH v13 08/27] x86/resctrl: Introduce mbm_cntr_cfg to track assignable counters at domain
Date: Thu, 15 May 2025 17:51:53 -0500
Message-ID: <79efa13654a6f1a308622bd13e0d2bc21ffb4367.1747349530.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4c0216-8177-41a5-be05-08dd940354ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bb+ObrrZlNO6dGNiG3q1CQVkYK6YKUmzMUT5TlVNwhlKp09ET1xPppO8SZCM?=
 =?us-ascii?Q?CLAQYD6ZjJOgT5TnK+9++7WRCg92vokml5R6R9lw6DlJrASJoTOQhjH/gRhR?=
 =?us-ascii?Q?n2CLlU0wiIA8scRX3Z7a58tWNxi0oIguLYtluHCGVsnQdi/Rx7RbqLRpk22s?=
 =?us-ascii?Q?xo57D5FKRFdSoJwEwglowP8/Gxo3eTI1lNYKBA1rUOcnfebatDtRPVEr4Ykn?=
 =?us-ascii?Q?hnRAEwXWbpB8c9n78gnjpx6C8A6aB7z/kesaXZMh91fXOWgS4hnxws3KfEy5?=
 =?us-ascii?Q?pTDHauuB4VgekW74i9YSqEdtQj9m1guJjJFnL18Gx0MuiQf6Dx0eNaVdR1DV?=
 =?us-ascii?Q?b4kgNRQ6V4BAEFej+8bNSknk/DcuQ7GA7yy+Rag7yOiTcNXmLi+2v2GicKdd?=
 =?us-ascii?Q?aqV8PgrxPisWEpXE52aCCSLI0+lK9Y8lIieMEvXrUz2Jp/kjNcn3Wyz7pfD3?=
 =?us-ascii?Q?0DBpQN4OY9Ry1mxsERvnO2OuBNkQSZ7PVsCty2KXRz/pH82N8R1lGmtE9CmM?=
 =?us-ascii?Q?ZzxFm4cB2Z8uFNaei3E8Ynud1eMuD1oaRMJ2q24p1XT81rcuqrbVKf45zqv8?=
 =?us-ascii?Q?umCkeMhqU3vrfz7dqHNU0xrPre9gXEXLSolIpSQO3Qq2iXOPICes8nXXHEUl?=
 =?us-ascii?Q?w3X1i8nnP6OVyG/9d19/qr6XOvtYzDJbp6OtKbQuVkETsC82v5PEHeNZdYIS?=
 =?us-ascii?Q?IRE6BYvFE2L6FWLHoFT5suoOHDISlH/fX+jXa9czG1I+SdKfU6rx8lcglMGJ?=
 =?us-ascii?Q?U6OG2jvUduar5GOVgoEQnHqP+A1SmjgVIX8gg2Glcd50XKG+lRP8GBu3fzQ1?=
 =?us-ascii?Q?NPNPbLcQulG1SaBjhIE39Rd0HU51dyP7nFjnjJwuX2UD9UGf5hZGoC2kZX/p?=
 =?us-ascii?Q?f8gCZFJnEsK8N26UxHJT+CEVkVMdEKrrrqUIHm1iEOTgjfggndver5DvyORV?=
 =?us-ascii?Q?goi9COJOFQz4QSwii2s3hCGJnOvn0D83yKx9zJ7aYKVTVwf3+b5L11uXZ3q/?=
 =?us-ascii?Q?Z12frahhKpULldqLVqsyzf1KyXn5PdWyPMMnSGZVjoN43cA5hFW5RsuhboUq?=
 =?us-ascii?Q?5Tyh3Zh2PGaI+0gupTme2WhTC4TVt8p3yGOeCVLOUQzN+s8cj9edKH6UAugA?=
 =?us-ascii?Q?PiZ8WYDHTimTaKF0Qo5bj/9nfBFrFOaGRHQxSQAIR7VM/zVH1NI/EK3K2oMq?=
 =?us-ascii?Q?ghAjohyf8Nha31Tw4EUScaIm1tAuLTa2rw1hwKBUPF4X8kR1wvxf9jy8UdKz?=
 =?us-ascii?Q?wYbEnbMS62XzydrH6X146wx9WTzv0Su7++KqxgSXFVDNeseW8Nto+JxEMYXh?=
 =?us-ascii?Q?2QroHRq6izLK2ixPmji6TlXiQyI1sGrKbP7BNbvh61zKE/0XrqK5ewW3AXTG?=
 =?us-ascii?Q?ZLRmx5NOKit0Bc1fhtwV+Siey+SDJwM63zkbtvNjYVN11qMsUR6ZW2LShZQU?=
 =?us-ascii?Q?wBs/Ld+Cn+Ie5eBN1fHdgFFg3cnOMEhi0GgssYgegZFy/98E3qkHpc77FXYc?=
 =?us-ascii?Q?yNPZjR7AZrdfhBXM7OA0ScoOZxOaRMw6cmnUCWPy4JLZ2xzz8eb061ojRA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:38.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4c0216-8177-41a5-be05-08dd940354ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175

In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
MBM event of a monitor group. Hardware counters are assigned/unassigned
at monitoring domain level.

Manage a monitoring domain's hardware counters using a per monitoring
domain array of struct mbm_cntr_cfg that is indexed by the hardware
counter ID. A hardware counter's configuration contains the MBM event
ID and points to the monitoring group that it is assigned to, with a
NULL pointer meaning that the hardware counter is available for assignment.

There is no direct way to determine which hardware counters are assigned
to a particular monitoring group. Check every entry of every hardware
counter configuration array in every monitoring domain to query which
MBM events of a monitoring group is tracked by hardware. Such queries are
acceptable because of a very small number of assignable counters (32
to 64).

Suggested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Resolved conflicts caused by the recent FS/ARCH code restructure.
     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.

v12: Fixed the struct mbm_cntr_cfg code documentation.
     Removed few strange charactors in changelog.
     Added the counter range for better understanding.
     Moved the struct mbm_cntr_cfg definition to resctrl/internal.h as
     suggested by James.

v11: Refined the change log based on Reinette's feedback.
     Fixed few style issues.

v10: Patch changed completely to handle the counters at domain level.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     Removed Reviewed-by tag.
     Did not see the need to add cntr_id in mbm_state structure. Not used in the code.

v9: Added Reviewed-by tag. No other changes.

v8: Minor commit message changes.

v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map

v6: New patch to add domain level assignment.
---
 fs/resctrl/rdtgroup.c   | 11 +++++++++++
 include/linux/resctrl.h | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 51f8f8d3ccbc..e2005fc9acd9 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4085,6 +4085,7 @@ static void rdtgroup_setup_default(void)
 
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
+	kfree(d->cntr_cfg);
 	bitmap_free(d->rmid_busy_llc);
 	kfree(d->mbm_total);
 	kfree(d->mbm_local);
@@ -4171,6 +4172,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
 			return -ENOMEM;
 		}
 	}
+	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+		tsize = sizeof(*d->cntr_cfg);
+		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
+		if (!d->cntr_cfg) {
+			bitmap_free(d->rmid_busy_llc);
+			kfree(d->mbm_total);
+			kfree(d->mbm_local);
+			return -ENOMEM;
+		}
+	}
 
 	return 0;
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index bdb264875ef6..d77981d1fcb9 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -156,6 +156,20 @@ struct rdt_ctrl_domain {
 	u32				*mbps_val;
 };
 
+/**
+ * struct mbm_cntr_cfg - Assignable counter configuration
+ * @evtid:		MBM event to which the counter is assigned. Only valid
+ *			if @rdtgroup is not NULL.
+ * @evt_cfg:		Event configuration value.
+ * @rdtgrp:		resctrl group assigned to the counter. NULL if the
+ *			counter is free.
+ */
+struct mbm_cntr_cfg {
+	enum resctrl_event_id   evtid;
+	u32                     evt_cfg;
+	struct rdtgroup         *rdtgrp;
+};
+
 /**
  * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
  * @hdr:		common header for different domain types
@@ -167,6 +181,7 @@ struct rdt_ctrl_domain {
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
  * @cqm_work_cpu:	worker CPU for CQM h/w counters
+ * @cntr_cfg:		assignable counters configuration
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
@@ -178,6 +193,7 @@ struct rdt_mon_domain {
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
 	int				cqm_work_cpu;
+	struct mbm_cntr_cfg		*cntr_cfg;
 };
 
 /**
-- 
2.34.1

