Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2279E1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713391; cv=fail; b=Bg0YSWqGsNhaUxQIGCMxE4dC6uXXMnAI+eam323bOYOnyobqHKQhGfpJT8ExTvEvE0tDXzdplojhsHQ/Yc+jFrYfoSQOtwDC8NvXyUgkAyEFOqllFOt5y599azglN1ujUNf3ndcoiQ9XWdxSNjGe8wKZqMSPFYj0SOC0fYIqZxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713391; c=relaxed/simple;
	bh=NtnkU2PX3ibgCP6SjiIifr77C24ly+W4MPkZOAelay4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kfjjU19JlwNlzDr7fgjXshg/aGmsJiWmrnZPF9caq6rf96NR1mxFHYMdqqSLcKlwS5ZL3GrEe3nu90oklzdlOliHAOYHkEI+xkkV4gxfeCyQvdh1UD0CHldlfPSATN5qmf3S+j42wuNCHaZCuQDlvJtJXxsbj0HlUztBG+dICgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K7M30yeS; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K7M30yeS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbSHWEl6e+rgCBPhV6BR8dv7dUEYGlKm1P+jpF4T78Zn76YUegaGmYC80qnnYfrLdj2c6SRGbUXcOVeaP31YFNv5L0WqIHBs0AwEoCeVHpdo6Sv8k9pRbX/J/9tsWL9aya0zONYa55C15YC5ZLwHIhM3EhfP/NdZx1zaf9sWyT3H054MPuMo1+65GQN2BgANxxus2nwwD0aQy4DmJJCUP12QpkL15ZwGavLqU21cdMyuQkSu63BbKYj9oJUJ27+C3ichbZ7KvE54iLCpMIRiBlr3MAQy2oyq2ub/CSc1Pz6/yNz+GvgmfG0dcicZhb3/n0+ecclsPWb8PiaNhBu0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh6qlIEfoUAkOOF2xUc4em6Pd6yELJFfIsA55W9nwa4=;
 b=Sv4jRXsj0dlN7/BOpr1vsZ0OkZgr3eeLbl9LDX69JAzVI9sji8A6/sgkhPuVbk1kQX5YWDXOMEEQ1fjx00I1OJnlvJ0TMULnRdpDpP7eDUNZNOLg04tr9O/YdeWnjUKMtInVhD0SgMTkuZth2wB8p3p0z644JkLMBCSlzuWSjsupIaW1jC9zX/eYO0xOaMLoG3iAb8V2vkLkqj9oEpTYE9u21o5/9+p1be6qLmBPECjChQOnby0cktRMyMEEnBY34JKKYTUbMoUg5DFfJJxNhqfgy+9rBs7HoEM4rxO+m9rOpSdTEHTOzsgrEVquZslf4zTWHWpg1ZXPuPOXaHdwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh6qlIEfoUAkOOF2xUc4em6Pd6yELJFfIsA55W9nwa4=;
 b=K7M30yeSGjgdbjqmZZbg7vK+ZKMk63Qod49g+KxAyMvVaDH1A5PEWqAEFEYNeLPyG1EARNwROlUkDpjsAOlgt1urH7x7iMSpxY9oZdV/e+kFLfLXGIeZ87DXZ2oDdkoZKNcoc2EO/d5h07FM8Ujgi91hCeclW/aDsligbSJtli8=
Received: from DM5PR07CA0080.namprd07.prod.outlook.com (2603:10b6:4:ad::45) by
 IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.35; Thu, 12 Jun 2025 07:29:46 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::e9) by DM5PR07CA0080.outlook.office365.com
 (2603:10b6:4:ad::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Thu,
 12 Jun 2025 07:29:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 07:29:45 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 02:29:37 -0500
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
Subject: [PATCH 0/2] x86/cpu/topology: Work around the nuances of virtualization on AMD/Hygon
Date: Thu, 12 Jun 2025 07:29:19 +0000
Message-ID: <20250612072921.15107-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: f879f427-d42c-4ba8-beda-08dda982e7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sO8qXy3He6TzIexZkiy7cFsdkTFYP1uwSmpKRDVjpLJJiMomNPvDk9XAmZGW?=
 =?us-ascii?Q?G4ECPgQ6G0ipdoujfen1tCmn84PUauc81PXp7M/0UOT7UhF46U7/W0uAbjbW?=
 =?us-ascii?Q?Pq4BfIeyELMaVog/93T8YkJaDLtF0x2fVCBKphd6Ts6lLBg7/9yMDMA8efno?=
 =?us-ascii?Q?UUM5p6X7Hb4BHBO3ruzpUzBE+3O/RotSfyq9caBpFcmVFkF9PKjk4Hv4hTwV?=
 =?us-ascii?Q?fYSyergQZmCPkxX3VYjeuhWVc/5ISKDCiOiCEaVrhHMck5cBDTVzosK3RM6o?=
 =?us-ascii?Q?0FFWisNT2acZ9FM6sszwWD2mxDWhwrnu3cCbbk+YZWwXNP5HgJ09tD8U1qEi?=
 =?us-ascii?Q?OXG0MaajxTGCeueL6LW3xpGKURhC82+wpAONFpP6wv8SzlPr8dxhNduooYTw?=
 =?us-ascii?Q?PFc9cFYOTSfHjzRLoLzbEBwfIXym8tiWN3XCfJ5agcoFOxsbKUIevyKbFnYZ?=
 =?us-ascii?Q?GswoYdc5vZGP7jG3qa0ZP/X3DrtJ99yWCaoLsNe1IcUkm13nIUfwfhM5c7FQ?=
 =?us-ascii?Q?6rqcuZhcr7Razxq4ABBZ0GhlcoEpiV+pemNJWrdnUHSvokwhi9epnnJNlhtL?=
 =?us-ascii?Q?jhV1bU+dcB441T9YhvtfH52yVdwMwUDrfvw64U2eJMXf3JfjQ+s9tpkr/XFL?=
 =?us-ascii?Q?C7HtcA7o0YYjV5brNG2PFzLta77Yw36i6JEYJRnPLOzE8FOSE5Xpf5FMFTIT?=
 =?us-ascii?Q?z2RR+71o8Yj5zDU0vn+XVvqn3ppuNJF96bj5AbPWv1Ti3a1tBISnnx2GE/C3?=
 =?us-ascii?Q?XNZFYjDrPPKogJsUKpHVHxNt93QSGQ0fLSLmeKCV5WRyvAyRXf9iXPGc4VEP?=
 =?us-ascii?Q?5YEg9gpyUnCHjCjAqm0SKIAp8FreL/FVe7m4RtLj2PUHbDOh0M3cBIS/EQGl?=
 =?us-ascii?Q?/8oKazkNUuqYg7ttfTFx0DBbWtSQ9GPu7K4Wd8pTVzrw8L3AT/UnCZP25tMd?=
 =?us-ascii?Q?xUJKX1H0z+ZbWHVeSCFQzx4p6CldpTov0RW2uY/9vFzK3HoFlVmTRFmCyW71?=
 =?us-ascii?Q?RLxjsc9F66hXcLh6hQuDudMx3HOOU/pJQcRw8dSuzoR4KAlVcXvmsLPUY9b4?=
 =?us-ascii?Q?IvEnpD1GmxgTLGjQLhwjMN0wfvnibwDD2shHr/KQLn80IRXXzWAqPMwYC0Id?=
 =?us-ascii?Q?8fKg4RPc9h/5r2UhyY6nyKs62eiAU/mIUaZ4euUDPhS/RRSK4/HPsoX9Fy94?=
 =?us-ascii?Q?/tkbOURoBW72pZeGgkFxCugiHgHrw7q51J+Jn4B4BloT518IoY4Q4EIQ6VMN?=
 =?us-ascii?Q?GN3xrhk56RMGCVc25x/825UB0wRKs0v9qMHgN+i6HMJ+Y1UKefDtXCgBl3tV?=
 =?us-ascii?Q?KnKPQ0SWYBuY0JCpLFCxHQ0YVEBqH494Ky8S8jRgqyYosN69ilVJz2qEcfeQ?=
 =?us-ascii?Q?qwKyVHTwBSO4cWQa/Gr+WAp25gJPpPLrQxgaOOSExquPmZJT7DRq33yum0ZH?=
 =?us-ascii?Q?9aiQUzFsyxeYnL1UWoVZhoI4FDFo4+umcoPhS0gJ+x6ewk4O4te12OPJtlYK?=
 =?us-ascii?Q?Y4O0jzdQe6gFUm6zKe/Uzy8r8fMcb1Skk5fR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 07:29:45.6596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f879f427-d42c-4ba8-beda-08dda982e7dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628

When running an AMD guest on QEMU with > 255 cores, the following FW_BUG
was noticed with recent kernels:

    [Firmware Bug]: CPU 512: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0200

Naveen, Sairaj debugged the cause to commit c749ce393b8f ("x86/cpu: Use
common topology code for AMD") where, after the rework, the initial
APICID was set using the CPUID leaf 0x8000001e EAX[31:0] as opposed to
the value from CPUID leaf 0xb EDX[31:0] previously.

This led us down a rabbit hole of XTOPOEXT vs TOPOEXT support, preferred
order of their parsing, and QEMU nuances like [1] where QEMU 0's out the
CPUID leaf 0x8000001e on CPUs where Core ID crosses 255 fearing a
Core ID collision in the 8 bit field which leads to the reported FW_BUG.

Following were major observations during the debug which the two
patches address respectively:

1. The support for CPUID leaf 0xb is independent of the TOPOEXT feature
   and is rather linked to the x2APIC enablement. On baremetal, this has
   not been a problem since TOPOEXT support (Fam 0x15 and above)
   predates the support for CPUID leaf 0xb (Fam 0x17[Zen2] and above)
   however, in virtualized environment, the support for x2APIC can be
   enabled independent of topoext where QEMU expects the guest to parse
   the topology and the APICID from CPUID leaf 0xb.

2. Since CPUID leaf 0x8000001e cannot represent Core ID without
   collision for guests with > 255 cores, and QEMU 0's out the entire
   leaf when Core ID crosses 255. Prefer initial APIC read from the
   XTOPOEXT leaf before falling back to the APICID from 0x8000001e
   which is still better than 8-bit APICID from leaf 0x1 EBX[31:24].

More details are enclosed in the commit logs.

Ideally, these changes should not affect baremetal AMD/Hygon platforms
as they have supported TOPOEXT long before the support for CPUID leaf
0xb and the extended CPUID leaf 0x80000026 (famous last words).

This series has been tested on baremetal Zen1 (contains topoext but not
0xb leaf), Zen3 (contains both topoext and 0xb leaf), and Zen4 (contains
topoext, 0xb leaf, and 0x80000026 leaf) servers with no changes
observed in "/sys/kernel/debug/x86/topo/" directory.

The series was also tested on 255 and 512 vCPU (each vCPU is an
individual core from QEMU topology being passed) EPYC-Genoa guest with
and without x2apic and topoext enabled and this series solves the FW_BUG
seen on guest with > 255 VCPUs. No changes observed in
"/sys/kernel/debug/x86/topo/" for all other cases without warning.
0xb leaf is provided unconditionally on these guests (with or without
topoext, even with x2apic disabled on guests with <= 255 vCPU).

Relevant bits of QEMU cmdline used during testing are as follows:

    qemu-system-x86_64 \
    -enable-kvm -m 32G -smp cpus=255,cores=255 \
    -cpu EPYC-Genoa,x2apic=on,kvm-msi-ext-dest-id=on,+kvm-pv-unhalt,kvm-pv-tlb-flush,kvm-pv-ipi,kvm-pv-sched-yield,[-topoext]  \
    -machine q35,kernel_irqchip=split \
    -global kvm-pit.lost_tick_policy=discard
    ...

References:

[1] https://github.com/qemu/qemu/commit/35ac5dfbcaa4b

Series is based on tip:x86/cpu at tag v6.15-rc6.

---
K Prateek Nayak (2):
  x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
  x86/cpu/topology: Use initial APICID from XTOPOEXT on AMD/HYGON

 arch/x86/kernel/cpu/topology_amd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)


base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.34.1

