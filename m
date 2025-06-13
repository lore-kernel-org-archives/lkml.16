Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42EC27146E;
	Fri, 13 Jun 2025 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848778; cv=fail; b=uMIubQ4PY7+75J0Ep47YfuvjzAsme+jJ+NRp//JxaAw6BNb0sPEBedVuizSWvedkFi6ZcVL/eJQ7pBgRgK3uXWebZFshNv3/mwtJPiA/drStZ09zaNPoGo/3+OZVGu2euS1IsryPU8ynh77fdVYgl3wxtBpDdekB83etzgpwzcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848778; c=relaxed/simple;
	bh=Jd8t5ZMKBzbcU0rMbKC0yT8Nxo0IM8vNIVU4usZPjZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2+oC3ACIGL1brDbFibiKFKRUb8LTsWUG3JjBdFEVfmei5fKeF+0rZPBkEbILq4ZQ9wGZwxcZvA9Oj1mqvcmvmQLaONDMzcQpOIgi7Ncw5+VRogkf4Z7K1Kffkq3qCRyEDZkoxAh25KP1aTlWpo0feEiiwYjCPPJVPjDsCjAHuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5WNHKCLi; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5WNHKCLi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiezmWf1DYpzMgq58eQtk+Pp9jvOWauY2V06izIKAjegxnLK/iYebkXDQUulFThXW2Ge5SCsTFNKkiUMJTQn3Z3Gb0kS9RtlrSD8PaHOZCsvz8XX8qBvqaGBajLl2/s4ije7d3PxcUgACzxtUwu0udO0HgTnrlon4N8pI3lfcNNNhlsB3gTg29yol3MGxb84oAMB1qJTA821rE4yFvRZIZk84ekglCllSTidRUYBWc1nzczE7PxEtnKApWdeoioekqndWtG0L0J1dqBTcS7aAHzM7pG78/ytdtqnM7mzxfhGGPr/GkLl7wwwj3OOeLeUY+YcYitbTnNpem+wEIvzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtNYv2aQ7/Ns5PymFf5g2ESmYK+bKmN7RjZ1vgPwrvc=;
 b=TG+Hih0JcWBTpbt3Lh8ckZoj4db2mIaTCLlyUpxYTYxXSuL2yA/FNZC+ifUcm2IbRjNgMFNLhKhHX0JIvyPIaveP8OaoXEKXG+IaeIZdux+2vI1V9N/enNxcE99Jn0hNuU16jAeV1Jc9aKrEh+udeE4DH3DQNB8DPUIjvkx1LDOPzUSvgUcJfKi7eyRL+eozkP2xwzS8sW+s8WgsWE49ofh5bkE0qFXm07s6/6mlijKXZAWOUhm3Pk2SOZCZZ2k3I6a2OfShKiGBuUa4lux9Bxa91I1jcyC5l1BKafnTKClHxbyDm5Bk/Nyk3Z3/89wpCXoObQMbAHxrYXsrm3WEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtNYv2aQ7/Ns5PymFf5g2ESmYK+bKmN7RjZ1vgPwrvc=;
 b=5WNHKCLiql4fuhyyNcswNZxjMlmwFPiYclM3qn0RHcujBVAcHDB5i1Kteg24AV8Cm6RDviPUzZncLziI4Beppz1KseV/ymjsICGWMBVZioCr0Pg09tnkevPQgwtK12HezDVHi0dRatPqQdcBgTo6qR7T5U7z9QbSGoDjhqoqt4w=
Received: from BY5PR17CA0015.namprd17.prod.outlook.com (2603:10b6:a03:1b8::28)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 21:06:13 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::af) by BY5PR17CA0015.outlook.office365.com
 (2603:10b6:a03:1b8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 13 Jun 2025 21:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:11 -0500
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
Subject: [PATCH v14 05/32] x86,fs/resctrl: Prepare for more monitor events
Date: Fri, 13 Jun 2025 16:04:49 -0500
Message-ID: <d68c3abf7cd91381a0d8f75f562da149ddf44011.1749848714.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: ec667f86-59e1-4f0e-662d-08ddaabe212e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9byxxku94wYwoDVOz0WuBSQc7n1O7lBKH8YNxoYjEl873RrGIX1yDbh4CsKr?=
 =?us-ascii?Q?tfkQOoIKZN537h2ovIo5laxqsvi7x8cl+2FjoyAtS8yPAekg4xKUZx5F6S2w?=
 =?us-ascii?Q?1RlMlwjHlVLViFaJKeNayeUTRSAeMB019Ec1CWXvB1EgCbFaTLEtpMSXbnRJ?=
 =?us-ascii?Q?rfAa33CNvWBE/1zeazgY7XEMFRBzQCjdeiKc8yn4N0Ygk8DnmKAXLUEu+q0R?=
 =?us-ascii?Q?UpIynkgOhLockezJ6l2EKhBok6dVbxnXaYHYAyFMZrB7LQwuY4wkjHMCoEqO?=
 =?us-ascii?Q?Y+CXJ/lzZgKuQZ2DlG0WGzVeNJxDyVHACsmTxsxHvQDdZHn/5nsAWkBFjGFY?=
 =?us-ascii?Q?aOW4v2x2cdlU2u6b80nk4JxBHS7jMtxQL9nL8fLazsKMAVmYVJI+41p5IE/W?=
 =?us-ascii?Q?MYSTq74wUAIr2PbRcDFzVRFYHOUJ8nvkaCaq4mcwCuO12idIipknoPtZzEOX?=
 =?us-ascii?Q?KW0cCeFd7cNghzprOG0UvaxQ1F7HbCxZkS93/T0lb6wsQBHh/o9Lxn3SxiXS?=
 =?us-ascii?Q?dXVKGRYJvUAR8uBQwGYCn8IwugIEbqHtxLRMZ9n3ZG/rHX4QvTdB6AyZxE8w?=
 =?us-ascii?Q?60YSEaORoF9jarSdEPuTxejE5mgI29laKdcv9PE3Xbr7SqzfQgeZb0FyUTzn?=
 =?us-ascii?Q?eYJ3/YxF92fuMZX7oONK4d8ZoNUaz61p4eL8UDHHcFc6Z6pJBe+vmXRd32Pw?=
 =?us-ascii?Q?tM3NOtTN27RcDeAr28KEqEsxwZ7ATQmAvT8T3QgQIdmElreA9M1ca7FgZSPx?=
 =?us-ascii?Q?wGIUYlcnC3w7mO/kQV9c4AyJNRz41KdTI8hlQWcN9zEL1NEalbiwaOBHpX4m?=
 =?us-ascii?Q?DDitW2OwC0vWXccTG8M6ePIBGUh9pvGUb3072W5U+Y1N8JaPu3AwdQ6ZvJBs?=
 =?us-ascii?Q?gsJUEpkcviV5urjV3OlBdzXqq6okbTjtnYbgszpDW8hcGQRYF0WbTvZccS5U?=
 =?us-ascii?Q?6ohAGloO+lEhcd2q2GshyCM5XHQo7CV4dFigXoMtF40Ju0iqd240y0vdP33D?=
 =?us-ascii?Q?kmFcuIfInmtjnjzoYVdGoeOQxVxZ0lheyuadv8/blrgcJwQMY3QfPP2krpc3?=
 =?us-ascii?Q?S3jBR5rUMi38wVqwovdPqNhdLa6DR5GMvaF/AlbP7sfWBvqI98RROfaXsSvV?=
 =?us-ascii?Q?SvAIdOElIE7JykVgR3XKwinNtjNCqQq1iJ/EVwIflyUOk7nsjRvlZ19wNRZQ?=
 =?us-ascii?Q?xTcHzOlZM4oSiJ8E1A+rfW/DKDEHPO5g/DxgVSQ//DXCFAlf/B4Pkpr4XBro?=
 =?us-ascii?Q?hKgO8AXOpdhvHV8E+bv2bYp9E/n9AKIGzQptFDrJgGXBe4P6fxBiE37qfsL5?=
 =?us-ascii?Q?Hsm9tgCuHD7KPVxhcWYUNgeItmuaPXkfaMav5aWSZflaQGQC8eTZrABdoqiE?=
 =?us-ascii?Q?YY05XjD4YjVQFvb3CM3t1FZ3VdO2mzKysAwRSwc3djksv3jbJBESe4AbeBp0?=
 =?us-ascii?Q?tChDJwToar0KJxjAvPa6PuJH2ksLHH2cjB0YhKhojPOh/bLKykm6AwVcT/CO?=
 =?us-ascii?Q?+fvUt2Xt0Qmj/f2hblJC2L080QdqLMfDnaeD/vNn4jYNI+580MdvxIeTF+Jn?=
 =?us-ascii?Q?pogOErRx23vE8vsTR1U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:13.2672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec667f86-59e1-4f0e-662d-08ddaabe212e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644

From: Tony Luck <tony.luck@intel.com>

There's a rule in computer programming that objects appear zero,
once, or many times. So code accordingly.

There are two MBM events and resctrl is coded with a lot of

        if (local)
                do one thing
        if (total)
                do a different thing

Change the rdt_mon_domain and rdt_hw_mon_domain structures to hold arrays
of pointers to per event data instead of explicit fields for total and
local bandwidth.

Simplify by coding for many events using loops on which are enabled.

Move resctrl_is_mbm_event() to <linux/resctrl.h> so it can be used more
widely. Also provide a for_each_mbm_event_id() helper macro.

Cleanup variable names in functions touched to consistently use
"eventid" for those with type enum resctrl_event_id.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v14: This is Tony's work. This is part of Tony's telemetry series.
     https://lore.kernel.org/lkml/20250521225049.132551-1-tony.luck@intel.com/

     Tony made special update for me to include in this series.
     https://lore.kernel.org/lkml/20250609162139.91651-1-tony.luck@intel.com/.
---
 arch/x86/kernel/cpu/resctrl/core.c     | 38 ++++++++++----------
 arch/x86/kernel/cpu/resctrl/internal.h |  9 ++---
 arch/x86/kernel/cpu/resctrl/monitor.c  | 36 +++++++++----------
 fs/resctrl/monitor.c                   | 13 ++++---
 fs/resctrl/rdtgroup.c                  | 48 ++++++++++++--------------
 include/linux/resctrl.h                | 18 +++++++---
 include/linux/resctrl_types.h          |  3 ++
 7 files changed, 88 insertions(+), 77 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 5d14f9a14eda..6bf2103aac27 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -365,8 +365,8 @@ static void ctrl_domain_free(struct rdt_hw_ctrl_domain *hw_dom)
 
 static void mon_domain_free(struct rdt_hw_mon_domain *hw_dom)
 {
-	kfree(hw_dom->arch_mbm_total);
-	kfree(hw_dom->arch_mbm_local);
+	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++)
+		kfree(hw_dom->arch_mbm_states[i]);
 	kfree(hw_dom);
 }
 
@@ -400,25 +400,27 @@ static int domain_setup_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *
  */
 static int arch_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_mon_domain *hw_dom)
 {
-	size_t tsize;
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		tsize = sizeof(*hw_dom->arch_mbm_total);
-		hw_dom->arch_mbm_total = kcalloc(num_rmid, tsize, GFP_KERNEL);
-		if (!hw_dom->arch_mbm_total)
-			return -ENOMEM;
-	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		tsize = sizeof(*hw_dom->arch_mbm_local);
-		hw_dom->arch_mbm_local = kcalloc(num_rmid, tsize, GFP_KERNEL);
-		if (!hw_dom->arch_mbm_local) {
-			kfree(hw_dom->arch_mbm_total);
-			hw_dom->arch_mbm_total = NULL;
-			return -ENOMEM;
-		}
+	size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
+	enum resctrl_event_id eventid;
+	int idx;
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		hw_dom->arch_mbm_states[idx] = kcalloc(num_rmid, tsize, GFP_KERNEL);
+		if (!hw_dom->arch_mbm_states[idx])
+			goto cleanup;
 	}
 
 	return 0;
+cleanup:
+	while (--idx >= 0) {
+		kfree(hw_dom->arch_mbm_states[idx]);
+		hw_dom->arch_mbm_states[idx] = NULL;
+	}
+
+	return -ENOMEM;
 }
 
 static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 5e3c41b36437..44ef0d94131e 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -54,15 +54,16 @@ struct rdt_hw_ctrl_domain {
  * struct rdt_hw_mon_domain - Arch private attributes of a set of CPUs that share
  *			      a resource for a monitor function
  * @d_resctrl:	Properties exposed to the resctrl file system
- * @arch_mbm_total:	arch private state for MBM total bandwidth
- * @arch_mbm_local:	arch private state for MBM local bandwidth
+ * @arch_mbm_states:	arch private state for each MBM event
+ * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
+ *			An MBM event's state is an array of struct arch_mbm_state
+ *			indexed by RMID on x86 or combined CLOSID, RMID on Arm.
  *
  * Members of this structure are accessed via helpers that provide abstraction.
  */
 struct rdt_hw_mon_domain {
 	struct rdt_mon_domain		d_resctrl;
-	struct arch_mbm_state		*arch_mbm_total;
-	struct arch_mbm_state		*arch_mbm_local;
+	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 07f8ab097cbe..0add57b29a4d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -161,18 +161,14 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
 						 u32 rmid,
 						 enum resctrl_event_id eventid)
 {
-	switch (eventid) {
-	case QOS_L3_OCCUP_EVENT_ID:
-		return NULL;
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		return &hw_dom->arch_mbm_total[rmid];
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-		return &hw_dom->arch_mbm_local[rmid];
-	default:
-		/* Never expect to get here */
-		WARN_ON_ONCE(1);
+	struct arch_mbm_state *state;
+
+	if (!resctrl_is_mbm_event(eventid))
 		return NULL;
-	}
+
+	state = hw_dom->arch_mbm_states[MBM_STATE_IDX(eventid)];
+
+	return state ? &state[rmid] : NULL;
 }
 
 void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
@@ -201,14 +197,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
 {
 	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		memset(hw_dom->arch_mbm_total, 0,
-		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
-
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		memset(hw_dom->arch_mbm_local, 0,
-		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
+	enum resctrl_event_id eventid;
+	int idx;
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		memset(hw_dom->arch_mbm_states[idx], 0,
+		       sizeof(struct arch_mbm_state) * r->num_rmid);
+	}
 }
 
 static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 9e988b2c1a22..dcc6c00eb362 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -346,15 +346,14 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
 				       u32 rmid, enum resctrl_event_id evtid)
 {
 	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
+	struct mbm_state *state;
 
-	switch (evtid) {
-	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		return &d->mbm_total[idx];
-	case QOS_L3_MBM_LOCAL_EVENT_ID:
-		return &d->mbm_local[idx];
-	default:
+	if (!resctrl_is_mbm_event(evtid))
 		return NULL;
-	}
+
+	state = d->mbm_states[MBM_STATE_IDX(evtid)];
+
+	return state ? &state[idx] : NULL;
 }
 
 static int __mon_event_count(u32 closid, u32 rmid, struct rmid_read *rr)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a7eeb33501da..bd6718f0ffd6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -127,12 +127,6 @@ static bool resctrl_is_mbm_enabled(void)
 		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
 }
 
-static bool resctrl_is_mbm_event(int e)
-{
-	return (e >= QOS_L3_MBM_TOTAL_EVENT_ID &&
-		e <= QOS_L3_MBM_LOCAL_EVENT_ID);
-}
-
 /*
  * Trivial allocator for CLOSIDs. Use BITMAP APIs to manipulate a bitmap
  * of free CLOSIDs.
@@ -4024,8 +4018,10 @@ static void rdtgroup_setup_default(void)
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
 	bitmap_free(d->rmid_busy_llc);
-	kfree(d->mbm_total);
-	kfree(d->mbm_local);
+	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++) {
+		kfree(d->mbm_states[i]);
+		d->mbm_states[i] = NULL;
+	}
 }
 
 void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d)
@@ -4085,32 +4081,34 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
 static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain *d)
 {
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
-	size_t tsize;
+	size_t tsize = sizeof(*d->mbm_states[0]);
+	enum resctrl_event_id eventid;
+	int idx;
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
 		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
-		tsize = sizeof(*d->mbm_total);
-		d->mbm_total = kcalloc(idx_limit, tsize, GFP_KERNEL);
-		if (!d->mbm_total) {
-			bitmap_free(d->rmid_busy_llc);
-			return -ENOMEM;
-		}
-	}
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
-		tsize = sizeof(*d->mbm_local);
-		d->mbm_local = kcalloc(idx_limit, tsize, GFP_KERNEL);
-		if (!d->mbm_local) {
-			bitmap_free(d->rmid_busy_llc);
-			kfree(d->mbm_total);
-			return -ENOMEM;
-		}
+
+	for_each_mbm_event_id(eventid) {
+		if (!resctrl_is_mon_event_enabled(eventid))
+			continue;
+		idx = MBM_STATE_IDX(eventid);
+		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
+		if (!d->mbm_states[idx])
+			goto cleanup;
 	}
 
 	return 0;
+cleanup:
+	bitmap_free(d->rmid_busy_llc);
+	while (--idx >= 0) {
+		kfree(d->mbm_states[idx]);
+		d->mbm_states[idx] = NULL;
+	}
+
+	return -ENOMEM;
 }
 
 int resctrl_online_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 40aba6b5d4f0..bbe57eff962b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -161,8 +161,9 @@ struct rdt_ctrl_domain {
  * @hdr:		common header for different domain types
  * @ci_id:		cache info id for this domain
  * @rmid_busy_llc:	bitmap of which limbo RMIDs are above threshold
- * @mbm_total:		saved state for MBM total bandwidth
- * @mbm_local:		saved state for MBM local bandwidth
+ * @mbm_states:		Per-event pointer to the MBM event's saved state.
+ *			An MBM event's state is an array of struct mbm_state
+ *			indexed by RMID on x86 or combined CLOSID, RMID on Arm.
  * @mbm_over:		worker to periodically read MBM h/w counters
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
@@ -172,8 +173,7 @@ struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
 	unsigned int			ci_id;
 	unsigned long			*rmid_busy_llc;
-	struct mbm_state		*mbm_total;
-	struct mbm_state		*mbm_local;
+	struct mbm_state		*mbm_states[QOS_NUM_L3_MBM_EVENTS];
 	struct delayed_work		mbm_over;
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
@@ -376,6 +376,16 @@ bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid);
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
+static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
+{
+	return (eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
+		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
+#define for_each_mbm_event_id(eventid)				\
+	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
+	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
+
 /**
  * resctrl_arch_mon_event_config_write() - Write the config for an event.
  * @config_info: struct resctrl_mon_config_info describing the resource, domain
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 2dadbc54e4b3..d98351663c2c 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -51,4 +51,7 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
+#define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
+#define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1

