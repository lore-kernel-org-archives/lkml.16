Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E471F5846;
	Thu, 22 May 2025 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943547; cv=fail; b=lghBQhGAKfDFpkUWK0ESPBtWIrxo7OuloEkiOsVbjKiw2sOBzOrvMzHlVDYqvFYbHScq/sythY2j279ey6XMTDZALq8G0J6co8WMtDwroYLHIsqC/yzKOPBAsdsqMxwxzHHMY0pK3lpwvWyr27rpPtxAtXo3gFzfmla7GU50Ais=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943547; c=relaxed/simple;
	bh=jHTeP4X6Ot3dQYNXfoYi0CZy+UzAZ6KdAmVeSDgpA8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfPu2qHMlOqDTEKgkVb8coYs1DNKBWkapyM2TCQTNyLw1qCst5HjB8sELy1+Uembwk8vufk6k98vHL6VifN/BCNGnmNRyMdkP9chHL9ViT1HCk7L2+4U6fE9wH4EES++diDMhqXKJv7geRkLrlKNEQ1wyKx5jmGMehlTOZhI0sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GNoWp0Jq; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GNoWp0Jq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esKwQZEMUF/sOsWtWg8HKiPjUS18GJqHeB8rZXn6sPr3P7Int86NjHs9cDUEHUGve1ttn+J6XtbuKMPBBVAxL/OOgVn9pIHcp1wST1cfnBm/A97Nm3eXMstahJeS48XM/P0CGxZ1K5t4jucuOBuOUFRc52N9FO23sf0tGc81NzDGhnEZ7X7ilECCC90D89iqyX3Xo0a+PODcpJQC4NPBFnePtcsiTjdPiug790ccDH1BrCUPvMP7LgPugG1M2LCXbXKwXwIi8pjJXXz488RK7GxRDb4UgzPs7UAlFS7oOlHk3H3IpcEsVgAd0smMETZFZHLQTv/f71i6v/67rUbsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFBxwx4WIazoD+ZBQdR0DOKNn6E19jg/hCYJZzgj9DU=;
 b=vCeIVrbRf8fmXRIjssLykKkcNKUO3pjKmWRlUgCgtLGUse2hx0FBp9xr0YImDmosGS8xZZ3wuXjzQXQWG58/nvAOJvy3tim7Ph3gtLpcFwQYSnfpYCUn8J6MacnVCf1zZPwXGdqRVn9GR+EQ/tokjAEAVtfzm2rD5fiQZzGVm4osRdUN3JHmoq+p/qBqQnCKAwOYcRyWc073ABjkTRaVxqSD59oQsQw9GeLpD4DEmpkDeiG9rVQF69HsM3Ye5OjDUlDZirPJYFGhS8PKiti48B7Og16LOjMzokoj6nQpGfm84VOLrpJHX7Jrup2FLoE7kCpABhuy8tfWeCPvTq1I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFBxwx4WIazoD+ZBQdR0DOKNn6E19jg/hCYJZzgj9DU=;
 b=GNoWp0JqGtFNBS8Kf6BwK8bNkcHkAncnshq2xjC9AykYWrO4DC5QbRyzjxLEom7AuDyL9Oi/K6BMnQ3yd9A5/miCW3XlQF+sbzP+zXJ78NYNWLj/L8fQ/Ncv7AwS/jVRRcy+QnsCV9ex8KSXw79jeH4H5FhzqLnrl/abdyjVyzg=
Received: from SJ0PR13CA0177.namprd13.prod.outlook.com (2603:10b6:a03:2c7::32)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 19:52:22 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::5) by SJ0PR13CA0177.outlook.office365.com
 (2603:10b6:a03:2c7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Thu,
 22 May 2025 19:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:22 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:19 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/8] x86/resctrl: Add SDCIAE feature in the command line options
Date: Thu, 22 May 2025 14:51:33 -0500
Message-ID: <b6809db9ee6f39d8af6d6f13646ce6129f02519d.1747943499.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
References: <cover.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: e84ccc94-05b0-4729-517b-08dd996a2b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i3wIV0yrzDaTimFSTFfMcaCbgcX04MpS/SRI8Tz+1RVq6nrv/d77Q4AO57m+?=
 =?us-ascii?Q?D5eEF6jiIE2qw8ZUz8ji6kcmPxxEm3fwxJ2O3KQp2k8Qp48AKudsCIGgbfAk?=
 =?us-ascii?Q?Q65TtzSih8qVw8Ku5W//Rp0rxBCfzoUNGfF1zL9cQ+4FmDjUm8VJLpkBR7Ew?=
 =?us-ascii?Q?7I4WcO7fNtJI6VtPKOFfJ3KcNdoEE9n5gGP0WFCIA30llmINZS5ibUN102ed?=
 =?us-ascii?Q?lg9qL3fTwR65ut8NEbFR6lqYXHKcXPiF5tg9yAAl0O8SzfTv2ocrshvAcvI3?=
 =?us-ascii?Q?hTXTfYDtlXXf2rJ7oOScYxx3kz2OsqKjG2A0nXuU1B5PtsOS9ZpzCV9Tcwkm?=
 =?us-ascii?Q?3GQrHuNWwzJ+qb3YDaosQK4TvGn10ZN24SfdNzY/13w0PhAuoNs8ByM1u5nj?=
 =?us-ascii?Q?qMFqgYjooARIcV2HmE1b2fLjzRfmSCfJ937yngyvbUiLr48daI2KWb5mE/1Q?=
 =?us-ascii?Q?Dc+7+lvqCyRx39xjsb5BlhjYt5SckFaweAj4R/8FL1uLyhkznZp0GaMZ1wgm?=
 =?us-ascii?Q?Tc8cSzXUf7rs0xLUtjj09yG7ZNkE8p/vDgZefUabcBHULrBTHNDbkAt60r72?=
 =?us-ascii?Q?nCGrYIwz+KoNvOCw1SN0e3aRfZ1k2GWpjV7s7jrQZTYFW+mDzvVZavm41Yk1?=
 =?us-ascii?Q?XuxaKW96EyVHXGkFIQOw3bRwZBvR/dxeD0zo/ZCuWK/abl1+Cgq8Y0F6s2id?=
 =?us-ascii?Q?/U7p3PIRSm0Wt/0aeG89qvh83o/acObVvh0cTaSNbTM1+K/ClE6V8d0yFf4H?=
 =?us-ascii?Q?OoX93YlzVGWA5z50Dpeunzp5Dfzmpr3AP+YacX6T9N+SdHr/bo7b5MKKqSrH?=
 =?us-ascii?Q?A8h2MWU3rsquHPhvA5i3xDLlTB3UqAsyF7ua2fCLHDfatCSPJqOpnmGn9aDM?=
 =?us-ascii?Q?z38Fy9QW/RM7uxuv/H7RmWBGq5lKztdos5kk5VIlDzSPjaLTjdhVUDKYBz6G?=
 =?us-ascii?Q?ID+lKwcxehJVmcRGiY70bmI4tEll/geokfB6KRogSVc1qa15++bxmitK9iNd?=
 =?us-ascii?Q?PKM9ERaipeTS39i446ejfgmpqZSCy6pZTd0Oah9zNeWLRDiKPsqqhKpd13V1?=
 =?us-ascii?Q?Bmbprtr5PmxBng6hMzjTQ+6mCQTu008YCYxhIZ6SNZN4PbXk99MOPh6Pt2b7?=
 =?us-ascii?Q?uBPc7k2ZpV8hNd1aNelMP/ZYsMwko7duhjAgIuCMrepcCU31bqFvF106wBQT?=
 =?us-ascii?Q?y/QfKh572iIC3wBsOxXiiXHljA4E4cB2ayBmcAqCLtvSMM0sCFLbRS6oMAe5?=
 =?us-ascii?Q?E24HHkf8EpzlDq/8eopD7EKUDQjDXwmIQIgqICSNUNUcZm5R+n4cVisgGk2B?=
 =?us-ascii?Q?VL0yPtYM5Npp8ouuLhqr7C2Zum30lPeXuIt1VDhSxXQKgn9Mz6e5Iavvfuoa?=
 =?us-ascii?Q?TOLiFNuKABSTRo4SvHt8p4KtN2vMTaD84QLFGrVBT15rOulH+/M+ahWEANU3?=
 =?us-ascii?Q?J+p/x9Bj3/xgfoj4Ukc74g/Sa+dpdXYnZC/F7aqwzCbnhk23rTJsJahhwj0P?=
 =?us-ascii?Q?XIs7cveCqzy8RqEryYIbCJOVB7lm/uYZVeF0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:22.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e84ccc94-05b0-4729-517b-08dd996a2b08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687

Add the command line options to enable or disable the new resctrl feature
L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v5: No changes.

v4: No changes.

v3: No changes.

v2: No changes.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..f63aa8c5671d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5988,7 +5988,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, sdciae.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 224bed28f341..2161520114dc 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -704,6 +704,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_SDCIAE,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -729,6 +730,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

