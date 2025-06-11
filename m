Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D2225413;
	Wed, 11 Jun 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677037; cv=fail; b=iVIDbyTIAgn8ZecZMLU7pi814EkT+8sG5GN7HPmt2q4ihXfKTDgDOvzJw0KLdGudllYE95HooQBGL/+kckaB0hSNzkNvLZIjDCQQNT6C22YgzktOnDf6fStFkJ3xwF5tvViFaosmoy40VTYaBvkm8FSKapwcqi+aBoDsyhasqVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677037; c=relaxed/simple;
	bh=mK8PjSg3HUn2SOTAKwkYZqkX5XrtEIXLobCozetBji8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W3bO9V7Wro2V3X4mOZ8fR98drNvmcA+ZRntkiHVOnB1LTFpsALKTPEtlQiGcbIqFvzwUVjFukvy/eL60eN6rTJ6J4kca0inIfm0LRcdhYVhIrlDA10YKGsJf/Ab5+7GxXmltxIN3Ydd/qP3U/g55Uxb+4tF2J7XzxOzCpBNxT7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xyv2oSXr; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xyv2oSXr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmAs2x7eT3UodFqeeoE7HjGW1uNO6jxglJGjtmiJht079meI9CrQDJbio84TwXKdpCHo/KVPxR1FOBuWg816Bk7RzNWlOCLb+HUhX4lFIG3Xiz7G2qeqajEAZbeS2df+xi56JohdxrGcmqIf0l+wzkDzeioV6/3kFZ9Rz9MWMGwA1YNryeGadkvCyi2nJM0nht24A/NMxX6mZB5mYtltYSL2M8lv7sKwISq2ozLFT89IaRdRJYyNwaHiWqKQoUk4NTR04iT7U7zwCXcLK6jkNBEgteTW0liAqyOOjIGOdM0XFjDiANBGZ4duC7imIC5JQPkJSuuE7hnCWZii+6QBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv1yB238ZQu10nFgbzaXByT3HXIgpXpZc+OelerRnao=;
 b=BUy06uUa+xf5Jcvf/WGSqz6dL3Gao8tsgEsMzUNet3Gb0NXMa8mlpUIqTCbHUp6+qfO8yitrYj7O3zGlV269+JT7gUOtzl5s73mQeb1b4dpVNccsbFZzct1tE2YzqF0Qc07dvH/2U8UHMvU8I+IkuL8g4B6srpAsUXHADtc+GfMkX4fQf9nUhPP5A/yL9+PHZy+zOPtr1W1gc/HGH6rAtOLGVa7Wl+qOl425O0Zi+btbcjvet9d8F0tqOQmL0ENTrCOXQ0VNU4mnnmfRN5ok2J2Z5D/sQ4K4xN1uJ17/G4c7WCXGJ5rRLwYHkT9j8psu132HPQZsYFTtZBmF+xDfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv1yB238ZQu10nFgbzaXByT3HXIgpXpZc+OelerRnao=;
 b=xyv2oSXrahdka/gdHlhUXkksfWqs5fp1176EomLVJjnRdpYQiCAso0kGjFgeraulKjkDK3mJG4T43MEpGBKCsSLasT0jxdCxRI+Vh4MdOXGNmpBBcPGy0JRvO8XcR5lrrRjr+BckYkck4KCfLCwtTVOE54vjFnKmFE0qMucyo2s=
Received: from SJ0PR13CA0237.namprd13.prod.outlook.com (2603:10b6:a03:2c1::32)
 by SA1PR12MB7271.namprd12.prod.outlook.com (2603:10b6:806:2b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 21:23:50 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::54) by SJ0PR13CA0237.outlook.office365.com
 (2603:10b6:a03:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 21:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 21:23:49 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:23:45 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/8] x86/resctrl: Support L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE)
Date: Wed, 11 Jun 2025 16:23:25 -0500
Message-ID: <cover.1749677012.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|SA1PR12MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 8914d8c1-320b-4672-7f15-08dda92e4201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U0qJ0w0PEmMDryoaZGqXF7Pb6wqlbb8+TWmPLK4tXbxZPyNZdARCctx/XFUS?=
 =?us-ascii?Q?U1hIDIgIXoPG99GLBfXxkFEWrMcFObHmq8kHCPkRYQc79cn030z7CsBbmdUt?=
 =?us-ascii?Q?8mUZcixR1xKbwN9QOZosKbldulqISCw1l9JczR/9Pk0uRb0C/QES3Pwa3ahy?=
 =?us-ascii?Q?Yt85PHKXxJMl+3VdKhCikjVwnx83oHzAUhn56pQHLji4rwnSBIejek8KsLlq?=
 =?us-ascii?Q?+DfhNOmDulONT2kKx3xEpVJGiBaaiBoq4PV23WLXp6ydHRJz88/P0FrYIsRx?=
 =?us-ascii?Q?o+ipnxYeXfq4PytUDs4bV0HkagsDTwYrKQOTbMlsyouf/0Zkfyw0GhuKfGEg?=
 =?us-ascii?Q?vIebxzHno4vsONzMNjVM7tg1pkHoNYzvYTaMoAKnYKdtxYs1Dd1a1A/HKbZ9?=
 =?us-ascii?Q?3RGwyJ6JeQu7oLam6XEkdqKb9v72nhPLkbJb8zUQQQpBIGObGGbBNkh7VjRn?=
 =?us-ascii?Q?jnn2SG5Q6QsE0brWANNIrzbZjQd8a9laVd4PQQDQkNKhBnMb39dZUePjqLLn?=
 =?us-ascii?Q?lcQaVWrAJfzevWgw06P96JPCMyFno1OsFNf4cTzuO2v3u+EZ1U/xs6EBJnOP?=
 =?us-ascii?Q?j+TEM+7Kab9GuFuiBsKwYbHINpEn6o2m8uk4H6rW8PuCYskoTvzIblTgpXm3?=
 =?us-ascii?Q?4NoZoe5SA0FubgSwoBDviR89pjP6t229WAow3upnt/KOcEsrEREeNspX+5g3?=
 =?us-ascii?Q?dlrnaz/5mUFJpCkEdb3ZTcXFgv1TZxl78+KQeRwWajp8fSdMv0QshwIkDKS5?=
 =?us-ascii?Q?hkQlLOfPysHsAgV48q79ntrnUuN2/oR9u3G2uLzOGsFf914ks1yyPJPZQSxs?=
 =?us-ascii?Q?DgrmLWe51fzzF0fK2d+d4ru7d40PrJ4AA9X2XBTVsNYAi1TgVr8uQdhs07Ih?=
 =?us-ascii?Q?LkHjqRh5FcjkFjLB2lT54v8HjUMWoOqysVuCTHj/jJ3zgaSU76PwVVwGUHhV?=
 =?us-ascii?Q?lTvPNt+Ps02hXLs88sIdsRDEFHBfWvnLlOzQgHyj/seM5Ja0sZSXuKZkxro6?=
 =?us-ascii?Q?V8VNbeZM4p/a1UNxmmgttbA6ZhsuYw/paAloC0q0RjPjDfWXhOF5WqNIwsW0?=
 =?us-ascii?Q?bc/YajwoK/jgbh56IyE6SvuO30s1As9hXE+NmdBGLirr7k71w0Ydj2aaCwDd?=
 =?us-ascii?Q?NfTd6o+5yM2v0dVs8x86WKLC8/DAaKLDwvqmduesYPBpK65Y3QfUbM3jtgM5?=
 =?us-ascii?Q?8Nna9JYX+UDR+1stQEE+UCxsJtFZCm9wkW6kke5I9XEH+hWKKOjyqu3geRFq?=
 =?us-ascii?Q?EYGARP6logJM2PnPLhL2kAVcyXwPGi97H841JArlT8w+S2xvDrUtV7bcvgAh?=
 =?us-ascii?Q?4so/e7ysGwjuhi1/AVxKQzzgkUzEIzgzI9sjIw9O8GMcr9yUI3TkjDC9sPix?=
 =?us-ascii?Q?IxcUsouxc1aKvED78wxUDhYC0KvU28vZ7ESqSU0CAys86okjFV9s5GRxAUM4?=
 =?us-ascii?Q?bwpfrQ98PRjl7TrshPO3l6Or00Z9+DADJqE6RR2bFwPSmpVvoRTRhdyykT/+?=
 =?us-ascii?Q?xYGeACayvXymjyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:23:49.6199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8914d8c1-320b-4672-7f15-08dda92e4201
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7271


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
ae3e6a17ca7aa8 (tip/master) Merge branch into tip/master: 'sched/core'

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
	0=ffff;1=ffff

d. Change the CBM value for the domain 1:
	# echo 1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	0=ffff;1=00ff

d. Disable io_alloc feature and exit.

	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
	# cat /sys/fs/resctrl/info/L3/io_alloc
	disabled

	#umount /sys/fs/resctrl/

---
v6: 
   Sorry if you see this series duplicate. Messed up the
   emails linux-doc@vger.kernel.org and linux-kernel@vger.kernel.org.

   Sent v5 by mistake before completing all testing.
   Most of the changes are in resctrl.rst user doc.
   The resource name is no longer printed in io_alloc_cbms.
   Updated the related documentation accordingly.
   Resolved conflicts in cpufeatures.h
   Added lockdep_assert_cpus_held() in _resctrl_sdciae_enable() to protect
   r->ctrl_domains.

   Added more comments in include/linux/resctrl.h.

   Updated "io_alloc_cbm" details in user doc resctrl.rst. Resource name is
   not printed in CBM now.

   Updated subjects to fs/resctrl: where applicable.

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
v5: https://lore.kernel.org/lkml/cover.1747943499.git.babu.moger@amd.com/
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
  fs/resctrl: Add user interface to enable/disable io_alloc feature
  fs/resctrl: Introduce interface to display io_alloc CBMs
  fs/resctrl: Modify rdt_parse_data to pass mode and CLOSID
  fs/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         |  60 +++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   9 +
 arch/x86/kernel/cpu/resctrl/internal.h        |   5 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  40 ++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 fs/resctrl/ctrlmondata.c                      |  41 +-
 fs/resctrl/internal.h                         |  10 +
 fs/resctrl/rdtgroup.c                         | 352 +++++++++++++++++-
 include/linux/resctrl.h                       |  24 ++
 13 files changed, 523 insertions(+), 24 deletions(-)

-- 
2.34.1

