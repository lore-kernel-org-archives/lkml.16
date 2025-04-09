Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D62561D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197420; cv=fail; b=bCx9RqOYv4aiJd2lC/OXnh+P8Bva18BH+1A1X+77iaW+cmVFm5efHwIvCWlvhpdGTXW4ypuiDwwdXhEoEfi1y46IoRmCtHmLXHPdjqMe3scf5BmYjY2FupPjadw/crxAkroGKEPRxFv7MVqF5vQNjA3Q/77cu5WEPilzvKA9w9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197420; c=relaxed/simple;
	bh=4nSn+GAO9m8AFD0xsJD8XZ0MBgk/A0cDRBNWDtcvkcU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PzsqVHs8SJGoD5gHjPDsOShA8mYXMQhHS0qPIy1FUK06cQOibS6xNTdw76wDlJ4Fhn7UWEYGBZpbhtwtHSWWhKxxqR1PIdMkv32GSwEqjsvwoecmMMMasOzVRw2k0QJ2S5pa/S5GzOCiIj+Gb0y/j//12KiRMUKgxM+2cRSCaJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DbVteIn2; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DbVteIn2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSZzgLG9SPJsrnwHryAp2GkFdwx3NzT1y66S/lFIrSWV55O6BUjAMWcCzBWBAvc1iohcb3Pd/SVtiiQ0hQ7TyyBIQ0x5vRZPzixkTOY/fTojslfnGV/l3movVZbAfHpxWCAQWY6dcEFKxRyWtmphbrZYVQQN7ckIHEtey+8TYAE78fGlTvrOplULdn4sMZGjqCTwb1tAcEtk6rX+eXAB7u3q+cnEDz9A3TifwyRogPE1upd3NZwrMHJDGoA1EPFd4euhMzUTsU3TVgdEBceYEJznWFDikjczhdx5kIhLyxk4aeP6Box6SFB5glSRlqU9CMAz7DJsRHFU6S1OeWIhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG4j9+b2ocjbwFW1eF/eGqXt241uQykSvmzqc6AQO4s=;
 b=fjXPDJ0bIVlF0uRQckfEMhQC06BsY3R2Fj15D7l91aI8q45FKw9R/C2PL6/H+dgBuZj9f0tDjVf+ftrKQ5iTt4sPfJwl0zFfNiIYHnSpttfAPi8J8sXjfSlkoSpKUJc/pvlZY5SSHc3/nbnEgD8+TxeHIyzqEQBPpTo2c+OZ9cjRlbLdQZyPLzj2K3xmpUt4ZS2gCwdA8xXvfjQuLYRgvyqxceWjQz18Mi6eC01Wmcb9xvoVA9uaU1mfyIVGpw9rgOZ5jGlKwrMotSq6lMDzfm6P3RU/EQw+BG1lfm6kTyMOsP5LLvwmT/lZyxuEx25eY7KcKdjaNjYg8V2rcX/pCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG4j9+b2ocjbwFW1eF/eGqXt241uQykSvmzqc6AQO4s=;
 b=DbVteIn2JOFv4H2A9+hCBzXOASILekByZgx0boeVLqpF9CehvNM1UavlajLbPiCdAXma64Q4lzgQtPthYQdsZrJjlEQ832w29xJEV/GhwKC2/1yRiDaePtLIVEqhkg0maZJESJcTpgEE4s+WpB5Pz+Sy2MJey3B8bpjzZI7Z2+I=
Received: from BY3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:254::27)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 11:16:56 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::ee) by BY3PR05CA0022.outlook.office365.com
 (2603:10b6:a03:254::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 11:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:16:55 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:16:49 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence of pushable task
Date: Wed, 9 Apr 2025 11:15:37 +0000
Message-ID: <20250409111539.23791-4-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: e54c587e-d4d9-4eeb-7356-08dd77580973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4WmP52plH08zwmMUKj71kyEOPXVb+gELOgzlCLjnxNJhbZGwSYCi/4FMn1d8?=
 =?us-ascii?Q?IaTFWqljMsUpESLqTWb3ho+4DrObx2V6vRnRCyKHegv574OQwiBGF/alfHMh?=
 =?us-ascii?Q?yFb5jIW4G3MJOajjcuKA/2+yXZLbEx8wvnQB2092UV6xONXjSNUuz9TQNBv+?=
 =?us-ascii?Q?+WBQ8nZVQmV83TXUQex2SNatzWQvT71IbjZ3RF6kPnOh6U/aozKKG9YmH/Xw?=
 =?us-ascii?Q?jmurOawqSHPGmKNwMvbJUfruRlF3QOGm/XXn7cPHn/PIMIF8oDX0CAx28z6q?=
 =?us-ascii?Q?2EZt8vbft1/yWANI3FHj4/UERTb8kEi+WDtS75PzFo7xla7lHftuEwIHXBWA?=
 =?us-ascii?Q?4aLumeSWVtm0gJSr/GYJGAnzifa4h8yWC25y3tX4mnMfofMyCTF8KUnATf65?=
 =?us-ascii?Q?On1vS52g4QqhibquR1mCWMW0VkrAMJ8kuNIAO8/cVQmcS1dQA/atF8MQkSdn?=
 =?us-ascii?Q?xZnQYOjrbWD/aloOWw+f3UrPguAubsUHAAIQoCwXDX6uH98AEdxPxDJI7Ven?=
 =?us-ascii?Q?bg+L5nVGZkkKFNKJl34YbAQ33T6lLib26tSLHu+zAWnuDITiRwnTSWD54u/+?=
 =?us-ascii?Q?ZPdExQwWuSLnNcsLkw7FUhTvU03iozQgN1CTgtVwwi4SWy8hAoWVGYx7JBEl?=
 =?us-ascii?Q?SBy9e9SJUllAxKD3qX0gdW0pdc/dGMShLCdseo7wlmR9Gxte8ddfnkVi5/fQ?=
 =?us-ascii?Q?5DVleaHMDhzM0ufvzR12z5VKkWs0jWHVpiUuYzYmvH9Hcjaj654QkbPJoVrZ?=
 =?us-ascii?Q?7reLNQePXSjRx9Q7TyrZqcI6+IFngq1q9Ig0MRXLV5DQvN9TYhQ7KhGkz0fF?=
 =?us-ascii?Q?qoKQpNTM9x0Rfjb34AzCpxgwRdkmFKxc/d0xHZxpfpPzXqNd+KDhxBnUAXPB?=
 =?us-ascii?Q?L4rjQcMiMkKKCqbNWO3PiZ1yH7lZmv0NOITaQiSFAL/J3HUUfhXLp/Yw7l21?=
 =?us-ascii?Q?mUQh0dB3U25+0iNY60/oB2a5dTvoY+5BvwsyRCuyvAEln03CU1lFaoNt61Zy?=
 =?us-ascii?Q?K6q6QPjKMggB6bwIQLV/6OLvLbf5mEZVuXK8M4qZw5NblaUz2cPFh3a4NfM0?=
 =?us-ascii?Q?8esjOTxWj9lNwnw0XsQzw7HvgoWk+8b/pfxhgBKkgoFnwbnEyWqYl4plOX3h?=
 =?us-ascii?Q?NRVb9zzfy7Al/mg6h02BZuw06suoOLZAbPTrcTKxgr74/sB5mylSdZHTvAqx?=
 =?us-ascii?Q?s0qhZ5FgTAA9UR3vPKuByzk3/e7XsbtDMytt5Q8pEAkDKBSERh6/X3048hwS?=
 =?us-ascii?Q?O/jBHaSEG2IvzSkaIFdqJRaw0E40qdXfyr/cdxz/Q+m1RqdTLaJCq2lnroSw?=
 =?us-ascii?Q?nUbPe4SPoJ7SH4Qtyj9rlplpmLzLODa9LN2QVorou8UNRYb8OUROkyYux6ue?=
 =?us-ascii?Q?QJpxhihqVz1mHfWLmn0pw7f/j+DvNPdD9l9zakrpGBOSjU7uQpQ+RxF5p9JW?=
 =?us-ascii?Q?G5EVunfvpQK9y04WDDkGacVGaYRa5Yq8sm3FbgzZKvLPiCXtQsIMGBlIcaHa?=
 =?us-ascii?Q?UtOv+YloUeWTorDWi3dZ65ymo6CfXL+yxMqf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:16:55.4460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e54c587e-d4d9-4eeb-7356-08dd77580973
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053

In presence of pushable tasks on the CPU, set it on the newly introduced
"overloaded+mask" in sched_domain_shared struct. This will be used by
the newidle balance to limit the scanning to these overloaded CPUs since
they contain tasks that could be run on the newly idle target.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 98d3ed2078cd..834fcdd15cac 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	return target;
 }
 
+static inline void update_overloaded_mask(int cpu, bool contains_pushable)
+{
+	struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
+	cpumask_var_t overloaded_mask;
+
+	if (!sd_share)
+		return;
+
+	overloaded_mask = sd_share->overloaded_mask;
+	if (!overloaded_mask)
+		return;
+
+	if (contains_pushable)
+		cpumask_set_cpu(cpu, overloaded_mask);
+	else
+		cpumask_clear_cpu(cpu, overloaded_mask);
+}
+
 static inline bool fair_push_task(struct task_struct *p)
 {
 	if (!task_on_rq_queued(p))
@@ -8606,11 +8624,17 @@ static inline void fair_queue_pushable_tasks(struct rq *rq)
 static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p)
 {
 	plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
+
+	if (!has_pushable_tasks(rq))
+		update_overloaded_mask(rq->cpu, false);
 }
 
 static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
 {
 	if (fair_push_task(p)) {
+		if (!has_pushable_tasks(rq))
+			update_overloaded_mask(rq->cpu, true);
+
 		plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
 		plist_node_init(&p->pushable_tasks, p->prio);
 		plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
-- 
2.34.1

