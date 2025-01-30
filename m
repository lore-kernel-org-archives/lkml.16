Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18B1946C8;
	Thu, 30 Jan 2025 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272056; cv=fail; b=lxtByBoQ4vXHrjdWY6b/GQdKQ20s9vVpLv1FlYgq/CnhA5NIcJomOOK/sUQ7Z2aEpo7YdeyB5oDSLOHqAqwTBrbKa/jKkWNYEqnn4XhEPWb84mfE4emKEVCh/MJTwt0jkpe/qePP48GzezcGj3V29oW7xA8wck509VwGhuhNBkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272056; c=relaxed/simple;
	bh=p3hbJsJ8kmlWtdKhQyH6abQuL9m47+KnPzDnpGuZiQw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BfZ/opVzXcWfasRHaGfeVa9wtwURMTmkrcLURKly2tW7vWySC++qW13SczQPw8+9eA+P51Wv2DOEs6KOyMCHEj6UVhgPhJ0u1ZlpDAipdn1iBlPb1H2uD9NSI8zF4qRcFxo01NVgAKMHk/W00a+F4vQOqnIMKBkG60WRNRwF/cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=efRy5PzK; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="efRy5PzK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdVFagX/RWR8LVlrHb9KMRl9siqlO783iVZDgJDQ6NsEMXcnSueeggMmqyJh+4czDAxbyTZ/Lr3mX6QX2Pm1I7sV4DxRSDD/KmOuuuhhfAd8iQfk2+KVEVA+KutLfegS5kEWbPWRxFT67qgsOwhoUww4Ox2JQVf6gdPYxJxdLXFybpY7u54Q8oNgpnkRTE6WB6B9uDwer5z7ZOdoq7xjqWJocnIygLRhWtbQurcLRf4utIQd7xtxPRiIXzuKMZ+Aq6cyZ4+TL78NcDyeS4n/gI3dDEZmOhrgsFlJ/sZOnWbU7AOQYfgvIUjf1qLyVi6rLw+oAY98SoMUxwwb14TKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmlX9QNZNXljLN+pvZ7WxSTt6xs1jgAoCKJ6bWr79Ao=;
 b=dBu/kW7NwWJ7/U+0Mp2wE+DAfdzT1Iheio+ndNTgzeLMHEqD8P6BHbbOhATLcFhiVowezFABb2+EHAe5OEP+IUrDxcwkLeNy7EKkSHqOmEGZQ4UnDuNLIZWzT7gbwJik6j84hTZduicm1x9m36r0XX3dXDuiqhE5EdLWOcRzSH1+Das8zoImCnpAaqOxnnHbCzblWkHkl4rG12nXempK+O7eqPjHAXpeCNuJVbLCZcwPn55JfYOmqupHSg9lxH3x/4oik9aMRc4tdNtsJDxXCWDwzOWZ/y7pCbAqfRj7xIhnyoEJQWHTZgYUj4EeB3TyPwu3aIPR7EME2mjIrwnCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmlX9QNZNXljLN+pvZ7WxSTt6xs1jgAoCKJ6bWr79Ao=;
 b=efRy5PzK97k/1LIaY2Vl+WQrnOffH5evERBYkyhsgshbpNsSDUXbu+UYuNHhTCxtbYw/SN62jTveaVcYhqb31Lv96KdGfiBs7nF9REAaHe3NK9uyjWHGK2m6odo/uCgNMzrkHTX73D5Kdb5T+KdeZZ4F1+7VUMXWLcRWiF+J/Hw=
Received: from PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::28)
 by IA0PR12MB7724.namprd12.prod.outlook.com (2603:10b6:208:430::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 21:20:46 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::98) by PH7P223CA0002.outlook.office365.com
 (2603:10b6:510:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:20:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:20:43 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE)
Date: Thu, 30 Jan 2025 15:20:30 -0600
Message-ID: <cover.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA0PR12MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 769fc6a3-1f35-4c4f-2392-08dd4173f5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LaeJU3gcX5G8ueMMc81isHXXVplO6MceFqTUXsN+D1J7wEw6ihgNstkr/3Ua?=
 =?us-ascii?Q?XTLdt05OagMby6k/x0GlhDOvSioUCSwtRFV1VqPjaQWvqdeS3W2nMVjcXWar?=
 =?us-ascii?Q?nlHIAvPgHYRp7JnrTzHNjwEIhURGnO6b7b+7+zFOU4iW8UTL9mm6+bkOtHrO?=
 =?us-ascii?Q?o/+UXWgNDYQfxX2HnkAECUaPmFPeYCVokcVW4CaysVw+pNsJVxslbhul5ABJ?=
 =?us-ascii?Q?iF44286gwcG3zvODj3cQK5fxMDYLNxNap4ZdOZwq5gGUHbygDik3WiJSToly?=
 =?us-ascii?Q?Zlb+8LtI1p1Mkdm/Yz0feeaGUeee8kitr7pcCSmuvK8tmk3G3ZDS73z4vwja?=
 =?us-ascii?Q?c2pXFa7WLLxKDAtl5ZaLHW/P8pns4BVEuzNci06vznlGpmovOA+kMllPW9Sh?=
 =?us-ascii?Q?KLTrj/lJFnyL8t13DOGnoZXI+FZsJal01Uq/0qI/k/m3TXneSR4BGNRFHKy7?=
 =?us-ascii?Q?jo0W1FlLDiBievQ+T69G/UokBfbZCIDIB7TureYazs4nswsgwiyPmP3qCuFO?=
 =?us-ascii?Q?aKzU85ZyQxxKwzRMPyN0GyGuQQ4h4uwYO4dxIyg0nJMFLeOIdT5FEjDW7Vti?=
 =?us-ascii?Q?Llp9ZopK/SwN+qO94xU6vrnENScWHIlYiqqsqNuv89BqREVwgBmHOzC53i53?=
 =?us-ascii?Q?7MdZSKINp7cQPJFPKb+x0UHfRWS79YPna8txMC9T2Ef3n2xBjpJeHLcW2WQT?=
 =?us-ascii?Q?13IcU2mOSEoJ3PdETUGXNlEqoMYy5HH3WXQG/DWybw4ACY/MD0X9NwYKDodY?=
 =?us-ascii?Q?aNEHReyNF/P/fg48xX4ryBO5tqOskQnZyoz7QnxnaLJAHoddjh4gyW6QpRoN?=
 =?us-ascii?Q?iBA0W8x6tOVz1o97mWCDAcQL4EGAk0m40eWVMXjn5H0jLWMxpg2K7zAVbnNN?=
 =?us-ascii?Q?71EKVPF+tTaOS3FdsTCTorAPRqkbBcGBZePOWnsJITcafiae4G8yAeSRJMia?=
 =?us-ascii?Q?wWEsWcN2VHV7IYjASPwTdx3I7DuUh9bxxTNJ4zO/jVv7+cnYYzhuULBm6KPS?=
 =?us-ascii?Q?IBr5mqEHoseNT0N09/87FjbVWnAMwx8lDCn70Y8W1WfN5NjtSkqANy22znDl?=
 =?us-ascii?Q?QO+/YI3VhvsYy4D/hxMXeT+K6jsg6o5gCfJ2AYJsN4HaDJwIBLUTGLj0jGya?=
 =?us-ascii?Q?hHJYpiBoLL+weZJODQEX+1Kwd51+458zzG/N2Ez0UctltYCX9Y7TY8EJ5Uyp?=
 =?us-ascii?Q?k3w3hVFxd19GxeLwchRmXRiLdtzoa9zeQRxyBEthpzqxDx8+t+aeS79gCmvd?=
 =?us-ascii?Q?f+VNcR6lat1adouPYJiyqWhF3b7zchhP6kG5jAphzqJaQuIfYKaq+w40EcOc?=
 =?us-ascii?Q?Isiad3J8oEnWfIAVhvo9J8xSpINRypVlGdpKSt25Hc4Cd8SJt3+V5UIocdoR?=
 =?us-ascii?Q?GM9xTfxzP6LaADCxqWafPTzlDohoBKTwWyEYtGz0v37pDkzAN1ixa1RyYidP?=
 =?us-ascii?Q?GdvRGuwoHqTZvl+4NJuZJBK/Urru/Qce?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:20:45.4874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769fc6a3-1f35-4c4f-2392-08dd4173f5b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7724


This series adds the support for L3 Smart Data Cache Injection Allocation
Enforcement (SDCIAE) to resctrl infrastructure. It is refered as io_alloc
in resctrl subsystem.

Upcoming AMD hardware implements Smart Data Cache Injection (SDCI).
Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. By directly caching
data from I/O devices rather than first storing the I/O data in DRAM, SDCI
reduces demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
to control the portion of the L3 cache used for SDCI devices.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register, where n
is the maximum supported CLOSID.

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537

The feature requires linux support of TPH (TLP Processing Hints).
The support is available in linux kernel after the commit
48d0fd2b903e3 ("PCI/TPH: Add TPH documentation")

The patches are based on top of commit
258b24fa741684 (tip/master) Merge branch into tip/master: 'x86/mm'

# Linux Implementation

Feature adds following interface files when the resctrl "io_alloc" feature is
supported:

/sys/fs/resctrl/info/L3/io_alloc: Reports the feature status. Feature can be
				  enabled/disabled by writing to the interface.

/sys/fs/resctrl/info/L3/io_alloc_cbm: Capacity Bit Masks (CBMs) available to SDCI
				      supported IO devices. CBM can be configured
				      by writing to the interface in the following
				      format::
# Examples

a. Check if io_alloc feature is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3/io_alloc
	0

b. Enable the io_alloc feature. 

	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 

c. Check the CBM values for the io_alloc feature.

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=ffff

d. Change the CBM value for the domain 1:
	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=00ff

d. Disable io_alloc feature and exit.

	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
	#umount /sys/fs/resctrl/

---
v3: Rewrote commit log for the last 3 patches. Changed the text to bit
    more generic than the AMD specific feature. Added AMD feature
    specifics in the end.

    Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
    Renamed the _resctrl_io_alloc_enable() to _resctrl_sdciae_enable()
    as it is arch specific.

    Changed the return to void in _resctrl_sdciae_enable() instead of int.
 
    The number of CLOSIDs is determined based on the minimum supported
    across all resources (in closid_init). It needs to match the max
    supported on the resource. Added the check to verify if MAX CLOSID
    availability on the system.

    Added CDP check to make sure io_alloc is configured in CDP_CODE.
    Highest CLOSID corresponds to CDP_CODE. 

    Added resctrl_io_alloc_closid_free() to free the io_alloc CLOSID.

    Added errors in few cases when CLOSID allocation fails.
    Fixes splat reported when info/L3/bit_usage is accesed when io_alloc is enabled.
    https://lore.kernel.org/lkml/SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com/

v2: Added dependancy on X86_FEATURE_CAT_L3
    Removed the "" in CPU feature definition.

    Changed sdciae_capable to io_alloc_capable to make it as generic feature.
    Moved io_alloc_capable field in struct resctrl_cache.

    Changed the name of few arch functions similar to ABMC series.
    resctrl_arch_get_io_alloc_enabled()
    resctrl_arch_io_alloc_enable()

    Renamed the feature to "io_alloc".
    Added generic texts for the feature in commit log and resctrl.rst doc.
    Added resctrl_io_alloc_init_cat() to initialize io_alloc to default values
    when enabled.
    Fixed io_alloc interface to show only on L3 resource.
    Added the locks while processing io_alloc CBMs.

Previous versions:
v2: https://lore.kernel.org/lkml/cover.1734556832.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1723824984.git.babu.moger@amd.com/


Babu Moger (7):
  x86/cpufeatures: Add support for L3 Smart Data Cache Injection
    Allocation Enforcement
  x86/resctrl: Add SDCIAE feature in the command line options
  x86/resctrl: Detect io_alloc feature
  x86/resctrl: Implement "io_alloc" enable/disable handlers
  x86/resctrl: Add interface to enable/disable io_alloc feature
  x86/resctrl: Introduce interface to display io_alloc CBMs
  x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/arch/x86/resctrl.rst            |  46 +++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |  13 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |   4 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  12 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 346 ++++++++++++++++++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 include/linux/resctrl.h                       |  12 +
 11 files changed, 436 insertions(+), 3 deletions(-)

-- 
2.34.1

