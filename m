Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9002716F8E5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713427; cv=fail; b=hHu9jsjor2wV3vs4at0LOVoHVqfUxD3jToM7wTSlES+7xZHRvS0aRzPCAYMIQk1c9xripzW3rihJLZnkvMPVmqRq2hFWrYYGbXxwp0I6IlQzSpq5PxifOerRj+QADq9llVJD2BMvbDAb63zxCbSpMNvBayyrJiMcYymCDFgeLvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713427; c=relaxed/simple;
	bh=Lwb8YJQFGmAo8yf/fLYQ+7alksf66AfkhBXO2mj/m/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hq80kc1MyksQ3CazlWrs1YobwQHCZpYfnykOb62/kfccmQuFB8kc0WZoVE62lF0y/PTOaCNP+RhX2plCRMv95f9BllVvtvBbuqiHWCxoqVDsk8RJuGoB4sl4HXP8Ve9mv37Hod+kuZOu/sxg1+O4QCQNgdUhpEBREoBYpHDu/dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BPq+j2gT; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BPq+j2gT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrnvuB/ydpVoyOoclu0F6rBcOmeyuO4gZ5ZM3C4Z/5NbAfOBgPm1uPXHmgnj2aLa6NpWF8+ZDH9257gOtGP7oO5GBnK/AuMtcd2HLA9DrH6dxjdc7kbo4WErehnZMzbk8QbSUCK1+lN2/5faWOWUEILYf+QpYLiGOZ7OLqb1FA2cIzTbQX6v8chZVu4+HTdBtj5veyEz4oAaVXoPuNJ+iR8eSHT9iU9TrlFUecaj4NhXai598ltIEEbAyKC1NCxpEB0FyD2Inwg2VRJxZJHXd7iA6KaulmKPjwbQ/RvcqqFU1ladWpgfCKeQQPNpq2WR8YK4LRgM2RQFrc39t71RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUDRWP/73b354Wn8kBNEEBvod6CR7ma4Yu2kv78Tzgc=;
 b=CTQHH9KuAZLypI+W/roXccFAiMyaxH5TSU46eeXkN+cbWTgnK5QUsHu4PnV+2zd3BLR4dYahkpvDNiGvJsPJzocXtDb+LOwz8Ze3WqYu7vW+i5Z+5GU+pvMj15NbtNEqE+tpdO/+S0rG1Z8EY3SvQH1ZDGKyw9ArICBwFyu4QzOWoTiCvENEj1/IphthuiGzUoPifqQarSalM5GrBgoY2V+iTkXRR51AgrCLdpJ/W+oL0rNFsbfYvZkGTTAQU9SQSV6I3/H4Ssxp9sSYg5Hg1v8SbPRYDJxPA0ILGp0v1x4Y858wVddy0Z+YJYPa+w9pvBb6q2PpiBakz/2Pk7CEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUDRWP/73b354Wn8kBNEEBvod6CR7ma4Yu2kv78Tzgc=;
 b=BPq+j2gTuIaGny9/iHq9inq1GCTDe1aIjJv0zHu3oE+3TMOGc7ZYriIJR60bbyNZjouLWHyQ4ZTTiXAhx3maY0U9CPlA43QN2WnGhR15znGscuNRkPvYcezFcSYiBOAlAI69e8w9QBW8zOxDDt+UyGDdVLBXo40dW+G1e81IhLs=
Received: from DM5PR07CA0073.namprd07.prod.outlook.com (2603:10b6:4:ad::38) by
 DS5PPFE52C859EE.namprd12.prod.outlook.com (2603:10b6:f:fc00::666) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 12 Jun
 2025 07:30:21 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::d3) by DM5PR07CA0073.outlook.office365.com
 (2603:10b6:4:ad::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 12 Jun 2025 07:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 07:30:21 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 02:30:15 -0500
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
Subject: [PATCH 2/2] x86/cpu/topology: Use initial APICID from XTOPOEXT on AMD/HYGON
Date: Thu, 12 Jun 2025 07:29:21 +0000
Message-ID: <20250612072921.15107-3-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS5PPFE52C859EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c5aa79-f803-4ad2-9bca-08dda982fd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?45d9lp5aqtg/Ab8WfS1I+wpGzB871zzPB/K8Gy7A9msEwABJKGsGv0qNG2NE?=
 =?us-ascii?Q?/JGHTq8W2GMyFh1MtFwiDhbNX7+Cy0GMhNNEq3rPEiUv+jW8gifbALHguIZT?=
 =?us-ascii?Q?2dNiOa6Wcgdl47uLxdfd2ydltrb5qgpWDpb3m/5p/H49Fg1O7jaWw1BWQ3x+?=
 =?us-ascii?Q?rdKOQq5fS4GYglWmgn+OdXOTdraCyz9tFyt5cj0z4t2+Ik5atdykGYzTSPrH?=
 =?us-ascii?Q?aN62lyNXhIeziVH4s1w4PJphbYzmRyJ9R+yAlYlKt6nty2Blypt+ntLzCGHl?=
 =?us-ascii?Q?lqaczv7oNkVVZH9JP1M2Ny6Kj2Z31nd2WRHZENxEVdMUv3ewiwhACNdfZJQn?=
 =?us-ascii?Q?0cyaOWlJfeF2jAE5hpYA+A+hsnmUw8CBfK6+i0nl0NVr+3OtK5ga3bjMNyJ/?=
 =?us-ascii?Q?PLea21hqp0fJKt1IX3i71kYODbG0C8mOxwr93C6ZRHSQ67zsxbRcFlpAjv7a?=
 =?us-ascii?Q?UWeFQwgKLSV+V4Cmz7hGUUTJc/h0KLbMzaJuMzviY4HrTikxtWnHk18lJqk5?=
 =?us-ascii?Q?cZvxdzX4LolaIp6/rw9wvblMh8MelM2FZZJO5snk4iNaNHskmJnkUZCnUQIp?=
 =?us-ascii?Q?bOhiHrpihDBbcw3Ffn1116vtoZwBRwB9KY2rxOXB7DxohntlUW99uf6H8rSL?=
 =?us-ascii?Q?bVn5PppA1cxHA9rNZY5c5NV1ytvFYeVC2bwqGLajifK7uue5OeZofHgzu27P?=
 =?us-ascii?Q?pS4nZzCQEjp9Gu4aJw1py/0S9xyf4VBfDY2Wp2om5x4y3Aloo1kf/CXTngv8?=
 =?us-ascii?Q?5UT5qU51fBD4gw8QYXmAflmHNLoxFsGeR+gVXHVI4FRtNvwlef1WU6sDp3gN?=
 =?us-ascii?Q?JMoUjaUQYraOVMn7shDC+rgzBXGX7H7XHyDVcLEY1HpriOlpIZwnZP3gGedb?=
 =?us-ascii?Q?vUkGZ2xYCR6jrCnSMpAdEkET4YYGOf/kC2+cGyNLk5bUsUqni7E2LQLWhQYa?=
 =?us-ascii?Q?4izOUwJznoJk1xa7Etbb6fl54n7oHSZO8ie7zvU0axBnOmeegZ3c1zXPTGaW?=
 =?us-ascii?Q?+tsdpfnnlmVPuKcDDC73+lM9Uf3WRz4mv0zveTFFnxQJUu6Vks/e+X+BV5bB?=
 =?us-ascii?Q?8sLHyIeTI9VE1P4lQSJLj/EJqSbq7N1A0PKfVVBRGz1DA2pSOazYqZiIawq7?=
 =?us-ascii?Q?bLkzW2kojZqXp9avmqdfLTBx+4rQ7v6Of7Pyn98SuM3sf1jkYVEqNC5VyKZz?=
 =?us-ascii?Q?HUErxvRcPkqGegrlFZWWYmUJUtBs4kpt0Jyu1tIlIR0FJCelCrt1qU1nYj6e?=
 =?us-ascii?Q?tZXwdIq8+mtAqlxosGsyhYS8EQle/7ITrJoScnMSYgf7rrECcpnykXVeYFnO?=
 =?us-ascii?Q?TjIMO7G9HahKfCTGQRXQbU/Y8lyakR24S7TrwEu8uDtt8vzWdmhW3t+GeKr8?=
 =?us-ascii?Q?RnuJk8qQI9RL5HIvFi43DjosIs+gH9FphyWoFd+bPpMbMgavAo2LGocgzjTW?=
 =?us-ascii?Q?MZADi+/vB5+Mt2wccbKJsypGT1PVCgIqJO8EchR/hQyttkoEUGB06f7/cW3d?=
 =?us-ascii?Q?v8NKWTeh2u9CZrWdy0OkS7CDb/mjdCRsMGKK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:30:21.3884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c5aa79-f803-4ad2-9bca-08dda982fd29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFE52C859EE

Prior to the topology parsing rewrite and the switchover to the new
parsing logic for AMD processors in commit c749ce393b8f ("x86/cpu: Use
common topology code for AMD"), the "initial_apicid" on these platforms
was:

- First initialized to the LocalApicId from CPUID leaf 0x1 EBX[31:24].

- Then overwritten by the ExtendedLocalApicId in CPUID leaf 0xb
  EDX[31:0] on processors that supported topoext.

With the new parsing flow introduced in commit f7fb3b2dd92c ("x86/cpu:
Provide an AMD/HYGON specific topology parser"), parse_8000_001e() now
unconditionally overwrites the "initial_apicid" already parsed during
cpu_parse_topology_ext().

Although this has not been a problem on baremetal platforms, on
virtualized AMD guests that feature more than 255 cores, QEMU 0's out
the CPUID leaf 0x8000001e on CPUs with "CoreID" > 255 to prevent
collision of these IDs in EBX[7:0] which can only represent a maximum of
255 cores [1].

This results in the following FW_BUG being logged when booting a guest
with more than 255 cores:

    [Firmware Bug]: CPU 512: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0200

Rely on the APICID parsed during cpu_parse_topology_ext() from CPUID
leaf 0x80000026 or 0xb and only use the APICID from leaf 0x8000001e if
cpu_parse_topology_ext() failed (has_topoext is false).

On platforms that support the 0xb leaf (Zen2 or later, AMD guests on
QEMU) or the extended leaf 0x80000026 (Zen4 or later), the
"initial_apicid" is now set to the value parsed from EDX[31:0].

On older AMD/Hygon platforms that does not support the 0xb leaf but
supports the TOPOEXT extension (Fam 0x15, 0x16, 0x17[Zen1], and Hygon),
the current behavior is retained where "initial_apicid" is set using
the 0x8000001e leaf.

Link: https://github.com/qemu/qemu/commit/35ac5dfbcaa4b [1]
Debugged-by: Naveen N Rao (AMD) <naveen@kernel.org>
Debugged-by: Sairaj Kodilkar <sarunkod@amd.com>
Fixes: c749ce393b8f ("x86/cpu: Use common topology code for AMD")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/x86/kernel/cpu/topology_amd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
index fec849fff82f..2ff6988e020a 100644
--- a/arch/x86/kernel/cpu/topology_amd.c
+++ b/arch/x86/kernel/cpu/topology_amd.c
@@ -80,7 +80,13 @@ static bool parse_8000_001e(struct topo_scan *tscan, bool has_topoext)
 
 	cpuid_leaf(0x8000001e, &leaf);
 
-	tscan->c->topo.initial_apicid = leaf.ext_apic_id;
+	/*
+	 * Prefer initial_apicid parsed from CPUID leaf 0x8000026 or 0xb
+	 * if available. Otherwise prefer the one from leaf 0x8000001e
+	 * over 0x1.
+	 */
+	if (!has_topoext)
+		tscan->c->topo.initial_apicid = leaf.ext_apic_id;
 
 	/*
 	 * If leaf 0xb is available, then the domain shifts are set
-- 
2.34.1

