Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09123D29E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808147; cv=fail; b=RwVFb0Xltf+1oiHkdTZGWli0xB2gFl7f85BSeuzEr/C7/YTte8SrBkdtZHM0OEq9jU9cUKc4AVW/VuSwpuWZsJoh2LM3DwHMzM6dv1sXDSZf+dub7daBp2d7FXY7zBFD6BA1/iaQmBWVbWQqKRe1kajyBQfreYGXE+wgHM+lbX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808147; c=relaxed/simple;
	bh=/8Mrpm8eTzTZ4JIaMaz8nHexdv5ajRIg+vFKkyB3GmE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZBgopwC0+RpxsRATrfOj1MPSjVxjlcRhz/NZWQVCwRjvJYbO2gNrob4iWOFJW55rgu9HSkhRfvicRxJ4mwVAWezR5vyh4CAQMGMY+NthwVFM3MIrVGJdhptxUmbMAFltUGWcWTPaZ5YoAKRD2x4xVgwBpTMUg48an/feoTcCxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ND3x8g1e; arc=fail smtp.client-ip=40.107.100.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ND3x8g1e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU7ZDwdhu0XcUTg5bTOvdSuchViSHj8NZGLu9agwzuGNQw18/zSdxu6tvjgH+9O4/yz2Ez+fFonlz3hQUivTSt9k2+5oez9SFeeR2RMLIPu8vMafB+KHhPHVqWXD72y/IVota8gpym7tnfLKtdU2RLb3w9/QK2TaagVF/ZvR1qAe4X1BwHBwxoCt/RGaMUisM6y4QOb9SBQ1NsVa4eT5TTERxthF5I5i4brxrmt5nOc1Ol4fWHiGlXgkio3SmY3t++jYL2h2VvsYXxbFHe7AK/yD6B563mgyI4etqcYdJzRBmdxhNGRovpFfEY8Ixkutx/qe5LWumUDZOVbEifCEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqMv0l1bZiXfgPs2142QHhIPoY0/kmo51ClXolOmzus=;
 b=kv2CUyLICKBWyHrKuxrpnh4B0aNEj97AGSMzsUhuKoCdBEzjUR+r66WEDiBRmZtgR1+eIDTyFHzJJrMOkl/p/4B12Td2fuoZ7bgJiM33ZOa3Z8jnEVm3Xr5ndwRc6Q5QETijqYvebUYIK94no5xV6c26rNGQXAcXBl6JVYG61+PyBzuZiBUqwp45QjN5y1pJD12A4ItuCzhGwarEhrs1Q4SKmEcN94Y8l6gEL6NncgJC9jqc1QXLjSuR/0LvCZJCn4ZdkIaTeKUJEv8Xw0mHGURqsx8DMnCJ2qnDTLnrbouIHk1Zj3gTTHh/HQU8lfeSEmtjZf1RO8Am+4BPVq8znw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqMv0l1bZiXfgPs2142QHhIPoY0/kmo51ClXolOmzus=;
 b=ND3x8g1eV5EWUC94yznfC/2g7fH01AurXnJZ4G7bQjQjTYTkTWZ1y2HRqdv/IpNZ8UVTHWAYSlZcPflgK1PLVil9TAFCaj16PauLRb2OhWAel49hOfNNIf0kva9XFXLxpWA4Yzgf6wObc3m2L8RbQQkzmxsmurlvXq/ahc7w8so=
Received: from BL1PR13CA0112.namprd13.prod.outlook.com (2603:10b6:208:2b9::27)
 by BN7PPFED9549B84.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 9 May
 2025 16:29:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::c8) by BL1PR13CA0112.outlook.office365.com
 (2603:10b6:208:2b9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via Frontend Transport; Fri,
 9 May 2025 16:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:03 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:00 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 15/20] x86/bugs: Add attack vector controls for spectre_v2
Date: Fri, 9 May 2025 11:28:34 -0500
Message-ID: <20250509162839.3057217-16-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|BN7PPFED9549B84:EE_
X-MS-Office365-Filtering-Correlation-Id: e59c53d3-2006-4d0b-559c-08dd8f169c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CxoDs5OOSG/Mnf3vT81pkEmKoTBImeEf8H+Bgzh2i5JGDAf7cX68SpLMVzL4?=
 =?us-ascii?Q?f/ZCplaPCrrYPM+0630YsM0rjnrX9SkrleEo2zgAsJRjvp3SqfYPURfeboa0?=
 =?us-ascii?Q?GSvuhvD/jvV4D5eTp5HTlfrNydwD7uGzMccZtW54jN70fR+Wm114/Q4kTN3H?=
 =?us-ascii?Q?QziUfRD12qagcMq1f9g3du9KLgdyg+uO02ZzBZhDqPLUH+Z3T2odvyJUZ0D/?=
 =?us-ascii?Q?DgwQxeChgExkbOXXsUlWUPYoEE/6+RJqQldbRhEzrctwxrawJTILQbH+TTHR?=
 =?us-ascii?Q?vK2Hq8gGKpWmoAAUix0HNAv9Bhr8ccLaaKSvRxu97eYjmhrW7Z49tvKaNei/?=
 =?us-ascii?Q?Fek2ctphA8s+GngsPncGuP8NcbfNf4z40lq4R+6YsrNmLznbBNvm2y6+SyiE?=
 =?us-ascii?Q?kbdc72lXP60Hf4IFoQO9Cc3P9C3gZVBZ70Clt78nRegpK7Yj9AFiJY8Vuw21?=
 =?us-ascii?Q?9ul1hdE9h9/9tFU9YzNZ9COhSWWPFR9dlczPi6c7n6lPHY04DzOeK2XX+I17?=
 =?us-ascii?Q?AMrHTwDn52/WM9+dI4XVHylLx1QD+l8RuYvIzNG6auLMO6jFPkRRLZbKzKsI?=
 =?us-ascii?Q?929G0BCUPIgs7bm1r14Hs8STuMEPWd+YiFp3g48gjwMLAPhJXqwE1RewdUja?=
 =?us-ascii?Q?aboKNcRYvNy6vYNor2PWzjQLaJK0YVfc5jNN8MFkVGTINp/Qj7ZEGONHB8Su?=
 =?us-ascii?Q?ldrm7Ve7qRW6oUCgjQWb865s40CeedaQbdEVTAZOskyAvFh51O7Sf6di7SjM?=
 =?us-ascii?Q?8E4ZkhfncW28jXu3JJw5ZLeQSTyibzCwHJHbUnD02rb6F6KCy28QoU7avsBc?=
 =?us-ascii?Q?R+0jGB1Mb9cfK3RY8qziezVU+J2LzSCpuKcMGxZ0I0UQ7stRGteCAbJPtsTh?=
 =?us-ascii?Q?yhHD5yPyEQGThmUY4bGaKZoYUBwOxSnCAtRe4ykW1160QlEJbMjw5N+kLHea?=
 =?us-ascii?Q?YxV2wjNS0k7B204AzA2/vpTcUXzN5q8vZ8xLAMyPAY27LQERirUXxuGUmTUm?=
 =?us-ascii?Q?0+oX/VC0aHAOTn31ZG8j6SJVThYFsyvj5Enyg72fvEVJZVKzzN3aYwgVb27q?=
 =?us-ascii?Q?otFhHlhFEfBwS9Np/feTZ/fBkioxke52dmBvrpMr2ioR8IsfyRgYporYcXGW?=
 =?us-ascii?Q?CY+Tl8oQ5jJgSD8HzUAYHBb4kZGLBDHENg1+Hl953V1Y8Yj2/wXwa1+F3NZu?=
 =?us-ascii?Q?PI8WsdhomBZccQK9EaC4OW/pJ18OMOunB3AO14+WXGuo+r7P+DRCobPvD9Dh?=
 =?us-ascii?Q?skedGAARPHqv2S7cp5KT6VAE58BQAIAY2tWlSZL1zsirsK2THj4ffCxBGtAY?=
 =?us-ascii?Q?NcswSfq/ofJ8Vqk+dyvVbcZRW0ibFdid6hMSPgWoSWyQTWwbJMtYJnJGq22H?=
 =?us-ascii?Q?aHrHQQ7qXzByrSnMEyvoBDSDPF28ZWSMMWmXVXw/a9xuHY0OOLLpEgBqLzrW?=
 =?us-ascii?Q?raFjBSqQm5IMVe2OwX99ewYRbMqotnPC18VQHOs04vLAeA74J6Qr1JLmW3yJ?=
 =?us-ascii?Q?wSSb4RMIIaqF22RpMIJyvo8wn+W+NiRU0Zuj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:03.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59c53d3-2006-4d0b-559c-08dd8f169c91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFED9549B84

Use attack vector controls to determine if spectre_v2 mitigation is
required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 667385808400..6a4bc80be1e9 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1728,8 +1728,7 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
 	int ret, i;
 
 	cmd = IS_ENABLED(CONFIG_MITIGATION_SPECTRE_V2) ?  SPECTRE_V2_CMD_AUTO : SPECTRE_V2_CMD_NONE;
-	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2") ||
-	    cpu_mitigations_off())
+	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2"))
 		return SPECTRE_V2_CMD_NONE;
 
 	ret = cmdline_find_option(boot_command_line, "spectre_v2", arg, sizeof(arg));
@@ -2008,8 +2007,11 @@ static void __init spectre_v2_select_mitigation(void)
 	case SPECTRE_V2_CMD_NONE:
 		return;
 
-	case SPECTRE_V2_CMD_FORCE:
 	case SPECTRE_V2_CMD_AUTO:
+		if (!should_mitigate_vuln(X86_BUG_SPECTRE_V2))
+			break;
+		fallthrough;
+	case SPECTRE_V2_CMD_FORCE:
 		if (boot_cpu_has(X86_FEATURE_IBRS_ENHANCED)) {
 			spectre_v2_enabled = SPECTRE_V2_EIBRS;
 			break;
@@ -2062,7 +2064,7 @@ static void __init spectre_v2_update_mitigation(void)
 		}
 	}
 
-	if (boot_cpu_has_bug(X86_BUG_SPECTRE_V2) && !cpu_mitigations_off())
+	if (boot_cpu_has_bug(X86_BUG_SPECTRE_V2))
 		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
 }
 
-- 
2.34.1

