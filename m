Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13071F5846;
	Thu, 22 May 2025 19:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943566; cv=fail; b=Ixmhtt1LStlNy5NPqwgohtgs3mFZe+kF/pRQoh5AsytF/GMWD1QEcC9qUNeN1VoP2K8tDkMnhwe1Iruh8BV47hQbTzhbk/alaYhQdbFa+2jbi0KEXVB77+k1wO7QHDfcA9/NAn/uh5k5DdggFu7YqaV2H7l5g2EWIp8ukvwPdHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943566; c=relaxed/simple;
	bh=MhNyREp+JsBTwXMiY9EV7SWwXUYdkedLbphfAKzd20w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtmehoO1ExwaHlGGlg0i/DyPHcAR6nr8THFhuX1+iH5UKw8AO23bRTPUaqbnKqCZyzEPJLKPe8i+L9pJKi0yIPYnDdyFvYwFG8pv+jd3ooisajCyjrxchJha6qGJHbx26VmtsPI0A/ZeKdHBSE+lOj2Jpop9Li4VNXHc+mX1NDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p6YEk6KC; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p6YEk6KC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNCH0/S1jfB5KYOwJDRs+NLHFwS4q6Z7NWTarfKM4eDRWNwA25WFcdwGvBuxdahK5MQuUI80+2j1qtemX2AvoJ6NvLYwFr7qNs4cBCK+CkaTOLR4Z4v5hpIti1Jb+Apf6qFg2xrWeKFBinjPVk/2J6y7dGrcMMcfBo/4RlHc6Nsq08HoOsPsAC+pbxEkrNkhHNxP+YfmlWbRTgSdVpakRlYhnZOUceaUZrpoNnjUWkmFAbM85BOhVkONCWTWAdbdNUJDmBxAHIDxA6zAiKXlXdSSaWXu1Pm52s/pfBAtsTrUM69ZJjBmF8jBte6HPiOanTDguN9wH7VeTLFVOCi8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Gvzx6cRdvS+vqfSRj+n0f1enV8J3T3jKStXYlhyQxs=;
 b=tV63AX/NXcAvU1sFSVJzk/a0DJgF421qUUt5tm4vvSmiyH39yJt2JMkIAFBq6qlKB94Ot3bqti8hVc1c7FQF56ImtxxGmL6MhM6vKLPb56ssuoSnII0rxcG5WRzlrKBAI1F5Fj4PI2Q1tplsEudIfgVgxKxrsUeZbsnOBQMSZlZoaKgmw920NR6qwnN4BaQWsMk7qlsfVHoqarrWEmyd/Ob82rv0LTqsfviqB/6HPV5V01p1ztnzgFaTNe+JBo/G4fWN9AAXopSOQk40y4ocyhve+3tGfo5xQAr+w5c/nQRKunJX56NYM2SnCa97RxUrrKqaOnG3zodTxmp/e22e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Gvzx6cRdvS+vqfSRj+n0f1enV8J3T3jKStXYlhyQxs=;
 b=p6YEk6KC9ouy8I3yAy42cs8AC6dkz2wNLlXC0te1FFnb7BW563hINmGH7oQFHhZ8xod56FWuU6LcE/ou3B6m0DMAIp0KiDuWKWLI9mAClV5JpzE/unjX4Zj9ryzgFq57ttbGucBt3t/5EW656cYnUX4uWlnx0RepPcQ2fBG7NDE=
Received: from SJ0PR13CA0162.namprd13.prod.outlook.com (2603:10b6:a03:2c7::17)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 22 May
 2025 19:52:42 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::e5) by SJ0PR13CA0162.outlook.office365.com
 (2603:10b6:a03:2c7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Thu,
 22 May 2025 19:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:41 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:37 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/8] x86/resctrl: Implement "io_alloc" enable/disable handlers
Date: Thu, 22 May 2025 14:51:35 -0500
Message-ID: <cac3475498ac07b9a6c2340d214df37e3b288855.1747943499.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
References: <cover.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d59c1a7-41f7-4509-5612-08dd996a369e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/EnZZb+3R8Ms9JiAR+3rwACnOxp8A3WzIbMtkzr9Xo/hIRFVRy1ZhAZLR7OU?=
 =?us-ascii?Q?YY6yjMf2sf8S5LaRP9r7jPbbxwnS4D6sCvf4fvT5XNhjeXRkiFSvw5AlaAbu?=
 =?us-ascii?Q?b5qFELg9vvfTcD9RRpoizN9mRtsrO4prYLdRq4CkExncb71ZN+XByESODDs5?=
 =?us-ascii?Q?zGPh5NvR8RLjsn0DAlRnZWcGhN2mR4tyZrUxMUa6pF6RLMimNdJe0DvX+vsY?=
 =?us-ascii?Q?YbJgx2nWOMxGMCTmA/NP8v53wKVo6iHUpWsZppQeaPYZdbBkvPzGhiE8cgcy?=
 =?us-ascii?Q?pZLHrpHm3O9C1VYEmucSWNN6j1FznDmND1l7V5Zh7IUaIQtutjFE2Qdue7or?=
 =?us-ascii?Q?OubA3X5Optvexf1SLUHqegkfhow8uh4DqirUf8/lQu00EBXR90dkhLgwuGiw?=
 =?us-ascii?Q?aGVr7b1XbQxSSqNuFNdSTCHmXkXkB1YxiMRi7iBPfV/W5s0I8tB9985Crafv?=
 =?us-ascii?Q?P7nRhmLVCaYaLbLWEAO1gWoANI8zcTWL3AH2i3qICkWGRLkr/aIC0w/3IX9Z?=
 =?us-ascii?Q?Wn43YLzx25zbsKatAMNaU0hURTM2ul4ZFHKc7vIZSjDR6NUfsKdozYhTyDGk?=
 =?us-ascii?Q?Lu6GRGtEnQnoPnv8vX94iS53e8jD41NU2CXMFkrr2dbTsiXmJtUIgdYjyhFO?=
 =?us-ascii?Q?aKNwZCR64ojhVU680uBWKs0dBKrJqEh+tzN2I8JycRouiYA0HCbpoyr+nmz9?=
 =?us-ascii?Q?9qPiml1fBn1ruQtRB0u4Svrso2A+VaZcGNK6WmZDMJ2iNDVhIr+KeImn83zS?=
 =?us-ascii?Q?gEKrgn4G6wyoMTdDdJSCL5TiPSIMgRDexmZmKf5KOPN4+aXsG/3SXBEAI4D2?=
 =?us-ascii?Q?GZ8z/M9PCh/dSjjdC7YVhATb0uxencHWNmBfn0KbC3jnRhuifevbl+AyZtNo?=
 =?us-ascii?Q?aRfJ6iUChhfCnsGqX1hY58xKIHAmedLbTNUgetuJZPyTvrIlTS8OjckHUWSV?=
 =?us-ascii?Q?NIpfChyyOhhjZgeeXCSDDNPKLxbum+7Qayc109TitC+kH1jGX6uoHCOVoeTO?=
 =?us-ascii?Q?yB6+e8DW+f85O3FIbVC12zGBvI1cohu/02LvIg639BzKDqK7YxhvzJFtp6r9?=
 =?us-ascii?Q?KrPlCoaSO9zxGIlgOOzAVmCBzUNBzsmL6ybaO1SAw06fCFJIEoXtiF8zZTtY?=
 =?us-ascii?Q?Ijxqg3usLn+gbV8oZDDLW1uYik9r7TCgZXO1vAcKg3U4WdjA2y7SeASx/tt1?=
 =?us-ascii?Q?2RJiJmO11QwQzfuNMB3l9anGcae0ux+L9XKjt7dY3nXW0qc0DYv3s27wKFMW?=
 =?us-ascii?Q?r3mvqcgCZ1N6pNhlJY9ph6p6GJ0zrxmJVleNd90YxpcuJ3qMz/KQrGsylKNt?=
 =?us-ascii?Q?6HFceg8A6Frv6TEMjrV66wHlwPx6OrEn2AxrV3VwfaGw+v9jpRxQKSV01Qsv?=
 =?us-ascii?Q?cFQno1DVop+tZbRDVrBh+CEsjrdMQYtAY9te7Q+YFPly5CBYlLbXGmkI7nti?=
 =?us-ascii?Q?K5Em8WMblKDlSzznp6zVKARCiRdmb8m7aRGm5d53Luz/WLt4XPMUsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:41.7072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d59c1a7-41f7-4509-5612-08dd996a369e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756

"io_alloc" enables direct insertion of data from I/O devices into the L3
cache.

On AMD, "io_alloc" feature is backed by L3 Smart Data Cache Injection
Allocation Enforcement (SDCIAE). Change SDCIAE state by setting (to enable)
or clearing (to disable) bit 1 of MSR L3_QOS_EXT_CFG on all logical
processors within the cache domain.

Introduce architecture-specific handlers to enable and disable the feature.

The SDCIAE feature details are available in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: Resolved conflicts due to recent resctrl FS/ARCH code restructure.
    The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
    Moved prototypes of resctrl_arch_io_alloc_enable() and
    resctrl_arch_get_io_alloc_enabled() to include/linux/resctrl.h.

v4: Updated the commit log to address the feedback.

v3: Passed the struct rdt_resource to resctrl_arch_get_io_alloc_enabled() instead of resource id.
    Renamed the _resctrl_io_alloc_enable() to _resctrl_sdciae_enable() as it is arch specific.
    Changed the return to void in _resctrl_sdciae_enable() instead of int.
    Added more context in commit log and fixed few typos.

v2: Renamed the functions to simplify the code.
    Renamed sdciae_capable to io_alloc_capable.

    Changed the name of few arch functions similar to ABMC series.
    resctrl_arch_get_io_alloc_enabled()
    resctrl_arch_io_alloc_enable()
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h |  5 ++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
 include/linux/resctrl.h                | 15 +++++++++++
 4 files changed, 58 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e6134ef2263d..3970e0b16e47 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1203,6 +1203,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 5e3c41b36437..cfa519ea2875 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -37,6 +37,9 @@ struct arch_mbm_state {
 	u64	prev_msr;
 };
 
+/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
+#define SDCIAE_ENABLE_BIT		1
+
 /**
  * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
  *			       a resource for a control function
@@ -102,6 +105,7 @@ struct msr_param {
  * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
  * @mbm_width:		Monitor width, to detect and correct for overflow.
  * @cdp_enabled:	CDP state of this resource
+ * @sdciae_enabled:	SDCIAE feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -115,6 +119,7 @@ struct rdt_hw_resource {
 	unsigned int		mon_scale;
 	unsigned int		mbm_width;
 	bool			cdp_enabled;
+	bool			sdciae_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index c7a7f0ae373a..e7c03d4e3d4a 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -228,6 +228,43 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
 	return rdt_resources_all[l].cdp_enabled;
 }
 
+inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->sdciae_enabled;
+}
+
+static void resctrl_sdciae_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+}
+
+static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_ctrl_domain *d;
+
+	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
+		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
+}
+
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (hw_res->r_resctrl.cache.io_alloc_capable &&
+	    hw_res->sdciae_enabled != enable) {
+		_resctrl_sdciae_enable(r, enable);
+		hw_res->sdciae_enabled = enable;
+	}
+
+	return 0;
+}
+
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 0e8641e41100..8f95f08df663 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -531,6 +531,21 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
  */
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
+ * @r:		The resctrl resource.
+ * @enable:	Enable (true) or disable (false) io_alloc on resource @r.
+ *
+ * This can be called from any CPU.
+ */
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
+
+/**
+ * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
+ * @r:		The resctrl resource.
+ */
+inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

