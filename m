Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6CF213E97
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993058; cv=fail; b=juO7bIz9jDIk/CfD+NI2d5OhImG7WB9kI2kDXxLvlsuXdl/9S0d0o6TSWmKO+lg4MYz/DxXKVIchSNgvZE1LqqSAlXOA5LFs0m4Io5PtxgIGKKZGpAJZegSxYU/Rrsn24x18srfZFjJaj7IoFnAPziKRM/6sm3Feils/7ek08Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993058; c=relaxed/simple;
	bh=8A1IxkRfOwc8x0N+4U+tSW+ahU4nMbFsileTmBjgGV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WG9+dOKROhVcJ5zDeL+/S0J0SLd6uigjITreoJNZgOZjT6ba502kVBOqeYuD+2TGshgREgwLBEWoCGgOwvIxdDsV3azJgV3owhzXKCLp51LOs3GPZiAVhhh3HJbcHZDZ18ldgrMfL6GNR0ywOjeNa8+amwu3XdPGKUwFOCC+0u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SFxwFNbu; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SFxwFNbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfpRCUmqahtlDJAL6/vh1il1KHaDidOd9/jSzKya0qOObg5mKxEPM04TypYYM8r+XunX2tlbD6Xb5lWjn3jjizW/tW9kCjl1WTMgshiqAhVjpAiIDbie99JQODoo3B5U1NcZK8PoLzlqmxM4brKMxN2OtmlA9daKMfhbhxasUCS3l9HWfhe1kUx26ija5q0HjzGSsqGRMyhC7M2kvBsV/vlfiTN+IKQtRuYumvAiruvITEL8626i/QosTTatd6kCVCCJXKIxWuSThcav1ZjLZLzrI27cKiFWsYvTiZSjPfol4DtRFWQuM6YzkpNrl5ZgrJiz2I7zKBsAp8pHrFe6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5JpFoVqNufps60zl48KuHasHGbD5ChL6vLjLIjCyy8=;
 b=pZSk58CkVCjtx39yUHxmYKVsiSfgtt/GsgeSCd3s2QlC3OLmbB9qyjkwL1BjT0vZ+qxdaV9/HGFnIKuwX0nJgFbFa6ayXfGnryjzWOqTeNCNHCPpf5+dM249no3v9zrjWHZSskwjTSrS+3VGm+pRjA+I6fuFkChxdpGCRt1/ZkZjwYKIaaUIiWRvy9ImtTM/IUPAasayuLOpZe9LBCR/n4HupuXiT6I8dFVfOcGtpWXpvID/Rr3OHg/OcKc8MaoFQo2C2jJ/oXwTQl8dPMjJ3aD1j/SZTaMZCeXf7n/ledi+m3bfqP0ikZRvuds0Wzy2zkhgrt//zXUQz+PiUSlI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5JpFoVqNufps60zl48KuHasHGbD5ChL6vLjLIjCyy8=;
 b=SFxwFNbuZkBfdeBmFIpnsPVG62e2tU9rfwwMMECR0dAZKt8dB0A5Xg54PKAZILUU2dlDt62+g8INDwN3KBO5awaDfi6SjSmtagrTSIMJGPb0nhzU0ItploRTY2dk95M290pnmCK3QXB5WdYHiCo/2sf5QDOMSKzu9PSQlUJ0WGU=
Received: from CH0P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::33)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 16:17:32 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::7f) by CH0P220CA0020.outlook.office365.com
 (2603:10b6:610:ef::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 18 Apr 2025 16:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 16:17:32 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 11:17:31 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/16] Attack vector controls (part 1)
Date: Fri, 18 Apr 2025 11:17:05 -0500
Message-ID: <20250418161721.1855190-1-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SJ2PR12MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: d6068c41-7feb-48e5-9519-08dd7e9485d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jGB+X0C20IDKg9qEHTZRmKVxkZwHUtIwWF4JmG+I5owMCBIM9O9SzfhPoanu?=
 =?us-ascii?Q?xMFblTqtQiMKCDx0XpeSwPwgzWYP6kEr6bdcOJckxMS9u4lP6h+n+A6PkynP?=
 =?us-ascii?Q?cVvueqsqnFa/ZYKvKSKMVXORicmepqIuUviwTWgMTPQRMfIINrNaOlYERQDf?=
 =?us-ascii?Q?A2ncZUCG7psIzBpgNEFGJJG1ZA8m3Lzwk3N3VDhFsEEQx92nraIvmt7e+zFe?=
 =?us-ascii?Q?4VFFdBIhadHfZKz7mBzGDosfFVP82iZXW2n0o6OY8jl2jj2PA36E9xY0qJXd?=
 =?us-ascii?Q?REwvIiMAwk2yErbIA56b4FgfP1/zoShHM3fyr7vZ8ZhToPOPafbJ22zlFaMr?=
 =?us-ascii?Q?PI4JY+KqQioYokXABVcsbvHGzCZg7RzIsI+KtSlBYbAuQp0h4c55t6GUmZf9?=
 =?us-ascii?Q?AdnECc2o8+9M/Wp2Q4wQlNiLes+s4RVUIiZAo4ICb43EpTf1axsNdeI/oFCY?=
 =?us-ascii?Q?4J/bszk+YkL4P8RXBAQ5PVN7joaq+DdzYAnkPeTtDkrUDEIFMixAXNF8Tx1z?=
 =?us-ascii?Q?uX1hxo1A7h7omkNw958DXzeQqHa4nrIPt0kCWCufLNOPY//PzpedUiCAtc0A?=
 =?us-ascii?Q?woF1czTCNf9hNQynJ1gdCU0iXroKZAIjiIpvUhWriBYPALe/XXgal3GKp+4X?=
 =?us-ascii?Q?XNpaf74D9ZCaBR/oZrr6EW8Z6rvG88QW/HU7C6fyCwoQkYDQyCC+znXz4c12?=
 =?us-ascii?Q?RS6yfjkI4fmGukCUFicJGgu1P8okTCAgbhXada5d6960+IV+F1NUeA8lpOKr?=
 =?us-ascii?Q?VynRZpuw+bMrChieFdyVExaetV8dKmoOa723T5664Rs5Ol+A9r6u+Kxb8AA3?=
 =?us-ascii?Q?KF2g6vt9EqFVMClMFj/YvtZLQVcDJuilOuxYyXo7KEVVXfXmj2WJG6n9mvdy?=
 =?us-ascii?Q?8ryF8Fq0/tYJdXV4C8OiwzsYyUrpj3bS/ToqPbeQmA/dchAWJIW2peqMbylr?=
 =?us-ascii?Q?SdrI5i9+9vFjtsN37nFszq6xGtgSKys3lSE991055TR2fKe8BIzjHE4iWb4E?=
 =?us-ascii?Q?bw8VSwrt0IlbuRlwfRnbd7Ts+hxvNXcwvfTP8cr7pbOdSycfq5rIA1uEI4BQ?=
 =?us-ascii?Q?y1ydtnssFy7k0a/ip6g2vNTAxCTLWc9uUMgOwDqUXOmVjXHUpx5wXjREJnvg?=
 =?us-ascii?Q?3aqBnn9ziJgyo4pKCP+vZaSkmG7NhvI8I9/391wiCIHGr9U+kYTR/DwrpxHM?=
 =?us-ascii?Q?Hq+NOyCgvnD4Hgzq8FsrJqOOz0E9pc2UCXkdkRgNWo3PlWpHWEx7C7qtRG32?=
 =?us-ascii?Q?LTug5jSzw0EM9qcrnT1T5tqU4r0PEv/DsugeSKiNsQ3+DZDwnUKo3X6GBgXh?=
 =?us-ascii?Q?6UwgbtUiQm27IZSMh7JRiorY7aiOC0SDqftqNyOQxi0S2IdfTS7n9VTjUPwh?=
 =?us-ascii?Q?SiaH5g4JvrwBroyr3AEAAsyIxml7jBoDlFmEkoE0BiGUxISbr0T2p5oFpghX?=
 =?us-ascii?Q?jrdZ3UpvoRk7zYmYfbPdZHSlnMhJtojMe+azeiFcfB8eJcsyCBI5yXImFeYU?=
 =?us-ascii?Q?f1bdmrV4sG/j+kCa0GlsuIh4wuH4FF2UbgvXeRh3wti1EODSVq5eeLeSWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:17:32.0931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6068c41-7feb-48e5-9519-08dd7e9485d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192

This is an updated version of the first half of the attack vector series
which focuses on restructuring arch/x86/kernel/cpu/bugs.c.

For more info the attack vector series, please see v4 at
https://lore.kernel.org/all/20250310164023.779191-1-david.kaplan@amd.com/.

These patches restructure the existing mitigation selection logic to use a
uniform set of functions.  First, the "select" function is called for each
mitigation to select an appropriate mitigation.  Unless a mitigation is
explicitly selected or disabled with a command line option, the default
mitigation is AUTO and the "select" function will then choose the best
mitigation.  After the "select" function is called for each mitigation,
some mitigations define an "update" function which can be used to update
the selection, based on the choices made by other mitigations.  Finally,
the "apply" function is called which enables the chosen mitigation.

This structure simplifies the mitigation control logic, especially when
there are dependencies between multiple vulnerabilities.

This is mostly code restructuring without functional changes, except where
noted.

Compared to v4 this only includes bug fixes/cleanup. 

David Kaplan (16):
  x86/bugs: Restructure MDS mitigation
  x86/bugs: Restructure TAA mitigation
  x86/bugs: Restructure MMIO mitigation
  x86/bugs: Restructure RFDS mitigation
  x86/bugs: Remove md_clear_*_mitigation()
  x86/bugs: Restructure SRBDS mitigation
  x86/bugs: Restructure GDS mitigation
  x86/bugs: Restructure spectre_v1 mitigation
  x86/bugs: Allow retbleed=stuff only on Intel
  x86/bugs: Restructure retbleed mitigation
  x86/bugs: Restructure spectre_v2_user mitigation
  x86/bugs: Restructure BHI mitigation
  x86/bugs: Restructure spectre_v2 mitigation
  x86/bugs: Restructure SSB mitigation
  x86/bugs: Restructure L1TF mitigation
  x86/bugs: Restructure SRSO mitigation

 arch/x86/include/asm/processor.h |    1 +
 arch/x86/kernel/cpu/bugs.c       | 1112 +++++++++++++++++-------------
 arch/x86/kvm/vmx/vmx.c           |    2 +
 3 files changed, 644 insertions(+), 471 deletions(-)


base-commit: 33aa28024418782f644d8924026f1db21b3354a6
-- 
2.34.1

