Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB728CF5B;
	Thu, 15 May 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349606; cv=fail; b=HZiPXlHZLEJHcxSOnfIToyzBP03F/uZ14tALwrlY/q8GRzqqrMF/m2vIdRsaUZhv9dtmkbGHqKtYg4VUpMhFNYvEyDc6wlzhr5ULoz0AxJnLVTsrJJFfHuymsNLmePQR4K7LEI1Gs6uzZGI5w33gFNgV9kCcxD/yh2n3b2eeTSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349606; c=relaxed/simple;
	bh=htzSgeknkCpYJUc/0ANZJltLEXDoKv98RRKMOshc8rw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPMds1dGpHT0TWYfBWF84fB1w1vBNbSgejPnwres7T5KGwiRl6y2gJlLvV8xurNskn2EgJPWzGkyTNPfI1WJwf2/Org5YkNBL5dmkretAgYwitCkY0tHzY5Cf6bV8cVwdX+vVHKSvy2fVjqqYfYR4DZqDrCeZCGNf6znp+NfGgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J6b/OpSk; arc=fail smtp.client-ip=40.107.96.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J6b/OpSk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru4f6f/o9sQCUsyejszs0IyCdrWF4WvyvB54vyVf61hfUJK2HcmzlUn2U4vQcIl99aj7fXmMxEoCzm9aXrztc3daPoZEVDJ4bxg9KCC+FbgtnAytcJptLHU9ussF1hKJBfNjR9wGCSHXGGvmTw8Ri9B+Zp9hZokCqv1F5eyG0QCfjlYTlRke6wb6PBiDWqgklqw1rbHjutQsPrkz0WSJD344mdhTW3VTWbhU+YnUkED1Nokzdb7TSmdPsaxt1pRrteo7rxUYAGossbPb/wREaBB1bZJh4x3fEAlbKqbXaZ8LtQ/9eFYV2lRDNCyKJPk1eIPcqlfPjExKwrtaFU+NLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ7fGrav3EyP7zM321zk7ZJ+Z8zmz+mFr7b6e3QjNCQ=;
 b=eKoFGcokpcTEOQezh9rdzzd60zRkuJhJYn2qLfm5AlvIWzcE/Hwi9VcstqdThtVrQnsQ86xMd9WS9PsvzWhaSVTJ53YeUrS4ZJg6W5l/CdKa2l62vDP0GrRzHkjURVDc/Oh8ZORNvtHviTLfT8oZ1srD4zqBqsY7IsjwRpmRYS2ZRY9tNqHwWdHzsn5rI6gVmz7McaSqzuVcLeYnOfc2qHM9VR1F7kOA7ZjucMq1XawNagaY4hHnOf6/CwlpIekx7a8w8d674OYInlWFcbi80CWPNojXUBUmtJz0lEEARzbcdU2ZFSuR6K3190kYwZglm8tLUlpq8VTCZoBpcVC4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ7fGrav3EyP7zM321zk7ZJ+Z8zmz+mFr7b6e3QjNCQ=;
 b=J6b/OpSkwLT1/Fjb9hdXz4lQlXIl8kjLnckhFVroyUmzvssiMU2IjATfI26tkS+R4Yu+W7LcrclLyxyhXTAcuqeE5dsxEAjt+k0F3f/tJy7A/s1XqRVHPMZX4nrg3RNSNitclPaoGU2VN1DPf7ZbJ06eE+G3gDUkeme1AIZwnRI=
Received: from BN0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:408:142::19)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:53:19 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::80) by BN0PR08CA0003.outlook.office365.com
 (2603:10b6:408:142::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Thu,
 15 May 2025 22:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:53:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:53:16 -0500
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
Subject: [PATCH v13 06/27] x86/resctrl: Introduce the interface to display monitor mode
Date: Thu, 15 May 2025 17:51:51 -0500
Message-ID: <ba19163dc9de8e8a2804d1968d5251f9bc801389.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e2d4e4-e84d-4789-ccff-08dd94034932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RJYvXlIsHPBptee6C9+0yOSkY3Hj6Zx4JS3x4yXzKjIRmDbMGxOjINMH7L3J?=
 =?us-ascii?Q?GorEmayEu4rRXLxPbjnmDWg/yv8Di8kiuI1Bz+nMWjgrizn+/0fWYqmsAYKz?=
 =?us-ascii?Q?imtReyvM6tOh2ZXGIjBUdDQ808yMnFcGgqIhE+NtwhNYX+6RWjJSePFQn5GE?=
 =?us-ascii?Q?LkHaAfp6UYGNHjX27+mAmHa5gfd1NGEt3nCN0pcCUETXP2rQw77FUhD4HhoX?=
 =?us-ascii?Q?SPFoMN7ip+aiOjzXRL2BzcPGOxDNddiXNyEmFr2H49dNmJ55JndcGb61gc6r?=
 =?us-ascii?Q?XO2U/phQRBKAYvokPbDYShDoi+4Y4avlDM7zoy+Wu2Y2kd3EvECSlG9sFbfI?=
 =?us-ascii?Q?NRHQf/hiaqeQU1anxhZ1FKoSgq1XaldlSXc9PK3EeN4dXUyWtydbWIfAPP1h?=
 =?us-ascii?Q?pFMKRbPQoJ0sspwoDbfCN/wPWferAb8bM65hHu9aQdtfypyExkK1smE2bpgG?=
 =?us-ascii?Q?USNIli1A916yo4ykSEVM5dyQQbcbPil3vH/s6ErZdUc35OEp/CmDxDlrFZYd?=
 =?us-ascii?Q?YNLuWfr14C5tRi5p4B7IulbUwhME8C4M9DK6eUhxEB1rplwjbbjECbxAZ7lu?=
 =?us-ascii?Q?TsKZRb2dmf2bhl9RTRUMnPP3Hn15WPZ3+eBIxZFTdfEj0A8Tqf5N/2FGXhu2?=
 =?us-ascii?Q?qh989oUbPyVu2gMzbXvlIVDeR2jeurwVxCK78Kr1Gkm/hpuBYkll7j6NA1ep?=
 =?us-ascii?Q?28/1MZWg2srtQcNLoSUP9mULMy/uGYNF7RJGo5AbJzqvWLlKexF1kOWdo8fD?=
 =?us-ascii?Q?7wlGyVeQkTgXJUONeoSM/xHawNDNPjwQPzobg6jiUEC5FIsWx9uDZLR7JzBg?=
 =?us-ascii?Q?kv9XlyleloaCaTuCc1Vd20BwyB5w086aCFvcEtuX2YSVyzYuWgCQgX2z+Amw?=
 =?us-ascii?Q?12PZDHmPQE2PXeR3Q0c5mN3oDJme024iiFEOv9dm48NFnq1i/Nvg6KrRVh9j?=
 =?us-ascii?Q?+Bx56l2/ynXYKf8STQfw1iWbpLC/PdVyJVDQuP1mxE48km09vRdf74C9xves?=
 =?us-ascii?Q?sJHoxkK3PshbXNsZeSNZe0DF5E8BSrAFnj/I24Dwq3yx9vdjG+gsBoKCl0Pm?=
 =?us-ascii?Q?zXtcIOdwRIT441P+Idzhlpoc68c/Hw5CeL6B0UuVobq8iI8sRWO57kBR6ljQ?=
 =?us-ascii?Q?ZQn+yKsAe1SgU3Foebl26rR6m8q0JRPJufvHRvRRBUgQSVT7G0bDZfdY4REn?=
 =?us-ascii?Q?EVSwvxTZdRvcireULauV5YgbEKXYDgQOwhulqslR+5T5bPUx3vndGOArqpTU?=
 =?us-ascii?Q?jLPkGbAnmW6Cnco8qBwTgACXhoFT67l+jfNjITAnRtcjjlH2who3QLAxrb09?=
 =?us-ascii?Q?RfoexDXCpeF0FQwkwDMwR/xKFBZ+rGKm0Xlu54aKyGElroDp1AMi6o4vde/P?=
 =?us-ascii?Q?wj5wcF29EPu4zhP5Pw+14n7apT6njwlmnWhF6ls4/WaCh0gGE/wdbh0zBVwA?=
 =?us-ascii?Q?ealsSCFY+6fQ6c09WT3nnK6sDDW1aT8Tpx8GosqXQ6UmuvP4rN3bw18VbRzK?=
 =?us-ascii?Q?8etUi/zhSirqHzcT0T2koRqG1oFlvMtlJky8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:53:18.9938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e2d4e4-e84d-4789-ccff-08dd94034932
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

Introduce the resctrl file "mbm_assign_mode" to list monitor modes
supported.

The "mbm_cntr_assign" mode provides the option to assign a counter to
an RMID, event pair and monitor the bandwidth as long as it is assigned.

On AMD systems "mbm_cntr_assign" mode is backed by the ABMC (Assignable
Bandwidth Monitoring Counters) hardware feature and is enabled by default.

The "default" mode is the existing monitoring mode that works without the
explicit counter assignment, instead relying on dynamic counter assignment
by hardware that may result in hardware not dedicating a counter resulting
in monitoring data reads returning "Unavailable".

Provide an interface to display the monitor mode on the system.
$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_cntr_assign]
default

Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.

On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
defined when the "mbm_cntr_assign" mode is supported.

Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the user
interface remains compatible with upcoming Arm64 support. IS_ENABLED()
safely evaluates to 0 when the configuration is not defined.

As a result, for MPAM, the display would be either:
[default]
or
[mbm_cntr_assign]

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v13: Updated the commit log with motivation for adding CONFIG_RESCTRL_ASSIGN_FIXED.
     Added fflag RFTYPE_RES_CACHE for mbm_assign_mode file.
     Updated user doc. Removed the references to "mbm_assign_control".
     Resolved the conflicts with latest FS/ARCH code restructure.

v12: Minor text update in change log and user documentation.
     Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
     This will be defined only in arm and not in x86.

v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
     Removed few texts in resctrl.rst about AMD specific information.
     Updated few texts.

v10: Added few more text to user documentation clarify on the default mode.

v9: Updated user documentation based on comments.

v8: Commit message update.

v7: Updated the descriptions/commit log in resctrl.rst to generic text.
    Thanks to James and Reinette.
    Rename mbm_mode to mbm_assign_mode.
    Introduced mutex lock in rdtgroup_mbm_mode_show().

v6: Added documentation for mbm_cntr_assign and legacy mode.
    Moved mbm_mode fflags initialization to static initialization.

v5: Changed interface name to mbm_mode.
    It will be always available even if ABMC feature is not supported.
    Added description in resctrl.rst about ABMC mode.
    Fixed display abmc and legacy consistantly.

v4: Fixed the checks for legacy and abmc mode. Default it ABMC.

v3: New patch to display ABMC capability.
---
 Documentation/filesystems/resctrl.rst | 27 +++++++++++++++++++
 fs/resctrl/rdtgroup.c                 | 37 +++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c97fd77a107d..8013418b6ca2 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -257,6 +257,33 @@ with the following files:
 	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
 	    0=0x30;1=0x30;3=0x15;4=0x15
 
+"mbm_assign_mode":
+	Reports the list of monitoring modes supported. The enclosed brackets
+	indicate which mode is enabled.
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+	  [mbm_cntr_assign]
+	  default
+
+	"mbm_cntr_assign":
+
+	In mbm_cntr_assign mode, a monitoring event can only accumulate data
+	while it is backed by a hardware counter. Use "mbm_L3_assignments" found
+	in each CTRL_MON and MON group to specify which of the events should have
+	a counter assigned. The number of counters available is described in the
+	"num_mbm_cntrs" file. Changing the mode may cause all counters on the
+	resource to reset.
+
+	"default":
+
+	In default mode, resctrl assumes there is a hardware counter for each
+	event within every CTRL_MON and MON group. On AMD platforms, it is
+	recommended to use the mbm_cntr_assign mode, if supported, to prevent
+	reset of MBM events between reads resulting from hardware re-allocating
+	counters. This can result in misleading values or display "Unavailable"
+	if no counter is assigned to the event.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9412c7b64523..a9e1055df75f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1801,6 +1801,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
+					struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	bool enabled;
+
+	mutex_lock(&rdtgroup_mutex);
+	enabled = resctrl_arch_mbm_cntr_assign_enabled(r);
+
+	if (r->mon.mbm_cntr_assignable) {
+		if (enabled)
+			seq_puts(s, "[mbm_cntr_assign]\n");
+		else
+			seq_puts(s, "[default]\n");
+
+		if (!IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED)) {
+			if (enabled)
+				seq_puts(s, "default\n");
+			else
+				seq_puts(s, "mbm_cntr_assign\n");
+		}
+	} else {
+		seq_puts(s, "[default]\n");
+	}
+
+	mutex_unlock(&rdtgroup_mutex);
+
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1913,6 +1943,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_local_bytes_config_show,
 		.write		= mbm_local_bytes_config_write,
 	},
+	{
+		.name		= "mbm_assign_mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_mode_show,
+		.fflags		= RFTYPE_MON_INFO | RFTYPE_RES_CACHE,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

