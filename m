Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80317239E68
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808142; cv=fail; b=R3sF9YcrUsx3IvV4e2z99ZHz9NN5l6NM3EWqLfIUWHGu+flYdjZWAlPSrlMdh16nGAe5WD9WhXPjkAj3qF+R5Yz3TAciOznLMRasHz68twLrLtJx/+gco3mfgAZu+BGYUGJElrKbu6BqtlGmE5GkekGyppAefnD5yCAMbx3DzSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808142; c=relaxed/simple;
	bh=UM6+eSwky4uuxo2n8e14DprIoTq6DcT21BBbKbDf6d0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi0r/JhGPwl+GvUDLepCSZFUUOYwm00+zR4Hb+6bcd6Y1vzJ9JhfULjT71QwnlOSXcI0cjJkCjgwInpO9rHIEsuHEYEd9Qlyw6Fy7TdxV4q4uYLb0bD3u73uJMa+AS48iWghQajrJlR38nDXZ8Xd5iBQ7HfgoDYkUtlV7WAILFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dcgf7mKy; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dcgf7mKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuE6wjjE0tAl7rCMOJoyZ671mGFt9A9Dx3pVg4JZHgfxKWIvSlttShzZs8Sj7sBCyCr3PVnuFKyua0xETY3kekenOLEeW5U5kHaNSHGVMFankgnrZNvwF9Ceurl5buCNHZXMXkc3ASVQo15Wv0zNd2PFoPsa377HO713KWmzrbZeJUXEPHEyDC42KxVULIoRH9cie7LlTVqaWjvM49g5WseHstrHA8fU8EPADGewg1CRRd7YHz1MwFvAviBqoiR9zLzdJydPSKP4H+QfyQ4gM4dsA6yioYeNL9ipdbxL2oLMnRyidVNzrUcOlqR+bbRfm1xx8y2jDCf4l6MgwcTJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPCpZc8jhwG27BgMBG3OQXj0PJKi9+UEi57oM8fiios=;
 b=b34FGY8Aryc8P5ca5GiCPutBlwV3fdXJ+tjOCNEIs5AVfacqEi7TigigqEJp5wfD8fAysWbm6SbM8cx0smywupkE6eFB/fInhm0GHGJ0OGgBdOSwv0I4reCAvv2KpxLnacge5Q8WM/7uA7XfIgcqqdON9hPgBVFdG51FXjV9sfBCA3INd0Ef7jCxhqrsboZ9vKOLBTr1/NvhTal+odl4U3ofnMAOjPcUxfsrRDdxCkyvuEaeE9P8GhMfoI7zs26R/pSfL/CB32N+u4k3GbNxWBTXwNynaCBXYAMIfVbnBOi3uewyRpsslRaoveHWqf/oBkBtcVr8zSpcj6AIe25b/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPCpZc8jhwG27BgMBG3OQXj0PJKi9+UEi57oM8fiios=;
 b=dcgf7mKyGuiuxKdVmqKAlnjdUUSjDbEmhcnMfN8oM4eJ2xpCBWpmoQElxXlnwoOJdsbQ9XE6sD5HwPfnMZDKfbHRiF46obHQkPYI4YMtGzf/IXBPEWXBCOm1aKo/IIfafvgoND/thWPvQPl93b/okHkmvoWxrjDJW6hJ/uV6Lpw=
Received: from BL1PR13CA0118.namprd13.prod.outlook.com (2603:10b6:208:2b9::33)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:28:57 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::b9) by BL1PR13CA0118.outlook.office365.com
 (2603:10b6:208:2b9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:57 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:53 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/20] x86/bugs: Add attack vector controls for RFDS
Date: Fri, 9 May 2025 11:28:27 -0500
Message-ID: <20250509162839.3057217-9-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 348d04da-fb93-4dc6-ceae-08dd8f1698bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TkruyHYllgM2HqGxWadKKfZ+UrEj4KLEuIcW1Y7/jjyfww9sYac2jkzueKVB?=
 =?us-ascii?Q?c1PQhsUIPlnYHSOSUieiaQD7rEl3lq94nqVbR4gohA+GT+9eVZRbU60v4AeB?=
 =?us-ascii?Q?jng+Jbe+EAGZ4SL4srB8rletz+7z1BQHnFEF0GihP5Nfv97uVlEh5u+NY091?=
 =?us-ascii?Q?kO/YS29orghUk/ff85AhtodjSenEVJutJodZsDoHWrNclF+x8WrgragrRmTC?=
 =?us-ascii?Q?7+vKPRz9fttjenzZx3r0I9MtVdzXhskuIOT56RZ9PhVKKI2qBnIgm61PXn0M?=
 =?us-ascii?Q?DfiN8Z1zck3pmSoyBYWhAzVSgrMiHuOaPS7Z8WsIrvhmU7dWaePqwbxR5b2F?=
 =?us-ascii?Q?AjHe5bB91FMJTjqKSOED936iKG8EnWPFjmfXDWp77MrxZON38Zu3ymKLjQVB?=
 =?us-ascii?Q?9eZjmF4ggpjgN5CIxoNHA+c8sfhoCp4l+T0BciLfOpVdRos4riwvE/rkYVqQ?=
 =?us-ascii?Q?N/S1wsI7jvWO9NvqGLwXpf6dyc/MN7jC6VcB1IOc1fhnwB9lQw2QIDyqBP/5?=
 =?us-ascii?Q?KHOrRiRrCtRRapBKqsC89ARAh+jUIICdKF8ANMQFGLbqUfLK/ldt0rLiwnI/?=
 =?us-ascii?Q?mXU8QLsvAALT+VqvIu9UNlWtfAg+xp9bWkPg4/59MyZYaMjjWLwNbPZ23bAM?=
 =?us-ascii?Q?T0ApM2ebm57bGhvdvKEZ47HHk2Hs6nfVltm6oA31yvBlb1YB9JHWnu889t/W?=
 =?us-ascii?Q?3182W1A2PO+WfIqDKgtfW3Cw3yrt/nlsY+BHEKpIpr9btztC51umv/oC/V1x?=
 =?us-ascii?Q?XCbWmHn2eZfNXztutUqNn25zUHAZCsWU3Xh/CAADRseT69xn+t/fOr5fTjah?=
 =?us-ascii?Q?9/CPzSGc4+EZs4g+k/8bD3d8ZM6z5QfF+VQ/h3i4GwUL1Lf7az2TIpyF15zS?=
 =?us-ascii?Q?yJ0r32PoESMfhoJxnD0HOaPjYxZF+6RKwYPF3CB6xoFM2FqJI2EaWH7qmcpx?=
 =?us-ascii?Q?//Slph9hWnME8vQ1ZD9JthaG5jLZCBSO7TKf0yJMzSkgBEqe8rrpxuIQJsEe?=
 =?us-ascii?Q?yx/pREiMXWhOWm0qNf8htrP7v52QxayftJ3ji4ortcYaaVYMGdLS0e1Ku2dq?=
 =?us-ascii?Q?HMDwkpJLip7tjX2y8XUAq2TYkZHkKFe5eJR0sTKphgMgSR3jTPRqHceBfSp9?=
 =?us-ascii?Q?KHp83FTiq1hkTihOJpSkRmzQwCdPp2WAJ/BDZb5capk8+IHm54tvWz7Bla+b?=
 =?us-ascii?Q?EIFK2sKJubpFy8aJcMYvPWmzJk3D7NOr0bS4wzNBt5z5ZPngglQhUKLkvrw7?=
 =?us-ascii?Q?MVMQ/6h6TXqQsCqd5JhvOUb1nBzojuEWaxAV1xo3o0nIX0CUmY2xe8gzfjX3?=
 =?us-ascii?Q?Y9RdTtcvn147bjnaosmidipxWWormSJpR1nlcMZ7l+I7cuqiNyT3278RrSzV?=
 =?us-ascii?Q?A+DF2t1wVbaRn9vHsiSd+3OYg1s1E8aNw4BpKyKUavp7JM4vVdtrMtJqVM0Q?=
 =?us-ascii?Q?NPzuhv80u3FQZpjr8YAvFZYe8RlFfnAatip/8TK7QuqBEPYWGIE23obTBjKN?=
 =?us-ascii?Q?do70bYYvNJBuLdabRejY1bqlEy8KURy3zxX0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:57.0641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d04da-fb93-4dc6-ceae-08dd8f1698bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017

Use attack vector controls to determine if RFDS mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index bb5d58abaab6..e807176bc845 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -726,13 +726,17 @@ static inline bool __init verw_clears_cpu_reg_file(void)
 
 static void __init rfds_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_RFDS) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_RFDS)) {
 		rfds_mitigation = RFDS_MITIGATION_OFF;
 		return;
 	}
 
-	if (rfds_mitigation == RFDS_MITIGATION_AUTO)
-		rfds_mitigation = RFDS_MITIGATION_VERW;
+	if (rfds_mitigation == RFDS_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_RFDS))
+			rfds_mitigation = RFDS_MITIGATION_VERW;
+		else
+			rfds_mitigation = RFDS_MITIGATION_OFF;
+	}
 
 	if (rfds_mitigation == RFDS_MITIGATION_OFF)
 		return;
@@ -743,7 +747,7 @@ static void __init rfds_select_mitigation(void)
 
 static void __init rfds_update_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_RFDS) || cpu_mitigations_off())
+	if (!boot_cpu_has_bug(X86_BUG_RFDS))
 		return;
 
 	if (verw_clear_cpu_buf_mitigation_selected)
-- 
2.34.1

