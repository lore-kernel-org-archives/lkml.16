Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE46272E43;
	Fri, 13 Jun 2025 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848827; cv=fail; b=mdmMIV6klvc65IqGcTbDqw2oo8GyIRa9/BsmnnsWTOVG29w16LWa40QBVSIVLF00K9giXpuUD77dpKEyF46y3/+IAiz883WtzRgLlgTm5PuKNS1lSPS6n/u194seIKZfJ++whhVEzpNCIOOHZInkhSmFaq46J0RDm6B6LpOczM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848827; c=relaxed/simple;
	bh=zaDuNVaUsH+fg6W8NzZai8/383Q47wJwQs2G9WqHG8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqCwkMiBrv7MMO8WQSUbGH7CH/vB44zm645nWGma8foBphhSjGA/foNobREsKSGJ/OmwlFXjXLDrR1dLzTCZCHSl1Fup0+CMctDhwnodiWrj2d8hsHv5nvYSKLCFqv4Y+hmTb2giMW2wRnhuCc6EXbu/ZvPeeAAfUw1c98JlfJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AQ5C1lw+; arc=fail smtp.client-ip=40.107.223.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AQ5C1lw+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5N8qob1xTkv4EfBIcFLtaCaUw1+Vhp7oud82vt7V2ypZUjMyOiNniAZMWef9kB7RyJBpxHJhZicIyEDmhnj/45d0YmsckPJkmes3k2Of0WXlDePeKidws5NTj4nsP9oJ9SQoFg/fnOUuc5KptHS/GL2L6DKUcC3aKIpzeyTg4GE8HOACswuBm6WuxVS7+9VVcIT93u5tgBrkjyuQxhiyIFryfljddOMJFstOTxmP58JvCGRN3J2QxxEBQ4Lup0aQ3Yl54JyHsafq0QhPEkM4kvzHMunZiNOGOeFuNS6owcppXKsCLErABLIHlM+TtHNpPecO/WuX4RRtMUWFb72Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl4KGpDih1UlzVaqpyiP8pVDptgEp4syaGVNg51TqWs=;
 b=vzycuT4SUG4prWhquZWC94gAW/2b/U0akqt+jT7YbVGbbNY092pCFiJkEDaE9Y92PXiZBy4HxA7tr+v2t4eUIfbnFzHzv/MkEqt/MYv8NCM2b385e8HmwG0b8yl5REJjtbMw21FNJd01axJ23HpqkQXfLgitk0SrTgrDZ9GEMOagd8sShTVKFmKJ0o2TnwgqoHqnfKSyllBIpn8AMZ/X/GmHP1e1JHGY2MUoxkVlVCeoleLL4GiyNLjhtiWlR/tf/rC44ku/B7HOPqH9PR7rshG5itXN4QbTRTA8AkkbZXBa2+sspG3Fa+FIo1JLMiGFubzNMXCzk33HV5JNSUoAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl4KGpDih1UlzVaqpyiP8pVDptgEp4syaGVNg51TqWs=;
 b=AQ5C1lw+PnPeaosEnTwkaQC8sGjpJLGs1Vkh0Z/bDGIb+YcyBpMyY8CXFkaYBVwt5Ns8FxrOrR1r3eQ1Vrha6Gx2iQtEP5JnlZgmwN8aXT7ZhPORSJXXRwA92+/3DM76CkKTIHITSwfmb1V2RAAOnbN9OhtCF2/3dOGqMKdGXVA=
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by DM3PR12MB9414.namprd12.prod.outlook.com (2603:10b6:0:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:07:02 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::58) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Fri,
 13 Jun 2025 21:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:00 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:58 -0500
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
Subject: [PATCH v14 11/32] fs/resctrl: Introduce the interface to display monitoring modes
Date: Fri, 13 Jun 2025 16:04:55 -0500
Message-ID: <b1192216e05c5a5a0963b43698760106644b95eb.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DM3PR12MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: 76491a61-6bcd-4275-85c5-08ddaabe3d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2J3RsmXH5yWFn+Ki5r0c1k8SbAd856TD15vYXFoqVZJQQ+gf68gfYNB2Iv/+?=
 =?us-ascii?Q?CoolgnsZKeNKFRV/qGzfGPG+hMvoQQsTjKbeE7NTf9cBQXR/Bf+iHKMwTbnT?=
 =?us-ascii?Q?WIWw/77lbUiVRmcgpfvpK67aDf6Fz+H3CGcHxklF0zp1VIulL7GQxNLuJWnj?=
 =?us-ascii?Q?s+Qw4aj87cMksOU+Mj6XoxFMR+pLTn85u0kbP7tQCHuYx+4PrYCqv9fARdIN?=
 =?us-ascii?Q?vATwArG8qI9Xo6Knhf7/HEq5FA0cCkL/aABJ6xJNzLFQJ6IryiszkGk1caLg?=
 =?us-ascii?Q?XcpcmqHpdLm0z8faBQ1ySC9xAJwv/J7ye6qzTtAfobJ6XtHKaW+RhK1uQw2W?=
 =?us-ascii?Q?3OgwYFk/rT6jS0WjAK4gKJF9tNQnCKoGc/peEjycWTtgNBFCamf6gqOgdXTC?=
 =?us-ascii?Q?jMz9Dx59Io3scZIj1f/gs9RygBAPurhayEU3becvUM5VCQJpfOq/9DOYEC9l?=
 =?us-ascii?Q?1whj1wPE3nJhhTirKnlzmDqpCctjwD8Chn7NSy619azXj+bOS0remKhOzeOA?=
 =?us-ascii?Q?+puc3PZCJ8nnKLuS8mJnMZNFyIaFPGw3ZnqJrLZuj4GCdOXuBopO7nK7T0b7?=
 =?us-ascii?Q?P9rIwL7bM8XvRf8tiD3ZRuCZL0fz4E1tzmvYYbyVT4Io8YNZBXpW7wIkgwF9?=
 =?us-ascii?Q?h3/JBS8+6H4b9dokP6uuajHR7t/vsB/fJFqVCw022904RMYUWjagUOcFqqFK?=
 =?us-ascii?Q?hRxMPP6F+xb390qOdm6gMzc/GD8JbRLKbHZtTLLNQydV0M/wQbk8YOiDZn6H?=
 =?us-ascii?Q?21ZzW4WgdmwIqfZr8mwJpmZOoEVl8aQwIr4nTo1oSivV43F2NZsU8mxLgpQi?=
 =?us-ascii?Q?d1s3TtRe3iOr48OmCzFRJQYnbV/QqIU8E3AO92mYRTkanmpX3QJ584+KewPt?=
 =?us-ascii?Q?ZPuAt2YAbpvnzZCGxNX5gWLYF60OY6lnrO9Ai8zsH8x6J3o/9Lz//eZyLnwJ?=
 =?us-ascii?Q?Kp9zNWXOlYXZWsXNfGT6GkALwir9y2zmQ4TtjNf6ksc+h7o5ykluUbi0m4zm?=
 =?us-ascii?Q?UVENSP+CdsHiSF7YT1S7U+66WGlHYADb/9YhfLiCR++G74BYI9q+N26Z2r6k?=
 =?us-ascii?Q?r2wg905U9bjQeH7STQ8C4T0xj3GEuoGn5YWoFrXqpjv86/v0k4100AP4SRwY?=
 =?us-ascii?Q?cl/QRkqp+mjzQGkg8hYxSl+u3sEvvjGtX+oJGp5qtGRbVG2YOVGRgOMFzBMq?=
 =?us-ascii?Q?+the0u8c8RVp7IArcIgsAnCY4XQT1jd0fbBWtTDftl/+txqVKuISw/5tODKW?=
 =?us-ascii?Q?JV3iioxkuSuVkXky0V21fWj/7LZxXGzW5EzTwK0wHF0o1COTkxhGdr6cyinS?=
 =?us-ascii?Q?x712OkGhCFDzDmlsnrLtgK8BRv0++txBc0p8i9JeZJGCIhLtr9O/yfMf1sPw?=
 =?us-ascii?Q?/SFis0ZZslgVaqN9nfq8bS1jsgFa/G+Ylxn+uMvQ2HLWcfjleBwGCwk1+alE?=
 =?us-ascii?Q?Qyqpx8UN7xR5t898rBhzruFRE445BpruRwfL2bDfLae3sxBD9aDRnTfPCuQz?=
 =?us-ascii?Q?o+O5jx6feYR5uIh2a4AbgaMiS3fHOqhafxqhaXPZuT0b9egEPs+uP71RrA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:00.5453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76491a61-6bcd-4275-85c5-08ddaabe3d5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414

Introduce the resctrl file "mbm_assign_mode" to list the supported
monitoring modes.

The "mbm_event" mode allows users to assign a hardware counter ID to an
RMID, event pair and monitor bandwidth usage as long as it is assigned.
The hardware continues to track the assigned counter until it is
explicitly unassigned by the user. Each event within a resctrl group
can be assigned independently in this mode.

On AMD systems "mbm_event" mode is backed by the ABMC (Assignable
Bandwidth Monitoring Counters) hardware feature and is enabled by default.

The "default" mode is the existing mode that works without the explicit
counter assignment, instead relying on dynamic counter assignment by
hardware that may result in hardware not dedicating a counter resulting
in monitoring data reads returning "Unavailable".

Provide an interface to display the monitor modes on the system.

$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_event]
default

Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.

On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
defined when the "mbm_event" mode is supported.

Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the user
interface remains compatible with upcoming Arm64 support. IS_ENABLED()
safely evaluates to 0 when the configuration is not defined.

As a result, for MPAM, the display would be either:
[default]
or
[mbm_event]

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Changed the name of the monitor mode to mbm_cntr_evt_assign based on the discussion.
     https://lore.kernel.org/lkml/7628cec8-5914-4895-8289-027e7821777e@amd.com/
     Changed the name of the mbm_assign_mode's.
     Updated resctrl.rst for mbm_event mode.
     Changed subject line to fs/resctrl.

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
 Documentation/filesystems/resctrl.rst | 31 ++++++++++++++++++++++
 fs/resctrl/rdtgroup.c                 | 37 +++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c97fd77a107d..4e76e4ac5d3a 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -257,6 +257,37 @@ with the following files:
 	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
 	    0=0x30;1=0x30;3=0x15;4=0x15
 
+"mbm_assign_mode":
+	The supported monitoring modes. The enclosed brackets indicate which mode
+	is enabled.
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+	  [mbm_event]
+	  default
+
+	"mbm_event":
+
+	mbm_event mode allows users to assign a hardware counter ID to an RMID, event
+	pair and monitor the bandwidth usage as long as it is assigned. The hardware
+	continues to track the assigned counter until it is explicitly unassigned by
+	the user. Each event within a resctrl group can be assigned independently.
+
+	In this mode, a monitoring event can only accumulate data while it is backed
+	by a hardware counter. Use "mbm_L3_assignments" found in each CTRL_MON and MON
+	group to specify which of the events should have a counter assigned. The number
+	of counters available is described in the "num_mbm_cntrs" file. Changing the
+	mode may cause all counters on the resource to reset.
+
+	"default":
+
+	In default mode, resctrl assumes there is a hardware counter for each
+	event within every CTRL_MON and MON group. On AMD platforms, it is
+	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
+	events between reads resulting from hardware re-allocating counters. This can
+	result in misleading values or display "Unavailable" if no counter is assigned
+	to the event.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5874cfdf8d8d..ba7a9a68c5a6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1799,6 +1799,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
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
+			seq_puts(s, "[mbm_event]\n");
+		else
+			seq_puts(s, "[default]\n");
+
+		if (!IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED)) {
+			if (enabled)
+				seq_puts(s, "default\n");
+			else
+				seq_puts(s, "mbm_event\n");
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
@@ -1911,6 +1941,13 @@ static struct rftype res_common_files[] = {
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

