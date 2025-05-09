Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33227231841
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808134; cv=fail; b=kN0XwLryZw0E657FaH7lIG5qGfNsqpR3RhTMtvBpcvbEwPixYq42QwfeMv+MdU/FYCBLW24M54ORO+N0sVZUdhTJxueBtJjANJMWn7HasU1L0wThiSIX0fjAEuKw69csVixwiEbtmCSKp3oII+Iz/kbeB11zntxX335e9oHoEXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808134; c=relaxed/simple;
	bh=JC7964437hLbUiOK5wM1OWS0u3pgxzbUeQ0G9YGbqBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e+mRPRTG9rpBjwTUyJBSvewOU+gpHJHv+BOVXGyn5Ui4+oeCz7sAyzNM3JjOI+hAiBnfVcxbU4rYKpXTJpAvkGvwzLR/Y76hRwUp/lkBrRyEWvtm5IlJBcIzwlLOa8mCFRpQ/ejUcU2iANMuRGCIOlV0pBbN/D2dPAsowM8yAsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N0AcSwEP; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N0AcSwEP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ8vSKNOM+GpaFc2SRD3rcDGrpcVjJsv5cLBYqw+VvPsYTnI+rZnp5lIuFGMVTOh0/Js9N2tbO9mwglRiV3tYcHytiCLh2j7tNP8MAskY1WHWXMK4jdUGTnEOjnS++3VOqlVcCpkmpzZWpJcSrY4mFLrMU75E7F2kfzsmKy7bd+Tw8l+1OWbgTakF4EFSG+egVlJcP3Lt4HZz/f/GaNu7+k37n9Zjj1nMgWd/eeGYK70sEGE29dyt8dczfCC68xoWrGybfIc1xpHQ+ulseG+mB7Nd5VnRdBdDaKj27KEIiZIc0PmmADw96jZsh+eA+zl10N0nCp/lOWeagZ6Qc32Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njv+zzKN+hnKdVTIzAxv73yImF3NqBVqr1N83G5YUTE=;
 b=udQJANukrQD6o1S7bTVGUtOQLbXeiW5ypOFhqRIrxeE7nWg8JhF+DBxG/BxlJVaDGrOGQv25/oClaw099UloEHg2P+ZD/uSIloGMqFliSH06ZXPp7h5BCo/b+dLoOzGt5WV+Op8nfvgg8uj8bRIyXE/j8L7BzHBhx4A9oYcUuO4m5UyjP1koUhVPrdw1XNqavBq2yr8jAkNE0grBnRaZDfgCI324m/V+uibDG9o9IIINkxIAt/OJ+jkACadh8AQedqfS0pUAp/ia2Q/UOvyC9nEaEEXmcu550kYCse80cHGTW4v5mB+ZKKrWHSKSLF1A3PdTnI2sRJrCxaCgrx18Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njv+zzKN+hnKdVTIzAxv73yImF3NqBVqr1N83G5YUTE=;
 b=N0AcSwEP8IYJ9ZpXEevlxJRYgIDLIKFdxQXB7Cz0zhYyraC1oO8uxbEFTxnVll3M8nza0uTC8WqF8ggZ/Pbt2w7D1Y+xWtQUipPF1eaoYgVWViNPhYvmj7splXPhi00odC8MEQVPkasZ7f2PljvMZeWJSm10+viRKwEY+LPpvdk=
Received: from BL1PR13CA0097.namprd13.prod.outlook.com (2603:10b6:208:2b9::12)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 16:28:50 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::42) by BL1PR13CA0097.outlook.office365.com
 (2603:10b6:208:2b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:50 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:49 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/20] Attack vector controls (part 2)
Date: Fri, 9 May 2025 11:28:19 -0500
Message-ID: <20250509162839.3057217-1-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 678d29aa-eea8-4ed8-9af3-08dd8f16948a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lWk9uSkrzYhSvaNm5uf+AcyTWqfbWKZJKeMMS7rybYV3eQ/6YuvtoxBuIgVf?=
 =?us-ascii?Q?lvlTNrG5A3clmkAxuFx42V2nBBUouSUukw+CiMcZslABKrLcPH8MZD8OARH5?=
 =?us-ascii?Q?ebwRJz7MwCwoQd0xw+qD2pFDpL4bT5jZ8doCVE9Zll6GGwC8Zk/lEQjz1OjU?=
 =?us-ascii?Q?uPPsn4baFXqeBoq6h6tLbumDX/8rhDzCFIWcymbz3dC6X21GIK9W5Q4Deke7?=
 =?us-ascii?Q?FroUbrC/duvf+CkoDMGo2kriTs+Nrl8rMtvJ1MDwrEit4JGkrH3Se+3RMZIS?=
 =?us-ascii?Q?rq9H7NC5UM2rNcV2pAPwChYQHxEmlBv3eo2B2d72CiChN4klDiRy1GtzPE3/?=
 =?us-ascii?Q?SC5wGrMsTaSn56cq7Crcbg7kdzmlAMeas7azKqnUfd3gDJ0iu3K8kM06gdTT?=
 =?us-ascii?Q?F7bOneasYAhOoHKy8qYiGPDOhpCLbacM9owRm6lvF8GscUFhlWz+InpcnOg9?=
 =?us-ascii?Q?t00anjZqUhrE1kqk1DpYz3P+D/7TwFoVHVf9Mc2C29rul1lcBYRKaFFOf8rP?=
 =?us-ascii?Q?WUFHqHuqo4mdMf09OsPMvThUbJii2HUyZo+NHnxCR0qaCeVK+zzdtRgUunny?=
 =?us-ascii?Q?1XztPUPHf/uEDZyQzKgb0ffnW2h54Ov/ejKOxbVJlFsJMWhJuimCG9LzWzKG?=
 =?us-ascii?Q?4DlkYsZPp+ODXlEATcWhOST01t5TK9gwCzGg3wMUaQiEOd1i2J0RgQCGm0ks?=
 =?us-ascii?Q?Mhe7IuUBrfvIFg5SPg0lLq0bQYx7dlVSPwtiTHFfbiMe5KA4udREJx7Xzccs?=
 =?us-ascii?Q?X1mnSFjOk15XHk8ItAixI6esr582KIZNMuRHkGpmlqRxymx990osNvHAet+f?=
 =?us-ascii?Q?wbv8NVlgxlIYpyz8tsLW45oGk9PUQRSSalkh22Zys0w8s8hmMruUG8IrhehH?=
 =?us-ascii?Q?MaUgBflxbfXQtqkBTTQ9JxGRIQEKw/qbQgUfK1h6BJcHDL0T5jOEcnmnLHUr?=
 =?us-ascii?Q?zGIupXsrKgQCYk5NqeVTqPw2hxscG4YMCahXIw9SsVVCuT3vHTey6LIGVyQR?=
 =?us-ascii?Q?QO7kDS1A0iP+ly9ATvBRsgSpkFymIIVxYIzGeJhPZnvgCwPbtjc/v49hdOW8?=
 =?us-ascii?Q?5prTvsarZDVui3jA7DdeaXlvCZFn1oZZIVi4vbXL0aOg126kgTEEPMV07Qoy?=
 =?us-ascii?Q?qL4EKe9W742VTEZTbbYnZWl77IiDeulX1/2ayhGaW6ceOQPrGpD6+u/T/DQc?=
 =?us-ascii?Q?WYAElojWK6DhPFv6PSvGcOC1SN/Xigh2058e43+mBytkDXS89OHmOv0puZC6?=
 =?us-ascii?Q?YyiyAvs/ORHrZg0TF5olyGoJ3yJa3VXROzwh3EUx13DbNAif/zG34j+bL44m?=
 =?us-ascii?Q?EzHbb9NbkRjv1lH8ZB1RT2P4ru+6CETvNuUfNbKnD26iRiZZ4x6XMJ7MlKKc?=
 =?us-ascii?Q?WmGvI6/LAforpa05RqMz2EF7hWjYca+KtnyFzMrJzVVnR5/lVdROTSENgyCc?=
 =?us-ascii?Q?v4u0+Y4cTMGJejd8fglglvlXuev/ytNyGDPRmDWRVpxPQE4zujQvZGtddo8t?=
 =?us-ascii?Q?kaFeKrn1ETwvOavvKfffdw75n9Wvw/znDO/2j22QtHkN6nCMpRdBG4ZPOg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:50.0214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678d29aa-eea8-4ed8-9af3-08dd8f16948a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934

This is an updated version of the second half of the attack vector
series which adds new attack vector command line options designed to make
it easier to control which CPU mitigations are enabled.

The first half of this series focused on bugs.c restructuring and was
merged on May 2.  Link:
https://lore.kernel.org/all/20250418161721.1855190-1-david.kaplan@amd.com/

Attack vector options are designed to make it easier to select appropriate
mitigations based on the usage of the system.  While many users may not be
intimately familiar with the details of these CPU vulnerabilities, they are
likely better able to understand the intended usage of their system.  As a
result, unneeded mitigations may be disabled, allowing users to recoup more
performance.  New documentation is included with recommendations on what to
consider when choosing which attack vectors to enable/disable.

In this series, attack vector options are chosen using the mitigations=
command line.  Attack vectors may be individually disabled such as
'mitigations=auto;no_user_kernel,no_user_user'.  The 'mitigations=off'
option is equivalent to disabling all attack vectors.  'mitigations=off'
therefore disables all mitigations, unless bug-specific command line
options are used to re-enable some.

Note that this patch series does not change any of the existing
mitigation defaults.

Changes in v5:
   - Updated table layout in documentation file
   - Minor clean up

David Kaplan (20):
  Documentation/x86: Document new attack vector controls
  cpu: Define attack vectors
  x86/Kconfig: Add arch attack vector support
  x86/bugs: Define attack vectors relevant for each bug
  x86/bugs: Add attack vector controls for MDS
  x86/bugs: Add attack vector controls for TAA
  x86/bugs: Add attack vector controls for MMIO
  x86/bugs: Add attack vector controls for RFDS
  x86/bugs: Add attack vector controls for SRBDS
  x86/bugs: Add attack vector controls for GDS
  x86/bugs: Add attack vector controls for spectre_v1
  x86/bugs: Add attack vector controls for retbleed
  x86/bugs: Add attack vector controls for spectre_v2_user
  x86/bugs: Add attack vector controls for BHI
  x86/bugs: Add attack vector controls for spectre_v2
  x86/bugs: Add attack vector controls for L1TF
  x86/bugs: Add attack vector controls for SRSO
  x86/pti: Add attack vector controls for PTI
  x86/bugs: Print enabled attack vectors
  cpu: Show attack vectors in sysfs

 .../hw-vuln/attack_vector_controls.rst        | 236 +++++++++++++++
 Documentation/admin-guide/hw-vuln/index.rst   |   1 +
 .../admin-guide/kernel-parameters.txt         |   4 +
 arch/Kconfig                                  |   3 +
 arch/x86/Kconfig                              |   1 +
 arch/x86/kernel/cpu/bugs.c                    | 278 ++++++++++++++----
 arch/x86/mm/pti.c                             |   4 +-
 drivers/base/cpu.c                            |  67 +++++
 include/linux/cpu.h                           |  21 ++
 kernel/cpu.c                                  | 130 +++++++-
 10 files changed, 672 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/admin-guide/hw-vuln/attack_vector_controls.rst


base-commit: fd569ffb9ea03da78b1719ccee5bce34fa130fa7
-- 
2.34.1

