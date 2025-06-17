Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E462F0040
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190785; cv=fail; b=soQRghOEyRxRvo4V6sna6URowrLrfE1SwraIkq/lH1XxXGC02Aj1zTvtXrNrn+TFpYK/kZ4me3CwEc/n6m8Q6s/4y9Lgk5m0mM9y85h/DXdAi0lPCvp64XyUT4CAi/GzJLGB32ztQXanvj8Ret4zM1b9s/edAOFPwLVi5DrwCUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190785; c=relaxed/simple;
	bh=66b3j8XyF9Urlkh+Y5FN5uMCfz+0fmN+xh5fBRt1tYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VPLt+mRCW+n5QSyftS4rUEcfg//wMj2ZeDUpAxv5kd/1EqkhrQYUG8nIL0BljwaU/LtjseZdmPIPa+HD/T+rhJ3c3dYwHlxJPRfeSh6c+qRiiLNzMYGIm+zGs1/taPJCXMih6jdhPBtMTcz509HBgxZANWv7QcwwsunH6ELq2YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jXKTQDHe; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jXKTQDHe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiCTnx0Q1IeiqQ9Tzk5bj1ne5hQidyAlY+Qh+YvnpjsPYQnIbrBPR0xCz1okhiCkUZ082Fkv1k89UZzlDxSc6URpUhWUOiO2o1XL5MwdN2bz1CsPVIYAqWOr9AlJLPiBe/SUGqw1tRDmtf6/VxDCjWvHoz8sj2s2bJJm6yKOslpMHn9u6qttrEfyNLO2gi5RejmhuX7EuRnqciur1QIwCgA3k4EZKwnVe0HGsWbJHSe7P2cchO6kKRI3Y81qXQOL5uSQ7KG9gGFb5V76Rz2hTtl/TKNcmrcWG79miE+LmpRcoCNsOtgPBc1iaAKvqAnk0ghnzsZIgUO0hKPyVXb1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/qK6urp9dJZHrkzssAw85iWvwrFPPUmKOjPktNzjd4=;
 b=sTA99kWWJ5dX/hWR+bNXX2AV02I0N6a8xM1LPSPC9rowzYH38MLgmDoNHb1k9Gw7gnpEt7ZPTlJVr9+AWU5TQ27hX+E3EX43Df/WbpMl1qGfEwhMoFQ35mJo0D61c82ZjAF8RM3ZupMPbG51salYFfa6DX1uPeYcOqAENk63UHzp5KZqrlzV7oBkBiBlp0X/VY0io+5ySkPn6q4cYZrY7TXkScf85/hjTJ5ur5QNYSpV/TxS3iw2fOBQa53ixN1jM3HDsK7mOdCGmYPrdcnqJ57dOUIK01RQNp5iZ3Gw70mITgdJ4+sbAlRGyWB+nKCken0lh3Cg4A+p9plcyrH8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/qK6urp9dJZHrkzssAw85iWvwrFPPUmKOjPktNzjd4=;
 b=jXKTQDHe+MVT6Ip8BV35A5AUUDLOAUlTsc9nugoWYV4aKPLsnsFgHp5uwIpCKUStov4bnTpsGHLI/JOrX9pf2faOYrlgcGYj5WC1RWyOSS5UN/UQM1U+1szC2qImSfano2tkrIlVh95wXXFkKJ/uluw6PLSnWs69fMPauV6NJcSwA/OV5IILOfcnkaNQptsQ3x5XXxJMaKMK9anhlE6N1IKCq/xLnS/Un18JUJnWaXvLXtg41gQz5p6xQO/qo/4WwwnJJ658qodayDWfXR9c2kOTrFtONfEgG3wvj4TwevNcIsmaQ074mOoT3AFyWpKug23aUXCXdP+021sZGjfRSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:16 +0000
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
	Valentin Schneider <vschneid@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 06/15] sched: Add support to pick functions to take rf
Date: Tue, 17 Jun 2025 16:05:09 -0400
Message-ID: <20250617200523.1261231-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:208:237::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 547a378f-ca80-40d1-f81f-08ddadda6aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JJXGm4bz5gae3GYsLByakqPcl1C3zOll0DlXDagP9x6/eOPge8zTNlNgSn6Q?=
 =?us-ascii?Q?53Kxed2/cn/Ws8xUVMwO8Zr1ozUhLGpZ4Ni2UJHs1KFMJgytN7NCPttEN4Kt?=
 =?us-ascii?Q?7m5krah8iw6TA9DkgV3WptP0wYVdl0rdLotsx/uE4T6pTz2pHIlxSbZmLggm?=
 =?us-ascii?Q?/wc3QRdDulczTXuhD/lzEB4QPhAtP5Pg62Wr9DuuDxNiOrA7al8ymy1ILiWS?=
 =?us-ascii?Q?tfiHrf9Ez+ARBdz+p0XgBgmBqHsy3uhbIeKVUWDo9+1F3CbmNHfo4oAC6GyE?=
 =?us-ascii?Q?7vc44VrqYj2P3wPkMZywqVuPynPxZHFG2nUVIl8qA3fjzbZsSYJgidHdeara?=
 =?us-ascii?Q?nf96pQ0IP4gic6NBF2r4sFj7SqY5Sijv4Cp1ANrhzmWoHECxDkSyZiXaJYMB?=
 =?us-ascii?Q?FogzWmt+hwgcUd0UYCa1Fz63UlpAqij2HQIuApI7sJBriDKtxGDmk03xS3cb?=
 =?us-ascii?Q?mXLRpv7odb+f1iv9tm5u3GUxZYRno9UvGOM89DZ8uJdyz9QPjxwlUaP8udds?=
 =?us-ascii?Q?sGeXRoEPs7GY/6d0+FHB/vbKeJYraopGpCZx+7iUiZ+H7Y26CYe+jQMHVuWe?=
 =?us-ascii?Q?eJlfEU003oceM9nUvvcS95fXj6LUaSNuZh/6ZEHk8HSZ/MD5oRn37AG8Az21?=
 =?us-ascii?Q?3eyK+ZNpQiIl7wONp+Gjd2I7w7TjNhlInDK1TnMUSb467cg0vNM8lE6Ya+4L?=
 =?us-ascii?Q?cheHK76qA0GOOCrqEwuUBDx6a6abyKMvXQMdn61JCbf9g2lXGNRMU5UdLeuD?=
 =?us-ascii?Q?yxDKYKoQJy+GTJTJ/xhhS4Vc4EtHBOZHVqopfYDwt1BUn/m9ossqPZa4lgED?=
 =?us-ascii?Q?OfQl8YVHEvjh0WXXywf9YP1OUOirfzCOtJYg4D/ptxrCyLWz/9aie62IzQQQ?=
 =?us-ascii?Q?5R4EIyACbKjL4pr4w2pS0rfWKI/T0/xney4q/COI1JHY4HNV+mRTdfna4m9p?=
 =?us-ascii?Q?tXwTKvyBsMB3h16WiME/Mg7UKIKfDF+QWSbGVIO2AzsdYZ/eeg3PO24+bLvS?=
 =?us-ascii?Q?fKZODFUOl5JaGYdRyUUKnaK7d2agqaKStP8vK3MtnYpsk0BvgtzOZP0XUuS/?=
 =?us-ascii?Q?q28/iol9/v4StoO3meLyMw4ldWI1DR7NPW5f/0L9hYYxXclyNDJhs5pLjfuC?=
 =?us-ascii?Q?4+6EIULK9E4hracCJpa9QdH+8RpTVmBiC9OJf6m3PXmyYvXyuugb2vxWByaQ?=
 =?us-ascii?Q?fFEixvxQ8lTEzMnk6ceisQFbZCInDW2KodjyKU97LrHJNEBIM5TlOCaDwtJX?=
 =?us-ascii?Q?f0Wglm83SllrSyYJU4GPx1C0KdjDSwHpS8d0m/O+cNmBZi9SalEEIRuZZtg6?=
 =?us-ascii?Q?7oX5oU8gYWtzlE7Y2Cx64dSeRwZ/w/qOoisZf+P2tRrPcWousbMb4MYcnzxs?=
 =?us-ascii?Q?ZV200Vd6vq5X18/1RNqSU+d2V2gwG9Dxibivvu3THW/RlrzNDGWvCU/w2pOH?=
 =?us-ascii?Q?HR0jYkqH2d5lGxayUD/QBzI31ai6w9dxli4Nn8GwxRk5rvl1xL4skg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWJjR9jg7MNohArYHt4LTgMC6YvtuNLraKjOfvDtHd+n7NkBBQwNdcFCOWWs?=
 =?us-ascii?Q?DlfFts73vLrqsKyA+VU6Z26RVrqPKWJqsLQkAuqFNbBJR4tfdxAcZ779fT8c?=
 =?us-ascii?Q?0kwzxq58sa1HR/1dz5mKzKPUyzlBFb5+ZV8/pYsqeeNB84lV4aqai7n853CQ?=
 =?us-ascii?Q?hrOt8A6z/nexkjzS642bv/IrItK2M+COhJPG//4DK66TkQ6qgCoqt92daSO4?=
 =?us-ascii?Q?FQRJxOTzzrBQpwU9WdMrzxggryE3LYXCULmgXpq2ZUWt/57lkmFyj2G5ciPt?=
 =?us-ascii?Q?KWIxbW8R14HoCddAP+OA1rQ7MAhO/lyS/QgsQVC9isNo4bu49VO8Ku+K4Xje?=
 =?us-ascii?Q?Ps5oVBgj1c1L4JXd/7pAhGepFHUCyMBWhVlVOvNzewPV1Ahs6UGNrUoCKUVT?=
 =?us-ascii?Q?oFsCoAv+Um29mNOMtdJTTUF4Z3oXZHfmWlRhmvtnLzpmJ1frGjDNjj98X5qa?=
 =?us-ascii?Q?gAGvvv4LJxVJyBsXS7uxaM+nOdO3c1u+kVUFLd0ar+hNuBPRh8JXd9adWrIH?=
 =?us-ascii?Q?VRDFkhC+IyDXFT0DyfS92sG6Ef3MCFB0cwlZgkkd4FMOKUO881xwOh2IGMyg?=
 =?us-ascii?Q?L3IqDEBb4TppTPgdhbYXiS0+ZJX+AfJzI8g2iht/uP3AQ9ADxeSL7MDABKx8?=
 =?us-ascii?Q?6tc73NySrIsBxXC/W8Jc1uwrMJHNdmSSftNMh7EBPWbOXDO67pc68DShAhGk?=
 =?us-ascii?Q?1EQV1r2P0UWrBbu5cNZKKmuVCTtDoK2PewS3S0Wycka2DoaQ9KBTWx8LXG1O?=
 =?us-ascii?Q?XOymGj20qdKsZwGglA372UGqbl8GMi6drlkIPPHm1rajpKDw+aqYKC2fDj3n?=
 =?us-ascii?Q?Mp/S7eF4BAX51iYxqTNFf4zS2CcPVoSx8ioRG19MBJ+lYItEUIkGUvLM3hWX?=
 =?us-ascii?Q?3MFDmOxF3WnTmtXSG7OMPTYaRJRT6GDn81BnfrvueuyVsEg7Lzt7/7VWBfZf?=
 =?us-ascii?Q?1SZkp9X1gjM8X0bHQAn/VvnqlG69WMiLdNpBgItx3Hhy1hx7hDh3QCICZu8J?=
 =?us-ascii?Q?cSeKX3JmE7b2OVdHT/fzOCOzbXAh6/EPVqePfNTDAulaK53n8zCHbFA3AlVR?=
 =?us-ascii?Q?bF4v/wmvYC/vnOkCKH+30bSO5Xp7aXEOQTuJk4JaPDanMWb0kLIS4F8OY6WQ?=
 =?us-ascii?Q?F+VIQK+obfV1BfbdDI5SfgO+/vSIKM13APS90QSplFJVaK71GyziThDJmZce?=
 =?us-ascii?Q?SeeS0y1HFiBRhsmn0vg2FLOT0iR9t391Re10JeK2nr0iZdEO+BG7yspS0ZxF?=
 =?us-ascii?Q?fZIyrn5/hd9x3vA2hjdm5evZSsu4TumqSM14MA857yNKkguMbEyxk+hiPfd2?=
 =?us-ascii?Q?bV3yjLDwmuyPFYaUtpXM6BEJy3fSRbONsCQuxavQQdoMXf673rXe+zyG96M5?=
 =?us-ascii?Q?INN9HxRAs9Q+z4LnI+C6cnvxTEhQUHMLOyP/ocsZFgfkmEUwQWkH8lZLBNXg?=
 =?us-ascii?Q?0GfVm66Ir+pykixtWIm8XdBRmvPKjoPpMJZQHfOQE5WxsfX63alLPTMNS0No?=
 =?us-ascii?Q?H/05jeep554rNTEltOt1oGdvHcajPQFfXK3Vz3AWjCFLvzJTvlGnZRaZmfMn?=
 =?us-ascii?Q?BZU+tZpXyiESI6EHiwLUWMu8RuIkn+szC/9cwIAT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547a378f-ca80-40d1-f81f-08ddadda6aba
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:16.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nejXskPSu86y9RdYeLswppwCd2VPjQSl1WCctAR1XdFXyZLM86oMyAUjvDs5QVO2Cx9dQSly8yVhr961dqx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

Some pick functions like the internal pick_next_task_fair() already take
rf but some others dont. We need this for scx's server pick function.
Prepare for this by having pick functions accept it.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 include/linux/sched.h    |  2 +-
 kernel/sched/core.c      | 16 ++++++++--------
 kernel/sched/deadline.c  |  8 ++++----
 kernel/sched/ext.c       |  2 +-
 kernel/sched/fair.c      | 13 ++++++++-----
 kernel/sched/idle.c      |  2 +-
 kernel/sched/rt.c        |  2 +-
 kernel/sched/sched.h     |  7 ++++---
 kernel/sched/stop_task.c |  2 +-
 9 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64beb52..6799c14061b7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -634,7 +634,7 @@ struct sched_rt_entity {
 } __randomize_layout;
 
 typedef bool (*dl_server_has_tasks_f)(struct sched_dl_entity *);
-typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *);
+typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *, void *);
 
 struct sched_dl_entity {
 	struct rb_node			rb_node;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dce50fa57471..2b6f85c1fc32 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6049,7 +6049,7 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 		/* Assume the next prioritized class is idle_sched_class */
 		if (!p) {
-			p = pick_task_idle(rq);
+			p = pick_task_idle(rq, rf);
 			put_prev_set_next_task(rq, prev, p);
 		}
 
@@ -6061,11 +6061,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 	for_each_active_class(class) {
 		if (class->pick_next_task) {
-			p = class->pick_next_task(rq, prev);
+			p = class->pick_next_task(rq, prev, rf);
 			if (p)
 				return p;
 		} else {
-			p = class->pick_task(rq);
+			p = class->pick_task(rq, rf);
 			if (p) {
 				put_prev_set_next_task(rq, prev, p);
 				return p;
@@ -6095,7 +6095,7 @@ static inline bool cookie_match(struct task_struct *a, struct task_struct *b)
 	return a->core_cookie == b->core_cookie;
 }
 
-static inline struct task_struct *pick_task(struct rq *rq)
+static inline struct task_struct *pick_task(struct rq *rq, struct rq_flags *rf)
 {
 	const struct sched_class *class;
 	struct task_struct *p;
@@ -6103,7 +6103,7 @@ static inline struct task_struct *pick_task(struct rq *rq)
 	rq->dl_server = NULL;
 
 	for_each_active_class(class) {
-		p = class->pick_task(rq);
+		p = class->pick_task(rq, rf);
 		if (p)
 			return p;
 	}
@@ -6203,7 +6203,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	 * and there are no cookied tasks running on siblings.
 	 */
 	if (!need_sync) {
-		next = pick_task(rq);
+		next = pick_task(rq, rf);
 		if (!next->core_cookie) {
 			rq->core_pick = NULL;
 			rq->core_dl_server = NULL;
@@ -6234,7 +6234,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
 			update_rq_clock(rq_i);
 
-		rq_i->core_pick = p = pick_task(rq_i);
+		rq_i->core_pick = p = pick_task(rq_i, rf);
 		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (!max || prio_less(max, p, fi_before))
@@ -6256,7 +6256,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 			if (cookie)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
-				p = idle_sched_class.pick_task(rq_i);
+				p = idle_sched_class.pick_task(rq_i, rf);
 		}
 
 		rq_i->core_pick = p;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 749c1453a809..ca2a31da8107 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2422,7 +2422,7 @@ static struct sched_dl_entity *pick_next_dl_entity(struct dl_rq *dl_rq)
  * __pick_next_task_dl - Helper to pick the next -deadline task to run.
  * @rq: The runqueue to pick the next task from.
  */
-static struct task_struct *__pick_task_dl(struct rq *rq)
+static struct task_struct *__pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_dl_entity *dl_se;
 	struct dl_rq *dl_rq = &rq->dl;
@@ -2436,7 +2436,7 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	WARN_ON_ONCE(!dl_se);
 
 	if (dl_server(dl_se)) {
-		p = dl_se->server_pick_task(dl_se);
+		p = dl_se->server_pick_task(dl_se, rf);
 		if (!p) {
 			if (dl_server_active(dl_se)) {
 				dl_se->dl_yielded = 1;
@@ -2452,9 +2452,9 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	return p;
 }
 
-static struct task_struct *pick_task_dl(struct rq *rq)
+static struct task_struct *pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
-	return __pick_task_dl(rq);
+	return __pick_task_dl(rq, rf);
 }
 
 static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_struct *next)
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 2c41c78be61e..8c9adaa2c977 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3397,7 +3397,7 @@ static struct task_struct *first_local_task(struct rq *rq)
 					struct task_struct, scx.dsq_list.node);
 }
 
-static struct task_struct *pick_task_scx(struct rq *rq)
+static struct task_struct *pick_task_scx(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *prev = rq->curr;
 	struct task_struct *p;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..6bf097e39b4a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8852,7 +8852,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	resched_curr_lazy(rq);
 }
 
-static struct task_struct *pick_task_fair(struct rq *rq)
+static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
@@ -8890,7 +8890,7 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	int new_tasks;
 
 again:
-	p = pick_task_fair(rq);
+	p = pick_task_fair(rq, rf);
 	if (!p)
 		goto idle;
 	se = &p->se;
@@ -8969,7 +8969,8 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	return NULL;
 }
 
-static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev)
+static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev,
+												 struct rq_flags *rf)
 {
 	return pick_next_task_fair(rq, prev, NULL);
 }
@@ -8979,9 +8980,11 @@ static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
 	return !!dl_se->rq->cfs.nr_queued;
 }
 
-static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
+static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se, void *flags)
 {
-	return pick_task_fair(dl_se->rq);
+	struct rq_flags *rf = flags;
+
+	return pick_task_fair(dl_se->rq, rf);
 }
 
 void fair_server_init(struct rq *rq)
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b455f..01e9612deefe 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -463,7 +463,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool fir
 	next->se.exec_start = rq_clock_task(rq);
 }
 
-struct task_struct *pick_task_idle(struct rq *rq)
+struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
 {
 	scx_update_idle(rq, true, false);
 	return rq->idle;
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..6e62fe531067 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1744,7 +1744,7 @@ static struct task_struct *_pick_next_task_rt(struct rq *rq)
 	return rt_task_of(rt_se);
 }
 
-static struct task_struct *pick_task_rt(struct rq *rq)
+static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *p;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..35d7b328a9c7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2401,7 +2401,7 @@ struct sched_class {
 	void (*wakeup_preempt)(struct rq *rq, struct task_struct *p, int flags);
 
 	int (*balance)(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-	struct task_struct *(*pick_task)(struct rq *rq);
+	struct task_struct *(*pick_task)(struct rq *rq, struct rq_flags *rf);
 	/*
 	 * Optional! When implemented pick_next_task() should be equivalent to:
 	 *
@@ -2411,7 +2411,8 @@ struct sched_class {
 	 *       set_next_task_first(next);
 	 *   }
 	 */
-	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev);
+	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev,
+										  struct rq_flags *rf);
 
 	void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_struct *next);
 	void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
@@ -2574,7 +2575,7 @@ static inline bool sched_fair_runnable(struct rq *rq)
 }
 
 extern struct task_struct *pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-extern struct task_struct *pick_task_idle(struct rq *rq);
+extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
 
 #define SCA_CHECK		0x01
 #define SCA_MIGRATE_DISABLE	0x02
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 058dd42e3d9b..1c70123cb6a4 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -33,7 +33,7 @@ static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool fir
 	stop->se.exec_start = rq_clock_task(rq);
 }
 
-static struct task_struct *pick_task_stop(struct rq *rq)
+static struct task_struct *pick_task_stop(struct rq *rq, struct rq_flags *rf)
 {
 	if (!sched_stop_runnable(rq))
 		return NULL;
-- 
2.43.0

