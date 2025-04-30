Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429531E8335;
	Wed, 30 Apr 2025 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994406; cv=fail; b=fTYD6gw0at3Ycm91ipYX5x65ivxUK0ZNUhl/0jmJqHxBnGV1hLOTtfwhCB8t22WvJeoWIMyd34S55DpgugqUV9kWO+QEOfSVWTC5MZe9shP52rQGUO0Y3Zy9nEiR7HDTaCaYqRVFxdfbTFvPJHoAqB2m1SVW/Avs1+lh7hkHug0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994406; c=relaxed/simple;
	bh=Md0CEA9iC9dD6Ms2Kk7OMPaNXRtHaAl/xW0ePeXwMNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zs1FaUkrKhzhrnsL61jMmGseXCUBgckPxxCSPuLY+aeTK1howbx6hI9+Dz4ZgfKaNE/qIgd0KSFJ4ivcrWWiJ2GXlxI/yLA7UpNUDkl/a6tLLfosysGiotnSa75wBEj9Tx7YaDe7cr2xmV2st1TwlVUpOiufACODYbOS68pPibw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3bJzfaBu; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3bJzfaBu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um2EW5nXZaLPnGvtNqJ7FXgIulhlvMZ9GSPXykWQmwhveVKByTK0+LBsPQTm3oqQR514pOz7HiD+WwWU2u3YYpkysiymXfgMDS5qgtm1RR/fpmhnFHl0tmpXL4bWz2E6i4+cNqcGvdlYunI+2iuocGlX9LlPRtA64dvA7b2FbFcwzdZMHy31iCIMsyqlf8LYkiv0hzFXMK0nc612UUX+VJmRhVmcvNhqqMsa8ketEcXZg+ZP+sz8m/q/ZsAsIO+9LBkv7E/Ks3ya0tfLK9xIftrbJ2da612vM7bBGYqPhcWuSNwxFhTTgG8VXd+JY3SRysPlHIPiUoHnSFsL+IuxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nydIcMmOOMgwWXL+tcDoY5uJvI/7v2BhmnXgIMVT8Ds=;
 b=vmS+uwfbyj4NaomJK3nK4FZSRAcz4AXx+SaiBZ+iS7XpRj2L9FsD/9gRSr0aKPeTRuxFMqvHvGXY6dEgttF7wvhnefqaOdXuJsuV5VrOaQctj2x2kn+NGZLrwP384TlVRM4blU57u+Jq/ZxBGc8xVuDj0jGUuxcQNCfi3S8eEtZVb+KEFO+2mA1w4PRw3w0rmxagj7XxyNXy9kQhKxUhzjwnaQmbAUdoPYvCmsDaRnMTTYhFwCWHg1MTH5fe48Sud7UXYWChin/OhRfuE8X8mDLZijZxCF5Iau4SpHbZ9c1tWdYtKjM2btnoG7gLEjLR6X/A/EakNmUxJXeDS4y+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nydIcMmOOMgwWXL+tcDoY5uJvI/7v2BhmnXgIMVT8Ds=;
 b=3bJzfaBuziQCIyNlK1M3Ut0vxc2V2BhN5My/fIegVjT3LqqkjtB0TyFsPB6DAOoFrTiMzbzrt+fsyZIXMVRe+z29o0vyWwlCQqemv2BN7QP499ea7NQIKDv+hUpJTaksfTOSaSdwyvZWpAOTZSP9SplHiNSKIWiSwO1x+Shgvsc=
Received: from MN2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:23a::8)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 06:26:39 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::dc) by MN2PR03CA0003.outlook.office365.com
 (2603:10b6:208:23a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 06:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 06:26:38 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 01:26:35 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <corbet@lwn.net>
CC: <kprateek.nayak@amd.com>, <gautham.shenoy@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<swapnil.sapkal@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH] docs/sched: Make the sched-stats documentation consistent
Date: Wed, 30 Apr 2025 06:25:59 +0000
Message-ID: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: ad218e76-38e0-49bb-952e-08dd87aff6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uOz2UR00rSFJKhPLQjqXgEpw1HF0PxPQHTh8FLTKlc3oGN94ebqwmpepRcko?=
 =?us-ascii?Q?Q5fTS+3sVVqmKL5m6odE7Odv+VhdLI9Ns/zFX+EYuWKmdafnwcE3dj7+n+hv?=
 =?us-ascii?Q?eAk2oiEoO4zfucBaITKq/lSlHSgoXV4UCWXzE96+rbui8wUJZlsXR9y42Qox?=
 =?us-ascii?Q?lqkU14EHBiLejND86j2jjpPvpvxyKCWk1KFlqVzSWn4RzQBnHeq9NZkByAT+?=
 =?us-ascii?Q?K5qukLOzzKiB77Xw0RoR72rku5ylsJRPpwHDcg3xUohaiwdesOrn9uPBZqpd?=
 =?us-ascii?Q?8PkIVZo/Pqb6ACbB/urUqw4W9quC8QRg5zX9601l2axrjObWV7/ixN6jyltC?=
 =?us-ascii?Q?Ohsn44h+DF2HYZmqJFKyaV6qPo4RdjPQXcePDCN8sR9l4OxC9zShKI/0dt0U?=
 =?us-ascii?Q?kPS7UN3TFrZ2Ac/89XkNqNlkw6bTL1yNYsyuIWyn1XfwKduvbMWL3X0zYRzM?=
 =?us-ascii?Q?SMcZscQNZmmnSrpVc9+JNYUsKPUAffnotYxDWt7YUDl/6mHxBtwAxnHBYDj3?=
 =?us-ascii?Q?no6h8z+3A6wKN3Oexac66NsFMQjDpOrJii/FbGNzPgsubTC852+Yz0Lf+4A2?=
 =?us-ascii?Q?rDNPwDLZ0st9zxayA5Z8in/lRd3h5XEKsgkUgHyAdAVfDwhMawDBa/9GJ0c5?=
 =?us-ascii?Q?KfJReUKy7Jse7zDu27JBEHH+0WlF2wfpSdkdt1fsNAlOJWDW1/r+wUjRgBCN?=
 =?us-ascii?Q?TWR5IJSN69/n8iB1jk0uJcMLYHQCl/sXtutvcjWXBv09fHsg5wD9wQUOA8qQ?=
 =?us-ascii?Q?1+t/zNGRNBu7OPQnrg0MMbY7HuRxtOGYQC8caGjuSjGs3dtm40jWoq8z4p/7?=
 =?us-ascii?Q?lQMjTINn4W4Wp5ZbMVFmCD1v2fWSYvG6DrjZ1kzLjxukLZsD4Jda5bBmU3+C?=
 =?us-ascii?Q?S+VBLJ/W/t0FJo2BeImqi7QMZwZcXa7zhYV3oO9BzmQdUBuaBfg5rEfoC74t?=
 =?us-ascii?Q?j+FTQIJ2T7JiaW/L4SPNBzMtV7pE0/6Ot+OO6MSQNE3J+vLqhe6ihYDPr42+?=
 =?us-ascii?Q?0faoiCwypGWmf8DQco26pic/XUpsdlVrbUm05qzorSbeSsDusu9rxY7rZn0o?=
 =?us-ascii?Q?oOLTBH2RnvhDhgUoRcklikpQJfopW+iIQ5tFq6Ytbkl5F8o5P1p0I0hXbUJ6?=
 =?us-ascii?Q?iIC8B64IGr0zWAcF8H+vZEbg0rCKbN53FmzIJv7TMao1GLpP/3DKkVcvPVT9?=
 =?us-ascii?Q?f5KotPjtz3x5hVbZ9G1bHmgFalMKaxyZh+RXoDYL5+WzbbhxJ8MxfiJf/bMJ?=
 =?us-ascii?Q?VdFAhTJWLOv4TwGJqie40aLmUx5Df/VJgp56sKe7GpZzCSHMlq/CJ3QYQD86?=
 =?us-ascii?Q?O8BRuNA05WnZFa1mJ+xAMoU1H9lO+2ELoixhnmIG3OvFFplfEuXExhkQs8Wv?=
 =?us-ascii?Q?aUSns0dj+CxCWW32ckaHuHnCdRQHR3UKgHpV5FCqMiwXpW/9XqiTqRGqdCv3?=
 =?us-ascii?Q?CRirQIzGoRmoiRCKsSWx8be1n0AEyNfhWbk5zIRunqvLICzxXTO9QUglqY53?=
 =?us-ascii?Q?c2DpgZ0C2nbEMSwaa56n2Hf44o7lA/vUvP8r?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:26:38.8362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad218e76-38e0-49bb-952e-08dd87aff6f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987

pull_task(), the original function to move the task from src_rq to the
dst_rq during load balancing was renamed to move_tasks() in commit
ddcdf6e7d991 ("sched: Rename load-balancing fields")

As a part of commit 163122b7fcfa ("sched/fair: Remove
double_lock_balance() from load_balance()"), move_task() was broken down
into detach_tasks() and attach_tasks() pair to avoid holding locks of
both src_rq and dst_rq at the same time during load balancing.

Despite the evolution of pull_task() over the years, the sched-stats
documentation remained unchanged. Update the documentation to refer to
detach_task() instead of pull_task() which is responsible for removing
the task from the src_rq during load balancing.

commit 1c055a0f5d3b ("sched: Move sched domain name out of
CONFIG_SCHED_DEBUG") moves sched domain name out of CONFIG_SCHED_DEBUG.
Update the documentation related to that.

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 Documentation/scheduler/sched-stats.rst | 53 +++++++++++++++----------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index 08b6bc9a315c..ad68cf1c99e1 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -86,13 +86,16 @@ Domain statistics
 -----------------
 One of these is produced per domain for each cpu described. (Note that if
 CONFIG_SMP is not defined, *no* domains are utilized and these lines
-will not appear in the output. <name> is an extension to the domain field
-that prints the name of the corresponding sched domain. It can appear in
-schedstat version 17 and above.
+will not appear in the output.)
 
 domain<N> <name> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
 
-The first field is a bit mask indicating what cpus this domain operates over.
+The <name> field prints the name of the sched domain and is only supported
+with schedstat version >= 17. On previous versions, <cpumask> is the first
+field.
+
+The <cpumask> field is a bit mask indicating what cpus this domain operates
+over.
 
 The next 33 are a variety of sched_balance_rq() statistics in grouped into types
 of idleness (busy, idle and newly idle):
@@ -103,12 +106,13 @@ of idleness (busy, idle and newly idle):
         load did not require balancing when busy
     3)  # of times in this domain sched_balance_rq() tried to move one or
         more tasks and failed, when the cpu was busy
-    4)  Total imbalance in load when the cpu was busy
-    5)  Total imbalance in utilization when the cpu was busy
-    6)  Total imbalance in number of tasks when the cpu was busy
-    7)  Total imbalance due to misfit tasks when the cpu was busy
-    8)  # of times in this domain pull_task() was called when busy
-    9)  # of times in this domain pull_task() was called even though the
+    4)  Total imbalance in load in this domain when the cpu was busy
+    5)  Total imbalance in utilization in this domain when the cpu was busy
+    6)  Total imbalance in number of tasks in this domain when the cpu was busy
+    7)  Total imbalance due to misfit tasks in this domain when the cpu was
+        busy
+    8)  # of times in this domain detach_task() was called when busy
+    9)  # of times in this domain detach_task() was called even though the
         target task was cache-hot when busy
     10) # of times in this domain sched_balance_rq() was called but did not
         find a busier queue while the cpu was busy
@@ -121,13 +125,14 @@ of idleness (busy, idle and newly idle):
         the load did not require balancing when the cpu was idle
     14) # of times in this domain sched_balance_rq() tried to move one or
         more tasks and failed, when the cpu was idle
-    15) Total imbalance in load when the cpu was idle
-    16) Total imbalance in utilization when the cpu was idle
-    17) Total imbalance in number of tasks when the cpu was idle
-    18) Total imbalance due to misfit tasks when the cpu was idle
-    19) # of times in this domain pull_task() was called when the cpu
+    15) Total imbalance in load in this domain when the cpu was idle
+    16) Total imbalance in utilization in this domain when the cpu was idle
+    17) Total imbalance in number of tasks in this domain when the cpu was idle
+    18) Total imbalance due to misfit tasks in this domain when the cpu was
+        idle
+    19) # of times in this domain detach_task() was called when the cpu
         was idle
-    20) # of times in this domain pull_task() was called even though
+    20) # of times in this domain detach_task() was called even though
         the target task was cache-hot when idle
     21) # of times in this domain sched_balance_rq() was called but did
         not find a busier queue while the cpu was idle
@@ -140,12 +145,16 @@ of idleness (busy, idle and newly idle):
         load did not require balancing when the cpu was just becoming idle
     25) # of times in this domain sched_balance_rq() tried to move one or more
         tasks and failed, when the cpu was just becoming idle
-    26) Total imbalance in load when the cpu was just becoming idle
-    27) Total imbalance in utilization when the cpu was just becoming idle
-    28) Total imbalance in number of tasks when the cpu was just becoming idle
-    29) Total imbalance due to misfit tasks when the cpu was just becoming idle
-    30) # of times in this domain pull_task() was called when newly idle
-    31) # of times in this domain pull_task() was called even though the
+    26) Total imbalance in load in this domain when the cpu was just becoming
+        idle
+    27) Total imbalance in utilization in this domain when the cpu was just
+        becoming idle
+    28) Total imbalance in number of tasks in this domain when the cpu was just
+        becoming idle
+    29) Total imbalance due to misfit tasks in this domain when the cpu was
+        just becoming idle
+    30) # of times in this domain detach_task() was called when newly idle
+    31) # of times in this domain detach_task() was called even though the
         target task was cache-hot when just becoming idle
     32) # of times in this domain sched_balance_rq() was called but did not
         find a busier queue while the cpu was just becoming idle
-- 
2.43.0

