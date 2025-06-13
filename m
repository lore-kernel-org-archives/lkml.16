Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3C0272816;
	Fri, 13 Jun 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848848; cv=fail; b=Uj5nashW8bn+PiXPL75Mc7BHdjcLtkeoEKrAMHzqhplvQgMEbdSZoN/6okBCI2RjlkBkyg9XqI2lsfu5zcrrj8lHDIPiv89DUuzdwnlguoF+fQOxno64k9KqeYXWcf7hJzisQZaZ4QAYXVvpvll7n/BF4r2ntrWAxxxxuj03uZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848848; c=relaxed/simple;
	bh=+HprEXmAWKCz7llhNlfLPpNotXlaJCmC3sbgqjyIFTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6o4YaXBiwUJxrvWVVMltsPoLb6pig9HKMJQ2sUa855vPz53lSi7sa1BJ7bJZ3rWBQ/IbV2+d7ydM9AZhU9yrP6AJDwu1RRThi6/mjPNiKQv0XLSKN7h1OGvlE7IJpWIHSoPQC4w4Gp/IS6clnVtSzY1bKoVyM3F+D9llxaQiBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V06YkyiS; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V06YkyiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miB00hIkudYuvMu//DWmy+0MFDkbUA3zjSoupswMOU11ENeHOl7pEGx3BLu2blVhMUHrwJ2nVC9Rtj5z+r/VP3kSu/H4cKVLl/nxr+v+QKxktb6jbps7IgSnnqmwUX7MlG7py3NBWo2tO+RGFlSOc8Xp8FrCxutmSS0+9n3NqZOaCw7ioJzLFnCv/BIbMfOtj41IKJLOw9zlFbTGopxBmu7orDzAyTsqBXhOyUw+ipvfaf2KWiOa4ynfeyIWFCQLSyJKMbBbcRM0x5ZMHlR2+NRkOtRjC+xq/QN7KtZGNO68g3dFdjJT5PpWVms90lqayrnMlD6j/5Hdrkv7zvR85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7xlm0IdtoOXjDJUsmm7Zmmgm/gnuiTLrOavDohgWro=;
 b=siO63z15Cac5lY51eNDnyFv0iIheUN/Vh/JgvfxFyM96+GeQZIGcCsvvXoGI9ay5Z+/8CVxgRCo7QUDLSXP5gqmvNcqJcgT9ZvW/i+YYiuBAeviAkTNuQA+cJgcjiIfi9hhFQEzAiknO3GwHEmI1WwQxPYxOCN30huMYWcYsPY89dmO98pVqPfzk1Ag2Pa9whoPPL6+p58X90KfHS+XPLip0jSj+jxfmmy2L62cN4RDyhCKdaUkun2rdVSD/5VW9/dbTMia5a1d1oI4Do8/3nhm14WWi0h2CB8+0XO2DhHb2ek7PXlqwzUxAQC3M0HdJI9Mfx6MWdJsqTLDzsequKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7xlm0IdtoOXjDJUsmm7Zmmgm/gnuiTLrOavDohgWro=;
 b=V06YkyiS/Fxp8AwaeSB5xrsrWtwPf1d0mBEnd07CFMsreYouw3V21D8Ks8efYXb/SasX0cdo+o+r566VfIo9z3QVi2h749B6zOiwWt7rQIkQvOaSdUlUWoGG2iZtYE+T2JyTibu8jiEaTQCkWhjamp6BHcE6NKfC/Vf1ghMK5uA=
Received: from DM6PR02CA0117.namprd02.prod.outlook.com (2603:10b6:5:1b4::19)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 21:07:24 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::25) by DM6PR02CA0117.outlook.office365.com
 (2603:10b6:5:1b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Fri,
 13 Jun 2025 21:07:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:23 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:14 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track assignable counters per domain
Date: Fri, 13 Jun 2025 16:04:57 -0500
Message-ID: <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
References: <cover.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 593a696b-62c2-44fb-78e0-08ddaabe4b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sO8l1MPSqaRG1XF3foz9qd9b01BHp5+nDJnHePnvBtud407BaSraWjLxRH1P?=
 =?us-ascii?Q?ga+JzAVty4pnJFApCkOksSFINvfC3CUUIDtdphw7tqgyavteII+vPGPqf3dd?=
 =?us-ascii?Q?w0ozneMhg/cT+4FjqPXgma2/dHbD3appdgROYpjO6/4EMqanRVlNSQdPtv2t?=
 =?us-ascii?Q?ib22G1x+JBi+0H9P1etnJT+hNJQpRZTaGzuzk6tQui8xloKF84y71JOSZd1B?=
 =?us-ascii?Q?uch/4BlJp8om5ofJ0CQSdoLV04ipspAn2IVL/jUUoouG4cFG8UtSd7E/lk7x?=
 =?us-ascii?Q?Jr84rDwpP72pPfutDcPcm8katEfnJusR5W4NQ+b8Bpk8EbR1zHtqu0I/Zae7?=
 =?us-ascii?Q?OoWUtvYv1YO8u2LXRbYVqtJb4UZhJCzdlpN/KQeWqF7SwmXi6IL701yoQsNm?=
 =?us-ascii?Q?1q+mV62br/I1wxLBnpwfFOLaNmEfTeWaG+8YcsW8kRVS24Gtg22CEUH3NwdM?=
 =?us-ascii?Q?nAn16PWD2fSjm3CNMfkQbUP2NTFGNzQbwXJycZYwHtTyn4jHxPZ6p4l/AerQ?=
 =?us-ascii?Q?Blt1FH6r0cUwMlMW4yE1ZmWwL8xdAzJcNwRhjEBeMhG9sL97qIz/0FmD6TW7?=
 =?us-ascii?Q?YVzEczn8zTECyoqLDAZ5L1Sfr0Ykvi1GZUmGPJwbPjmPLso5MXy1hSi7L4KC?=
 =?us-ascii?Q?ToZMhjb/STjbTfOG4+EVUc9uPTOu2Ung676V1aFGnt6n6uRVWCQyx2asVUvi?=
 =?us-ascii?Q?ZgAmj4/Berrb/UiKjC7RW8fd1Pi+Ku0h36CqnKhhghK6qS/r9GyIja5CUIYf?=
 =?us-ascii?Q?HU4tWAquJir6iy/r3utuGHeANfWfdZi9R91p2Zhj7/2mTZyMKzgpVY/MfsLL?=
 =?us-ascii?Q?sJw7+QTJxVvpC3yap1WVnYxGd4lwi/hA5zKhIsjPZjgxgUJkzUEHSUv+559e?=
 =?us-ascii?Q?UDhWeeTqd5cL3nddT8baVL6v6AZNFW6yD9UsCzb5IW49qDI6ApMyhfGyYAfL?=
 =?us-ascii?Q?ab6zeHLCezrx54CBTup/OFgXzTPtzKKVzMU2NJor/W3IXITWfFWj6dpNy6rN?=
 =?us-ascii?Q?pQOxOrO4zjb+JZmLBeaarJ62K3wCsb2XNZJBSvAvRznSlODc0k5/aKl2AQaQ?=
 =?us-ascii?Q?GsM4cVXIXgQJO5xtC77PaN/SMM4KTFzXkdRyro48jc3az1WkPf18nZgSq9za?=
 =?us-ascii?Q?1AMa5OeK9Q6H+L24i2iJjtDgWPL/A79Ql/V32BR2R4sXVNkJRvnOPfDMLZyV?=
 =?us-ascii?Q?fwlvOMFOuDINZ4HtKjcrKiII5RsmpHquxqgVUIU+hMUJrDB4aw3qHnleby3v?=
 =?us-ascii?Q?Z/h+zsZayJCRvCfiOIIBSfbAmIyMALP2JdXCNetherum98N5P35RLRqSDsbK?=
 =?us-ascii?Q?nzttYofQxtoWnioDEhZ1tVWT8g+cZn+OmbsmFeu7iH4NwlaJT0Qws0jgCgGu?=
 =?us-ascii?Q?ZdUesDzJv3Y2Aa7DVxrRxLskajAZClXgwkO/4dvRy4Gy6JL79jxtnUS6Dch6?=
 =?us-ascii?Q?aAcMzcrxAjRcxEfiCOQUFuFUhJ9kTPIWLAbElMe4GF5vePpzpV8sASMTcez8?=
 =?us-ascii?Q?HlE8Qeww0ahrb0MHzvujaxXEdK5nIaenWqiFX+ZnpqVE/ScwCOtMf7MQzQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:23.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593a696b-62c2-44fb-78e0-08ddaabe4b36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597

The "mbm_event" mode allows users to assign a hardware counter ID to an
RMID, event pair and monitor bandwidth usage as long as it is assigned.
The hardware continues to track the assigned counter until it is
explicitly unassigned by the user. Counters are assigned/unassigned at
monitoring domain level.

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
v14: Updated code documentation and changelog.
     Fixed up the indentation in resctrl.h.
     Changed subject line to fs/resctrl.

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
 fs/resctrl/rdtgroup.c   |  8 ++++++++
 include/linux/resctrl.h | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 967e4df62a19..90b52593ef29 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4084,6 +4084,7 @@ static void rdtgroup_setup_default(void)
 
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
+	kfree(d->cntr_cfg);
 	bitmap_free(d->rmid_busy_llc);
 	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++) {
 		kfree(d->mbm_states[i]);
@@ -4167,6 +4168,13 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
 			goto cleanup;
 	}
 
+	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+		tsize = sizeof(*d->cntr_cfg);
+		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
+		if (!d->cntr_cfg)
+			goto cleanup;
+	}
+
 	return 0;
 cleanup:
 	bitmap_free(d->rmid_busy_llc);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index f078ef24a8ad..468a4ebabc64 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -156,6 +156,22 @@ struct rdt_ctrl_domain {
 	u32				*mbps_val;
 };
 
+/**
+ * struct mbm_cntr_cfg - Assignable counter configuration.
+ * @evtid:		MBM event to which the counter is assigned. Only valid
+ *			if @rdtgroup is not NULL.
+ * @evt_cfg:		Event configuration created using the READS_TO_LOCAL_MEM,
+ *			READS_TO_REMOTE_MEM, etc. bits that represent the memory
+ *			transactions being counted.
+ * @rdtgrp:		resctrl group assigned to the counter. NULL if the
+ *			counter is free.
+ */
+struct mbm_cntr_cfg {
+	enum resctrl_event_id	evtid;
+	u32			evt_cfg;
+	struct rdtgroup		*rdtgrp;
+};
+
 /**
  * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
  * @hdr:		common header for different domain types
@@ -168,6 +184,8 @@ struct rdt_ctrl_domain {
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
  * @cqm_work_cpu:	worker CPU for CQM h/w counters
+ * @cntr_cfg:		array of assignable counters' configuration (indexed
+ *			by counter ID)
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
@@ -178,6 +196,7 @@ struct rdt_mon_domain {
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
 	int				cqm_work_cpu;
+	struct mbm_cntr_cfg		*cntr_cfg;
 };
 
 /**
-- 
2.34.1

