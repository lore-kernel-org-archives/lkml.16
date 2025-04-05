Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02A01F0E42
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860505; cv=fail; b=E6G1igFgbhbthmQcyz4gNRZYWngEAshJvVvsp+FCu84LyUYaavdNxKmDgWijjzlW0pP/zfeY1Apcjy+qCLn6vx1UEibooKaUPIRCrYJtOem0sUoQabI2kSgqEC/K862rgRlhq5d6Hl2HHLZdcuUJ2iZ5T5NpWBj39vmCwQFnLJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860505; c=relaxed/simple;
	bh=T8CrSIZsEy66MWlulLM3zE+fU8AL22Sm8cohForLegc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D3+Cp5XE9XXxKHlB6C3upwNK8SLy8AG6hOpLhcl0z1hbmEj8hNsoOkFApavgMAcwvfYW/NMTJ1eLng263k8EBesTtECQjrzXmF0PZemh/CVSntm6YJYoggQIWM43y6mgbDksmMDMWHXvXSBKVOZLHCjp2SfixTXJvrKWQUQVJA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FMrEY13n; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FMrEY13n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k06I/JJ0O7xvjraYwrfhzhNQEfzqA5n3g+7a3gQgEoOGGvmw5sTLH3/LIKr+y0NZ/97dCL+bdG1X1f5K9nmtvg9VPJRQUSVnNcuZ0eeLCIan9GTsVw1a3H/N0aNtiD5IG37ZcunXlRh7fySK/ZBHQ2U9mNHrMW9Cvr+O9rpCNE6vbasd3C7jCXrplqxImX01gmSsGEnB+D4+foEjNzTkUaqWSy0XqDI/bPm3yclLfE6sK66pcLK4O0jYduSxTzePAmtH1NLa09B7XDoXwR/Rl5s9dwbnm0EOoEyhmEnPm4irJbtTi7QN9uFfuFkhyZPyVUS4CwHlXYZ3GOQIviZoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P51HPfHWTFjR7iHNrbXSFmJlN4+ygOhIkf39cxTaAXE=;
 b=k8fUu3zqWnFxpIKSneqCExAF3f5ns3PZOHLcZHHYogW5BjhtIWMuVHRV9tZbxveQpTRbCO0IBXdnYZ6l4J+rJJA5bUOVUwRONfyFOPQiOtaBW1BDIR5REJffQWrvItKvxgbfA3Rjg2M1FYFwQ7E1Ytm35xeVbJ/Q2HrYJbNA/5i0pjmnPr5BySFmVxJLbflPRNzjFkEzmo7pnNRhYMzfG5l9RMPjxklVfchFuZceVeEjasMnM9SPXhVciCbG3+dkJcntdquNBTELn9qdu3QRLP9UUoEZ0SJ5hTxJ/TibH6hdmXjDEcHOtmcfAfo9hg4ldAmJ6y4pdLVupuId5QmaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P51HPfHWTFjR7iHNrbXSFmJlN4+ygOhIkf39cxTaAXE=;
 b=FMrEY13njYJQa037zav8TLAjiYo38o7reZaBUqkEkk7ApAIJcJeGmUyCr7VkwXbVGB1It8+KxRs+Qwzaf7Lzrwso9AcIDzbQDteUt2LjoGCEB7P6hs0TljyzDd8wAhP8No2xrEwjjkdVD51dH5z40tIJHi6BLr4nIEgY3X1DHXxQiE4wbtbArDc5RLjUvn7VdZk+5R7Rey/iPutyxQ6xkYYgjkhRa029bQJ1jCQ/n5Ch0YZut5hhJa7LKEX7FY4GbpS+JHw5Ip/8rxe7u2X52s8YhsgV5LDtTZDTPvcdnVNx6tUsDUOYxDx7axmfNWl+wgXea03fYyasXl3PjYKpmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Sat, 5 Apr
 2025 13:41:41 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:41:41 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] selftests/sched_ext: Add test for scx_bpf_select_cpu_and()
Date: Sat,  5 Apr 2025 15:39:25 +0200
Message-ID: <20250405134041.13778-6-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>
References: <20250405134041.13778-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: aef90cb3-9cbb-43bc-7f26-08dd7447986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iPgwZFJZRq+b5tSqXI9WI+HBYc3j8xHSO9ayXxoPriLEIqLDpoRp8zMtfeAz?=
 =?us-ascii?Q?eT3R8/B2mUgB+FdLxOuDJdlhqgWO0jpLh8P3635Sb+oifjAONykih3WUhdHI?=
 =?us-ascii?Q?BpI9MA0v8o41Zw0n/gOGgIHTRVKsRaGLxOP+EbgqX/kETFd/n0zoC3yq5Y+q?=
 =?us-ascii?Q?uSzAUxQwDgv5XD+93WlEucOSrYXh/iTWzLRrRGTjbOf9M683esOhqOAlbfgc?=
 =?us-ascii?Q?HB9j1Y2nW9NOqJH/KCF1bENlZ4rbKeLvzQJfkrMukDntFIaj9qJyNTNtDMd9?=
 =?us-ascii?Q?69ZG0qKZCdVYMPJMP+OZEM+aXAteA46KBhpTR202/QbxZIhS2OoE5jwq3x94?=
 =?us-ascii?Q?QpI7Skjcb7MX+yy4JlBVw2b7Tp1clY4drANoXJDMOt8kW1BTPTSeznwv+LWN?=
 =?us-ascii?Q?n3G+bGUrRFYPrAtYrhx3Z2A1QySVQptYmClOXqYccmfBGFKONHZraq5WUwkl?=
 =?us-ascii?Q?h+DH3zz8DMLuZB3GCZ0PZi6/TNa2tKVliM1W7PkoQFkwM97enhd15+OKaE//?=
 =?us-ascii?Q?s/TN7MDTMjyNZ2Ajrl+I6y5xboEJhav7pZ6zJ1DR8f0rarb0Nt6Yi2GXR8oa?=
 =?us-ascii?Q?6YU+XWgbQBoKYbZoRnJ2DWCDSw74N0R72XgxW7VCaBpJxNRFfov02gkFUPIu?=
 =?us-ascii?Q?sDqb3AESl3oZLYuRCzRVC25vB+RpX5eUXXD7wcbXTuFxJA/fMuqboaguRLRL?=
 =?us-ascii?Q?B2mOKHOwMKjusHKu3oBuit4B5g3e6SSKNDPZGeQC8lGtR20L8DMgknSX1CZK?=
 =?us-ascii?Q?3vgjsNVmnTMr0prC6pyFfbcOFnkxkCWcIQ7UBry84LjK3pBd6IJ9ccJsLWcJ?=
 =?us-ascii?Q?bgY9kS2rnovn6KsfQ2il9C/RXcPv+I3QhMyrW6MnngLGTC3jx3q0vrI97enR?=
 =?us-ascii?Q?OH1/ywXQ78Ehax4C1wC0RLq8/cqAgtixdvxFXUA6eGSiR6/HN+u3rNYo4fh8?=
 =?us-ascii?Q?qwqxpVHZPHbv5o6iYGY3wN8uuoAZ0DueeZAdSF8pAtf0ujMod6/EMKyyPJg8?=
 =?us-ascii?Q?YmRtlEDvSvCse5GeMCftrQasnqNOKM07CddMYd9+GGAfAhenYxIMsErLIj0P?=
 =?us-ascii?Q?N7LTi92zNUD9wbDqneeyLaB11sMcCFkEy4hikp1hUFo6uwGX54OGd4XKDQ2F?=
 =?us-ascii?Q?Sp6j5U9nZVpGVHbipmerYIg5wxw32+4GcuB8PGUHi3ozV5LYTnO/qAhP9q4z?=
 =?us-ascii?Q?ZUem6/tQW12X4EgmbaANH66U8dk6PXaMLjalHGgq4ntrNVVftAZLsR9O+628?=
 =?us-ascii?Q?98m+U2bkq5+j6MFgf6TsJEf4JDyMs6n/00l+qDt8VhNVApkzR04pyaTYFVUN?=
 =?us-ascii?Q?X1Tdx1JEukLpgR3VlSHqxndwS2s8VWgilWOOTNeCDimX4oVPefNUICTlHJAS?=
 =?us-ascii?Q?Sspi+lCVJhPfo36ktAkzfwzQlIqa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jYyQLLLdnwhSBNUfcaLYD1M1paJt/5ZhdXuWyXVA1SWy49sPoFdnBrHIbjxR?=
 =?us-ascii?Q?Osfvt84KlVEi6ac4N1CdaO8rgnWmEkFeiAbnTjcZzV77wcvD4c9BoyunN2cU?=
 =?us-ascii?Q?+bxbZOa4Gz6cu6G2b2KzFjDMVzKQaFu6zXMMHGTiG7We8yBW1kvOvnPQQK8r?=
 =?us-ascii?Q?KC2VYKnomhIatCRfFR6srxXLBMh7B6nvS6S4mvwxwaR2ZcZTfbX7mb4nJoCb?=
 =?us-ascii?Q?c82dFWBTzg/Td/XcbVg8oJpt8oY65rr9u6tGc7xVpuziLh6MI9WKDpEmSrGY?=
 =?us-ascii?Q?aKDq0vmcyKiSxOR2MnqnFIw+tMJiSa0aZRdOm6hPxGWC/KGG/P0QZckUbhIN?=
 =?us-ascii?Q?jkCGskUeFmCVjcHiPxVEgQ9gwrgEYlfMYe+j1+Evqr1xskF5uSqnU24V0cFW?=
 =?us-ascii?Q?28eYWynKMf3cw/edKySW5eSHKECqpCdXsCxs06q2qGw5YXWdxpCAwztjUg3B?=
 =?us-ascii?Q?Nt30kYhN+Th0TkdfP+u1eEKib35PWbcFe99/1AIg2e6uo+7McGLiz7J5Z7Lp?=
 =?us-ascii?Q?1de31dGGR9lqTRodSgR2U8AeYcODevrIbTmnUMc0hPdqYqQBGgiIE4VbkVk+?=
 =?us-ascii?Q?0p6rlgxc//Zy81Gc1Zl2SC41a83xUbP4gqo8q0yZHRMGRi/BzHzQn4akxykF?=
 =?us-ascii?Q?ZJfHpzfb2A9J68J+WFxAaXnf8RRJnEC6yC7eLFUqROFv0WfhEzz00ggIp3wV?=
 =?us-ascii?Q?YZzzPrT+OfFiFmFRsrBxeZp6cYLZBDvt9F9YycRKOcmmVbA1LsDSbgIcEpQ/?=
 =?us-ascii?Q?yx7ekYsVdqyYB42qJd9lMXGVpQjUq5zFHX08cLpzSaiHVnFcBOFbBaJjie7Q?=
 =?us-ascii?Q?i/BIP7T+nakNOCVDsDB1ERmtbTjYxudZ1C/i+nrINhh5DzuWBeCbqBsB+5XJ?=
 =?us-ascii?Q?Zt2k+gyPdE9Uig0MCu/0OKKKx60RkAq1iJbMYJjLBw93kQYV1SBoYCu0pohb?=
 =?us-ascii?Q?udLBhjxmoF6GUM4S/YzS3Umclnza9uGC/owIR/4flXpwtP6u1ZUrGcpG4rot?=
 =?us-ascii?Q?H3M1rge8pOY1Iww1oQO5IYalqO6zWete8tVmgicvpEG69d8juSzZOApym5Ti?=
 =?us-ascii?Q?VG13av/Jly+uh7Fvgd/2CNhl6OYcl1qID8nBZjTkxr+OQgXo/ydBv+SwyPG/?=
 =?us-ascii?Q?WxmYBKhijxYMOjdNhstR0/rqRzBmfg52Ic2G9qDF+aNHOuCWzfflUbFTb00J?=
 =?us-ascii?Q?3cybK8xN3YgDvWJfSrvZg6Ao5b6lU868v+cf7GJppm6bu66LhW83pP0R9AXg?=
 =?us-ascii?Q?bjxZSv//lNQmMNeczog5ydRC7McFUO9syTZSUyEeZ9b5D0G9vgdFKHn3u9Bl?=
 =?us-ascii?Q?/lxKAp9GSzv3ZYfrAJBwZT+SaBM0L9zuhxsbgYkSOI/LlvoKyNNxWQlA+LaB?=
 =?us-ascii?Q?7AvDhY16awKVPZdnmve9aHszutrb3W4qejngbRIAts2p87zmprlnPsSR3eln?=
 =?us-ascii?Q?7RUvccbDSC1NGVsMota+hcmT7bSX6cDOLa8Kym6k0eaPZOuX8jh0axiV3Sm/?=
 =?us-ascii?Q?vJ8YcpjRACLSL8yrBjU9xUxFmmACjD6ZBpYgHg7UnYJONKqKVeRJLXayZE64?=
 =?us-ascii?Q?OMArCqfKIcWIHhXmqrM1zSWd+73s8M6qeeFGyhAC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef90cb3-9cbb-43bc-7f26-08dd7447986d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:41:41.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZqeY9r9XP/o2ZxPkojaqey1dWzU1Sw4epam2aEYvROPhgjwWsqenQ3Y4wmKoCf2SsOxwBNqvwmhGLLAuWyFQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

Add a selftest to validate the behavior of the built-in idle CPU
selection policy applied to a subset of allowed CPUs, using
scx_bpf_select_cpu_and().

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../selftests/sched_ext/allowed_cpus.bpf.c    | 121 ++++++++++++++++++
 .../selftests/sched_ext/allowed_cpus.c        |  57 +++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index f4531327b8e76..e9d5bc575f806 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -173,6 +173,7 @@ auto-test-targets :=			\
 	maybe_null			\
 	minimal				\
 	numa				\
+	allowed_cpus			\
 	prog_run			\
 	reload_loop			\
 	select_cpu_dfl			\
diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
new file mode 100644
index 0000000000000..39d57f7f74099
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A scheduler that validates the behavior of scx_bpf_select_cpu_and() by
+ * selecting idle CPUs strictly within a subset of allowed CPUs.
+ *
+ * Copyright (c) 2025 Andrea Righi <arighi@nvidia.com>
+ */
+
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+UEI_DEFINE(uei);
+
+private(PREF_CPUS) struct bpf_cpumask __kptr * allowed_cpumask;
+
+static void
+validate_idle_cpu(const struct task_struct *p, const struct cpumask *allowed, s32 cpu)
+{
+	if (scx_bpf_test_and_clear_cpu_idle(cpu))
+		scx_bpf_error("CPU %d should be marked as busy", cpu);
+
+	if (bpf_cpumask_subset(allowed, p->cpus_ptr) &&
+	    !bpf_cpumask_test_cpu(cpu, allowed))
+		scx_bpf_error("CPU %d not in the allowed domain for %d (%s)",
+			      cpu, p->pid, p->comm);
+}
+
+s32 BPF_STRUCT_OPS(allowed_cpus_select_cpu,
+		   struct task_struct *p, s32 prev_cpu, u64 wake_flags)
+{
+	const struct cpumask *allowed;
+	s32 cpu;
+
+	allowed = cast_mask(allowed_cpumask);
+	if (!allowed) {
+		scx_bpf_error("allowed domain not initialized");
+		return -EINVAL;
+	}
+
+	/*
+	 * Select an idle CPU strictly within the allowed domain.
+	 */
+	cpu = scx_bpf_select_cpu_and(p, prev_cpu, wake_flags, allowed, 0);
+	if (cpu >= 0) {
+		validate_idle_cpu(p, allowed, cpu);
+		scx_bpf_dsq_insert(p, SCX_DSQ_LOCAL, SCX_SLICE_DFL, 0);
+
+		return cpu;
+	}
+
+	return prev_cpu;
+}
+
+void BPF_STRUCT_OPS(allowed_cpus_enqueue, struct task_struct *p, u64 enq_flags)
+{
+	const struct cpumask *allowed;
+	s32 prev_cpu = scx_bpf_task_cpu(p), cpu;
+
+	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, 0);
+
+	allowed = cast_mask(allowed_cpumask);
+	if (!allowed) {
+		scx_bpf_error("allowed domain not initialized");
+		return;
+	}
+
+	/*
+	 * Use scx_bpf_select_cpu_and() to proactively kick an idle CPU
+	 * within @allowed_cpumask, usable by @p.
+	 */
+	cpu = scx_bpf_select_cpu_and(p, prev_cpu, 0, allowed, 0);
+	if (cpu >= 0) {
+		validate_idle_cpu(p, allowed, cpu);
+		scx_bpf_kick_cpu(cpu, SCX_KICK_IDLE);
+	}
+}
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(allowed_cpus_init)
+{
+	struct bpf_cpumask *mask;
+
+	mask = bpf_cpumask_create();
+	if (!mask)
+		return -ENOMEM;
+
+	mask = bpf_kptr_xchg(&allowed_cpumask, mask);
+	if (mask)
+		bpf_cpumask_release(mask);
+
+	bpf_rcu_read_lock();
+
+	/*
+	 * Assign the first online CPU to the allowed domain.
+	 */
+	mask = allowed_cpumask;
+	if (mask) {
+		const struct cpumask *online = scx_bpf_get_online_cpumask();
+
+		bpf_cpumask_set_cpu(bpf_cpumask_first(online), mask);
+		scx_bpf_put_cpumask(online);
+	}
+
+	bpf_rcu_read_unlock();
+
+	return 0;
+}
+
+void BPF_STRUCT_OPS(allowed_cpus_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops allowed_cpus_ops = {
+	.select_cpu		= (void *)allowed_cpus_select_cpu,
+	.enqueue		= (void *)allowed_cpus_enqueue,
+	.init			= (void *)allowed_cpus_init,
+	.exit			= (void *)allowed_cpus_exit,
+	.name			= "allowed_cpus",
+};
diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.c b/tools/testing/selftests/sched_ext/allowed_cpus.c
new file mode 100644
index 0000000000000..a001a3a0e9f1f
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Andrea Righi <arighi@nvidia.com>
+ */
+#include <bpf/bpf.h>
+#include <scx/common.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include "allowed_cpus.bpf.skel.h"
+#include "scx_test.h"
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct allowed_cpus *skel;
+
+	skel = allowed_cpus__open();
+	SCX_FAIL_IF(!skel, "Failed to open");
+	SCX_ENUM_INIT(skel);
+	SCX_FAIL_IF(allowed_cpus__load(skel), "Failed to load skel");
+
+	*ctx = skel;
+
+	return SCX_TEST_PASS;
+}
+
+static enum scx_test_status run(void *ctx)
+{
+	struct allowed_cpus *skel = ctx;
+	struct bpf_link *link;
+
+	link = bpf_map__attach_struct_ops(skel->maps.allowed_cpus_ops);
+	SCX_FAIL_IF(!link, "Failed to attach scheduler");
+
+	/* Just sleeping is fine, plenty of scheduling events happening */
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
+	struct allowed_cpus *skel = ctx;
+
+	allowed_cpus__destroy(skel);
+}
+
+struct scx_test allowed_cpus = {
+	.name = "allowed_cpus",
+	.description = "Verify scx_bpf_select_cpu_and()",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+REGISTER_SCX_TEST(&allowed_cpus)
-- 
2.49.0

