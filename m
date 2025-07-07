Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1335949
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885612; cv=fail; b=FHWXEmF0YaBxo0jAb8oM+PGCdtmSH/yliaHO8hwNuSYH8VVpjW1sayJp5Y4Osb3Ai96FyaWVJDSD4d1ZgLks/Q/pJP2tQgxezNN+/7uYiIkQnd9OeCGRArYEKOPVNSHNxwMww5XC4Ia3hTrjntcWaC7kcUZWNKjHcFYl1rh1Dck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885612; c=relaxed/simple;
	bh=0Q6/cFEoCQbp8Ft2tYWtXeo56NgmgiCe+pvxi6JoxPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ocGB0v0h/9rUgRb4oErGyAP9nTblpX+I64zyhclQVYtVsAhB++09KlGO7gURsTV/UTTHM+lHWTuv9tR0EBlw0jDUFlh+Ck3+167ef9VcQPxSbiG8xqNGJVm4A8UnudHpYicxapoxOBnngJCQ64r7fbiSKd1/QLn2LEbv//IwubI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RaiR8oWd; arc=fail smtp.client-ip=40.107.100.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RaiR8oWd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luIQCH1NqYzeppZPoJAn+/HFNE615SrfoG4u8fRDzps4GyuP0Xwdw06lUIRG8yK0Sm/eezg4rye4XIYdaZSNii8mza7Y87uQKE8YtFWDpBUlfmq2a4STqiJM+2O0cMhiYvfDPxjcn40Jqcx0FsbblIIb1+HHehPhJFamvkg7JTdWRv2k+uQzzTkKve+BDHB8AkX+KQ39HP5J+ecWNw7zV9oHLGUqmnSkP/t7IFyhCQvfLHk2iEcn7AoULGAB1QUfCrNTK24I+CMvA/z3tD+K9DjSruLGbFnYI9ZU0h0f0Oz0XvwjZoaoaEcA04u8jGzVeKEr/jKvzH6+nDkiSSxy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuC7DvQc14YVbyCcGvdC8GrWaU+Pe593G8Rf94+yVRM=;
 b=kJuS8tQByz8pD6sbojfCCGafakxRMVHgHxQqeqb/CXy2cKYU4m0WQRRm0jGV9RBp4WR87ynvln4xNEQblyi/0LdBeplVpbdw2pUeeY/yUgzF8UBpo75gHnBLzPofHhS+hFeaeXHSA77sr1g6JD+R6Aq03VtUbV4Q7fLyUgUpMrvedL9rdXDL+bYXKY3K2nLlCnNkJ+yilz6yvQmIBTbrb3zXIYbjRJFw4tNtYVkIMk9TU45ghOHQxsE52QKqSPY8UYAiOVPVLIsBcfWW2pNKdOgSpKDbC1xp+nzGybiWeIz8sShxttnz9uAjzyTa05a9UwWDCHSb1c6XYwvA+ZLbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuC7DvQc14YVbyCcGvdC8GrWaU+Pe593G8Rf94+yVRM=;
 b=RaiR8oWdOgrHU6RbTYwaXkkKH+G59WDY799ajR1smlfEHbTfq8MQe5oWgu6gmI05LE6BbKTJdGL2Wxr73eO6emryJW39qxHggkxfFmrsj/R+qhbQwt4dBBT8e9sBkDTTbblg/YdtjDhWjnbWdvbMjG0vfr+YcP0eiLRcyHTB1pU=
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 10:53:23 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::2e) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.18 via Frontend Transport; Mon,
 7 Jul 2025 10:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 10:53:22 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 05:53:16 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, "Leon
 Romanovsky" <leon@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Steve Wahl <steve.wahl@hpe.com>, Borislav Petkov <bp@alien8.de>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "K Prateek
 Nayak" <kprateek.nayak@amd.com>
Subject: [PATCH v3] sched/fair: Use sched_domain_span() for topology_span_sane()
Date: Mon, 7 Jul 2025 10:53:02 +0000
Message-ID: <20250707105302.11029-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a70704-d832-4388-3949-08ddbd447de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|30052699003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FoGTnz9hHDkLHBCiMGFZ6DthaqcHQ09jAHj1JNPk1zqg4xImQE4rflC/ndZx?=
 =?us-ascii?Q?HARq+no137gmeY6DQFuiWAGiSFUF9TNBRqw2dt7Qpn8SFSR38xH5gzB05C72?=
 =?us-ascii?Q?LeK8EpZOI/OjffogXrxv9anqJu0k0yCGv81oNdTzAXd0sLIxU3/ZiXTF4VUu?=
 =?us-ascii?Q?c+re6YrK3hCV4Mg7aOKZ4yJdO4O4Gwd+pch06eF7CYBwVtK5d6aQU7IpBYNS?=
 =?us-ascii?Q?rEDbSqB+8eu0fic5qh2lhuIXpglgflfEZuthaZHkHGx0zvgoOae0ThQ85Frv?=
 =?us-ascii?Q?9JhFN1Hj+Ot9Hko34hROLVeBu2MkKfxl5jTBTYs3zyqqrV0mqmkxVhshIXBw?=
 =?us-ascii?Q?zsu2fYJGcd3/zJ2OPsgACu7aG5Xk4DSICqIgr6G4ROupIOUlvXvTMri1bMG9?=
 =?us-ascii?Q?RutsfEKPfIg9I0R6JxbPHNYcaskwkTro2/N0KBmc8L81J4rHRh0G8JvLyPGU?=
 =?us-ascii?Q?bME2mAatm4cAXyb4/CKOsL+47vh+ivkuc0Wv/cHlwJlQUjh0UEN9a1OZvMee?=
 =?us-ascii?Q?W8NirnqsvF2laPnnNV4MFpnyup/8QBgTtGImUzy2Vv2U8nGs5u0/X+cWgOOL?=
 =?us-ascii?Q?GqVHkAxR67PG9fAvyP4/7w2eZ5fYKpBXI6p4IizorUP5SAU98a9Rt54r7qGI?=
 =?us-ascii?Q?fmbkjL/PmaZBa8MZuAOpo9vD9m/G1fAmajwYiYAcr+3CpGDw57cKN1arnl91?=
 =?us-ascii?Q?meBD0w/DENSIWXWUOsFJHQ7A54Cri4tJFvinnaVrlV1wsL1MfDUB4b1+RncV?=
 =?us-ascii?Q?fJJ7ucvC/+d7QPjE3EwDhHirABajIRxddo1T2wbQBG9CFo5Le/uuPoMByYKE?=
 =?us-ascii?Q?YxMKq/cRF9w1lbQ+8L7qDMfydnfpgwLRU/NeJK/V9hAdz8IfekNfR619pqlg?=
 =?us-ascii?Q?H+OSlYXGPWRF86bjo+9H+zWrV8qIBIXAfLjqPfZGyWSzEv+sR4hG3O4OJyvA?=
 =?us-ascii?Q?4Ax++4BWiVeYlsFXxzaSw577u/zZ2rMbt7GmR/jutAVxzzMkfF95e3N4e/j1?=
 =?us-ascii?Q?oDWLCTINV4roHVL/BiKiciBRbJ9PwA+00Oivp4iECMMt2kGt/WYwZVb5rZ3E?=
 =?us-ascii?Q?Ritkv6jL5freZs9FO83naq98ngbvZIejZixHfVgkO0xNovMaDAbRmOFMS5Db?=
 =?us-ascii?Q?b+S45p0+q2QbOGDKljSaS5WkL/MBXRLImJe8rwwQfPMS7NjpXn91/ke0rmaU?=
 =?us-ascii?Q?usEtir0wrN1vPJCqYHux300pMImo8DgEjwfNJ+w2mtI25p/eQwiIEzOm0Z+5?=
 =?us-ascii?Q?g6Qy786qRNgpBlwOHP38Aj503eE5i/B0RL3bo0Qi1x0gnLfF883btdT+U7F+?=
 =?us-ascii?Q?y8r88HeyAOI62nSIF91f63V+ZHvEyhKseApnemRZMTTKzTDJbESpxUouVqp2?=
 =?us-ascii?Q?xjMeS2JrVfK9UfFUGtHnH0AC+BhfI8je1+WyL42qbXpZxo6nfZhJ0upqMjSr?=
 =?us-ascii?Q?I0L8YupqBR+CbWy6enWlsXcekXNSdaRYxio4npdtXXlhaVgWnuSgqgFnbyr1?=
 =?us-ascii?Q?Gr8E7XD37NuvFaZEC3F54k4moFy8sLTdu9JXbOp/Ga2eCC8kfD7BQJTDnQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(30052699003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:53:22.2411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a70704-d832-4388-3949-08ddbd447de0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836

Leon noted a topology_span_sane() warning in their guest deployment
starting from v6.16-rc1 [1]. Debug that followed pointed to the
tl->mask() for the NODE domain being incorrectly resolved to that of the
highest NUMA domain.

tl->mask() for NODE is set to the sd_numa_mask() which depends on the
global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
set to the "tl->numa_level" during tl traversal in build_sched_domains()
calling sd_init() but was not reset before topology_span_sane().

Since "tl->numa_level" still reflected the old value from
build_sched_domains(), topology_span_sane() for the NODE domain trips
when the span of the last NUMA domain overlaps.

Instead of replicating the "sched_domains_curr_level" hack, Valentin
suggested using the spans from the sched_domain objects constructed
during build_sched_domains() which can also catch overlaps when the
domain spans are fixed up by build_sched_domain().

Since build_sched_domain() is skipped when tl->mask() of a child domain
already covers the entire cpumap, use sd->private to skip domains that
have not been initialized in CPU's hierarchy.

The original warning was reproducible on the following NUMA topology
reported by Leon:

    $ sudo numactl -H
    available: 5 nodes (0-4)
    node 0 cpus: 0 1
    node 0 size: 2927 MB
    node 0 free: 1603 MB
    node 1 cpus: 2 3
    node 1 size: 3023 MB
    node 1 free: 3008 MB
    node 2 cpus: 4 5
    node 2 size: 3023 MB
    node 2 free: 3007 MB
    node 3 cpus: 6 7
    node 3 size: 3023 MB
    node 3 free: 3002 MB
    node 4 cpus: 8 9
    node 4 size: 3022 MB
    node 4 free: 2718 MB
    node distances:
    node   0   1   2   3   4
      0:  10  39  38  37  36
      1:  39  10  38  37  36
      2:  38  38  10  37  36
      3:  37  37  37  10  36
      4:  36  36  36  36  10

The above topology can be mimicked using the following QEMU cmd that was
used to reproduce the warning and test the fix:

     sudo qemu-system-x86_64 -enable-kvm -cpu host \
     -m 20G -smp cpus=10,sockets=10 -machine q35 \
     -object memory-backend-ram,size=4G,id=m0 \
     -object memory-backend-ram,size=4G,id=m1 \
     -object memory-backend-ram,size=4G,id=m2 \
     -object memory-backend-ram,size=4G,id=m3 \
     -object memory-backend-ram,size=4G,id=m4 \
     -numa node,cpus=0-1,memdev=m0,nodeid=0 \
     -numa node,cpus=2-3,memdev=m1,nodeid=1 \
     -numa node,cpus=4-5,memdev=m2,nodeid=2 \
     -numa node,cpus=6-7,memdev=m3,nodeid=3 \
     -numa node,cpus=8-9,memdev=m4,nodeid=4 \
     -numa dist,src=0,dst=1,val=39 \
     -numa dist,src=0,dst=2,val=38 \
     -numa dist,src=0,dst=3,val=37 \
     -numa dist,src=0,dst=4,val=36 \
     -numa dist,src=1,dst=0,val=39 \
     -numa dist,src=1,dst=2,val=38 \
     -numa dist,src=1,dst=3,val=37 \
     -numa dist,src=1,dst=4,val=36 \
     -numa dist,src=2,dst=0,val=38 \
     -numa dist,src=2,dst=1,val=38 \
     -numa dist,src=2,dst=3,val=37 \
     -numa dist,src=2,dst=4,val=36 \
     -numa dist,src=3,dst=0,val=37 \
     -numa dist,src=3,dst=1,val=37 \
     -numa dist,src=3,dst=2,val=37 \
     -numa dist,src=3,dst=4,val=36 \
     -numa dist,src=4,dst=0,val=36 \
     -numa dist,src=4,dst=1,val=36 \
     -numa dist,src=4,dst=2,val=36 \
     -numa dist,src=4,dst=3,val=36 \
     ...

Suggested-by: Valentin Schneider <vschneid@redhat.com>
Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/ [1]
Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
Tested-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Changes are based on tip:sched/urgent at commit fc975cfb3639
("sched/deadline: Fix dl_server runtime calculation formula")

Changelog v2..v3:

o Added a check to skip uninitialized sd that can cause dereference of
  sdd->sd beyond the percpu boundary (reported by Boris).

  Tested on the trivial case using the QEMU cmdline:

    sudo qemu-system-x86_64 -enable-kvm -cpu host -m 20G \
    -smp cpus=10,socket=1,thread=10 -machine q35 \
    -object memory-backend-ram,size=20G,id=m0 \
    -numa node,cpus=0-9,memdev=m0,nodeid=0 \
    ...

o Collected tags from Steve and Valentin on v2 since the approach is
  still the same. Only the check for uninitialized sd is new.

v2: https://lore.kernel.org/lkml/20250630061059.1547-1-kprateek.nayak@amd.com/
---
 kernel/sched/topology.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e020..e682bf991ce6 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2403,6 +2403,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 	id_seen = sched_domains_tmpmask2;
 
 	for_each_sd_topology(tl) {
+		struct sd_data *sdd = &tl->data;
 
 		/* NUMA levels are allowed to overlap */
 		if (tl->flags & SDTL_OVERLAP)
@@ -2418,22 +2419,34 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 		 * breaks the linking done for an earlier span.
 		 */
 		for_each_cpu(cpu, cpu_map) {
-			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
+			struct sched_domain *sd = *per_cpu_ptr(sdd->sd, cpu);
+			struct cpumask *sd_span = sched_domain_span(sd);
 			int id;
 
+			/*
+			 * If a child level for a CPU has already covered
+			 * the entire cpumap, build_sched_domain() for the
+			 * domains above is skipped. Use sd->private to detect
+			 * levels that have not been initialized in the CPU's
+			 * hierarchy and skip them.
+			 */
+			if (!sd->private)
+				continue;
+
 			/* lowest bit set in this mask is used as a unique id */
-			id = cpumask_first(tl_cpu_mask);
+			id = cpumask_first(sd_span);
 
 			if (cpumask_test_cpu(id, id_seen)) {
-				/* First CPU has already been seen, ensure identical spans */
-				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
+				/* First CPU has already been seen, ensure identical sd spans */
+				sd = *per_cpu_ptr(sdd->sd, id);
+				if (!cpumask_equal(sched_domain_span(sd), sd_span))
 					return false;
 			} else {
 				/* First CPU hasn't been seen before, ensure it's a completely new span */
-				if (cpumask_intersects(tl_cpu_mask, covered))
+				if (cpumask_intersects(sd_span, covered))
 					return false;
 
-				cpumask_or(covered, covered, tl_cpu_mask);
+				cpumask_or(covered, covered, sd_span);
 				cpumask_set_cpu(id, id_seen);
 			}
 		}

base-commit: fc975cfb36393db1db517fbbe366e550bcdcff14
-- 
2.34.1

