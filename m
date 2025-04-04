Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B61D79B3;
	Fri,  4 Apr 2025 00:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726106; cv=fail; b=EMJq80Z5X7EbU4VLaUMf33qL26ibYFxI7ersUnmULt/NeApNDgMHJfq6kTswsG0K4CdvVjlDAaT0jy9UUNn3sU6oHYqLux1JxE5CLpIr0SkbIzpkRYZ+2PN/Nhdc0jS6SiKzswc7BtNrdg5ockYtv2SYsQxi8tojpikPhyk1IVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726106; c=relaxed/simple;
	bh=0J9Wdv6NQKVw8c/0cqYhQM3VHB6wlP57r1a/NHHYfHE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oext4MA5mz35st9ue4zTJ5k0G2ZRh2PepRdxhWuiU0zg2cjDfcn8RgSpe/H8+q4xMoBb1S2ES2sldYMaYocm4aflX75skU90svkF1iegssKQdKdKKFGgYmu+ovX41DKkz9af8OW6xfB2AFFIDjMNn8wVG2weXGMGpGY0ueqp+VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FStdEDyQ; arc=fail smtp.client-ip=40.107.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FStdEDyQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kW6zLTc+r0vwsPQU2LenrOSe1SETZqZu7MTLchQYRxd+VEohKnfky74Ggu1ko1YlHbI3SVnk5uoGQkxDiVsgrjS1KredPj15RMeDnVRJvho3t7Pe31bLXgC/ruqDVi9GsSEXNI21P+M4PYQbihCj2psLZGcpcj3Uvg3Sdoqlk2gONFa252TpqFPFUcXDWNNIjMD7Hr1hkPPxjN6KRI2nLpKRWoh6+7fi6VxRrFLc6V7HKiqoFdlfB5y19Oj4nMY/6ub/Gkw9Gl7fczhuoO+CHnbv0p5fEh9QpPRnILTCiPIMBwmlcABotoD0luCV3ZszS7LhNpZMFU1qB4QXyUI8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHFhscBzTX1LROC6TXLmhMJVg18AR+MTkQ8OFgJJjWI=;
 b=liNjesLM2KntDYEG89dmpgPL+jbqAk2b9CiUTHecHUJzBK89Ge9nJaQBqA7Re9deObBenMLSJQ87eDV5o/roHcGW0oQWho77Wo+XvC2w2eQempF9HQqt9xms1jrHdrVaabA1rQ7NZSRSp86iFwfdBFSYsIQRgCq0HZDurEq8kOpqfRcmsilIyRcix/ayeLNuWU/+OEmHTZPcEqzjSymZmy7ly38kr5Ap4p7LKakTwOprjmmxMhyKaAaCvlBNgeOh+7k0olNaBE8TXCk1bopvwGFSQeFCIAJf9ct5klcicTyrsbhHLj+dq7zXa5N1UaeHIO9Ty+2B4FlGFW2/2xSjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHFhscBzTX1LROC6TXLmhMJVg18AR+MTkQ8OFgJJjWI=;
 b=FStdEDyQN7+QFVfdi3XUeLej3qnGXoYwi6C6dWaOJm65dlbAmNN6uWjO8JmUKe9bDZz2/VchajYM7OHL+7pPBLA9XdYi+PrH/LdHwE43h1/O1Cpu0Z6uotkWBioYLhKHccwwt+tM9be1lykOPd4tjCjm2HEPfX5OzFwdDDgsjBU=
Received: from MW4PR03CA0066.namprd03.prod.outlook.com (2603:10b6:303:b6::11)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 00:21:41 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::79) by MW4PR03CA0066.outlook.office365.com
 (2603:10b6:303:b6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Fri,
 4 Apr 2025 00:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:21:41 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:21:38 -0500
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
Subject: [PATCH v12 19/26] x86/resctrl: Add event configuration directory under info/L3_MON/
Date: Thu, 3 Apr 2025 19:18:28 -0500
Message-ID: <b5b9dcc35d737b999aee9f1aee727d0eced5739c.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2261be-f789-4821-b77a-08dd730eac3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vbYbUv7Hi/1wLxVqhQiIADecTSIwdAFSG8czw5+Lz4OXHfTibENmLSguE7e4?=
 =?us-ascii?Q?R4lKB0bZi5C3J7rVd0sXYHFXMhOLAcNBygrST4o0y8tlpKIY42Zg2Qas7Vn+?=
 =?us-ascii?Q?oETG1A4yOqXIo57C9cJNeR1m0ZRVy+p01rrwEiiXVrIuM/mqwNiDGx+G4KtY?=
 =?us-ascii?Q?Lw+0PA/eN1Tcpxwf4frRLE5OJ6z/V8RKbB/alFdmNFA7el9KybzSvT4jEDlx?=
 =?us-ascii?Q?Lfrjc6vmG92FWLr/Zr0HA5uxbfk5A8nZfI1aWcWYKCsvX6/NB+VFYU6oHU5A?=
 =?us-ascii?Q?tQt2ga5e0rWPfQ2kTPcCQA7KqqVy7n81gLN2XnNpuITHLXETog4D5JblyiOB?=
 =?us-ascii?Q?gPGitm8jyD3iSyD1XaiunELkDKLA2iDeTbxWfdUHV2BCV98TqLn9KKWCS9EB?=
 =?us-ascii?Q?yD4lGAoXxnntte3l5BYY5bnW4T3J8U5PSFSpMfaxo+j3FNycjGH1dJf6lHpU?=
 =?us-ascii?Q?2ni3pGatB53Tx6fim7eX5kOresUttHQSp7kiQw2GHRuiJQ2KaT7o96TcGyyZ?=
 =?us-ascii?Q?xG4MOtQ+SyfGLvAXFwjZyTcF8xPY+/KfYTubkDlyAMYdlC2zt09X1d7C1Ent?=
 =?us-ascii?Q?izClpMQQPwHeVpHWSR2hOaLYs0uKOmpFiqt9gINiR/qv2880YIr0YMWt75Rj?=
 =?us-ascii?Q?jrlwC6AqMkgC172+HTWEpzuwtjh1/UWa6VSEbODRIv0qQsX/mfQBF8/pA7YQ?=
 =?us-ascii?Q?L68gRpnRvJlh6UqtQ6BSruB2UNqXp17p28g2rwQpAY/MgORw2t5QIfbfxOB/?=
 =?us-ascii?Q?HTnkMRYueQTJdg227T4wkNdLujOld+A4MGru8NwA16Hb0CcoNNXNPFR0/3+f?=
 =?us-ascii?Q?dFd9nSzeRM0JH/T5yjepo97f65Fyr9f+8CPEX88h5khTjseCo7UJt6MpjRDo?=
 =?us-ascii?Q?dyR5gBhUGddujhWGYS0gbiEVutOD/whglmIEYk1ScAS4S+MyKiK897oJJZxH?=
 =?us-ascii?Q?logEwD9hZSGxb2uSuZwxVZLsChQ9hJMB63tS+EpoviCOFlnNMGckz5qiLW+G?=
 =?us-ascii?Q?sGNsYo6fIlJsq/PRgJrRfOFwSYTC9PF2XH2dfEGVbNjlHl7IZpOWE3/kqCAR?=
 =?us-ascii?Q?m+2jMHcirBf4Nbb1g7nNAq9TwWUE+GtjMSLhBSYGy2k1J2kR08dGdxinfAsn?=
 =?us-ascii?Q?iFFZa70cy4nyO2COlCVyWh8pxD8MpsgHx6CLtSgP6swEesV1xS2O0atW6+Ss?=
 =?us-ascii?Q?l00bVZnzOznlvtCUcQ8DehihZ7R37wW0fqAbr2seWd3YLRruA5b43G7+O3wT?=
 =?us-ascii?Q?PtWbF0MNZ2MnlH0oA0EMHg9L7r/XLXb0DVTEXv1cu+ZkxHHsbM5mthLfRRRx?=
 =?us-ascii?Q?sHnuCyMMWuUILY+CMnX/gUqeaPjAdzuasLGGCnKNUAf+8AB4AaolO8ayE/0g?=
 =?us-ascii?Q?QZXrGI93kf9N5vLH/wJM1Q0d5GBqp6/dgmnM0huLcDVBXtm9RGM10KKmoFcL?=
 =?us-ascii?Q?ftPt+JEP5BRNmEltpxs/Bx1ylxqjvtbGffLzr7KgneOcuPbu1MfCntqr3cfc?=
 =?us-ascii?Q?xH9ZYL/HgubT/Bo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:21:41.1287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2261be-f789-4821-b77a-08dd730eac3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029

Create the configuration directory and files for mbm_cntr_assign mode.
These configurations will be used to assign MBM events in mbm_cntr_assign
mode, with two default configurations created upon mounting.

Example:
$ cd /sys/fs/resctrl/
$ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
  local_reads, remote_reads, local_non_temporal_writes,
  remote_non_temporal_writes, local_reads_slow_memory,
  remote_reads_slow_memory, dirty_victim_writes_all

$ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
  local_reads, local_non_temporal_writes, local_reads_slow_memory

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
---
 Documentation/arch/x86/resctrl.rst     | 29 ++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 77 ++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 71ed1cfed33a..99f9f4b9b501 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -306,6 +306,35 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
 	  0=30;1=30
 
+"counter_configs:
+	The directory for storing event configuration files, which will be used to
+	assign counters when the mbm_cntr_assign mode is enabled.
+
+	Following types of events are supported:
+
+	==== ========================= ============================================================
+	Bits Name   		         Description
+	==== ========================= ============================================================
+	6    dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
+	5    remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
+	4    local_reads_slow_memory     Reads to slow memory in the local NUMA domain
+	3    remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
+	2    local_non_temporal_writes   Non-temporal writes to local NUMA domain
+	1    remote_reads                Reads to memory in the non-local NUMA domain
+	0    local_reads                 Reads to memory in the local NUMA domain
+	==== ========================= ==========================================================
+
+	Two default configurations, mbm_local_bytes and mbm_total_bytes, will be created
+	upon mounting.
+	::
+
+	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+	    local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
+	    local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
+
+	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
+	    local_reads, local_non_temporal_writes, local_reads_slow_memory
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index b7d1a59f09f8..a943450bf2c8 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -282,11 +282,13 @@ struct mbm_cntr_cfg {
 #define RFTYPE_RES_CACHE		BIT(8)
 #define RFTYPE_RES_MB			BIT(9)
 #define RFTYPE_DEBUG			BIT(10)
+#define RFTYPE_CONFIG			BIT(11)
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
 #define RFTYPE_TOP_INFO			(RFTYPE_INFO | RFTYPE_TOP)
 #define RFTYPE_CTRL_BASE		(RFTYPE_BASE | RFTYPE_CTRL)
 #define RFTYPE_MON_BASE			(RFTYPE_BASE | RFTYPE_MON)
+#define RFTYPE_MON_CONFIG		(RFTYPE_CONFIG | RFTYPE_MON)
 
 /* List of all resource groups */
 extern struct list_head rdt_all_groups;
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 58476c065921..4525295b1725 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1264,6 +1264,7 @@ int __init resctrl_mon_resource_init(void)
 	if (r->mon.mbm_cntr_assignable) {
 		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
 		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
+		resctrl_file_fflags_init("event_filter", RFTYPE_MON_CONFIG);
 	}
 
 	return 0;
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index aba23e2096db..b2122a1dd36c 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1907,6 +1907,25 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
+{
+	struct mbm_assign_config *assign_config = of->kn->parent->priv;
+	bool sep = false;
+	int i;
+
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (assign_config->val & mbm_evt_values[i].evt_val) {
+			if (sep)
+				seq_puts(seq, ", ");
+			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
+			sep = true;
+		}
+	}
+	seq_puts(seq, "\n");
+
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2019,6 +2038,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_local_bytes_config_show,
 		.write		= mbm_local_bytes_config_write,
 	},
+	{
+		.name		= "event_filter",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= event_filter_show,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0444,
@@ -2314,6 +2339,52 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
 	return ret;
 }
 
+static int resctrl_mkdir_info_configs(void *priv,  char *name, unsigned long fflags)
+{
+	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
+	int ret, i;
+
+	l3_mon_kn = kernfs_find_and_get(kn_info, name);
+	if (!l3_mon_kn)
+		return -ENOENT;
+
+	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, priv);
+	if (IS_ERR(kn_subdir)) {
+		kernfs_put(l3_mon_kn);
+		return PTR_ERR(kn_subdir);
+	}
+
+	ret = rdtgroup_kn_set_ugid(kn_subdir);
+	if (ret) {
+		kernfs_put(l3_mon_kn);
+		return ret;
+	}
+
+	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {
+		kn_subdir2 = kernfs_create_dir(kn_subdir, mbm_assign_configs[i].name,
+					       kn_subdir->mode, &mbm_assign_configs[i]);
+		if (IS_ERR(kn_subdir)) {
+			ret = PTR_ERR(kn_subdir2);
+			goto config_out;
+		}
+
+		ret = rdtgroup_kn_set_ugid(kn_subdir2);
+		if (ret)
+			goto config_out;
+
+		ret = rdtgroup_add_files(kn_subdir2, fflags);
+		if (!ret)
+			kernfs_activate(kn_subdir);
+	}
+
+config_out:
+	kernfs_put(l3_mon_kn);
+	if (ret)
+		kernfs_remove(kn_subdir);
+
+	return ret;
+}
+
 static unsigned long fflags_from_resource(struct rdt_resource *r)
 {
 	switch (r->rid) {
@@ -2360,6 +2431,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
 		if (ret)
 			goto out_destroy;
+
+		if (r->mon.mbm_cntr_assignable) {
+			ret = resctrl_mkdir_info_configs(r, name, RFTYPE_MON_CONFIG);
+			if (ret)
+				goto out_destroy;
+		}
 	}
 
 	ret = rdtgroup_kn_set_ugid(kn_info);
-- 
2.34.1

