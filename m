Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5F619F10A;
	Fri,  4 Apr 2025 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726000; cv=fail; b=ok5659em+Bz9GI+w0Sk+5nw7PGamxkwE96g2Xei58HR/pzVjzHy+tTo3PPrGyzx4XvaaLaAcz3PYZItlyDG9yInpwYmtaR2OtFuJbF+2/kbo5fPIt3c84Q6RGNMGQmx46AUUcN/ZhXWskMNM46x7N+RlklUP6kknOQ68ptRhxZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726000; c=relaxed/simple;
	bh=q3Wy5IgQKiV5JYRADxtqAVUECo+md+kcVSNLCQoVbo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a33R9Em39ks+cgCfAgES3nyj+ELQuKVAGtFbMkxEt1oURHy8ExSgr4KCJ1kTaL7KiRwjXXsHwoGErwEN0qqR6N/levrsjU/pNP7c9LaHU3hIE8EMUMFdoufYQKhN6TB7LrXl/+DtkQsfqAjbHAMN21oe3/HFwWAGIpqyiBlHnBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IT7hVh+z; arc=fail smtp.client-ip=40.107.95.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IT7hVh+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2OfWIwSmsSeQ78BpDO+xDpuhC9zI6+f9zBkdMKZgVTj6KYc9xUBvVu5+XlXIsZgXu71UA4RTc8dDBxWlqqYz2S/ViTnZ72L8sQdlOWRgYMJ3dEItGirWnkL6SKMqF8M2JBUum1nmFMOHTL22qXB2anK/eye8OA6BUE6fqDTWMGB6uEOAHDEQJL+A/puiMG6h70AhNLQCAWuFnAEL5d3+rGW6WQVikrJHYm5OFpafoXBBg2mXlLQjlM1WG1Fd1ZYvjiBTlv8qn/c/00+39BqzAbPORJ/M7ngnqFwBbvU0gJ4eMOAfaiBgQH6VR6rzBYlk7XPQJGRem9Nm6efZuNWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBXzgpGLEyTtUknvTaisPi1VpMUnQDCq7rnQ2CV8MmE=;
 b=yLdQKEpk2qOjGrhUUqSqTW2VccRTM2vJ17nu6ETurvbGTZHLiQVr3awAglbgXknhzRtEMREgmk+aP8Tjd03S6dXJkafBLs4+++tDuHhwf5GQMvskFnpESzWQbJew7o+sBQl5MsijEZiyiLBe7p+XZrftUlBDlXtBY2ebc3Cj49avmWp5L041zu/fMydQt3I7UpRifbaUiB/CsOZufFgTHDqrGZiHGdMyNueZPKb1DnuvATqeZKOMvYw8FKqUbtoGm0dzavvJ65l/QoOIAOJtF31LRGF/ck4M3odhWFVea4F2+Ddg9j8EUl3H8tfFbNmYqvIMe2O8XP5ZGd+C5LvFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBXzgpGLEyTtUknvTaisPi1VpMUnQDCq7rnQ2CV8MmE=;
 b=IT7hVh+zCvkGY5GB8E1J5XoMlkELaqKHn1MoN5IDhLorJj3ihdOxrh3VwNT70VYULp/3J5ScU8hwIvVc1+QV6vk4BqLBBifaCYB2zmt69nhxosKbENHEK/Zvey0VQI4PwblrQPngb4+vBD2TV3QZWyCqsKMyDLDW9XllKr14VZw=
Received: from BYAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:c0::16)
 by IA1PR12MB7638.namprd12.prod.outlook.com (2603:10b6:208:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:19:50 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::1d) by BYAPR05CA0003.outlook.office365.com
 (2603:10b6:a03:c0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Fri,
 4 Apr 2025 00:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:49 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:46 -0500
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
Subject: [PATCH v12 07/26] x86/resctrl: Add support to enable/disable AMD ABMC feature
Date: Thu, 3 Apr 2025 19:18:16 -0500
Message-ID: <2a6d7d2f54aefdfa8d701aa68d30287900639269.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|IA1PR12MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: d64e47f4-c29e-4b40-a6d5-08dd730e69e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tc8LmbeR5M0AoLRrkrPHbdjXWxNT64o8TE/toO2jQmv8lDNGz6DBOJyACB+w?=
 =?us-ascii?Q?p2p+Y/cOV7vveg0fyaie5Zp13NT0s9WAuXrdVs+kDTGUDG/MsJuAxnwQ1qnL?=
 =?us-ascii?Q?NMOpLPYzyQi0+Ag3OyMfeUbPsJ9vw85MK1MzbPFLlhZAxCzo6JVfwewuZ/Vq?=
 =?us-ascii?Q?c36AqMaHs8UEd+at0/xPXYFffdQANzYlmqOT4ucVJQ9ICbpIfrOVzGoHNsy2?=
 =?us-ascii?Q?6LUrV/zxySlaEyAmWnB+B2Kk8Zj5bEOHvX9sq07KeIa63hukwWgxX2Dyyt5D?=
 =?us-ascii?Q?Egk5IPBCB8tfOJaMj+49yPRTAalth8WWEGPTJPuFv6+v+asX02417LHxFiBJ?=
 =?us-ascii?Q?wb6udkzD7rGPQvXa3Je9PI9CmF5Q7G6V9/LqBWI2OraJmspLwvxZzGVAIjhi?=
 =?us-ascii?Q?vBuKXYAjLe520cF+L6LvnT75Iia0M12kmE5mIKJTfbuuswMxXz0Rs7413Pyb?=
 =?us-ascii?Q?VnbjHQqBxQID2WjRmdXI1KEB6Wqqup2L46iTPWcwFvK7ve1Hbp9RIDN2Coe0?=
 =?us-ascii?Q?twPxkwLuPDv53uacTrK+Wj0wLUce6AvwnJqPH/T94grrcTJTc/IPk+3gcFfe?=
 =?us-ascii?Q?E41q1n75W/QlL6aaK51tbpA9WzJMe3VYF8d+n3zsHLxF+t47oR3bNkGcBl3e?=
 =?us-ascii?Q?5BBnJxf/d0fFjP8X3iW3LE7mO+be7b/h6cXgPOEDk/0ob6Vf37xj06DDeUxN?=
 =?us-ascii?Q?+Xk8bk8xSaVLIMG1jH4L9s+XH3qS/rRT7WYlgG8naUjMhn+uuGq+wlKxBSC/?=
 =?us-ascii?Q?9edsK9dOdfzLT1LABX6+/PJ1iNFp7Z3aMUO+R8qVS8k3TNvETUEv2LY5mOs5?=
 =?us-ascii?Q?C7MAi+38L5Y3oEIIp9urDAGIoWsaBsnYGQ8QbO5fPLk0YvfZ2TY7cKdklntM?=
 =?us-ascii?Q?LULOMYPCceP91JkMw7AMuTNdjePWB1xqrD3y5UjfHIutPTtwC6Ji4NiUObEc?=
 =?us-ascii?Q?frvF4joo8/j+ICUVeYMijUasGbT8DFbRi4XG68z0vb9Q+lpx0cEHUqEWrykz?=
 =?us-ascii?Q?L+IkEKVx7gATpTK4f2Qo38+4I37I63LfmP6TvHniMDUX+94auvb+iqm260va?=
 =?us-ascii?Q?/XmLXQafdEvvErPxTijdmaIo4qxl/EK8qUXa3QH0EzZ43oiBeqpwzybM2vGv?=
 =?us-ascii?Q?CBT7/mZ7RaIfNO35FURxApXwHbwg9aAhdWiOq8AhGZgXY2izE9zwN1SGsywr?=
 =?us-ascii?Q?NRWdb84X6ySwiwvGb/voPBSGYM8aJxpUwoqz8N2IUnBKjFTgT2qi8gyilNKa?=
 =?us-ascii?Q?Em/hzp+rBuLmlKOug5ma72FlmuUwMwSI7GbLMO1pra5e6BPqbUu1e5CVoTe7?=
 =?us-ascii?Q?bqEkonf+WYZzlloXRVCquzehENdS8+u2uI3lloVsZ/meatukYf6HTHSnGUJO?=
 =?us-ascii?Q?E9oza0EMy3JKlCD15cBCXEs/ZJIjuh4A1vN25TyUdaLUeDDFLSFNTHJ+CEqN?=
 =?us-ascii?Q?U1WBAGVJQkHeo0O4JipKaxno9RaTdJ7qTwHq6c7J7L+H8AlNX57TR1jkR1BR?=
 =?us-ascii?Q?1rIDrJwfHYEs/LIFUCC+ON2CD/4gVPRI8jUU9KvCcKuPyO1ly/ioYJogFA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:49.8507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64e47f4-c29e-4b40-a6d5-08dd730e69e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7638

Add the functionality to enable/disable AMD ABMC feature.

AMD ABMC feature is enabled by setting enabled bit(0) in MSR
L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
to be updated on all the logical processors in the QOS Domain.

Hardware counters will reset when ABMC state is changed.

The ABMC feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Clarified the comment on _resctrl_abmc_enable().
     Added the code to reset arch state in _resctrl_abmc_enable().
     Resolved the conflicts with latest merge.

v11: Moved the monitoring related calls to monitor.c file.
     Moved the changes from include/linux/resctrl.h to
     arch/x86/kernel/cpu/resctrl/internal.h.
     Removed the Reviewed-by tag as patch changed.
     Actual code did not change.

v10: No changes.

v9: Re-ordered the MSR and added Reviewed-by tag.

v8: Commit message update and moved around the comments about L3_QOS_EXT_CFG
    to _resctrl_abmc_enable.

v7: Renamed the function
    resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

    Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
    and renamed to resctrl_arch_mbm_cntr_assign_set().

    Moved the function definition to linux/resctrl.h.

    Passed the struct rdt_resource to these functions.
    Removed resctrl_arch_reset_rmid_all() from arch code. This will be done
    from the caller.

v6: Renamed abmc_enabled to mbm_cntr_assign_enabled.
    Used msr_set_bit and msr_clear_bit for msr updates.
    Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
    Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().
    Made _resctrl_abmc_enable to return void.

v5: Renamed resctrl_abmc_enable to resctrl_arch_abmc_enable.
    Renamed resctrl_abmc_disable to resctrl_arch_abmc_disable.
    Introduced resctrl_arch_get_abmc_enabled to get abmc state from
    non-arch code.
    Renamed resctrl_abmc_set_all to _resctrl_abmc_enable().
    Modified commit log to make it clear about AMD ABMC feature.

v3: No changes.

v2: Few text changes in commit message.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 12 ++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 38 ++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index bc6d2de109b5..cb3c0720d910 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1201,6 +1201,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 9846153aa48f..ad4789740a33 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -35,6 +35,9 @@
 #define INVALID_CONFIG_VALUE		U32_MAX
 #define INVALID_CONFIG_INDEX		UINT_MAX
 
+/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+#define ABMC_ENABLE_BIT			0
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -388,6 +391,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -401,6 +405,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			mbm_cntr_assign_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
@@ -424,6 +429,13 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+static inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
+
 /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
 union cpuid_0x10_1_eax {
 	struct {
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 4132efd83be5..6ed7e51d3fdb 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1387,3 +1387,41 @@ void resctrl_arch_mon_event_config_set(void *info)
 		break;
 	}
 }
+
+static void resctrl_abmc_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+}
+
+/*
+ * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
+ * associated with all monitor domains.
+ */
+static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_mon_domain *d;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		on_each_cpu_mask(&d->hdr.cpu_mask,
+				 resctrl_abmc_set_one_amd, &enable, 1);
+		resctrl_arch_reset_rmid_all(r, d);
+	}
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (r->mon.mbm_cntr_assignable &&
+	    hw_res->mbm_cntr_assign_enabled != enable) {
+		_resctrl_abmc_enable(r, enable);
+		hw_res->mbm_cntr_assign_enabled = enable;
+	}
+
+	return 0;
+}
-- 
2.34.1

