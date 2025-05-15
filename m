Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081C28DEEF;
	Thu, 15 May 2025 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349702; cv=fail; b=Gfk4mHk9Qxx5q6AkEpjz8qZ1ZiN0TetyMI/vtDpFEHpKJHgWtBxhap1yEV4Ych6JrB40pw0mKx9A/To7i8R9v3f/1hi7kYYue5BvRkMuxKShfimAyrV+5KAdXCED5VDZKqeRK+okqc6j9pv07NQBASfdcRaplrSm7NPSxnCu+dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349702; c=relaxed/simple;
	bh=lBqb0Xa8L2yzM9ozcYRGjljFWkx/PwcR+IwWA65uhNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBVrzRYjQNXZzr8rn5UEskBtlUQDl9AaLvC4pFhsl++8EmoYs0CAB3L40Kl5ROOdoFKNYF/BMcX9onjsxpbv0z+EgYl3PBthyShwtYv1lFokNyT8Y7KNJOxhVCyiocyYPjTyFARHDna+SwkSYoeqn0+GsY+We1MEBtRrpgz2TeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T5dMFJiS; arc=fail smtp.client-ip=40.107.236.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T5dMFJiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNYU+wi4/xpCMBr5Q7/kRg3OsCsQmHEDxI7zEMJIv22iuZd6kah6TnoYo2gcF2icq4kZY8Ku9QoAGobjg2db7NutXHQWLTDGaivVOJoDAAN9iv+PP6JYcpV7Gu5c7yQKxRmWdmhr6BAQkc47j5NvgYN++XF/xUG/ne8MZs+6+3ohbpsguBip8Tjj028U9VTnsRMhbD2zjBLbyMxuwtUgPmIp9YnWTl1C0xqH7QWUcPGJZkCLYP+27ThXUQgFVtpPFLl71ZQWsFF9+QpUbnbK4fpORTnb7yNq+ZiuUW9/PtswBvHFuorCfNDbC3T2JW8u4Xu8BiAezAzNKwpYtwQcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBSmw/7fN55eUCQShymQRXbY48bKvu4eLQuT2aajrwQ=;
 b=XY1U/cgxWHlQuQy1+e9j32pQOJdjEN7qsYmeRbTHEryUMKB4dyDDoO0LxCkQ30sDk53N8aZsf6/zP5qfAIxtT34DuHR3aq9oZJWbGoLXcNun7lq0fZ7aHrD2vCMfeI0+iveY5jvJceAtm48AMuCZIZlfE5yOa3bH1d+BYttSU9730FuDOcuc8zTzxVYeVyjEqQC108NXApeJu5o3KuflTMwKR4BtJMmZ1nSLcS02X90Kg7fT+JpqGJxZtvRv0Epn+2vWVm7m0blUfrAW1Z2Hl90qbC/JHZaq7mdwSa3g1S2UHPYo0eGs84i0rvKrdBHyVcuQNk0wayPDGIDEHYbmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBSmw/7fN55eUCQShymQRXbY48bKvu4eLQuT2aajrwQ=;
 b=T5dMFJiSRKIIJTAlq1tHpdeLjJ29fZyrejO427FYFwImR0yMiKmBPX07ZfQru79+T0bsGPTadEJMDAYbr+1rsRTnk3g0WtQZIAIVJSRnuJaRdAayF7/Y2hN1MGZ2D5+mLknA04nkWkCbMVx2nWMmkemyLe36R513h+I8YPc+/uM=
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:54:56 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::95) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Thu,
 15 May 2025 22:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:54:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:54:52 -0500
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
Subject: [PATCH v13 16/27] x86/resctrl: Pass entire struct rdtgroup rather than passing individual members
Date: Thu, 15 May 2025 17:52:01 -0500
Message-ID: <619c9cbb6b1525a2d4a46a042384e6771800d61c.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcbc504-ceb7-4ec9-dadc-08dd940382f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kaqqYBW674tgMutXOcWq7vSW0LVBenMgWegEr/xPS/NfxkrbyomRq6DIVDkb?=
 =?us-ascii?Q?qQse6w1CzeeYeQOxJIvo+XyEkeTaomlOGhdX2LME1lnAPyGf9aYToqI2iVVq?=
 =?us-ascii?Q?EnbAUpGZ5J7IIZ/DYtoljoXAUJOjj+0e7jdyinjMsoDcyanhPeyRqyHHUQiv?=
 =?us-ascii?Q?jq9fKNI+4Ao9W7tyF+m/Xb/Drd0F1fZ/buPSNOOz5nghBf/Qbd7uYUnYKCPK?=
 =?us-ascii?Q?5gJpE+KavC52VhLgJhiiXvSbFY3zUr9QPDTnO/RoOQ6OqtIf6na4rNvOhssv?=
 =?us-ascii?Q?hqn/OmeXv6n6rt4mWc1S51KSMKoboKi0XUvx1SKK79cn7gs1CLznR5azObFF?=
 =?us-ascii?Q?EaDY3km7MAh7F241MouuFidCWEpr2QY7OixOC79f08j69nhjob5DUddkoD5b?=
 =?us-ascii?Q?DPbaKodA5SRkD9xtiODV0nnKjgTQOouQoyI/EziigdgYvh5G4y/u7yhY5VdS?=
 =?us-ascii?Q?FQ817/aZHZRo9FI4pMrm8AzXoaQ1Dsb0tIVo5BbbZifzlQYd0KXlUF5d4eqS?=
 =?us-ascii?Q?ijjy8/wkw3xvDwl9Eeaq2+VVZE1gcx5mRMHSrF+q0alVLvlfnKf550+Id/8Y?=
 =?us-ascii?Q?ECFQ11vB5asirtV2IEMdR579qKoeBGUqZzzzfcvmTXKzk1RWuJSq/5Ga7bcy?=
 =?us-ascii?Q?Md7womUS0XI2z2CfwJd07h/ZLlc94P+4arFrQOUpmGP0+0Av6Uc4MpaOsFNN?=
 =?us-ascii?Q?FcNEpu03ha00jEq3oDPvHo84/FW1zSET7Rl4CJnXug4p/Rl1/wUqabu2EmSf?=
 =?us-ascii?Q?AtLTDtIDlpnBepGDYsGoHLh+Q8FYXn6SNQlFg0vJLPDf4Y7KpcDqed40ygAn?=
 =?us-ascii?Q?unowZzWLrg7q5HFl0ZmXyGjNegnfUfOkYNk8aKElLr6f7mon+qK38466OCvD?=
 =?us-ascii?Q?5SFTUhhk3lAiC+7GJVSTqb8p5FzZp8bKDkPSNODen69WU1qm1rYJiSqo56wh?=
 =?us-ascii?Q?wsx2XtVBCkg4HHneJ99Mzz4K4tP669NLk6XeNXnn/fvRNY7R+Pi0XAq5oA0I?=
 =?us-ascii?Q?HxzU22AEluwBrL4vL2kQ5PxQb2QBeYBWz+n6MqkpAEIlOkEhfiSLKwzO6elj?=
 =?us-ascii?Q?njRwyvhlSmcjrT7pHudrbACu6ITDOhVq7krii0xZGIB0oV9LdRIuoUMwxTcr?=
 =?us-ascii?Q?ys7hTup5oWavamQDggaEvtL0W06rohacAb4DHK2b8i61RZESj4HSrpcgAtLN?=
 =?us-ascii?Q?gDgxz8LNo5gxsvb3Aefs/bfSKqJvei7gjNSHUSVKvhmoHZeyppYQXqp63rrL?=
 =?us-ascii?Q?iaucEA3mtpAuf+7uDfdGRR5gWXp2TxjtDPXz8/5IRtM4cHkowtRBLHWGUuSh?=
 =?us-ascii?Q?1sEdeuj5zdovTVzgq0+Szpoxb9AhmyWSiYVh3jATKAebpY9H/o9xGuuqK9vm?=
 =?us-ascii?Q?3t9uJWd1N6hI70g1D1JA086ZqEP2plOSkrHP2NJSZCIigaqAF/S/k/HUMcUi?=
 =?us-ascii?Q?pABho+VEf1bv8vhhTQ/sg0/SNQ9ju6W48qP7fp2xnDP24UseV3FgSe54fuWw?=
 =?us-ascii?Q?oIaKEKxHhYzujbrvMNPsnW/2f0iMmeI/4zBc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:54:55.9215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcbc504-ceb7-4ec9-dadc-08dd940382f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917

The mbm_cntr_assign mode requires a cntr_id to read event data. The
cntr_id is retrieved via mbm_cntr_get, which takes a struct rdtgroup as
a parameter.

Passing the full rdtgroup also provides access to closid and rmid, both of
which are necessary to read monitoring events.

Refactor the code to pass the entire struct rdtgroup instead of individual
members in preparation for this requirement.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: New patch to pass the entire struct rdtgroup to __mon_event_count(),
     mbm_update(), and related functions.
---
 fs/resctrl/monitor.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index c98a61bde179..a477be9cdb66 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -357,9 +357,11 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 	}
 }
 
-static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
+static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	int cpu = smp_processor_id();
+	u32 closid = rdtgrp->closid;
+	u32 rmid = rdtgrp->mon.rmid;
 	struct rdt_mon_domain *d;
 	struct mbm_state *m;
 	int err, ret;
@@ -428,9 +430,11 @@ static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
  * __mon_event_count() is compared with the chunks value from the previous
  * invocation. This must be called once per second to maintain values in MBps.
  */
-static void mbm_bw_count(u32 closid, u32 rmid, struct rmid_read *rr)
+static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	u64 cur_bw, bytes, cur_bytes;
+	u32 closid = rdtgrp->closid;
+	u32 rmid = rdtgrp->mon.rmid;
 	struct mbm_state *m;
 
 	m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
@@ -459,7 +463,7 @@ void mon_event_count(void *info)
 
 	rdtgrp = rr->rgrp;
 
-	ret = __mon_event_count(rdtgrp->closid, rdtgrp->mon.rmid, rr);
+	ret = __mon_event_count(rdtgrp, rr);
 
 	/*
 	 * For Ctrl groups read data from child monitor groups and
@@ -470,8 +474,7 @@ void mon_event_count(void *info)
 
 	if (rdtgrp->type == RDTCTRL_GROUP) {
 		list_for_each_entry(entry, head, mon.crdtgrp_list) {
-			if (__mon_event_count(entry->closid, entry->mon.rmid,
-					      rr) == 0)
+			if (__mon_event_count(entry, rr) == 0)
 				ret = 0;
 		}
 	}
@@ -602,7 +605,7 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_mon_domain *dom_mbm)
 }
 
 static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *d,
-				 u32 closid, u32 rmid, enum resctrl_event_id evtid)
+				 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	struct rmid_read rr = {0};
 
@@ -616,30 +619,30 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_domain *
 		return;
 	}
 
-	__mon_event_count(closid, rmid, &rr);
+	__mon_event_count(rdtgrp, &rr);
 
 	/*
 	 * If the software controller is enabled, compute the
 	 * bandwidth for this event id.
 	 */
 	if (is_mba_sc(NULL))
-		mbm_bw_count(closid, rmid, &rr);
+		mbm_bw_count(rdtgrp, &rr);
 
 	resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx);
 }
 
 static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
-		       u32 closid, u32 rmid)
+		       struct rdtgroup *rdtgrp)
 {
 	/*
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
 	if (resctrl_arch_is_mbm_total_enabled())
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL_EVENT_ID);
+		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
 
 	if (resctrl_arch_is_mbm_local_enabled())
-		mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL_EVENT_ID);
+		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
 }
 
 /*
@@ -712,11 +715,11 @@ void mbm_handle_overflow(struct work_struct *work)
 	d = container_of(work, struct rdt_mon_domain, mbm_over.work);
 
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
-		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
+		mbm_update(r, d, prgrp);
 
 		head = &prgrp->mon.crdtgrp_list;
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
-			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
+			mbm_update(r, d, crgrp);
 
 		if (is_mba_sc(NULL))
 			update_mba_bw(prgrp, d);
-- 
2.34.1

