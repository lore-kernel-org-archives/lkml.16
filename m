Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D11B4232;
	Fri,  4 Apr 2025 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726081; cv=fail; b=PXZ49FllZvXlbNeFuXEa6DOFGqF23WdQxT40BDWRR64JyT6+MuJLjpgnr8ft//aFDXn/eBEzcErWYoXe2o0/XCg2Dl33LkjUYuMKfyWCa5Fdj9SKpjuhQc9hvP7/wXgUD7vHll+gdkFx5cPwE1iwln1nf5/NJFp0kUsqcaCiaLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726081; c=relaxed/simple;
	bh=bItRX/8j2OAnU4rp6wYGVu3NfBcI8f9x+n5tR29hZSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpETQ/EkN3X2bjhmKVXLvsn6L4eORBDKV9puf5WHy1MwxllBMbZNVqxoCdzpiUfTB91o92rJe5MAz5mV06x16mjN1RdCrRhQDvR1OZ1y6OGEIKpPuz6QAH9S4KA7AkpK5DomfW8e9f8ympmdqRKcx1oUbSk5wAbzeZ4/7M9wTIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3tYOnVQb; arc=fail smtp.client-ip=40.107.243.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3tYOnVQb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGsw0OlAPn8tIMui3efjpgaw+DnML1Vkg01gpjI6kXLLMARg5cl3CyliOnc8a4r7sGzYBQ4baQ/ngqJQYST0FFBs4ezd0WusxEte6Wiqlffn93KZHEKabbqzG3uEuqq5Ezu5u4j1JV+2fFxP80mnAvBXLzgyxOBQN093GjQbTCuVPjJz28D+3KUrYRYcTKqhf89HXWCRcC8lBJmjQzIvMOF08MXb7hrjFKr70mmK/lahDEHMROTfVF6SJ0xpQjxw33QHEAypqgvOVdq2JMoqfSQyZk7hWPxmoX59c/Ik9nYteEO98FbarXWYN3jevjjka/+0ayCQz54HdTLkVt7Mrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4xbaQNzL1EuEFqFH1LI5y0JyakXKG56wx6DmGWCmYk=;
 b=PVP+AS+72yxEQWfmIDxM2rvR2g56NkvJu0YemtcLTCK4IT0jqaCNbzVL7NmKcipHAKWzKHy0J9Eq3N28Q1lq5/Xfhrj5YamCBAHrSha61S4wcOc4yPHTg4UosFLgmPFRJ9PPz9x3k71pda1JxVVlbVivjPPHRPRYv4scRPjpdetLSayt5w8d3mwJOyGfSG3zHjAGJf1XB3+YGbREMnqHlQQgSFAkvdighwpt9vUONt6m6Du172EjKoB+j2u2oUKk8LqgXbZb+PL8tbu3sW8aN5BSVjNnspIW6xtzoGSmx/Uj+85kUD6V3OB43HwsNUCxoJFQJCyd60pOxe4AJgyNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4xbaQNzL1EuEFqFH1LI5y0JyakXKG56wx6DmGWCmYk=;
 b=3tYOnVQbP5RJWa/w0xCUToCgc8O/HAo0VKO5h61oPQ7RJpkm4bT5C62gp4V9Amc+eJYouwlkJwDPPRwB2wPS5UjEF2DSEbS2H/10StNLKn235sTE6x1UGD670zPss6px6ZbAkKuuVLo4fn6ktO2ZO/hQQY2JcQURz0xQ8i7VmxA=
Received: from BY5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:1e0::30)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:21:14 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8b) by BY5PR03CA0020.outlook.office365.com
 (2603:10b6:a03:1e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Fri,
 4 Apr 2025 00:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:10 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <babu.moger@amd.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v12 16/26] x86/resctrl: Report 'Unassigned' for MBM events in mbm_cntr_assign mode
Date: Thu, 3 Apr 2025 19:18:25 -0500
Message-ID: <5aca5635ae7e41bd4e1f13b81c3e279ed542743e.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3f702f-674f-4d39-cd61-08dd730e9b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SPBz4gOpAllI/dhfo5dvgh3233tKtEhNtAA9Z0V0WDc8edDb3x3v/dGCNKN1?=
 =?us-ascii?Q?cUNLWjerKJJgZ1i8p2hmrVnEf3NO9wjLwagH9c0VGX5amFxAa0DVF9w3O5pp?=
 =?us-ascii?Q?Jbd2w31jd5+gnS4VIopJ0EYZZii8rcs8rFzFEjaEvxjFhXXHUIE4WQdmQcQi?=
 =?us-ascii?Q?pO0adrkjDW/2S/g/ZMlulR1E8oF6dmcYnageNb7qSg+pt/Y5RYV5PZoApV8G?=
 =?us-ascii?Q?Waa3JdCtnm2eWZIS1OOFKWqDH09mrSAwUFCyQMezw/44b3jLlkXptCQiqdd6?=
 =?us-ascii?Q?N4NeKKFNOwqw0dCzPgLy2iosy9CLblJoDXD3JmMRyf6tUG5y9wJ3CriYvSTm?=
 =?us-ascii?Q?kE6TVkBkF1bN7uScB76G1SRxARjtWVh+cXPjiOFzh9u17WJdo9v3pJYE0k8M?=
 =?us-ascii?Q?NS7L9rDP1yH3BoDaLnY5xDN4rPS5+4znbLomHG/oqoy8NF4bnrr2KLnFfA5X?=
 =?us-ascii?Q?HvKALiE5pyFi1MOqc6aE0vvLCenRZ/e7QfbbO6i6NrnunPebcJeo4C254P7Q?=
 =?us-ascii?Q?JhixJQ0H3qD+A7LKSwa1EpySQ9ZJEUY3ufRP7aTx7Rr8E54VvRrSehB/bIoM?=
 =?us-ascii?Q?7IRrnLNaaSYzTSBswpArhFJFqc8lmKP34G1Zc7Fzkvi6rIa/cZQrloL1/xux?=
 =?us-ascii?Q?CaWiJ1CpR2l4sjvz0LLzlE9xnl+WhxV0BOPpS9KsxIxhPAt+XAYowUm2UkKB?=
 =?us-ascii?Q?pAPbfkWCvzW2APrZQxEVj041NN3F4T40yrw0gr5L8L1FPrIHAO9IcE3hey8n?=
 =?us-ascii?Q?QCzqqkTwBoO14ju8F8zcolEgX2JzLSl3l3HhjaovNuZ9AXzekk3Ui/DPccn7?=
 =?us-ascii?Q?w9KQd0MNfFTiSvdlklXrJvzUamaqm6ofveOC15xN/miGGmN5vQ3k+3b7y5ig?=
 =?us-ascii?Q?AP3p4k/sY/FY87a8DgnbYw4iQEhVdKyqYKTRJvQeiyIxZUxPdg0UQ86vKPVI?=
 =?us-ascii?Q?Xw4kBPc0BCe4PHMkbdBFBUJ7KfyhRX+J59wrmVyUXfhv8RoGB5SJ9djNH1vh?=
 =?us-ascii?Q?p/TixF8rPUa0qiNNIXATiGKJnrM9DkzXWShag5sstfxUWZ2DxZDBh03U5fin?=
 =?us-ascii?Q?+gFNCib2wlkFRmxqJI0tS/UJgSUBn26Fpt27nidDh5gUi4NKrP5Lg4qcGFVh?=
 =?us-ascii?Q?Pl0wmCOZJA82oe3wxAOdjKt3HoaXqMC5nbcMLeNdYGOZLA269+zavn5btf9B?=
 =?us-ascii?Q?LsjzQA1Q+F7ohv7gKrMDnWCvYwLlXFwgB+Vd8rAFoS30VcD/fqE1aqwhXIxi?=
 =?us-ascii?Q?yezeMeab/Y915xXFp++wj5MAmuZQl0TwhYzWRTVjC/rkZz0JBylBGtYvftfk?=
 =?us-ascii?Q?N9ykvis/WRudx+g94DMj0yoOyPl+hQPyPqzHbuxOaRPvAT7XUwVKt2ig6cIk?=
 =?us-ascii?Q?/UTIiuothJ0E6sTESlaGacdO/+0RPAMZ3Phx9ktwA/jGlbYznjlpju+FxwNT?=
 =?us-ascii?Q?Mju5fHdOB5Fct109G4xUutMwav+qCsCi2KVTWezeLnpsKUPR/mQondlLUeUL?=
 =?us-ascii?Q?D7xpgclSdZerfjk2zyur/rLxrOHKM7KCM+1M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:13.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3f702f-674f-4d39-cd61-08dd730e9b91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

In mbm_cntr_assign mode, the hardware counter should be assigned to read
the MBM events.

Report 'Unassigned' in case the user attempts to read the events without
assigning the counter.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Updated the documentation for more clarity.

v11: Domain can be NULL with SNC support so moved the unassign check in
     rdtgroup_mondata_show().

v10: Moved the code to check the assign state inside mon_event_read().
     Fixed few text comments.

v9: Used is_mbm_event() to check the event type.
    Minor user documentation update.

v8: Used MBM_EVENT_ARRAY_INDEX to get the index for the MBM event.
    Documentation update to make the text generic.

v7: Moved the documentation under "mon_data".
    Updated the text little bit.

v6: Added more explaination in the resctrl.rst
    Added checks to detect "Unassigned" before reading RMID.

v5: New patch.
---
 Documentation/arch/x86/resctrl.rst        | 10 ++++++++++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 14 ++++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h    |  3 +++
 arch/x86/kernel/cpu/resctrl/monitor.c     |  4 ++--
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  2 +-
 5 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 44128fbda4fe..71ed1cfed33a 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -430,6 +430,16 @@ When monitoring is enabled all MON groups will also contain:
 	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
 	where "YY" is the node number.
 
+	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
+	and allows users to assign a counter to mon_hw_id, event pair enabling
+	bandwidth monitoring for as long as the counter remains assigned.
+	The hardware will continue tracking the assigned mon_hw_id until
+	the user manually unassigns it, ensuring that counters are not reset
+	during this period. System may run out of assignable counters when
+	all the counters are already assigned. In that case, MBM event counters
+	will return 'Unassigned' when the event is read. Users must manually
+	assign a counter to read the events.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 0a0ac5f6112e..2225c40b8888 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -710,6 +710,18 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 			goto out;
 		}
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
+
+		/*
+		 * Report 'Unassigned' if mbm_cntr_assign mode is enabled and
+		 * counter is unassigned.
+		 */
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+		    resctrl_is_mbm_event(evtid) &&
+		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
+			rr.err = -ENOENT;
+			goto checkresult;
+		}
+
 		mon_event_read(&rr, r, d, rdtgrp, &d->hdr.cpu_mask, evtid, false);
 	}
 
@@ -719,6 +731,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		seq_puts(m, "Error\n");
 	else if (rr.err == -EINVAL)
 		seq_puts(m, "Unavailable\n");
+	else if (rr.err == -ENOENT)
+		seq_puts(m, "Unassigned\n");
 	else
 		seq_printf(m, "%llu\n", rr.val);
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 13a2a9b064df..fbb045aec7e5 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -574,10 +574,13 @@ bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
 unsigned int mon_event_config_index_get(u32 evtid);
+bool resctrl_is_mbm_event(int e);
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
 int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 84dcb227f84c..5e7970fd0a97 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1492,8 +1492,8 @@ static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 	return ret;
 }
 
-static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
-			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	int cntr_id;
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 07792b45bd63..d84f47db4e43 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -123,7 +123,7 @@ static bool resctrl_is_mbm_enabled(void)
 		resctrl_arch_is_mbm_local_enabled());
 }
 
-static bool resctrl_is_mbm_event(int e)
+bool resctrl_is_mbm_event(int e)
 {
 	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
 		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
-- 
2.34.1

