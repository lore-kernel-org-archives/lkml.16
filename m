Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F5428DF3F;
	Thu, 15 May 2025 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349807; cv=fail; b=jm7/Y8gZ59Y7q9A7/5CZGFG+FtxM+CZfLtgecPye5Qu9p2I/tIIG1xPQa86VSmY1MnAToPnRhaxL22NrFLPEaXtvXI47cZ3w84CuB9Kr6FdQ3BvPnIO3tzRrRJXPXNtG+Lore/e9fhZIuI2GS7JODu9Y5wYfVBV2l5VGuYftmVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349807; c=relaxed/simple;
	bh=yNwAjLQq5goDe+M3AD0+Cx1N8LSlbveUTd65YM1zN3A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/zLXNKlrRR8XxVn/Cmr4j/7wjTVHCGI90OWtkC+9D7TThINGFtYJi2PuRkjxSRIS3/qYjwNA9O0A6x7lOJomTxN4+SHK2CTEllbgckvlKGo1BfQ7w1bKxuACeQZp/jqE9DcG4zdLm44g+plXq+ZdS09oxtjrnbB3VISGs7E99w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gJd603u7; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gJd603u7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhdTetCwb44FnMQvUJ4S2X0dOkIKz244DTTwtXCBJTQjlF3iWGxII9ZEEQJHxZxJBm4xi01xm0l1Wf1FEH6kEluWlM2r8mPynPyfQaqGk44iJBBwW1OkUM/LbBrwj0qsUPCLhgzkTWqVKi17dAqHUgBlfe+QW36Jhc651HwKOfm5MtEH/5gYZOpELjK1vNB2qL/Ar6cRtrarlCaE04fnjllfnmLF3VaTzqCRNAzxpI4TtDu1E/8pybO2OmhSCpNdUN6ChxXf6VlsEpz/HR/R0hWI/BTskDkApcXVIdinZDa+vHI4w1Y9cTs8kVPA+cNuTSa5RpbPJ8350Rj8gw2xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvntYzuX7kmIuiyHIjwA+dmXfvvLztpMzl4BYtf0Nkw=;
 b=XnKZucXjEnrQnmae1kcePDAmuGX1MTyurUCyTCQWnryd19vVZqw2uE6x4z3fFWrI5Xu770KhsBPIlPeAsjlGsRx46vX5EeJiAhNwu6Lz/0cOippi17sHqJrvoz9tcAN5dPH9VcmhH71jsWwEAU49uVu/JI91Hx/PIx9gqfo4da+0WznTJus1L7vkt5Inb73mdRYcQYrSqyiYltpmXwn2kHwMkK3Er5kHWq5O1SRUhs4YN38JMezUo9d5R8HP0N6e7MFE1S88njAzAsGOYscIn4tnoXq/8IXHwnU+aasxIZ427SDVbCaUZTgJnYzexGOqYH5AwXR6qAdKuIQUHLMOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvntYzuX7kmIuiyHIjwA+dmXfvvLztpMzl4BYtf0Nkw=;
 b=gJd603u7wy/Px5RmNw3t36Ep3eFt5d5OC9PIswuo3V2QaCoHdYPSDHgwqLAzQj7kx9MgHWVyAC+ysf3MxcVrqEhdpHO/cyT0Ty8LcNKayi5OK62FzhIvhRLM5hqqnq6WfYzcbtYJ7ACtQH9L5Q4HuGTnjwLWgAf4kfi34fnjgMw=
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 22:56:41 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::27) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Thu,
 15 May 2025 22:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:56:40 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:56:37 -0500
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
Subject: [PATCH v13 27/27] x86/resctrl: Configure mbm_cntr_assign mode if supported
Date: Thu, 15 May 2025 17:52:12 -0500
Message-ID: <1e9785e00fe55987f8585aef8cbdedbc58e2b1ee.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SA0PR12MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccd0999-9095-49d3-9e59-08dd9403c13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6U1RGwNc2h9m+XEk+Tkn5ZfkpT79UATSvVjl7qRGAQDs6MoIvjSN03Lv844I?=
 =?us-ascii?Q?3bI/6lPsXeJvtnAtU+h8zFWH1dcWurDZaYP70fh0IGsOzGrrOvbyi0rXHjMT?=
 =?us-ascii?Q?M1qWz4jDOjZdkHo/s0qyAIWM8mxdFoy4uFZ8G9ieaVUIHSySdTIl0PozNo2k?=
 =?us-ascii?Q?5UymUnFJMCrHr7KHC+P5OopLPtiiof3aau42OGe6oOfBcGjCSete1eaJOFgf?=
 =?us-ascii?Q?Rpwcr2JGOsSwDUhtAxU4lCcvX8m72bho3cIx/Nls3bGw0idmQDiXQ018GzvC?=
 =?us-ascii?Q?gCf3R5bVhqGdFN7rmbcqoCSafs04kN9RH3ImdDHejPU4vvhLvqNAPy+vV4U1?=
 =?us-ascii?Q?gRBs7X445Id9hR0IIA1mqYx3x50fkwEW7to9NUaWNzDJnRTAs49yzsXNOEHJ?=
 =?us-ascii?Q?u03OYdYp/+6wE9g7vIxb3klBCrgT4CF1JselW7H5Hlpl5gmm8Hlia/84pew9?=
 =?us-ascii?Q?Iec+caZyLNrfZKGxtXfuw+PWqEEBXVpfwTxHCoT7qAyKuRqDXsOsVJ07HDnf?=
 =?us-ascii?Q?fiSFoQheCQ8St5I8JkoXmu6Yps8xgA22swhiBILUHpeR9xnTei4XxwGrELnm?=
 =?us-ascii?Q?G5jcFxzr6e3JUPpW6D++CNf5CQt1ZytqqKBUqCLf/aFm5anoi91s4YAUkj7M?=
 =?us-ascii?Q?HkPiomPOSCfbTObwT0njSYCaf2X7nSTVJ9g4sA6+k4n7grVZbAYQcgstLLTw?=
 =?us-ascii?Q?rb0j39E+Pvi5CiyaOxfObrUY//VvalAcpurlgcJMIBfNhBa22ns9CjLWQz5b?=
 =?us-ascii?Q?UjsxNsk7t0rN6I56yl39d+D18CalA9Q66WAL2ps8Bu/8j9fl80lIlrFdPUe3?=
 =?us-ascii?Q?d++WPoRYWWch5d3yBFK2IoxVLyHiHjkCMSEuGRDUo/Mp6sKh7Koky1jZnpGd?=
 =?us-ascii?Q?OeIknk5mt0++Kv+YZ7sOTmx0FwgoDf9CL8nFhx3mUG4HzT56xtJ8hv74fZUg?=
 =?us-ascii?Q?OikM2KTJRTBUp6rb+QlKFnaXkJrB7z3dZxjAMpbwByfLG8Q08fOsuy0Q6BWq?=
 =?us-ascii?Q?kcIG1ynRPrOk5m6FvH+dyXaP0mjyhkx6hmrlIFOuqg26AUJ4bVYYw3zMYQLe?=
 =?us-ascii?Q?2Int1ANH7FStkrxA9x3hUgrqW9pvjRk/fiSjMzbly0/hjS3PMpHw+r/zv38v?=
 =?us-ascii?Q?Xlrt6S9eolAJSQi3Z8QeK3LorX2EP9Y1CWjjRE9pBMyLZkc0RmXzShsh8wq1?=
 =?us-ascii?Q?6QEfNIK86nRo2RFPau3zJbi1SWnh7u6otu65CyDlfBItd1c19ZIjnHYEhLqu?=
 =?us-ascii?Q?l3T7mmFUBjaBqUuRafggCbvZadeSo/TeWscVy60Xa7lyHpsKxHyrW7McB8qj?=
 =?us-ascii?Q?BoB7tNeVblK1lbBFs0kolijWbafGBTvYS4KLQ3TzysdEhMz5daud0LrAA7AE?=
 =?us-ascii?Q?QaWkGx0apl7QIVa5MUlFTfyFbe25X8oY2XedxHwQJanGr/YEYT+3SVRN5Euq?=
 =?us-ascii?Q?FrRQfQrpV/PJJbXGw/+IIQ54lF892k8A8dPs4HbiilJF1rxK1LVzNdo7+Os+?=
 =?us-ascii?Q?oZs8UdF31s5PCHoW5l7qQ6gziGquibMqHb+i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:56:40.3773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccd0999-9095-49d3-9e59-08dd9403c13b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368

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
index 6859566398d6..b59f5db96016 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -514,6 +514,9 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
 
 		cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
+		/* Update the mbm_cntr_assign state for the CPU if supported */
+		if (r->mon.mbm_cntr_assignable)
+			resctrl_arch_mbm_cntr_assign_set_one(r);
 		return;
 	}
 
@@ -532,6 +535,10 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 	}
 	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
 
+	/* Update the mbm_cntr_assign state for the CPU if supported */
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_arch_mbm_cntr_assign_set_one(r);
+
 	arch_mon_domain_online(r, d);
 
 	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 3b0cdb5520c7..85ebf60a9f1c 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -214,5 +214,6 @@ bool rdt_cpu_has(int flag);
 void __init intel_rdt_mbm_apply_quirk(void);
 
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c3e15f4de0b4..51a99b8e69d6 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -436,6 +436,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
 		r->mon.mbm_assign_on_mkdir = true;
+		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
 	r->mon_capable = true;
@@ -536,3 +537,10 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
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

