Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C523535C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812986; cv=fail; b=LGWyin/HuQQBHn3hvpjlJ8UpwkeMJ6QIxqDz6SLQzXfGAqhmWg3Zd6Ss0a13qCngQjzVMDPvM5JOR6bEXQKxagjtzbxGWY/5vSp77YnCFuXcXPitElXCTk17pZpDvHkThDXMSgowYpu6xOK01zGnr4KiSVLPzGExIjWEgSL+yZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812986; c=relaxed/simple;
	bh=cOvtPO7HXmLDDzW+i2nVFpMVRal1GjWMFwzuvf1wjSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z1FmxxMfja9MK41CvUuj1gp58oUKrA5dr3fR+2B+8YhoIamxTMKVL9XdiHsdfnC2ANOXDLkhRL3jS73Dsw7bqFwDGFZkov2UGqCfv3181TJIgRlkhKNyYItdgBz/1GF3FDG5FoaOI7iDZf4vcDwdSQ29U1bhmhtENULZRYn1HGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JyGtjm0M; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JyGtjm0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO7qG6GVHYvZPI/JDWDIbs5BZqmYKifbOH0PqKbnyeO6mhhf9arrG+qHf8oG3KyKnHHnsaSSN/J5px3B/RfetI91o/nLUwGUM5G0h7xccmtv5DGHgS5QRf/a4lYdkrVox0gCeukAQyyTt9cuQy4uQ9kN5rVVVlRu0xMFwPRHlYOLj7THKbaIyRi72oYCuNA00jQgW1BrduMqEIcs7Eb43q8iatlxWVnBgaTiY6AdlqypLOYLxrIpR6sol/zZzy75/zkc5TwO6LjXv8E8TGaBYqCimrpd/HETIo+Ls/nXBkBXUzVCXdv7CtabI3JQ7CoSlvlAyArLfk78WFKdLhkLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8ZtkaeTFXURDv2TgnMCpqys3h8m23N1AYtKIZAmkjE=;
 b=sb4JsFtFlmsweiBB34KSGETij9c+fKx0OyUh7NzHe1lqMwFZwl/HyLq4YPqsaQQoVtMZD7U0QIVjyoEbCGSOeJmWqHdtQBprdBa6d7rl5sFRSupHrBkGmUt65BfgWw/4zBXVkAQRSrBUd6t/3Bv2trkcPivgJBOt+bx2Boe6ZmQtyPodq33rNxXt8Rmb0Pdn7M3pEYSh5MF7nvLHlA0dcB+wWM85sZ8E4cvuDBp6UYHFjRJWcL5W8/0Ajo+iA/B129pCjJXvb1+PHozoEEt6wdUGFgNm541XsNhnZgIAaXeEnxT2Kn91MQA5pYPrk2thbPbxjgy42eGrI4sgoedzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8ZtkaeTFXURDv2TgnMCpqys3h8m23N1AYtKIZAmkjE=;
 b=JyGtjm0MrsO7keBJ24vvYRDjBostxcy847YF0jW8F3n3JW8/AS8phG1+cZ+iwn0y4a0yN0+FAP1JC0J+LqjT7D0v+0PnWt4cBULUJuEA8WDwJ6MtlqrD40UqNaGVCbycLOJX4YRa/Wth3L8jU7wldC44US105PByRONnHxkpymG1YLBXbDACl+yG8q8XjkXKIhenaJL9/magGHoOjfk5B6fdIHuVwzagwTfjk1xEOTxFfI9PjGonQg33qlvEZDt0g8wErVvWc2Xl2G3MyqFicD2oTj2asceuS4RBUagN4h+XsPxzrFdzzgaXs1dzZeFdiuYnHJm8brQE+PkW4r+NPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 07:36:21 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 07:36:21 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] selftests/sched_ext: Update test enq_select_cpu_fails
Date: Wed, 21 May 2025 09:34:07 +0200
Message-ID: <20250521073548.140307-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521073548.140307-1-arighi@nvidia.com>
References: <20250521073548.140307-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0054.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 336ec636-4dc9-4b29-5de0-08dd983a2e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N2PJx8ytaFw8iRo/nmq5UTUhKIoAMsPfv6+ecMV5U9Gy66GWLOwKLA1jGN9R?=
 =?us-ascii?Q?BrTI8RUu81v5jvxGuBhpGP0+Z7ha7QiI4Qh7To+ivgI4A0GseR/r2+XIHrSG?=
 =?us-ascii?Q?UHX6DIPWnF1RE6yTXyuU+C289U2IZWeAgEOIePpWplGlbzcltTfTVLXmsYkU?=
 =?us-ascii?Q?o2f9FPqG3xTErkbzCzvZmna/000z+uCVaPpRPe5FPClfRFFGCd0gROgZQrP3?=
 =?us-ascii?Q?ESjxdNK/0JwUcuUxwDCqZYRuTiPLIgPU7+rQ3xjgrlUbsvmh19gXx0MhEi1c?=
 =?us-ascii?Q?bQ+6Pv+yTHZ9Z+t227N3zkDXwqGFLERoBY/ubyh7RuaGCTIJm3bHFf1mYAsR?=
 =?us-ascii?Q?naWChrCd2GzmRkpzhLfJCtlq/5Lsa61uVOTVC1n7BhWRi0mkKPeFjl8dRRQS?=
 =?us-ascii?Q?S0S7D7Wj1pvGlyl+j6BFb/9r/Xxv0W/JdzlZKgQ+32F5Bj3B2g/grjv1tW7h?=
 =?us-ascii?Q?7UaDYczyrpG1dxPq0QJqb0nGwT6n7zoQNAem3w/mBqArkHCLht5u7ZixcqTL?=
 =?us-ascii?Q?Y9Tb/whSBFeT4LPc9JBFEmSyqC53rw8Y6WeCer6IFSQQt3c7b2+kCLc/xQt+?=
 =?us-ascii?Q?O8bDA/EGxW5RPyqyACqzLRp3KFfMipnb/f6UfkFh4uSjKPvWLTeWchFElO6H?=
 =?us-ascii?Q?/hUwJ2bChjud2ZOiUqHusMdbsn7Oc6NtgYYm3kgSVbrPixKKAFhbSyAYt5Kx?=
 =?us-ascii?Q?RZ3/BmBbv763kxynqbSRG7nCnGDih1q6vdJr2siop7/tBBcIzN2496n1HEyZ?=
 =?us-ascii?Q?n16O1hpn0VARGt441eqUI0ussUrTO977EaH1Bc+Ik353sTbWRjFownCzVuY1?=
 =?us-ascii?Q?HvqQR9bs01j0M4saU/4Cf3Qu9zGIFZMSVozO2/Vwfrjud0MYVu43UqWc3EGD?=
 =?us-ascii?Q?VCinZwQo9pku3JfZ0fiJ7DwXFC2oPE0XfAPIkaZz966X2sCTl78JGqbjbM+S?=
 =?us-ascii?Q?9qOLBwJibiTU5I02YxSEduTd5mYgjYRm2PoBMA2yXCxLTtfAGDU2HDu1CYTQ?=
 =?us-ascii?Q?NAvrIKYHJrycJN5f92OQuJ7bmYQWMmwLWkh8XtpzHsrnT+RMdxabS3w2uee+?=
 =?us-ascii?Q?2OsaQquRJiFsWwbinbMPsFAk7L4xk/HrkvKmUtB/M+ZvZpA05cWGzsmWk9Sg?=
 =?us-ascii?Q?+rLQoLDMdqiuHWyPcxpB/ni6V8No4jKjwiNA/bjj7wDySxdZ5uNRSHxYbEIS?=
 =?us-ascii?Q?hvzDwIdP/3NT4wx57eEnyhbzqHgoI4amJZfj2tGjF/Shok4UNU5f1IsbiTv3?=
 =?us-ascii?Q?IfDvDVcqf2bFtZU6kDItl+4RQmmlfczDoP5PABAFB//SmgYpTcTR9dn9Lnyl?=
 =?us-ascii?Q?lm6GzZ4qMlyWocU10YSjpXc5MrfdGAXd3dWn3FO7tgUOyAelLZw0XJJQWKU0?=
 =?us-ascii?Q?Tb+JQiw7z/mJZwK3TZlnEWlMKtAMVk0jiJ0hw3cx4g6mDypE4NXU4W90m7+B?=
 =?us-ascii?Q?PvfLan14ehA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OrZflPyeRhTUyfzIl7LSgLqTWGH/IOYutJ3SkfVKzeXKP69rttn89XVFJO5J?=
 =?us-ascii?Q?YcoKJXlGpvyVWu1qM2TyBDiMxl/mcp6Yr5xz3ASXR0hqypLjtWB6+o0VtpFn?=
 =?us-ascii?Q?cC5aFk6qAuKXe5n4spxA2ybiTuHQRWuCygUCdvfO27mwFdCtCuxgeajezdxb?=
 =?us-ascii?Q?E7XkceaY/7bHW+LjFfj+sxiyNGAui807Z/NzhRQ1aBdHloMdsK+YLWrZlg66?=
 =?us-ascii?Q?qtM3WYwuXptzRf6b9QmRHktvsE6N88lco7AxpXl1ER7d2tSaqKnnEV0DI4eT?=
 =?us-ascii?Q?x2R+xCmEZKbCDOw8KT3yrl6W4G9fCOEUUCGBW+1GMD9+T1nilFNstTqBiPRL?=
 =?us-ascii?Q?sqQwR4v1PCyi7TmdzPhIt+c8n/npPrhLu7Wee5NlfgpOplg9oXjrKbFDmnd6?=
 =?us-ascii?Q?OTzvpfiENbmkJAULGmCnHQonx7w114y1A7NZLkTeTmdEd4v4z2TIh519IKhg?=
 =?us-ascii?Q?tkO67KwbdIJ8ITmJ0w1XvOretDGiguQpN8TMDOw7Yqf7Hwgx3q+1ZXahnBnA?=
 =?us-ascii?Q?KJmCST0LV308pHg7CyDqHjtM3CJZTWrbSM7X1oIcHCDWyTkGy5REZqS6C3z4?=
 =?us-ascii?Q?Zj7lsMionFmd8rSr17g3Qwph9QZsvyWB6YAW8ndrR7QXDLuz+hHiQxSHKynh?=
 =?us-ascii?Q?ZE3xijXaP6Wt3j+TyTeJOAsrm0qVOH99q1Eeg1VzM6a+aqQGOUJg79bOj5Gj?=
 =?us-ascii?Q?phKnom3RRuduhbiQ8xoarhqm9n1RFcrEbx4NsDMRh1OOyMd1K1I0+UBeIilC?=
 =?us-ascii?Q?RGj+30FVtzt5L/pcQ7BgWhMTQNPR0GSEBum37ZmAO0f9BHdMNzeEnGOajllh?=
 =?us-ascii?Q?g1+YPY+lIGtQvh239kuFOqoKhrW5P7VKH4MV+ntPOCJ1zL/vYxm+R+Rqr+Ik?=
 =?us-ascii?Q?+HH0Cplxcz9MsV0BjZl0yApcJh/ulQSfTvDJik7QUFv7IjpAy4IqVGXtA4R1?=
 =?us-ascii?Q?0uKsjTc5YMIjQFsX2fBzvR04yTXqWeWikH08nFBNeOTJ3/AuBFPqdBugUQV+?=
 =?us-ascii?Q?qRq4M8TJZdlcyBnHQ+vGiklugM1zQDurP9fZg/96I25zoHlEC0YdbC1TRiCb?=
 =?us-ascii?Q?lsAhZPrgLq7mVUDVSQwyPoH6wf4rKpnaNoGWqHg4gwCgzDE+LTr5jk4Toe+L?=
 =?us-ascii?Q?wHz6O2A5cQS5+9VLbkGnju6aw17T+ugeH3MDh6XUbq1VythRb7vxIVGsmWsj?=
 =?us-ascii?Q?qg3DuvVumA3atddUnntohh8/fObc07i+mi56OGkjkJJlwMX+8nmJnd6Z3FAt?=
 =?us-ascii?Q?8Wv/pjv60FG5kNGTH+99/yBZcIcDxr7/lixyi6jGktwQcUxSRMZp8oKX5W6L?=
 =?us-ascii?Q?4G4SCQWYBj+d6MDwkp8kPXAIrYs+EVFfSo7aoPLiv2u7Vrz9T4sq2HEXlxlB?=
 =?us-ascii?Q?xBQmyxomTxBDbdMUtlJi14k6fYzoSsmhwkZdRWnrFPCWdb0bWdK7dmEqEEz+?=
 =?us-ascii?Q?iEFQ4asR6uDNIUL4fSU7b1oE53tWXCRJcgRM8j8thWJllIvlaJR9zCcGP8UZ?=
 =?us-ascii?Q?zR4d+12cfx9/es1A3ca2+mf49l4eDIfQzAz8Q4wELBDH4KYWHii/DdBiS1DZ?=
 =?us-ascii?Q?w6ozh5c1WCoBPvrfGs1DmsBXQYO4529t957FJFP8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336ec636-4dc9-4b29-5de0-08dd983a2e8d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:36:21.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tluxTM8940cmEBe4aU5UhNQoKZ8BfIb/+Z3jVP+jG8/U8MTpcV0rw4gzDT7a6CfnDiMm3ovb6QE4XEv7HNNmGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

With commit 08699d20467b6 ("sched_ext: idle: Consolidate default idle
CPU selection kfuncs") allowing scx_bpf_select_cpu_dfl() to be invoked
from multiple contexts, update the test to validate that the kfunc
behaves correctly when used from ops.enqueue() and via BPF test_run.

Additionally, rename the test to enq_select_cpu, dropping "fails" from
the name, as the logic has now been inverted.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 tools/testing/selftests/sched_ext/Makefile    |  2 +-
 .../selftests/sched_ext/enq_select_cpu.bpf.c  | 74 ++++++++++++++++
 .../selftests/sched_ext/enq_select_cpu.c      | 88 +++++++++++++++++++
 .../sched_ext/enq_select_cpu_fails.bpf.c      | 43 ---------
 .../sched_ext/enq_select_cpu_fails.c          | 61 -------------
 5 files changed, 163 insertions(+), 105 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index e9d5bc575f806..9d9d6b4c38b01 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -162,10 +162,10 @@ all_test_bpfprogs := $(foreach prog,$(wildcard *.bpf.c),$(INCLUDE_DIR)/$(patsubs
 auto-test-targets :=			\
 	create_dsq			\
 	enq_last_no_enq_fails		\
-	enq_select_cpu_fails		\
 	ddsp_bogus_dsq_fail		\
 	ddsp_vtimelocal_fail		\
 	dsp_local_on			\
+	enq_select_cpu			\
 	exit				\
 	hotplug				\
 	init_enable_count		\
diff --git a/tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c b/tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c
new file mode 100644
index 0000000000000..ee2c9b89716e0
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Meta Platforms, Inc. and affiliates.
+ * Copyright (c) 2023 David Vernet <dvernet@meta.com>
+ * Copyright (c) 2023 Tejun Heo <tj@kernel.org>
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+UEI_DEFINE(uei);
+
+s32 BPF_STRUCT_OPS(enq_select_cpu_select_cpu, struct task_struct *p,
+		   s32 prev_cpu, u64 wake_flags)
+{
+	/* Bounce all tasks to ops.enqueue() */
+	return prev_cpu;
+}
+
+void BPF_STRUCT_OPS(enq_select_cpu_enqueue, struct task_struct *p,
+		    u64 enq_flags)
+{
+	s32 cpu, prev_cpu = scx_bpf_task_cpu(p);
+	bool found = false;
+
+	cpu = scx_bpf_select_cpu_dfl(p, prev_cpu, 0, &found);
+	if (found) {
+		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL_ON | cpu, SCX_SLICE_DFL, enq_flags);
+		return;
+	}
+
+	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
+}
+
+void BPF_STRUCT_OPS(enq_select_cpu_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+struct task_cpu_arg {
+	pid_t pid;
+};
+
+SEC("syscall")
+int select_cpu_from_user(struct task_cpu_arg *input)
+{
+	struct task_struct *p;
+	bool found = false;
+	s32 cpu;
+
+	p = bpf_task_from_pid(input->pid);
+	if (!p)
+		return -EINVAL;
+
+	bpf_rcu_read_lock();
+	cpu = scx_bpf_select_cpu_dfl(p, bpf_get_smp_processor_id(), 0, &found);
+	if (!found)
+		cpu = -EBUSY;
+	bpf_rcu_read_unlock();
+
+	bpf_task_release(p);
+
+	return cpu;
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops enq_select_cpu_ops = {
+	.select_cpu		= (void *)enq_select_cpu_select_cpu,
+	.enqueue		= (void *)enq_select_cpu_enqueue,
+	.exit			= (void *)enq_select_cpu_exit,
+	.name			= "enq_select_cpu",
+	.timeout_ms		= 1000U,
+};
diff --git a/tools/testing/selftests/sched_ext/enq_select_cpu.c b/tools/testing/selftests/sched_ext/enq_select_cpu.c
new file mode 100644
index 0000000000000..340c6f8b86dae
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/enq_select_cpu.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Meta Platforms, Inc. and affiliates.
+ * Copyright (c) 2023 David Vernet <dvernet@meta.com>
+ * Copyright (c) 2023 Tejun Heo <tj@kernel.org>
+ */
+#include <bpf/bpf.h>
+#include <scx/common.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include "enq_select_cpu.bpf.skel.h"
+#include "scx_test.h"
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct enq_select_cpu *skel;
+
+	skel = enq_select_cpu__open();
+	SCX_FAIL_IF(!skel, "Failed to open");
+	SCX_ENUM_INIT(skel);
+	SCX_FAIL_IF(enq_select_cpu__load(skel), "Failed to load skel");
+
+	*ctx = skel;
+
+	return SCX_TEST_PASS;
+}
+
+static int test_select_cpu_from_user(const struct enq_select_cpu *skel)
+{
+	int fd, ret;
+	__u64 args[1];
+
+	LIBBPF_OPTS(bpf_test_run_opts, attr,
+		.ctx_in = args,
+		.ctx_size_in = sizeof(args),
+	);
+
+	args[0] = getpid();
+	fd = bpf_program__fd(skel->progs.select_cpu_from_user);
+	if (fd < 0)
+		return fd;
+
+	ret = bpf_prog_test_run_opts(fd, &attr);
+	if (ret < 0)
+		return ret;
+
+	fprintf(stderr, "%s: CPU %d\n", __func__, attr.retval);
+
+	return 0;
+}
+
+static enum scx_test_status run(void *ctx)
+{
+	struct enq_select_cpu *skel = ctx;
+	struct bpf_link *link;
+
+	link = bpf_map__attach_struct_ops(skel->maps.enq_select_cpu_ops);
+	if (!link) {
+		SCX_ERR("Failed to attach scheduler");
+		return SCX_TEST_FAIL;
+	}
+
+	/* Pick an idle CPU from user-space */
+	SCX_FAIL_IF(test_select_cpu_from_user(skel), "Failed to pick idle CPU");
+
+	sleep(1);
+
+	SCX_EQ(skel->data->uei.kind, EXIT_KIND(SCX_EXIT_NONE));
+	bpf_link__destroy(link);
+
+	return SCX_TEST_PASS;
+}
+
+static void cleanup(void *ctx)
+{
+	struct enq_select_cpu *skel = ctx;
+
+	enq_select_cpu__destroy(skel);
+}
+
+struct scx_test enq_select_cpu = {
+	.name = "enq_select_cpu",
+	.description = "Verify scx_bpf_select_cpu_dfl() from multiple contexts",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+REGISTER_SCX_TEST(&enq_select_cpu)
diff --git a/tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c b/tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c
deleted file mode 100644
index a7cf868d5e311..0000000000000
--- a/tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2023 Meta Platforms, Inc. and affiliates.
- * Copyright (c) 2023 David Vernet <dvernet@meta.com>
- * Copyright (c) 2023 Tejun Heo <tj@kernel.org>
- */
-
-#include <scx/common.bpf.h>
-
-char _license[] SEC("license") = "GPL";
-
-/* Manually specify the signature until the kfunc is added to the scx repo. */
-s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
-			   bool *found) __ksym;
-
-s32 BPF_STRUCT_OPS(enq_select_cpu_fails_select_cpu, struct task_struct *p,
-		   s32 prev_cpu, u64 wake_flags)
-{
-	return prev_cpu;
-}
-
-void BPF_STRUCT_OPS(enq_select_cpu_fails_enqueue, struct task_struct *p,
-		    u64 enq_flags)
-{
-	/*
-	 * Need to initialize the variable or the verifier will fail to load.
-	 * Improving these semantics is actively being worked on.
-	 */
-	bool found = false;
-
-	/* Can only call from ops.select_cpu() */
-	scx_bpf_select_cpu_dfl(p, 0, 0, &found);
-
-	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
-}
-
-SEC(".struct_ops.link")
-struct sched_ext_ops enq_select_cpu_fails_ops = {
-	.select_cpu		= (void *) enq_select_cpu_fails_select_cpu,
-	.enqueue		= (void *) enq_select_cpu_fails_enqueue,
-	.name			= "enq_select_cpu_fails",
-	.timeout_ms		= 1000U,
-};
diff --git a/tools/testing/selftests/sched_ext/enq_select_cpu_fails.c b/tools/testing/selftests/sched_ext/enq_select_cpu_fails.c
deleted file mode 100644
index a80e3a3b3698c..0000000000000
--- a/tools/testing/selftests/sched_ext/enq_select_cpu_fails.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2023 Meta Platforms, Inc. and affiliates.
- * Copyright (c) 2023 David Vernet <dvernet@meta.com>
- * Copyright (c) 2023 Tejun Heo <tj@kernel.org>
- */
-#include <bpf/bpf.h>
-#include <scx/common.h>
-#include <sys/wait.h>
-#include <unistd.h>
-#include "enq_select_cpu_fails.bpf.skel.h"
-#include "scx_test.h"
-
-static enum scx_test_status setup(void **ctx)
-{
-	struct enq_select_cpu_fails *skel;
-
-	skel = enq_select_cpu_fails__open();
-	SCX_FAIL_IF(!skel, "Failed to open");
-	SCX_ENUM_INIT(skel);
-	SCX_FAIL_IF(enq_select_cpu_fails__load(skel), "Failed to load skel");
-
-	*ctx = skel;
-
-	return SCX_TEST_PASS;
-}
-
-static enum scx_test_status run(void *ctx)
-{
-	struct enq_select_cpu_fails *skel = ctx;
-	struct bpf_link *link;
-
-	link = bpf_map__attach_struct_ops(skel->maps.enq_select_cpu_fails_ops);
-	if (!link) {
-		SCX_ERR("Failed to attach scheduler");
-		return SCX_TEST_FAIL;
-	}
-
-	sleep(1);
-
-	bpf_link__destroy(link);
-
-	return SCX_TEST_PASS;
-}
-
-static void cleanup(void *ctx)
-{
-	struct enq_select_cpu_fails *skel = ctx;
-
-	enq_select_cpu_fails__destroy(skel);
-}
-
-struct scx_test enq_select_cpu_fails = {
-	.name = "enq_select_cpu_fails",
-	.description = "Verify we fail to call scx_bpf_select_cpu_dfl() "
-		       "from ops.enqueue()",
-	.setup = setup,
-	.run = run,
-	.cleanup = cleanup,
-};
-REGISTER_SCX_TEST(&enq_select_cpu_fails)
-- 
2.49.0

