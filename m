Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F982620E4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862351; cv=fail; b=KRNmpW4xYDAgo0T8qGkg/6sqoi5VoE2Kk2HHyjlPdn/vPUlgVPLgMkQCzzyRlpareCu+GZ9gLzS6Vpjo/mwuw6cpQc2v52rB/FWW/B/oqW0hqxF2pGJXGnnUD0EYU3FhDSAx7eJ0RNdkiKN9E7fGjaNVWuVtb9tjBNBAlq7epis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862351; c=relaxed/simple;
	bh=wWzJH74iY7h01bjK/c+vcS4INpa24/3jkvCfcNuaqnM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ExqsKogOqkHtenLqW66vBzcSxO0VzSk3vQyqwtzZ6V/4IXC4PetdIsdP2rRIXuTHSLU9ecHWbTk/Rhirzx+3WR1l6tMATdLoeQTn13X0w6mT7WN6leldxNeLBlEtfAwie4/rzb15iwvxaxO4yHI7vbFM9WnySIKC42VFs54xOYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qmU78tPb; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qmU78tPb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egEngZEkC2kBlplbGMkQBzC7LMaFxqHLCedEzLUaeYzv0RU4i4pMHtfIMjZYTYr24XIPWQi0oT01raiR3STpsuz2nEeeGMc5RSsQkv0b1Ah17+Gl2D9PQKYbpfPtOcGyCwmJYwjqgT75s+r0itHrmPzPZKO7oU+joTPZBePOeDMa4oxv8GRCNz6mZcFLZbfxxRx+7ObHkWashjBrpiu/jKZnZHDH3INNDWM7P+xJR7kL596ZIBuSmiz7Thx//Rsk3vQ4yvvU9drH2tAFRD+CJcqg4ANuU0isYFYS3QnwU4ZI1g1weeTknJcSnJRf1qluPXbF1OpMuNv/80af8WV+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMeY0tFBLh9BBJpgPG4zQckZCr5ZnsEaXDU/q13wy/Q=;
 b=RXtrHOr+irSwNMTYhGpO/EeT32lg+eNucmU776Bv9KjyOlqxVPvV7zqhw5T/C9t0FhA4/INacDQnrNW1Oa3B2zWpxIzDs9ZVOYS8dQptfvmmGHas9tDEKNUIQMhHyb3PRGCI61urokIZgQKf6mjMMBHs5gz6yCJtmdY/jhWTxDrcPrTxpxi8ivMjQjriyVoxZYzAEvtahLXLx+56lxiI9nEH2lnB5KvgTyyDxM2CLmSfavhLQsXheIE+cTCZFIsd24aEo9U3+ZgIqLYLVKUxdWk93y7VuDVHesjiVo1dhAayyM7MqF2R2IPO78fmB06fR2IWGoeJbeVd7plqjtV8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMeY0tFBLh9BBJpgPG4zQckZCr5ZnsEaXDU/q13wy/Q=;
 b=qmU78tPbmF/9cdMPxZjHyuR9witSm2xc5ymv1j6KhoBWFR25qg0dQGyjf/GXhcbRLxN0tR9P/UprXUWlUrM1g6A/0FkhJNGp+vUoGteNriCEGh9GlbGzcx3/TJ9mcUd+wvVLKqtwgIrrxkVQkMqD36B6/BLQ08PgxELxOCa0d/U=
Received: from CH5P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::13)
 by CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 14:39:07 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::8b) by CH5P220CA0007.outlook.office365.com
 (2603:10b6:610:1ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 14:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 14:39:07 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 09:39:05 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
	<dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
	<tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
	<pierre-eric.pelloux-prayer@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/sched: Fix racy access to drm_sched_entity.dependency
Date: Wed, 25 Jun 2025 16:37:21 +0200
Message-ID: <20250625143722.55272-1-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e5b052-2784-495e-8a4f-08ddb3f60a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NDjC63pypQdGXG8l/eVrmJXV1rMdgc04UTL/GpyDMfEfYG6I4abOoBtn9bqw?=
 =?us-ascii?Q?w6XPmLrOivYRgksN938ChXWsw89dE7rvsvJYvKHttudeB8CKUCXZm3wMKAsh?=
 =?us-ascii?Q?OlQiGwvBwJGzEm8t3spLunomqGHwNyoRbSKncwWGQ8xkHjIIEFE8xuxWR5Im?=
 =?us-ascii?Q?ZvRrmrs0Mq6yhZi2No+9ciM4AV9okhXSPDRscj7uST2N/EbjTc1ssrQ7eLad?=
 =?us-ascii?Q?dJEeHvEbE9tYK/qpNu9+bTOMbyHXQkpFGLlJvoJ2Pp4aoszZGbtETDb4t28B?=
 =?us-ascii?Q?49HXn2ajYPdrwa/TLeXUZSbLlyGR1Wr7/r9UFqJ+R9+61MlK3REOIW+uqf3g?=
 =?us-ascii?Q?+qN1etnfzxVVMm5dJZOZaNg512NS1yZI9VBfTj6MKGruQTeKExFMJdU7SLu2?=
 =?us-ascii?Q?wiiVZ1T0Co6z7pD7QL6A6xX774Vr3aFFsDHfZGC6J8M/W7VBi5fFdN+7dgDs?=
 =?us-ascii?Q?BpMFFXvU4hNfLdcpFMlQ1AVHLheaaPwdhQcJAAmaJAs8lW/hBgPmEZ4TvQ9d?=
 =?us-ascii?Q?fqhMvqfSxjt6nqYQHZq+4qH3lXKeh24ipoqLuJ8wmKBi71A76+eDvW08fiC/?=
 =?us-ascii?Q?pc+B6EUuXNY3WQ5we+QZ6O2MVORu1BwvnD8prKASD0EuL4rShOcZVxefKGS7?=
 =?us-ascii?Q?MqdbquQyWdwSmQ9ADdghiewPu2jr3thF1u8GrF1glJZYMrtx4UkirpdhcpOh?=
 =?us-ascii?Q?4Ex2Xn0Hrv3AFTzupUAmIwCrBG9eron1U8cHPPOg1z0HkDyLbYWJCMiKgxCy?=
 =?us-ascii?Q?3gnPnCCoH3ScHaMeGpWAhqp70dW2wbmsgiy62CKgIwd4zZWwCzDni5LQ/TNK?=
 =?us-ascii?Q?zxg+OXOy8ZdPqHhSODjsDTtJNVeDpiLZgayjUpCfKH73rXMCM8efZOAvMrXj?=
 =?us-ascii?Q?twd0VV+/fjUQCzFtnk66BqPUPrSucvlC5K8id+sEL3SYwE1C5jh9MNzPXRO1?=
 =?us-ascii?Q?5tYU8dVgb1FGCIHpZWNAQSLgCa+Kp6zazsSmFHdCFnT8FHWypsK8exSboHAQ?=
 =?us-ascii?Q?O/k3DwZNATjqfrip+8CCeWEszekGw1rN9CiuguU8lHSLAc7zZQDgfm7tqDyf?=
 =?us-ascii?Q?jCL/N/dB2dHnA/VsQWJSAL70X9Qh00mT65f3PgSZ2M8WlpulnWLd+H14XFEf?=
 =?us-ascii?Q?tb1Q1/ER6Xy5ithz8qluA6ZOYofRc49Zs6Ub8xXCxCiIHnWnBXsafT2ZBZ/l?=
 =?us-ascii?Q?MJK45n6356N0hhfGHfkDwtq7YCT+e/Wx/iFSpaSmyBhOQG22LTBT1z3ndlrk?=
 =?us-ascii?Q?0QrwxLtPRKtTQb2pYBDnVS2kDrzc/gHPOZbbQTuY4GpSQxjrlhDadKPqGrSE?=
 =?us-ascii?Q?/K44oHoO7789sITRstU1y+tyRDEvRt24Z2yZ6jAnC9Z6daNaKkQdJg0mHSav?=
 =?us-ascii?Q?B2YCLJysTRk8ehcpk3dDbeVRJC2ZRi+3LHArz9kegiO8XzYSldnJS1rHyAjy?=
 =?us-ascii?Q?x3lWYTpfNbocDiK9t07M/kF7XiBm2871k5ZbxdIIP+boNPjtriPzXSpbU4vh?=
 =?us-ascii?Q?P1dIMZ7wjeTemrXfH2Jzt4LUmEvLIH/iBnWKOtj0LxqnUxUHgxkd0biXGg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:39:07.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e5b052-2784-495e-8a4f-08ddb3f60a76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229

The drm_sched_job_unschedulable trace point can access
entity->dependency after it was cleared by the callback
installed in drm_sched_entity_add_dependency_cb, causing:

BUG: kernel NULL pointer dereference, address: 0000000000000020
Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gpu_sched]

To fix this we either need to take a reference of the fence before
setting up the callbacks, or move the trace_drm_sched_job_unschedulable
calls into drm_sched_entity_add_dependency_cb where they can be
done earlier. The former option is the more correct one because with
the latter we might emit the event and still be able to schedule the
job if the fence is signaled in-between. Despite that, I've
implemented the latter, since it's a bit simpler and the extra event
is not a deal breaker for tools anyway.

Fixes: 76d97c870f29 (drm/sched: Trace dependencies for GPU jobs)

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5635b3a826d8..a23b204cac5c 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -401,7 +401,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  * Add a callback to the current dependency of the entity to wake up the
  * scheduler when the entity becomes available.
  */
-static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
+static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity,
+					       struct drm_sched_job *sched_job)
 {
 	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct dma_fence *fence = entity->dependency;
@@ -429,6 +430,11 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 		fence = dma_fence_get(&s_fence->scheduled);
 		dma_fence_put(entity->dependency);
 		entity->dependency = fence;
+
+		if (trace_drm_sched_job_unschedulable_enabled() &&
+		    !dma_fence_is_signaled(fence))
+			trace_drm_sched_job_unschedulable(sched_job, fence);
+
 		if (!dma_fence_add_callback(fence, &entity->cb,
 					    drm_sched_entity_clear_dep))
 			return true;
@@ -438,6 +444,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 		return false;
 	}
 
+	if (trace_drm_sched_job_unschedulable_enabled() &&
+	    !dma_fence_is_signaled(entity->dependency))
+		trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
+
 	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
 				    drm_sched_entity_wakeup))
 		return true;
@@ -478,10 +488,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	while ((entity->dependency =
 			drm_sched_job_dependency(sched_job, entity))) {
-		if (drm_sched_entity_add_dependency_cb(entity)) {
-			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
+		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
 			return NULL;
-		}
 	}
 
 	/* skip jobs from entity that marked guilty */
-- 
2.43.0

