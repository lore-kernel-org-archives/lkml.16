Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55E922D798;
	Mon, 21 Apr 2025 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275505; cv=fail; b=BfC6sYDrmSwXLZrrzzS3G4cIcHtnrG2MD7r8lYpOsmBfNHt1ZCeAnXrh2SpeNVnyV39pQMIN4KvFNHLrZiOcL/wetm85N/UctQOiCK+BocEVZgp02CDBPPHmPjTq/M8y1jpwUY3BeV0TvU6igpGWFoVezG8o94IrTY3jTps1B9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275505; c=relaxed/simple;
	bh=YmAZ98FGE5yZosoHO1WxM0on4DpDSL/+lwqnIT6GEhM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbjhXJkApgptOkvK8zGx48oGM7L0qcUGaNMqBVh4FC7Ks0mufKZXyGBywFrORK2GWz8PxuSXGeKxoKPrmdiyr8pr7Y3Ax5j5k5fcw25X7r5uWfkQ/aJ4rTxetWkv6frrqmRVEW4HwvI+2HEnxxbYoh26zfPKw3ARbK+cpuWq0xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NIB9V8A2; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NIB9V8A2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFRGNgg3AHyl0mElKbecAf8QLAUrnkHqSTj5hT7o1mf4YsP22RroPP6+MnrzlF0Y0mSg6gmEVtbiBuyt516oYi4P7xY9MtDofjZ7HuPzDN6cXbiUsSpv/SGmy4w9h2UEBT5FBbH8Tw5SgjTQlFoVB86p/C2SlByWjRJIkF45PnFhu7wLGq+2S/WqFoi+yYkqM3qNN3OJOmmPgDtrLUAq0Qkw71NOpFvnvA4Vtg1oBW04SWyI8kz/XnHKE1cQ3iFhtKfHlF2zUipkrfrTwOyARMaT5TVyje2FY77qIzUe114UEts5nf55Y9MzPrAGa0/+dTd4Qw9m5oXaQ5t+yS/I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMz2l4lgKeZHEcro94D4plqTbowCf9xCuLJClvO8EnY=;
 b=rw9RfW7AorxMuJ1FWckm+9teKecARyzJCIUmaDtvxut8uDv75lILwlexeJ8369v+sNdblL7G0hBxjqy70m1r7rbH0fXuDA5IrjNa6swBfghcv+Ri7pDeSzkHI4X5fy+5//LlF5K6ppWZzo6W19KUR3E5l+XMFNEcRsF9iDT/q1gGotrymy2steScGvu4pRp0MfFKvQ+NT3Jmf0DctXjgXCPpRe+VpnP8SwrtbNtMVMlUuUoF+JX05gloSDFcnhdjOhCVEnHIAVRTQYMLUI/U2t9hPJAenwn4ZYxQ3cwXzZS6Za4wzblg3pgzIE3K8lZTC8JDW14wQWoswjzmRJ/qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMz2l4lgKeZHEcro94D4plqTbowCf9xCuLJClvO8EnY=;
 b=NIB9V8A218e1GIbRtp6VwCdlgiOgHUSXuy9xPpT2ZF1/3b7l0fp2YuuKhOqn3qVKT9P2tYY6wBuJZbkh2cc/xqWaF1s9ScTVWqhPUlULJ7RxF3RYlB7UnVw7vNU74msyvVtMTvoTTkUGqcTLEdvkukl94VXB3uZFcHzj6fAGkAk=
Received: from BN0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:408:e5::28)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 22:45:00 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:e5:cafe::a) by BN0PR02CA0053.outlook.office365.com
 (2603:10b6:408:e5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 22:44:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:59 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:57 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 6/8] x86/resctrl: Introduce interface to display io_alloc CBMs
Date: Mon, 21 Apr 2025 17:43:50 -0500
Message-ID: <784fbc61e02e9a834473c3476ee196ef6a44e338.1745275431.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
References: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d192c4-ac30-42f1-4b7e-08dd81262565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NKUBOXUlk98GMAS6EdLP0UQg4i8F2rZEVa9Pv5w1lUO++lXZf9LdtTVA+X9Z?=
 =?us-ascii?Q?qQiR3GJc0UrtMN69cNdWqoLHMJeR81wRBJv2w9XQMcF7fUHfUEz7DQ3qsbf2?=
 =?us-ascii?Q?K29s4bUIcJsPENfX7Vd/zIgJZBFD9Oy76PUWhBqqxdAHXcwfkxCS0aw2QzKp?=
 =?us-ascii?Q?lTMFW0+o+sXytzSMz3rsC0/aT8tTpNBXhrHN3kyoJs44XFXt2r10Gi/40ncv?=
 =?us-ascii?Q?yQnFcuLHjG5m1BURpjA6y7oTmJYj42r925vqGaFROMBSTW3dC+OQGMC5lQK4?=
 =?us-ascii?Q?H+daIAA1+e2TTjNAbe/dnte07Zdrd3KxDb5nNj+dxMNT9jHjOPe5gGiCmBxU?=
 =?us-ascii?Q?IQZi3NkNHlr0KpeQAA+j9W4tSHf1Ao0xoXZnhILso7oDSDrGMxenKHS9UQuF?=
 =?us-ascii?Q?hK8nFdYPWYWBJxRC4CAiYhjf5FqUdPxfUJ4beyzQCKFGjWJphyngHmjQEcjF?=
 =?us-ascii?Q?M3PMh5/L3BRdpNvlkQFMIhtl4hhH6FPist9ytV0gp0Ns0RT7ERNcxZOwK8vy?=
 =?us-ascii?Q?lbXEUunLOmHsEBj1zWpGMuxCZiXFWSjJE1xWxTTNaTHrlHL6tsPOL5tqFtg1?=
 =?us-ascii?Q?SCY9bZ65jVE/aTKijWsyhnddUHHmG9kGg/D4QuQekrlvCkZVK+bF64X3XEoI?=
 =?us-ascii?Q?Ceeelljx0Mg4H73h7YyAFnHdrOffB9inFLsoZHvkLS+w1VtofVRo10XJ9YLY?=
 =?us-ascii?Q?Vid8bXM5JFeVsvM7O1G9STRNE4c4NiswUgu4xJtIMCLpsFlf0fIiiC/2PM8N?=
 =?us-ascii?Q?pT5EcphUfBV7XUP4wkYkgCCYSeCmYSGY1qUFawuOO5jFQTwpr/UOIjpDtLaK?=
 =?us-ascii?Q?bsqqpXwnE8I9/cX7q2VgUIpIjKGg66JfHXggqehJYSN0RGjiHGMALRQhDEvs?=
 =?us-ascii?Q?1ULKiDau/m3qIqW/MaFuzNVkGm94b8GGMXbzVrc4C0262mYMcKCH7d/G+B0d?=
 =?us-ascii?Q?7s64PLkAhjgiEjXQ2WoLtS/hisKBy+I7N5KUV9IUCWcK0f52pldb2DuVNQ3q?=
 =?us-ascii?Q?XhIzJUmiq8/upYaPswN+ek0rmc13KlH36r0qZZh9ND0Gb1CSNIRuxk1q0pbR?=
 =?us-ascii?Q?7qL9JurMJb7LjpOYI4gGujZ3i6NQf7POmkyxLo8VDpCO2+p4ZXlUK6QZofEH?=
 =?us-ascii?Q?ftTfD9i6XxeG5+4zT5R+bBFeXzj4aTo4EAlPnpUo2ONRsrnGsjyuSIswh9RL?=
 =?us-ascii?Q?Jax7J/Ts/TN/n+RAn00aQLy/0pN+YOP9Z/V7ybGFGnTtRLHfWwsnmymGhSuO?=
 =?us-ascii?Q?P8tAqBumCYYpEACboJujw52EqVpvaCgXQgPxMtiiRfOiw814WNyL3Wz9qFaO?=
 =?us-ascii?Q?rlby8Al0Due72nJqRhesPjpEKr7HQHmAM1Yf6KZaCB0VZcC4YNxuSfw4hi8D?=
 =?us-ascii?Q?9aDwZfCEgfLTiX0WLa990kOJ5weehi6OCuPycMWM05YKJV241OUDWqWohvaZ?=
 =?us-ascii?Q?U2YXjIFw0XWDjnxdzX36q8GtdWe7Pp8Av6zsWeWDev9QT374mHhbfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:59.2123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d192c4-ac30-42f1-4b7e-08dd81262565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062

The io_alloc feature in resctrl enables system software to configure
the portion of the L3 cache allocated for I/O traffic.

Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
feature.

When CDP is enabled, io_alloc routes traffic using the highest CLOSID
used by a L3CODE resource. Add a check for the CDP resource type.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the change log.
    Added rdtgroup_mutex before rdt_last_cmd_puts().
    Returned -ENODEV when resource type is CDP_DATA.
    Kept the resource name while printing the CBM (L3:0=fff) that way
    I dont have to change show_doms() just for this feature and it is
    consistant across all the schemata display.

v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
    and resctrl_io_alloc_closid_get().
    Added the check to verify CDP resource type.
    Updated the commit log.

v2: Fixed to display only on L3 resources.
    Added the locks while processing.
    Rename the displat to io_alloc_cbm (from sdciae_cmd).
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 51 ++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 0a0ac5f6112e..d1a59b56a456 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -454,7 +454,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	return hw_dom->ctrl_val[idx];
 }
 
-static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
 {
 	struct rdt_resource *r = schema->res;
 	struct rdt_ctrl_domain *dom;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 6ead222904fe..2ac78650500a 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -519,6 +519,7 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
 
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index d53a2068cde4..5633437ea85d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2042,6 +2042,46 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
+				     struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
+		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
+		ret = -ENODEV;
+		goto cbm_show_out;
+	}
+
+	if (!resctrl_arch_get_io_alloc_enabled(r)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
+	if (io_alloc_closid < 0) {
+		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	show_doms(seq, s, io_alloc_closid);
+
+cbm_show_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2201,6 +2241,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= resctrl_io_alloc_show,
 		.write		= resctrl_io_alloc_write,
 	},
+	{
+		.name		= "io_alloc_cbm",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_cbm_show,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
@@ -2313,9 +2359,12 @@ static void io_alloc_init(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 
-	if (r->cache.io_alloc_capable)
+	if (r->cache.io_alloc_capable) {
 		resctrl_file_fflags_init("io_alloc",
 					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("io_alloc_cbm",
+					 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+	}
 }
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
-- 
2.34.1

