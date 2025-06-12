Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2C2139B0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713412; cv=fail; b=To0ul+3Q1ZwckbaIVanidfIhGo3FgmgVc8x1vhfPT3arQq86jaBHaFebFCvfdAlmx7fQ4Vt7EW6s27PPUIteZfrOnIYeZzkIOvUA/u38bnfw/xMU20NJ0PiUouqSehzXxXjQDyYlPX5wFHvCH7/L2Hv7R4Ko5XcPrQFEoLMmXXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713412; c=relaxed/simple;
	bh=5wOEjVHRr6rNYDiU0nAtwdWsoGJbsDfCQ4fBE5gICB0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tyo5dzzBUQdtqDBxUQx2MEwGChs5MmVnpgiVDpescinUYmJ3b/CiQmcA+er6iPMB2q7g+FzQ4RAgMyrTFqPkzVhZTIPlemiDoAIcl/5YU7CkJcaIcswjPSy5CQZZrKMRSN0+kv0NWm0tnxv+teu2zmLQqbI95IM8+0J4m9WF2m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gsyKDiPc; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gsyKDiPc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U10ytx0tjD4TIRCs7JICwh4GrVw83otTSiwysYjEUt4HtM4QML7NVhFrtDz2lcf/dIAOxkTUuKlr66ib06jn7aK+ru/kTqo/2+vbKSiVvESiYR+BZA1gD8j+yezwmherdyrjreRaGjqIOqHdsGYVzxtVfyGSF7xTwpF5D4QZrN3/wyQByTQud2e1Ip0OQeM76uH+bENvQDa8jRYOSgAkh6u7FCe//aoFJauO/9C3LtmmGczb2lWtHxJK5m9SX92Hg4854HfLV9eXltHLhs36sMFEdIrLIhYM7DNCTyEHSHaIIY1oxMEvJ45jQqr0ePvmLIskEoO5I8mPjJkM7yJuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Y43i2U5ll280TZ1dFzQK93l1PXFqTgN61fdLdOLN0=;
 b=gcqSQECeQaA34sUwgtmgVsPiq8D1ZmDs3jl6zABe7dBtY13eZP3o6jubDM9bZVB1OSKj7IMrDKwtYJzPkPIKyDEzG/ZlmPahpdVj+gibqJRoUvsj1snPu+KTzqc5i0clQNdXbQHIlAZs3s586QXx2AJC4gkAuufV3yPe28G78Qn+jbT4bQne46er6ZzzaeXvLlq2EF54QBDiV+6WEJ0sQ9g/6IbYPvvyUP5syOThTfwlFiET3qrLIII1ic0AasYsaMMK+4LFkxrHtyght/nO6nHgTot4606mOrC7j/9g2vDRMeQOgW4oAYPKDgcoZ0iH9TO7IPWBaicUMsI1wwn8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Y43i2U5ll280TZ1dFzQK93l1PXFqTgN61fdLdOLN0=;
 b=gsyKDiPc7skdT5EFGlNRuMPzyC4wdqPUpS2m/f8wyIGxkTKusODEqD2ynn4gO8Oa8yHPKUy2NgIgW1g0sBTgIbTKx/gQW2YVWrjAU4wlvHkoUTTIvMhEj9DdR5ZRwNrtcRUt+20E9k4IU/W+XUXa7r7B5QL+6SrUhoPkq5jXdfQ=
Received: from DS7P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::10) by
 PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 07:30:06 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:224:cafe::6d) by DS7P220CA0063.outlook.office365.com
 (2603:10b6:8:224::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Thu,
 12 Jun 2025 07:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 07:30:04 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 02:29:55 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: "H. Peter Anvin" <hpa@zytor.com>, Naveen rao <naveen.rao@amd.com>, "Sairaj
 Kodilkar" <sarunkod@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Gautham R. Shenoy"
	<gautham.shenoy@amd.com>, Babu Moger <babu.moger@amd.com>, "Suravee
 Suthikulpanit" <suravee.suthikulpanit@amd.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>
Subject: [PATCH 1/2] x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
Date: Thu, 12 Jun 2025 07:29:20 +0000
Message-ID: <20250612072921.15107-2-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612072921.15107-1-kprateek.nayak@amd.com>
References: <20250612072921.15107-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: c69199b1-6410-40e4-a3c0-08dda982f2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDz1ggtNND//GHmXtAIpcK8NKlV0ws0dlB2MfWBq6GQOH4EOnwqdNrXV+G2N?=
 =?us-ascii?Q?yYfti1+pGikDmEpr9RnHhkMGZoAYWmYvxokYnONC74eqtUlspVMjRM5oPD+B?=
 =?us-ascii?Q?R6wBrls+J5Np1ypQkeU8ZcAfhTu8mcZTlIYjnCophOYp7h3U9GAFxZ52XMIP?=
 =?us-ascii?Q?KTXyQufgxGu3QELLCHE1ty8Uams1mYC3MaLOw8RKY78Kz+X31uC88xVz92AX?=
 =?us-ascii?Q?Bsw9nHg0/hWNMMO3kNZsyGLqOdXceo1AV35D/UiupRkV1AE4zKEztYbB+5yU?=
 =?us-ascii?Q?ESCzP5Hme69+O8ovecFlZEqyaSyJqcvJAwfZxmnBSaf3/EGFf/vRBQPx6TXY?=
 =?us-ascii?Q?nUd3z3/yC1L6/C9PGIZbFMKzMJbS1xMSbvUkWkiael/nF1XpMFis3Mz+Jtqh?=
 =?us-ascii?Q?S3K2d4vzeHlS3abT3XEwRbSA1YpsRMs4FlWZ69rpAQIs+UxBWTFwAbwvUTmK?=
 =?us-ascii?Q?Sd43CG/DErXHpYf1BqJt6YTk54Kj0iXGQZF7jEd8aJjWuF1JU47daRYFCjOD?=
 =?us-ascii?Q?8oNKUD6YQJon+sCuG5TijTRKxFhLu2NWhOMOzJgwp5IA3j8iegvH/jU2wTwu?=
 =?us-ascii?Q?zLNQRQVC1KvGBcBjLuhqQ4tmwdyNJ9kGvP9vmscqPzvdzy2HCOOQmUGak1YO?=
 =?us-ascii?Q?Syn9luTU6UgxLjnRmgRGyBB+ScIY9p1Yab/OJjX4UtQ7I4SK2cfX5LhtOB+B?=
 =?us-ascii?Q?YcBWy8aHrknHvVhpuX1uKbL29x28N5rUHI0UGKK8ImVZODVHFTR+2iNABFSn?=
 =?us-ascii?Q?2Ct5oHb1d5Zbon38S3gzf7jYYRnzNQL+y12uluOgAbjvlznKWIdrp5hhPaQe?=
 =?us-ascii?Q?s+R9ahdvAHLmXK2azpzxC3t7w5qHAEdqWxzFlU0jN4AC7SJWly9ve/xtEzuH?=
 =?us-ascii?Q?TyPfaySKErjEsC7y7ON7pA9tNDFJw7B3M3iTuJ+EU7O4rbdlMm1rBSLICmrm?=
 =?us-ascii?Q?kUWufn/mB0PZKK4GeuW6l9c526DfITqVZC2ns8J+Tj0PA0eaVFbEusOxVM97?=
 =?us-ascii?Q?Hu2UrRSe3YwJ4QeRuC6va3jUy7clf4nG45GftenDKouhAOwoiLJ+1jTyw7Y4?=
 =?us-ascii?Q?kIzRILohKkPuuuqDytUtse8HZO8HzeEBhlXN8liX27Zc2301FdncsU+lasRt?=
 =?us-ascii?Q?ltxIHNafNnYN4q31NDtyjkJZgnXvREViIqPzCHh6ACsPqtTKBNGcuJ83Zd6y?=
 =?us-ascii?Q?86r5hP7rYzs2CZe+/gmaT/Q9MfWwyhtvidDejm3aeq5S5gQACEjP0MeWIecn?=
 =?us-ascii?Q?5i3t15M1bRxDNxTJL+XIg4V9u1/AT84QTRnvyVeMjC0nUjktw0Cv2QOKG5rA?=
 =?us-ascii?Q?hzdwA0UG15WW1RnEpMAXZZ3/bH8pcHKmmnCWptneaBSmQoDtY06gl25nhE6t?=
 =?us-ascii?Q?1hUdxlebRn2q88IO/tU4l8UdfQ6Oyj9VZ6Y47pTBF4v37Po0tBAlv3z1VxfK?=
 =?us-ascii?Q?mP9jJ1vwob0MikFqVKLxOcfY88hohcVA7GdC7ugTL29jrj4MsPBW4/ovnwVN?=
 =?us-ascii?Q?SY6FSrD2TJg2YV0D1qPII4ioThQr0iT5tpXMDjAwBJ6pZUjB+i1X5Zx5rQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:30:04.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c69199b1-6410-40e4-a3c0-08dda982f2de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

Support for parsing the topology on AMD/Hygon processors using CPUID
leaf 0xb was added in commit 3986a0a805e6 ("x86/CPU/AMD: Derive CPU
topology from CPUID function 0xB when available"). In an effort to keep
all the topology parsing bits in one place, this commit also introduced
a pseudo dependency on the TOPOEXT feature to parse the CPUID leaf 0xb.

TOPOEXT feature (CPUID 0x80000001 ECX[22]) advertises the support for
Cache Properties leaf 0x8000001d and the CPUID leaf 0x8000001e EAX for
"Extended APIC ID" however support for 0xb was introduced alongside the
x2APIC support not only on AMD [1], but also historically on x86 [2].

Similar to 0xb, the support for extended CPU topology leaf 0x80000026
too does not depend on the TOPOEXT feature. The support for these leaves
is expected to be confirmed by ensuring "leaf <= {extended_}cpuid_level"
and then parsing the level 0 of the respective leaf to confirm
ECX[15:8] (LevelType) is non-zero.

This has not been a problem on baremetal platforms since support for
TOPOEXT (Fam 0x15 and later) predates the support for CPUID leaf 0xb
(Fam 0x17[Zen2] and later), however, for AMD guests on QEMU, "x2apic"
feature can be enabled independent of the "topoext" feature where QEMU
expects topology and the initial APICID to be parsed using the CPUID
leaf 0xb (especially when number of cores > 255) which is populated
independent of the "topoext" feature flag.

Unconditionally call cpu_parse_topology_ext() on AMD and Hygon
processors to first parse the topology using the XTOPOEXT leaves before
using the TOPOEXT leaf.

Link: https://lore.kernel.org/lkml/1529686927-7665-1-git-send-email-suravee.suthikulpanit@amd.com/ [1]
Link: https://lore.kernel.org/lkml/20080818181435.523309000@linux-os.sc.intel.com/ [2]
Suggested-by: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/x86/kernel/cpu/topology_amd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index 03b3c9c3a45e..fec849fff82f 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -169,18 +169,14 @@ static void topoext_fixup(struct topo_scan *tscan)
 
 static void parse_topology_amd(struct topo_scan *tscan)
 {
-	bool has_topoext = false;
-
 	/*
-	 * If the extended topology leaf 0x8000_001e is available
-	 * try to get SMT, CORE, TILE, and DIE shifts from extended
+	 * Try to get SMT, CORE, TILE, and DIE shifts from extended
 	 * CPUID leaf 0x8000_0026 on supported processors first. If
 	 * extended CPUID leaf 0x8000_0026 is not supported, try to
 	 * get SMT and CORE shift from leaf 0xb first, then try to
 	 * get the CORE shift from leaf 0x8000_0008.
 	 */
-	if (cpu_feature_enabled(X86_FEATURE_TOPOEXT))
-		has_topoext = cpu_parse_topology_ext(tscan);
+	bool has_topoext = cpu_parse_topology_ext(tscan);
 
 	if (cpu_feature_enabled(X86_FEATURE_AMD_HETEROGENEOUS_CORES))
 		tscan->c->topo.cpu_type = cpuid_ebx(0x80000026);
-- 
2.34.1

