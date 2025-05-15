Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E328CF7E;
	Thu, 15 May 2025 22:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349730; cv=fail; b=t1Lm7ZAeaQ73SyTLoOwejlPviwo+T4IqHTycC5kflrUf+vzLZT3/ZmKKhHEJP5fp4Lf2X8juX8+tlaaezOrHyzx2WP51trCcSDUVy/HRT4PhLXgKC7scNrzB5RgzAC8h2LXTZY+zdvLBQznF4gOwGFGxzDycXD8PbxcB6nsygWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349730; c=relaxed/simple;
	bh=EBwau4Xsn0DYiXJ33qCq4cPdsrn6ZBvWFmnzClGX9bU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDbxuvwy1P01uFD6y/piWEwrQgGwXq9WxXrvTVMcUKV/FTsG7M488lHY8SH3xoApwe5jjScLFZl5E7waURiLK4cMMFYpJOxa6uYQFAwJHawvgqyJEQ88pKWQSFljOEoOL+ShftlfqrBRckpwk4VzVr/beqZlIivlvYRzuDN/A4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vZ20gUjO; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vZ20gUjO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKJAkqvJkOaGM3pwXAAiVDO44PCXoLFpaM/xDuL3oq60Xs9Vkay83vpyFWI3/yF5TAszxLR2as/te25wHiyR9wjCaMHmK0KyqNEpfYAcf48tcEGBqGxoVzjabC2QOnjX8hkcR0Uf6oNsWw7GHIRJTHgytlPs8LeyxP80J9QQQpHpZBjTteYGjcYUA+bshsEe/W6+013RB2aNwt9q2SH6bFrSIFk8OrdjAz9l7mRI1ved6TjB1FyO1r6C+oVxvZcVhPgVB0nr1adZMCFJlM8vxHuI+0uRyrDhSTs8wVdX1vq5caW3hJWIbXAcAocMDAAt6LAcXn9CT14CuUZ/utHapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT/BiTKjuIs3kjLdUA8qcAh1yyZRCDE2nsB5XZ+65cs=;
 b=Qpe7L2hRVtSjlHIRBc+IK07aQdO3EN2EJawdxNFJufqO3Gl4D6NETTQ5z6axJpMtX9maIYNkPT3qZUhubIXCa9tP4JPQ7pFfZ/6z6DXzAQ4REkarcO2uXjLNhcwZvLAszZlxNoBpBv4OcBnAg2ixXwF3FsKTO97hl68I+r2+PKt5I4U1s2WZElcoS6zPH69ZZsJlU2xQrdkukNdGjdOaNVA4TPPLR1uaPhapVDRY7OLlOCEi8md0j83BztEFagYCwFrv5yShoyLPe+DNpdFBB9gjFzBZQrNcF1xCsMt8eotoVBhVmI2aMhMpk/w3hnyr0e04FJdtjWwAwC13LKwWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT/BiTKjuIs3kjLdUA8qcAh1yyZRCDE2nsB5XZ+65cs=;
 b=vZ20gUjOSZZ2pbMwYQX4tuirz4pHtEZuu7QgKi1x0OiSLgX7WBMtKuib2ODUL/Jw9oIYRZ1i+jN5Eg6gJPvc8uTUWsof+MULGiRciC79OUo8K+l3H5Fd0L44RMc8vV4mcJiPJ9/5kfLdqMVVXFawwyrOIWD8rvzohHG1L6EK5+o=
Received: from BN7PR06CA0071.namprd06.prod.outlook.com (2603:10b6:408:34::48)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 22:55:24 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::f3) by BN7PR06CA0071.outlook.office365.com
 (2603:10b6:408:34::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Thu,
 15 May 2025 22:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 22:55:23 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 17:55:21 -0500
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
Subject: [PATCH v13 19/27] x86/resctrl: Add event configuration directory under info/L3_MON/
Date: Thu, 15 May 2025 17:52:04 -0500
Message-ID: <3e7ae289622f9ff019604f2e7b78de33924c2a65.1747349530.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DS7PR12MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: 616578e7-901f-4607-d46f-08dd940393ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zzsYDLLQJ7Yi5IxKQk+PcwvMU1UTTIXJtt6h0jn8LSSGMzqFTSURwM8lsK2c?=
 =?us-ascii?Q?qYUOBFkwmRuUIsVNYjFRQ3y8iOk9HZ45kwlfyBax/EEgv+rnnSL7taRfvLag?=
 =?us-ascii?Q?KPLbWEvI7X+5xaH2nz6Q/uLLqAO2y/1mC81gEvZQNDHkVPpakBR38hdL5HXA?=
 =?us-ascii?Q?HrvPpIClwMRwTZfBPOx3F4WOG9OPpkYvYD73EUSeO5ilprCJpUo/UrOIi19c?=
 =?us-ascii?Q?JfAqz0W6XNT5C697rOTv7Qdz9x2D29yeK8cBD/BNVHRvx96SdE5EtALn5/82?=
 =?us-ascii?Q?pFdBnQWdu5FVHGKJ2vPHnQqtcgvkqmPRqzf1k5TbRLWnVND+8RVQGS4J0fGB?=
 =?us-ascii?Q?9d1n6guWClgjyqrQWxne8j7wR/n7B2oAl8Q8PdL0K28qFsMGVeml1Y1si/zd?=
 =?us-ascii?Q?/0FqIp6Ge3sK7oMM6A39iQimgsfbVvs6REiDEKOrzpiwo74mqJSTiysSjX2e?=
 =?us-ascii?Q?EYf2Hltg1gQyH2/4kFsYAUGuuE1QWs0T589Ec6OkXi3zghz8bXB87OhG8B0V?=
 =?us-ascii?Q?P4VWOplM2cR434t1Z/BroLtZR5fbI28hDKeUCP51Sy3vAnpHPckVu8vPwiJL?=
 =?us-ascii?Q?c347xB7HmJEkWjnWpYKx2X1vsMwbNp3ccQkUoYJmNMUUDFl8Hq/q31dkMQ5A?=
 =?us-ascii?Q?ophBzjmp7TMOTe9hyQHfB5Vl0eoumpqoALgZmNY9h76GVzlAwv9SRzkZDmNv?=
 =?us-ascii?Q?WPfqH2cO9GNI7Xy+tFDBg5c8YgVe3ML8bYM56PNYTdjmyrGhw/JWAizo3VcA?=
 =?us-ascii?Q?L5N4isjt7M5YETlSPcv+lOsBLLxkLDO9wsuJ4PHfKD0o6GsZmAy4H+uWXrtD?=
 =?us-ascii?Q?yXr1wjBD0wPFIiKq4uJq1hHiRn4LS3PWszS4Yz68Ymzre3YU92acdr0WtYi9?=
 =?us-ascii?Q?SgG2opc/JmClrhu66DyOqr4foUINfQuIjvTB7lhl4D1z2EIvAHVyhlDDCdOW?=
 =?us-ascii?Q?Rwh4sLG0Ff05z5Z6g0q3dOYjrpNhcwkmE4hSedaEzFcN3Mr51Gn4LZvoEbXc?=
 =?us-ascii?Q?UqeVrSpjkjKUTJ5db7I/gbkja0nlmH55bi0Jw3cm5SFuaTGw6AGXl0EQ8tMB?=
 =?us-ascii?Q?DDU+NM944pM4V1TsJHP7rnVmdAZgzw4OyJXH9ITxbUurN5hoHFChAnU20FWt?=
 =?us-ascii?Q?MKATquTdI6cLwCfrstIJuTSg8jELWRGZdhFrde9sghULi1vQDBmsdAdJ5Oe1?=
 =?us-ascii?Q?2LohngHaif78U9kl6O4MTqpqskt4V7V0P0NY5FxErphsqSmcDBX0ZXS482sJ?=
 =?us-ascii?Q?xyAUAsx7SrM9P5BZUbup/nIRt3Sx+efVhI07XZvAuqL7UKWa3Lp0qiQOZaW0?=
 =?us-ascii?Q?0MghBN2W96cKVVtK0XrQEEo2+lhok0dIrFbil+5bd84DMKB3sU86eatsuZu7?=
 =?us-ascii?Q?X+spIFOweTvMsf29d4ZICctekzQ6zGF0+c4U9rdBb4BD6uXSLmFmAY9BguYq?=
 =?us-ascii?Q?aw+DsRnZA8nKbpQr1J1uXaF1a1O0Z0cbyyNvyQs5piSkhNILjiOBheQrHCGV?=
 =?us-ascii?Q?9p8ywVLXYx5EzfGFZWerk6q6a/aWSgbLUFC7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:55:23.9508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616578e7-901f-4607-d46f-08dd940393ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475

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
v13: Updated user doc (resctrl.rst).
     Changed the name of the function resctrl_mkdir_info_configs to
     resctrl_mkdir_counter_configs().
     Replaced seq_puts() with seq_putc() where applicable.
     Removed RFTYPE_MON_CONFIG definition. Not required.
     Changed the name of the flag RFTYPE_CONFIG to RFTYPE_ASSIGN_CONFIG.
     Reinette suggested RFTYPE_MBM_EVENT_CONFIG but RFTYPE_ASSIGN_CONFIG
     seemed shorter and pricise.
     The configuration is created using evt_list.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The monitor.c/rdtgroup.c files have been split between the FS and ARCH directories.

v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
---
 Documentation/filesystems/resctrl.rst | 30 ++++++++++
 fs/resctrl/internal.h                 |  2 +
 fs/resctrl/monitor.c                  |  1 +
 fs/resctrl/rdtgroup.c                 | 80 +++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 5cf2d742f04c..4eb9f007ba3d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -306,6 +306,36 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
 	  0=30;1=30
 
+"counter_configs":
+	When the "mbm_cntr_assign" mode is supported, a dedicated directory is created
+	under the "L3_MON" directory to store configuration files.
+
+	These files contain the list of configurable events. There are two default
+	configurations: mbm_local_bytes and mbm_total_bytes.
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
+	For example::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
+	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
+	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
+
+	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
+	  local_reads, local_non_temporal_writes, local_reads_slow_memory
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 019d00bf5adf..446cc9cc61df 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -238,6 +238,8 @@ struct mbm_evt_value {
 
 #define RFTYPE_DEBUG			BIT(10)
 
+#define RFTYPE_ASSIGN_CONFIG		BIT(11)
+
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 72f3dfb5b903..1f72249a5c93 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -932,6 +932,7 @@ int resctrl_mon_resource_init(void)
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("available_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index b109e91096b0..cf84e3a382ac 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1911,6 +1911,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
+{
+	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
+	bool sep = false;
+	int i;
+
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (mevt->evt_cfg & mbm_evt_values[i].evt_val) {
+			if (sep)
+				seq_putc(seq, ',');
+			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
+			sep = true;
+		}
+	}
+	seq_putc(seq, '\n');
+
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2035,6 +2054,12 @@ static struct rftype res_common_files[] = {
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
@@ -2317,6 +2342,55 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
 	return ret;
 }
 
+static int resctrl_mkdir_counter_configs(struct rdt_resource *r, char *name)
+{
+	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
+	struct mon_evt *mevt;
+	int ret;
+
+	l3_mon_kn = kernfs_find_and_get(kn_info, name);
+	if (!l3_mon_kn)
+		return -ENOENT;
+
+	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, NULL);
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
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
+		if (mevt->mbm_mode == MBM_MODE_ASSIGN) {
+			kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name,
+						       kn_subdir->mode, mevt);
+			if (IS_ERR(kn_subdir2)) {
+				ret = PTR_ERR(kn_subdir2);
+				goto config_out;
+			}
+
+			ret = rdtgroup_kn_set_ugid(kn_subdir2);
+			if (ret)
+				goto config_out;
+
+			ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
+			if (!ret)
+				kernfs_activate(kn_subdir);
+		}
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
@@ -2363,6 +2437,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
 		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
 		if (ret)
 			goto out_destroy;
+
+		if (r->mon.mbm_cntr_assignable) {
+			ret = resctrl_mkdir_counter_configs(r, name);
+			if (ret)
+				goto out_destroy;
+		}
 	}
 
 	ret = rdtgroup_kn_set_ugid(kn_info);
-- 
2.34.1

