Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2186C246BB9;
	Wed, 11 Jun 2025 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677044; cv=fail; b=cIu01Kbgb5HCLTC7OKcwhpMd0+zN/Op/G65Va8W3cq+33WY4UesMs0uRgVYiv7sL3u2hg1m+bMxi+Gs6kawJXvQoSVMNPuSU5zdJM3FSa6HzZOJg2r5BshEKQAoeDkIAfWAFru02pmTyAbX44eWg/qMgMcKnc6o1SyJr8lwTcxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677044; c=relaxed/simple;
	bh=8Hx6bfUY90mijE/L6336xd3ujV3xVxkrIHeEIsP77Lw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1upE5YrEq+WHmsg85AY7KbtpyhSSm3va8lBLNZKiUBoWnJYOGcmR0XVEfD9NtAUbsvHXQQboRzeC1pDS4xVtxcCgwHKLofs4s+EHXtaTaTEavPXhHcpojj5ZUCZbeRS3Wh1paKAXgyINYFtkRMFjxCZgT2/H4AFt4DMeMM+tTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PvEPfwUR; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PvEPfwUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7XWZvkN5ZqcobSRcJh542cXW7z+O7fFarI+g93d+31PQ1uVYTHYxGJcmepuMTlghfn9F+KvutW/GoR4cmQ3Mc9ve5EvSb53+Hk+HYybDylGmjd+fMImeKN9iUMOnfPiQ2uCElvbV8Tv+MLttN+kt7UyCdGFIdxkCdqmm5eQ+3VXQBxtIt7VJG3RiKqtE7a/xMqbvjpOc9C2+hSCT0HsaewSxYHAVA5p9w4052UmEyBCitPFTe2szytaN1bYSQvRkBj9hW9GQunhFBUlVXbo0HvTZWZzFP05Oqp9+FDdy+zQl3cUcLGcFD3A1CSkCkCAWRw09HXAXmIw0QoOK32G6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huBDnqNQr5Kr68v8dgWjWVaAVpVqVHEuJu4PFO/5IUY=;
 b=oq8ElO9k05DssBke8I84BI/BpBjOjJxy6rUihdEES6ZbkiLQPEK+M9hpfMTcYCWbBGNmX/RFv+s9QT0Lioy/xAo/MNMwWQ3Dt/GnydJAWx+QKyTEpyC0i1s1wXV5cx+ps0U/uRvmDj23O38maKuG41V31TpwYLhkTWheF1H9iACRd3u5Xjizz0VfltzUKlThAiBzrnhDvTQIODLvwM3GIxLCzGM7PVP38TzmQJNTfz1rbF8Yfz4DVzKklEYuLlwfu9UHGSoG9WYqcIltINuStBSS196HSekWvX0Kvvkz63loFeGLXaGp86kXzfw6wS64q5YtSpqoHXFhzqmF90MGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huBDnqNQr5Kr68v8dgWjWVaAVpVqVHEuJu4PFO/5IUY=;
 b=PvEPfwURIfSdQlmKRf5DCNu1+/NPkAf1vAN1qmWKKrtveq5L8qTBttb8rCQA/poLjbE1ejVESdNRB6s1l6O+9sPSkEm+YKEejR81DqFaDjrNHeMbZ6NblTJHDuR/rSVn7Kt0sffCzB0lTqemrfJELKd8zjmXS8a0njGPfq/9aYY=
Received: from BY3PR10CA0025.namprd10.prod.outlook.com (2603:10b6:a03:255::30)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 11 Jun
 2025 21:23:59 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::81) by BY3PR10CA0025.outlook.office365.com
 (2603:10b6:a03:255::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 21:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:23:58 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:23:55 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 1/8] x86/cpufeatures: Add support for L3 Smart Data Cache Injection Allocation Enforcement
Date: Wed, 11 Jun 2025 16:23:26 -0500
Message-ID: <fc53322c5c69aa4fd60c2ab816ba0bdda23f020a.1749677012.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1749677012.git.babu.moger@amd.com>
References: <cover.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 85aa8ac9-12af-4fff-62dd-08dda92e4783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eey6Rfg/b0TcGV0o6OyIQ736khFIDOiF9t9yjhKAt0zLihiCT0feHWAkinBN?=
 =?us-ascii?Q?lBDalGbmea6qmUb2BNd6hD2nshaVBd4sWhLM9HRQ+6XKuurc1NNsqpO7S5rR?=
 =?us-ascii?Q?h1/V5allXKZCt29pA4/OKUosUIOsg9e0TMkPKlRBYBzO4/9k3Vor0uaz5wyw?=
 =?us-ascii?Q?6hq/YsC41Zca19PCt7eq8TzAh/SwTzed4KJQ8vdM97UCEyWSosioHuDKl6gR?=
 =?us-ascii?Q?zbqoRO7TdPs+oCoHdiSi64brsLYo5wOUVnQ7yCPXSrYVPYc1hJzgtjok7KdV?=
 =?us-ascii?Q?74H3SUlH7OLsOCWbmWUXvA/sr+S6f3oqAujRcXFbDC9bfha7n9JjK3YdD7jg?=
 =?us-ascii?Q?yS3mKSLZuxcQ5whbBD06K0rWyqvuGZ72OSe5HQk2UYaTtH7GZOHDWFYyWsP+?=
 =?us-ascii?Q?3u9GWvAkp2QQ7qFOe6RWlHVOxxjjOzJpfSJUk5KstpOoygacsqqXEXPlW26Q?=
 =?us-ascii?Q?Ce7lfZu+VKMn+3zPxt7MDmzo8ZjayOXIa93kJlhBs7ASVB0VVhlAgLBNBs9K?=
 =?us-ascii?Q?Vgl4TLw6+h3HeXRyHj403VUZ1b4LebqeGZG635sl8RYogJpegY96PXKnrTZ0?=
 =?us-ascii?Q?A925F1aLPibkiQtv7r5Rtk1DZeOCFR4D3OZPupCWrDC12ifR2Nb9EpQ6gjTG?=
 =?us-ascii?Q?aQzSGb7F6cz1ng53JVoDxqMSThGyH2N9OWOBpx5IFkLu5aY9p6i8/1Ph0Pj7?=
 =?us-ascii?Q?JSEmedvt8h+IZwulZy+jtoFb+z6xgXzt6eomwRI6ILw1UHMAQ92heI8KSQz8?=
 =?us-ascii?Q?M8PpS3VjBIdxkhmKd+xM8zCYLtdCFMyVlpjXoozHx4UcdQX1/Z7acMX60FT2?=
 =?us-ascii?Q?2eIIQ8o/3p+2QicveF9G6/uNpHC8mzNa95thTPQeQpz0ZEeMGSB3Cf77u3LW?=
 =?us-ascii?Q?sDO9RYT4ivJ52Ufd4FpGJFzig4azRrZEk33z8RDUfLr7lSx9oZWakDIhw0TF?=
 =?us-ascii?Q?8nHgxJ21ncuZ7PmM3B5+uPwiduFLvQBrsJ4REWeW3KSNM8fmjT6XUngz8wzh?=
 =?us-ascii?Q?FNnmfdWYt24VbWfnn0Tt2BtSLjq/yx91rd4u2EWCN/0078pSI0CC0Ra6IZPY?=
 =?us-ascii?Q?K3FfCAka5jbbKjA/oj9sjR8DdvJAC+KeoLLaQiaipDR/zaMUAQ/I6Ph8Vw11?=
 =?us-ascii?Q?SbZIxq5wpllpMvPvNUV+LtCy2s28x3LvwHrpjVaQHArIj+pyDJ448Vv+56wK?=
 =?us-ascii?Q?M9JkAEKOfMMcyUqkDVHhK1RF0q61ZnU8LcZRPLpZJtqJ6ho2yIfYptU73PoX?=
 =?us-ascii?Q?z/PCYamhOZnTxPNaE254YcAv1h/KgE+9S/e19t1yjxbgzrx9vaWn2XmqU5Rq?=
 =?us-ascii?Q?5jZ4tm2BV1+/VOqjpaBYkcf85hvieiRTfq6Z+NdbCn0JpTnxvC4+uB+EvCX4?=
 =?us-ascii?Q?r7oOJi3xGU6NXOp6Uavhxk75ZgvHpiw11nj7db2csmlKefO2jFUrorCLu1uk?=
 =?us-ascii?Q?SQNX+0s1lT5z3UBYhgYRocNGOzWsODrH10fKWun+HeDn9m2fYYX1Gg4ZVZn+?=
 =?us-ascii?Q?PUsdNYxLXB3FhYViJ19vduUSwq4RjSv9K9ElVspfCXpdKk7XHb8rYWy9dQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:23:58.8599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85aa8ac9-12af-4fff-62dd-08dda92e4783
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

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
v6: Resolved conflicts in cpufeatures.h.

v5: No changes.

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
index ee176236c2be..1e3d4d8a45ec 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -487,6 +487,7 @@
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
 #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
+#define X86_FEATURE_SDCIAE		(21*32+11) /* L3 Smart Data Cache Injection Allocation Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 46efcbd6afa4..87e78586395b 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -72,6 +72,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index dbf6d71bdf18..3d1f4d718a84 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -50,6 +50,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

