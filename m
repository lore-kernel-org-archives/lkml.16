Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD081A08CA;
	Fri,  4 Apr 2025 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726006; cv=fail; b=Fo3E6LDA/SGsvDSspJ/kJTIHdO5mvrJWR9xpVGeyk8bX4iE5ssibS64tq53V4cUHd8QHR1gepe/fxiN33pkx+a9nC1EhgipQjPuYv8yNt2Fzm0fMEFpFK/3xYRI3Iiu1eTTA0BhrlwGwKuACj6uVbL+vs8Cawcdz0L2xK9LUyhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726006; c=relaxed/simple;
	bh=AU3vxRaCVdJisZNSGQkGE32DNlKnLc/1F9lfRPH7g9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxUqEF5rDYtLNBBh52Rj8o1Oez2qHsFfFX/5PVvbnxR6age6V5/uGPS56NCxJ7tR7dOm/8q08hDbK3DR9S+ZSC0zmLFTBVNA7ZoDRXkiw5Xy1EiJfrBrtY7aTzKaPIrGTPeBiIt5RrrfsfxCUnq7BB1npr0IZoNp3I1vcOTuiCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i8DzJYcB; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i8DzJYcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRq1TxuhDgI32T3IYmWFzaAdiN7HR3oysum/aqEQFPLuzHn3Wqo9JqiRC9goIq++5DjQmc6XqCyVylxfjIArVs5yM9HDsEEiMUEGvckKPofLJhQ4vs6w0+UPT8TqX52cWhNKzvPK0Sk/36MIRjVjeXo+idNgjlJXg3jh33nINUkxBT+ND1tFgE3fUAqwxLfso8DgWbEAJ0kDWpRziaESFYszXwy2xWrj8E+mOWEZdKNp+lKtAOk5iogc1lnd+LA2g2DQcodLen4Y3BwkxL1s4hsuEKHgKDKkR/wWETj2Fbmr9SDxCPvcY6CMz48L9o0wckD8jo8vp1819yYydJs39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfjGdLOP6duH2Z12KeLbxIQAwiizgAxkJnQz6ywK0Ak=;
 b=KgZfPd2zkZLC6o4kADc/hjfCvP5mCEYNou50tKeoPmr3o1foAv+w1zs/uCmVVWe58fHER0Oo+wze9oPGhOCpCSfJZyTEWwKrPLnJs8A0nCBMfPAGbcVgXOfL9ARkn00gm7eh2eoMhSqJQjy4T8X8mZnKC/VJEvx67BL5E+Dpiku9/k+Yyxoo9Zcn75dfv3B+EeBlP/TJ/8Mtp8KRLNvZmWQAUVoeazxq8LPqqerREGg3cr4jX8eoi2KgD7M5cemUdGZaIvi4l6j/TYKKGGAfgxJCsCTi4iH693gQEvLxQwp5ZQMQGDZp0045OaIDaOM/akM1V6Bq7GKRNnx12WKdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfjGdLOP6duH2Z12KeLbxIQAwiizgAxkJnQz6ywK0Ak=;
 b=i8DzJYcBkQ7ABq+oXNM2wb0Z4qt6vkRtf45lAe7CVD/PIcuczLllvd9ztKSgohPdJjZQnvBGNCfwLVg/btKHMNkqAxaNx+W9LYpnBus9rivYqwoVCRCeRHyW83wATSmy6H3xwdpEJGf3AqyfMIgtu1vHp9AXx/1F4OTc41UOjAU=
Received: from BYAPR01CA0053.prod.exchangelabs.com (2603:10b6:a03:94::30) by
 PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 00:19:59 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::86) by BYAPR01CA0053.outlook.office365.com
 (2603:10b6:a03:94::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Fri,
 4 Apr 2025 00:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:19:58 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:19:55 -0500
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
Subject: [PATCH v12 08/26] x86/resctrl: Introduce the interface to display monitor mode
Date: Thu, 3 Apr 2025 19:18:17 -0500
Message-ID: <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e93dd74-a613-48da-b68e-08dd730e6f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5iMX7qzXuTUTvLkpdyOMyUYY/ouJ/6NEVnjIyzlRS2NNL8lLAxs0LIjgfhqQ?=
 =?us-ascii?Q?/0+oEbU8iJo+pkh3X3zrvJVVXyQLe26hLI6VNAjWm9zCQXvfBR2zUSBb7HyE?=
 =?us-ascii?Q?h3PMgPh3CfrZgrjLgBiWE/QbVBxlmfIx9yztOD8VtxK9mH0QntG757uY1+gV?=
 =?us-ascii?Q?2I4ZiTXEhcOk80QXiGlozAWQcrg/NuKu0JVO0ikfT3gRZnHmmF1fTwY7PxDm?=
 =?us-ascii?Q?7ZJpmksnvx+SPBOS/6/evlRjV0dUe+nIvK/11h3z0eoLRLCVSYQFnxI+D/UC?=
 =?us-ascii?Q?Wqsx9nDefqNuw8NOF485q0UTwaJ+lxAj1KJ0S+W5WKNa++zbpKSHDRxk+VTZ?=
 =?us-ascii?Q?isGxQjuoRD1LsSOOr4uYwaDNf0okSL5hTu6qQ6ffmhI5BsM6zjoJymsvqtkw?=
 =?us-ascii?Q?f2QbpVpegTQtCJM8nFR6WSNVzS7ACWtd24U1uarwgbBUEPayCBgqb2pquhH5?=
 =?us-ascii?Q?v+cv0DqSFl14hbaMbrqvsnP9GnkyZdkHwIshhVQaTccY9cUrAb+wobXYZvt1?=
 =?us-ascii?Q?+kwcBSaUBc8U9F+EVDNlP93fimxipgZyw1u7j9Xq506rQ2sXVYVttnGRXGcI?=
 =?us-ascii?Q?LuaTE29kMYpORe5KldfBvhRiNQRiKnfs+K+kXJZo6PLMQ6HJs/ixKr3qD9VM?=
 =?us-ascii?Q?Ph3Z/vXcjyznhM+dmOuYJsfmS1pW34MxGQ+ZUuXzqPGLCeV2uwSGdkbu+w4D?=
 =?us-ascii?Q?FwjDGDNUR+l2DY/vcOzkTdebuSymJCdS3ehfuFHu8ztULdzPKXRCAw2Fj0l8?=
 =?us-ascii?Q?NllW889PXdNXXJwhprwqUzOfg5/96vTOkjqogdmt16cmnMmZOTUr62L4TxqQ?=
 =?us-ascii?Q?Ls1CBj+56GcspGuLaetI73WHkl2fiQEd1CmcY7GXn0q0U5Hx6kGj9EAK1qju?=
 =?us-ascii?Q?bwqVxhSn97FbFunZaP9fOeednhPPNc4LEW58SrmckDFUK8xtixgcCEYGJEmT?=
 =?us-ascii?Q?Um5JYWEA9raG68tx3gMlAk/v6jHY15qELKBb4ZTDNUqF7pLHY2kbMYm58Ma1?=
 =?us-ascii?Q?aF0ddr8wkzaopFtJMBftY39QBS0RLQjfx8ioxrfiTRlMO/YE34m3rsN6dDIp?=
 =?us-ascii?Q?HfKKpAzV4dIsbimjGRupJDLgdZZH+BKqG/BhCTvydBdKDQpaT8qMmBGnhjZy?=
 =?us-ascii?Q?+qvDPRDTRHVwjFMmgYyHrBX495F/bGqusI6tN8ILtzTBWHn87CVb7Qj9E5fA?=
 =?us-ascii?Q?h5Zhl2lXDaDs6VbA9OtOOEpxC9Y06v4BhSTQ6vIFNJNm1u9gqV2xnrsfWlkO?=
 =?us-ascii?Q?nA7U4bLY2F627USWzhYBn4U+zuNu5yRZpQmymsY94sgr2cGjIbBYV328XqTG?=
 =?us-ascii?Q?0ZSHLYXmvAm1eX2thSgKxKvxxU4hwmT2I4Ooftm8n87Vt1nmPDfQkBx33VKn?=
 =?us-ascii?Q?8inlW+8LGIHRK/wZv4A1jYcWswXOdomY7Xk3gwFXlRWgFe5hL4tSX/d14/oF?=
 =?us-ascii?Q?tX48AemSyWSM08DRv7u6xgUaU+pnB2CKidlOGs6d4Ff96M4mva+7pINtjqnz?=
 =?us-ascii?Q?8fZQRNZYGZEXO1/AuknZo0jlcZPziFd7mxS7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:19:58.7992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e93dd74-a613-48da-b68e-08dd730e6f3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442

Introduce the interface file "mbm_assign_mode" to list monitor modes
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

Added an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to handle Arm64
platforms. On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined, whereas on
Arm64, it is. As a result, for MPAM, the file would be either:
[default]
or
[mbm_cntr_assign]

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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

???END
---
 Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index fb90f08e564e..bb96b44019fe 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
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
+	while it is backed by a hardware counter. The user-space is able to
+	specify which of the events in CTRL_MON or MON groups should have a
+	counter assigned using the "mbm_assign_control" file. The number of
+	counters available is described in the "num_mbm_cntrs" file. Changing
+	the mode may cause all counters on the resource to reset.
+
+	"default":
+
+	In default mode, resctrl assumes there is a hardware counter for each
+	event within every CTRL_MON and MON group. On AMD platforms, it is
+	recommended to use the mbm_cntr_assign mode, if supported, to prevent
+	the hardware from resetting counters between reads. This can result in
+	misleading values or display "Unavailable" if no counter is assigned
+	to the event.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 17de38e26f94..626be6becca7 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -882,6 +882,36 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
+					struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
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
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1908,6 +1938,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_local_bytes_config_show,
 		.write		= mbm_local_bytes_config_write,
 	},
+	{
+		.name		= "mbm_assign_mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_mode_show,
+		.fflags		= RFTYPE_MON_INFO,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

