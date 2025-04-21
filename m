Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1222ACF1;
	Mon, 21 Apr 2025 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275465; cv=fail; b=P1Z/1+l8TY27ruEp5MbSWAIJdmyrR0xqeLVkE2Jkklj6s9FZwlX8IXWxA14NJ42CY9xJ9yIEufeeYmQNneabRcUBXoaG7vRF5zicCArsOJ6ogS8EuSBJLMR5qnkqVoJjqzOGBvmYx0MxIZ0uHqnIs+lY7/bVodm89hnQRdqdXdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275465; c=relaxed/simple;
	bh=sEc29eKY4GHUB9BjVARcfzrZemB4gdDF0fa8O4nrmhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MORzYZOaIH/9VUz4F/Fm31QIF7K2sMWaY28fcHmdZM8bnFWPVye0JxhiQ9zP2tnmXso9N0VqDWgPKhgEIdCqZD8Jl8aHfJTv0Kxa4Dlo5BuRDg1OpTBAwBZSFSZoeL47JnzC5wPID7yVLE9icw8uDKXnMluPfO0z0sWz4GLT7m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vd58ChIq; arc=fail smtp.client-ip=40.107.95.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vd58ChIq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrD9iM0yjaMLUf05OMCvZgZLckEB0duOQ8OUIS9mKqMhWyyw+WovkDgFz9w5Gk+LNQEKlRuKtfhU+xn2DghpGlrDEvaG242wZmjEgo4IW22FUum2+Sjpbhh/og2gUUWhe0JbPloKSqDs9jJO4bQEZH6Nb1R3diVecVsyv1dWyBIA37B4yA+gvMZbUfl9qn8eYKKyOKwKVcJaQUCePVJpGXMsCfSvLWHJGu6FQDOiqR6zBu+UhclSfZutW4r4Aek9vLQ5kqBbyxg4nE5J5EOS91IElICWPK+V4zAJdAoyzZjspY8v/81D+2bRwNnbVYJut4j6hQszlZZ7ZCKvypjnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1fNhYxsJA1NK1nL+NAxa+T6EabyELVAbchb5yO9m+8=;
 b=hi0dt3OursExAjkm5TS3ToPmse1LibK2wQhJMJC04Ln9nPUBrn96L+xwvQD9eKZwfuc/TIKeMsc7Uk16DFA0c8RZTOYvmrMlsx/2eNThMpnD7na8GaiLcOm/lEaOU0UBLCiY3h8aQKtSUD9gD6t9l0j2bhh1A9v/Z+nJ/G7gOrmYb0v4ME330NBZzL42159Kul5PzqTdVb+V/flKuxaJ2Tee9UBFp9u9Rpkh+0gUsuQZZiqqZqAy04RGQHy+/JRJ14XbGzOn0bAL8aHyMSgMPCib67IgLo1mK+sqqxo671X1pHeXGlup759MWymw442BE8j+AwjwdUrdEnYGrwRhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1fNhYxsJA1NK1nL+NAxa+T6EabyELVAbchb5yO9m+8=;
 b=vd58ChIqNKcu6f8v0fG/+0ZB3TQgl/fKUYkkWQFBS5+GSfPKdnpc3MXPYKacbtbTBLxfF1XSKb3Mt9VTtFWGwVckLoiyu2Nmi+tfqMoAr/NTohi/bpQElDXoH7gf7VoqHiuosp05U3lp3wIHfTIIG83qG9AiZ0l4xU04zC80p9k=
Received: from BL1PR13CA0116.namprd13.prod.outlook.com (2603:10b6:208:2b9::31)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 22:44:19 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::7d) by BL1PR13CA0116.outlook.office365.com
 (2603:10b6:208:2b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 21 Apr 2025 22:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:18 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:16 -0500
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
Subject: [PATCH v4 1/8] x86/cpufeatures: Add support for L3 Smart Data Cache Injection Allocation Enforcement
Date: Mon, 21 Apr 2025 17:43:45 -0500
Message-ID: <e3a60f9b4674db9d0115428cdf806009577b6399.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: d17c70f3-c0ee-40e0-87f4-08dd81260d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8vL7UCvcEpFTBxwncfLP7dGYi+L5S4D26oLG77CBTkdFESgY5FdToNg3BoSX?=
 =?us-ascii?Q?IB4kMrH2dri5MiIKYcZ+Dn965q863tSM25NAnA3diKKo7GnLndXBjFtAd7hI?=
 =?us-ascii?Q?Bzib/pVcJqDY0vHIE+39kWaSq/7gcD6Cl6vLDrOtJQMLua/H4+J23mrbszjX?=
 =?us-ascii?Q?ul2WaZTJmTRmgnE/zcHelHFDLJtmhE1UlB2Rf34xulFqRfofe9UIHKdeVdBX?=
 =?us-ascii?Q?MNiHGfsqfDSaZfEcdgp7cxTYt50xqSilAirEWqI9DRtxZrHpQbDpA+bGQ2Vl?=
 =?us-ascii?Q?LHV8Mwdwp9iQ4V7WXn0GYKiMshhvld3ZvKyE/JgwiEpDw31ITHGUX7fo8G4+?=
 =?us-ascii?Q?E5TGQevr17PmLC1cslvUUGJGp6ZIPXPZxzVCoz88A2S6jRAH8f1tjm96T4uB?=
 =?us-ascii?Q?FXFNOIe8ID8uTOCUPQyCTq59sWw07bhqRCKJzSCoabPNZQ26nDLsbUdrJ0ni?=
 =?us-ascii?Q?n4E7Q/XoYk5xH2DvWQQ4CKZBHixDBXsVM7T6vzhPYAsMhNH97CQ4Z9t3Rdu1?=
 =?us-ascii?Q?w3/lM3dKzuZU2w8+eF6eI5BrrHSNhBRmZum1JDbr1JujARpDIlnlun8OX4bQ?=
 =?us-ascii?Q?XGohzu9dldllhMV/E+N2bU5kV5DprLjxZ8dUOyS1u5dSrbLOKbLN1XhIfANc?=
 =?us-ascii?Q?3xLlDswvGPVx/0jjr+LdURKsyEAVi11rVxdQ9du0Jy3m4RI9LZsnt8qS5+c4?=
 =?us-ascii?Q?aqj9dtjHWxOTT4UQBWiQ+EOWqGF2b2JE9nS4cstwHWWdYiVpErKJgkNjAaZP?=
 =?us-ascii?Q?JMpYeMdY2PWKY7nGER9rJJxYrIY/wALMJttfUaH0fa82GQhRwWBIaFnSXe1l?=
 =?us-ascii?Q?IMZ+DpNo3qRSzQ2DVMD1fkjJxccVioZ0GZ5Pbn75IAD8fqMmg4TjIoH04pX7?=
 =?us-ascii?Q?QcC6mfjqk+2XcWAeIA8W6iyp09TSAaEzLump96vO4Y0YtCbvgZepqZ57J4uy?=
 =?us-ascii?Q?H/aPAoz+PHj3+4FeTDmo4PAa2jRa4fLt1rzzHYgDnZ7F7xmYfMFOHvYMYQks?=
 =?us-ascii?Q?ephkcaWzZVqiYMDpOcfUvH09kQJgP+JgY9t3qouf1Yzp/sYmTC5VbTCHymwk?=
 =?us-ascii?Q?GgmkI+jw1X973zYfl9y1gzoVVcowX64UIsKQlV2jd8vd2wvDiZGPeVY9WN7c?=
 =?us-ascii?Q?Li3AI5h3GG9mvhlBoJ4NSW00X9fRh48IWO+/9RngyLLypNmttZUTI6tAVl9s?=
 =?us-ascii?Q?QgeKdLpgQvETsM/0TYAiOt7z/xyp/HTjQ1mXm+p+IlLlp7XERcl+t2aCwrGg?=
 =?us-ascii?Q?mZxdQtgU/AyxAvBgrwLL6gXYr99oPIt9jmB9gleAynu/ldq8dbkko9x1spUK?=
 =?us-ascii?Q?E9qpVaHo6wAhtUPOq5GvMAeN+6VSvg7rZ9f4H8jAdnyg4BBphwUGNsaiLVlm?=
 =?us-ascii?Q?E8z7fsD6Hhf188AGMFiH1/BORtll3QafX+QOz7ooFrrpOX7zOPb6BcmLnJCr?=
 =?us-ascii?Q?h1gwM9mrhN4NkmDW4vdT1Sqpmm/f41m1F3wKyUGVSu3VX5yZF3rmezG+yz1A?=
 =?us-ascii?Q?z3YJLFgK0KWuS6g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:18.3452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17c70f3-c0ee-40e0-87f4-08dd81260d08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890

Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. By directly caching
data from I/O devices rather than first storing the I/O data in DRAM,
SDCI reduces demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
to control the portion of the L3 cache used for SDCI.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register, where n
is the maximum supported CLOSID.

Add CPUID feature bit that can be used to configure SDCIAE.

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Resolved a minor conflict in cpufeatures.h.

v3: No changes.

v2: Added dependancy on X86_FEATURE_CAT_L3
    Removed the "" in CPU feature definition.
    Minor text changes.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..8dfbea91bef6 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_SDCIAE		(21*32 + 9) /* L3 Smart Data Cache Injection Allocation Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 94c062cddfa4..24ff4a98d204 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -71,6 +71,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..d18a7ce16388 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

