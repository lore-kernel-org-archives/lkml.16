Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF44A1A317A;
	Fri,  4 Apr 2025 00:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726029; cv=fail; b=ZzsMaBlISCfCZcOPkfSNPW7hFgJmpNiPFdVxXq4iDyiyLHdSL1iM+jJOi4Xu+vkET4GbLr2b+bocS+TW9DTUjh/AaFA/TibBM4778nUJEO2CQnjAnlQuJ2AbtRV/oUj9BwsFzsLHw2YzijzulIOKiKXI6iQMYe3O2fTLOB7NoC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726029; c=relaxed/simple;
	bh=PlLjZhioGEFqhC9NKQh1TNyp5dQanGDKWVX8Wjq3gOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvSnFABjaI8TLFVB6hAi0czDTfKKHpBiwrCQj5k4Eb5hKuf5qW/r7iZNXCfQHKBot38G+2lTH5Kq3MGL09GKPPy7GjNwbM9F3sb34UAUpjYHDRTrLjsdeV2Vfn3PBLRlFjseclTbPmkKiG2rv4iQ3pGR+BKjUt42F5Ko46LxLms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tZ0Bd/3I; arc=fail smtp.client-ip=40.107.93.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tZ0Bd/3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmgnVu92QMRCpcmyf0nqYosxWTbUxvDqeZKo6bO/3I7RPnzbwiQn//A3KrAgh1KceIvR7Mw83FIqUCCCZ4k45VdWfhd3d7lv6F5XrnNEudg7KcKwyBtj34t43nFY5QH/lhvs6Re8E0z7XIh5dS8fla/qj3WCJAKBidlOCLV/AMac3x/MZJgFHACTWlIq3aFelyli9TMBkHk/8XFeC6hoJKaSyDsktP6Ch1dfoVLAxcXjhLswazUf9iy3AXlSPBaliBbQqztgODSqq4nXtMmPPeQEcaEd1c1NF0J0AYlsHkJzqXmG4Vln8wtSUqCAC0TPJkbWI8eJR6OgfxkjWAJVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUHwRmNdBHHZLO/sYEs9Ob5kyWB7AyCkuWoPGfNewtQ=;
 b=bH7dDGRQUBd/bKMec/nIsduKoQqKYuRsI0V7Sfik8WlrZvj9jtKmYUGkBasENJdq3BLaiBfbqRwm5UYbSdClgUE5nQXOgnu1IvC5/RMnukvdAuy8A0h1eZdfg8kLRLxwwwyghxp39NBqQeuUwzAYP69a1Bk51OS+Nk3D8F0weUWPg9z246e3mb0mE0+UwUSohHaAcIGcJqChvnvqDUVK174ph/ymwOGFhAr+4taAk8PlQntFYZQxfxsVK/jW3xHvyZl3sLGEXJA7rVL2U58RxaTnBWbuoXXoAo+pvI3R2+MTf9ZUavUGd25Nt0ZB9S9NpT3u1Vc0GjTmsqSgwQUHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUHwRmNdBHHZLO/sYEs9Ob5kyWB7AyCkuWoPGfNewtQ=;
 b=tZ0Bd/3Ih6AmJMMHHpQTYb09Mna7RG8rVw7E4+TABQ2LSge+heQlC/yaLo8f80EMv0NoDuygq6NddoozJyxR5u0frn7Yo7mLlnTQDDzqFY0PdW5PbuvYKcTRbiMYjHKY/qFEO+f9qxulPHJ0U0H6dNdjxC4GPoti6cWSJvOf8dQ=
Received: from BYAPR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:c0::31)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 00:20:18 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::9b) by BYAPR05CA0018.outlook.office365.com
 (2603:10b6:a03:c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.38 via Frontend Transport; Fri,
 4 Apr 2025 00:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:17 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:14 -0500
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
Subject: [PATCH v12 10/26] x86/resctrl: Introduce mbm_cntr_cfg to track assignable counters at domain
Date: Thu, 3 Apr 2025 19:18:19 -0500
Message-ID: <9ebaf75d28b2a6a12e5eb8120a79328b30cc8085.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cf1bc1-299e-4975-dd3d-08dd730e7a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ozj+l7Y9INfbOLJE4hDJbriT782mLNhm189JWBMBCraGoGozc95l2kRl8Gmc?=
 =?us-ascii?Q?rI19CQnw7TOj+syFyq664QytvKwPDysi0VaXWojlBBg2phd/L8UQZ2ciVPtP?=
 =?us-ascii?Q?ddSdXjv/IaNEYZ6/pB5UCJ3jfKauRkPg9O0LTS954YQPiqAZlCfWJ3CTNEnH?=
 =?us-ascii?Q?fiWDMzcPHpUMAEti46VuxQhiA1kRmletBjoOsIPdIJsOUnHNjqt7wBqoSq8u?=
 =?us-ascii?Q?qeFxLSUr0j4N9HPkBI8ERXkPXNz4AwheHjYJ9GXdY8eEEJ/cewVA6pDmdbgj?=
 =?us-ascii?Q?9F63kDw3g5JLRcSRa8SzypakXkKm1FJ3fJWN/ZatexvUFeRxDe+3xaOXZhoe?=
 =?us-ascii?Q?qFDpSiY8D5ykS2kobDfceURGC/dETyNHYHft89kYH32I5lMuBuFFk0GSXEj6?=
 =?us-ascii?Q?7GC6eVYOpwIQOPIWVBveqQgCDMZyvgHbWyWJdEoYlWuzySLFzNKSe3eQ7MWl?=
 =?us-ascii?Q?d8VeVgKk72hc+F7j7n5AB0+942C0+1Zg/KXM3PFuZQ7DRZMa+aHsd9jTGkCf?=
 =?us-ascii?Q?7TZI4durkl0yCZMLhTr4siYCefQDpd1DM8NvbVU1yjuRuXviCF1fhtQCZHSE?=
 =?us-ascii?Q?xuU2q9s0hygBmaxKoUEcYIBPfs1h7b54wjEhYobw6oYVKoZR9S1imlsKhlHc?=
 =?us-ascii?Q?k+tEQGTxYq2qT6l4R1HNOq3bPsPClZtq1WKBr1Bb64LSleZh68hX9n05vEld?=
 =?us-ascii?Q?wPVI1bZBpfR3VZ8bOS4zwk7XiKmiv9Eo3cTHkMpxrZXKVUoJDVcob+1RYJvS?=
 =?us-ascii?Q?3osTYWJGGsZBuClL7dittPc+ukIsT84yGVquQkDefhcToe4fPLSf0gxH/Scx?=
 =?us-ascii?Q?KDTJg87CiUaKlng1LTbVW8dd2tj2zXar/MB7PxKsQGGMC/2Ep7SMhgodYtur?=
 =?us-ascii?Q?GXo5wHuRzeSd7Mbz9WE1FeX6F2L6RY032cw7jnJVjLu8ZDFu78d5wAPfQKXq?=
 =?us-ascii?Q?vQl+al3Ct8EhXFy8m9FtYjgfz53wdloVvEOnxgXL9FCOreHHdxDV+w8XO2nK?=
 =?us-ascii?Q?wGi3B7BvDTDJcxgmoyB/rcaaUr2ae+lHKji7/4QF3I4YGzZl92yqiqOW8HUO?=
 =?us-ascii?Q?H0WD1y+n3NLeBscm4u86qYdBknE2VvEG2/XZF87j7APpHCBB8HKqao8KGJjk?=
 =?us-ascii?Q?2s02DsIGJWwkI2Espd5A3rMLqxnBGIeEyjZu52Hw3jlu/rRZN9EB9MEFZlAb?=
 =?us-ascii?Q?J+IRe5OpV9cdjd1cX8VwQ+l6ZKBczvdQty8Fk51xU2LNgQGCbUD2sS2W7ohl?=
 =?us-ascii?Q?cMEOWGQDxb72vM88ZMK4uDSDYuxmoXFKEw57G6jEVqqIz0eH1JKhLlrop9Sd?=
 =?us-ascii?Q?34F7GhFzmQph1Yt6aPPUobjQ6PV3A+tJ1cDyRH0qmsy9c0FFCgnkMBu2i+NT?=
 =?us-ascii?Q?SAkHl1jra1gAUrLfRS0wac4axaCVA5IOItdB0y0+hhjn1WOPPWNbZQEPNqFq?=
 =?us-ascii?Q?sBk8k0KrCDTxmntOys3j7iotXyt3lCRMkK7da7qlSQLdwGPhgXAjfJRQ6FCN?=
 =?us-ascii?Q?0/XKSiJe2hmHCco=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:17.3510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cf1bc1-299e-4975-dd3d-08dd730e7a4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387

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
 arch/x86/kernel/cpu/resctrl/internal.h | 14 ++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
 include/linux/resctrl.h                |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index ad4789740a33..e4b169fd6970 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -244,6 +244,20 @@ struct rdtgroup {
 	struct pseudo_lock_region	*plr;
 };
 
+/**
+ * struct mbm_cntr_cfg - assignable counter configuration
+ * @evtid:		 MBM event to which the counter is assigned. Only valid
+ *			 if @rdtgroup is not NULL.
+ * @evt_cfg:		 Event configuration value.
+ * @rdtgrp:		 resctrl group assigned to the counter. NULL if the
+ *			 counter is free.
+ */
+struct mbm_cntr_cfg {
+	enum resctrl_event_id	evtid;
+	u32			evt_cfg;
+	struct rdtgroup		*rdtgrp;
+};
+
 /* rdtgroup.flags */
 #define	RDT_DELETED		1
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 0c9d7a702b93..cb7a8a2de3ff 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4127,6 +4127,7 @@ static void __init rdtgroup_setup_default(void)
 
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
+	kfree(d->cntr_cfg);
 	bitmap_free(d->rmid_busy_llc);
 	kfree(d->mbm_total);
 	kfree(d->mbm_local);
@@ -4213,6 +4214,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
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
index 8247c33bbf5a..294b15de664e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -153,6 +153,7 @@ struct rdt_ctrl_domain {
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
  * @cqm_work_cpu:	worker CPU for CQM h/w counters
+ * @cntr_cfg:		assignable counters configuration
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
@@ -164,6 +165,7 @@ struct rdt_mon_domain {
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
 	int				cqm_work_cpu;
+	struct mbm_cntr_cfg		*cntr_cfg;
 };
 
 /**
-- 
2.34.1

