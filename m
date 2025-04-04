Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437371A4F2D;
	Fri,  4 Apr 2025 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726032; cv=fail; b=YCYhhWXvcX4I4nLlSwMq6kCtdtjB8WsANpb4ejvrvqQcGAoVaJEqSdwqSQGnqPOPiiq0ihGK4oCa0I9gCFXWBT4VhZGg71hIdtrX28OubWn5xSH9q1H1stlMA3KBkuEssuhXtbTGulJGg0ognR2BaUncS6S/tb11EQ57wnKwZPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726032; c=relaxed/simple;
	bh=MWHLB1Rn+B9O4bKofThsocdTahbLfETzQgBy2V3UmZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQ0EsUrLYyVOcQFTW/kwB9qG2AyOrRCWTnRImb1C3LEDHAA/MGcgfvF8C0PByW0p39wWuub8ZO+uqyVarptQoMDRcHpawWToQHrEXPa6Dj68aqZRPzrz+kXDHUf7C6nHF0/9scBPUSC11wlUIg4ikBY21lvf9mtpXCGl330t9Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PTjcIFhU; arc=fail smtp.client-ip=40.107.237.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PTjcIFhU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gb8UUEf4r6NdV6StYX576BZz7LEe7hfZtkLuophY2wciDB3Eu0+ik7TeDicFvFsrvEh1cDTw/E36+sJn1lO00vlVy+U3jLEarpxfHOn39IzScAtimW10nrKZ1Mq74wEIXyawPO8qUkP3Aze2Srl4j/VAX0RW9OnwPuYK/2YRT42qR9lZ0jJFT0/bLZDvMPXawICaTeVFFe5KauquIuV55jDxwt3nRFCbga00QV+m33F52FFDK9dUVAzNvbtFsGIFHPSDKqSI/r9OuCdZlKbHLTS2VlrAe7AhKAjJCr77GXe7r1vfh4iCkXNWpzDNmdgb/kkunSoO2hHLMOlistEE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9Dku+6ByI81RfTsB+PJRbo0B/SO7zEHEryOrDVn6qo=;
 b=x7aYd27jVv4261A0ZELbjs7CylKmy7BbgccRLM7Oc4PURz/l65cMupi3K26ePKEHZlLEUyrMHekmbr64PP7LNAEEjgzngDwD5jVTQaj2cBNCdZRuQbjp4hslEHyUab7CCdigo6GWqGpd3kcStxGrLtOj1C2GaxCCGu7Vqi+RNMZeBXes6dF5FGXw+vRwiYOpVV0I1RkArRTv9lLPow9uu/szDCYnfzdrvd375vaSY1kyYdTns+N7BqvZ9Ly/jjIih9OLoSCB6Y7/wd4pOOS59Ues/hF8AWEGb/p4/oCEPkWfsz5J0wsZpls+5N0+oKMNcc5ZyR0SfZAy7xklnK+K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Dku+6ByI81RfTsB+PJRbo0B/SO7zEHEryOrDVn6qo=;
 b=PTjcIFhUuUt3+pSi7EdgoA5PUuIHE583pr4RD6uq4z5jotJgolUgEjk3lvzpzj4LhBtV47ZrjowdIVOXJUhUTujNBLuvC4skbHrlLOkPPvWRThp4S0E8hefsuef51PGRrN6HCMe8s5drK/1Ot1vplnomdiyanGLPM/Rm4iIWzGk=
Received: from SJ0PR03CA0062.namprd03.prod.outlook.com (2603:10b6:a03:331::7)
 by CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 4 Apr
 2025 00:20:27 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::e6) by SJ0PR03CA0062.outlook.office365.com
 (2603:10b6:a03:331::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Fri,
 4 Apr 2025 00:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 00:20:26 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 19:20:23 -0500
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
Subject: [PATCH v12 11/26] x86/resctrl: Introduce interface to display number of free MBM counters
Date: Thu, 3 Apr 2025 19:18:20 -0500
Message-ID: <8c395fed78b0568e817437fdd4953d6f09585892.1743725907.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: ee272ecb-1487-4cb2-ef36-08dd730e7fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1tVKNp4rN195EyMxvYYfkUTb7Jxlm7bsADPjrLZ6mAHv4cCvXGYfb9lZOU8C?=
 =?us-ascii?Q?2k3lT9t5Dr02fExyCKgclVIFMH1U2C51h9+UplDCq3IkFUc92OxxZF041zRm?=
 =?us-ascii?Q?Mqc1490o9TSeq5lHe/FCd3lM6TmAifMfh/sQWN2P1B2WhB9lDEFpMIqeAiVT?=
 =?us-ascii?Q?71cUdFCTUXWsQy7Z67gQ3X90LUVMOrSpmQqJALjT2jh2RYJW032OasV+nYwx?=
 =?us-ascii?Q?hZNYXDxP8j7HhUmdr5YZ5UO+poCxYQZigaRIQNT5KMW5mS9V2o50EpWZYYlC?=
 =?us-ascii?Q?M8UjFw6DPYBkNqPFeZa+sGjOJwVUf4OHRHr7jMtaLoxV3sO/CvZvXkH1YEKb?=
 =?us-ascii?Q?QI09riHAeYc2XD8l1O122u6NtqPhWQLnxI11tZfStSiXm02KbAgoQxfMYMtD?=
 =?us-ascii?Q?+M1LihNUHqaWnRUjZtBxEeP7RqskwDiHAnhglKd0T5J57j5pSU/Jf5FJFZnv?=
 =?us-ascii?Q?5qSbHLLpUs3qa1GZmdG8wWaCv4qE8DLx66B/U9jlJLOsozhyGCb4EgI2W7VZ?=
 =?us-ascii?Q?ggwqU/tkZ2WzoaSvO9rOfAChxst9RPnwvda2aVECJSCIb4SwEpKHe5GRNDi5?=
 =?us-ascii?Q?MwJiQCGs7xfHrywyF1vnqC9mu1BfnX3OB8mm5zEFRj6kmF0YZVQe/W3DoCdl?=
 =?us-ascii?Q?36a8Tr5PIOTv3eWZMgTE0YKqDfEz83uoXoeuBQwmU2EkUjCBxhQihQXp1W5G?=
 =?us-ascii?Q?oBj9mydRZUhV1LYUGgbIOkCY6oE052Pe52FYY27RH9dIrgqKobbXknk+Zvg0?=
 =?us-ascii?Q?Okj1gKYSIYLk1/acbmyfa+aihB6FSasU5hKBbV2PT3NnN3p7D4+Siwnz7oHe?=
 =?us-ascii?Q?Ey9ZhFExaaoaWX+4KkhAlmEnLqzkLO+xKmstpxWWUaP0fNGTfYJvef7lABzb?=
 =?us-ascii?Q?ntH3FgSX/1bJFi9aMgfO+1ncdT1u1RwKS8aOxQg86JQ5WMLo8lAYNGveGCCO?=
 =?us-ascii?Q?5a3J9h2QE0km+xi2XlCrX+J8TydMQoPqKAIgQYlTFe8pPItzOz3v4HZFbU8+?=
 =?us-ascii?Q?qDS/3ZLeskB1B/RbDyIaTxTdq54aH7jMTy/Iy4rzN5yyYihVLJlA4DQaZN0t?=
 =?us-ascii?Q?NhDYEBVqVPTo20cFEnx6B9xZRtimzWGE4O8EhxnX+JYzI3UCOXKjbcAYPvcS?=
 =?us-ascii?Q?x3EHoYxcj07Ekt83DBQNDVoFfXbtp+L/A59Dc+g7qNh6bTwthKNoilvkaPY4?=
 =?us-ascii?Q?/nbwGyelHq763NpBwdNV1XmMPzPDdcZOFQxT7Cu/XIgJywmOR9ZmSToHnApp?=
 =?us-ascii?Q?CPNbuERIXIyX0aRjd1Xv9vKH/LK52ukta4yCgOJmtaATbiwkRnIJZTVN5CKk?=
 =?us-ascii?Q?nSxgPqJKJuFQ53JzSBBYYy64816mw+/kJ4qNy6TdY7+P1OR/IN7Qo7jJvbiK?=
 =?us-ascii?Q?swdtcQDfwaSykfQmIdNy5yI+goyHKxAvky7JdJMl5GQCvNVMHtZQy24l8ap3?=
 =?us-ascii?Q?p01xGgevVxmfQmzlzlJ5AIafy79EgZ0kYVtvkBVWdX3/gUhLh9tftKCjLzNL?=
 =?us-ascii?Q?xytXNBsyQBFQSZc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 00:20:26.6600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee272ecb-1487-4cb2-ef36-08dd730e7fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993

Provide the interface to display the number of monitoring counters
available for assignment in each domain when mbm_cntr_assign mode is
enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v12: Minor change to change log.
     Updated the documentation text with an example.
     Replaced seq_puts(s, ";") with seq_putc(s, ';');
     Added missing rdt_last_cmd_clear() in resctrl_available_mbm_cntrs_show().

v11: Rename rdtgroup_available_mbm_cntrs_show() to resctrl_available_mbm_cntrs_show().
     Few minor text changes.

v10: Patch changed to handle the counters at domain level.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     So, display logic also changed now.

v9: New patch
---
 Documentation/arch/x86/resctrl.rst     | 11 ++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  4 ++-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 48 ++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 35d908befdfb..44128fbda4fe 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -295,6 +295,17 @@ with the following files:
 	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
 	  0=32;1=32
 
+"available_mbm_cntrs":
+	The number of monitoring counters available for assignment in each
+	domain when mbm_cntr_assign mode is enabled on the system.
+
+	For example, on a system with 30 available [hardware] monitoring counters
+	in each of its L3 domains:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
+	  0=30;1=30
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 028b49878ad0..8a88ac29d57d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1234,8 +1234,10 @@ int __init resctrl_mon_resource_init(void)
 	else if (resctrl_arch_is_mbm_total_enabled())
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
-	if (r->mon.mbm_cntr_assignable)
+	if (r->mon.mbm_cntr_assignable) {
 		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
+		resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
+	}
 
 	return 0;
 }
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index cb7a8a2de3ff..07792b45bd63 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -936,6 +936,48 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+	u32 cntrs, i;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		ret = -EINVAL;
+		goto unlock_cntrs_show;
+	}
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_putc(s, ';');
+
+		cntrs = 0;
+		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
+			if (!dom->cntr_cfg[i].rdtgrp)
+				cntrs++;
+		}
+
+		seq_printf(s, "%d=%u", dom->hdr.id, cntrs);
+		sep = true;
+	}
+	seq_puts(s, "\n");
+
+unlock_cntrs_show:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1975,6 +2017,12 @@ static struct rftype res_common_files[] = {
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_num_mbm_cntrs_show,
 	},
+	{
+		.name		= "available_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_available_mbm_cntrs_show,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

