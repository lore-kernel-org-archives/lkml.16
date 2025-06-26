Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B433189F56
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948041; cv=fail; b=KQMUlnJKT0P+vfpwa3CL7tlu4gVuRW6HrBXa87CJ40XHb8vgQk8jdatM/5eXTgfkQ0hG2QWKMpxoLoAcqOToBbG3aU79b5LURVpJIMzicCbG7UGiKtI3hnPwIdXeJX1vjaAObGD7ItXGlGnyjVjJOrpxqO7Ld62hTHv26IMy4tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948041; c=relaxed/simple;
	bh=x01CJgRo6S3p0PENkIld/UIma5wK4a9GGpHTvdWd9vY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TV5LbDSQbjI13TE1y5j26+BFLMOqC+YcJ4sDVVtuyElU2fMegAghrtgFHdo2r8/Pjl0gB1MZGXag+xD/hHzjlGl4T8DHZ0QWsjV7okSqtTFl4o/w7vcyeS4n27HzworlF6CpXvFpuK2sM0k6dXuBbU3hQuZpszzZR5Id4R5RH2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hUVXvBen; arc=fail smtp.client-ip=40.107.93.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hUVXvBen"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJ2uLorcDdTlThhqrDxcg2Gzkyj27dmZPj+Xiog3ImVBVlq2RZ5sW629tTJ7dd0wOHzmVGiSkT5bRWAuONibfrM9u8mUWRWWYaLWKNTJZT/KwUQ16pic4O/UHp9vLPJRyQdKfjaPRHf6DgW9oSpKZDxMxaPPQ2UOEe9l3T7vsmf99O+QzPe8BxLjbULAzPshJqLtEb6TqSVvt7WnOJN8DK5gCj7qZop7LrKdPvE+sIT0/Fypcf4bsJhF18xIIY2xbNJiVMOqSnN+HUnUZfJi9/roEP0ZpkMQ5Kf9wBzTyhL3mG+Uqv64s4sp2yYJ86TMbklJdHaKR6usnJCJwYKbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Z3OiRvHJxDq9cRmJkIvyBeqeJsPOM7dtqDzEPdbyQ=;
 b=y7U6AsnIyS3tTSwKqRiVGOPkwzR1rmfAiPhYScYJAgAimNPjh/YIZ0lYJIdVl2GxOnoEEdR3ZbLZ1JwMk9cTprHEbO5mW/gYfK8GIHkvmp3nNG8XYHXln2TKW7f233A8RL9Nx4R/hjJaR08LEFUQ/xAQjyGk2+xC1iIGsvGOl6O+hrHTdmVzHv2QtEpocPOthvJ5AcVQ5kQBovr5GQHwdw4Nq5DI0dpshSr9cFO6BiRYZzgMTuL359EZsaPjW1uL3YrB6KhW1eBDViiR5uQq0yfoTiV6eXi804a8jszT5kNPFBSJIxZ3ABfoQMLWoCAWj0Is1hCGFSE7SZlzb9Wb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Z3OiRvHJxDq9cRmJkIvyBeqeJsPOM7dtqDzEPdbyQ=;
 b=hUVXvBenDfYKLX0lx4wEnM1YsYL7jCS01VpUD8O7irTbtrHPLg1h0/nP7EGfqhOjfZQ6dBeD/jVLap6V+AWqE6ABQ7DCCtLgH+Fohe9RHmOVCi+wmLcbHRdTf4DBAlu+Z+BDvUJSMAlAcvTPGFJZYer5+zqEc/J8jmaoYAuKBMs=
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.35; Thu, 26 Jun
 2025 14:27:16 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::f3) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 14:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 14:27:15 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 09:27:14 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] x86/bugs: Remove 'force' options for retbleed/ITS
Date: Thu, 26 Jun 2025 09:27:03 -0500
Message-ID: <20250626142703.716997-1-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH7PR12MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e08c97-0056-4d24-1de4-08ddb4bd8cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/We5TIvmYVWFLUYEfnWWF69plfuo8bNRqNZXmnYy0Uomxo0ZOX7ZMmmgiOPY?=
 =?us-ascii?Q?ms4jDfDHfl1jhhErgCcm7PxgW4GG+dSiABuSrcInxRANO2YZb+kqS2cHE5HX?=
 =?us-ascii?Q?E4xPqTHXRoWAYo8f3TeYtESXVXBDwM6m1hnHsguH4Bz+VyXiwwc2qbD6g/G0?=
 =?us-ascii?Q?inxOfaDrthAwxb23wYgU5PzoMF+T2P7B+r/KKfcBBUr6JduyFOb7m7YbMCU4?=
 =?us-ascii?Q?9B3N1QuX+IhKLDIgWgKVmFnhNjL9womAENdmv6KUrGS5ikolhFXOYjxjgGnY?=
 =?us-ascii?Q?x7K6RmWOaI+Dk91trNJ6Fpd9I2xAdQzElEj6xPzAzZzwLaZ2vLg0BzjWl4Rv?=
 =?us-ascii?Q?UX4fY2Jg8uIwM7pirf8VsphHiG41nKmQ4PIRYXKbEqISm6mxywVZojj87rzM?=
 =?us-ascii?Q?ffukRosAJ3FqANXFoiCvVp4nFtU/eiYnIV3TTzImMnEop6B0+0kLGPICFa7r?=
 =?us-ascii?Q?lxi9L7qwJN/CbtL2kP59AmUNNnsohguFu7wUaLpWXyNNfRwM98NXPQT1reds?=
 =?us-ascii?Q?v/RBFISN4RxfN2f/gdHtKTbHSzy2hLnaPN8V90p2EFo3/iVOxioJ49AXJo8h?=
 =?us-ascii?Q?Jz/gQRF9W0xQnHS0MdET+tdWm3T3cF/v4kNT402oZRUgzBtpUIhrsSn2HT7q?=
 =?us-ascii?Q?8/MbbHveV74J5S8Tdm12qvC7r7qAbVjLvKYBf12wNcgV/LFFbD9WqU8cB49x?=
 =?us-ascii?Q?SlxwhDqDSAbTWXlChW+AhCcsJVN4RSmBNi/sZxHIQAs3p/yQwl/+yRELmnf+?=
 =?us-ascii?Q?ym00i+WL+FtGM/MSw5Mbjjf+9hziSkPGML8bStLaZtqE40q/D0Rj/iEkSvXZ?=
 =?us-ascii?Q?/Yei3tgKVjF5H2571/fXLCBJGLQ0/kwSta+iSGkXJn6AYu64WSn4KftIJ1rc?=
 =?us-ascii?Q?PuMJ3IFuvwPNYUvAJSvt0JjM/KH+5uyBPkED7MMS2fRGYV/U9tyECsF9Bu4j?=
 =?us-ascii?Q?MlraAJSgB1NuwtbVEOHS3McIk7Ku/pkBnUjl51yZXZ7xggr/vYqGOYGoAcBi?=
 =?us-ascii?Q?WxSZXk1B41EXAzZV6lhgd+z/EGKuOR/n+q/97IC3K8ykbEzQJGoZ7dwoRgu9?=
 =?us-ascii?Q?PPemmurhsTczfkSKFsU8tnUYUAt+9ORpRYBdZoiWhtmdDIzOItrjs5awPUAQ?=
 =?us-ascii?Q?0fj/FtmVen4RMJMe+Uidlg9U/qlLznkhAEVrMnZbRbMOD11AGJD5Wi4xQMY8?=
 =?us-ascii?Q?Ob4Vo1188AkcV3XqHv8+Y3ftew7Th6Q3K755Gx4roREcMpne+p1heQiX1rHB?=
 =?us-ascii?Q?903EjzgoUjlrPur8QsNxdVRPlpIuWpVCxEEaMlxH6JqoK4lNAGxr+I9VK3eL?=
 =?us-ascii?Q?9MDNTM3eiW25gSqngOijjylIqp8yiZocNDIMBqm4C7Jr4mRhcO8A5/v/Jw+S?=
 =?us-ascii?Q?8FGGILUUixsD6QNifmEBtvxxt600S/G9p2LL2mIXTVqPzFUyVvvwjQNRgREV?=
 =?us-ascii?Q?WB2SWo/d3CymKDd3r03678Y0n1fdFhJYPtv7xzRA7ZeKtpBkSfgjSAzPGyim?=
 =?us-ascii?Q?r0d2ozclpCslQ1pAqvemYcYYhqChMcEG3Nj+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:27:15.8485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e08c97-0056-4d24-1de4-08ddb4bd8cb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793

Command line options which force-enable a mitigation on an unaffected
processor provide arguably no security value but do create the potential
for problems due to the increased set of mitigation interactions.

For example, setting "indirect_target_selection=force" on an AMD
Retbleed-affected CPU (e.g., Zen2) results in a configuration where the
kernel reports that both ITS and Retbleed are mitigated, but Retbleed is
not in fact mitigated.  In this configuration, untraining of the retbleed
return thunk is enabled but the its_return_thunk is active, rendering the
untraining ineffective.

It is wrong for the kernel to report that a bug is mitigated when it is
not.  While this specific interaction could be directly fixed, the ability
to force-enable these bugs creates unneeded complexity, so remove it.

If removing these options entirely is unacceptable, perhaps for
compatibility reasons, another option could be to only allow forcing on the
affected vendor (i.e., only allow forcing ITS on Intel CPUs), which would
at least limit the potential interactions that need to be analyzed.
Tagging as RFC to prompt discussion on this point.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e2a8a21efb10..edc913d26381 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1210,8 +1210,6 @@ static int __init retbleed_parse_cmdline(char *str)
 			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 		} else if (!strcmp(str, "nosmt")) {
 			retbleed_nosmt = true;
-		} else if (!strcmp(str, "force")) {
-			setup_force_cpu_bug(X86_BUG_RETBLEED);
 		} else {
 			pr_err("Ignoring unknown retbleed option (%s).", str);
 		}
@@ -1411,9 +1409,6 @@ static int __init its_parse_cmdline(char *str)
 		its_mitigation = ITS_MITIGATION_OFF;
 	} else if (!strcmp(str, "on")) {
 		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
-	} else if (!strcmp(str, "force")) {
-		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
-		setup_force_cpu_bug(X86_BUG_ITS);
 	} else if (!strcmp(str, "vmexit")) {
 		its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
 	} else if (!strcmp(str, "stuff")) {

base-commit: e51a38e71974982abb3f2f16141763a1511f7a3f
-- 
2.34.1

