Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B91EB5E8;
	Fri,  4 Apr 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726174; cv=fail; b=da5mzc8Uk7RTOcBxf2WrJm9F1SC72eTWWjZwSPRrIYpX7C86tr7NtN1S+4s2G2uAK6a7jIYZDwloUZS3edAYqXTIlaMZHGIAZuVv8xBup2w+4t87x4EsVzj0VAy+z0GTFR5ZSOT/PQAvNj/ZZ5kD02/9YaQmOohz6oGFHIBU41E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726174; c=relaxed/simple;
	bh=rudjZrGx3ioqghf/j72OXW+LIIgUb7u6/sRuHpgXY3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqDjA5jV408fXxEmV8z7SiRbUAd1px3Tt+WfOAbZfL9C3T7zlTWm22fPzkJR9kS4QiOIuVwFVfTMqrBJiPe6HUElc8j/qFQVDz0OA83EU14kCvV9bHwmwOoJje9sfKQ2MtGvIkd7BeHWbkvbzqpXPsr+VUCBv2dCi+uYIhrIrcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D/KcGxSi; arc=fail smtp.client-ip=40.107.102.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D/KcGxSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+ylwOTUIkttRneG2dC7zPwPpXPn76wwxONxapZVYSfZKcb/wMQzfaEc4EO6VpbrNJYml/oAV95fkYXxTUUusTa5xcASuzFl+JbgjsUqkD4aVNxem4da66JKAianhIt1PcIYNS0arrhlEx+8aFV9jj6tc3A/t10b6FDxXWdpwJMuAigehenndATvlOv1RnOH/3ntx/b1N1MffQF32EPb/U5ovKoVU1GjOPFdhwhetYp7nGJZ+WUBrNjf/eoDRJaa6uaAEmXaf2FXPutYwhpA+RNi1qlg0nucw9I1H8yw0iWEjshc8OlCDMmRzR5Np8bxpqSi+bw+kJAgx1a13EDf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWXcEOM5DHXx3yGzloXT0f2xm1Z0s6i8szhOd/ZF0H8=;
 b=HrNN2ZVugTr60++uEgPofhUbb7jsL13HOZ9aH59Pt2XzLWB5nPiqk6wZi22yz0HF4zKlXnAmOqatQSM5zCHexeqGzyfNPI5ZK0UqafoVQEX5py/gHjyx/dr3/j6AJnYi9TPWCZ7ixK67TAzGqe5sclMqsrECWfyK1vhzdfx1EY5vSo8O9XmjDAo1CGBTb8Ks14iVgXKRnxnJjbjo9MOY/E1o/n9DLnoA9YyqC+qg5Ud6NuQ+bmRM0+hPL8bT972DTFlHhBr6gWqTl1FXcyE9keoQqn15raPvDd0dUOPndpZmwUUTv8l8bcin2FWvYKPYPweOgRjVu5tR99EU0TKrSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWXcEOM5DHXx3yGzloXT0f2xm1Z0s6i8szhOd/ZF0H8=;
 b=D/KcGxSiTKc8xg3gKbyHKGuiwDfYMZRpd9fT7Wz6H8mxncu9ZBxvU+9KZ18KqACF/4VTpi0H8xhkzq8aX/Ek/YqwhwfnUmUEw/GENZM9tPQpH+bl0tGWZLiTxSKP5YxAg0eT/WaY3D/Cu20I0ZdIc5IPge99dwd+8dY6Vt92HUg=
Received: from CY5PR20CA0019.namprd20.prod.outlook.com (2603:10b6:930:3::12)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 00:22:47 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::67) by CY5PR20CA0019.outlook.office365.com
 (2603:10b6:930:3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:22:46 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:22:43 -0500
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
Subject: [PATCH v12 26/26] x86/resctrl: Configure mbm_cntr_assign mode if supported
Date: Thu, 3 Apr 2025 19:18:35 -0500
Message-ID: <b8497f8a3008b0f6ded7c3f5d8148ee4d12f9c14.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|PH7PR12MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d72bce1-7041-4eef-2f98-08dd730ed339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fP8tC3+FYS16i0YBvCdTsARiQ3000cGlXjMdI3bayiWjW+OFS1anKcMKEUMX?=
 =?us-ascii?Q?1WTGIVrI0MkvNsI9hHpEGvNv2J+LbTYVe+/A9cXeJJNpFFsJYXJMV+C++S/h?=
 =?us-ascii?Q?bL45BLE0tR3jdppAEpg8b7bc04CkPrVvNUVPnbIxG298NcN2yH9MtjvaV2Pn?=
 =?us-ascii?Q?PVSYfsIBHZGu0ws6VeW5VGgHVmeQeQRa9QOe13zPMwN/ZgLhKGUJ8k3tObY+?=
 =?us-ascii?Q?s/TSxERxh6wI1fNvpBSArOm+41tfN0sXF8wn0Unu/7KpPQCSBjPaATwqxfuP?=
 =?us-ascii?Q?dYuFG62ZKxOHWpijMdLMXKKWDyAuZw5wZ6eumBcEMbAN9GyRQZhcl26vKc4I?=
 =?us-ascii?Q?uEY40W5jHZAbwusX0uE0HV9fQ+HeTgOfh8xVpwQk9f8NUTlYLeXlLoWiz5Rm?=
 =?us-ascii?Q?upqlFmA66U0Xv9Xd3tFGeGlfzIcWTSXmrp/S5LnIz5WNQMtqYLG7cKDk0B6l?=
 =?us-ascii?Q?lK83vx4zKgydM11TZnPu7ZJ015IU+KKrmrvXfEWnAV3d7jeHZNMHeG74qG3x?=
 =?us-ascii?Q?E7XzDgHiMymnZuQE0ognTXF3tl1IbV2ceZVVy3BW33tJVNX1jUXIePj9CIdV?=
 =?us-ascii?Q?u5q93/3v6lx3oQF2GB5bPYH2g/iPaAA/61np8E9NeoR+zJnhtg7jUW2HI/wO?=
 =?us-ascii?Q?t1MUsn61/iJUimrhrCpoDf/pPvMg6sNMrnGvMJW6P80O3BJk7eg0o8dh1UPp?=
 =?us-ascii?Q?y2CxcZmPMwfqNa0TKx12983UCnrNW3NImsaS7NntbT6Yp9mIjh+/ezQW1+A5?=
 =?us-ascii?Q?yj4bkg++wfVZjvC5GeMpTladqFAVoQqAQRJ9XtY3bqkQg1jIgyiAMfE8kFfK?=
 =?us-ascii?Q?6nH2w/LqjQ9T2tWadw3tHrhEIhamK1saPWtuQZhSl/+R0udSRACe50ppvCPt?=
 =?us-ascii?Q?G5qJyDJFYxVK/NQ7Ux36rJPNIbciklxPDoSuXCHUmdaEplxrL6jIGbmY8Hmq?=
 =?us-ascii?Q?/cf0iEyxx+U24rnoYpJasX5wJV/IWj32EVt97vBNJsfZcx6SHVKt/qgLWjsl?=
 =?us-ascii?Q?2fBXSB2AOt/g2OJGkDueNn8sNwykUBjdN2sv2bph80MStHElTvp17g+rTEEV?=
 =?us-ascii?Q?GmPUnqwFQOX3P5KZobQIzw4xBu8FY5l/E1zmf0zAwarK27mb7T+CGG86lRZr?=
 =?us-ascii?Q?ad8Y52fQgUCHsWMSxCrZdZ5639jCFXYIIVSl3qv0WnjLoTG2kdde965rl0UP?=
 =?us-ascii?Q?aEMG0BUu5nzatFO021lu+8ilJjLsw193y+C4M1sGHfOH7Kx5uZdLtYwardXd?=
 =?us-ascii?Q?f+CJy/OvdicjF696g6pmk6BMV0P8qczLEhXMVbYbU/wOp/VvPfmd/M7FK46j?=
 =?us-ascii?Q?EF+nDpXmlTSN4qO7Br8EgK8AxYwTDhd/FmjiVnxPFAX3RNfFsrlpa+rz1gW1?=
 =?us-ascii?Q?aHBn26XjABtzInVmlW7UvDdjrvkd8TOI+T/yRVq2dK1v8UCb+Zizx1U21wWM?=
 =?us-ascii?Q?yj3oR/MWG+17L9NJHLWKfLVXQMmLAKT1Ma4BzUNc3qVyEM1P+AUoaA7Zb8Zz?=
 =?us-ascii?Q?LBc4W5v5GiE1/Rk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:22:46.5392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d72bce1-7041-4eef-2f98-08dd730ed339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

Configure mbm_cntr_assign mode on AMD platforms. On AMD platforms, it is
recommended to use the mbm_cntr_assign mode, if supported, to prevent the
hardware from resetting counters between reads. This can result in
misleading values or display "Unavailable" if no counter is assigned to
the event.

The mbm_cntr_assign mode, referred to as ABMC (Assignable Bandwidth
Monitoring Counters) on AMD, is enabled by default when supported by the
system.

Update ABMC across all logical processors within the resctrl domain to
ensure proper functionality.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Moved the resctrl_arch_mbm_cntr_assign_set_one to domain_add_cpu_mon().
     Updated the commit log.

v11: Commit text in imperative tone. Added few more details.
     Moved resctrl_arch_mbm_cntr_assign_set_one() to monitor.c.

v10: Commit text in imperative tone.

v9: Minor code change due to merge. Actual code did not change.

v8: Renamed resctrl_arch_mbm_cntr_assign_configure to
        resctrl_arch_mbm_cntr_assign_set_one.
    Adde r->mon_capable check.
    Commit message update.

v7: Introduced resctrl_arch_mbm_cntr_assign_configure() to configure.
    Moved the default settings to rdt_get_mon_l3_config(). It should be
    done before the hotplug handler is called. It cannot be done at
    rdtgroup_init().

v6: Keeping the default enablement in arch init code for now.
     This may need some discussion.
     Renamed resctrl_arch_configure_abmc to resctrl_arch_mbm_cntr_assign_configure.

v5: New patch to enable ABMC by default.
---
 arch/x86/kernel/cpu/resctrl/core.c     | 7 +++++++
 arch/x86/kernel/cpu/resctrl/internal.h | 1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 16f700c2d00d..4f21196bbeb7 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -533,6 +533,9 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
 
 		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
+		/* Update the mbm_cntr_assign state for the CPU if supported */
+		if (r->mon.mbm_cntr_assignable)
+			resctrl_arch_mbm_cntr_assign_set_one(r);
 		return;
 	}
 
@@ -551,6 +554,10 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	}
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
+	/* Update the mbm_cntr_assign state for the CPU if supported */
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_arch_mbm_cntr_assign_set_one(r);
+
 	arch_mon_domain_online(r, d);
 
 	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 2f3a5d78d153..72b4a9334c2b 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -601,6 +601,7 @@ int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
 		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 7f2e1fdfa936..137c76dda875 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1329,6 +1329,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
 		r->mon.mbm_assign_on_mkdir = true;
+		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
 	r->mon_capable = true;
@@ -1445,6 +1446,13 @@ static void resctrl_abmc_set_one_amd(void *arg)
 		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
 }
 
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	resctrl_abmc_set_one_amd(&hw_res->mbm_cntr_assign_enabled);
+}
+
 /*
  * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
  * associated with all monitor domains.
-- 
2.34.1

