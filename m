Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C1291144
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336685; cv=fail; b=H4a5QmHVUPk+6nqW1FiCg1yu1olUleassaW1cwkhkKkCMj/wJ1I6J8ONR1e+WYEwdOkT1aj/54jDpProkYxf5fqQx429SelLCoMWpw6FuCdHkGg+wFlbvrZRcx9U4SAtS2O4ltKTQhgucQEpKUvBogTluGZH9KV1H/T2mUcR+6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336685; c=relaxed/simple;
	bh=NLdHNs1L5kEfN+Lmz05cA+thHqCfCwIZffY+6znJyyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F+MO/521JhPxnGz/nbjBGK5Lh3Kvml7Dfqz5JR9XrXSy8PQGTAOue1fuxukw/L1VicKEeWlpRRnnHpohe+ovYWukf1yPbgIu1WjJ86eiPKcJSmTLE3W8LffIioLLYA1FZs/i+O7xfZBsLJSK+8tdu+RQ1IGUNI1PK2TBvt4ON8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kQ89xzzN; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kQ89xzzN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmCL2xr8DLy6BkBja95Df5v/mMfqnWVczRagFBKz46gZL/g9RMgVI1toMhWmXkJjjcpDD73z4Mja+r9L++Z+jrttd6NPOHiFJUrcKcSaOTh/S5jihvkEHE9MyRMLWtyiXcdJS/ZT6rL1VBfX6sAoEzy/8M0xzBKDJ5SvoHpn7L2bNn+Fi3Z/BfhnJsbRkPR0XiFWYnAdiye+c2sm/Bpxxd0uiIfYywP6ISk1ARnbrF0et5b9ndmnGq25sPDNrnBvh4ih6x9RWUZsjpeXHoG43tozin5XqHcyK6wMiW/x6OEzxM0do/fd5UaiPN+Qz8aPDd1ypHxiTKsqwJv/IvTk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XQVz4mFMlkJe6TF+NobpcRWh/31bYZ8qMKhhxqqnyU=;
 b=b2e9ec+vACX0JJ4J3dKFo5DI3C6UHe0j5fhQvEJiSDT1cgiZ2WZgJsfqGopX6uNZPr1M3k5z52sCQ93JfNSns+TF2eOYp5qD+vMtG+nCOYIg414CVh948a7E25KTGNQNiM5LwUbcfY3IEoj1mtIvXaDDRtNPlAoFCQ86HeVUWtZyHvsvObd+siq09Lj/DSCtpklpmM/5/8c9P7dSlZQ7sw9EyTWX9Ylp86nyDxo9erYLpaReeIi7rr85a4o9sePIILWDN4D+98YRCpq1gr2Di9X2NHOHX5agICtNcD9ldSaWkOiF98Xi408NLnAgw2ie9qOgDs2/eRBx3KypFoVh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XQVz4mFMlkJe6TF+NobpcRWh/31bYZ8qMKhhxqqnyU=;
 b=kQ89xzzNgDT8EUeO5z1fO/HWODPb5BQPLhwT01BID0Zp7QmAzZrEbhHJUALgQBy6SUpJpzECDSlL/MLoWPw4fSOd2PjOIivb54nU4AKHthWrtk6MlABlXS4at72lzJFDHXb8mF3i5DTOu1PHeCQoLL+69JS2f5JunJ7sLbLbAOMdUajB58rSJcNXLxmTuaQZQXtydIuoqvr0Y0o6w/mFSf/FaAywib6nS8hoNjkpIeEsoI8xvyLYJvhVDyoLXBAzlM2krKRlPv+FOgcCPsoDZxkvUKmcQxYa0Sdr2EReU16KROzXV3B3c03G767VBpVJ8+arAiINRmAcycaw17Hzeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 19:18:00 +0000
Received: from DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4]) by DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:18:00 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] selftests/sched_ext: Add test for scx_bpf_select_cpu_and() via test_run
Date: Thu, 15 May 2025 21:11:45 +0200
Message-ID: <20250515191716.327518-5-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515191716.327518-1-arighi@nvidia.com>
References: <20250515191716.327518-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::16) To DS2PR12MB9615.namprd12.prod.outlook.com
 (2603:10b6:8:275::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9615:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac67c81-00b2-46b1-070b-08dd93e53521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MRcGX2elH8n26uc/kehPe7Vegfr9TPrx/CfJi1f3stigqYE4cXcswu7QX5kt?=
 =?us-ascii?Q?w9oo/96N3z58c1eVZh+bh4C7ovSwl9Bk4we6Vo104waKvzgJkNjoGyPXgBTM?=
 =?us-ascii?Q?wtm9q06xUDtmdljtxNU2vfeSY7Hci/lb3+pJrgAR4ceY6GJfJFBlQAJuGsKe?=
 =?us-ascii?Q?ddKa0qPDK4Aa9NqKKDc6hdt3tnUTL8HONoYxEJlJFS7ejDziw8MX389XtBvj?=
 =?us-ascii?Q?FpP87X9a/+CFEyGlP7wQl3yr3oTWNZPvOlfBJB0F41VTRCDYQUUCnw5RRrXb?=
 =?us-ascii?Q?qYyMQFyudJIICjjIW+drjPf7FqG69FNrj6PHGYDcjK1hKW0EQCTo0QmLI/vX?=
 =?us-ascii?Q?3zC3X8PHG0YlFAXuxvAYUeMYvOtXeekBI6r0PJ+MAeZtae0AwBuxE0cFOC7c?=
 =?us-ascii?Q?FjJhVT2Ro2GsRZR1PH1HosQ0usOyX8OXeGfVqE2/xbaWgN+4Kh+47uRKk4Ky?=
 =?us-ascii?Q?RIJ5YWbALpH89kYJGK7U6eGlKmR3U+VZvH0TPIeieQ4riuSvkfxf/+37LQvS?=
 =?us-ascii?Q?VYQQrxcjqgU4i4w/nJ6+yotisiSkovYIeaKjDdFoldmmw2AtMIdzNg6KZxRE?=
 =?us-ascii?Q?yPfafiPrB65bmiJpBp5fX6I+6jCYGgfZHYuboaW7AgnBHsEFkX1MYkSH1+CU?=
 =?us-ascii?Q?TNz6pHPSyLGvyP8a1nUu1cIZqF5YIWC0+n4xEGrS651zBkizfICgF4gqrJ0Q?=
 =?us-ascii?Q?AgpR9AIzXX/BAosT4ibPlWa7uK0ZLiNQFJZwKJq5EPolf2washd0MdGdGrv2?=
 =?us-ascii?Q?8JTenUOuez3DdDnnZXK2MTwWrMI16+OPf/SbCoGILuIAAmciwblWg0aHBVik?=
 =?us-ascii?Q?mSaLVYcxxmSBzFodKS3fgEHLzG7Vfu37V02PB8EQeEbJrMuiyGWyMxISHmcX?=
 =?us-ascii?Q?k98T0LSrEkhH1uZGPtQhu5Mg82ARQBIIeSYTNp2n6fLDdvCfQCVC97GPGE4e?=
 =?us-ascii?Q?ckUuGnK17tMPB0bBMiRMSOsGmp1IR9rc90pLGEoXyrc4qZ/ehSwTbCQdLW+4?=
 =?us-ascii?Q?l7kIrmSZu1+UN9TsVzOTYeg/jkbmvegPMdr+yj2NmmqUP5CxcwwA3QPRkwW3?=
 =?us-ascii?Q?Y4OBrCKpAqT40PjOte1YvA9+mnyonmzzv3daYWsoRSCwp3SPjxX/ool52uB+?=
 =?us-ascii?Q?9GxJ7efItDHQq9Ojji9bDm3KWoxwDcK2NjdH2JgrSHVt0u4OZuo0jTA+YTLi?=
 =?us-ascii?Q?Z8bj6BHo4s4zIdcSCpQfw6ml/TX1TrrKSVs9mNirMY4bIIAPICYMm1+5oq/o?=
 =?us-ascii?Q?zbxfspalqC9rXsRHhsDgoxDOqClEc4GjweCgX3Th+Jn7Lh/DpjOFImGJulA5?=
 =?us-ascii?Q?G5ez8OzPSdnTvIUS5iMHmA0DyrGJdsz6ttwr6c4Ucofu5oyplSzfynOxfUNV?=
 =?us-ascii?Q?xbrJ0mR2LWBxRcvRkXKOfHEoS5+QW2kgAX8A3C9AW/W4ZRTqMM8MUhci5YVQ?=
 =?us-ascii?Q?qkgviEYm+t0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9615.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kpnl+2v2dhT1DTRbT22TEsL5JbY5o6UMaEqF4w0hrjlyi7zw0MBkolnalROV?=
 =?us-ascii?Q?cuQG5LMY7t6byMx7cBkcUFt6E3yIxXtB1H3Hzk7xzJXIVxD1rNP8fPSYo6xy?=
 =?us-ascii?Q?JZDIF+thYEg3P1Pb7i8cPZMmwI7dsHtvUr267NOi0SUjFc0jOIwOFsEgNh0V?=
 =?us-ascii?Q?WgfRhuUbUUMVR2MtOWa25k2+wLFDQdA1c6x2jYSfqVUow8vgw1qDYyqYXB5u?=
 =?us-ascii?Q?oT2nOkbTnUiHSCgg10bwa82qH+O42538KYJSynaw00qBOidxJp3iSywkiIdD?=
 =?us-ascii?Q?k60FnXXMSp8jJBjp0TIW5losFg3stS0qeNF3EERXCkd45oqM5lY2EiGFWXzi?=
 =?us-ascii?Q?bVHSVS8EGnfEOowNLaOGTq63S0jXNT7oYI8XQDAJqQX/oy8IxqohCIsitEPp?=
 =?us-ascii?Q?wYVipaopkGOlWmZvAb6d5my08U/8N/rWdD1BRBgwsQyNk3nTNZ3QGcC05b78?=
 =?us-ascii?Q?oPlSj9jOVvv1ujYaCl6QbhJci0Q9mFs8sxL3ZHsVv/eZcjrbgvg3qsGkUl0q?=
 =?us-ascii?Q?0td0uxQmwWC1NWhCwSu2p3XnwBfAfUIwBHaY7J1R/V0Wa3ObFzqMkq1Rcv7v?=
 =?us-ascii?Q?h2y/9ONtCqXeXcK8dzNsf9XqBO7NNgCZy7bpRgcSEN22TKuG8t8UBcWxCdLg?=
 =?us-ascii?Q?OCoJE05PkUCdzdm/Nm82d4pJ9ciEs2dTSdgNPBYfjFpynRXoHVdJmEn63i9q?=
 =?us-ascii?Q?hZdXdCPuk21yPDlvMxE6v6kriMxSjTwkhrZgmLwyWMDSmSI3eGbJMiipQtt1?=
 =?us-ascii?Q?+TQ1HV9ZFtLTghAguRH/0qdI2PmLPW8+3YwZ9rJEALLMlzUIecfkXFFWi22I?=
 =?us-ascii?Q?S9RAalOrH/Rg/rYx310pT68qwJ0Hf8JD87zpGDhZlAK4JErO1oiZHNz5k+E5?=
 =?us-ascii?Q?msSiEZstCgp/XI2EArGcY9x9+6+s1rmuwuk/0IT6j0chQQgzmmfn37V1TeRh?=
 =?us-ascii?Q?tAeHfRy8T6f3hRfFfBwmB3FL5E6CJEbjzLMjRFSeCPsiiLrA46ticdd+XyN2?=
 =?us-ascii?Q?jtVWdCBwGqwvmK6sU4sYaLuhSHqy8OjGYww/3pj0ucVDQs2deS+M05MHxinK?=
 =?us-ascii?Q?2+Kw1AyzIo0Oe5y41LEY400P/qpBqhFI44+Z11qTl1nzMqjbBD4JeMLq/slw?=
 =?us-ascii?Q?3Ke5ghjxVNHmzAfcc98dO5pN4Sg7eN+U4nRCDa8KBIeLD/d6nopDWeM3DSVL?=
 =?us-ascii?Q?GBkPZ6lENX0T0eTalRpPNHAN99z3ryLe07ff7SpD8H4Sn3REM+ekm2/deyc/?=
 =?us-ascii?Q?gRmMZ7XLtFoYYXhNAz6/Mdh8BQSWvBsY/rq8AzawSAnn8eaCwSrTE/m9XNK8?=
 =?us-ascii?Q?CG1c9MIibxheysgIU/l+ulhQ2WBrCIXay7/xV2szAJkGKbK2+YlcFNHYHNQr?=
 =?us-ascii?Q?2mwccwUxoQ6ZauE/G+RO+N1Stj3mt6z7vif+EzASLfQlWaRxwWk0r88l/NEM?=
 =?us-ascii?Q?s6KuuDBtFuhKZXfKQwp6QQEYhivHhl1K+AS2wyAjencvVZdkBvSiKCdFiBjR?=
 =?us-ascii?Q?ixAX0pl1jk77BoLsTtHNNJhOYl9js1gL8XbiJxxrma0+ZLUswxK4SnwkxmC8?=
 =?us-ascii?Q?H6r+mosqnwoD7mtgDT8atReQiOMT/oblQogiGfBb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac67c81-00b2-46b1-070b-08dd93e53521
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:18:00.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Taw27EXlkrvUEa7Kiq0sSYRp+BLLsJtv7U6puXCOSSAzEL7JlJ2xEPgFP5xLUfrNd3xWh2CjgDLwF4/clhwzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

Update the allowed_cpus selftest to include a check to validate the
behavior of scx_bpf_select_cpu_and() when invoked via a BPF test_run
call.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 .../selftests/sched_ext/allowed_cpus.bpf.c    | 23 ++++++++++++++++
 .../selftests/sched_ext/allowed_cpus.c        | 27 +++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
index 39d57f7f74099..35923e74a2ec3 100644
--- a/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
@@ -111,6 +111,29 @@ void BPF_STRUCT_OPS(allowed_cpus_exit, struct scx_exit_info *ei)
 	UEI_RECORD(uei, ei);
 }
 
+struct task_cpu_arg {
+	pid_t pid;
+};
+
+SEC("syscall")
+int select_cpu_from_user(struct task_cpu_arg *input)
+{
+	struct task_struct *p;
+	int cpu;
+
+	p = bpf_task_from_pid(input->pid);
+	if (!p)
+		return -EINVAL;
+
+	bpf_rcu_read_lock();
+	cpu = scx_bpf_select_cpu_and(p, bpf_get_smp_processor_id(), 0, p->cpus_ptr, 0);
+	bpf_rcu_read_unlock();
+
+	bpf_task_release(p);
+
+	return cpu;
+}
+
 SEC(".struct_ops.link")
 struct sched_ext_ops allowed_cpus_ops = {
 	.select_cpu		= (void *)allowed_cpus_select_cpu,
diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.c b/tools/testing/selftests/sched_ext/allowed_cpus.c
index a001a3a0e9f1f..093f285ab4bae 100644
--- a/tools/testing/selftests/sched_ext/allowed_cpus.c
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.c
@@ -23,6 +23,30 @@ static enum scx_test_status setup(void **ctx)
 	return SCX_TEST_PASS;
 }
 
+static int test_select_cpu_from_user(const struct allowed_cpus *skel)
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
 static enum scx_test_status run(void *ctx)
 {
 	struct allowed_cpus *skel = ctx;
@@ -31,6 +55,9 @@ static enum scx_test_status run(void *ctx)
 	link = bpf_map__attach_struct_ops(skel->maps.allowed_cpus_ops);
 	SCX_FAIL_IF(!link, "Failed to attach scheduler");
 
+	/* Pick an idle CPU from user-space */
+	SCX_FAIL_IF(test_select_cpu_from_user(skel), "Failed to pick idle CPU");
+
 	/* Just sleeping is fine, plenty of scheduling events happening */
 	sleep(1);
 
-- 
2.49.0

