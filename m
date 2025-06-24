Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193622CBEC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744618; cv=fail; b=o5NkXsuVRkPq5Quk53qqrPApmNvEzOog+rG52JG1BW0FWxpnazXYZ0S3GraUmEIZ+G+yeV/ZXWkpUJ2jG0VN2CBmVMy6hOQhPu1X1JRSxosnYH+O1ldfgxPJZqdK/tQDu48x8P6EZ1e0+pFxZGMV2nvz/tBTNmWKVjch5a7ZsnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744618; c=relaxed/simple;
	bh=fxb5ae8g5mPVafqsJ7+9CZG0aOyF2zQKKblKnMSjvJ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RF4Q+y3mWM3QHG/wf+BEYcg6Bb+TDtkG1C28tiGbuXJHEZHBBsESdlwUUXpPIVOiK1fMzvsDnrHpe3l25BUVuzCspwG5OtXU6FiCvFxg19Zby45KaRJemyRIC8xtjwJXyZweAgy0daYUXZs7dTiIXHhIKfs+dmUM2QCx5uAzkqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2x+WkQl8; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2x+WkQl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8Plf00RAig2XHnGf+TrCMHKLx4iTNUJGGKKTQ/o6LeorVJZNvKQPI9SsMORPfGu9PjKRMacLWr4eIuynChEk239AYJ1huyDfdIVA2b8apFqrro6PfaVDJDvPRrApmv5M/8wxhvzuKtUBbtZh3VPEYT91oc5U+czOpu865Av2XotQ/AVxtOK2djFR2NI54e/hfcP23mZEcp28Fpt9sNdq+Y0JvoAWJFfaaS6m5X5IfYt+BK/kcTEtxUSE02KGS1qGWlAjgOlmjxWG0nesy/v5GcQhA0xxlJdQGjCxaqcsLTfPmCbbLy9o/KDKFFZG6D45LqktHSy5egKuO1cI25YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFnV843SqPL2CsqEc9SVaC2kc1+HI93KF7rqnVVnHbY=;
 b=GG90/mNps5Eg7fR5OdEdDoTX8E6GBLyp8eK6KvciRvzA9Cza3SG3AJpABD01OiOAzAFehRKo4xy4H30zIvTVUbaDaxG7FzS2BRq5mInuZ5jkGpFcmHwT9T/OJNK0ryZFf+fC/o9RcwLA4gvC7EtGaiK9UEWkwDAlgaFqu8281Lm7l1c51vnZ1J2l1bRj3e7KJ1zIq6WzvNKWpuE9uFw6TFkManxX7QnB+W4UmEAFylKcKv0TPC1GVV7xyPplC5CLU88rC9BOjM3Kofsc1phR6jVR1scUn7pL+pxp6c8r/l2LIL1qFbdx7yGcXoDlRkeZXBCk4q9ODYxH9nqmyRtjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFnV843SqPL2CsqEc9SVaC2kc1+HI93KF7rqnVVnHbY=;
 b=2x+WkQl84sy7W6IkQRmEfzUJBRw20iIOjcjdrK0C9LcmYhM5D7X0ydkbPTziAAX3urq59yNpVIgcbOG5uxx6C4HfSt4j8JYFFuQE9oYzhEiUv1bd6togL928KGjSSwSgaHjem2FnAgZOYEFiXzhZ4YB2PHUOadRTQ40JoVpGjNM=
Received: from BL1PR13CA0309.namprd13.prod.outlook.com (2603:10b6:208:2c1::14)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 24 Jun
 2025 05:56:49 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::25) by BL1PR13CA0309.outlook.office365.com
 (2603:10b6:208:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 05:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:56:49 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:56:38 -0500
From: Raghavendra K T <raghavendra.kt@amd.com>
To: <raghavendra.kt@amd.com>
CC: <AneeshKumar.KizhakeVeetil@arm.com>, <Hasan.Maruf@amd.com>,
	<Michael.Day@amd.com>, <akpm@linux-foundation.org>, <bharata@amd.com>,
	<dave.hansen@intel.com>, <david@redhat.com>, <dongjoo.linux.dev@gmail.com>,
	<feng.tang@intel.com>, <gourry@gourry.net>, <hannes@cmpxchg.org>,
	<honggyu.kim@sk.com>, <hughd@google.com>, <jhubbard@nvidia.com>,
	<jon.grimm@amd.com>, <k.shutemov@gmail.com>, <kbusch@meta.com>,
	<kmanaouil.dev@gmail.com>, <leesuyeon0506@gmail.com>, <leillc@google.com>,
	<liam.howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
	<nadav.amit@gmail.com>, <nphamcs@gmail.com>, <peterz@infradead.org>,
	<riel@surriel.com>, <rientjes@google.com>, <rppt@kernel.org>,
	<santosh.shukla@amd.com>, <shivankg@amd.com>, <shy828301@gmail.com>,
	<sj@kernel.org>, <vbabka@suse.cz>, <weixugc@google.com>,
	<willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <dave@stgolabs.net>, <yuanchu@google.com>,
	<kinseyho@google.com>, <hdanton@sina.com>
Subject: [RFC PATCH V2 00/13] mm: slowtier page promotion based on PTE A bit
Date: Tue, 24 Jun 2025 05:56:04 +0000
Message-ID: <20250624055617.1291159-1-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 3058b13b-9fa1-45c8-f776-08ddb2e3e906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TEQAuGUwSUO3WBVndnqSlwVvL3Px18BwKFw4QCri49BY1F1bTmJYCuJLBWsh?=
 =?us-ascii?Q?eZ83QHfEjjHGFyYv4nyddbO+t36TY1Lrp7yii25NllymI0SPryH+KttKPxXf?=
 =?us-ascii?Q?/AbB7Sek/esG4mG8LFmohKpwqhyr9t5HIGRPn/h7JzuR8g/n1Otz509qlMxY?=
 =?us-ascii?Q?hhjnOZRFnA4inWhfUM8jyifKqO/uLJ7U5+vTzILdcXmErT65IaIPkebmeadY?=
 =?us-ascii?Q?kTYcl5KoOBpyb9Tgo7O+pKFqpsmBJQ6LktOxMtPS88YkCBTcUghJCJ+ADHiT?=
 =?us-ascii?Q?HQbsaVl2nzbUc943k4DaIBcf+aQLnExu8K9jv3FQqpVqnySsFEpkZggYpoXa?=
 =?us-ascii?Q?TXPSjH+Xfy+SjczDaxshg4EPRAF5xU5ngjul7MblJuB5uGA+hzSzfXd5qO51?=
 =?us-ascii?Q?T3QY+PZQp/eyFs2C2qt/BVRapfYim8l5GhzVexGoKN8svg0v2NpV4aDNNfkM?=
 =?us-ascii?Q?/0eVij/UK0xJWOA4jcMpWhTBYWbXGKXquVCPGNg+0TkHkQ5Rw/U0zWzHEoci?=
 =?us-ascii?Q?3d1eAvGcw3Xn3ZZT1oh3a554ynT0TJwNN179om2yG//UrZPidbdOrmMui3ji?=
 =?us-ascii?Q?9fZHKZFc4tbgL7FDttKVVhjCL/Bp5CaIr5PJ+N+bBwJrdoUmNkxOF8Bmagy4?=
 =?us-ascii?Q?SHEqKcVtx6L+ETU8ErChNL1TRQQgjxkc47uMG8U6jIx9GwF+oFyDbHHDvzhP?=
 =?us-ascii?Q?dDlzwRQr/zOulX4IrGEqiyCpJ5sZlSPlojzlQeVrN96NMfNa/U77DjjDVyIq?=
 =?us-ascii?Q?ygOJZsKSMLsjgq2Ilf8y8ldZT8iaxgGdzkOkihti9lwM3JqKM7JhnU7nsH0v?=
 =?us-ascii?Q?CV9+D+pPaf1QvUOR9XCjJ4w4+jQg/UMdg19k5496kVYg2u3b1FIf0nUAKNNM?=
 =?us-ascii?Q?aCVUmvi3s5C5INGKGAh5SpgByAzQNnMLns1kzpVS0dsxwU2JIayOn6UGCUpT?=
 =?us-ascii?Q?OwP4aVyAynMXBi1HlNNuS56gwC78vPHMoiiXGHNOILiGGA8JXRItZAjZK4y9?=
 =?us-ascii?Q?27qzTJM/XX46O5ZWFKuCpul/Pqe+n2wsMnIlaflD7UtcvI+QoFUwMVvB8T2Q?=
 =?us-ascii?Q?HC5eMWpiRoMnzh1w39j8COxhILNVsdb08SaMyvpvt1u6bn5ko3kexs0rtpry?=
 =?us-ascii?Q?JbvSRsZknB/BkWgQCoiIKH0Cw8Cf9EFI5jPhMI097AVl6qYyMoJMr01aR0OJ?=
 =?us-ascii?Q?AhPiigftVvUcLsBCdY8d3DygU9696M/AqV6xxrOM7fwXJSDt8IfMlEf05db/?=
 =?us-ascii?Q?V8KyR6sQ5/Pmr0LF/bhPKBX/WruYCxeV59x6E1ohmGT6WkOqvAWbU2uaPewN?=
 =?us-ascii?Q?u5OR+e9VWozoN8gJHi9fnvH6agKXy8tdr7IUgYdJFy7Jk0Qn69/9Iq60Cx3T?=
 =?us-ascii?Q?UyPhymW9mf5crA9Y5XDxTqx07EOnSVgTn4gXjpuK3jnTVVnnq/jM5eW/Exo+?=
 =?us-ascii?Q?As4OEb4UdqnuctLtM6XqnTZ41TWfoNGoYT6UObXG5Aj+nhBslk28mT1Ej293?=
 =?us-ascii?Q?3/RqcItkOzAhsImX3uf+nZZGtxQ9DW0DtKeHKkuyMCFqV689imFUiOv4sQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:56:49.2931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3058b13b-9fa1-45c8-f776-08ddb2e3e906
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

The current series is: 
 a) RFC V1 [2] with review comments incorporated.
 b) Design change to stabilize the solution.
 c) Rebased to v6.15.

Introduction:
=============
In the current hot page promotion, all the activities including the
process address space scanning, NUMA hint fault handling and page
migration is performed in the process context. i.e., scanning overhead is
borne by applications.

This RFC V2 patch series does slow-tier page promotion by using PTE Accessed
bit scanning. Scanning is done by a global kernel thread which routinely
scans all the processes' address spaces and checks for accesses by reading
the PTE A bit.

A separate migration thread migrates/promotes the pages to the top-tier
node based on a simple heuristic that uses top-tier scan/access information
of the mm.

Additionally based on the feedback, a prctl knob with a scalar value is
provided to control per task scanning.

Changes since RFC V1:
=====================
- Addressing the review comments by Jonathan (Thank you for your closer
 reviews).

- Per mm migration list with separate lock to resolve race conditions/softlockups
reported by Davidlohr.

- Add one more filter before migration for LRU_GEN case to check whether
 folio is still hot.

- Rename kmmscand ==> kscand kmmmigrated ==> kmigrated (hopefully this
 gets merged into Bharat's upcoming migration thread)

Changes since RFC V0:
======================
- A separate migration thread is used for migration, thus alleviating need for
  multi-threaded scanning (at least as per tracing).

- A simple heuristic for target node calculation is added.

- prctl (David R) interface with scalar value is added to control per task scanning.

- Steve's comment on tracing incorporated.

- Davidlohr's reported bugfix.

- Initial scan delay similar to NUMAB1 mode added.

- Got rid of migration lock during mm_walk.

What is not addressed yet:
===========================
- Patchset can use PFN based list instead of folios for migration.
 This will be done in the next iteration or so when integrating with
  kpromoted [3] /enhanced kmigrated APIs.

- Still using old target node heuristic that chooses only a single
 target. Hillf had suggested promotion to next tier nodes. we are not
 there yet.

- Jonathan, Davidlohr had raised comments on microbenchmark and migration
 based on first access. Now, filtering of folios is done by checking
 whether it is still hot using lru_gen_is_active() (for LRU_GEN case). But it is
 still first access for !LRU_GEN config.

- Davidlohr suggested using NUMAB2 along with scanning. Need
 more thoughts/implementation based on that (without relying on NUMAB2
 timestamps??).

A note on per mm migration list using mm_slot:
=============================================
Using per mm migration list (mm_slot) has helped to reduce contention
 and thus easing mm teardown during process exit.

It also helps to tie PFN/folio with mm to make heuristics work better
 and further it would help to throttle migration per mm (OR process) (TBD).

A note on PTE A bit scanning:
============================
Major positive: Current patchset is able to cover all the process address
 space scanning effectively with simple algorithms to tune scan_size and
 scan_period.

Thanks to Jonathan, Davidlohr for review feedback on RFC V1.

Results:
=======
Microbenchmark gave similar improvements (8%+) as in RFC V1. But more benchmarking
TBD with redis memtier etc (perhaps tuning based on that).

The patchset is also available here 
link:  https://github.com/RaghavendraKT80/linux-mm/tree/kmmscand_rfc_v2

Links:
[1] RFC V0: https://lore.kernel.org/all/20241201153818.2633616-1-raghavendra.kt@amd.com/
[2] RFC V1: https://lore.kernel.org/linux-mm/20250319193028.29514-1-raghavendra.kt@amd.com/
[3] Kpromoted: https://lore.kernel.org/linux-mm/20250306054532.221138-1-bharata@amd.com/

Patch organization:
patch 1-4 initial skeleton for scanning and migration
patch 5: migration
patch 6-8: scanning optimizations
patch 9: target_node heuristic
patch 10-12: sysfs, vmstat and tracing
patch 13: A basic prctl implementation.

Raghavendra K T (13):
  mm: Add kscand kthread for PTE A bit scan
  mm: Maintain mm_struct list in the system
  mm: Scan the mm and create a migration list
  mm: Create a separate kthread for migration
  mm/migration: Migrate accessed folios to toptier node
  mm: Add throttling of mm scanning using scan_period
  mm: Add throttling of mm scanning using scan_size
  mm: Add initial scan delay
  mm: Add a heuristic to calculate target node
  sysfs: Add sysfs support to tune scanning
  vmstat: Add vmstat counters
  trace/kscand: Add tracing of scanning and migration
  prctl: Introduce new prctl to control scanning

 Documentation/filesystems/proc.rst |    2 +
 fs/exec.c                          |    4 +
 fs/proc/task_mmu.c                 |    4 +
 include/linux/kscand.h             |   30 +
 include/linux/migrate.h            |    2 +
 include/linux/mm.h                 |   11 +
 include/linux/mm_types.h           |    7 +
 include/linux/vm_event_item.h      |   10 +
 include/trace/events/kmem.h        |   90 ++
 include/uapi/linux/prctl.h         |    7 +
 kernel/fork.c                      |    8 +
 kernel/sys.c                       |   25 +
 mm/Kconfig                         |    8 +
 mm/Makefile                        |    1 +
 mm/kscand.c                        | 1644 ++++++++++++++++++++++++++++
 mm/migrate.c                       |    2 +-
 mm/vmstat.c                        |   10 +
 17 files changed, 1864 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/kscand.h
 create mode 100644 mm/kscand.c


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.34.1

