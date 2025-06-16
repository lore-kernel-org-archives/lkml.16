Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138F27FB29
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081200; cv=fail; b=htjMCKqJuFReBKCtVwO06BCfgWG9UKVB30+zz+79bxxD+XVrHBwQn+DVydBhxgAF63yMNAT9x96GG06mL2JEgcfXxMsCKmDke7PThVBMVWIJM+ObReDPmKRn5Ab6ILpKyt0LoSxOz9olivwS339DhB4a3CMRWAimC+8dKU/i7Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081200; c=relaxed/simple;
	bh=vGl1xP7JBBLVP93OGxFVoSm7AfA1UEUY0kZcUpT/iJg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q3NoCHK/pr/LhS8CrHxh+nsQFmkI/Sq3Rl9LGVFW9rHS0Uz43Ok3a2ym6jLkWfkq5+2FMYqeSPjOqz8wgTVI5vTxuV84W11bvN/w13/I2I6icucjh8WSL6JuX5MgtwM1FsMF6YqIuNPE4eULcNeNuDT1+KFuo1PF4/KPVS8pk3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xwp29Wyx; arc=fail smtp.client-ip=40.107.223.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xwp29Wyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8lYxWgDamtRESSKvtkbvqumsKgPAhFfB9Iyt1iY9Pb7eegDQr5MCIxijmxqNMCyX2+mBR7NNR0koJoZF+Gx2NFDWRSvXaYbrEoUzKkqBX1QBn9lGRNoTxuXEUmTyeChAkaBEjB52v/W5U83MwdSGlKmMVohn8pMLqK54OEXkqEEBMe6wZZIqFK9r1Y6ndh0UWZjG4CLQHGBEW3heu+KPCgyWJDWCYVFt4zccjRwEphb0qcuV3f99iABlVcoSDogAEd4dT3iN5QabIbEprH6hGzKEdivuWPc9ICvJq58LljD9WLFbJFlPqsDJSU9Kmd76hsSmyGYdh0IV/4Ae/29Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjDy4IRTU7exOecC7/zSAJwKFSxStpSct4vxQBUO2vI=;
 b=u814Uy1kEKE31JYAjfa6ydSr+OUHZfSY8hIt0nrFKEf/tZEYwOMFN7gsuPP0pQaRKbwGltSAjcY5CFhEkiUCAEoEjmLXm/H/wnxO9k1wfPALoS9yGNhhjPdF6ThCNEDejoyrp5qieInJokofYi1SwcgUFJy099M9OWracoJXEKEiGmusUdY1uimEfS8QHFiWrCRuuUh+9THf585Loc2GcpE45q18dEtWlmICFf+/OwoRbxxWJCmWs96j9OqcfTOKUXXI1xfhK2qgwiPhaPerUNvn4sd/PGaxCLrTmsQ3+FHTuUf1yWPOSSUs95FY/hhsQlMoinWd0/kDB8wMao+5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjDy4IRTU7exOecC7/zSAJwKFSxStpSct4vxQBUO2vI=;
 b=xwp29WyxoDaYO0quwoKp4HefUw4ZEHi3JBHcpuDVuEvMEBEFGINrHEKQFhxVdMeWRLZRi/ZSVxI/lDJF1Lhb7mwyyNsbCI8FRwoh24Pyp4ekk2fiBoUE3a1/gYRs3ygWueXEtdnWhsuOkQNomCQM7CpReQeIgQRRyR1FXnsjG7I=
Received: from DS7PR03CA0272.namprd03.prod.outlook.com (2603:10b6:5:3ad::7) by
 MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 13:39:52 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::56) by DS7PR03CA0272.outlook.office365.com
 (2603:10b6:5:3ad::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Mon,
 16 Jun 2025 13:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:39:52 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:39:46 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<xuezhengchu@huawei.com>, <yiannis@zptcorp.com>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <bharata@amd.com>
Subject: [RFC PATCH v1 0/4] Kernel thread based async batch migration
Date: Mon, 16 Jun 2025 19:09:27 +0530
Message-ID: <20250616133931.206626-1-bharata@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6b8266-d467-4406-6b7d-08ddacdb45cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hmKBcT16acdLeBbpeQKn+zpMeMuyriKdY3is6HejRKSftXiB2er/eDVBGM+q?=
 =?us-ascii?Q?yEp7KdMK6N2eHNV7+Tm+WwEJvKxQ8FaBJ0A4qULfxU/b3WjQiw1jOLYgWLxk?=
 =?us-ascii?Q?R3F6SJbK685lJy8XdG8SKsaSxjdWEgQwDcTlmHLorysfjOhnAWvwrYTnYSJ8?=
 =?us-ascii?Q?pDHx2hUYsFiQx3CD60QlXSMQBsP5srf3JZTIMJw7HvRaljt+87bfNzNmswsF?=
 =?us-ascii?Q?BmvlWmye9jxGwTC6VxjJOGoSlhc32GzKn09yDW0QfEwWvvRitYtBgSWmFO1Z?=
 =?us-ascii?Q?2ymcFAitvAPiIc6M9WAKk7AaVmtJXvGa09BF2wyu/i9asC60rVynEzoUbQly?=
 =?us-ascii?Q?Va2eEq5RuehwjK44l9rLGC5FO+AlyzinAqMLi6L/PWwkixbUFXVXoLdoISvf?=
 =?us-ascii?Q?2hTJvKdQlKHwqfB8dQEqG4BgP/oXr9VZBJMalODzAllRsC5pA6hpLGtrFBFQ?=
 =?us-ascii?Q?zE1YwFPHIdvOmBwxCrnlJY+z+Q0C0+uKoDZ5Ainfdv1t5q8SWVr1MunJxKow?=
 =?us-ascii?Q?Oy1jqKr6ZUm9S0A0OT2ZZ9LxGUtTCxQN+Il1qWrfK56GwxHA7PDN4R9+E/kW?=
 =?us-ascii?Q?FYNP+GIbt0g0FhQPFL/GbkZFamyuDKVsLXtK9ioe7IyTOuI+HvMGkRJaptE6?=
 =?us-ascii?Q?Xeq7SHwGvnTuKy87FHby/q4+r/QNkcUZ7ptQ6cgIJx5dfp9TuhxLj/CIkV2R?=
 =?us-ascii?Q?aADxGhmx/AXEAUSCIBAqCJNVQIR/DIZDUml/qtj6pldQ/9n+WONyl0alCrCm?=
 =?us-ascii?Q?fg8RWdhpjWQgsgfeYIF7b55jN+uwFlk5mv482fzk7Df8bxEg59iIHQ35VDHL?=
 =?us-ascii?Q?qhJPqKbJ1DOTSpytJ9OlFO6FyQ49gzjHmPwHDMwx82BPN11FntdigDg26632?=
 =?us-ascii?Q?kYptK4asHt9OkutjbSGYoosbtKLeyUCS3OuWdbElkWqLmoS8Sgp8RHzIZOud?=
 =?us-ascii?Q?c7itgkhg+jx4mI0/7NSr+tDyZUFZLcKFam8c/8dI5dQQsZPEp4Q8ryEtULyh?=
 =?us-ascii?Q?WXulaiS3SMRJrP4rFpEZMC5It+tSQxUS0mXdgHg7UrYMZEd+ZnNg2MlJ87vk?=
 =?us-ascii?Q?8ThxwihyRKNbwKPVOXwwYvkd6BBbrU0ExLPkZwteafzz4CRY922PFV6Mh0fB?=
 =?us-ascii?Q?66D5UsJCzpTcxw+Do/tL/Nxm8/BbjWTrLyS2xdlWyAgerO2j6hrievt3XJM7?=
 =?us-ascii?Q?WdbY0SJAytPG0HvXXWhs0mrwJqXRVaZ3OlOkScNx6Y4/vMmrh4FI4w9vIQq+?=
 =?us-ascii?Q?3jggPt4BJ83t6EQdz7GhAN9wIstDC7xyOcd0HVG4PqkR+0L65MjUIKnu8Fgy?=
 =?us-ascii?Q?mfjok0zo4wEutHrnQlIyfqTv55r7e6TFh9HMGLij1QwxefJXm5HKMIG5HqBj?=
 =?us-ascii?Q?beENR7ZMYyE6E/Bjbyl1Dt3HTlOJG/aYptCC24rRkuvhog/ldMoGFP0asHmF?=
 =?us-ascii?Q?s8D9LvzAG8SGM7qsZ3DfeRXeut5ZS3kI4lM8gxRaAzdlsRwT4fTkVq2wqPZj?=
 =?us-ascii?Q?+4pmIyFYY2qQ3iXgemuYUnp46gzRzHJiHqxOy0Mc1MEDeXm+Qz9YJGN8QQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:39:52.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6b8266-d467-4406-6b7d-08ddacdb45cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

Hi,

This is a continuation of the earlier post[1] that attempted to
convert migrations from NUMA Balancing to be async and batched.
In this version, per-node kernel threads are created to handle
migrations in an async manner.

This adds a few fields to the extended page flags that can be
used both by the sub-systems that request migrations and kmigrated
which migrates the pages. Some of the fields are potentially defined
to be used by kpromoted-like subsystem to manage hot page metrics,
but are unused right now.

Currently only NUMA Balancing is changed to make use of the async
batched migration. It does so by recording the target NID and the
readiness of the page to be migrated in the extended page flags
fields.

Each kmigrated routinely scans its PFNs, identifies the pages
marked for migration and batch-migrates them. Unlike the previous
approach, the responsibility of isolating the pages is now with
kmigrated.

The major difference between this approach and the way kpromoted[2]
tracked hot pages is the elimination of heavy synchronization points
between producers(sub-systems that request migrations or report
a hot page) and the consumer (kmigrated or kpromoted).
Instead of tracking only the list of hot pages in an orthogonal
manner, this approach ties the hot page or migration infomation
to the struct page.

TODOs:

- Very lightly tested(only with NUMAB=1) and posted to get some
  feedback on the overall approach.
- Currently uses the flags field from page extension sub-system.
  However need to check if it is preferrable to use/allocate a
  separate 32bit field exclusively for this purpose within page
  extension sub-system or outside of it.
- Benefit of async batch migration still needs to be measured.
- Need to really tune a few things like the number of pages to
  batch, the aggressiveness of kthread, the kthread sleep interval etc.
- The logic to skip scanning of zones that don't have any pages
  marked for migration needs to be added.
- No separate kernel config is defined currently and dependency
  on PAGE_EXTENSION isn't cleanly laid out. Some added definitions
  currently sit in page_ext.h which may not be an ideal location
  for them.

[1] v0 - https://lore.kernel.org/linux-mm/20250521080238.209678-3-bharata@amd.com/
[2] kpromoted patchset - https://lore.kernel.org/linux-mm/20250306054532.221138-1-bharata@amd.com/

Bharata B Rao (3):
  mm: migrate: Allow misplaced migration without VMA too
  mm: kmigrated - Async kernel migration thread
  mm: sched: Batch-migrate misplaced pages

Gregory Price (1):
  migrate: implement migrate_misplaced_folios_batch

 include/linux/migrate.h  |   6 ++
 include/linux/mmzone.h   |   5 +
 include/linux/page_ext.h |  17 +++
 mm/Makefile              |   3 +-
 mm/kmigrated.c           | 223 +++++++++++++++++++++++++++++++++++++++
 mm/memory.c              |  30 +-----
 mm/migrate.c             |  36 ++++++-
 mm/mm_init.c             |   6 ++
 mm/page_ext.c            |  11 ++
 9 files changed, 309 insertions(+), 28 deletions(-)
 create mode 100644 mm/kmigrated.c

-- 
2.34.1

