Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDDD235044
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750738386; cv=fail; b=NNc4+5SQn0JeaXdxLB593ZOf8+gCyLpHVI5BDga3IqPv1kZAD5mraayryKPEfsJQf3mxO/zl/bQPSDVCEvW1hsFi8dDs0BHFHondS/KZ2WdKr9HAucGtj/O4pqOOFXL1nE25cqU0xFTcErmivERJN/thSpFI3JRYZrzMhoezQZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750738386; c=relaxed/simple;
	bh=ffWKE5c7wYUhliNnBfbrs8/fEhc7VWOSNmTpOTcuFi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gnZef8/Ja7MCs1+tBKMW4v1LDgHhIevT5RHzyku9Tg5amLSs2lB36iMz6CAWhoENH+0wWQSX4nsYb4RiVu/HXVNu3mkr99mADrgB75MCIqh0zDFQp32o5yFC0WdIcZoLHIBd/j7zVuZ9huic0tzyUyPVdK2o/9UF1aFJLFtP7ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L0rTwwSy; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L0rTwwSy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD62W7Rnb4LyLJe/IGDO4xOgGlbFdIbY62fEfM/ztdHtxya0/CTga1/ouXktKP4NxNRXWqEX6wu1v8Y7m1FURbpkHE9LO99BRKld3Vf9d1H0R3fdR01MR/FWG/VMLeVMXr+a8/MNVGexSvyme9tGXyFBCIO1RuUUJtuGVPwz+6Nd1DWZOdy8RNsaPEx4d14AuXoijoQmqTVq0EJF3BZ5Q5wVvcZBoAP49KuZ6WMnUm4XoMKThupaXzKlie4Lc9KR4nTjwllGjneQegFjd+pdjDKqinW0PNJIvlLheYf0ZRjFYfGAYCRldLWCjdpnn2+JBdli04jmMXcG/vjjMOEmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe7Ax5siUCjVhzZftC3eBgwN8hdHhmqf6saPToI1pXk=;
 b=SWhBNOSlLUM2PDZrL84vqpfTR0Ltmgsa/LgZ4UyjW2d17C4Z2uMuyswdc1Lq+OOyalOP/U4Do65+oA0noHcYbQsBTtio/X50RawtzM9Ka9L8dCR0Y0fOVNzx653zfCfSYYEuEBentlyEcL1ufWuhjwFIhNR6P7rww6jKW5FeI9wm+DojU2NqqNjimamhnWkr7M7hU7ykAMOP7FI9xRuxEumYkvd+WCo7rsalW6wLviOiNK6iNzyiNgWfIQaI7MnmB/wbOJvzgbOjD88JsI6LfnMuvu3oCUEyCAYpzibxNIVskk3DUTcMll8mDIo1bL5ytn/q1Hz3SDoEdMrQ3ng/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe7Ax5siUCjVhzZftC3eBgwN8hdHhmqf6saPToI1pXk=;
 b=L0rTwwSyb2j3muBf0/r3P4rwX8HiJYrpfVd3Oa31qzLWW24f+hxGqXoyu/77bCLsMPsTVIbfooaFX/mtCSl3PEf+fDSX9BA4NUtOTdSauS6AgZuW86ei1KGPk2eRiOdHzvBinSFZkqTZuQUvGKYV4W1hak4gOm0Vrok1lCv9igA=
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 04:13:02 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a02:ee:cafe::e1) by BYAPR02CA0033.outlook.office365.com
 (2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Tue,
 24 Jun 2025 04:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 04:13:01 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 23:12:52 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Leon Romanovsky <leon@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Steve Wahl <steve.wahl@hpe.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [PATCH] sched/topology: Correct "sched_domains_curr_level" in topology_span_sane()
Date: Tue, 24 Jun 2025 04:12:35 +0000
Message-ID: <20250624041235.1589-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 3639fb16-4303-45ed-e4e4-08ddb2d568e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|30052699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xJFllkHLumfEwaVGmmopd6wlRBI0wvBnV91Z6OZ4S+Wwu2eSOLwHT9PzAixN?=
 =?us-ascii?Q?PRtRJC/3VOypjVKSgJpgZbbuoKun4KMOAfa9YWaznsMyMo5YqQ0SiplN/MzL?=
 =?us-ascii?Q?Vxp4wkjXnhtBct+s5HRvZIcO0VYXV3mcn3LjhSefQ4Y7Yc7YvpNMeqnjeC/k?=
 =?us-ascii?Q?SFIh1XVw8UrHOE5CjAViuzej3PJ0ZZys97VGHDR7fTIcgybzbFDqQ9HpixeN?=
 =?us-ascii?Q?nMZNDEvq3rjJh6YJX+cmX0oVOu9orFHnYzlzqnym5Is69Sstd2hvGWAKyq8+?=
 =?us-ascii?Q?RUHHeq7FolP3tq9ta3mygtv0aBT2Tqd+13vUN5BBPMyJAWwG/hqBVmLA38a5?=
 =?us-ascii?Q?AnDlRYhwV0Iu4ODz87fiAJaJ751Ts7wNJT+ZUG1ELH9UFfrin3YD6eWn/8Ii?=
 =?us-ascii?Q?oL8+7fkeZvU4aOAshUWNU4ojqHuxNMJk9KotjBNyh9kGOtPIKmgu8H+NQB2R?=
 =?us-ascii?Q?f5ntFuWn/vT3r+O9BR7IHXInJSRitVQMesg3dS5Gt7OOkHBhNxu/u2injrSs?=
 =?us-ascii?Q?U/UkYe6mFge3Xw3Js5MssoWAGHZ3dZC7IsJsPrfRw79cmdILuN5z5rlGa+Y3?=
 =?us-ascii?Q?BTzdN9GufIjvWA4JC65vIbfB4Y4ijBBn2Ru5vHecd3ixrWuTj+YiyStfTJT9?=
 =?us-ascii?Q?Y47RO2uZsei7E8CkpZw7Lw5KesjktxM4r3MDBK8/dGIYfKJ4WhdS7pTHUw5m?=
 =?us-ascii?Q?B3ZdWWvPTwo8F9KvaevsMDRJTP17Ovz+ltg3AeLsJj/3h185Rhryyl+gWvwa?=
 =?us-ascii?Q?Gi9tqCXjoBGEu4w1/GpS4F6o8HBbQmrb1m8DS7jQ31DHggyo4f3tRkGuFqdi?=
 =?us-ascii?Q?C9JmwwmCb+dJba/DBt+J7xr6gIKTdstDyPh5Ps74vyqjATNOLig43c2/+vIR?=
 =?us-ascii?Q?vGP8xuvUUStZsID4D7odPk6vAAN8rKEFh+G6e2j6MpKgTF4oIWzo084I86GS?=
 =?us-ascii?Q?Mou7cX+0JTfW5SklmRUptNFoG7H4PWpOIhQllzaMAUwIkmwb5Ngvzo+9fwJ6?=
 =?us-ascii?Q?UjeuMxbbQ02uwkNHa3hanMPF5KXWOqveSZgsrMT/ywQ/j1NCOW3XFGLYLF9V?=
 =?us-ascii?Q?wOb+eguO5NFQX4LjPa/sD/lnABWLynqZ3/Ll8HbeGrUESG6316SXxhf4ILww?=
 =?us-ascii?Q?8m076NW233bKoBY7kMxaRVCGI6J/u7Fwc2V9QjqvCUO/sdCAbWAv6V8lt9Ms?=
 =?us-ascii?Q?UjgnxfR1BQaubDzgkAJFCTHOSyoiUSRfLLf/zlXBaz+UOE8ZQ7ihqzUqRVpo?=
 =?us-ascii?Q?34K4mXqVgf62UcxKiMIHEfpHehJf8m7GrXfjpENWvmtRsTEYwSaB/jhD2tKe?=
 =?us-ascii?Q?AQxy0TTGQ0HNipHcQV9IZEeAWKyzYJQbZnxhPYNanUq3TFpd7c9hk5gsYgGD?=
 =?us-ascii?Q?V/sWcF5sx6KEiNNKiPaQkJ2xfsI96MjYmh+jqAhn5Ax37gmKh1pHGVwomB9h?=
 =?us-ascii?Q?i1EynSNEpuUzdifOG8A09cxC7MyM19zISsUL8fgq+jkLiFY/6YJphg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(30052699003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 04:13:01.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3639fb16-4303-45ed-e4e4-08ddb2d568e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370

The updated topology_span_sane() algorithm in commit ce29a7da84cd
("sched/topology: Refinement to topology_span_sane speedup") works on
the "sched_domain_topology_level" hierarchy to detect overlap in
!SDTL_OVERLAP domains using the tl->mask() as opposed to the
sched_domain hierarchy (and the sched_domain_span()) in the previous
approach.

For NODE domain, the cpumask retunred by tl->mask() depends on the
"sched_domains_curr_level". Unless the "sched_domains_curr_level" is
reset during topology_span_sane(), it reflects the "numa_level" of the
last sched_domain created which is incorrect.

Reset the "sched_domains_curr_level" to the "tl->numa_level" during
topology_span_sane(). Although setting "topology_span_sane" to 0 in
topology_span_sane() should be enough since all domains with
numa_level > 0 currently set SDTL_OVERLAP flag, setting it to
"tl->numa_level" makes it more explicit and future proof against changes
in the same area.

Cc: Steve Wahl <steve.wahl@hpe.com>
Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/
Fixes: ce29a7da84cd ("sched/topology: Refinement to topology_span_sane speedup")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
This issue can be reproduced on a setup with the following NUMA topology
shared by Leon:

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


This topology can be emulated using QEMU with the following cmdline used
in my testing:

     sudo ~/dev/qemu/build/qemu-system-x86_64 -enable-kvm \
     -cpu host \
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


Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
'x86-build-2025-05-25' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
---
 kernel/sched/topology.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a2a38e1b6f18..1d634862c8df 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2426,6 +2426,15 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 		cpumask_clear(covered);
 		cpumask_clear(id_seen);
 
+#ifdef CONFIG_NUMA
+		/*
+		 * Reuse the sched_domains_curr_level hack since
+		 * tl->mask() below can resolve to sd_numa_mask()
+		 * for the NODE domain.
+		 */
+		sched_domains_curr_level = tl->numa_level;
+#endif
+
 		/*
 		 * Non-NUMA levels cannot partially overlap - they must be either
 		 * completely equal or completely disjoint. Otherwise we can end up

base-commit: 914873bc7df913db988284876c16257e6ab772c6
-- 
2.34.1

