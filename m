Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D98D2ECD1A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451578; cv=fail; b=qO6tZqbio9AG3mC17ZgF4eRZVrjjbsO6zJroUEpT5CoOMYRrbJhclaVS2Scr4GAjKiDx1e2CIMJ3QCaaI9CL6AZMO3zC249aJiQh2pmN6hf+JyfMNo9py3ahn/OOilNDTh/3WCUbN22MGdSHEfu02y60LsaoLQXJfrJmNZkW2nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451578; c=relaxed/simple;
	bh=SnavyRsgL+V9rhB92CPkxq2YcwBrshkAXP4sEhiDlfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sdp8y8UGYaMID1vcVMk4VGtsJNfvXCm4cZQFpqnTIDeVCfv/exnQKlesoxMXGF3SGLCBFOiJe9AihPqehGCloF1SLN1yo2nZ14nEb6mOJEjduiOHniv96SgaNe/k26hUrkezDePF0JZjdNXYYLyz1F7UpD2wDbUvogFks8gBXtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qSKyGEGD; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qSKyGEGD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsb9dijHoTu3OF+CCjRz7vrlq6I7CR7vNPoZQM9P8u01iMXzrTUTeTll2/ink1FPA/6KmUT7fKJ2aok2uHIYWsDbsNWj/w/hkJDubtmXMW1O0+tnwqjnWFt8v8D/mWv4ux3mN+7kpjEhIZV5Ru2KFJt4Dc7vZYLr5wnPHHafojv/cPxc2ZZB+JtcZghVmsOq13aX2AtHiS277AaRBs6k0DlmQIafobTtZvP7Uv+HJnj5y5PBMMSCdX0OkOLScJIvIMcJ/YTwSBpqHo+m8gVl5rI5DRFje9u9p4FG5x1Qslqzgi2LohVSISVXg9M6S62eynDa8jrF49R49siIfzAfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj7Vx+MuCO9N40LtISa3DOV1Z9khXc8xYVvk599d1pM=;
 b=AjCa7OxgXMRnBAu9hC1/w6iYCgL8QXNEdBEP8GkAV0dBrFClNd6Li8Rr9Zv2c/RAlvYcTK43Yikw/omPxRe44zZvWhsGstiFMeF+g0qkpRI+G2kIJsQDmQR34Xdx3GkiVrlED0ZdAHGM0WKIe4q/NF/y1RTG2NrTrNpJkGZV12lT1AI0mvKJnVJXI8kKaYL4tPXUglVc1XiLJJrqBXZ8HbXQaVFO8mCYM/NavFa/jguqQV0KCTUJVV7+Z2CDxAs9z19rakTlFpWLNLY+wXhBAiMlpMgRRjjew7OHq1gZldHx5HGq731egOBlSjq0hIrO1u0u4J7/AMEN//3esEs4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj7Vx+MuCO9N40LtISa3DOV1Z9khXc8xYVvk599d1pM=;
 b=qSKyGEGDSvE/u39/mwGdutORft9WmHsVX/thVU5wO39qDVD7lCuSkDzP5WYYQaaB1spl9Zwx5tnWeC9mxmIe+z7vashPSslAcCWLD/QTH6M8GuPY7kC2/QX4LxJbHpwhXqvR6A5GHyNDCHsGSwVW4onkIBEW/gBKprPOBYdvGfY8PTabRee7s3QZDLlBN19+Owg2oGd1QiuCL7B5WDYfYmcYnaP0za5O+XZ6UCzMdDrGQnZH3ZGaJjJ3RVhza1k5GHOK376592sIukRsBoHn2QewoWb+hMSjcTkdECfcdQ9C4a4SQGDxsHzaUR+SL2dV0r40R9Dhgygw3c+D28Oeeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:51 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v5 05/14] sched/deadline: Return EBUSY if dl_bw_cpus is zero
Date: Fri, 20 Jun 2025 16:32:20 -0400
Message-ID: <20250620203234.3349930-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:408:fd::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0c2f5c-7d5c-4ab3-ac93-08ddb039a103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?z1mFE6jYTfhGBwiHf1G6uPG6nMRdo6BkEdEI4Vv9MINpPjp4c3jDRyaEY8Es?=
 =?us-ascii?Q?gQ4S1p61P86pt1TFSQXVXI22lcHlPotuSFM8TQph603FvJfOU+xQU0JzESua?=
 =?us-ascii?Q?YJ5kQeqwMMe72V72grNnHCW+YNfiM8pletz0ECFCoNc3NLbe+eOTTsf34PyM?=
 =?us-ascii?Q?EVD2DK/E4ZR/5yBvkYoujoxzFLyadIQ+ct2xGPbeMe0PUFJXBKrjenqotZSP?=
 =?us-ascii?Q?h6azLRebTl9281JbXpZebTE6XBjV+MHh8zD+d+3R+NEXt+YmQu5q858m13bi?=
 =?us-ascii?Q?FWwFW1tZEYslz+i4QLt8Q8oXt6WRW/jDy9BHiXAi+3eS2KQJclFkfncPWvdE?=
 =?us-ascii?Q?TEfNWeZTUxCl4M5WfKvbT8F9DE1WbdagitPoHKP+XjHF1wqRwbNkCS+ebQSP?=
 =?us-ascii?Q?n34MMUrdLjZG6Q+eXkJ3VDBeJzTo0d2YnFaaD52a1w6v16IAruEBRtFCwUqP?=
 =?us-ascii?Q?5sGPsKeB/O4mWczhlQMiDjg1uF2ofKKuohyKSiDHC+9U+QWNmyVYL28BeZiA?=
 =?us-ascii?Q?MqTD+YBqiPFAmJ0O2mDwK5dOGNI4Zsp19q2QlNbuBldEnRmAJOblK7XOsV4S?=
 =?us-ascii?Q?T4ne3m6DdWJXIMF9KXaq7c/wtYj5dPkHo7b1t5EY5OPouBzGo6V1z7WxXA3c?=
 =?us-ascii?Q?1a4D65Y79RPdqrtMZmqi4VACh0K0BrTFsx92gvSHdcbeSbeKYpC63K8Rtb4j?=
 =?us-ascii?Q?aeD+ams8r9+c/Nasij9mNoqf1l2PRtOqIoCQTinlQ6TbhPgYUNCBgl3ZWFir?=
 =?us-ascii?Q?51uI5kqT1BiI+5wtekJ2A4jKbdxVkUwbJ9WPdR0ecOpesPKBwHQOUgGLDYBG?=
 =?us-ascii?Q?z4hAEMdbvPUEMiwfwNDHmINOmbHCkZzZw/YxxL+SAgsrqhmSUf8tw9WZLK4E?=
 =?us-ascii?Q?kY3JoHkB2JU5a3M0r3NFKlBx4zYO7is7T2WjglKZCz7p17pDNVyurRW0+vd6?=
 =?us-ascii?Q?LwK1/mAW4JLhF+YBFhj96l1VHzc6HIZQsiBFApBR1L/oSrcx9miRc5x67Dc+?=
 =?us-ascii?Q?aXCqpTymwK/4yXBkrTJ5voDn5JmGYRlR815g8TJpIhsNSZwtfP9zgd1TIOqB?=
 =?us-ascii?Q?nAwkSVeMW0PYz6n8z90dSK9LJx2T/btAgdrLygZ0wwwoG9i9B1w9TyPE8K1C?=
 =?us-ascii?Q?lWJwxfBBD/8J3dlbWUeTNJXfK3p9SUTPJ5b7rdSuuP4kaRhV74dEnTXyYj9o?=
 =?us-ascii?Q?+Thk+SRI56SZCFvVoLjA3ryqCJkh4/4JrtUEQt6lM3sxJehjP/0xJ4ldg4x8?=
 =?us-ascii?Q?nAVNmnLsL8MktvWQYArzvq8V+Ttyh56x3X76K3VHDf88ClmU+WMTPggLZywC?=
 =?us-ascii?Q?fuFmwQymoG8wzn1cmPIA5kwJDAigfNi91bTIuzsK1uhv0e/xnHb0DzQkykK6?=
 =?us-ascii?Q?e4NUiM9trifQh1KveafA+2tis6yCUDITty9pY2B0/XhwiFzmEmCvdD70s/D/?=
 =?us-ascii?Q?G8RdXWStPen8z30MVk6QBkW3CBozGWn7ajQbuHJjjhSqVp+kxIoY6g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QyMFKDcsB9FUTm5LuI6htZ/BuAVl9/qSNrF1v1x2auLLTX7sOjlc2smozY+w?=
 =?us-ascii?Q?ubm2TWhDhaNck8RzcojYNJLjbQkqQUUnsq5YCE3b9gvAJfiMQcTnTOdZohhN?=
 =?us-ascii?Q?bPh/jB1Afn6hyXN3n1Mao/C5sqnhLW+aEieIpxpnawoeA8TjwvKUglKbdI3A?=
 =?us-ascii?Q?ZeAHYR19UewKZQ/i5OimmszkZSuFJYkGSU4P4CPlqv0p30TWckavdP6VpPJo?=
 =?us-ascii?Q?io4vkH76iiZlRXUYrTeTo1HOGWmxMfceiF+1+1tOLbbnQWl3c2SZzHm9Zh56?=
 =?us-ascii?Q?n9BC7vO7dDBdPkVyZNopZFkvgDJK1UHp69urtxVOxITP8DTIsFbIPKch6YSU?=
 =?us-ascii?Q?QKQcg2pZVwGEzd83rJwBADiS6Vy+d8HJIA3szhfd0J2bF1lavwS4i10O1kNF?=
 =?us-ascii?Q?SQGgnmaQubAqurmQqQyFKDae+pnpNuLaxay7am8Lx2WWFrPf4hyteykx1ua9?=
 =?us-ascii?Q?0kzmuNtjuSZ2WyObA5LoeVSlNn+RvHjD6MKcBIHerk1zgffgJFFclvamJmHo?=
 =?us-ascii?Q?5qxtrbTlSV37arMavCu7OxWbkz4QBWDy+0b3em0HDnbe8RAWcMgfWWJxMsiA?=
 =?us-ascii?Q?oEznIwVj05LJ4FCJ/J7BQSXg8H6j3dFxacbs6SkvNamYTuL6DcX1eaB9FKOv?=
 =?us-ascii?Q?4ygir7yayWT0hbuX7khTJgQZsTUHyfxKv2s6iYcJ3C7c1yG44mJ9pGz7qoiE?=
 =?us-ascii?Q?D9Yrwb19XVVgRWvKRHHvI5+r56mGt6trdKgu/5fdVM2tNK+rdxa4dOBWSlax?=
 =?us-ascii?Q?lGKRGm6KW+DWt0B1EJ0M/hKdHRo+WZtjjHkqmYpx0oKBnpuKM45sEGZvK71J?=
 =?us-ascii?Q?r4kN9ZkIVBImmO60MMsA5VfAfasJszyIS94YSDoMLLwJcN8Gc2TEuIQbQGoZ?=
 =?us-ascii?Q?MyxoQOfU7nWRpn8HonbbiIgOft0QcbcebtUJrC4ZVS0iJO5EHI0N1SYtSjDT?=
 =?us-ascii?Q?i+Klsbmk3dqFZc8aSJZBZBiEf9qeJwM1JxzrAVe3VOtZLngcMMXpUKiaEZPL?=
 =?us-ascii?Q?msDeaEoXh0pPl85nMpS2YEd7uYurhAi663bXTq2E1HkAx7EL07HqJSpCEV6Q?=
 =?us-ascii?Q?V2WeDQg7+tyZ3kpZO61rUOYlcJRITVOhYTTNopfGGLYd9CAJn6GyCGBw+1J7?=
 =?us-ascii?Q?bSUUcJyX2Y1SW2EU2kpJAwgpmynpKy9x11SZesaciRLNuh/1BA4+7jRnNMbf?=
 =?us-ascii?Q?R6pobYYVCXvdTEuqjqBy5U6LOxNquXAOTyj+tNblACMIcZuZKZUSi20OuVAt?=
 =?us-ascii?Q?OvOOKjlt3OPTkTJIkTAwoWsDkW5VgrCHU58AbVk8CySmzhX6+L9j+7HGpF6I?=
 =?us-ascii?Q?1idfKHTDMyguRYRGAQYOH0GhP+g1QuiVO7JAI2ftw758ZiJwTKppctmY6aM+?=
 =?us-ascii?Q?EGYo9HIXdILkQH0wgBbtWKqzJ1D20XFyU5SYjeiPax3qQgyZoTnbCef5J6FU?=
 =?us-ascii?Q?9vgVl43dU+CrwsO7uxoBAUsNM/KUjlSgUTHdrhMsmykD7YOASUXXF748r0xU?=
 =?us-ascii?Q?mF1OKKtU8m0ALGZ5y9nZ5KZl2la4CQ/OjMrhUhWvN6aylk/4FwmCrKw1qAsY?=
 =?us-ascii?Q?E1Wgj9dFraDjE5ENGdrhh5Pm5TxeTlVlRm5pi7qt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0c2f5c-7d5c-4ab3-ac93-08ddb039a103
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:51.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ubq6De4RuvTfpYaujDn/41wu1vnZuhS3oC8THtuaqp+MwUYXbBVbT+0j0Yg/eOKZsaL1qjrqjqc4VNpVr2rJAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

Hotplugged CPUs coming online do an enqueue but are not a part of any
root domain containing cpu_active() CPUs. So in this case, don't mess
with accounting and we can retry later. Without this patch, we see
crashes with sched_ext selftest's hotplug test due to divide by zero.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index d2eb31b45ba9..749c1453a809 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1725,7 +1725,10 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	cpus = dl_bw_cpus(cpu);
 	cap = dl_bw_capacity(cpu);
 
-	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
+	// Hotplugged CPUs coming online do an enqueue but are not a part of any
+	// root domain containing cpu_active() CPUs. So in this case, don't mess
+	// with accounting and we can retry later.
+	if (!cpus || __dl_overflow(dl_b, cap, old_bw, new_bw))
 		return -EBUSY;
 
 	if (init) {
-- 
2.43.0

