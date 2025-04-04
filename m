Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3FC1B0421;
	Fri,  4 Apr 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726060; cv=fail; b=NZf3xSK+C5bdAZsGzq4Uotj0GzrgOy7zJykWVR7F5HhPu2w69P27Ti5dhA4gT3DouB4FXSM75NZI0G79AK8QtRikw5CNyOj0YrWdCUJ0f9KGd8QllzgGuXjIDJIf3byjRkG1zwHDO6G/BpxbB/4+Dsum9AQb1xMYeOpIX6KmwYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726060; c=relaxed/simple;
	bh=CQZEw8W7JfWRCIP/fdefVtzuKftMU8/Fxce1kg0yMtY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feyPqvcOKRiW4pn2iLeGlNNvr9zVZOSFoJwcOumfThM+lIYyWJa7ULqE+nKxpsCNDjDaWqeEr996weyaZaCNQFXw88hrnG2IjK/Pofqk/HDx1+5L8DXzBY0DY31jdMp9VwnVWds7KwZba437XhAXHIyyyD89HATFGSOMxJXMPUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tFrhYknr; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tFrhYknr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dF/4Kqv0/yR5E4rhrObXtEDnP07+GRtgKumnP2geII0sxM//biXY+D+UfIw2nCa6cdfNeEZOV7ulDdfx84Tn5SHhCNfG8/bJht2kkKfFXFdBolyRLy4RvLaGayhA/gjMK5o/tJmjsKCvfFOqq87xzafAejSfE+dWAA6uG4d6LuUyfUZv0QtIBo77LGzkiYzgaNkGqwzuIyJa7CHU03LS4OcaFdEpkxrcR81qjB4Ua8emNKM2L4edSkCzDNGuWpCANW7iXcGMOCYF/WfBQP84t3iCSIiHHj0f55Ut2pXxqIE+QM7AacvM7G6PXZMYMa3BZV/ZSicwvcE6mfEgGizxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTSaufCV2gV6K7PMCx/Hr1NUyo/frQg15+BYl1d1hBQ=;
 b=RnwkTdZuCB/PUgbvlJassZ0NepxQd+vYiJCDskkE/A9hFoOQfYuYZg1GpjnTapCZhI53r/G+hZ3ihniMrZGb9PRiDsWpDaLYPnEzKtNi7mRy1O9MtbKZQheJBX9Om64ALTgBqLQP89ZSN7EOWnJcqh5zwJLiflcvFTy4mXjzZbxgehNb/MvbPX76PA/C3nTffzjZiRshTR4+Pn6I+BdOmrfe2SojEg/G+DqtuIyGnmMOlKt6A1czeJj6ttLo+diqCmpOtyav0Wx1QeeY20QbnjMNKF2eFNcviRLnGzaS+TVw7YGZttrhvcsAmB4rRJgFXe/V3Lgx2S5b/DeAr5MyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTSaufCV2gV6K7PMCx/Hr1NUyo/frQg15+BYl1d1hBQ=;
 b=tFrhYknrgNDH8wFKtB0Cjg7F6q1msRKMbxNqmd1B42ECxCp70IjG0eaWgDkApxR3yS85zo/S+dbCQErz+JnAdKAXjCHgr9ZZVSxV4QPXycT+euRfcHoljTSFuqReDAXSiA0mb60U+0kkdbr/OjaJI9/9ReEN51kfxQYXr7cyMgQ=
Received: from MW4PR03CA0218.namprd03.prod.outlook.com (2603:10b6:303:b9::13)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 00:20:55 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::ea) by MW4PR03CA0218.outlook.office365.com
 (2603:10b6:303:b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Fri,
 4 Apr 2025 00:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:54 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:51 -0500
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
Subject: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign MBM events
Date: Thu, 3 Apr 2025 19:18:23 -0500
Message-ID: <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4bbd4f-1fee-4c27-55a6-08dd730e9074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h0yyfQgLKzj5U3XHCbLR1DoAShFErx1mGaGsJh06Yg4+qYm/H5GYuuvdSVMA?=
 =?us-ascii?Q?6pPoWb3mhuxMEFGUScZR6gcTEQ0Ncb4e8YfuRjHvpjZ3U3uF5HfHDBSLyRiO?=
 =?us-ascii?Q?T2Cc9jpYP6yS5EEiUiBKRTmRnx15eXFlbNAnNNTQS+hnA/loopvgb23D47Ce?=
 =?us-ascii?Q?F3yYVimomBu3EekdWuq422rr5BNCzYzKjIK+ovt7GTqscKsgbpI58sAkbLsa?=
 =?us-ascii?Q?NaqfzwphnmZ4dlyuDIC9QiHLw1SdU5n2EgWXV1HQ7P5eGW5utQ0lScAqov4K?=
 =?us-ascii?Q?te1/jj1sh6IcVAZWC+PbvmUFLnFC/Pc+hxxpEsXUshhoJWnldTVHJUzq/BHD?=
 =?us-ascii?Q?I2bkh5DjLPuKaG2AhE8V32fv+KclNy9+ignXE0agTHh7mJfrZWqHeDEl4onJ?=
 =?us-ascii?Q?Jf/P8fvsjxCbKX0dJjOmQ6xvg1BQHOiCib+/8HsdVnd9zWvY5fIAhXq7F1gN?=
 =?us-ascii?Q?meEvY+EdCxLHNFLXd3jaYbP+YIL/wizReJQfjvnKdSJu6IJRbWUNBPQybWMs?=
 =?us-ascii?Q?cCuK3DAfcYN3hFyjRu7lItLuDuxePw2oNXhow5uIoq/kpcpeqNM6ohq6668d?=
 =?us-ascii?Q?sVPxZ9FixCDIYhY0l3vtFl1EJIKEOoXO16fO3b3Xav//2HUp1uTmNU5j1Q7D?=
 =?us-ascii?Q?tmPxDZl4mmIz9VEAu/VDX1DK5Q/dX+xfdgRqyCndDMU7QCrwvfpzqxsd3jqo?=
 =?us-ascii?Q?oa1xZqG3YLjgu5ZJ6ZdY54iSlWMuGo9jqEh5SPxZrKCYq+b42ankcavS8/qc?=
 =?us-ascii?Q?Ip3wHeJrZA40/4gScEI1xXEk5CSGWc31ZJ2eroix42ggce1PlUfhe4xbZRPE?=
 =?us-ascii?Q?/R+uWgzFhvhuiWLPzpavjYx8clmEGiF38Pwrd4nb7ZlaWWBF0sWZU9KI+ak6?=
 =?us-ascii?Q?A/wVpALIn5P+CkibWQj9f/SaAf3FsEiHsqKHK+bHgwvTixKlnJJFx630FHfa?=
 =?us-ascii?Q?xCJkeXPjhdAul+y3encV2niVrdb5+/m+yVdKmCKMBYm31Nf8u3JPPEomrKd/?=
 =?us-ascii?Q?hiKd4C4aATPtagudb8XoZ0sT/IQYoK0Zaou2VMGQzFXQ+eEK/Xecel18NfVA?=
 =?us-ascii?Q?fvKyXue9I3vLZVqA5xNN9baV3//OscfkR6ePuKDAMyaOAul+K1v1qk2VtFR7?=
 =?us-ascii?Q?p4ISX8Evil7YOJi7xbOW5l6HmmJRIA9JfG7UdD/TIjdM8X8Rz+sG7ptafhc0?=
 =?us-ascii?Q?KiXU/i6zIkW4O3oyW9G3TCuOkhke/k/kEt/RHiOaFmeAsJA79nVVVZH/0grP?=
 =?us-ascii?Q?pt+B3niJnNOO/goQZAilBvVg6QGI0x0xCChf0RrVhW6cbH75N0drs/RYLf2O?=
 =?us-ascii?Q?3PcVTpPLDm81g/wuQwT0B4oehOLY6Qjjt5nHfuVJV/wlihBODmXbXkOCVNJJ?=
 =?us-ascii?Q?aAms3DejtDcYG03GiQXKTqOjANCL05DVrXxrBIJG1iBAlkrOe6slpIErzp88?=
 =?us-ascii?Q?fL3CcO07dR5e+3hPN3haaNU37I29Sfq4DmBjj8do915X1ggqqxAzpPWwXcYo?=
 =?us-ascii?Q?HXYivjuO90wl//E5XP5RTHcwYDLQgaiqD6R+sUdz3O6vs4dBsPOBxH9WrQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:54.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4bbd4f-1fee-4c27-55a6-08dd730e9074
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
can be assigned to an RMID, event pair and monitor the bandwidth as long
as it is assigned.

Add the functionality to allocate and assign the counters to RMID, event
pair in the domain.

If all the counters are in use, the kernel will log the error message
"Unable to allocate counter in domain" in /sys/fs/resctrl/info/
last_cmd_status when a new assignment is requested. Exit on the first
failure when assigning counters across all the domains.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Fixed typo in the subjest line.
     Replaced several counters with "num_mbm_cntrs" counters.
     Changed the check in resctrl_alloc_config_cntr() to reduce the indentation.
     Fixed the handling error on first failure.
     Added domain id and event id on failure.
     Fixed the return error override.
     Added new parameter event configuration (evt_cfg) to get the event configuration
     from user space.

v11: Patch changed again quite a bit.
     Moved the functions to monitor.c.
     Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
     Refactored the resctrl_assign_cntr_event().
     Added functionality to exit on the first error during assignment.
     Simplified mbm_cntr_free().
     Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
     figure out if the counter is assigned or not.
     Updated commit message and code comments.

v10: Patch changed completely.
     Counters are managed at the domain based on the discussion.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     Reset non-architectural MBM state.
     Commit message update.

v9: Introduced new function resctrl_config_cntr to assign the counter, update
    the bitmap and reset the architectural state.
    Taken care of error handling(freeing the counter) when assignment fails.
    Moved mbm_cntr_assigned_to_domain here as it used in this patch.
    Minor text changes.

v8: Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
    Added the code to return the error if rdtgroup_assign_cntr_event fails.
    Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
    Updated typo in the comments.

v7: New patch. Moved all the FS code here.
    Merged rdtgroup_assign_cntr and rdtgroup_alloc_cntr.
    Adde new #define MBM_EVENT_ARRAY_INDEX.
---
 arch/x86/kernel/cpu/resctrl/internal.h |   2 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 0b73ec451d2c..1a8ac511241a 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
 unsigned int mon_event_config_index_get(u32 evtid);
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 77f8662dc50b..ff55a4fe044f 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1469,3 +1469,127 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return 0;
 }
+
+/*
+ * Configure the counter for the event, RMID pair for the domain. Reset the
+ * non-architectural state to clear all the event counters.
+ */
+static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			       u32 cntr_id, u32 evt_cfg, bool assign)
+{
+	struct mbm_state *m;
+	int ret;
+
+	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
+	if (ret)
+		return ret;
+
+	m = get_mbm_state(d, closid, rmid, evtid);
+	if (m)
+		memset(m, 0, sizeof(struct mbm_state));
+
+	return ret;
+}
+
+static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
+		    d->cntr_cfg[cntr_id].evtid == evtid)
+			return cntr_id;
+	}
+
+	return -ENOENT;
+}
+
+static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
+			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (!d->cntr_cfg[cntr_id].rdtgrp) {
+			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
+			d->cntr_cfg[cntr_id].evtid = evtid;
+			return cntr_id;
+		}
+	}
+
+	return -ENOSPC;
+}
+
+static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
+{
+	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
+}
+
+/*
+ * Allocate a fresh counter and configure the event if not assigned already.
+ */
+static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
+				     u32 evt_cfg)
+{
+	int cntr_id, ret = 0;
+
+	/*
+	 * No need to allocate or configure if the counter is already assigned
+	 * and the event configuration is up to date.
+	 */
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+	if (cntr_id >= 0) {
+		if (d->cntr_cfg[cntr_id].evt_cfg == evt_cfg)
+			return 0;
+
+		goto cntr_configure;
+	}
+
+	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
+	if (cntr_id <  0) {
+		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
+				    d->hdr.id);
+		return cntr_id;
+	}
+
+cntr_configure:
+	/* Update and configure the domain with the new event configuration value */
+	d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
+
+	ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
+				  cntr_id, evt_cfg, true);
+	if (ret) {
+		rdt_last_cmd_printf("Assignment of event %d failed on domain %d\n",
+				    evtid, d->hdr.id);
+		mbm_cntr_free(d, cntr_id);
+	}
+
+	return ret;
+}
+
+/*
+ * Assign a hardware counter to event @evtid of group @rdtgrp. Counter will be
+ * assigned to all the domains if @d is NULL else the counter will be assigned
+ * to @d.
+ */
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
+			      u32 evt_cfg)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list) {
+			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
+			if (ret)
+				return ret;
+		}
+	} else {
+		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
+	}
+
+	return ret;
+}
-- 
2.34.1

