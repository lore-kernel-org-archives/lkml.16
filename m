Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C92561D3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197401; cv=fail; b=AZ8Pdg9x5rDJv46WmcDh6ML1nIytJaMfUAu43KmLkxzQDSnw3s72TUw1CB6uJMSq4m8ilK8Ql0U3kuE7deZOJ6rPvtCKkLunwPhs4L6H0QjSwty71hmWe0scB8VBOUV4qUo7KJ8XAiDLGKzQBgGEJQFjZxseiPmxjQ8QxGs57x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197401; c=relaxed/simple;
	bh=DhCV7UvZubMo5Yn7uYLodz9lrKpzjW39fx8Z/6bN1bM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAPV1OkorrTeTSIDe+99bsPS3vq37c/gWQPnVBr8IzutceOhoaW+htEizjF9zoJpewyy9xCqkdeC7Jwcqdto5kDIyerlOXD424id6rK9Yr5BfX5u4pKqjU583JRYwpuqkBGvFhVHgNVzrIcJQR4tJxMtVvthfBHzbqZgE03kFTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uDaf0Y+L; arc=fail smtp.client-ip=40.107.223.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uDaf0Y+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OohTrRN2pdmcEbgYzO42rLfu8bMqdhDTx8mta71vMh+fQIWkE+nvl6kh++EruiJqFuddstZnfQiKkYensiZ/IEy6/7hD4vHGwaS5zhNugxL2Ka9T0R2j1km0iVrIzU6ZMZE45aPPGoWiZ3Q0P5d17Kb7LDBoSEkOrGCYt+rRy/pHCjzta7VAp9+QWkYdjtXpm3tKhSpYKOmkbli8coDg2W0Neip8Xr02ecE5Nusc+8GjpUdMe7+bQnvPf+LYmdP2rCNsPC9AfnmyN5BMekCKo89FXO4fwSBomQV3dIUngHtduhMtsrk3L3fal15A/kua+8JgRAi0jljrUCUPQcmaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te1g3Y8fwXuE/MHIGpEY/XmraX83wwpTWzsQjrF/yQw=;
 b=OBP9UTTcJ0+a1jKjlOM7ZL1+hvNIX48QjYVYEYqL1r1yDynO5N5uDvdqZvBGouOY0kdQbcVRyrbvrrd9HiuzebhrF0llWhOBbHcVFUO2QW51VgAuZOfsETRs/AzsAOVuctJIN47hHku4qk3djY9k2UP7C3HXvRnDx3mgjo0+BHtghkCmMxB9DWlSlgY7Z+LPV4Lx1yoRvgRHUMrSTL2Bfm4Q6iSDwKt7AVOUwE1gb0kJ/8xrJ/HMIqDp9VWRcPXK5vBZZRgs2s4rQ/C77K5BQHAdyCTf4LfPVppVt0gmbIW/fDimoU+IuyiM0CcAFg4xvPAvarhkwc8Gm/kXv5dOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te1g3Y8fwXuE/MHIGpEY/XmraX83wwpTWzsQjrF/yQw=;
 b=uDaf0Y+LqUsRzGywssXEVh97uO3Fupj4VEsDXSPDP63KDgMg18fcbBWAOavk/mzRR8tM+/wO89whIbH/fKx+2qgedu8ZEi3Gb3z/lcurVStC0abaiq4XboIiKpE34xulvk07l8qzZk70IfVfUQR61xv2oCV/vhCNJsnRA+wPbUY=
Received: from CY8PR19CA0039.namprd19.prod.outlook.com (2603:10b6:930:6::25)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 11:16:36 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:930:6:cafe::7f) by CY8PR19CA0039.outlook.office365.com
 (2603:10b6:930:6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.37 via Frontend Transport; Wed,
 9 Apr 2025 11:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:16:36 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:16:30 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 2/5] sched/fair: Introduce overloaded_mask in sched_domain_shared
Date: Wed, 9 Apr 2025 11:15:36 +0000
Message-ID: <20250409111539.23791-3-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409111539.23791-1-kprateek.nayak@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0a48cd-2146-4fc0-f511-08dd7757fe2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vn8vMhEpeYydEAzwFfLGl6TFTZA7eJksNWj3IfR2vz0LzY9cLmY+rcfdeL9b?=
 =?us-ascii?Q?SSLQqApIVTj0Tl/e5wTHbsTPBo536bd5FwaTECcyQSFpYeo8Wr434oalOxeu?=
 =?us-ascii?Q?4uqnXDeZ0/Y1+saETprLyvjL53Q+fDhkVMHxcNRhJX/FWa4YQQypP2RzbJfD?=
 =?us-ascii?Q?5ArDyR+zbrxWLQBoBdCwZuwHKoPYO1CFudGThaV3sBcaQhnWQ1LnTU7ISnV8?=
 =?us-ascii?Q?yCgxp2qoJM94hjTYOhBKHKqpRfNnAUtJxJkN1Brb43WYMMv5N9Y+/vkLykb8?=
 =?us-ascii?Q?BfCePRUxOqJP8y9KZUWGT9/uGuc/zycfGL87wRX87xNkQxG/S+xr4bUezJ9f?=
 =?us-ascii?Q?LC71HyN84zVw97tCs48JoVKQB420Qg3auORLBDROLb19dxwj5zRET5/tZ2nc?=
 =?us-ascii?Q?LaZYYeMDupVt1Yaas1Wd+xZrN2chZoI0XdEIAOZ8E7k4NvHlwxExNnKQqw5f?=
 =?us-ascii?Q?uvVD7Oyw5JgGIzIhOqdGsSnW5MQnoC2lTvgDZaYfoX7Mxld91JEqIiizIopd?=
 =?us-ascii?Q?LOk6xGb5lyvse+KyVn0oheMFQplsUW8TBwD4u3hw7vOiCBtJ1nTV34RZHJfm?=
 =?us-ascii?Q?O9k8iXMvA2xk+VfOmGh6lnSZLbNBbnUDWIIPXusRT7Q9ebqKVrK5Qp2y7LAx?=
 =?us-ascii?Q?SZNrMJRfE8wuJH2oIbA2NLCDTVBg+1OeufEnF+8AkhghPi0sj/O8ZXFWuLPM?=
 =?us-ascii?Q?DKxIJT27zpHLCFVU4wCnLnr5iHj4syfw8YXECJh68P/+nLUHiS5MbUB09+kK?=
 =?us-ascii?Q?WOkq/xqYbRPdlMsHHRkR4/gA4SZBu+kluBQ2JAUPYAFIeCNj3Ng7xO3o8Rgh?=
 =?us-ascii?Q?53mkgPu2S28yESW8Blz7uybeddQnJLp3hAAs8l7Fq2u2jYfR42xIM7QJJqJH?=
 =?us-ascii?Q?TkOte2Se6sj9pyPvJ5l4WwM8Eg2bEsji25uAWQb/+Br+soGkUYTooktGmX1R?=
 =?us-ascii?Q?k9Ldm7YRyH7kNjmi/Ndgzpn94mKnLHWN76+7+RvohEcItkETyq0J0yPONlFG?=
 =?us-ascii?Q?9L9e5r2WAsU28iSXU8nOHmAm7kqJNpeAb7M0cXDB4Xb9kqDy8Wf8v9uxJ4MJ?=
 =?us-ascii?Q?xc4ufgTd3kZ+hUA9zD+AEGBgLnOIfXgOTiq7kpSxop+7oF3gJRoevD/fr7ni?=
 =?us-ascii?Q?WexE3W6rQWW6w440lRkOdsBu2OU3y2Ab75j/ty7Fx0InSoog1z5KSG7VwI0n?=
 =?us-ascii?Q?JZTtT3FLUxxJ0CVNUoMWRrKOwAOyfeRnRyHUiokRdfLgMSgXYFPh29M3ZQ/7?=
 =?us-ascii?Q?wUxU8L/7vdddaATr+XAPCgraZQk55GEn8WkxuzSG42n7pL9NSQ5IQzm9d3Z7?=
 =?us-ascii?Q?08qbAw0QGgkrp3fwEyyT16AATsL2d/rQUTwOxioyyJDhJ4IGDlIK3utKP97k?=
 =?us-ascii?Q?iCd+KN+Bf+Y2RnG1H9RxbH/Pr+EzhckpmiA163P3kcJOh1877KB2sDcDaRl1?=
 =?us-ascii?Q?vW6eP7zeR1Z0AZ19WgHmHXYOOn6+H+DlUqg9CRoMF48dgdgo98VZ4Oe+IGTn?=
 =?us-ascii?Q?jWjLSLFbCt/kqVo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:16:36.5135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0a48cd-2146-4fc0-f511-08dd7757fe2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

Introduce a new cpumask member "overloaded_mask" in sched_domain_shared.
This mask will be used to keep track of overloaded CPUs with pushable
tasks on them and will be later used by newidle balance to only scan
through the overloaded CPUs to pull a task to it.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/linux/sched/topology.h |  1 +
 kernel/sched/topology.c        | 25 ++++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 7b4301b7235f..2fc3794fd719 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -78,6 +78,7 @@ struct sched_domain_shared {
 	atomic_t	nr_busy_cpus;
 	int		has_idle_cores;
 	int		nr_idle_scan;
+	cpumask_var_t	overloaded_mask;
 };
 
 struct sched_domain {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index bbc2fc2c7c22..6b1ef953b571 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -638,8 +638,10 @@ static void destroy_sched_domain(struct sched_domain *sd)
 	 */
 	free_sched_groups(sd->groups, 1);
 
-	if (sd->shared && atomic_dec_and_test(&sd->shared->ref))
+	if (sd->shared && atomic_dec_and_test(&sd->shared->ref)) {
+		free_cpumask_var(sd->shared->overloaded_mask);
 		kfree(sd->shared);
+	}
 	kfree(sd);
 }
 
@@ -2239,27 +2241,31 @@ static int __sdt_alloc(const struct cpumask *cpu_map)
 			return -ENOMEM;
 
 		for_each_cpu(j, cpu_map) {
+			int node = cpu_to_node(j);
 			struct sched_domain *sd;
 			struct sched_domain_shared *sds;
 			struct sched_group *sg;
 			struct sched_group_capacity *sgc;
 
 			sd = kzalloc_node(sizeof(struct sched_domain) + cpumask_size(),
-					GFP_KERNEL, cpu_to_node(j));
+					GFP_KERNEL, node);
 			if (!sd)
 				return -ENOMEM;
 
 			*per_cpu_ptr(sdd->sd, j) = sd;
 
 			sds = kzalloc_node(sizeof(struct sched_domain_shared),
-					GFP_KERNEL, cpu_to_node(j));
+					GFP_KERNEL, node);
 			if (!sds)
 				return -ENOMEM;
 
+			if (!zalloc_cpumask_var_node(&sds->overloaded_mask, GFP_KERNEL, node))
+				return -ENOMEM;
+
 			*per_cpu_ptr(sdd->sds, j) = sds;
 
 			sg = kzalloc_node(sizeof(struct sched_group) + cpumask_size(),
-					GFP_KERNEL, cpu_to_node(j));
+					GFP_KERNEL, node);
 			if (!sg)
 				return -ENOMEM;
 
@@ -2268,7 +2274,7 @@ static int __sdt_alloc(const struct cpumask *cpu_map)
 			*per_cpu_ptr(sdd->sg, j) = sg;
 
 			sgc = kzalloc_node(sizeof(struct sched_group_capacity) + cpumask_size(),
-					GFP_KERNEL, cpu_to_node(j));
+					GFP_KERNEL, node);
 			if (!sgc)
 				return -ENOMEM;
 
@@ -2299,8 +2305,13 @@ static void __sdt_free(const struct cpumask *cpu_map)
 				kfree(*per_cpu_ptr(sdd->sd, j));
 			}
 
-			if (sdd->sds)
-				kfree(*per_cpu_ptr(sdd->sds, j));
+			if (sdd->sds) {
+				struct sched_domain_shared *sds = *per_cpu_ptr(sdd->sds, j);
+
+				if (sds)
+					free_cpumask_var(sds->overloaded_mask);
+				kfree(sds);
+			}
 			if (sdd->sg)
 				kfree(*per_cpu_ptr(sdd->sg, j));
 			if (sdd->sgc)
-- 
2.34.1

