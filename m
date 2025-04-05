Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83C1F3D55
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860495; cv=fail; b=H/bv+a3ZzEOgdmdG22h2thNWNOPilsYV/cIWIZG+aWzqxDpMyOt7Y9mNtdanPzz7yfkL86GLS8Jwt+7azkTv7lCZ27qjWPC1lML4AMjPRGQaNDhGOaoXvfp+L+9PhxM3HFihGYGTbeqrO8njkPIDjxtzHAeRGU5Y17zEZq+qpP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860495; c=relaxed/simple;
	bh=ZSQMYAlJKzFOmxCyyP8c8hniZaKrdFM5GY3WIZGztHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qd4Gse9VU1jcRxX3rdjhFFtPHNkVuiEz3yw/7QspEyw5cGCD5o51VPxmmXVTo3ayp6D+JYOqQ2OxPHSOsaCusRTAXA3W/IQsxZIUYt+D/gxkztbEvflqKOI42xG+nT8WO8gKSYNEi+OQr0biz2zhPmnbI4+S0DzgF8Qx/44psRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rTrj7uWS; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rTrj7uWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG+robQYnDtIn/MSqrFwfF3dwgYZNpUKFdZ0iVQT6Gd1gmTb4ljh5jguxlwJ841CcV12YA+v6k6nHfl7FxAr2kOBI7qVvT/b/XDP7RGnkyfHSHoBVm2Epi12eVvmUWR4Dmkqcg4tXUPqqaq8nhrAZdRHqjxHsvYviFxGhbGUZS0mg33SjFZCE5H4mYpl+k8Orb/oqS2xWhvPO4AbM2WyW3SFhkRGYpis6/1Z58NlU+D0ssB9uVJhQ5Mj0OszinajK2RPh6tzmi3lXfP+5zzPEU3edpU+5TXR7MMJWUoYU+Mbo2mjIsfPBB85optx5IciBlt5zpyNyQKgUDyxyr6aQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dal4WwY3mkEfhyQJVtjDo1kRbWLokHU7x4ubr2AHHes=;
 b=S8oVxLJEl7WhPmEYUEUZ0n+lhzp5AfpHWnR+WcsOPSYr9LYYH2HIxcKNPiU6j0NzkXnYIG6EQbq+Z847kA2j6kXkdLJWb+NYG4GkYblydioRkyT/sQ2VHyL0LVyS31njhXUQ0ZQVXG9gfxb++P7OLRJcs6Iqf2SJfspFM4UUbgU0x95nCrrhqF/F6dTsduaprNpDX71SwydSCLD6vBE/kmXGgNt4dQfGC7Jjh0UOswdcBPSWfr2q1su7z2tVte7027Xbub9KHBGYmrEbyZnD5ep+Anoqw+u9FpXPx9yHW1syQYVZXmVFo/shRHdjeM+VEucK5G0rAWxRW5u1aH2oYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dal4WwY3mkEfhyQJVtjDo1kRbWLokHU7x4ubr2AHHes=;
 b=rTrj7uWSxKyH0kZUkKVUwZfbzyGPjf6Z0UruxwSARgv2jhQkO8EXlZ6QDQWTBiu5SIMPD0broP+snzESVEPyPMRj+ZV2u2zUKy+Odl/qqcJYdetedFpcDD/dZeh0bcPjT9Z078Oh++gljyT1aIpJgPPC/0hqHkL5A9qn3yGCahI1HWcbSwvjLvu2hiWxgq215Z8yjRG9PdNbQEiSHk5+ZmGAmkCykrddnrXlHky63Wkk708obIzXdwu1xzrd2lU4HE1OPbtQTq3TL2YoFvCWpPpSE/VrqhlR8stHfVdYgtG8tBn4YwJS8m7VUHuWiViQ+bbtywvtjtgWBug/tBLiGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Sat, 5 Apr
 2025 13:41:30 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:41:30 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] sched_ext: idle: Introduce scx_bpf_select_cpu_and()
Date: Sat,  5 Apr 2025 15:39:24 +0200
Message-ID: <20250405134041.13778-5-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>
References: <20250405134041.13778-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7472b66f-9d96-4f9d-7727-08dd7447929b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rIc2YzIsj55DJo1WGl42UOX6Ic2LHOinoSmwwNYvMDCyORtxaRToG7DY2bF/?=
 =?us-ascii?Q?CLxKCz6FSSmbMxQA2RQZ50uiF1HTo+Zo68c/p+qotqXBnABWIqaAjSJDU8Jg?=
 =?us-ascii?Q?7gaCwGKpUM+HYphyghFAFrUjhhAbxD6cdQyEG2ck25x+cowEOgLQS4i0p1/P?=
 =?us-ascii?Q?wNAxdRwkuWecWtBZ1/hXD4SAfl1kxrZTy85oF/6bNMzQMt5NByF58QTVmtc3?=
 =?us-ascii?Q?2RcW89uUv4EX/311zlybEdQYOaeEQsTRc3cARpPKc2FZryCWvTKLNuBNAdwB?=
 =?us-ascii?Q?MadgD5POe1OdJZADCyJg9vm2GUKsksnubqTxgjyHD1spG+Ae69tFVhBf0upj?=
 =?us-ascii?Q?6zxG52ZRO5iYq6a4Zn36Hd65Ih8k5h0Dd/ERITEOxsnFuTYdHhBT7+fYkUah?=
 =?us-ascii?Q?vAfW5bOGfgBXe1B5Dv/oxqTNFQmsXfl/Y+lYqAbPVtsbWXaMvP0Ret4LSK2L?=
 =?us-ascii?Q?+wE3Pzz1c0tBxrQEg9TQ8F8MHSkflNuq45FhQjnEqJjxPB/gkWPOOyfaMgVl?=
 =?us-ascii?Q?WvE8rYbQW3i6IqUGjB57sgCpKeRhteLSVdCv67M5XntoW38M9EJ88d7jwbch?=
 =?us-ascii?Q?RSLSfBI+8RLM5g0jbeBtdydyaayh53SM8W1NDx8g/EletkuXJcLrmqHOZPz8?=
 =?us-ascii?Q?IYSnzX55S8/rVfdvHTXwRzRbCJptaN2jvlEFcVN2HIDbVRVLiM097D29EKLL?=
 =?us-ascii?Q?psL1uMmOcy1OicKkKluyDRMyfAhuZmxDE4eJGPpmuWsYP05kkax7npKHATji?=
 =?us-ascii?Q?tAOfUOUJrWqBdnvJtVQ5JpXn/Nof1hJTi6fsFCpD9cD1uGm4RlUDkg0RaHGA?=
 =?us-ascii?Q?dS8fNf8sn8TJsf5/FJHCm2Z0WdQ59nceF7liN4xoX2gJZOmVSvN8BZsMmeEp?=
 =?us-ascii?Q?Ea5u+7ReJ8mvDtnieoO4Te07KFHqoyBrrF30l4Xa4ckT4pp7Tg0M9ZyKEBuC?=
 =?us-ascii?Q?q0E0ZJy54tvlwET+5MmEaiZnpSZtua1MW7JJr19y+mXTEpdF0pLGGnFL0SR7?=
 =?us-ascii?Q?j1P75kZySKElcsxX/83BLegl5Ma/RYqNflQ2i540UpucabDBwVT8Y+EhreLB?=
 =?us-ascii?Q?UavShT3DpWlYTbzgqnJfsgzVD2ZPpCyTBdQ+Qy+mp8QbPb6vpFSqNqEUSx1Q?=
 =?us-ascii?Q?ZzOKaxSkJCwg5HGzgsx5LnukzioQ3iCxR4PTvgActJTlXZWlriZZPjVXHPpG?=
 =?us-ascii?Q?/LPZKcruRLBnKiqaeUA+SCrTadBKjP8XZB4EM36BvYxRyPc+HHqB2mKCiWB+?=
 =?us-ascii?Q?rl2KPTjobANc3GoXNvfE2qO5jKOniWFZ5ip2Qp00FwAM+t5+JIjaBRpnXzhp?=
 =?us-ascii?Q?uJ+crsaNQ/67rhyqkSQR4e75LQuiPSUwg0b2hjZTg7G6Dycz+n8P3nN8ReIy?=
 =?us-ascii?Q?ffKzZBxs8EK4rMX2NU/4WbCTKGtI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WTXKpcJGo7eeVlXvSr5PTKgLySMKzsJg+EpAiOYGmBdGPp7/wFRUwxHOSjef?=
 =?us-ascii?Q?F6KyFSWcq2wCTN0elEECLQRisxZ4VLu1HtsnbsKDwliONqk6RgoV3qzcnsiO?=
 =?us-ascii?Q?ECP6jAVIsSSHfpfO1dE4mX15uVqJBCgKEETKD6j3mQodFhAtUUYahqUngiGx?=
 =?us-ascii?Q?mNHTTWd5DKtIWPCq63lnW9MwOc2z6KOwYeyyw6jHq5HyLU66eVFZxdtW2YGW?=
 =?us-ascii?Q?LKX7aDX5KUbFYL1Capf2cIdXjkhayKbHyIgiCx/K6HLnDCc75WOrsM6s0Dgi?=
 =?us-ascii?Q?lcEYTZINlwtoJBns2OLxfTXys1dOVvXFTSKzdPZQqZl9NiM2vX0Foy5x5/bh?=
 =?us-ascii?Q?CBFbusJqZloJ2uVLwlmkJFTt+dXE7EA5BLuD3af90R9tW/7XINTcrAdaRcjY?=
 =?us-ascii?Q?+4I6Epwn+Z2zKYAcJndtqDOYUWueOmzjHS3EVgWOblC2d+H0mtmIYDdrgqIz?=
 =?us-ascii?Q?V9UeJDvuO9y1QxBr2oVj2eBhb9eBLakFl1Zl3ir43qUklu6SR7yv4ZI97hF6?=
 =?us-ascii?Q?wjrEk5LYi6YtTucd628uFlerG/U98goloB0ZdN6Md0IUp6Bpm75HXmxKjbUL?=
 =?us-ascii?Q?VqQkbO3ialwbb7TWsI+T8MqVyXiT2OgqAeKmh55szighd8HcHaIx/elSGreb?=
 =?us-ascii?Q?tfEfqpLR+eXyk8XYrmQUyPU+MBxtsX0gnv2n9sF5He1Y3QTISYTFvhhzsa6w?=
 =?us-ascii?Q?RIYbL6iX0Epik+coiiHl/bJqaXU6RiNF8ywrIf+P91yRerWpQppboeZ+tarE?=
 =?us-ascii?Q?ijMZrMva5OjqTWEbgPdayqofdgZt1O6hXUkaGd56tEexelNWLIBnPL92/ZfK?=
 =?us-ascii?Q?EviInO8urETTv+JQ4ttxXuBVoYo4UiYjSzhz5NVRt2eTkIRLRB0VwzYK6YE2?=
 =?us-ascii?Q?MXcbJu1CwmH7qxuxaxYC8g8hPf5jwcr5cOBnXewbvCvwITj2gSYMynMNGYWX?=
 =?us-ascii?Q?PDZL1jLAfAa4wu1a4MiAZ6vTMCx5orp9s0R9iXO5s4H+PcDPv58TEmV3pfhc?=
 =?us-ascii?Q?6DeHKGbqzUhJ5gVW8YB0VKvb2HC0E0CotXRKeEcrjDT9WuC/ewFS8NI5OmLp?=
 =?us-ascii?Q?DnAABGTfPhS7Nn9iYKA0REyKAky4TAodtpUHUejxMQli2Q11wbR+l9FlnIEZ?=
 =?us-ascii?Q?aqALlhGuJ+hFxtJGTdPehoC2NuR/eT/YSGWFl1VQT/f28e7lVcnSyQ8RJJpI?=
 =?us-ascii?Q?HIMa9s6UmI3bLXVxVze7zqtkusw4nms5hl/D3fgy5D8az7XXhjjBaQl4mXiS?=
 =?us-ascii?Q?seboJ7bsGjkTPSzlgJWe81bLMcuhTXEvOAVsB380ErpqNGJm8upxnuTXvw0m?=
 =?us-ascii?Q?zRas6+Oj/i4M0Nkcl8Bf2lLb8S54Korso+HP4Z2Bv6iOV82NpEDdnqBgpDbT?=
 =?us-ascii?Q?dGj+Clahzzqhk9ePBdzNUjXlFSnxm84QVMrPIv4siA4eYtpH6n4AmJaEy/0V?=
 =?us-ascii?Q?M+yUYYrtX7AvmG4Xl8gx7/X5QBPuof+9QCMdfVTfeKhRNudItndVbqEM4AfK?=
 =?us-ascii?Q?QQmEi/NrWJX/jzWUEDVosIC/JP0uDBVUZD+LiQvlmS1dJT6f6jg5f8+uqT3v?=
 =?us-ascii?Q?lQt7k61rcgDw1jveohF0pBNPEyAQzFGOEhUMTn2p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7472b66f-9d96-4f9d-7727-08dd7447929b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:41:30.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLrhTNouJBV7xvggetnhyKLB7Do77ZIiqZ8IH4bnw3ua+5KF3gwJrMk4OdARnOZ9cD6qXuacTsgTa9qwuK3uRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

Provide a new kfunc, scx_bpf_select_cpu_and(), that can be used to apply
the built-in idle CPU selection policy to a subset of allowed CPU.

This new helper is basically an extension of scx_bpf_select_cpu_dfl().
However, when an idle CPU can't be found, it returns a negative value
instead of @prev_cpu, aligning its behavior more closely with
scx_bpf_pick_idle_cpu().

It also accepts %SCX_PICK_IDLE_* flags, which can be used to enforce
strict selection to @prev_cpu's node (%SCX_PICK_IDLE_IN_NODE), or to
request only a full-idle SMT core (%SCX_PICK_IDLE_CORE), while applying
the built-in selection logic.

With this helper, BPF schedulers can apply the built-in idle CPU
selection policy restricted to any arbitrary subset of CPUs.

Example usage
=============

Possible usage in ops.select_cpu():

s32 BPF_STRUCT_OPS(foo_select_cpu, struct task_struct *p,
		   s32 prev_cpu, u64 wake_flags)
{
	const struct cpumask *cpus = task_allowed_cpus(p) ?: p->cpus_ptr;
	s32 cpu;

	cpu = scx_bpf_select_cpu_and(p, prev_cpu, wake_flags, cpus, 0);
	if (cpu >= 0) {
		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL, SCX_SLICE_DFL, 0);
		return cpu;
	}

	return prev_cpu;
}

Results
=======

Load distribution on a 4 sockets, 4 cores per socket system, simulated
using virtme-ng, running a modified version of scx_bpfland that uses
scx_bpf_select_cpu_and() with 0xff00 as the allowed subset of CPUs:

 $ vng --cpu 16,sockets=4,cores=4,threads=1
 ...
 $ stress-ng -c 16
 ...
 $ htop
 ...
   0[                         0.0%]   8[||||||||||||||||||||||||100.0%]
   1[                         0.0%]   9[||||||||||||||||||||||||100.0%]
   2[                         0.0%]  10[||||||||||||||||||||||||100.0%]
   3[                         0.0%]  11[||||||||||||||||||||||||100.0%]
   4[                         0.0%]  12[||||||||||||||||||||||||100.0%]
   5[                         0.0%]  13[||||||||||||||||||||||||100.0%]
   6[                         0.0%]  14[||||||||||||||||||||||||100.0%]
   7[                         0.0%]  15[||||||||||||||||||||||||100.0%]

With scx_bpf_select_cpu_dfl() tasks would be distributed evenly across
all the available CPUs.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c                       |  1 +
 kernel/sched/ext_idle.c                  | 55 ++++++++++++++++++++++++
 tools/sched_ext/include/scx/common.bpf.h |  2 +
 3 files changed, 58 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index ac3fd7a409e9a..eae16108f8d6c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -465,6 +465,7 @@ struct sched_ext_ops {
 	 * idle CPU tracking and the following helpers become unavailable:
 	 *
 	 * - scx_bpf_select_cpu_dfl()
+	 * - scx_bpf_select_cpu_and()
 	 * - scx_bpf_test_and_clear_cpu_idle()
 	 * - scx_bpf_pick_idle_cpu()
 	 *
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index f39b34fbb8a61..023ae6df5e8ca 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -912,6 +912,60 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
 	return prev_cpu;
 }
 
+/**
+ * scx_bpf_select_cpu_and - Pick an idle CPU usable by task @p,
+ *			    prioritizing those in @cpus_allowed
+ * @p: task_struct to select a CPU for
+ * @prev_cpu: CPU @p was on previously
+ * @wake_flags: %SCX_WAKE_* flags
+ * @cpus_allowed: cpumask of allowed CPUs
+ * @flags: %SCX_PICK_IDLE* flags
+ *
+ * Can only be called from ops.select_cpu() or ops.enqueue() if the
+ * built-in CPU selection is enabled: ops.update_idle() is missing or
+ * %SCX_OPS_KEEP_BUILTIN_IDLE is set.
+ *
+ * @p, @prev_cpu and @wake_flags match ops.select_cpu().
+ *
+ * Returns the selected idle CPU, which will be automatically awakened upon
+ * returning from ops.select_cpu() and can be used for direct dispatch, or
+ * a negative value if no idle CPU is available.
+ */
+__bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+				       const struct cpumask *cpus_allowed, u64 flags)
+{
+	s32 cpu;
+
+	if (!ops_cpu_valid(prev_cpu, NULL))
+		return -EINVAL;
+
+	if (!check_builtin_idle_enabled())
+		return -EBUSY;
+
+	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
+		return -EPERM;
+
+#ifdef CONFIG_SMP
+	/*
+	 * This may also be called from ops.enqueue(), so we need to handle
+	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
+	 * selection optimizations and simply check whether the previously
+	 * used CPU is idle and within the allowed cpumask.
+	 */
+	if (p->nr_cpus_allowed == 1) {
+		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
+		    scx_idle_test_and_clear_cpu(prev_cpu))
+			return prev_cpu;
+		return -EBUSY;
+	}
+	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
+#else
+	cpu = -EBUSY;
+#endif
+
+	return cpu;
+}
+
 /**
  * scx_bpf_get_idle_cpumask_node - Get a referenced kptr to the
  * idle-tracking per-CPU cpumask of a target NUMA node.
@@ -1220,6 +1274,7 @@ static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
 
 BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
 BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
+BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu = {
diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index 8787048c67625..d4e21558e9826 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -48,6 +48,8 @@ static inline void ___vmlinux_h_sanity_check___(void)
 
 s32 scx_bpf_create_dsq(u64 dsq_id, s32 node) __ksym;
 s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, bool *is_idle) __ksym;
+s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+			   const struct cpumask *cpus_allowed, u64 flags) __ksym __weak;
 void scx_bpf_dsq_insert(struct task_struct *p, u64 dsq_id, u64 slice, u64 enq_flags) __ksym __weak;
 void scx_bpf_dsq_insert_vtime(struct task_struct *p, u64 dsq_id, u64 slice, u64 vtime, u64 enq_flags) __ksym __weak;
 u32 scx_bpf_dispatch_nr_slots(void) __ksym;
-- 
2.49.0

