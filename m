Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53293273D83;
	Fri, 13 Jun 2025 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848929; cv=fail; b=PhZNPca/FfveGNjfPe7jK1GopMKLhrIMHWsn8BocBN2fFQU56Q12d7VpiwjqDnfbRXojvh1OAvZHrXgx/ZxPobtVv8G0EVhuyPbtCZNJ+pCyzvQ1xPtU2JsPX28tRohO1/qqVAXTk9bLRsz7OMDTKQ2KUqGpDMGN0KBUdVELGnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848929; c=relaxed/simple;
	bh=WvA3TKCNFS+unuzb5KJbiSYQ+U92xT0gtim7LjrjcZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opRS4yGr+HZnHAAiL7aCaFjDNlCrL6WkBJXRIltHupuWykCkWKN1GAC21yv8r2xiq244KzeHQx2v9sdn6fgBtHxg0oBM2IbNPEWqfQ8Fhu/fF6tXbf/rfWcNxkCcA/AXcuCWbeFKuabD9outZCR0QApECwIetlwN/JSawgJ9LdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aLFfeo1B; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aLFfeo1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywgsgqg3UkVYkHDqUXUibqW2C63dXCcABxL5sun0mNZCuOgJXNllD+5DTl08kpqx1TY6tO6Pl/E4vG2nrXpmxrY99Y+y1D2mWNZKNHawlItoi+ff6TiV+onEv2Km5oZCw59P+jQ2R5p74AewzADqOCaOFVC2JoUd+ben8Y78Y7i94zshmX8wNYnuMs4I94U5abSgED/uitnlteVRHc3QvXqxGSdsCeh4ruCyoGHh9+sGF1uIaMF3WXWz2+AzIDjrgIAsXQ05N0wi8dUV1cFG4jiude/2nEZey155v65iPxOsRdmKpJ1MemWTDjrNhlU9guP6C+wuKJNfJFz39+ViNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vTjq62NH0fKFMgJ2gZOMDOOIUk1H/2KzfnAKvatPng=;
 b=CLO6E92n/sy+mHFNLkrmBc6wFJvPGxQJBtKKzz6Aa5p9NaYrjv8go2G0CrSmTXVGnxJDgFZf0SvS1y389P0Wx2Bo4JIB61vwZa6fDFXbB3LFwojwTFQFIup7eHEsoRXdr0uFWgrY3pEGjcJd1bR84/LsSATmZskUNhWyRISLQdy+sD9amJBt//9XY+unxtX8XhMK7M+l73AHOofxLp8m+xNXGImiI2WnjbD8dRDyzKr6RTKfXX/GC/pFcfLi75aMpum5h6RW6zdotHrdyybEDttVStijdodUPsNkAde9beivzcZfU+qUp9wp67mPQMqe615TEuLVIc52v01YuV8N1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vTjq62NH0fKFMgJ2gZOMDOOIUk1H/2KzfnAKvatPng=;
 b=aLFfeo1BYe5FgQi8P29TdICF2L+NYWVEp7IKUb+ZAT6kA7Kz41E2Bh6x130+egIM63yaUof5uIp9TigcTL2PQZXAfESA29oRsxr/sy0ggaXh97blGygLuT7xN2rPj2Sp/t4G9B7U8pDc8Gg9oIzN4RyNXHREsIELCxmC+Vvq6FM=
Received: from CYZPR17CA0003.namprd17.prod.outlook.com (2603:10b6:930:8c::23)
 by CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 21:08:44 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:8c:cafe::51) by CYZPR17CA0003.outlook.office365.com
 (2603:10b6:930:8c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 21:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:08:44 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:08:41 -0500
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
Subject: [PATCH v14 24/32] fs/resctrl: Add event configuration directory under info/L3_MON/
Date: Fri, 13 Jun 2025 16:05:08 -0500
Message-ID: <612428100e6f4529294c3fead6850aaac303d82a.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|CY8PR12MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: adacf166-b47c-44f2-3d51-08ddaabe7b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S+tNQ5LDs434v2PfGpyJDPKK7LvCxoaAhIEn601U74n6kHaEqT+0p+VuiLjl?=
 =?us-ascii?Q?btcL0fEGo8sWik5ylyn4DlrCG/r/FBKcKC8tDcIgWEpjmhw+aJJjnsmLZIx+?=
 =?us-ascii?Q?i1S5aLYNSlHXCXB/yfWzYbyEYMlijP9M9z6c+EuxawJ0geaJK7jhCLwlcDK4?=
 =?us-ascii?Q?per046XZsLWbiwruMl/9a1vo44epFI94y1IXcycrvimxjPzArdllxZROhZsq?=
 =?us-ascii?Q?Vh4ab1HOiC/26azSf0ZBOjI34UuB8jGaU1TVO2FXX/MHvBjCXC/PS9dmEzI2?=
 =?us-ascii?Q?9tbtrnqUKtq8pYkqGQZdz8UbFSBmNGeAttiQVINuD4WoUJjqXk/Z123M6FM8?=
 =?us-ascii?Q?xkbDhqZTB3kgMi7UiHhWc67TW85iPM+n88g13LHnV4a/HK4FHGi4gRrgNvix?=
 =?us-ascii?Q?0fDuWMaaDObndqPIpQtVH/pflqbAww6SmWfQ+UCOhY7FtmnvBT96QtFcAZio?=
 =?us-ascii?Q?aUjo5nyToMveT4y3IKx1vXsSsbnoQBRnymeQ0swtONBpIFpeW8HS0ngQ0kdw?=
 =?us-ascii?Q?/V9iNW921lTNO8HqJSpHutQ+WgnHKP20uLyuyIyB6K2s2+9pOuk8q1jsCLUh?=
 =?us-ascii?Q?2XVKvTIOka0K50bPHkTa8LtjQyAztiaKtQeSbfIL3vCy1JKK/7w5aLlMO46F?=
 =?us-ascii?Q?GBZqIlsO+hvQ8Mi31yh0CfrDXlzkOXfeR656Pht22zN2REn1XdaM203/EPGL?=
 =?us-ascii?Q?T+l+oIF9zygtvdL4eVM5qoQXiEpzVhaJuIiRZeUf8vOaWDiDJTQQvlQ77R+M?=
 =?us-ascii?Q?n6H11il/7sfudQtwOA9h3nxqZWB1oBiZZBmc7TkO5LVE5dPO9ZY3vZm3RMYf?=
 =?us-ascii?Q?DaUFT4R/oc0LbeKhoiL+R89jaVl5D/qb+Ik/x6Bc31qZ6mLzxZ8Aj12RYiPU?=
 =?us-ascii?Q?mUu4r8uxEj5ZBtEnYLARDV7PnqqrBvjVXUPGgwu3wuEKsug6kIFyVdVaslzb?=
 =?us-ascii?Q?BzHjrWMhJ9lx9rKYlyV/FjrwWZ+9MJIcCIcNVnz7dGpUB1azBDkrvHfoJMFQ?=
 =?us-ascii?Q?1LPgFXRz0vjLUy1LZwd33//FZesNtku7KFz1boWNxZH5wVaE5T0TZPif/UF7?=
 =?us-ascii?Q?1OkRMTUcDBaYPBFEswI0t2CXX8LYGTc90mwvgDQjM+h3scnP0BBYNCkhykc+?=
 =?us-ascii?Q?jtol2y3Aq+1kbVYTLv6CvgWjPSSPvLkycKRPD/fy68XxK4g1MU10MxLqaQsl?=
 =?us-ascii?Q?/DY72/LJsMFpPW28eE7a3+L0gYUFdN26O56jW1qHdt/PFGsNeboRoxaUB2GL?=
 =?us-ascii?Q?HQdomA8RAWm1c93ODqTaBzyn7uUDOJKvQhHoHS6gMG1b7PLq0i5lhusI4y1F?=
 =?us-ascii?Q?c7cWl79TBajv0xQVq8W4Ijc8eUvm9f1j0m8zwXWlYPMvyjm0eONmdgN5MysH?=
 =?us-ascii?Q?IfOYIu9XslBR4AtHgo/yobQoBSoquJQYxFyNNLk2gokLjTCFRJnECTCYD0Gc?=
 =?us-ascii?Q?XRV+eJA8FzboTtC568CFSQkZokNA8FD3yjYIQXdLYzvkV1IMHh629kqPBO0A?=
 =?us-ascii?Q?TVJ01/44+7rtndFz0zO1hGdp8sd853q51rJYyTI58zYd+Ejcw1p8zYpaWw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:08:44.7603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adacf166-b47c-44f2-3d51-08ddaabe7b7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148

When assignable counters are supported the
/sys/fs/resctrl/info/L3_MON/event_configs directory contains a
sub-directory for each MBM event that can be assigned to a counter.
The MBM event sub-directory contains a file named "event_filter" that
is used to view and modify which memory transactions the MBM event is
configured with.

Create the /sys/fs/resctrl/info/L3_MON/event_configs directory on resctrl
mount and pre-populate it with directories for the two existing MBM events:
mbm_total_bytes and mbm_local_bytes. Create the "event_filter" file within
each MBM event directory with the needed *show() that displays the memory
transactions with which the MBM event is configured.

Example:
$ mount -t resctrl resctrl /sys/fs/resctrl
$ cd /sys/fs/resctrl/
$ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
  local_reads, remote_reads, local_non_temporal_writes,
  remote_non_temporal_writes, local_reads_slow_memory,
  remote_reads_slow_memory, dirty_victim_writes_all

$ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
  local_reads, local_non_temporal_writes, local_reads_slow_memory

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Updated the changelog with context. Thanks to Reinette.
     Changed the name of directory to event_configs from counter_config.
     Updated user doc about the memory transactions supported by assignment.
     Removed mbm_mode from struct mon_evt. Not required anymore.

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
 Documentation/filesystems/resctrl.rst | 32 +++++++++++
 fs/resctrl/internal.h                 |  2 +
 fs/resctrl/monitor.c                  |  1 +
 fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 18de335e1ff8..b1db1a53db2a 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -310,6 +310,38 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
 	  0=30;1=30
 
+"event_configs":
+	Directory that exists when "mbm_event" mode is supported. Contains
+	sub-directory for each MBM event that can be assigned to a counter.
+
+	Two MBM events are supported by default: mbm_local_bytes and mbm_total_bytes.
+	Each MBM event's sub-directory contains a file named "event_filter" that is
+	used to view and modify which memory transactions the MBM event is configured
+	with.
+
+	List of memory transaction types supported:
+
+	==========================  ========================================================
+	Name			    Description
+	==========================  ========================================================
+	dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
+	remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
+	local_reads_slow_memory     Reads to slow memory in the local NUMA domain
+	remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
+	local_non_temporal_writes   Non-temporal writes to local NUMA domain
+	remote_reads                Reads to memory in the non-local NUMA domain
+	local_reads                 Reads to memory in the local NUMA domain
+	==========================  ========================================================
+
+	For example::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
+	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
+	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
+
+	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
+	  local_reads, local_non_temporal_writes, local_reads_slow_memory
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 84a136194d9a..ed0e3b695ad5 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -248,6 +248,8 @@ struct mbm_config_value {
 
 #define RFTYPE_DEBUG			BIT(10)
 
+#define RFTYPE_ASSIGN_CONFIG		BIT(11)
+
 #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
 
 #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ef6ef58f180b..09a49029a800 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -956,6 +956,7 @@ int resctrl_mon_resource_init(void)
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		resctrl_file_fflags_init("available_mbm_cntrs",
 					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 	}
 
 	return 0;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5fb6a9939e23..e2fa5e10c2dd 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1909,6 +1909,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
+{
+	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
+	bool sep = false;
+	int i;
+
+	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
+		if (mevt->evt_cfg & mbm_config_values[i].val) {
+			if (sep)
+				seq_putc(seq, ',');
+			seq_printf(seq, "%s", mbm_config_values[i].name);
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
@@ -2033,6 +2052,12 @@ static struct rftype res_common_files[] = {
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
@@ -2315,6 +2340,53 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
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
+	kn_subdir = kernfs_create_dir(l3_mon_kn, "event_configs", l3_mon_kn->mode, NULL);
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
+	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name, kn_subdir->mode, mevt);
+		if (IS_ERR(kn_subdir2)) {
+			ret = PTR_ERR(kn_subdir2);
+			goto out_config;
+		}
+
+		ret = rdtgroup_kn_set_ugid(kn_subdir2);
+		if (ret)
+			goto out_config;
+
+		ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
+		if (!ret)
+			kernfs_activate(kn_subdir);
+	}
+
+out_config:
+	kernfs_put(l3_mon_kn);
+
+	return ret;
+}
+
 static unsigned long fflags_from_resource(struct rdt_resource *r)
 {
 	switch (r->rid) {
@@ -2361,6 +2433,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
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

