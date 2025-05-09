Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D742367DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808137; cv=fail; b=fJ8cOLyS7WkhfjvfqMtWLTa2x3FyhOQzLowBFa2I1/1AvBg+qPgxwFUGDGThxES+F06uYcYmgRUgmUNvy3I6ictmcmA2RN2g/CZhEpdqsq+wiB/FyG1GYKfCTuuOE9osZyxDjf8qSMOIZZsqRIP0tzbV5p12S13f6PHjZPr99J0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808137; c=relaxed/simple;
	bh=sES+mICdg8aZ4Ab1ft3OOrg9QBVBojGezKIEpdOTvZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhJWQgO1vHdACt9UEfdZbq23XPgy460R4vkRTdX7XT+QVVuvWrRC6cV90w9p5nAj+3RELzCBHJPjSl6g9oQ7IqWjywOPI3fRjvdfyWAQpya7IvU6pIhws514cqWuq/kMtGhiGGiWCdiirYRBFbXFIgDEcAq+ymysMc1VJvycLzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sYXeIzrn; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sYXeIzrn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dfmdoz3v+JMIbg7g5SAfiYq+cReONmGvVEYtYzcXQsP73AJFGeTBaYiZzUiDYtCEieN/fMeDX3RBpjCUGa8fqLge1LoRGmlf41v5Bqi6jGF3ZM+A7vFlICqmNGT47QYafzt9fMyB5UVmp1+LRrEOKPM4BNOaPJadr2/3At6LfxcyHbGoFURz9cqApFRnvi57lr0UyN8Hx/d1IGBf2eP8ct5lzoh2QjBDSHIY+Uhb65PkPxemb9DLonnu6gIi44ogLu6jO3KwDL3uDsmITUoOsxuuCdSpTCZATJ6jvWKUwvnkulFjHYaM80j0eLaG3pW7Zic5l/M8iFnA7emS7wXyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeMv565h5S+fFGgfHUsh+qQ0mpyPWuI5ZFspel/sS6Y=;
 b=Yfvl+gKRATWmx2qkuK2egdLIHM0eQOeHEqec2VqoaEQozUyxZ7bl5VQKTFBuK9w3pQsn5AqhyYCx5PGBMs7M/dnM8aKRm012Njbcw4pCvuvAWN8zC+pq6idtNEkxdmBRXbOZ1eEN1dKVdZWJuLl9xaNfdsBS8nXjvf0wsZR4zls2CK6wxQpBhJR+JK04Pcrqf/iQU9s7XtMzKnaU6f+QYq0TEvopwX+sFzXxdXIpJtKcsYdi+mv5vOKVG1RTGL6sZt+nh2xXwlXXBfDhIFH5d0GMEJz+H2lWYZO+0Hu5uhG1g/kbZ3uKDPKxKTwQZNsQ2jZvHOjhWfjdbCwEW9uecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeMv565h5S+fFGgfHUsh+qQ0mpyPWuI5ZFspel/sS6Y=;
 b=sYXeIzrn3E1zl341Ntqdqrq3QRtgVIGZltEKOj9j/w5hzqJqIK4Tsa4M95ZWe7LYoJoWEQgGd6cOPIrJepWEOoGinxlCGKwwywlm1wLJI199nKK5fKKaMLS76lqNT3VJIQAmvhJJ1QZCW99wyIAwz+QG3F1Gy6mxBimESjHBf+M=
Received: from BL1PR13CA0114.namprd13.prod.outlook.com (2603:10b6:208:2b9::29)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 16:28:53 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::39) by BL1PR13CA0114.outlook.office365.com
 (2603:10b6:208:2b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 16:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:53 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:52 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 05/20] x86/bugs: Add attack vector controls for MDS
Date: Fri, 9 May 2025 11:28:24 -0500
Message-ID: <20250509162839.3057217-6-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e84c552-db70-410d-3e33-08dd8f169651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wgqIF1sHCXrs9JSlWpBMv8MWAEWozzw8o1OiwHXBMnmtqUgjRBiS9XAqg7g9?=
 =?us-ascii?Q?FBX5SHeSUimdUQ2qR7Q4FR8g1nXdDQ25/gJOgV+Hw+VIWcN/LlKa2xc/8iKU?=
 =?us-ascii?Q?gUA8asxkom7cBu3myQS7dEJdIp3CyI/YqGA1R4S5EEo3mBUpsKseIhF1mnJE?=
 =?us-ascii?Q?kMFXs2PuOnhArIx3+PsJGAy+g7vgzI+aMd6Ll59NbEn9S/DAhy4TNHs8WXTJ?=
 =?us-ascii?Q?yvJcP86v+EP/P1WWLinhsxg1XQzmGC3wnosvLGYnIB0Pj/4ibZ8NrVH+NqCK?=
 =?us-ascii?Q?GdXs3wKvFCLbNLPxnssSM1/Fi11NrBl9xysw+Zw2SFOP5y5suTDw2brFAEHU?=
 =?us-ascii?Q?Y6FIcxe4nBazyM4rBk08mgCDS5BJg/ZFoywraqMH//veFDluxV7hnq0SQBzM?=
 =?us-ascii?Q?ICdVab+MoUNhOpjAcgdsAp/S2p/NZ8fW4WIZHl4Bywaguc3w/NzpCAY0RuoR?=
 =?us-ascii?Q?MNj5emhL95UEx6xs6pSylbCZ0Ua37BJSjHfbe3m/auJAvh+/45VFKlp/rhyG?=
 =?us-ascii?Q?BgvllNzMNHIG0sdQ+ygzmVH2oyTF3349klIIEbgoWnaKyKwkGmdJb7kWP3HK?=
 =?us-ascii?Q?+drKxdUyAScYAaNe6bovzWgU8x4lAnuGhB7KVtewwAi173otzzMc1KOw2Od+?=
 =?us-ascii?Q?ymBeoM2RvkDqZ4ysJRML0uurDkBL5se/DlteGArTvOd0Jbg96twNvKYI/Hs+?=
 =?us-ascii?Q?SfHX4k00M9Ix9vdcyF95HL9bpg9yL8FYXZegxZaD5iAdAQUnZ0R85Wk6e0gD?=
 =?us-ascii?Q?v5o/ctbyk47U7zgZHQbDzoLwmBxSahOunb4EBgrETv/jMzY0ht/LSnrtjEmK?=
 =?us-ascii?Q?/sg8VwuWcmhffwCtkSWyUzD62zVpv9h3Dm32wAEeS3/Ct+nlIXGMyAvgrsjO?=
 =?us-ascii?Q?jZHSBcq6QU6T7a+kn4wdA+Fh7kWTjPynOto0rTswo9K3ZmEWKJHocGsilEGQ?=
 =?us-ascii?Q?No+SStDHXcEy0tccZRlshR4eSmX29N5OMSQEVufvj93hEnXKuYHjQRDyuCM6?=
 =?us-ascii?Q?Voe4m0azLu4z7MVfYYr744RQU1u/PJafruQe8JIjNTNB3zTUaDRm2CN2A+ZE?=
 =?us-ascii?Q?34UQtwrDQsC/SKG7M2oXLo3f60ImAUfRWdwPpiQpUMfGqFfPBnPC/GIo2YHl?=
 =?us-ascii?Q?ciIUM9tofaWPYYRCCVlrKFyqsvLRMt1rkQyJ6DJwZkBLD/NlgwmG5tYk26DA?=
 =?us-ascii?Q?6IZbwd7wcYGLTZhyC1zcbst4V+TNlmDpyayZw/zxScEfoitCZSH0Uu53T+ZT?=
 =?us-ascii?Q?f5z5LQsfX8pXcP8DJEZsitF8EOCW1YqVTSwmPFPIRgN+27Wo0A/Dd4vMNZtb?=
 =?us-ascii?Q?SyR9o83J7QcF2fe3e98tZVYLzL+8Ajqf1FirRW80NJOanexBe32DmHkxjWf9?=
 =?us-ascii?Q?pcvPfmxl1FrRmoVzEc14zaBVprSUci3cc0kU6CwHvyadxghs6BCmm/9X5uoJ?=
 =?us-ascii?Q?ZclUgz2IY5/vrPJnC5PToYA1yudDArxoy+w4EqABE9NopGX6WMFZZ1VvqbcP?=
 =?us-ascii?Q?T6b138S3l5810WYgpaufl2yNNXWJQ7R0hNgF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:53.0010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e84c552-db70-410d-3e33-08dd8f169651
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

Use attack vector controls to determine if MDS mitigation is required.
The global mitigations=off command now simply disables all attack vectors
so explicit checking of mitigations=off is no longer needed.

If cross-thread attack mitigations are required, disable SMT.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 3dce7c3126ea..97d152c33e9e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -419,13 +419,17 @@ static bool verw_clear_cpu_buf_mitigation_selected __ro_after_init;
 
 static void __init mds_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_MDS)) {
 		mds_mitigation = MDS_MITIGATION_OFF;
 		return;
 	}
 
-	if (mds_mitigation == MDS_MITIGATION_AUTO)
-		mds_mitigation = MDS_MITIGATION_FULL;
+	if (mds_mitigation == MDS_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_MDS))
+			mds_mitigation = MDS_MITIGATION_FULL;
+		else
+			mds_mitigation = MDS_MITIGATION_OFF;
+	}
 
 	if (mds_mitigation == MDS_MITIGATION_OFF)
 		return;
@@ -435,7 +439,7 @@ static void __init mds_select_mitigation(void)
 
 static void __init mds_update_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_MDS))
 		return;
 
 	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
@@ -456,7 +460,7 @@ static void __init mds_apply_mitigation(void)
 	    mds_mitigation == MDS_MITIGATION_VMWERV) {
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 		if (!boot_cpu_has(X86_BUG_MSBDS_ONLY) &&
-		    (mds_nosmt || cpu_mitigations_auto_nosmt()))
+		    (mds_nosmt || smt_mitigations == SMT_MITIGATIONS_ON))
 			cpu_smt_disable(false);
 	}
 }
-- 
2.34.1

