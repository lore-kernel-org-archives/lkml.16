Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D31E7C12
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263888; cv=fail; b=Z7gBcrz9LbFiU1nDzX09W1wAoJrOwhF8ZSubyLXNtavn/V/VEqKl61HxE84ZEh9iLH5Zmb6/Ohswt2EUi624oNUGWPUS/ZppyjM4KJPhHskxvudZQU5FL8iaOrWk9f1IeIeKuE8sE8c+TykAEiS6Ds3nWvWj9vpsjzh5Q7CFsVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263888; c=relaxed/simple;
	bh=4PUuugHyT4NfENyz0RGz3ZLsCciMgxRGu0jOZ7HXCOY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZnMW9jisVr1P5Y/9VSl8r2MljzojTbPAJ485D1adMjEzQloJ1nFVROAWSoPaH76LHF65JNfPJXTGGbe/yd37YGeViMWr3lFsthcdyBnL06gTdeBvlUUVulB1VSFZ1iaYUg5oqAZKlIEATI1vpaQEdUE7N6VtKxRZFSSfkvsaas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F0moTqL1; arc=fail smtp.client-ip=40.107.212.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F0moTqL1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbYlsYrVx2OBU8w1W2Ay5eRZjBFDL8Eb1XVhnI1scJRrMxwn35Ej5bBGkicXQtBVZqpS4hukGu7oDd96gYRQYliE4MQQvcmQqoSk4SnzjQPesVstQv9ZdPn+rgkWUcxBeY3+ZcsTqq2C1c/KXJZDITKGEKT9TgEqLMxXTgd2mmrgDAP1KCF+CRCjwaqdL2Sipi92HCucNkZruYYVa3H4tdNlqbRuSbEWSA/jDjNE7Owjxrg6ALcWZiWKBonK9yg2i2VZlCyJcDLBIvuGjEDc926p4HfaXazn2rjtADnPAMCd/zlhFIQ0B4/iD1c0Q8Sb8D1Ab0ODoBEvL2Fup2aB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTkpYhzrFIGBIw0M+sEirUt0lDELO2ObnA2IwFyFHv4=;
 b=liD64nSCQulwitpX1IZ/lXNmJKMipIkYeamOA76yFZVU+LiV2aRMMEEO7dvExDRwIewnkE8UgVLcq/aijXs6GTgiK1jIZyAQ+zQdAF+4s1zvJFFIpcWLHV0D4czpEedA+DHgypNSgY1pru9Jc6sKcaXqNFyu3HS38sDjc49vE/94+nieCj5ASwpVe5ToIeFCgnzgg7CP/cUjP0rXrjPCvkJ6fHKtzujgNaSSgSibUNuTqREQsF3cqr1UQPZx2sP8N1FI2lpzV+ZnZ9D9ZRBxY7yZWK3ijz04LwafoxwYKAWOaKvYdG3LSyHeR/H0412qSo2XjKWR62ZZHmOx16QmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTkpYhzrFIGBIw0M+sEirUt0lDELO2ObnA2IwFyFHv4=;
 b=F0moTqL1vkZDBFEL/loGwPvkPqXwP/lIhrzGNg2JfnFZ3KEYwn3iIKo1sJ42g/im95K2GEzHYKPngQZo1tIfdgnnyj7RgPDmEnJeqYeSein1gHMZvr6VghMF4GnZwy+nIJExfIEDXLinDZ/rU/TRL+eW+Aj/YjLg5XB5hNdeGB0=
Received: from CYZPR20CA0013.namprd20.prod.outlook.com (2603:10b6:930:a2::13)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 30 Jun
 2025 06:11:20 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:a2:cafe::6b) by CYZPR20CA0013.outlook.office365.com
 (2603:10b6:930:a2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 06:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 06:11:20 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 01:11:15 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, "Leon
 Romanovsky" <leon@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Steve Wahl <steve.wahl@hpe.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Madadi Vineeth Reddy
	<vineethr@linux.ibm.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH v2] sched/fair: Use sched_domain_span() for topology_span_sane()
Date: Mon, 30 Jun 2025 06:10:59 +0000
Message-ID: <20250630061059.1547-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: fa08f714-95d0-46ab-7a77-08ddb79ceed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700013|7416014|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fynR6PUEWW1I8E08/XhqFYkjFAxLPkzHLT5bjCBqrIQI//RwQdhgzpBc+IRK?=
 =?us-ascii?Q?d3EkKNdPCcOJ1cpg2RXjLpJFNvFNgvt1XHiGnjWdv/h/5oK5TxhriN9wvnyT?=
 =?us-ascii?Q?CP3qNaFKPRKo3uTxPXAB08cASxgnaPrP+MKY8rpB9TPD20OTY/w3RyruV9q6?=
 =?us-ascii?Q?N1KFw7Hl0JtawP7BDa8eeaUf2ZMEJsT9WgXPjmHPdsr2jAJIOa4pyVwP6rGp?=
 =?us-ascii?Q?gAbzCJSn8svWz984EKVINAh4viv+KPcxKUj6JNtft+3Omsp6lUc8rad0MGbR?=
 =?us-ascii?Q?ntyQKXC1kHv4zUskLViG3eKh3pXHJDcR8YjXc1Rrmo/hSEkUiDZ7hiJxET+h?=
 =?us-ascii?Q?fOI309VZfzt5CHOpAsXFh06utPUSxMXeBOkfqRvihoh8SYG+6r05QO7cC8rd?=
 =?us-ascii?Q?zKRQTKBzsS9+mdivdLAoNFdFeRBZ6EV3FuyfHLNHouj8yUODYCUGbX+PKMfs?=
 =?us-ascii?Q?RmXO8kkp06um5IXA668qI47PMFojf59sv+S01RZePa/cHgMzzV5omX0/d8QT?=
 =?us-ascii?Q?SjvhRyWsYWDAyYbeX/HVSCIZpMfffRMHUVT9WbjbQ3jlTQUq6cijBWcJp/yt?=
 =?us-ascii?Q?gkNJWdRit0ZDjFelgMPq7vFT2bzRsR9Jrz+yDv24fpiFs9NGAttgG2cQ5BFq?=
 =?us-ascii?Q?1NPhbeZ8y+cJcOOCpCjTmKbUBzq9d6vDZ/YTVLwoTTLYP7dI9QIap2ZBV5Iv?=
 =?us-ascii?Q?H2N5kSAUNaWsSPXk8m2GX1DMjU58V9TrN/XeFX0dpgICsxYdKqyn334Atpua?=
 =?us-ascii?Q?GujG+QtYPjMt8ZQq1pKgcFUhdZJQ8lqvc0Se/am3qDcvSvSLEDRluHs5oxHS?=
 =?us-ascii?Q?er1qsrvU8XBipSQAS3BdrKeUfcjTMvB1HiCLeUls6fLuJzBqxavfYzk/uWNL?=
 =?us-ascii?Q?e+COtJdcP49GpHcdSLuunaT5cASWyC7fHSKF6/HTHIS1+iniJdEHcjoU1BK0?=
 =?us-ascii?Q?9Wicebk+v6aXR3q1jketveATRm5IsyGP4OHPZJqsn9bGSSZbscIHVXMOHDPL?=
 =?us-ascii?Q?JN5Y5j2DA0MKnX2UqRPPtmdS9/1w8Y0o7R5C4o4D24p9nfOsz6tLKLgNz1dk?=
 =?us-ascii?Q?7PFuP4nkLdMoQCVUF97uZd4wNolZordc/tNuqiofREaEcW4gf8But//EjAtP?=
 =?us-ascii?Q?FLZGjk3kk8k01nR3YkzGix1XF1cs4CmPTNWkt355Zv5rNleVGbp0BdOvzgzz?=
 =?us-ascii?Q?kssOP0vCbghZZn7EAwfDDhtOUHZjKrtNiyT3cA4impduENkH0eT+Y+0BnKNv?=
 =?us-ascii?Q?i4pd3EF4zE1cLhWIfjDL6T/kl0VCm5HLRahBCyJPVKDeg6UQwU3WAzqmrxTE?=
 =?us-ascii?Q?6sArZfXP3k0z4q5sSpg5TSBvXWXCG/LCamNiob3e1ORqlWWuUT11i45CrTjW?=
 =?us-ascii?Q?Baf+gLlLx/Bglkpz8mgGI47Je70uVc49GFoWnc0kVqOQW2VCZV2CBAN3DxRc?=
 =?us-ascii?Q?4uqnXlav/xGMjFM+8Sb9ZtEVumXsM3rlIvOFO+3wkLBUy6wTvwhrj9r9AgK7?=
 =?us-ascii?Q?gizJugy3aBXnu/tIZP7gvnHj30gFOzNa4ECWzfUa+biloh/66QvC7De4og?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700013)(7416014)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:11:20.5410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa08f714-95d0-46ab-7a77-08ddb79ceed6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488

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

The original warning was reproducble on the follwoing NUMA topology
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

Cc: Steve Wahl <steve.wahl@hpe.com>
Suggested-by: Valentin Schneider <vschneid@redhat.com>
Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/ [1]
Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
v1..v2:

o Use sched_domain_span() instead of replicating the
  "sched_domains_curr_level" hack (Valentin)

o Included the QEMU cmd in the commit message for the record (Valentin)

v1: https://lore.kernel.org/lkml/20250624041235.1589-1-kprateek.nayak@amd.com/

Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
'x86-build-2025-05-25' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
---
 kernel/sched/topology.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a2a38e1b6f18..734fee573992 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2418,6 +2418,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 	id_seen = sched_domains_tmpmask2;
 
 	for_each_sd_topology(tl) {
+		struct sd_data *sdd = &tl->data;
 
 		/* NUMA levels are allowed to overlap */
 		if (tl->flags & SDTL_OVERLAP)
@@ -2433,22 +2434,24 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 		 * breaks the linking done for an earlier span.
 		 */
 		for_each_cpu(cpu, cpu_map) {
-			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
+			struct sched_domain *sd = *per_cpu_ptr(sdd->sd, cpu);
+			struct cpumask *sd_span = sched_domain_span(sd);
 			int id;
 
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

base-commit: 914873bc7df913db988284876c16257e6ab772c6
-- 
2.34.1

