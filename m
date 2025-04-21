Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8651D90AD;
	Mon, 21 Apr 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275459; cv=fail; b=Fkls3am42BLwOKHJFUQ3OQaygAdNy6jhubquHg3EQomesUg4IBFfThaQ+pMcz01qxk3UXZlhFIGsEs3VYWiEJwOgMsgzRqCfbzj7y10CG9QJXsbu9fwvT14/uzyo7EMxtFn4a/aODYso2BhMmwhtcg5k2ePqOgzdtoFBAUxRrX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275459; c=relaxed/simple;
	bh=R0mjWVBOhzd5iwZIgV4MRtDXtXN1T/knIf0jcwNHtZY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XjemsmIaUk3DIgPVAXZRhnx/i0AhuGxvi0fQmNoO3tCJhl+LNuZ9gIAjrCiD5kBB9ez3z20NeeV4Zk946rzSM6Qk0Y87YMizauksBpz5R1mFyKCIeeUZawk1ZslxlGNlDZvfKX5+spjG2f7jtGvqzGylEi3dOE6qCAOGzcBBr1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jUEM8I7Y; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jUEM8I7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpDcCzm9jscLM99S74F/lYBn/t2+N9LLkypfZl7AtJ6FUqie5kG7SKlqj9iPUc7NASEhXlu1oZlsX1W7V8CB4+ycYBR1nxhhC1zEvFg4YvRojtp/biPPhneWeORjJ+JkiEzpkJt7DaYQzNhIWiv3da46CFzk6r69dwe0so4y6v4SliIVb6+rrWCUpOllG4F+iUAkvVCRs3baxiWLeOADj2zz3s+A4hc0jHY3SbdtUBXfWsSpSDDKOjaFtIuf9Pe70VBek/OCnWcug8d38hdEeGRw2ai3DrfzEDA5AsjGL6chwjlTcJuajiV3h4BX6xFTp0jO4jKmxD6t6+m5zPgmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLsENG1eHSNJaNUMHCR/j6mo4ak9sZ6yav8Qqvzn1NI=;
 b=aoVnMFLf0YIkotTb7kFIxocSzUPmAoK7PVCkio76z895JvlurnUpQ9KLeqrrg5u1enzODAK4vHxJ6sKN71w6gTcAdudAcS9HvQ64BowKBYYcBo0fyLB8BuVKKh8AP9SF/LglJiC9iA6gbzpYs5GvdJoSUt5Kvih2yRtgZb7a2MeHG+P7Fueh6ilrYl61QgkR2g/1/x1HOqgTps0v4Ul3rAI6msuheXyhem4aYVoMpwuRdZtYJQNNyo/KSqrFbq2xbQzxv5Le7WvwH305HqHHQu3IvxBPbBvJ8x06YTIOkdY9ZcAzCoU9gHz/OWDtmFIXAuVsJmzOt3NUNaEICTJfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLsENG1eHSNJaNUMHCR/j6mo4ak9sZ6yav8Qqvzn1NI=;
 b=jUEM8I7YeaYIMyx7Pe6VzX2AjOQf6KlroxBJ0GAK5FUyCrsbZa5GqN1nvN/wlR5GMCVYh8UpJ8eHnXst7U4KWhch6qTW04f+y/G0h2zPqSYfzgYH9vkydTeCM8AyF7goEg4ZgkGn5FpsrxqUQf0doSuu0EvMWm9PGkV6a+cLoio=
Received: from BL1PR13CA0335.namprd13.prod.outlook.com (2603:10b6:208:2c6::10)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 22:44:10 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:2c6:cafe::23) by BL1PR13CA0335.outlook.office365.com
 (2603:10b6:208:2c6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 21 Apr 2025 22:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 22:44:10 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 17:44:08 -0500
From: Babu Moger <babu.moger@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
Subject: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE)
Date: Mon, 21 Apr 2025 17:43:44 -0500
Message-ID: <cover.1745275431.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 520e5644-ae86-40ec-e79b-08dd81260830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GJ0ynsRgmHcE2M31fQrgC4PZ0ewBJWRtoJB8peOWH+kpQ4G28HL934k9fjp9?=
 =?us-ascii?Q?MTGpC1+UmwxqTjzZCnxr5jLsBGH8MOt8RilCw0kns8ENUB9k6MjgDFVL+PLQ?=
 =?us-ascii?Q?2/aD12Roi7HAOjYHlVAyHWHr0V3GK0yl7fwG82MT5e5pjwl88+2qifdA+Vbn?=
 =?us-ascii?Q?q0EbR6VgQafLfkdqNK5FQ9o3ulpfu/l7AwCfV6OzEjWeWASu/bE5XOibj7Yt?=
 =?us-ascii?Q?cmXsr1W+NHi+UpsECYXmX5IQGVhC1fLf5Hsv6sfTQcOhRNFvx2CLuNy6DaC9?=
 =?us-ascii?Q?HqmxkwwoUyEDSS9SczclA8QnbNLn9JTU1YGN2z5HujpZPnOTmKvYPsRAFN4x?=
 =?us-ascii?Q?uTSYFwlaacKBVHYkOtzqDnW33X1r81xt0saz7pXuN8b3uEvLXTLOXN5GiYHC?=
 =?us-ascii?Q?glc1go4Qv7IPWzSLUbMW8zGJnSAnhnzSVlgtgCZydYh3guUAk/Eb9mUCKecd?=
 =?us-ascii?Q?hKJ7QQoyyp9/lPyeDRaaO3yBvGqRKpEFe21G2lFsT3ioXlOBibWlBBa0sK05?=
 =?us-ascii?Q?OCauvLBP+QUUP1/EDs18NIxHFMl/2vivRHd0Kr0fUtchtNB8GFlu6R8joDM+?=
 =?us-ascii?Q?p7mtZAYbWZ57Ii4tTua8xNxc0t9PGg9wM8578xwctvV3xkHygTVLqPJuvUqj?=
 =?us-ascii?Q?UaH/nQL0DaXyqePdCn7UeHFcOr52v+LQoraVjEffRZucfW5NGiAcjSXog7uH?=
 =?us-ascii?Q?ht9p5JqUp0GqzjPMUBhiVMnvwz7Ztf5sfy3ucjJ1ajIpfSgezrUtbKhtWeCd?=
 =?us-ascii?Q?MQpjWP8QpnzbPOmanhmmqN8NLhgZSz2PRePrK+pav2N5A0Cey9PBa7YxPFFO?=
 =?us-ascii?Q?Tf6mJ8ZPnczEykoyrRUWoL7sEK/uFmMUBq8W5aTKcoInypjMGsgg7/9sqVjZ?=
 =?us-ascii?Q?0HanGm+VOtKyYIxuJM2MG3mKMmH2RVlnD5yn+fIm9sNvHivsc61B9sVjaaEL?=
 =?us-ascii?Q?/bvrv++C6En3tUS45l8cd+sF1QotIFBpGHsiibXWN0DIDwIQlhsnNp4wDozC?=
 =?us-ascii?Q?uvr0myA3x86HGiAXFfeRoYc4uY+s7zZu7UDX9zEb/3NT35sJeS48VM9G7szl?=
 =?us-ascii?Q?rfYNW7Jl4kHxrQ7jESBovSJo5CNkW2t/mUjajfyv6vU/RmRR8NkE+yzucOn4?=
 =?us-ascii?Q?HGtb51+tKIDIv0iI7oB82PShBY4TWZtceavz/OsweoLKFvrIigHnqiT5tLZm?=
 =?us-ascii?Q?Cozq3Xa6UINO+G4yk+J1+MUnqYmRyilTiw20B9amZn8Kvmd/hCjNqaqvTUG/?=
 =?us-ascii?Q?bCMr2hF78nJ+W2ON90COC2k2PqJFWUtX/rfixA1h4MfmI9HbuaBz4FZhqCAF?=
 =?us-ascii?Q?wgTMXoaXYdoz37sJBGRz8HUK7olsgVRFx69vfor/oyhJxdf3x5dv/xeDxP4O?=
 =?us-ascii?Q?wQL5DTpBmg9pTHCFgIPOCw7S1O2U6r0LTdbuLcX5DsxpTabp/T5JbU66RxJk?=
 =?us-ascii?Q?e+suffMxHSOkZMDeCD84dszXACPVV10bdpePxBaVlL0LjfUm64vcuCif/Ak8?=
 =?us-ascii?Q?1kHniEO4UeripF4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 22:44:10.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 520e5644-ae86-40ec-e79b-08dd81260830
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592


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
84c319145cbad6 Merge branch into ("tip/master: 'x86/nmi'")

# Linux Implementation

Feature adds following interface files when the resctrl "io_alloc" feature is
supported on L3 resource:

/sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
				  feature by writing to the interface.

/sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
				       for I/O devices when io_alloc feature is enabled.
				       Configure the CBM by writing to the interface.

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
 Documentation/arch/x86/resctrl.rst            |  55 +++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   9 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  35 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  19 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 372 +++++++++++++++++-
 arch/x86/kernel/cpu/scattered.c               |   1 +
 include/linux/resctrl.h                       |  12 +
 11 files changed, 487 insertions(+), 21 deletions(-)

-- 
2.34.1

