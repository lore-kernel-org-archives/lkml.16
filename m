Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7C289373
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336673; cv=fail; b=ltd191zabcfgkn4z4PyvH+VMVJutoyy4cVRPfguxVuuAc54JuRyKFNss2bN7obI8FR+4k+377oHzvmsiWo2MOC1f57YMCkA6PJ9+koCI1nksORJysQq97Xrw71zzp5kFQ50ZiqiL4k5ahU+OhJPA1UcqU+qzouZy8AKmWokXmps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336673; c=relaxed/simple;
	bh=MXo9chTtF+jEISODj2rldwBKkzNrWFX5g/qEZWM4D34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oa7yvry6Rc9IwBDw5sg2On2woFmGlW/o/6Mrqf7JCvnUrheLjeNfPiWaTPEGet0S/4FqVlZxEGP0+5oFkV7ttbeSUfs9FesbjiSyK5T3+5IdUykuskrdAMKFzVkb0Ndok9e5I4wjko+3BTPOiOSzgFSIdoS2fNxlOW3EtCBevrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nYQF8Yba; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nYQF8Yba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMvwVazjIjf18M+/C3F/yi4r/AaYnY5nm6jWVw4jeLW1rq5o1Os6U0k/BPWAEXOs8azWw+gTTW3aOeaiHn4eYwhsFFLLKtB14++LwQJSFjg2NBXEzqQLV7N5glhh5t4yeq3alFVL72MIIng5CMQwouSwGRF/2VJTr53Mjp/GuCUxgrOxPxErcieF9a6dWiFiJxYzF/EiA/rL2ZpZs8dsHj4+BEVIqVS/s9z5Kpqa8F/pnEcJV54CwQLOjaqRwFhyLUjss3s3nuyE/4hAy+8srGl+RI9QXQjfl3UR3ZVnf6Lo1cjFzsDTQJylqB7hIqlmL+9F0L9WC2i8MbtNRS949g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV0HO6xq4Lg076hjIzTvyOl6f/PLVmSQL+8lVzjFXxw=;
 b=LdPqIF6G0FtpRHoChbEjL0EgKTEXgj5nXWeSqzdvjK1nsshBMh1eZFiPV6HsIoYsXny7mpataPuquh7sOhfVROorxD0ebnKUqjPDWKZ2biWdyfD7Bq2Wupxbi0ijUSBlYQHa+d84HbDuvPT3CF63CKqWwzsATsOxtCnIfpCK44qt7o7GTszXSVqAbQVu8eq35+isAJFJX5yuWJ1rr/HHLABGTiyhcneD3CbmDvReisBnLvaMFnXXfWyQic3PfGh+4NnGjr0JnfuttdBrb+efufj45m28YxqvwQJbz0cgOJKuJcet6NNpqf0+PRJ5w9ZxEa5CZmLvCbLtkHW3L5M8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV0HO6xq4Lg076hjIzTvyOl6f/PLVmSQL+8lVzjFXxw=;
 b=nYQF8Ybaughfj9psEFcZLClnoT5Sl3ioMWf7Om/4udRyqzVlUXFPFIFIB3LzuqvgCfrU6TvRKKcPEenThsggqOpZrz4iyI8NEYWMSNeoLU+/aw10QrHZP7Lh+RWhcXROjKrwyMA5cSfoSEZDwdQYTr1jpZ3Zdlc0gZ8iMTXIUU96OH/ZGkgDLQNkc4+2m0MyUVduP0A+kV+am6Z7/h94zJQIJAxVnF4X/tb0v19TvGbmuif0fkDaTr7NmDLinT485fS13le0ZNi4ae+2COCm6thlfWvbw/1o3JMHwtwjWzoF4qzOJcT+svxMgOi8h4BSqzdcFauicuF4ItEJfhWqDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 19:17:47 +0000
Received: from DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4]) by DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:17:47 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] sched_ext: idle: Validate locking correctness in scx_bpf_select_cpu_and()
Date: Thu, 15 May 2025 21:11:43 +0200
Message-ID: <20250515191716.327518-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515191716.327518-1-arighi@nvidia.com>
References: <20250515191716.327518-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::18) To DS2PR12MB9615.namprd12.prod.outlook.com
 (2603:10b6:8:275::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9615:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: ea39f890-3ed1-43a8-ec4a-08dd93e52d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5TyEwkxKhZbdhIu+fYgW6G0y2mBr7SvAD9vi4YPtv2EOx3jyFS6Ai1FFioK1?=
 =?us-ascii?Q?hDNONjJtVmXgL5Toy/SSwfM91/tuYK8w22URE3wu7vmv9dXMJexSN9WR2Kat?=
 =?us-ascii?Q?B0GjVz9DqDyjxZ3kVIv5mx9navW8ee45YgqpLNd/Oo/1Z8sTR1Phrtwd9Qid?=
 =?us-ascii?Q?35ukp+/r4gEzOefB9+87ewOZOC34PJD9+CilycqldMbEPs3Bvwc0ZNLQBl+C?=
 =?us-ascii?Q?dtlTlq0thQHCD14onBxchPqFJAeUgZNur2Q4RuSPv5qcyId2xBm6ho6mXNCT?=
 =?us-ascii?Q?bdNGTBWVPlyD6JQcXuPjdYYAfM3tiTvGKTo/BqeK9CR6suFkpe4dwwPKJSur?=
 =?us-ascii?Q?42hGaLIKZwDWZ1gILolYxODZM6CcFD4dTkSgPKHhHVHe8eCZlDeE6wHwyiJ/?=
 =?us-ascii?Q?ByqH3v63EALKFipZAol2+dsA2MIN2EdYpakPLEqHMmJfXhXTzYVqHx+kFULH?=
 =?us-ascii?Q?jgne85bmz9ZFNp82XpfdtdsH7dzEk5Pqq4JEFKs15Tq9sGE+cyZ+HO0PwNol?=
 =?us-ascii?Q?RnfyD1nEnptOYrpAS/uHneFjC4n9mkSPw+eFHeQCs9yfzTdqAAFe0ZLA7OT5?=
 =?us-ascii?Q?PMMNDKEadvCE0/jUcwjD+nsroiGZMoKlPgGzQfCxVlSX8OPp/n4SMIfZeDHV?=
 =?us-ascii?Q?no1Dz9A+CTQ/2jyoIy1LjuqzyebUTcUy1eB1x+vyDRxvOA7WqLx01qyZ5bHR?=
 =?us-ascii?Q?9cBLexk4JmWheCyWo+25GaGtUUnasCqwz8ldwxixFoXvSdJF2Kl7Zv5lhV37?=
 =?us-ascii?Q?hx07pOe0DlBtoiesFT57uH3yOfME0a7u8urMupHnDyJCcH8eKQjfzGQcLipT?=
 =?us-ascii?Q?5WcNt3eTzuKJtv+MhoHJQXh1eIfoEJLWA2NCqUO/N4d+Pc2AZwg0RsN9Cuyc?=
 =?us-ascii?Q?jVIeTi5zXr0wUMR2Fkf/Pq6JIcy5dnT2S6QBFMR74y90Kzsjlrlasu32VQ51?=
 =?us-ascii?Q?UPLOPt3GVnWxlHu+Aoe7xuh3mKQpzfHx7LLOGb7erGp+qDOz/kCHslFYWWik?=
 =?us-ascii?Q?ZccwV8V5opjoryeW84EkwUYW70T2W6/5FlhskD9pL6PxdYxt3xyWJZn3dEu7?=
 =?us-ascii?Q?Xb3ZCIXM2M/g4+pef+ZZua01T3Uklq1f6ca50X9m1KcCq1MIE/v1dhmu5QOh?=
 =?us-ascii?Q?t8zhkNgY6wDXYLWNis5E6fERntpznc3ZghhhwHPiDw4bSz1lfcLRiRa7dhbI?=
 =?us-ascii?Q?FRp396n3TmVDOTHCHFLFLehgALJj+7JcHd+rv64nLmI0jnRbUGVotx+oAESj?=
 =?us-ascii?Q?cBhVEF9nf5eiAwZWYdR5aZHPZ3NBmqv/ZsZmoMsjyccPZJn1WgG6zNHbTXf8?=
 =?us-ascii?Q?sDNeG6mEEHuG7GNgAngx/bTCuobtqhL76IC/3UuNVOFuKA2nJSBSBZ+lX29I?=
 =?us-ascii?Q?QkCGOh+Bs0TznsHHbi51CLvAN6/iRXu6C66orhQ67OKOk+EzG1zTXwP2bUN6?=
 =?us-ascii?Q?MFgk9UDFIsc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9615.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YKbdkKLPkV9Jq2QkPFDk1Lzt/XunuxVEMObCu+82zL3yVtxIaqnNePm2HbC/?=
 =?us-ascii?Q?r7BfH9kwQsqrWk7l37xm6kWr/b5uL40bFtwY0AJvDemJvQXt++ptY9hhHI7/?=
 =?us-ascii?Q?3EIhnU51gWfK8J2LsxeEzNuv4zi5PqTu8/Bu3J9TkmJ4gcW7bUWC33r+gCLW?=
 =?us-ascii?Q?ZKD54rjKIxR/i1mIK7CNq6Bbmj2FHq4RL+WzttBHdp4tWTu2tDhYKm81uHPt?=
 =?us-ascii?Q?3cmUi61ITyt+HPyo3QaOLE01CSGd3YKw0tQSKTEtc0tOrV1J618flSv76lzJ?=
 =?us-ascii?Q?js/b4Os+jsrwmlPbAmpGZ4AyqsjDgaSLjpYqKkg1B+KcR/QkuWd8uD8njYvJ?=
 =?us-ascii?Q?PcebhpBn9PIEXt6uA2Xo76ydAqQK0x6BwhwYSy8X5EtWByW5gBRghse7iFHx?=
 =?us-ascii?Q?qTy1GT/HgOHSSP5ST17HRsa7vcCGfoDDkaDFafY7Yw/Ob/4vGtnvRGIVemrA?=
 =?us-ascii?Q?uY+M4Qf8Hq1D1z7QvYG1KxjGFKQdiqkcai61lcjcnIJvIcqLki3jpEiL/fGV?=
 =?us-ascii?Q?XkO2tl7jw8D6+L6qRYAlohIdQ16SFE3WB2Bxv1bvc2U7rVX7OxRyyptp9Sso?=
 =?us-ascii?Q?DZqnEkm5M5ESYh+Og7f97SyQU4Or5h6Bdh378s40LNSvaQqAuURrjzbciXrL?=
 =?us-ascii?Q?jWopWUnH69SUEGa7+ezZKuYmLsNs2TUUlk59lqoKXrTfAELj00JAwUELCgwM?=
 =?us-ascii?Q?3NeVv39Kp7suTMbjWllv2SdUZzmAyqltVzAr4JQel2VB5uxiB9ws6U0vinoK?=
 =?us-ascii?Q?VYuBEmMNrxeQ3ZQr5wodrQECJMEEmSwiO+fnNItKe7D1rn/QKvhor44MZKZ+?=
 =?us-ascii?Q?MgNNWPkF+OxaJav4lgZOKd5u73zlYcM0YDvyyTyqaWMdUYVWBuk3FulAomQC?=
 =?us-ascii?Q?SgnpTslrKI7J1+hJju8VdQutnPgxgxS4ljy96xyAIajxyQVZAWbA3DitpIQP?=
 =?us-ascii?Q?MwxTsoJfTdBEMRXpDxQWzT9ros539YxVihWwdSThOJb++d61WaUgIokk+0cp?=
 =?us-ascii?Q?MjgCt7OHYkM610+eJJt7QMQk+wFJcFRHrIUMEN8dZfaJAN9hb0alt0dZUfGE?=
 =?us-ascii?Q?vnZVpb+xxiG+QCOTW5f0q3lvOMTvdE1xKgSnT7EYRrjEzAFoOTa/K9a/q1KG?=
 =?us-ascii?Q?Hiw2r0kJhvQQKoJ/ejcu6ugCwSrMwu1sStwzUtlRLp2nyTM3ezDScDF6CyLi?=
 =?us-ascii?Q?VY3vQ3vv5zv7PO6j3o3X7PrFKJt0oE0lXBGkA7+SWMPyTZ+ewMiZyWBTICpC?=
 =?us-ascii?Q?0uq/WfqIEvLm7YXcDTY8Z1gli0ja+w9Mwez39vdZhX3689JD61ixWxY0B1vX?=
 =?us-ascii?Q?v/l4ZM8dssexcTTdLkcIQ/JwQqPcfzVHC7ZSTjAY/DUMQnf1N37AQX25HlRl?=
 =?us-ascii?Q?ElbbSzVsbT1xj1zuiUwO2OqhwRbV2bI6YTEurXiPExJ5hOLKx9HxOdpLRTkf?=
 =?us-ascii?Q?u8YxHSbCgfV9wqdzKVLSxLE+nCZFCdlxwazoaE0kK8CePPLWfkawBrXphPBC?=
 =?us-ascii?Q?LUsmN5ODTbFLpkLn9sL9wE7cMUIJX5Qap4P75mwdYFNbu4V8irVkwHg93DSh?=
 =?us-ascii?Q?w2x1KeO2+i+HF7doeV4AXs3QGwWIfCFLW32+30o9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea39f890-3ed1-43a8-ec4a-08dd93e52d7f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:17:47.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RdHP7bH4nG2pULhIEG/Cm+j3XEe2QYbScfq1PHEv/+KM5se34a1igvixMF+OeqhknnmF9IaK08w4Vtb/oRT9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

Validate locking correctness when accessing p->nr_cpus_allowed and
p->cpus_ptr inside scx_bpf_select_cpu_and(): if the rq lock is held,
access is safe; otherwise, require that p->pi_lock is held.

This allows to catch potential unsafe calls to scx_bpf_select_cpu_and().

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index f0ebf8b5b908e..716863f1f8cee 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -935,6 +935,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
 __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 				       const struct cpumask *cpus_allowed, u64 flags)
 {
+	struct rq *rq;
 	s32 cpu;
 
 	if (!kf_cpu_valid(prev_cpu, NULL))
@@ -946,6 +947,15 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
 		return -EPERM;
 
+	/*
+	 * Validate locking correctness to access p->cpus_ptr and
+	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
+	 * otherwise, assert that p->pi_lock is held.
+	 */
+	rq = scx_locked_rq();
+	if (!rq)
+		lockdep_assert_held(&p->pi_lock);
+
 #ifdef CONFIG_SMP
 	/*
 	 * This may also be called from ops.enqueue(), so we need to handle
-- 
2.49.0

