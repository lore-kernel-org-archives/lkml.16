Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2893A21481E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993060; cv=fail; b=n213edstVaahMtf0l6FTQXGLlqMzmAaReFM49pI65kJZFv0MmwK20/SVncQ71yYtwvl6zvw1P83MNmyn1GyPNEUTchf8qoLQ8I3pAbPI0frx0l55x9K7eD9JpVAbmqi1HIfZ9p+sbz6Do3mNdghri3BWusYezlitxiWQdKvhtUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993060; c=relaxed/simple;
	bh=o0xLya7hrsftihh0+bCY/JlxP2KJCyFTLwcfaDDFqmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkWDnjjq5sYKP6XayIIx+jiaBfI7DE6hE4A5Vioufl6X0NNGA+GZ82+71vvCpxWts3fWIRmkqdUaA+k3SXHKrfdA6FWp0Lzf5a2cffjPYETWCt768WZNg8PeX4l3wqDOg33l581IpodKhNLkrkmit4I3/ngOcANU1xpB4X75Maw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F58Yyaa+; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F58Yyaa+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1LMvrnKko7ghfycSzQ+5BoWJ1ERq/n8GDKxta4U39kj40ckBZVTeUJ0yXf6ksIJSFK7B25oXY+1N+NKlC4uzIt6Be0iA2eLDu/s3caRHkocHT1++kZSSRw9EyJXOgOLpeu1OsG347iZEGW+4WPVyOyLroo9lfjeJlyhOniuJUDsN4sbDSu1/vVEG8xCw1igrAAM0XkIpkYATUMFMOc0BLBZUg4TEhAUDaPqJg2eBPH1le84dR3nA1jITP5LjDCiu6uQliIztOAmzsW8kp3fVFvOBroFTHteTKYJXewqgyT756kqq/FzTtgRSopm/So2z0hcC30HRh5yiqKjn1Rnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjYxT98J7o4QLhxnhi4saOMaD9COOKzyKfjrkSya0GM=;
 b=j1OWp0RSwXb76xvjF/DUoBdY3mZqB2dlGHwun8yntNHFtdGi0jICeavPhaPucgcZRM7ksKderaWrw6dJg1R2WuiOd5Snx+xHfhuLqUVjcuZmauZcRZvkj+6VIm+GEZucL1c+lswgFhPQGoiJJWNFJKvDZIC92H1YPGRWbKn5PiftEVkYm4XxXAgVzAGv64MygP0cys2FNMks80Lns/BH0NKb8MUc2YXphU7QwyUPE6QsdbR6n6K4UEfE8T2kilAin6o6IHt9rGjMspOJ+BWSc0trkFHrEpRwq3uKsdb5R9spENSLs10qyOU7Xed9VV1r+RFIpnhj5BWQrGeZcy+FdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjYxT98J7o4QLhxnhi4saOMaD9COOKzyKfjrkSya0GM=;
 b=F58Yyaa+ZSV1ZFqaE4pRo63emETIqDTnCMcydz4rREA68jIW/1mzq3ubxh0ueG4iGQZbwrKZ1r0USou7B7VOwM/GmFsIcfb7J4KGLzf5hfW6EjKu2ffd9+y0ch27hLMEsMJ1ohbCbPdoK61ZupREx573X7IylqTg0jxvetCSD78=
Received: from CH0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::10)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 16:17:35 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::e6) by CH0P220CA0004.outlook.office365.com
 (2603:10b6:610:ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 16:17:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:35 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:34 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 05/16] x86/bugs: Remove md_clear_*_mitigation()
Date: Fri, 18 Apr 2025 11:17:10 -0500
Message-ID: <20250418161721.1855190-6-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 0279a457-455e-476e-ca53-08dd7e9487da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b/x8p/JHHwH8Q3xdLTi56SY7SrXxh4RMVP9XcOxOMmZcZOFhoH0wY8noIEcU?=
 =?us-ascii?Q?6n1Srgqe4cnDn0IzDhxpDWmTQ95lCWybeXgKgTj9BGXx77RFlevdexHtjg6F?=
 =?us-ascii?Q?mxwhUuxNmVkLT1fPjDt9indIPqsldKlsg14hFamhV3W18diUKC2kVQNMxhVA?=
 =?us-ascii?Q?sQdAyaCW4B5n5oNldtkMVy8s3BnaIAlQmAtTCMtb0l6oVLSXpBKXed+ObJCc?=
 =?us-ascii?Q?VtsEQDsLKacVuX/gBltMkKl6/XVPSm1RwELklRuhNKOE2dQ2wdBnv4iy/OJj?=
 =?us-ascii?Q?V/CmX43SjYNyv9GhXXCQ21jJWb1vWWSSk1kfOf2SXcScNPTFITPoTnpNZ0H6?=
 =?us-ascii?Q?Er2XP7V4tUw/OXdb+ak7Xhdn3pFHToeBzrZemWFG4uXDSLDNEJG1FCDXxYEf?=
 =?us-ascii?Q?5b6kHEXRLsQa8cpTIGPN8l+P5kpEBGR/qB24cCvH5tpkNN1a+uFCZlfuBGhT?=
 =?us-ascii?Q?lHek5xNRd1RPuVxe9J/qhGB3HjQjEiiQOFWliCV02zo/n0nGZW2KALTRGBLI?=
 =?us-ascii?Q?p9qhjqlsC3Ei5u1fCKh1jPGcJPW9hqBLnnljuDN2uNGr+H+n6P3+3Jn/Wbsn?=
 =?us-ascii?Q?nHRvJ8VbulB1kbjDrUfh3ENsFRaYsN/wHMukeoQGjYyc/OZcQVg7g2wBieUZ?=
 =?us-ascii?Q?VO8JhKp1NFLFHNnmM+QaGrXqa1rfC7Vy8uJFi130gDgQUoUsiA7Su19JtV58?=
 =?us-ascii?Q?ptU8j/OqsG+wvnLl3gpv5nt0eezRKQ8r0e6IRvQdaO1VDzg7IbH0ZPYZcFL3?=
 =?us-ascii?Q?cb/2UxFN1bdrFBDsfapk8RFqmXZP695JM8N/1UTizCUBRd9C3aRcFANz1dd3?=
 =?us-ascii?Q?WjLc73QRAbyAdi7QTjYLInn3yVt000tx+vt6AF/OpNnZFDHaKGhmqJlY45eR?=
 =?us-ascii?Q?3RkppTiHjZatm1stS5XIrubuRBMGdXnNvVk5yPVYqZhyi0aFhcEvbXXYal5I?=
 =?us-ascii?Q?Dg8aVIUfNOtGa4VdAJdouknfPr/uwlIO+UeOf8ys/3fOzMVXlkateH55FlK0?=
 =?us-ascii?Q?O2097szMQtUp5GlpdMiMvek+x8odIicsr3Gk1cokHStsgCaNSAqyptG/j13D?=
 =?us-ascii?Q?lCcz/jXrEzdh8ryuIsgiDIY77Ogy6oE5woSvq2v7uztdIvI/Wlnk3/2xRIGm?=
 =?us-ascii?Q?qibLx/cQDOAvQYP1XwlcfxTBYapdWbHzaNz5xhAs82qkE33jRy0QIx0plWGs?=
 =?us-ascii?Q?sceBq7mCC0Gk+zyIjVDFOBu8HhAsO7N8RWUrNPdOiIqHF0fW5S9Put/04fRQ?=
 =?us-ascii?Q?KnztMwr2WvDy56bCEDx/+pN3Rvjjb49H/elzUvsSLfVo26Im7/q7mNy5Ldht?=
 =?us-ascii?Q?0Pey0u9rLGjIQc8MoXMS3FiZj6e8bnZQQ9Mpy+RJ+qlc7wfB62lsIjVr18aN?=
 =?us-ascii?Q?KAE1SBF7eG7/zw/SXf1qJWwxGx4qbDdLJk0LbVWiJVtMwY3/xGhtXNMzB43g?=
 =?us-ascii?Q?wF+H7XOHAVaNlvXtv3KlNVzujwL+TEeEqHVTPk8kaivYLlyaw8ra513sAS4N?=
 =?us-ascii?Q?NH6SP2VVnE5aAq417mL2kcUoRStNnqfXcgZ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:35.5160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0279a457-455e-476e-ca53-08dd7e9487da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736

The functionality in md_clear_update_mitigation() and
md_clear_select_mitigation() is now integrated into the select/update
functions for the MDS, TAA, MMIO, and RFDS vulnerabilities.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 63 --------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 303718689aac..ae6619416ce1 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -62,8 +62,6 @@ static void __init l1tf_select_mitigation(void);
 static void __init mds_select_mitigation(void);
 static void __init mds_update_mitigation(void);
 static void __init mds_apply_mitigation(void);
-static void __init md_clear_update_mitigation(void);
-static void __init md_clear_select_mitigation(void);
 static void __init taa_select_mitigation(void);
 static void __init taa_update_mitigation(void);
 static void __init taa_apply_mitigation(void);
@@ -204,7 +202,6 @@ void __init cpu_select_mitigations(void)
 	taa_select_mitigation();
 	mmio_select_mitigation();
 	rfds_select_mitigation();
-	md_clear_select_mitigation();
 	srbds_select_mitigation();
 	l1d_flush_select_mitigation();
 
@@ -687,66 +684,6 @@ static __init int rfds_parse_cmdline(char *str)
 }
 early_param("reg_file_data_sampling", rfds_parse_cmdline);
 
-#undef pr_fmt
-#define pr_fmt(fmt)     "" fmt
-
-static void __init md_clear_update_mitigation(void)
-{
-	if (cpu_mitigations_off())
-		return;
-
-	if (!boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
-		goto out;
-
-	/*
-	 * X86_FEATURE_CLEAR_CPU_BUF is now enabled. Update MDS, TAA and MMIO
-	 * Stale Data mitigation, if necessary.
-	 */
-	if (mds_mitigation == MDS_MITIGATION_OFF &&
-	    boot_cpu_has_bug(X86_BUG_MDS)) {
-		mds_mitigation = MDS_MITIGATION_FULL;
-		mds_select_mitigation();
-	}
-	if (taa_mitigation == TAA_MITIGATION_OFF &&
-	    boot_cpu_has_bug(X86_BUG_TAA)) {
-		taa_mitigation = TAA_MITIGATION_VERW;
-		taa_select_mitigation();
-	}
-	/*
-	 * MMIO_MITIGATION_OFF is not checked here so that cpu_buf_vm_clear
-	 * gets updated correctly as per X86_FEATURE_CLEAR_CPU_BUF state.
-	 */
-	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA)) {
-		mmio_mitigation = MMIO_MITIGATION_VERW;
-		mmio_select_mitigation();
-	}
-	if (rfds_mitigation == RFDS_MITIGATION_OFF &&
-	    boot_cpu_has_bug(X86_BUG_RFDS)) {
-		rfds_mitigation = RFDS_MITIGATION_VERW;
-		rfds_select_mitigation();
-	}
-out:
-	if (boot_cpu_has_bug(X86_BUG_MDS))
-		pr_info("MDS: %s\n", mds_strings[mds_mitigation]);
-	if (boot_cpu_has_bug(X86_BUG_TAA))
-		pr_info("TAA: %s\n", taa_strings[taa_mitigation]);
-	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA))
-		pr_info("MMIO Stale Data: %s\n", mmio_strings[mmio_mitigation]);
-	if (boot_cpu_has_bug(X86_BUG_RFDS))
-		pr_info("Register File Data Sampling: %s\n", rfds_strings[rfds_mitigation]);
-}
-
-static void __init md_clear_select_mitigation(void)
-{
-
-	/*
-	 * As these mitigations are inter-related and rely on VERW instruction
-	 * to clear the microarchitural buffers, update and print their status
-	 * after mitigation selection is done for each of these vulnerabilities.
-	 */
-	md_clear_update_mitigation();
-}
-
 #undef pr_fmt
 #define pr_fmt(fmt)	"SRBDS: " fmt
 
-- 
2.34.1

