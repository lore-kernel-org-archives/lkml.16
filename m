Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5071E5B91;
	Fri,  4 Apr 2025 00:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726155; cv=fail; b=W0V1uJuOxCDm6a8NG6YvIYW+eWVlZU33D4Lmw6a8ZkV+bK54YVwb2YqF5rZQLwukPyqWtYY/FCLz94QZ0UYo8XOq1kGsMS+SWEAFiw5h5rrnjAvbXc2yDfFzyevqw9J9d+LWCOAHDlMcliC5GD47uu1qDm3l6CzlhT8jgjxnSHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726155; c=relaxed/simple;
	bh=GcLhMnG+jbIWaDtDTwVq057ebZ4HANtJNN/nDIwwLnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANDQrt0zVZcKncuFiMNJRlQvFzd7eyrAr7JnNR0WWWZ6bIGGnt/tho50FRTHl9VT1n6O+WBlGM9QBSTsNU2qimhSKggsr8VoLn8B5/+vnBdIo55IWOcK6OPTutHvZEC7t/kgXJNxTPuQL+lePFPkBCi4bYI79fIjmUPnZEiUVmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LLKUpH3R; arc=fail smtp.client-ip=40.107.101.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LLKUpH3R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP2ShOIiDTmMkHAh9L9SUgYbvQYxNMPKsJd1YEcljtatrSdKBpXrpUVxoXbByJGw7X4nJHZ5D10AwWNvGpjiVZ9QBU+79ZfJymBm10kR9SknsTVYK4bXxcsYCQMWxBeujKASE4M6AZKBlp/m0AOAmMNNoMu6hqTLPcTsoyX+cMTeSLlH7kE92I+6ZMTf4jUQt63WoZ9FrE2xWs2lChADo4XvFWdqizBwUySQWCDbRZ5bbI6G8QapmB3zjxolFSWj0CKheNBDiHUM2CCpVbdiag/OhTNp3L1+zr0do+38ROyaGILEU2cdI2JPSGX2Acwj/p5OvNt5ylfqybP6/d72eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ts6FtxXgxHhjnsICQseYPoLIVMh/MzokXc19arnCp4=;
 b=qptWsJwJEymMcrlkCpPTAS0jm8jWWAu9Zaiqr9m2xywZGjEr/+x2holv0x2FyVyK2pcC1oTkO6Y76UQyf04BpRkzbzYPYAeORwgzj5ESq10cJuh1LC/x6J7jgjRZXaRAW4QAZqT5k+aoGLYjBGw6iPP+UUB+IOIp4HIDoYuGGiBzne8tjVhNw0BeNAQAtI548Y0JsJPBddqstNrg9UyoyZVWWWr2lApKYLy1ZFvPnD1cX+HcxSUUDoI9njtABTJkdvyaOcwnrwkPo2ryQ/TiMAg5imSQSx3ArrKmWIF+Gav/0Y2crMvQsIDCKNDfUmVlOFDlCRRx6NagpoGF/Efpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ts6FtxXgxHhjnsICQseYPoLIVMh/MzokXc19arnCp4=;
 b=LLKUpH3Rs0eEhEE8dpvtS4JWmoSFbZRc93Y1cOyTWhSa69lB9zvaLYRhd5I2zmnRfaPWAhgjsSyohxZwCeUYizC0eRuMJ4E49REw9GHWTIrf6Kv3s7tTJBQzi+1SEws/R5ACf/vQ5hATk6QPIyXwbNaJJkhkuEKldI8sHZ9XRI8=
Received: from BYAPR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:c0::46)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 00:22:28 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::3a) by BYAPR05CA0033.outlook.office365.com
 (2603:10b6:a03:c0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.38 via Frontend Transport; Fri,
 4 Apr 2025 00:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:22:27 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:22:24 -0500
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
Subject: [PATCH v12 24/26] x86/resctrl: Introduce the interface to modify assignments in a group
Date: Thu, 3 Apr 2025 19:18:33 -0500
Message-ID: <0ee567cbcb78fd1fb018aeb8846eb6d56912fd56.1743725907.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743725907.git.babu.moger@amd.com>
References: <cover.1743725907.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="Venkatamma123$"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b826a0-8db9-4c0a-08ae-08dd730ec811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q3n6CIsk31pTkkoHnUVSbae7fhMNNSDpMg63m35JSUoPLUkVv1yp2p7iJIjw?=
 =?us-ascii?Q?UGLvXjeUg1lJTVcPsqNUTuV9+HQv6QZG7C6V11gtnBfKXnk/sl7Cix+jexta?=
 =?us-ascii?Q?lm9Q9OrE86SlHutB/+eIRjwwJtslcJcc2pXXWzFJovoB+PchPXZR8aKbuf0i?=
 =?us-ascii?Q?3ZJQbuLsgM+CxoBpBVqPgdirTeqSxJmxSRQ9NinWgYzLRYeHy3ZwRh6eK7O9?=
 =?us-ascii?Q?yx2l9e5WGR43mCrj4MAvNnULuB09XdFwep1TOjytGEFyu+ShjS8NWJ++MB65?=
 =?us-ascii?Q?g9XCYgt8uNj6KM/5+HaCkZ0qaZpyWDmvkx9CYnU5LwuxASRZvVAY8rlJpcxa?=
 =?us-ascii?Q?Q0oCeJ/hUYixj/wsdS9gJtDHG7vVXIGS+YTGg93N6EolWDGl1J2wjsYIRshc?=
 =?us-ascii?Q?0WCDnY9DBArHmpNa/KqA9WdUOHtdjSaisQDTh3O0sN6DqHvu1pud813JFoYH?=
 =?us-ascii?Q?UBtPCDV06weGjMHxqHhs/5R3hqQJ90DxcDun+Lq8w0ZaK1ODXvqTcWWFAEgc?=
 =?us-ascii?Q?4LiP1otYzXjmVSNQc65fDk1NQQ9vAoSmiQ+aMSi5SAXeAY80wjUN7Io7CbiK?=
 =?us-ascii?Q?0UCSRcXV8t72ZK/hsR9Ax7HlJaz96dVw7RxxTuzlxzpOM+BogBrvXjCMIgWB?=
 =?us-ascii?Q?Qd2PE6xsncBQMmf9W+cK+c2t/S5C7hWDUs7Qpo85xFGZr8xQ2q5C7xUZAqil?=
 =?us-ascii?Q?E+7ZMFzwLKTpt6lQIuAZkqA1FG3mMGlIhPwLafal60kpUzfjWHtSer0sxiZO?=
 =?us-ascii?Q?3youayO6Q5sN6nVMrlXsOX/Ev8g61TOkfUUSFs2ayrKLJWhv0NCqeETTrAMU?=
 =?us-ascii?Q?aXRQGoQc/aPGWnZzdSIWhGH7NkS+yGnDx9RNLus/hczlPU7DarpmIiMuX3Qz?=
 =?us-ascii?Q?7TF6XPzXtPiE6uP7lTty5g3XVKfG0HKU1AJwYgWVU6lgghquaUJyE2bXWzL3?=
 =?us-ascii?Q?qBw7kno/80eV2Ayn9Bgat7PbYWu32zZzmIiREzfa+HbQQFNX9+Kf4CxNfF9S?=
 =?us-ascii?Q?GGWrEpCh93CSbb0Z08T73VXGwjGC3DCEjzLSuKQAi9c6rWNRSteCoTv34GfS?=
 =?us-ascii?Q?h3EINIWW8zFh7+63P/D2/Hshj8mFSBF75jmDEX1nbKRrMn1zvPOQoKRZlov1?=
 =?us-ascii?Q?dbdaQVuMhWKlC3Fg15mJAWDRifXsDPFHcTaT7iUOCcwYLYKeSpZnSQ27Vbhp?=
 =?us-ascii?Q?D+EnWSR7/pr/J3yrDmKy97RuuEOqVf5mW9vCYaCt8dSeTqAOLLTYBFcdbkBt?=
 =?us-ascii?Q?oyMqDnRPWrcDRLFMr3YyVEYqoVv30qIBR8EOacszbQ26L9ve8rgj/7pdioOG?=
 =?us-ascii?Q?AsfXdvAgLjvz4k90LPdSulosCC1+UHLm9+WHpyyvf180KFIQbrTguuzsO6Ik?=
 =?us-ascii?Q?fkmC1ZvQ2E9Z3D+f1wMkrc6dDZZNgTYcpztGPXIYtiEmF5u/ZZYwfg19NkbP?=
 =?us-ascii?Q?zTi0erDJ89A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:22:27.8211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b826a0-8db9-4c0a-08ae-08dd730ec811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

Introduce an interface to modify assignments within a group.

Modifications follow this format:
<Event configuration>:<Domain id>=<Assignment type>

The assignment type can be one of the following:

_ : No event configuration assigned

e : Event configuration assigned in exclusive mode

Domain id can be any valid domain ID number or '*' to update all the
domains.

Example:
$cd /sys/fs/resctrl
$cat mbm_L3_assignments
mbm_total_bytes:0=e;1=e
mbm_local_bytes:0=e;1=e

To unassign the configuration of mbm_total_bytes on domain 0:

$echo "mbm_total_bytes:0=_" > mbm_L3_assignments
$cat mbm_L3_assignments
mbm_total_bytes:0=_;1=e
mbm_local_bytes:0=e;1=e

To unassign the mbm_total_bytes configuration on all domains:

$echo "mbm_total_bytes:*=_" > mbm_L3_assignments
$cat mbm_L3_assignments
mbm_total_bytes:0=_;1=_
mbm_local_bytes:0=e;1=e

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: New patch:
     Assignment interface moved inside the group based the discussion
     https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
---
 Documentation/arch/x86/resctrl.rst     |  29 ++++-
 arch/x86/kernel/cpu/resctrl/internal.h |   9 ++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 162 ++++++++++++++++++++++++-
 3 files changed, 198 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 31085b4e15f6..ad35c38eed34 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -514,7 +514,7 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	Event configuration: A valid event configuration listed in the
 	/sys/fs/resctrl/info/L3_MON/counter_configs directory.
 
-	Domain ID: A valid domain ID number.
+	Domain ID: A valid domain ID number or '*' to update all the domains.
 
 	Assignment types:
 
@@ -530,6 +530,33 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
 	 mbm_total_bytes:0=e;1=e
 	 mbm_local_bytes:0=e;1=e
 
+	The assignments can be modified by writing to the interface.
+
+	Example:
+	To unassign the configuration of mbm_total_bytes on domain 0:
+	::
+
+	 # echo "mbm_total_bytes:0=_" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=_;1=e
+	 mbm_local_bytes:0=e;1=e
+
+	To unassign the mbm_total_bytes configuration on all domains:
+	::
+
+	 # echo "mbm_total_bytes:*=_" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=_;1=_
+	 mbm_local_bytes:0=e;1=e
+
+	To assign the mbm_total_bytes configuration on all domains in exclusive mode:
+	::
+
+	 # echo "mbm_total_bytes:*=e" > mbm_L3_assignments
+	 # cat mbm_L3_assignments
+	 mbm_total_bytes:0=e;1=e
+	 mbm_local_bytes:0=e;1=e
+
 Resource allocation rules
 -------------------------
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index a943450bf2c8..2020a2fe7135 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -44,6 +44,15 @@
 #define ABMC_EXTENDED_EVT_ID		BIT(31)
 #define ABMC_EVT_ID			1
 
+/*
+ * Assignment types for mbm_cntr_assign mode
+ */
+enum {
+	ASSIGN_NONE		= 0,
+	ASSIGN_EXCLUSIVE,
+	ASSIGN_INVALID,
+};
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index ee1c949c2436..5d9c4c216522 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -84,6 +84,18 @@ static struct mbm_assign_config *mbm_get_assign_config(enum resctrl_event_id evt
 	return NULL;
 }
 
+static struct mbm_assign_config *mbm_get_assign_config_by_name(char *config)
+{
+	int i;
+
+	for (i = 0; i < NUM_MBM_ASSIGN_CONFIGS; i++) {
+		if (!strcmp(mbm_assign_configs[i].name, config))
+			return &mbm_assign_configs[i];
+	}
+
+	return NULL;
+}
+
 /*
  * Used to store the max resource name width to display the schemata names in
  * a tabular format.
@@ -2125,6 +2137,153 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
 	return ret;
 }
 
+static unsigned int resctrl_get_assing_type(char *assign)
+{
+	unsigned int mon_state = ASSIGN_NONE;
+	int len = strlen(assign);
+
+	if (!len || len > 1)
+		return ASSIGN_INVALID;
+
+	switch (*assign) {
+	case 'e':
+		mon_state = ASSIGN_EXCLUSIVE;
+		break;
+	case '_':
+		mon_state = ASSIGN_NONE;
+		break;
+	default:
+		mon_state = ASSIGN_INVALID;
+		break;
+	}
+
+	return mon_state;
+}
+
+static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
+				  char *config, char *tok)
+{
+	struct mbm_assign_config *assign_config;
+	struct rdt_mon_domain *d;
+	char *dom_str, *id_str;
+	unsigned long dom_id = 0;
+	int assign_type;
+	char domain[10];
+	bool found;
+	int ret;
+
+	assign_config = mbm_get_assign_config_by_name(config);
+	if (!assign_config) {
+		rdt_last_cmd_printf("Invalid assign configuration %s\n", config);
+		return  -ENOENT;
+	}
+
+next:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each domain */
+	dom_str = strim(strsep(&tok, ";"));
+
+	id_str = strsep(&dom_str, "=");
+
+	/* Check for domain id '*' which means all domains */
+	if (id_str && *id_str == '*') {
+		d = NULL;
+		goto check_state;
+	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
+		rdt_last_cmd_puts("Missing domain id\n");
+		return -EINVAL;
+	}
+
+	/* Verify if the dom_id is valid */
+	found = false;
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
+		return -EINVAL;
+	}
+
+check_state:
+	assign_type = resctrl_get_assing_type(dom_str);
+
+	switch (assign_type) {
+	case ASSIGN_NONE:
+		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, assign_config->evtid,
+						  assign_config->val);
+		break;
+	case ASSIGN_EXCLUSIVE:
+		ret = resctrl_assign_cntr_event(r, d, rdtgrp, assign_config->evtid,
+						assign_config->val);
+		break;
+	case ASSIGN_INVALID:
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		goto out_fail;
+
+	goto next;
+
+out_fail:
+	sprintf(domain, d ? "%ld" : "*", dom_id);
+
+	rdt_last_cmd_printf("Assign operation '%s:%s=%s' failed\n", config, domain, dom_str);
+
+	return ret;
+}
+
+static ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+					size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdtgroup *rdtgrp;
+	char *token, *config;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		rdtgroup_kn_unlock(of->kn);
+		return -ENOENT;
+	}
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		rdtgroup_kn_unlock(of->kn);
+		return -EINVAL;
+	}
+
+	while ((token = strsep(&buf, "\n")) != NULL) {
+		/*
+		 * The write command follows the following format:
+		 * “<Assign config>:<domain_id>=<assign mode>”
+		 * Extract Assign config first.
+		 */
+		config = strsep(&token, ":");
+
+		ret = resctrl_process_assign(r, rdtgrp, config, token);
+		if (ret)
+			break;
+	}
+
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2246,9 +2405,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_L3_assignments",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= mbm_L3_assignments_show,
+		.write		= mbm_L3_assignments_write,
 	},
 	{
 		.name		= "mbm_assign_mode",
-- 
2.34.1

