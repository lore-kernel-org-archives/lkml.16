Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BF1F5846;
	Thu, 22 May 2025 19:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943531; cv=fail; b=bgjxi7NOXpTNfQ+gvxIDUao3GIdJMeWRurvQht/yqFG/x9SisypBSFuEW+vTNaa47RfjmUWIcPMFOrV3HNwAc8ZrXalT+3XDntDkQPCwI6K7Z3tI81z1pM3VLLXtVH23iBYcG2zVCLH6fj+ahLmG3ArQIIAWaYQHlNx1FNVHH3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943531; c=relaxed/simple;
	bh=4IICiWUAI1h9MlZ0j5byA5pvnqt3eijbB1L3Imyeicg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kt3LI/8jz59T+rLpQ2dPpAhs9wiQiL1TgwUpg/lBCdTv/4FI3KUlo5tCZMn1SyHFZuWq6eaOPHoWbXKkBAISxdYWeMKqk4ahA64WGQU8cwiGJ9idpYqAE/X8FHUVj/3x7F23XXH0fHVZJyvvM2+vWkGdCYvgwDBASRGaXAPVWtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QiLRspDW; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QiLRspDW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf+jzRxMXK0d51oBQzm7tjjmYBXSh0RDP+UuDKVwC18bKbFFZOmHm41iPNlHdN7ItpZZ2YqPDp7U7mf1+roLcscTj5oXKKGTlTM7LH05Ve59l6f0pBKfqObapGID76Ub81sp3NOkdhOVtalc05gktzy0zRLOXQtgZYy3USqNghF7Nd1teZQPPHtYK+tx0YXG++OTFvLhAVxgbHmovkMo4OHKqStRVaehCJ2IUBqR1anI0WET6+9bvEhPEDE+5ZZ/T8l1RXcY+XD/Js32FMhjcZPj1KKUAXSxI1619HIdL3mJfjkeJtQjf0QJuj0HxY8ETuQUr8MBUfczWkHppi1hcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0WXRmxGZ96Ny2yWyzClmy5ELOn1P9V6MI7EwS4N4tU=;
 b=HMqpevf1E7RMBS0OlfBplS9QkhkFiIOZpZLC/ttq9Uo1ZM8snr5bBuP8E8ROhBVwBWCrIS5saeRK9fPxQfGLPa+OtKta7udfNaGQwReH9VNDaB3vcdFSD3ikm3LNOzfpCKNhkUB1QJ1KSDn+GnKe9ohNPqHiAG48WEbw2OXiuQ0iU9lFs2stMPR0QIwdltzacm1yE87UkGTRfBrzrI88PG073Fhhl4nrHRsOftqOrQ4RN0+hDd25tAllKnc26VEfP6a81/Qd1zEh7GIih9bi2zHDfnZMtHSNDZiSYIpbgjkA+UAIM1whzeioJ2bwXxU8hTLDJQuumaZaSxY3JEMMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0WXRmxGZ96Ny2yWyzClmy5ELOn1P9V6MI7EwS4N4tU=;
 b=QiLRspDWn9oJ+NOP+E8CQrEhByNe+wR2zJooG77S4qlRt0KqkVI7//ldjnrGreV1Pgwk4vphxlUs+ETiWnEyB4eokiL1OVqKNeiYk5LIg8yf0OvYdE3ClcqdYrSj+ZcIvwjzhWgt7o/4K6+sDFqJrpM3S/3K+j/krzwQm8F7z7c=
Received: from PH8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:510:2d1::20)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 19:52:04 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:510:2d1:cafe::ba) by PH8PR22CA0008.outlook.office365.com
 (2603:10b6:510:2d1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.34 via Frontend Transport; Thu,
 22 May 2025 19:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 19:52:03 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 14:52:00 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <thomas.lendacky@amd.com>,
	<seanjc@google.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <nikunj@amd.com>,
	<kan.liang@linux.intel.com>, <xin3.li@intel.com>, <babu.moger@amd.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/8] x86/resctrl: Support L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE)
Date: Thu, 22 May 2025 14:51:31 -0500
Message-ID: <cover.1747943499.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: d089a802-0984-4175-9a86-08dd996a1fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JSZuXBh1yHVyA4rGmMWzeqiItloxecV+gbKCMjTAl+GsJVW1L4Lc/+X6pnuu?=
 =?us-ascii?Q?piW0q5VV+VZN5KwWZVS8HRkphPz1XG/866HqFOtDtQHbGBHqGqA30gS+M5Hz?=
 =?us-ascii?Q?TiwhBMpzWS1MCGczDrN1xdgph8nxsNpIUmjf5iYjsKpRznYQfnkZunOAe0yT?=
 =?us-ascii?Q?X994lwSLkgDuYVx4LZGkFnupkh1vcYS6orItTUh/XZfUmytxkXlU2UEv9L20?=
 =?us-ascii?Q?ACBlLQhnHuTdr3VFCQIaCIt3ZNKjWuRopTqkzw6iX3Q/OuQ0ndIlDoKwrTuE?=
 =?us-ascii?Q?3y5RmLHbPEnlDprrsMLBKyzTCHwUhG+xNo+HGhfl0TeNKP9tMFMCo03IzuR9?=
 =?us-ascii?Q?liRzJ0ROKqKgR4Y7xdLmvVGW0Zf6XoWDFG4zV3rDMLHLMEBx6cRIPErnYXlg?=
 =?us-ascii?Q?c4CsvBJXybYkb1E1/825OXruH/FzMQ4cMAUlIIdeQVCr0Xfus5ryhHHnyUFe?=
 =?us-ascii?Q?AWS/LlRAgZzw+K4lStncHAgbZZkGZHWmlEfksgzxj1CIBAnAbYkVFReR8MUm?=
 =?us-ascii?Q?nsL8cF1dF/dek2ZZD/ZWssdgCa0aK11QSp7Rb7OcEDA8lbODS9nLAXklS7ZQ?=
 =?us-ascii?Q?Lq/PgSx+CP64Wrh7be9DLKrmL6I8XFL9l4PYlIZNEVWC97MPF5be+qSlHcYe?=
 =?us-ascii?Q?qd5oUA3FYEEdPEr2GNTkd61L/pFetTe+30QUgx/1VE8KDtzIkRATtA/8a2pf?=
 =?us-ascii?Q?LavFkUeg9kbXaNJkVk7cuqSG7j8PyH6c6H1QHO74HVUQiIiDG8RbAxE+SvTH?=
 =?us-ascii?Q?PU1or48C+NGIQeEbyBNJe/1eT695FvQkC9akQER/4qaVFBp0KDkNVw5eSD/1?=
 =?us-ascii?Q?cVxTZI5X33MLuFJtHQnIxLRWl+gUI1i2a51p8ViW4dgozEaFr6lzjYQUwvyD?=
 =?us-ascii?Q?CEeUW+5JfiHkvGM8TGzRtRaWyyyKTn9aMxDYbYuQjI8zqkJyPP+Ty2rJpmGq?=
 =?us-ascii?Q?CgZiThZld6nmy8VUDb92St39EOZTCXs2ha8aIsW7vYUjUjGjde9qabFjwIqA?=
 =?us-ascii?Q?Bw0G7jwIzK9Eir3xBswY52skwAAYZjrDWk+2ohWEfKoEAkmnly1aeUhmbwlf?=
 =?us-ascii?Q?ne1T641EDtQ5qRbnIvp3aOi9m9nDmZsWhSjwGAo7UZr9vpVjws1xlqMnrflP?=
 =?us-ascii?Q?XIoK8rYcSokF3f1x/VTeKSFvTTQbebdXUI4cxo3yBwaEEv5IXdfhmjkIWDkl?=
 =?us-ascii?Q?nlxvv4o6MqCpvitTrMK+f9aSIG/KMSlsFJiANdBKKAxpPqmUyh1jh8pIVy02?=
 =?us-ascii?Q?693XgCtYNWPUhpolcD9QASGjsNMFqeh40PpUHG8t7mGQ0HIKvSoZqfeGrN3I?=
 =?us-ascii?Q?whBREVUE9cIkOXLabfqE8IcgQMLoDkH6RGY49/0X/2F5d4tIUzJ2XgQ+bwBX?=
 =?us-ascii?Q?oAmATNeRqWayRjbfCN6C9StzHqbQVAiEygYNvi2rFY86VMaH82dMmVuj+NXc?=
 =?us-ascii?Q?/Phf1Bi0kUKuC15ttoF1sZnY5GFEtKY8Xlx8l9XnS/TWLZD+o5zsfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:52:03.6477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d089a802-0984-4175-9a86-08dd996a1fed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511


This series adds the support for L3 Smart Data Cache Injection Allocation
Enforcement (SDCIAE) to resctrl infrastructure. It is refered to as "io_alloc"
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
54d14f25664bbb (tip/x86/cache) ("MAINTAINERS: Add reviewers for fs/resctrl")

# Linux Implementation

Feature adds following interface files when the resctrl "io_alloc" feature is
supported on L3 resource:

/sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
				  feature by writing to the interface.

/sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
				       for I/O devices when io_alloc feature is enabled.
				       Configure the CBM by writing to the interface.

When CDP is enabled, these files will be created both in L3CODE and L3DATA.

# Examples:

a. Check if io_alloc feature is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3/io_alloc
	disabled

b. Enable the io_alloc feature. 

	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 
	# cat /sys/fs/resctrl/info/L3/io_alloc
	enabled

c. Check the CBM values for the io_alloc feature.

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=ffff

d. Change the CBM value for the domain 1:
	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=00ff

d. Disable io_alloc feature and exit.

	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
	# cat /sys/fs/resctrl/info/L3/io_alloc
	disabled

	#umount /sys/fs/resctrl/

---
v5: 
    Patches are created on top of recent resctrl FS/ARCH code restructure.
    The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
    Resolved the conflict due to the merge.

    Updated bit_usage to reflect the io_alloc CBM as discussed in the thread:
    https://lore.kernel.org/lkml/3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com/
    Modified rdt_bit_usage_show() to read io_alloc_cbm in hw_shareable, ensuring
    that bit_usage accurately represents the CBMs.

    Moved prototypes of resctrl_arch_io_alloc_enable() and
    resctrl_arch_get_io_alloc_enabled() to include/linux/resctrl.h.

    Used rdt_kn_name to get the rdtgroup name instead of accesssing it directly
    while printing group name used by the io_alloc_closid.

    Updated show_doms() to print the resource if only it is valid. Pass NULL while
    printing io_alloc CBM.

    Changed the code to access io_alloc CBMs via either L3CODE or L3DATA resources.

v4: The "io_alloc" interface will report "enabled/disabled/not supported"
    instead of 0 or 1..

    Updated resctrl_io_alloc_closid_get() to verify the max closid availability
    using closids_supported().

    Updated the documentation for "shareable_bits" and "bit_usage".

    NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
    handle bit_usage for specific CLOS. Its about overall system. So, we cannot
    really tell the user which CLOS is shared across both hardware and software.
    This is something we need to discuss.

    Introduced io_alloc_init() to initialize fflags.

    Printed the group name when io_alloc enablement fails to help user.
    
    Added rdtgroup_mutex before rdt_last_cmd_puts() in resctrl_io_alloc_cbm_show().
    Returned -ENODEV when resource type is CDP_DATA.

    Kept the resource name while printing the CBM (L3:0=ffff) that way we dont have
    to change show_doms() just for this feature and it is consistant across all the
    schemata display.

    Added new patch to call parse_cbm() directly to avoid code duplication.

    Checked all the series(v1-v3) again to verify if I missed any comment.

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
v4: https://lore.kernel.org/lkml/cover.1745275431.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1738272037.git.babu.moger@amd.com/
v2: https://lore.kernel.org/lkml/cover.1734556832.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1723824984.git.babu.moger@amd.com/


Babu Moger (8):
  x86/cpufeatures: Add support for L3 Smart Data Cache Injection
    Allocation Enforcement
  x86/resctrl: Add SDCIAE feature in the command line options
  x86/resctrl: Detect io_alloc feature
  x86/resctrl: Implement "io_alloc" enable/disable handlers
  x86/resctrl: Add user interface to enable/disable io_alloc feature
  x86/resctrl: Introduce interface to display io_alloc CBMs
  x86/resctrl: Modify rdt_parse_data to pass mode and CLOSID
  x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         |  57 +++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   9 +
 arch/x86/kernel/cpu/resctrl/internal.h        |   5 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  37 ++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 fs/resctrl/ctrlmondata.c                      |  41 +-
 fs/resctrl/internal.h                         |  10 +
 fs/resctrl/rdtgroup.c                         | 350 +++++++++++++++++-
 include/linux/resctrl.h                       |  18 +
 13 files changed, 510 insertions(+), 23 deletions(-)

-- 
2.34.1

