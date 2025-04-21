Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD422A80D;
	Mon, 21 Apr 2025 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275473; cv=fail; b=kiTE1IVyOEXDQDESzC61pbux4nYyh617nanXMUYllwDN6Ug8eSshe5ZTYSW/VfQ9kBlDwD12O/ngHZ3mR973YHMlBojjj3dYjxeqAesRRegPWdxF6OXNxfD0fIcErzlq9+e9NYcgHWEnw8X6zC9R67xxxCwlOjqu4PPrfvNe8Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275473; c=relaxed/simple;
	bh=DyG9WH7WPIM5APfzek0xRRtSD0GXPtp91i8gVIfQttI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByCQKMDtt3P7BJGJku90Y0QG0a+VM+rxPx8aRk8/u8hB6y87KRnfFjymfUA0Uc87TOZVJllTlPr2eJWP56a/UtyfxN3OyuxeKlmlaeP9Rw+rxOoGVCdhgTF27HHlqamw1LgJ3xUH/Q085J7nD3v2KqTIxyWjgm5SRorhUO1Q7Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JbkEaSEQ; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JbkEaSEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p78NyZc6G6qI+C8b+LHCNgCc4n7XvhnT1h24EryJxK11CosqnpLElLicu0/sYI3rLB+XpSzkrpKFutOiUpvhhB7/03FaK8QUwNfkpK9fLPKeiBmHIKOn1abs+zeaSaOHyweUU5WDwN+DJ9vR0OUaSy+AkT8+w1UwNR09iqMCYPq8i+R2D9pDZ54jcgAoFW0cIdHnJkET20NPZyxzNeKNJHRcdyXfjfntEWO5rEfDhWI3wCpz1elgDo1qLAA6wmv/ImThJ5gpV/86rbZ4tg/IKUzp7Gs0Vtsy068hKc4JbxSpPyyQDBIjHUvwhb+4qUycs6Y6NetMdWqoxqjNpNLsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kst1TcDnQ9ySSyEo9tgOrOmEIorNzOYviMnbog0Y58=;
 b=pqrh9bJVJwPfLrMm2ZiR/m/TUwrICArUqEdNN6gAuuI7fNoKR/BBYGOO/n1R4MuN335UUyHrucdKhxqkIjjgZinYgv/mGVnV5lI/7aaIOwSuslnsBCoTGJHZaOz7VezGlBCfKBSvz6z6VnsYPndqOQXmT5P9hZC5xBwSKkInfNKoCQMik7cWGF6/dLKaFpp0mMlpTeP2HzM884FYpM9xjxsrPJRuTgdhjqkjSPILaGjKMki6zf9cS0X9vqn7CqwxRqKvTwcwbSQnyCAe9xmVlT3Fq0gq2AB2eUi/6M4YNQpAe+gmvzW15ExTSdGUJ15NM2h0GrMZSOBflBWauj4LNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Kst1TcDnQ9ySSyEo9tgOrOmEIorNzOYviMnbog0Y58=;
 b=JbkEaSEQcLjhfmJg3FeeG7zISV3CW8HP59DlsF5msNE9X8AZD76uhtC7ZZLVorH9smaNPjFEwDhS/O6EKBhm7T4jCw7FX/NboD23zexKSTjGTEsVnL/u2GRrW1XLsb8Lv1xDvbRb4S2J+LMUv+ooPPIza+SrDMV4iVTT6b+Uys8=
Received: from BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Mon, 21 Apr 2025 22:44:27 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::4f) by BL1PR13CA0100.outlook.office365.com
 (2603:10b6:208:2b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 21 Apr 2025 22:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:26 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:24 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 2/8] x86/resctrl: Add SDCIAE feature in the command line options
Date: Mon, 21 Apr 2025 17:43:46 -0500
Message-ID: <301fa41194d808488106c8b14bfcfcefcb71c186.1745275431.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
References: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 82960449-8af8-441c-6eb0-08dd812611e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vP5ZGYozSPfYFuD1gq4wRJi68lsAoo78xz5PlZG7BbOk+U4zf0+W3eMbCiLJ?=
 =?us-ascii?Q?gJVxUMchOJvwfAhZ/6GQYorwsnrE/a/oQeS7kbNoN8eow6uP2awPYXD4NeE+?=
 =?us-ascii?Q?f5hhTJQRlChBWABoh0CPnOqfZlub7vPFdTcz613Pj3anaZeIItwcGHTNasiJ?=
 =?us-ascii?Q?tQivbR+E8gmWeThvvcML9TYdi6rkMdMW1yiCAvCzRIXgP9JMLQEU6NHxcYmV?=
 =?us-ascii?Q?fVRV1brVAjBqkkGqG2jTq9ad6aRSaUdhjY09fU7H2noGXO2MdIPLbYuU1JSM?=
 =?us-ascii?Q?THVk/kOWn0qDJrWuHoWAKUDlI7fcZNTwovI/j3kmS1q8kkkTOFTENdkAgYAo?=
 =?us-ascii?Q?tdJwmgvdxqxrouf/T0efwqqqSvyTMS9kSzVMKzcWqHFt7/ho7R4Fq+2ldSXs?=
 =?us-ascii?Q?c6+FYkoY94aPoBjU6Y20kj57Dfgn6IW4wxYApE9+8202MLVGePuby65QYK2+?=
 =?us-ascii?Q?wwunldQgtea8FF3J6aiMbQIj44q/pJRj5yoFxSS0eXqGmmygFRUou0rjmJ41?=
 =?us-ascii?Q?OrSjf1bjQKiz27vWxOpMBJ7qseY+PSDRC0G6+g0fCTO0ZSqNmVtCIfNhZpRt?=
 =?us-ascii?Q?mVUu750ViwhpXAm703CMcYF7QXNe9TDSFopVhVdn86dtWWY296rF1QW54bxP?=
 =?us-ascii?Q?M58uxK17ttCfNWOEBnWT4EO3TAq6R8F8ETFzFdHEuBx41DGzOJW03iLYKsjD?=
 =?us-ascii?Q?GSIAYfdO+OsD+RsYK6yh97hfQfVSK5I9aB35FIi2HOJRu4vGoLIV48BdUxfC?=
 =?us-ascii?Q?qtgwxMiZuGmHh3p2T2mz+vilyA7wbbkfWb5htBAUPN/G3BSq3AgpIYsCYihu?=
 =?us-ascii?Q?He/T4xxdcanvaqJpiWFoIgICK0l/9FQIFGszPuH+SeKCmv6FDUxlBUtZZrkD?=
 =?us-ascii?Q?Vs+4HZGXtTC94mwppvvev36nA0hh3BeWDoW3Y7pUsBYDEteNnHB1P11b4etB?=
 =?us-ascii?Q?R++TZ/B8r4g1GSwrhgQidJRZuuRTDtwO1Q9F0ZUDaWRoOXVSAAy2OUdkTKiY?=
 =?us-ascii?Q?HV69YR9l8eAmd2o4zWK/537TP1YsLk4O1d5z/r/ZgsTH0sP59ABktMZc6m3X?=
 =?us-ascii?Q?dy4JYNCxgA/B3ocj7INQox3wvi+bH9lDJxIWrXYTZDNvwyt2Fh++Vp+KEnuq?=
 =?us-ascii?Q?kdA3XdpJRZjl9GU6ZvwTG6aj9U7sR1n3OGZP0jTVHARvsTChRPQtZPJMogTy?=
 =?us-ascii?Q?370lTN3j7g/VrwFj9jlFAcES2ApPQQiyhXR6UpAPrJIWXBNtStddMcMiY9C2?=
 =?us-ascii?Q?wIDgfvc7sXLqDCUVxmc3GNJXk29GNNUiADL6Y+Pt3CL7zYBJWJTAba9C6zAz?=
 =?us-ascii?Q?6hzLDKBtY6Iwkz5kJ5HTWJ3OwTwoPbWQI5IUbEBsfiLdhAPB1YvM7VVBeqsu?=
 =?us-ascii?Q?HQooRstxvbkux5YCwbB/i2PBiqQ7UFLYhFo/ezPRRL+sYWeGWT5821NnkEun?=
 =?us-ascii?Q?JHtn0KNVSO/NvGdMPIn9NR4qp5Rz6zR67mxSoMZqrXNYrpjT3or9iuJ0hSm3?=
 =?us-ascii?Q?ACLcTofqw5R7gEw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:26.5033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82960449-8af8-441c-6eb0-08dd812611e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389

Add the command line options to enable or disable the new resctrl feature
L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: No changes.

v3: No changes.

v2: No changes.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 76e538c77e31..5e5abc270f91 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5991,7 +5991,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, sdciae.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index cf29681d01e0..422083dc4651 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -723,6 +723,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_SDCIAE,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -748,6 +749,7 @@ static struct rdt_options rdt_options[]  __initdata = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

