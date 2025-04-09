Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF22561CE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197367; cv=fail; b=cPfNLbAT8UmRGtqXY2UN04Lps9zcARV6lY2G2GyAfYN/1u/b97hcsY5oP0lOuabaak/yGPIxyGNlGs+xBKLscBvwnk+dB167D6pGLXOMqCYnA1YYwTCCZsHvdInKG499jDfJkma5Himx2sl5TMU2c1zBAH3vjDW9IS9dn/ap6XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197367; c=relaxed/simple;
	bh=O4OaLaZg8UL1lGoBT42QsaUFFfM6nGTAH9Gb7PJ8lDA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gV1jiXyDKPvCf5OY1Xfq/Z6ZS5LuRgT2STwUf6blkO9qix9ImbU33osi6gzMo98Do5Jst832lBLEcsRqWVMx6zkRf11iKCY0N+Im0vgMY76hTG/3gGdO4ijuSbNRR6FVUpllQt8oOxlHjPhQ9IcLhaR0gTXG+PpRTdJjOP/sWos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g8zX5XP3; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g8zX5XP3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxruYfwVYCQMB8QJXETERoAS/gWKbzYCgD7CqxaV8E3x3ug+FwQ3GwNA1w4mRvh3vAkHk/YKYNf0VzCbxAP/tqEtNK+Os/upa6esV/lqBJ2z/Ty29rGx4AxU/sbWVBl/jzfewH9gbraU11xIlATkiT5b0yDUcaGZX7ZLCDADvwFiKW6a0kRMyRW/v4UqN3Vs3JsNH9YfVWrtNezV/Q9q3zBzll7mW1/VLV1FDSPdi3n3Qr3VvbdTw82vqJMEGeE2IwaXjw9LjEAnCBefDq+bMi/VYmNa2g6QW2mspqY9ytzW1y/1A3KBwG1LGUiil0V+CxO+bfz0YFAnJqbhouslaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYw1LaIgNKo3SJ+Yq+WYdTqKiyWr/uE5RRC0Weuo5XI=;
 b=X+0gia10zsJ3+Hf2DrhoQ92p2eW0r3jlQj8wKww+O8mGo8pZ6RLnpBMPLhCkXFurGtes9xAtzDJD9jBtAxzlj37O3Yq1Ea02HWFbkZOg9q3tb7K51OGWfWB5jdOMksX1kJlCmaPc5+sKhjbQiINI1YfFeEB24mpo5PaX90AcSB9E22EgGMdIZUOf/vovbCTQFMt1dizJZqBAXhFbYNHSILGpFK4uCx2z8GKQxt1bRDezyjlVt9+NSJmLQc45ToSNqkBaudrnSIqpwjYGiKNz4NxHOvIAlPV/5GX3U6fFKRx2vKDpDHmpiMDW2YPgcUC3eY062C2BEGLBpNlg4/Ml+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYw1LaIgNKo3SJ+Yq+WYdTqKiyWr/uE5RRC0Weuo5XI=;
 b=g8zX5XP3c5YJOLsM/6bbpOw+RTONzR6xm5pK5MpsRSebJYjeooY7Mt3RZppx/bZqz/wlRF11gzv3vxIMO8YvqBSUHTaUSz8TPRJ50hSpSfy3OZOUA88tTwqVwq0RxrEtaf1tJajHoxQbBv2uHk4KMwzoCzuoBiDv9kkDVK8f3XM=
Received: from PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::34)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 11:16:00 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::b2) by PH7P220CA0158.outlook.office365.com
 (2603:10b6:510:33b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 11:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 11:15:59 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:15:53 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 0/5] 
Date: Wed, 9 Apr 2025 11:15:34 +0000
Message-ID: <20250409111539.23791-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cc3b0b-d66e-4ce6-ec5c-08dd7757e813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?boa0njwUtgeEquuDYR37x0qcd7APaopigxnAC+JmApnSpj0CcttU2QFCOCfz?=
 =?us-ascii?Q?SgzZXQTj80GDg3YTL65KB51KlaKwQ9kZOMqM8QWW9JwVgYs+eteArfo50Buk?=
 =?us-ascii?Q?qBFO0UZbXNF6+RgHHRJKwMFo9sw8BPWPTfepJLa0TOtjrOzyccBCmHwpmv/M?=
 =?us-ascii?Q?xwv9n2iepYK7mZUDWr6mXOCFQWPFHDR02XVVTAGUR/o6aC0UviP+NRIXGDgX?=
 =?us-ascii?Q?2OdB/NIVLLhOgrUfjcB+ECr7or0ll/dhlOYL4KvmKcZ8JCVETAhfm3lsOw2J?=
 =?us-ascii?Q?v0Za+qjO1nbHQjiZoOW0J+8kTVa0w8octNRHKgBawie3ZSeV8Uf9bkzCI58+?=
 =?us-ascii?Q?PoTN91Sbb3uEziFP5W6Xu3ni6/vpE7X3MgZrXpBu395ulbwYO6Z+GVrMmhcN?=
 =?us-ascii?Q?OFXBYLuZSDJz4+pXmTJ1tAznfRwctfVNkWL8UY3zzo6Az8kBPLMiCUgGkKIj?=
 =?us-ascii?Q?f/Q5FiWgYuA+C1dQlvg7JY6dtqfa5GMCyfXDJ8BN3Lj50b/prCN6kd/yGQWW?=
 =?us-ascii?Q?MGvgTjEXCPmix32F/FHMuL1CtZ0pCM4EYvYiEv5E8zf7QE+Jjc6rocwUyufH?=
 =?us-ascii?Q?J3XcFqOfALBYa91Y6V1jVamLQsoFGkFowz2uYthAi52XGaxiEpVCi19iRejP?=
 =?us-ascii?Q?c1hgDYxuiqJwjIq3dTW6kBDMymadLZb0+MvMUeEPwk5TVgSqmIVoSdsK0N0K?=
 =?us-ascii?Q?cB5XxKE8jO+SWuRdXMAx70a1Nw7ULzMkDTwvxI3E3Xaz/CqFQ3omrV337wEd?=
 =?us-ascii?Q?Sa29ZpaRrbTG5Q7uly0FA1lGuAE9PK71nEc+kTl5J+TpnZ9lBvpExtD0jxkS?=
 =?us-ascii?Q?hnztDk5FnQBoyFWaUz8RqtNwiOXdkeqBvKe8Ulg674aeA2eRon6fwCSiU+Gu?=
 =?us-ascii?Q?yDmV8DKWxSHGHDTuHKyUhBkYRdRKWFHlSaXypG2LVLI96b+KFPWdAh/+aWTB?=
 =?us-ascii?Q?NXJrQM2xtn+i+D1paVDu3iBDSj6Q7y4zM2gj3Xai7usKMKIrnoqXVDN/KLz3?=
 =?us-ascii?Q?3uyQxhItjo8GprgUNf3bE/L940FrbwkRa4x1hA90dGBqPiqol2JDo/60rFHP?=
 =?us-ascii?Q?12C8Iuybf/NwO5Hz2b0wSInVI/5fX/0CACCsc9VATt4cz4UfhknrI4Vf1873?=
 =?us-ascii?Q?4xMZ8zJ9HpDKCUv56pvF58busdb74FxJaaGDoVOENhSUx81t035PwSM6qLYw?=
 =?us-ascii?Q?0o3ZozHiSyl7hFmnVnd6jg1Kyxu6lI1aerl26ifuGxPxyh5wGvpkmB5onqGm?=
 =?us-ascii?Q?Nyw3njmruDYGTrLQjfzbjK9DWi7j4MX5i9riZpK3F+UaqJc9G9OoYSozdI13?=
 =?us-ascii?Q?aDdaeVpJkXhoXyC54VWvO1/GgZ0MZoUGAS3Q3Q3DOh33747C1hNY3k+PGPFd?=
 =?us-ascii?Q?YU43vTRl8WpofmFprwLfT0IfeTQTRjzyIW3p3WKDSDDYpG+6sUYfIp60phep?=
 =?us-ascii?Q?+54hVB2ZWdzg5K0/bPuiAqeP/vxBOCTz1UEcfh6URyUTSW6R6HGcJNSSVa11?=
 =?us-ascii?Q?ho9QBTxamSXFK9A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:15:59.4395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cc3b0b-d66e-4ce6-ec5c-08dd7757e813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562

Hello everyone,

There was some interest at OSPM'25 to explore using the push task
mechanism for idle and newidle balance. This series implements one such
idea. The main reason for the RFC is to understand if this is the
implementation people were in favor of before trying to optimize it for
all the workloads from my test setup.

Note: The current performance of the prototype is rough. I haven't
optimized it yet since I would love some feedback first on the approach.


Current approach
================

The push task framework for fair class has been cherry-pick from
Vincent's series and has been implemented for !EAS case.

This series implements the idea from Valentin [2] where, in presence of
pushable tasks, the CPU will set itself on a per-LLC "overloaded_mask".

The inter-NUMA newidle balance has been modified to traverse the CPUs
set on the overloaded mask, first in the local-LLC, and then CPUs set on
overloaded mask of other LLCs in same NUMA node with the goal of pulling
a single task towards itself rather than performing a full fledged load
balancing.

This implements some of the ideas from David Vernet's SAHRED_RUNQ
prototype [3] except, instead of a single SHARED_RUNQ per-LLC /
per-shard, the overloaded mask serves an indicator of per-CPU rq(s)
containing pushable task that can be migrated to the CPU going idle.
This avoids having a per-SHARED_RUNQ lock at the expense of maintaining
the overloaded cpumask.

The push callback itself has been modified to try push the tasks on the
pushable task list to one of the CPUs on the "nohz.idle_cpus_mask"
taking the load off of idle balancing.


Clarification required
======================

I believe using the per-CPU pushable task list as a proxy for a single
SHARED_RUNQ was the idea Peter was implying during the discussion. Is
this correct or did I completely misunderstand it? P.S. SHARED_RUNQ
could also be modelled as a large per-LLC push list.

An alternate implementation is to allow CPUs to go to idle as quickly as
possible and then rely completely on push mechanism and the
"idle_cpu_mask" to push task to an idle CPU however this puts the burden
of moving tasks on a busy overloaded CPU which may not be ideal.

Since folks mentioned using "push mechanism" for newidle balance, was
the above idea the one they had in mind?

There seems to be some clear advantage from doing a complete balance in
the newidle path. Since the schedstats are not rigged up yet for the new
approach, I'm not completely sure where the advantages vs disadvantages
are currently.

If the current approach is right, I'll dig deeper to try address all the
shortcomings of this prototype.

Systems with unified LLC will likely run into bottlenecks to maintain a
large per-LLC mask that can have multiple concurrent updates. I have
plans to implement a "sd_shard" which shards the large LLC making the
cpumask maintenance less heavy on these systems.


References
==========

[1] https://lore.kernel.org/lkml/20250302210539.1563190-6-vincent.guittot@linaro.org/
[2] https://lore.kernel.org/lkml/xhsmh1putoxbz.mognet@vschneid-thinkpadt14sgen2i.remote.csb/
[3] https://lore.kernel.org/lkml/20231212003141.216236-1-void@manifault.com/

--
K Prateek Nayak (4):
  sched/fair: Introduce overloaded_mask in sched_domain_shared
  sched/fair: Update overloaded mask in presence of pushable task
  sched/fair: Rework inter-NUMA newidle balancing
  sched/fair: Proactive idle balance using push mechanism

Vincent Guittot (1):
  sched/fair: Add push task framework

 include/linux/sched/topology.h |   1 +
 kernel/sched/fair.c            | 297 +++++++++++++++++++++++++++++++--
 kernel/sched/sched.h           |   2 +
 kernel/sched/topology.c        |  25 ++-
 4 files changed, 306 insertions(+), 19 deletions(-)


base-commit: 6432e163ba1b7d80b5876792ce53e511f041ab91
-- 
2.34.1

