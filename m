Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1C2737F2;
	Fri, 13 Jun 2025 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848793; cv=fail; b=CohIBqont3irbgidto/aYtP0o34En9nyMBBLNA8RitiBkG+Sg1V1isFCWSTuNjvNaxahNUyDhSmdXivAc0EswLtkks/LsNv3+CwuxJNNQuv+4IV1Jpdbi/codHNgra+ysBFG1JqU6Wr9S3+bFOTkrgl/2Youto6zPlF1UBuyFtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848793; c=relaxed/simple;
	bh=UU6h7b3oQJkNDWIATPvKClK78sXJOxP2PfPFlLDo05w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4Mc2OT89LlYqsCCmtldc92CEfMYwj8GfyKSIEpRLAH/pLFg2X4WQvt0cgOiYpPcrnw1LiDtA2oNEoCdmbLTFb/Xa2GjNac1FNqEMI77iSIlJJVIZRu9myqMVqHC0UWhK3CQ6tKA3nciNv/KhK0eHAX6Vyod6L2gBEPRVu1QTHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IWjDT7Xt; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IWjDT7Xt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjkwT//rDqhKzhGXTQ4bfgtvdQyQRn0sQJNvamVZE5XUwDhnaPPPpJMhus6ODdDpQtJWTUl4I+07TXmwkJgYyqZb7gBAmM6MI/Fvp0W0btIEEdGkW3k23pB2/eDG4NOqY7+2JcT+nc6NfqMOzWki/9NLmiAbEk+rmNmwLPh06A0q+GiZWcDQWri0MoEBavZt4Fz05ujs0vmvNTru1BjaSZNmf9MBBJJ4bsqtx+JfZbRb1ociizp5/0LM19wdtapcyugCVTX4BpfinpF5L7IvzpD2j8vM4Z5Mwj0ilHp0AOlO2z2WABuz2Rt1qYdnMNVgSF7c2cnmA6k2Lc8+KpLa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmbJ2f6XXELujln3jGLGuWcqN4PGgtq9NCKdXf9K6Qw=;
 b=fP2H/AucAV+idHdxm9Tg6fPOWkG3N720lZ82lboYI5JAVlAS42I/SjSEr8Kzu3TeDFUfTEH7H+ShIwSttfsMymChrYKBjPChcET+33zHRdf18P2K+4dSX6GwqWeGY4tDnNscuhwWRFGSKPceCBSijQvbPk7+A2Wih/2610SlnMKhfPuJ+Mm//6ANZWIHZJXoL6g9NJ+aGnbFl3vmvflfI0zOlTi5P+ikZ/wKw0apkyKhkJJednSmAkfAhj2NeLs34az1yIupdZqiNXsbAO2z32R+v/SMpWoNqbSTDti4UMBmhRlJG1luY9uKqzMU8ECumCjnhwdMgKOJMkKTPn9PTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmbJ2f6XXELujln3jGLGuWcqN4PGgtq9NCKdXf9K6Qw=;
 b=IWjDT7XtJfM8Q0gTRrIN4GW7LXN1hgGWv6/1VJYQBT2u2K8iN54q1XzOWTw6aJ0EjL+CzA9z8NR12Rd0FwrbpD2KseDItnElUdHU47XzX4c0oKR5xXQP3f9NuPUDOnwcSGEQJD2c4BRddBSxehoKCD2dKVTLKN616OmWyFogImo=
Received: from DM6PR02CA0112.namprd02.prod.outlook.com (2603:10b6:5:1b4::14)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:06:29 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::eb) by DM6PR02CA0112.outlook.office365.com
 (2603:10b6:5:1b4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 21:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:06:28 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 16:06:27 -0500
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
Subject: [PATCH v14 07/32] x86/resctrl: Add ABMC feature in the command line options
Date: Fri, 13 Jun 2025 16:04:51 -0500
Message-ID: <e6661e6c5142e104c5beb11538801ec70fc819fd.1749848715.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bc8c8d-c873-4aef-b3ff-08ddaabe2a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pkyx8yntxF4ceNEi/Ny/k4lJbRtRGHlXoQyZczo8eJb25piF7jllTV8D+5WJ?=
 =?us-ascii?Q?CJaIBs4IxJ7h06wQwyjAKmY6wUNLTI+RrPq5o4yh/zzDdcw2BQv2wXP10vHb?=
 =?us-ascii?Q?+1sPkC6j4BrVp5pNCCZ2eGqYMZU3yFiuVraADQ2geYb3XGBBY76Il0GI8Z2Y?=
 =?us-ascii?Q?ZhteUoy8Lyvet89CxoTjILqYsqO5/zrf6+bv//nRrHF8R36LsjMyYcBo0LkO?=
 =?us-ascii?Q?3uV16+Tcl1UIWMPHolyaKueppxE8IR4Y8K2xS3g7469IppvDtvhXOsEJyeoY?=
 =?us-ascii?Q?c1DD1ksBadsMyQvo1YPHCvvRJOgltwaFmWtXtsAPglvRhg1h55X2zqgipUSU?=
 =?us-ascii?Q?PhNBFSmjBuesV/BW4gh4ihzJjMpgozghnMOXXm7VwNC8r51I/l+DWE0txuEp?=
 =?us-ascii?Q?JGhuRBbZ0KtMyS6uAlJ96U3FmreP5NA5c8sAVenItpxvR+VkwFM/OCxhWysl?=
 =?us-ascii?Q?lXkuWaRWpsdlsdW0FJ8uDyy1rMSmEkhfFK08NgZqCEAYm7sqeTKBuXnnq/xD?=
 =?us-ascii?Q?uyYGiktJBi2fBy7Q2LLP+WmZahkTLYFQwOuyJ0k3QmStxd3dlkIWXsLje8UF?=
 =?us-ascii?Q?iNJMemXit4nON5qMct1280tnm52PH9qyEsyuciM6H7JrpdLqQIhemf94zDSM?=
 =?us-ascii?Q?IauXZJWXuKwUGDLsfCvCTuixo/yTW2BlDqlA0PD2RqWu61FlVxRdmD/gRzQ7?=
 =?us-ascii?Q?1bJMZjyiLx5BF/fzDDFkM+psAhkl4HEAYMeQs14UkjkP2Gz53XgrBn1qzeb/?=
 =?us-ascii?Q?OVD3j9NJ6u1Svd1RnFMp6Pfq3ICBYtq920GQdmg5KQTbYwEO/yl29XLBJfyO?=
 =?us-ascii?Q?VHclA0gAyklmzP9thWnHp6uW0DMlPlfWoDqhMczQ2SEmx464GyQZ33GgWuWG?=
 =?us-ascii?Q?3ktJlcF/E/yoaBMX5rVOrBERJrQ+BkBmcHIRQYlf+e60Xp9h8qXqUcjnKg9P?=
 =?us-ascii?Q?8tEakHq0DmXPLSQskUvUnrw+h3Bw/YghcS1IjmaEtIv4yZx6YFOEv97BHeZr?=
 =?us-ascii?Q?YqLPnA0XrPZroctkLiNzAReB1hURV1tJHO7k/IUZUgIPu+CM25XJu6A3Cs26?=
 =?us-ascii?Q?xgKkhmXEABBglwI2UjKlvlNtUVK1FkJZbckd3olDHDmyCPmo7IUQ6hGPr5/u?=
 =?us-ascii?Q?6pZZk1BQMdPDmOYJCrrD4LXv15bYsjoWp7+WjPLDufVbzMmof4I4dZ9BSm9l?=
 =?us-ascii?Q?Fr/gsyaBi24llyZJV17Vh21EMQGz5jPJkAT8jCv4eRGa817n4/iHgVzcVDtb?=
 =?us-ascii?Q?9QJweJ8PDrrBcu/pfH2PSBNoIwiymH5/P1jKMfrgWAmE1wfNI4yqtvcdwgxz?=
 =?us-ascii?Q?vXseZIN0uC/QihNUf5nrfg2AlA8eE5laW/X37EDONZXEZOFwpkRro44YVo2M?=
 =?us-ascii?Q?1hrhi76dZ6zAq4nj8f5C7AgbqqNb90Klihfdlb9ErPzWT8kq/GFHeZ+XHl5K?=
 =?us-ascii?Q?75La441DJRHqpxfz6+Ych5nDb46iQ+Yf0EDgGmjaZQ73tFXjF45P80rHdkQ2?=
 =?us-ascii?Q?9Ld3eVmx38ZoNJTWHDrP6BjURLxJKwT7/+g7/1+m48v1YPggmXQR718Yqw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:06:28.9518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bc8c8d-c873-4aef-b3ff-08ddaabe2a87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786

Add a kernel command-line parameter to enable or disable the exposure of
the ABMC (Assignable Bandwidth Monitoring Counters) hardware feature to
resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v14: Slight changelog modification.

v13: Removed the Reviewed-by as the file resctrl.rst is moved to
     Documentation/filesystems/resctrl.rst. In that sense patch has changed.

v12: No changes.

v11: No changes.

v10: No changes.

v9: No code changes. Added Reviewed-by.

v8: Commit message update.

v7: No changes

v6: No changes

v5: No changes

v4: No changes

v3: No changes

v2: No changes
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..f2f2511b0ec3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6066,7 +6066,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, abmc.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index c7949dd44f2f..c97fd77a107d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -26,6 +26,7 @@ MBM (Memory Bandwidth Monitoring)		"cqm_mbm_total", "cqm_mbm_local"
 MBA (Memory Bandwidth Allocation)		"mba"
 SMBA (Slow Memory Bandwidth Allocation)         ""
 BMEC (Bandwidth Monitoring Event Configuration) ""
+ABMC (Assignable Bandwidth Monitoring Counters) ""
 ===============================================	================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 6bf2103aac27..6426b92492dc 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -709,6 +709,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_ABMC,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -734,6 +735,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

