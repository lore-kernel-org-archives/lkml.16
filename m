Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117D0271A6A;
	Fri, 13 Jun 2025 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848844; cv=fail; b=fv7z0Fs9j59g2DUk/i79hSmL1+8jXw/eBkrM/BeO7BADL2j+yW2TogiGCCaiyvnMo9a9Gl4QU+h0pXRFlpnk9yOuh3YsVJtuug7SX8/zMkCa8SvGlVl1XL1z9IbT3N7v2Ig5hRMx/F6Xa6eEv2hyWu2ZqzAcn6mFle9usOSLkRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848844; c=relaxed/simple;
	bh=aDx2Rcgp+dukOExyf63UTiJ4q9QINxLx36PdKYiCbwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jtnie3uJe2jnM9KcN1/prvSiA/WLnZbRZjGAXs2RNgYryvtlwc2bqhePacD2/gWiZJOaWZPanDaCFy+LVZjnLGAVVQQ4YdSsKrQqo+VW83OL3t2pOjBlwbpUbr1dbsjXRmE3DkPGotrjUBmojDQdb/rZGQdHr/1kYl5IUenuX/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pBDaYXDy; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pBDaYXDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpWAZvFgeXPKQlpLOhKJ4KIIab9i1byBSa2RR8+J592juCe+dEDYRbLc/fjsRsZsQ9eCcTlWv5EC3DVYVtCYrzKAbJiqj7m4jfwNtFI0yQZtJ/YZNcNWQTOq+/qrh/Kn5WpmUdBeQD8vgToEjBiV1b4GTiYo19+0QNsnm+5UU6m9FeaKgE6M1U38KuERbiqlmuRSVC7awy9dBqmp546koT52Ng1QhvmKemU3qXKuzov9SwYRoyqddHUP+Nbo7SAoRQjHYB9ikqIxJWwnfrPSDP6Ks7SyBvW/jdgNp66nuBYi/0BHutrGa5/ECCi41Dj7Ob4YLy69/1Q1r6FmSbIf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiYP5cY5U63qi0ORPgxrOU047QYJEvtrlFfmiE9r2A8=;
 b=a/z6j2ro3wGJwCbeZp+qK3gFrAnvCq7bBR7jXGUHhvSe2KqMWlxTXkMF3630HLakZd8t60cFezukE24a2AbyBRdsNg0toOoJGMypszYclOhrcwoQgB5Z/BTe+uOt5hslaOBUEuPKMU/ybOrpnHTgQzYvWsZ1CVnGaBpOeGvSmxh/7NhqIvPBDOYwNkXBQquwmX1K04sZdjD9npP1v8/+m4x8vCJf9esClKYTy/pTajbb5uVDEs2A0uGPhCluYYyg2XfWM8dMfiSJNj2GfZGuGWS5JBmL5vcMusWwTEWLWI76e//g+DCGK8GZ/e5SdAIAk3yQmuDOeX69kgCJCdj0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiYP5cY5U63qi0ORPgxrOU047QYJEvtrlFfmiE9r2A8=;
 b=pBDaYXDyZgbaDCRJ+NBpfkwbX2HTpH1uP+GJh0+JJSleMe6M1k9ER4fInEHBTG0fio2Ge26XiJqB9qFUq+GWYhSq4U02efhShe7ObOFWbc3xZEWJ/XAGCkUMFldK8KZfm1xncq4s6+kPTO/4hZCGeboh3SHkX9dn/OiRRYhF0Ys=
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by IA0PPFD78AA37BB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 13 Jun
 2025 21:07:20 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::b4) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:07:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:07:06 -0500
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
Subject: [PATCH v14 12/32] fs/resctrl: Introduce interface to display number of assignable counter IDs
Date: Fri, 13 Jun 2025 16:04:56 -0500
Message-ID: <4ad1bac79c6100d347e333b9781b1c76196326fd.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|IA0PPFD78AA37BB:EE_
X-MS-Office365-Filtering-Correlation-Id: ad676b03-7200-4cbc-79e2-08ddaabe4841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n/7tkdLfVS2nCfMQZlYRlqjl0FcAanrYqXZ8/oGeNuzOSDJUtlLVSchd/RWB?=
 =?us-ascii?Q?vM615CRZ1HvkraGpbyrg6Usl8padohpkdb2cPlBZWGr158MlwNUT7+cIKE49?=
 =?us-ascii?Q?Cpk7utBOojamvt6/fKOncnnw08vOKfU0hB/6BNoXao+58VAAUR2yQfbXkrUw?=
 =?us-ascii?Q?eT5Rq3rl1y7LXB9RENgZHTVUXvK9ALy6xg37aBjp0dDToyPPTwnq7cIB5u88?=
 =?us-ascii?Q?RpRsh9u0dKDHCSvaxOcT+4HV0z4hSYr9ahv0UJMinmy2t2j8G1sDvac+K5dx?=
 =?us-ascii?Q?WJaiQSpDLzZ94sBuwn1x19g9vo3pZroMW2vLX4DP7sShbNKIgwKlEFoo28KP?=
 =?us-ascii?Q?R3sWJNx3KBbnI7NjvFJXahKhVjv7DAuJum4+DcSdEQC4Bp1oQm2702gRkuHr?=
 =?us-ascii?Q?3AJ56Focqyt/4cK8NzrdejRIlQ5pR7SDO+l7M5suFXpfS6cpLH0zIkTOiadH?=
 =?us-ascii?Q?oxfOp/Zw+zxldX/F4uutBz0KL5b8VoO8SwUiqdmct9kW2eMzT75ECzF6rhNU?=
 =?us-ascii?Q?OQqb1Ff6FgLqUGh5qmA1rxa4IG6UJLG/DpRsfuWo4muQLcCbcNQRllYfPwA7?=
 =?us-ascii?Q?xanGKCqtDk/A+0paQl5CMd9xmu25pIICMAQPFnMIViIOBDlaoyItFMvul9S4?=
 =?us-ascii?Q?AvbbtqFiAnaECIyklYTyWZUfgfq1KDpNmBhTev7mYr7HHeIwVp7CiweMTT1v?=
 =?us-ascii?Q?FXlL6vLTvQ0cDyzkU7CL6O9NxTfP4QzMHkUuqDFCZs32/9CtdBm5tk55yPnh?=
 =?us-ascii?Q?G0d8YnI6XuxyMewTVmWijo1YV4/uhH8e8lAl8x4mHtF/V7BGLmfRhbbyvBdm?=
 =?us-ascii?Q?1nF6+ECTeBP6jzMAgvQLp6avKCy8xmUyc5UipiencSQqHVU+rxzGkYA/dYAy?=
 =?us-ascii?Q?e7LBZOscN3n7bCYuXGZQe5TuRt2n2QzUP39QmEdfSorQkCMCw4EQJOOrSzZ3?=
 =?us-ascii?Q?ZTpyTsbwpsuC9I5YuPvC887YUtwZQaWEqCM0rHjNUnfxY2oZjrWwMdS2CRAI?=
 =?us-ascii?Q?P/h4V2qbACozzU7XKGA1mCZoC6k2EQ9qcWDRZ/aWZ3toq5ujX7Vgih52bgbF?=
 =?us-ascii?Q?+17VXivcQj88s3esnWTJAxbfey3++PEAQJFWRQU1inbLx/EXX9YekoefuiqI?=
 =?us-ascii?Q?uSFHWzzXzR1si7hlMWyDlKEzSNbbCXoS9R26dtDbppTPlKsRw7ETRv6i36G7?=
 =?us-ascii?Q?7CJ3N7N1TgCPrrF0RwfZ0U3fTWxgVu5D6Qd+0x1FSbP9tb9dT9u8741qUwxl?=
 =?us-ascii?Q?6swsoJ0L7/DdaBtCL+RdnEqi50bSEB+IyL7PFVYvJ9R7DC/BZrf8JrZabJOA?=
 =?us-ascii?Q?InlYmp8E2HbXa7OKs3Rc16Z4CalH1JUVcT0Cof9GeGVbToYr9lJXAMarl3o8?=
 =?us-ascii?Q?jyC5pMY+cuYuhNzNIcYF4HlFstBH37eKhtf/NQzvaKCti85PhkoJ/DPXTX6d?=
 =?us-ascii?Q?qI60OLGEH4NQVUc4i9dND48rOQTCicnr9Z+gpBlJNi+ufKfwDDjZXFxsnQru?=
 =?us-ascii?Q?TsVzubePobIZWleUhhzWpqak9c8Z6pcfa14jXCln+eOe4f4Sq4SzBICbsQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:07:18.8241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad676b03-7200-4cbc-79e2-08ddaabe4841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD78AA37BB

The "mbm_event" mode allows users to assign a hardware counter ID to an
RMID, event pair and monitor bandwidth usage as long as it is assigned.
The hardware continues to track the assigned counter until it is
explicitly unassigned by the user.

Create 'num_mbm_cntrs' resctrl file that displays the number of counter
IDs supported in each domain. 'num_mbm_cntrs' is only visible to user
space when the system supports "mbm_event" mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Minor update to changelog and user doc (resctrl.rst).
     Changed subject line to fs/resctrl.

v13: Updated the changelog.
     Added fflags RFTYPE_RES_CACHE to the file num_mbm_cntrs.
     Replaced seq_puts from seq_putc where applicable.
     Resolved conflicts caused by the recent FS/ARCH code restructure.
     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.

v12: Changed the code to display the max supported monitoring counters in
     each domain. Also updated the documentation.
     Resolved the conflict with the latest code.

v11: Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().
     Few monor text updates.

v10: No changes.

v9: Updated user document based on the comments.
    Will add a new file available_mbm_cntrs later in the series.

v8: Commit message update and documentation update.

v7: Minor commit log text changes.

v6: No changes.

v5: Changed the display name from num_cntrs to num_mbm_cntrs.
    Updated the commit message.
    Moved the patch after mbm_mode is introduced.

v4: Changed the counter name to num_cntrs. And few text changes.

v3: Changed the field name to mbm_assign_cntrs.

v2: Changed the field name to mbm_assignable_counters from abmc_counter.
---
 Documentation/filesystems/resctrl.rst | 11 ++++++++++
 fs/resctrl/monitor.c                  |  4 ++++
 fs/resctrl/rdtgroup.c                 | 30 +++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 4e76e4ac5d3a..801914de0c81 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -288,6 +288,17 @@ with the following files:
 	result in misleading values or display "Unavailable" if no counter is assigned
 	to the event.
 
+"num_mbm_cntrs":
+	The maximum number of counter IDs (total of available and assigned counters)
+	in each domain when the system supports mbm_event mode.
+
+	For example, on a system with maximum of 32 memory bandwidth monitoring
+	counters in each of its L3 domains:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
+	  0=32;1=32
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index dcc6c00eb362..92a87aa97b0f 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -924,6 +924,10 @@ int resctrl_mon_resource_init(void)
 	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_file_fflags_init("num_mbm_cntrs",
+					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index ba7a9a68c5a6..967e4df62a19 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1829,6 +1829,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
+				      struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_putc(s, ';');
+
+		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
+		sep = true;
+	}
+	seq_putc(s, '\n');
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1866,6 +1890,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_default_ctrl_show,
 		.fflags		= RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE,
 	},
+	{
+		.name		= "num_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_num_mbm_cntrs_show,
+	},
 	{
 		.name		= "min_cbm_bits",
 		.mode		= 0444,
-- 
2.34.1

