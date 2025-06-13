Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835B2741CB;
	Fri, 13 Jun 2025 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848992; cv=fail; b=UW/FOfJjc3S/ZWqzn7QZeAJHpizIAvLKfv0LAj2qxtFWVjpcCb63UwFpoS6EBPmP34Ps8z+JCJYwGlWDXJa/CNSP3Dnr6t7fiHHweEQe3+DsQjcCnmw14/xKiUI3B5AOBj3/QdYFwKHLMII2mMBK/zOaA4g7ik9N1w5a7HVim1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848992; c=relaxed/simple;
	bh=o9TrNhilmmhKv01AG+6GUaAq3fDAsLk0xI5yB4bKl/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=do3QADjswbFubQbmy7nGwOxnG2Oqm0izd4JZF6kiMD2fj9TV2LNzcicrS8drrwThonDaQgCKhaSoTBmOmgjbQ2AEK8CheyEH4URi4uHvbTPbkfj4wCNMYyGFOIOzdn3OVwDcCuR28e38/wzlNKL2kdKlFpr6NLOQ+j1bwP8tIVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KQUerUy5; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KQUerUy5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF/M06YOtOGhyDvkAm+OUJ3k+izGvNt6SAAuOCalcnNRQ0mb9oRzCc1EFj7lDg0/t68TSnVjtU3oOrhXoRHOXIEM6BCwGxXtTZ2IgraitE6N5ZXexGiRtD9BJZBiUZZB5AQUgsMwOWkO+F6HsjYmOJRNwhlUcxUFMfMRt8CQpm2Gskt60N9+R1wz8b6qTTG/C/ZRd8C806AdtVUwh2hMVSJFQXh1hZZ00rkVOfQSHbxBSFyTZguI+odaOxGHkuajadp67Bk/xSm/jjnRHVq4Fuq+JRqvuybBBhJOMFFptWLfrXvsvsX3irBp13j5Hw/O5YBUInenOijbQZHZZhTygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvBKvX48qdqaObdL6gEBkO8pDRoOzoWjZjBh8RqqvMU=;
 b=C9beAyqUwqrql0wVVB4W//1CQVStV1bP5dtUNPIDAwSyn7vkNlVVRIGdj+zoucQoi+sPM0POiOh9wbbi7C8rdYNs3hwNnM5h3lp9nvGiTfcLtGGxxLQYPZZeBPoed8obkTIuZBgteJp4RgClKhY7cyMkM9/aIl9+sL4Ub3KZymyksJ0TzioJmSGaLW7cDil3CiAaHdY3Yb62kI22GOBXE3bCTU5XBzYc3rmC4yiLIm+Mv8TKS245AYZ9LcCSZLxEE873OGzmg9RnWTqraqjtq+KV/AB+mQed07ofttwzsCG4FH3Hkp5T6eCfFoua4xHcDOk9kW7RqmbyqTk5SNKNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvBKvX48qdqaObdL6gEBkO8pDRoOzoWjZjBh8RqqvMU=;
 b=KQUerUy5CJQXZn6Y2BxPiuxIL4FjF+Ba8oO2QUkDus6k/yMCa5v8eje99gFVh48iH93mUg71RT5/kB+0CMRb6URmzh00uVnWAWicmE9uxKL1EMmQkND3dMAmJ2/1fDsHtw6GHIVZ5eq41RzXqu2OLui1mTKDnHVCCZ6zrF3b/2E=
Received: from PH8PR21CA0017.namprd21.prod.outlook.com (2603:10b6:510:2ce::17)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:09:47 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::e6) by PH8PR21CA0017.outlook.office365.com
 (2603:10b6:510:2ce::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.14 via Frontend Transport; Fri,
 13 Jun 2025 21:09:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:09:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:09:44 -0500
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
Subject: [PATCH v14 32/32] x86/resctrl: Configure mbm_event mode if supported
Date: Fri, 13 Jun 2025 16:05:16 -0500
Message-ID: <d0924000e0de931f414c7cc1697919f6d3beeff9.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b1a312-49c9-4fcb-3f4f-08ddaabea0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V/dOetoXs2CCADbttw41UKEWrBiuzdSdOqgg1DRJXVwuFIGgU6Oot8pestS+?=
 =?us-ascii?Q?xPftwALbySYy4Pf/iU4+ZDYdA+yG0vAv7d4lmsUzYfb7rBszoSUzF7lY3Xi7?=
 =?us-ascii?Q?TJOQjOlOEdO1I476H6n9lXCpr0OPGE4umE+6Iu/sbFyfEGTujarSw7a9M+oV?=
 =?us-ascii?Q?+8EjooyWufm/4ZztsZ5rdpgLNXneaY7rsPqQx7ztNdDpCnej1R6EcdVI4Tib?=
 =?us-ascii?Q?m5ZQSWHgPKoHfp951oSNOk5upzBLTkP2qoFePdZ8qBnc10SMwCuRzTuv//LV?=
 =?us-ascii?Q?TjFbMR/1KvLxZ378iS9KoAH+HYgU6nnicJ8q3RynZEcwIkxKqZG7Dbb4BnL1?=
 =?us-ascii?Q?7xvOzbXlT0v42phPjOz7KnZeYx758FrVqlkhd05nbQFCodPGxmZ6/vIpzbye?=
 =?us-ascii?Q?Bg1q7vklFrqUeiah841S/aKjOU3czNGIiWOSn4G4Ey/wpK4q1qQxWtgI7rcn?=
 =?us-ascii?Q?xA7E1z8GCco7CiVvUBTZZLxM1QCGvQeiBgkW7z6qPEvr/y9OVKDNdeWNjLC6?=
 =?us-ascii?Q?CRvC22yAJ7tu1rgm1nxCTiYPmZB8vHHZ7LzZCUd3wKNV5dv7pJ05yrf2qKnQ?=
 =?us-ascii?Q?oQ6iO0ZvuCsw7B+Yi7QpECsZu+ipcQUNq7jNMIpH4OhCpsQ+DHcJu97zqpuZ?=
 =?us-ascii?Q?k3owbL9lEQS6QDuuXU8w3fzknwcATRE4VjbI8TzxSwhUVtjGkYr0KoPKdSUw?=
 =?us-ascii?Q?lYX0fgr56NKoSLpj8+ipVu0tDSFkt/orpGso9ibYSuWEG4Sy9+SjvhnAEOz/?=
 =?us-ascii?Q?DcCj9dT2nFSADlD+mRUrxP2tsOvOvdtt0gEwCQniwdZjZSNu+cqqu6kWYhne?=
 =?us-ascii?Q?TUYae+tuzm0djz5soDRD/kT6szTc2kqInxPaYatXRGYTYYZ5MU25WX41Z1Mr?=
 =?us-ascii?Q?nm0sHg7xhby/CTsZdY4TExhhggVkm/1xwSg8wKp/x1dJ9/bN3gue1Mn8Ohj8?=
 =?us-ascii?Q?wC5wsImQe6DeObirEeQ85mQLUi0NWh4fYBhZED1MISB4RMzNBwfU9M1iylKc?=
 =?us-ascii?Q?CXPQh3lPyVoSQFtZU6I2nYkPUR9XZzSexcqCwuAP2AiOvwIqQ2lsppSYs+BY?=
 =?us-ascii?Q?X5BvrCnmiyp1dQQ75y+B8/PaCyRBeFSVYGBAeugTKqeTz0Yh2PHxNEnyYwrH?=
 =?us-ascii?Q?eMts+JnbNc84HbBIMqvCvNRR6+aOWjpupSu5thpjx7GQW9wg3eJeYArHARpD?=
 =?us-ascii?Q?h8DylxwT2bruZOONkfyTuL3wPvmeyZiLyFVS4UkPaAH2jQ8pkU38T/o42qEs?=
 =?us-ascii?Q?kKpkFzhpFzFP6lIR1RvKY1EgGLrWZbG+19iOHHHu0+7Ym8oEHyyytFMInTAm?=
 =?us-ascii?Q?0I47kuk78AQb0SVHUZKxGOZP7zd0Xqw3rDEXM01HoafTmTauunt01WXbkEuA?=
 =?us-ascii?Q?/WRQShseLj3IkpmO9rs614IBZdQ4zuXzvmfSA7KU+Id4MzD3YqUY8JkZmoll?=
 =?us-ascii?Q?eREzKf++yIB3MIds9QygW244CaXZaqMHtKQq0W2mhNV7njZPL3dns0KT60XO?=
 =?us-ascii?Q?jg5r6CkCBq2pCVSHB5/jjm+Zy2Q3zSaBR14aeLmNVoVhvYkCksIB92+bMA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:09:47.3268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b1a312-49c9-4fcb-3f4f-08ddaabea0c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

Configure mbm_event mode on AMD platforms. On AMD platforms, it is
recommended to use the mbm_event mode, if supported, to prevent the
hardware from resetting counters between reads. This can result in
misleading values or display "Unavailable" if no counter is assigned
to the event.

The mbm_event mode, referred to as ABMC (Assignable Bandwidth Monitoring
Counters) on AMD, is enabled by default when supported by the system.

Update ABMC across all logical processors within the resctrl domain to
ensure proper functionality.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog to reflect the change in name of the monitor mode
     to mbm_event.

v13 : Added the call resctrl_init_evt_configuration() to setup the event
      configuration during init.
      Resolved conflicts caused by the recent FS/ARCH code restructure.

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
index 1df171d04bea..a8fda1b408c7 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -518,6 +518,9 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
 
 		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
+		/* Update the mbm_assign_mode state for the CPU if supported */
+		if (r->mon.mbm_cntr_assignable)
+			resctrl_arch_mbm_cntr_assign_set_one(r);
 		return;
 	}
 
@@ -537,6 +540,10 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	d->ci_id = ci->id;
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
+	/* Update the mbm_mbm_assign state for the CPU if supported */
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_arch_mbm_cntr_assign_set_one(r);
+
 	arch_mon_domain_online(r, d);
 
 	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 77a9ce4a8403..f03abae3a2c4 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -216,5 +216,6 @@ bool rdt_cpu_has(int flag);
 void __init intel_rdt_mbm_apply_quirk(void);
 
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 053f516a8e67..74282dab7c2b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -430,6 +430,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
 		r->mon.mbm_assign_on_mkdir = true;
+		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
 	r->mon_capable = true;
@@ -533,3 +534,10 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 			memset(am, 0, sizeof(*am));
 	}
 }
+
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	resctrl_abmc_set_one_amd(&hw_res->mbm_cntr_assign_enabled);
+}
-- 
2.34.1

