Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347F296725;
	Thu, 15 May 2025 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349711; cv=fail; b=a8Cdl0f363OxfKMK+npCysawTHSJbuXRi11w33D65MjIUYOW7UMoF3ZG1esM4ZhAOIgF7u/HL7kY2IzoxLflL92LHCaTb9rz74PfqWho14BHUHZhaqhyOPK0b1EZ7mvSdbYKFkP5YXoTOxtm8si6IpRSPL0JjQWFCJufsz21laA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349711; c=relaxed/simple;
	bh=UbdiY+fv281cxoeZJR19V7nQH+qA8xhEIGjutl1PaBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Soss+WE4fJNTRa6MaZX4Uy2uqqYeN5ecvcguUiYQc2QUz5sn/qj94vSE6SqoW5GQDfbG3zlciTh4hOsuypMJjQeIdt09PF61crYelNCv3/rCoGgQmDP3B8TN1AnhdiivipCOtWNzFg6LP2GcL+nyzNqv6N//YLB67c4UtfMLdJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NmnG7pKz; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NmnG7pKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWS4Vd2T04g0IRUGaGG9Ift2sNEHsuTogaoarA3XttiRPFtBOdyo4iGVwP9tFXwa1XQBG6YHzf5B7LFX0q9mV+pqlZGyVa/4rTYG+oU+Gl9avmHOD29tYaUaZVTAY9qlKSFk9AHk+diSLQQKOEFAeIsI3clUeEjVbVB9fDkHGbOdau2YlQkoKbsPrmeuoTIMGwDrPQuPM5AFNiW1/9NEvYUbDXJeGXEKK5sA8FsXP/4Ygo9nwAUMpUgckh1COlY0emoA1KYswIIXDP5afvyVQfesJe/AI0AWgZ0hsi7ZHrYldeevbj9sE2qNUs4l4rFWxp9j7/S7Hr4s7qPaX4AOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8LqMviSKTRna9kUIil50cEMvvVwkhend4qpslXnXJA=;
 b=r+6i330b/71/vlBNIujGEjaAXfPhWeHrBWoHsV0imqMOEG7Y+LJ/wbMKH+Jtrujck1feQy1I8PxywEkXLQ3R64AMNkMiBnX8AhWxUqCljDBj7RGUDRwUsUpIyFjKtuc6C9z6PrEFMDZ+p9XATJ/VmJ7Zp69wZjkyK8Z1jvuppIUrem2tX3taJqVTBQD785+KJX61f0bIJXBEk8ahpC3EqsBOmWfiXU0lN6g6lb09b2tDVkmEONby2Pj8GR9RTaSYi2OQWECxlIBuOu2o4PjOvm/GpKw5unUhKRdLec9CEiJEVTqa+kjrLVyo21VSoD/VZJhYHpGQ64BkjgdtnqLJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8LqMviSKTRna9kUIil50cEMvvVwkhend4qpslXnXJA=;
 b=NmnG7pKzj+nlAghmRevDqb9uwOwmDUS4GXSSjYiwhteARibu5MSTNhvzYGt23KEGWHuXd+2zUY3pp13kiBdnlxL483QJB+uDKive8+f3mIHVl/HbuhrB0NN/6Yz5n5Z2f1IhInSDbEEVOKXAlHg1459/ju8LnbSdy7uGUmyfrQI=
Received: from BN9PR03CA0042.namprd03.prod.outlook.com (2603:10b6:408:fb::17)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 22:55:04 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::f1) by BN9PR03CA0042.outlook.office365.com
 (2603:10b6:408:fb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Thu,
 15 May 2025 22:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:04 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:01 -0500
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
Subject: [PATCH v13 17/27] x86/resctrl: Add the support for reading ABMC counters
Date: Thu, 15 May 2025 17:52:02 -0500
Message-ID: <af9e4c8e97f33299b49d1e3fb2025cc4f26f02f7.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ae2216-c6f6-4781-84ca-08dd9403884e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NpRvaJJ8PEBW2VT4MDfz2SyRlhNjUS5RY4lfXutGJPS+TiSrdcjSczWZEKAS?=
 =?us-ascii?Q?3+nTOE1UWc2ReoZICsL7njV61AaFwNkiqK2AsBoNDh+g3FSwpJR9ZZMSOyYO?=
 =?us-ascii?Q?g2TzL/ljRSdBvIbNEUcWNWrf3Zsyjo3vYeo33aIwIkJMYWZL2KwYVEk5mU21?=
 =?us-ascii?Q?BO08N4xOw7YOIAx1c5KiuUezIcihKaJF5aC9h6yCj4CfiJfKxZ9x3VT+m1ED?=
 =?us-ascii?Q?w+xyiYRMsPXewxllBa9Y7at1EGhgXrDLZ6rwNK/5YSXIi731t25R+qQ7LFDV?=
 =?us-ascii?Q?ybBuTwwCQmBEOfCJXCcfhC3xWCTQSSVOBqwLjY04+hfiRbhWiwdhDf+zHOiX?=
 =?us-ascii?Q?gW7wzCoT9zHgYLbOF7W4gzazQCbkFpbMlUGSfiHGx+FUtCwmJlOkeQjTG5Xs?=
 =?us-ascii?Q?mr9Bg1up3QQN29jWsTOrGC3SNMjp0B6QVZWel3gmSfN31VTWj83qx/Aq08ii?=
 =?us-ascii?Q?GIS4VGSeZJDyIXr6Mq/uAk2t81QV50xklBdeTUoA+jBIjezfZLRNd+XYMHDQ?=
 =?us-ascii?Q?i+Ji3PElyhAIIClK/+AoDPzVOUFORjeymcnaboXjx9SrS1XSKmdVKDRXfn2E?=
 =?us-ascii?Q?Mq6i4Yvsvp5jKTXkePSe5GIoT1x4QaCtKZA4+6vMym3byb10OLw/bs8SuoD5?=
 =?us-ascii?Q?Zrj/rTqFXBfiebPxkNMFBZotkIiji9j8X6vKFErK3ic/MNB/m1a1+eJpi59P?=
 =?us-ascii?Q?O4OQ2MJfvVy/rUwF1ZY/QdHfmAbmz+UEA+Juu+sl7ZSfvsgSwT507oAIsKaz?=
 =?us-ascii?Q?xdMGAg3j8dmmwxhneHWBjn9CtBY7LD+0xbsWd79fFFMOL0J3zsPemznFy0zw?=
 =?us-ascii?Q?Ei6/Z+tSg1R3mVLy09c3ArHX06cYACxzQS9BtY4aPDwFrjTiVsXkA3r/pJtk?=
 =?us-ascii?Q?JzSCuTjWOwX3F1m8VeZwF7h2W6wKYxRg+FyC7mbYsCA5Kyxt0l9rrYg8VnhM?=
 =?us-ascii?Q?iSjLMteVpRpMY4CPx2HJ98c8pI6OXPxolV+RFqMNgeZmi5UObj4nMcJ7xffQ?=
 =?us-ascii?Q?b0P4T1cMkXs04zIdNV7LMMfQO+H6SJVd61zsELeAiQV4eddAX79mSM+kQrJd?=
 =?us-ascii?Q?1ZwUzY79vRrHenRp7AeDMKu47+DRG745xRGiAU/PEzOkn4zyfxZfKU+jCP43?=
 =?us-ascii?Q?wW2TCBv8JpZPtqEYlx5ygfCzpRqJEIJkYmRmQNgWn1xHsN6N1HI5c0oWpbJ9?=
 =?us-ascii?Q?LQ8LMjf8QTCQ+elhzQ6rdZtGun1jjiwl+i8+QtZGP+xsylLHUE0mnXRGklBl?=
 =?us-ascii?Q?39gcgApoSS0k3kBo/hPorIuRG98GT6A/F35/7fWSUzZiFk+Cg7RE9cnWPQlV?=
 =?us-ascii?Q?mJM7iSDRhJ3cy8uLVvlAK+320Kb4XgFEWBHA9AJ1ydJy+qN2cH+uZwZ69FGU?=
 =?us-ascii?Q?ebk2Z7q+vmGi8nYsC2fCZX87/N1iPaOWRJYvn3BMwynG52pNUrMzrpOP+9xD?=
 =?us-ascii?Q?DQnzsgIEH5O45EtY2TIVAWV9wwS7zEWBevmOIo6VYfH2azMmFmfswb4gJUAP?=
 =?us-ascii?Q?pEEzLsImocwqtB4ehVs/kxBl98YipoXNIM4TXUrjU7gEK/UsAIW14Tp+rA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:04.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ae2216-c6f6-4781-84ca-08dd9403884e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469

Software can read the assignable counters using the QM_EVTSEL and QM_CTR
register pair.

QM_EVTSEL Register definition:
=======================================================
Bits	Mnemonic	Description
=======================================================
63:44	--		Reserved
43:32   RMID		Resource Monitoring Identifier
31	ExtEvtID	Extended Event Identifier
30:8	--		Reserved
7:0	EvtID		Event Identifier
=======================================================

The contents of a specific counter can be read by setting the following
fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
and setting [RMID] to the desired counter ID. Reading QM_CTR will then
return the contents of the specified counter. The E bit will be set if the
counter configuration was invalid, or if an invalid counter ID was set
in the QM_EVTSEL[RMID] field.

Introduce __cntr_id_read_phys() to read the counter ID event data.

Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Split the patch into 2. First one to handle the passing of rdtgroup structure to few
     functions( __mon_event_count and mbm_update(). Second one to handle ABMC counter reading.
     Added new function __cntr_id_read_phys() to handle ABMC event reading.
     Updated kernel doc for resctrl_arch_reset_rmid() and resctrl_arch_rmid_read().
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c file has now been split between the FS and ARCH directories.

v12: New patch to support extended event mode when ABMC is enabled.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  6 +++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 66 ++++++++++++++++++++++----
 fs/resctrl/monitor.c                   | 14 ++++--
 include/linux/resctrl.h                |  9 ++--
 4 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index db6b0c28ee6b..3b0cdb5520c7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -40,6 +40,12 @@ struct arch_mbm_state {
 /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
+/*
+ * ABMC Qos Event Identifiers.
+ */
+#define ABMC_EXTENDED_EVT_ID		BIT(31)
+#define ABMC_EVT_ID			1
+
 /**
  * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
  *			       a resource for a control function
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index e31084f7babd..36a03dae6d8e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -161,6 +161,41 @@ static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
 	return 0;
 }
 
+static int __cntr_id_read_phys(u32 cntr_id, u64 *val)
+{
+	u64 msr_val;
+
+	/*
+	 * QM_EVTSEL Register definition:
+	 * =======================================================
+	 * Bits    Mnemonic        Description
+	 * =======================================================
+	 * 63:44   --              Reserved
+	 * 43:32   RMID            Resource Monitoring Identifier
+	 * 31      ExtEvtID        Extended Event Identifier
+	 * 30:8    --              Reserved
+	 * 7:0     EvtID           Event Identifier
+	 * =======================================================
+	 * The contents of a specific counter can be read by setting the
+	 * following fields in QM_EVTSEL.ExtendedEvtID(=1) and
+	 * QM_EVTSEL.EvtID = L3CacheABMC (=1) and setting [RMID] to the
+	 * desired counter ID. Reading QM_CTR will then return the
+	 * contents of the specified counter. The E bit will be set if the
+	 * counter configuration was invalid, or if an invalid counter ID
+	 * was set in the QM_EVTSEL[RMID] field.
+	 */
+	wrmsr(MSR_IA32_QM_EVTSEL, ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID, cntr_id);
+	rdmsrl(MSR_IA32_QM_CTR, msr_val);
+
+	if (msr_val & RMID_VAL_ERROR)
+		return -EIO;
+	if (msr_val & RMID_VAL_UNAVAIL)
+		return -EINVAL;
+
+	*val = msr_val;
+	return 0;
+}
+
 static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_dom,
 						 u32 rmid,
 						 enum resctrl_event_id eventid)
@@ -180,7 +215,7 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 unused, u32 rmid,
+			     u32 unused, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
@@ -192,9 +227,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 	if (am) {
 		memset(am, 0, sizeof(*am));
 
-		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
-		/* Record any initial, non-zero count value. */
-		__rmid_read_phys(prmid, eventid, &am->prev_msr);
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+		    resctrl_is_mbm_event(eventid)) {
+			if (cntr_id < 0)
+				return;
+			__cntr_id_read_phys(cntr_id, &am->prev_msr);
+		} else {
+			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+			/* Record any initial, non-zero count value. */
+			__rmid_read_phys(prmid, eventid, &am->prev_msr);
+		}
 	}
 }
 
@@ -224,8 +266,8 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
 }
 
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
-			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
-			   u64 *val, void *ignored)
+			   u32 unused, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val, void *ignored)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
@@ -237,8 +279,16 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	resctrl_arch_rmid_read_context_check();
 
-	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
-	ret = __rmid_read_phys(prmid, eventid, &msr_val);
+	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
+	    resctrl_is_mbm_event(eventid)) {
+		if (cntr_id < 0)
+			return cntr_id;
+		ret = __cntr_id_read_phys(cntr_id, &msr_val);
+	} else {
+		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
+		ret = __rmid_read_phys(prmid, eventid, &msr_val);
+	}
+
 	if (ret)
 		return ret;
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index a477be9cdb66..72f3dfb5b903 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -159,7 +159,11 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
+		/*
+		 * cntr_id is not relevant for QOS_L3_OCCUP_EVENT_ID.
+		 * Pass dummy value -1.
+		 */
+		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
 					   QOS_L3_OCCUP_EVENT_ID, &val,
 					   arch_mon_ctx)) {
 			rmid_dirty = true;
@@ -359,6 +363,7 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 
 static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
+	int cntr_id = mbm_cntr_get(rr->r, rr->d, rdtgrp, rr->evtid);
 	int cpu = smp_processor_id();
 	u32 closid = rdtgrp->closid;
 	u32 rmid = rdtgrp->mon.rmid;
@@ -368,7 +373,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	u64 tval = 0;
 
 	if (rr->first) {
-		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
+		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, cntr_id, rr->evtid);
 		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
 		if (m)
 			memset(m, 0, sizeof(struct mbm_state));
@@ -379,7 +384,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 		/* Reading a single domain, must be on a CPU in that domain. */
 		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
 			return -EINVAL;
-		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
+		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, cntr_id,
 						 rr->evtid, &tval, rr->arch_mon_ctx);
 		if (rr->err)
 			return rr->err;
@@ -404,7 +409,8 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
 		if (d->ci->id != rr->ci->id)
 			continue;
-		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
+		cntr_id = mbm_cntr_get(rr->r, d, rdtgrp, rr->evtid);
+		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, cntr_id,
 					     rr->evtid, &tval, rr->arch_mon_ctx);
 		if (!err) {
 			rr->val += tval;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index f78b6064230c..cd24d1577e0a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -473,6 +473,7 @@ void resctrl_offline_cpu(unsigned int cpu);
  *			counter may match traffic of both @closid and @rmid, or @rmid
  *			only.
  * @rmid:		rmid of the counter to read.
+ * @cntr_id:		cntr_id to read MBM events with mbm_cntr_assign mode.
  * @eventid:		eventid to read, e.g. L3 occupancy.
  * @val:		result of the counter read in bytes.
  * @arch_mon_ctx:	An architecture specific value from
@@ -490,8 +491,9 @@ void resctrl_offline_cpu(unsigned int cpu);
  * 0 on success, or -EIO, -EINVAL etc on error.
  */
 int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
-			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
-			   u64 *val, void *arch_mon_ctx);
+			   u32 closid, u32 rmid, int cntr_id,
+			   enum resctrl_event_id eventid, u64 *val,
+			   void *arch_mon_ctx);
 
 /**
  * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
@@ -532,12 +534,13 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
  * @closid:	closid that matches the rmid. Depending on the architecture, the
  *		counter may match traffic of both @closid and @rmid, or @rmid only.
  * @rmid:	The rmid whose counter values should be reset.
+ * @cntr_id:	The cntr_id to read MBM events with mbm_cntr_assign mode.
  * @eventid:	The eventid whose counter values should be reset.
  *
  * This can be called from any CPU.
  */
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
-			     u32 closid, u32 rmid,
+			     u32 closid, u32 rmid, int cntr_id,
 			     enum resctrl_event_id eventid);
 
 /**
-- 
2.34.1

