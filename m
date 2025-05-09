Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E86235059
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808135; cv=fail; b=M2WUuDR/X/XOcYPpb3G1Zg0OQ1oK2IFh+fr+UKUsP0+UMhQE604EfHHvdonOXKqbzel6zIaSx29W24EXqA3+Kwp4E+m85+ipDi2LQ01dzqiO+2WKOKzFMf3vXPlo8NyMAE9yEZc3PVaRyaO62eEcMKOTeN7FxrgV9tXc8I420js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808135; c=relaxed/simple;
	bh=lDJwdN6FpWr2CYimiAJ0LT+Q5Qt+ziXpIImnAFoy8TA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bHLOpVVPzXD5/rfg+G+q/3zZo4Xk4XLaEIpWpZp2nr2Ldlp1Jw9OJIJJSyMt9Bkh6/lMpJn6mjWvQtJnwyTRJkUMp2AN+7TF1dntzsQTdujNQ+RXGbWk092iIm+/a1E2xBDhN/Y3gTQZupuZn/UjyC4MzhS/wFv5AcWWdqE+G4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W1RXO0gK; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W1RXO0gK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLK9qG8CUA4iJ5ZZXIyjgG8PehnmD0PFnhyRBqiZKJCYSx25zYpt0DeSfejk4YDKfUiv6Yyi843P9P7eeRNz1O0E7PdqbDc82jYNz6NAWYpYwVuZTIEHr+zCC7faBNyCO0SCSIRI/0+m0OXU3Ukz+Kf2uO4bTvaSUzZAmloYNIxG6vqB5JGcZoh9bM2I+kgu7ZOhJR4Hwf62oH8b+xJvA7YWFeYAFyG1t8ZFHsRMHRLDInoBQJPXe+Nnsuo7Mkrn9X1DAZOcyZj/jsWVhoMvGOIcn04BNiMpgU8cBVWqmOaSBzZtwy32XFg08P2OZl/jgIKNpHPQArsQh1M1lRZ0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fySsKOCqkIIh01NJVkR0I/ghRtxCo0vK49cfgTJbOb0=;
 b=qvk6g5M/0BjJt3n+IxeDajRAAaM04tjHzN0oaPrvOdQA+6AEEEIwUmNjYbVfRb33X6ourwaof4ZyFCEBRlLyn5/MGb0UaaF1rOEBxOIhMRQ8pZz5AILanlYeqWe2rwRDMrEjnIIk56QotKML9k3tjzZSyPrTov5SnckJthRqdhTvzLWOT4xAECMMlxph/zY1H0+2ea3P4cBtuK2Nkl1CUKGzO18k2MPaCw7Lz0tcgubxrzRMKUirzY7j9EDKDHvenAtxqorXCSeBnhBuJZ6VeCt7sXWxkI41ywJ75fmbbHwczVINhTr/agoVEBL9dBDFQfjw+obmwAiKy/YQycj6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fySsKOCqkIIh01NJVkR0I/ghRtxCo0vK49cfgTJbOb0=;
 b=W1RXO0gKofA2WAeLt0Yr9x6PGfnvVXzFBDoAaFplyoNgPs7N+lVRtXaH/olyBDF9ltvG+omfXHTIGkR3Ae1iYiUF04PMcsJpHBRfrjM9IfV2+GHSBf5eVee9MX8zfJ19V3DQLon1ouZ0wsiJOsPhnJH7wRAtebJ2prssvNXF6kM=
Received: from BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 16:28:52 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::21) by BL1PR13CA0100.outlook.office365.com
 (2603:10b6:208:2b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 16:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:52 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:51 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 03/20] x86/Kconfig: Add arch attack vector support
Date: Fri, 9 May 2025 11:28:22 -0500
Message-ID: <20250509162839.3057217-4-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 2762ceba-c60c-4a07-d1f2-08dd8f1695e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xEUlRnMI2l8EQbW3qtdfwI53k5gTd5o96r0yCSpTk0o92794mCZpSpWStfde?=
 =?us-ascii?Q?YGINz14ND23LMlFXsC5nJZaCPzmp+zQQAsHcGlODBtYALBF8nHBoHI1o0ip1?=
 =?us-ascii?Q?w6XbAVUid37VoTZKzE2f1UWevZ41bc27oXsBy81laeuvpq2V1wgIv3l9Ik72?=
 =?us-ascii?Q?ygqUKjPJLnaDvIIJy/Di9NszOokkB3vBZtlowYjdwWs38UNURwSQTayV+oKL?=
 =?us-ascii?Q?36sXJZpHZAZSz3Th+rsuhSYYm9RfkIpa2DfyjOAme8erqOB2uNrszdYxCtat?=
 =?us-ascii?Q?BgJutyNilNS6kLSAoR8PHPACy9X9mIbnv4lp6wz1JRuA7qqfVNMdU90+i6Wu?=
 =?us-ascii?Q?r4XsiKPDc4eCsdHgCCS3Ad9Vpa2tVnAautFEVzRC7hft7vlYbi+rncwwZoPv?=
 =?us-ascii?Q?ZVZlcCmxzWJ0W4THcCE5ZneD9iIIPsp66z1d4UK3pvb/AP7mLtZVwbJgEupu?=
 =?us-ascii?Q?MapuEEcDNCVtB+dq+zQ1rPXKVZZlvKNrsfOK5+1imlUYTNXq8SsHrr/kM3aw?=
 =?us-ascii?Q?g4GO2GjRcTt8SJIPsus6ZZbW9EV65u0foncNEWxNcMifMinZ+QJ3yWulth7+?=
 =?us-ascii?Q?V/exWafEswzR2aqX52rwXhzwi1JI1UenlQpj333j2d6lBui8iO9CRQOUMDyn?=
 =?us-ascii?Q?Nzub58qTdceYnhCIuKZnma6ZGWDBiAFb3z7c7LcfNbPolkXqj/h4oF2pjht1?=
 =?us-ascii?Q?1VvHYUgGzmgZou14qRx98+OUzXXjlvMiQW4hDQ5lNFuOqJjEoPSLtgBWZVN3?=
 =?us-ascii?Q?Oh0Qb6Z5E5yx0qmGktvDyrgcihAjhQeA2eF608Xh4bTJ79ZfZrs96WKxBaDH?=
 =?us-ascii?Q?buXRiE8UTfglRw7tKpzVlNuCjDkfKd+v8hE6yA4/cVboIpUvl6trIzqPzzwn?=
 =?us-ascii?Q?mMJm/IJGWxnEksshe3Y/ih4jrlRgNV4Oq/WQvsjXp2zufHhQuSoa8Jqv6c2/?=
 =?us-ascii?Q?mQ+3tRSzYLkf4AO8IEfKo82BpH+dxBs5e+keGW1iGy3AFU3uOFZjXAZLbIrq?=
 =?us-ascii?Q?GYCoEgLl6pFzLvM/Fhk4YqhHSfJjLGoOYhNER2yjbTcLrqTXyB5UaYEpAIEC?=
 =?us-ascii?Q?bE4mmRJl8bSTyy9cz+OYii5rYYXAgx45qBvOVVvWU+7P/jvYTDApt+h+UiDs?=
 =?us-ascii?Q?lBApYhJwIZPydQ9vUlTjPAbTAepRnaMOjIb7cKRguvIbPw+VFtpqdy3UxWyJ?=
 =?us-ascii?Q?wm690iF5lTfaUVTVrkLyP9PPcTmAf6X5miYzep368GLVeHpkatgK8ialuCQW?=
 =?us-ascii?Q?cr42IS0S/zvNBXyBEPE4u94lnp5dsVSLg/6e076fypY7E7tPKFsdRuX13Qhr?=
 =?us-ascii?Q?CukRWTbiBxUPz6TQZ6V4M19OLbELEKJRkqWkuhQ/NUta63h/569GQeme+/ER?=
 =?us-ascii?Q?NVpvvD1JIC0q6nGzuMg+XpJT2TeNu2VG3bgDVflWaVHqPfjkNQk2BoZlai4y?=
 =?us-ascii?Q?7aDHwyoIStECLAkZcup4ehVNeg4uha4IdIdzGNZXgKFS4rfy7dWaPSpGxXwa?=
 =?us-ascii?Q?8oQiGAoxWti12rqjrSEpWLQ9xVeTXQkGy1Wj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:52.2781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2762ceba-c60c-4a07-d1f2-08dd8f1695e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

ARCH_HAS_CPU_ATTACK_VECTORS should be set for architectures which implement
the new attack-vector based controls for CPU mitigations.  If an arch does
not support attack-vector based controls then an attempt to use them
results in a warning.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/Kconfig     | 3 +++
 arch/x86/Kconfig | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index b0adb665041f..a900f7a5baae 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1755,4 +1755,7 @@ config ARCH_WANTS_PRE_LINK_VMLINUX
 	  An architecture can select this if it provides arch/<arch>/tools/Makefile
 	  with .arch.vmlinux.o target to be linked into vmlinux.
 
+config ARCH_HAS_CPU_ATTACK_VECTORS
+	bool
+
 endmenu
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4c33c644b92d..af6350f056ae 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -74,6 +74,7 @@ config X86
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_CPU_ATTACK_VECTORS	if CPU_MITIGATIONS
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
 	select ARCH_HAS_CPU_FINALIZE_INIT
-- 
2.34.1

