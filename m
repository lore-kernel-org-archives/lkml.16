Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F311A2564;
	Fri,  4 Apr 2025 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726013; cv=fail; b=WrCMVHkyPAEL7JwXm4jW8Kli4IpQhlT2zLzI2XjrJ+MDBl1JDCd75L1yr5yXd7utdLcwcTai4376pwXa3IJSvlZ5ag8yk3mKJ+uMpVjFGGS+lHYDo5Ia/2HRw8tIimvvNRJ9iClUOpIOTorMvWb1xgTyKv9erpwgFEB5K7VKFhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726013; c=relaxed/simple;
	bh=K6BZJ4eRqXPpShY0FwaGSPkS54m19goujfycfxqsGNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XN4Ubv1lLwbygX8bTFxFO5sH/6+8udaVvUAnwIVGwKO1Bvv/JWhtitkUtxaGOSN12qrEnzoMMMwylTBR7L8YVD623TIjT8jV65eY/TS0US+2nsDv63m4/7xcsbwjjt23fmOHV5uO5IS+n9rwmyfE12y2Q0y8zPtm8dmTQZw7IZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hFvsE6zw; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hFvsE6zw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3Wcefqqsrznga4tpU6K9El20DX0c2UOFKO3vLJTXbicj7mzJLTS6hHsfO6ymffxQIJBFVBs8Wy1yM84dQPZhlGlPi5+ouiI1IyZNpUy2dKJw+3Mlqh81FbBfYl39yeJASZxwmEySAi4WBtbZ95z16eqRW8vvVNsYPSVj/qzoZJJoH07EZFn/JUeWtonO+mEofVGQdzvy/FWy8l1kcvU6MVYDVqwqpSsSdbUo+FWeTSrqJWI9s0nmT7Dmv9VZWCzHsWRByI47Xhs5hU/KJAEiFlTusIMwNHDTOIxNhJLqxPLOM9fpHX79P6s4PGQhJw/+Z7lFToO3hAO8VgTAjvGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1L9V9lC1GWsZeUWKC1vfmYZWJw5k99/oVLqVnXegu0=;
 b=NgQqpOgIPauHe8dVoADQpxSaw+RJfpMdg1FYjym4ukA3XaC2qLMfD8V348gnZdi3Lq7Chd+JLnAQ9NvruFrbZeUOBBhP/DtQogaDNEx0Qm9DX3rRWq8zWjdH6QR0+QTbcC2zZU8k43jmeq2CqFrrwjQSZzAeCsjUP1iSi/gEvQLMAuzfgvbcsyzHp7wy7IbW0TgMgvL7AVvNuADws4sKfuWYl6iE65zrYDo3Uvr/r9oUo0nlsvk46ftRxZGjhYwuAaO2/u+XJriWMzRQJqmkFC5eUjeKisEpKRy5ypdupQEkrMF35dTsFZJAy4NPGKwvSvjkW31/ZkuiFz8dXvQk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1L9V9lC1GWsZeUWKC1vfmYZWJw5k99/oVLqVnXegu0=;
 b=hFvsE6zw4oGuTakFnY5jGe9RcBm2KRRMO5sIYwaD4l6XvBq79GZUpYgtnoIuEgpex8mF/FpIomjKA5dDdlmAbIdg8jgLKj8eyu7V5U0pfS5AvxHs24Q5hQtqSQfqGGrQyEpB6FZ+oDNPazjG1RREUqYIBkAlDVpi99UHsosgf+k=
Received: from MW4PR03CA0081.namprd03.prod.outlook.com (2603:10b6:303:b6::26)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 00:20:08 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::d8) by MW4PR03CA0081.outlook.office365.com
 (2603:10b6:303:b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.50 via Frontend Transport; Fri,
 4 Apr 2025 00:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:05 -0500
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
Subject: [PATCH v12 09/26] x86/resctrl: Introduce interface to display number of monitoring counters
Date: Thu, 3 Apr 2025 19:18:18 -0500
Message-ID: <e27c71eddda5884e9dd3bbf28c53be8a5b78f62c.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|CH3PR12MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e966282-86ee-47d6-30b1-08dd730e7499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVxRCWwd82QlDC8q3biqK1mh75p0lPEacZW62Yt39u2+tep5UuZL4RoJdMdA?=
 =?us-ascii?Q?6hdano5D4EvuP//JP3OnO7KbqLVEelm1Obp93e6mWQx8UMjGsivZTrId7jlU?=
 =?us-ascii?Q?AZ4M5R9KLNURVX1S83vM/3/9Q9+5vYCTaSp8ctmanilSSEzpKyXlbNTu19zV?=
 =?us-ascii?Q?3TUJ/xeLfvks05nme4wZ61bnN1YmKaFqqbMhvEBAY6OZH1d1Bbh/pjW/0Oyn?=
 =?us-ascii?Q?bW/2ETZ6osSi4OFRHvfAb0DdC+0ePqIfct6seSVJVXEffk7GxU8kRSB/LhPr?=
 =?us-ascii?Q?FvAJqcZtfwuQVZqqes65YHL7LFC8RYd/V4eIWdTAcBhZuFHtICN9N2b7ldSS?=
 =?us-ascii?Q?CDKtzwNW643/pmCVYuwR/r0du+ANiRqyyE4kxgy+63G+s9BVcLtvZHZbD/Nr?=
 =?us-ascii?Q?+beUUHvbotdcQ9Uq4O7nVryfCygbLSYnGvWS5nWVuJnR8Zbpe7p6nloUursT?=
 =?us-ascii?Q?AQiGqTSU6dNTbk50Qbwor9sCGIKT4GOkaiakMFokDzn4+055tsvKuUQNfbzB?=
 =?us-ascii?Q?hNJ7vX3Ju3ieF5xOoDBxHy0vL1K+8TzlfWMZPhYwH+sVZIq38qXUPuDvBnGl?=
 =?us-ascii?Q?dlj52KDci7uPV7fhB5NmAmgZaFQ28v3hyS8p2FVuyYCBPD46LXZGnIoZkn8c?=
 =?us-ascii?Q?HIG94fmkxlxv7injCiVu/yjBylFYE1JrtJc2lnBWmCxG3TSOn8AcjVxEYgip?=
 =?us-ascii?Q?l5QwCCKofpUz/6d6uUTCaA7+5qY3PEjhhOUjwq7vaSK/MkeHXWUGoc4lCjzg?=
 =?us-ascii?Q?/aMLnFFacExaKo3ObBlm0fpYeZMG4w/U2ehD4owuzQxSa8paD7aBUPy9L/U1?=
 =?us-ascii?Q?KryYp8zxTZyDYzH8T8gZY8rLl/L4vWgRBbbXSH9Dw00855LwXZVo7YFR3Blx?=
 =?us-ascii?Q?LeOQJj6NSFyALWjH/R7i1cqzPs2e3RGBV9wwKCW2nSfDSBMC/QPGR5+sTio7?=
 =?us-ascii?Q?+siWJ52O4ObPNk2JpGPZ7HZdMzUacCilRO5v+BiqvutiuU+6wS9iGsKqGd0d?=
 =?us-ascii?Q?epCXkzFY8XcjpErQmwAdtuNO/fNaOub5uXHXsQYvwvigxqzxqoUTeigKj6pw?=
 =?us-ascii?Q?xi4TyrZfbjNQy80RocjdQyZVuIUGpYu+H4Vbz2ghXCJc4DcfP5i6GstMeIwk?=
 =?us-ascii?Q?TasCYJaViXq0zoafzsfw/NT400B1zXTbvu4c5C+vp9c407gTh4KeA095s0Jb?=
 =?us-ascii?Q?faZ2QSZCfp8WpOZNENnE6GgU2ROCFdCqrQvYB28EgeSze6hVFBHtvvfVsGDx?=
 =?us-ascii?Q?qPr6p2DW262MnrzHCm3n2pQZYvaVe/tw6Y6GrjOsXWHEtUkZbrtGftN9OqRJ?=
 =?us-ascii?Q?AHUIqcXise0uTJYpY5j+ec5z/jRnZR4Z/uNs41ifNQ5YK1BII19TPAHUd4Pr?=
 =?us-ascii?Q?zNX9GKtd49BilfXdq83uMXtEHTOc10itvxS4suxrbwW5VF8fyGgqocg0RRpz?=
 =?us-ascii?Q?jm54sICRARtAlriGgQqgJIbzJCr1gaUGkJPxzyE5jkUT9yeHXH0mHXk4dYtV?=
 =?us-ascii?Q?ZV+dVdgGqxKvl05mpHK2i3ALGB9CxebOScNY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:07.7848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e966282-86ee-47d6-30b1-08dd730e7499
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971

The mbm_cntr_assign mode provides an option to the user to assign a
counter to an RMID, event pair and monitor the bandwidth as long as
the counter is assigned. Number of assignments depend on number of
monitoring counters available.

Provide the interface to display the number of monitoring counters
supported in each domain. The resctrl file 'num_mbm_cntrs' is visible
to user space when the system supports mbm_cntr_assign mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
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
 Documentation/arch/x86/resctrl.rst     | 11 ++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  3 +++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 30 ++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index bb96b44019fe..35d908befdfb 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -284,6 +284,17 @@ with the following files:
 	misleading values or display "Unavailable" if no counter is assigned
 	to the event.
 
+"num_mbm_cntrs":
+	The maximum number of monitoring counters (total of available and assigned
+	counters) in each domain when the system supports mbm_cntr_assign mode.
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
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 6ed7e51d3fdb..028b49878ad0 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1234,6 +1234,9 @@ int __init resctrl_mon_resource_init(void)
 	else if (resctrl_arch_is_mbm_total_enabled())
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
+	if (r->mon.mbm_cntr_assignable)
+		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
+
 	return 0;
 }
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 626be6becca7..0c9d7a702b93 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -912,6 +912,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
+				      struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_puts(s, ";");
+
+		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
+		sep = true;
+	}
+	seq_puts(s, "\n");
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return 0;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1945,6 +1969,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= resctrl_mbm_assign_mode_show,
 		.fflags		= RFTYPE_MON_INFO,
 	},
+	{
+		.name		= "num_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_num_mbm_cntrs_show,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

