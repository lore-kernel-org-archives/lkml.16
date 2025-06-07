Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723E15D1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290465; cv=none; b=ANUPqQ6xvTSYDNugHcBQXvMjsKbg8UxgttNtlBr1cc5nszt+Qrn7JJwRZ5VGVkar0cOZkRA0I5EH80dYXKuERZOsNZ7arPNaA1XJ7gKXn1fzwYnqRNwi0URwm1xtbNmbhskXuFSGSJEw+o0MYVyvU4bspH7ltaApDHDtaKyjwAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290465; c=relaxed/simple;
	bh=haXDDy0jhSubRISAwi0kW5POr2APZOU+vOXOdU7Lg7A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ek0q9vAzdnMmRFZUvAT/Kz5cZdTj0CwnW7KzgywSViYq0vq3rYgOxpC5KA2oizvQW/vs2sLzkQnR/ULUl0dU9Pp5Gcq+uY6wh6WGIRxgZSGk41R/DWRNHuUuB4viPZw8s6xzwiqaWzjd49bRqvvqkIOhNulE+Yfk2pEFvbH3SGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bDtcX6GHbz27hct;
	Sat,  7 Jun 2025 17:46:36 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 0875718005F;
	Sat,  7 Jun 2025 17:45:45 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemh100008.china.huawei.com (7.202.181.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Jun 2025 17:45:44 +0800
From: Lifeng Zheng <zhenglifeng1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <viresh.kumar@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <zhenglifeng1@huawei.com>
Subject: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
Date: Sat, 7 Jun 2025 17:45:33 +0800
Message-ID: <20250607094533.416368-1-zhenglifeng1@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100008.china.huawei.com (7.202.181.93)

Amu fie was set up by a cpufreq policy notifier after the policy was
created. This caused some problems:

1. The cpus related to the same policy would all fail to set up amu fie if
one of them couldn't pass the freq_counters_valid() check.

2. The cpus fail to set up amu fie would never have a chance to set up
again.

When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
would never be setup. After that, when cpufreq policy was being created,
the online cpu might set up amu fie fail because the other cpus related to
the same policy couldn't pass the freq_counters_valid() check. Hotplug the
offline cpus, since the policy was already created, amu_fie_setup() would
never be called again. All cpus couldn't setup amu fie in this situation.

After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
ratio"), the max_freq stores in policy data is never needed when setting up
amu fie.  This indicates that the setting up of amu fie does not depend on
the policy any more. So each cpu can set up amu fie separately during
hotplug and the problems above will be solved.

Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
---
 arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..207eab4fa31f 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
 	return freq;
 }
 
-static void amu_fie_setup(const struct cpumask *cpus)
+static void amu_fie_setup(unsigned int cpu)
 {
-	int cpu;
-
-	/* We are already set since the last insmod of cpufreq driver */
 	if (cpumask_available(amu_fie_cpus) &&
-	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
+	    cpumask_test_cpu(cpu, amu_fie_cpus))
 		return;
 
-	for_each_cpu(cpu, cpus)
-		if (!freq_counters_valid(cpu))
-			return;
+	if (!freq_counters_valid(cpu))
+		return;
 
 	if (!cpumask_available(amu_fie_cpus) &&
 	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
-		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
-			  cpumask_pr_args(cpus));
+		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
+			  cpu);
 		return;
 	}
 
-	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
+	cpumask_set_cpu(cpu, amu_fie_cpus);
 
 	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
 
-	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
-		 cpumask_pr_args(cpus));
+	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
 }
 
-static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
-				 void *data)
+static int cpuhp_topology_online(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = data;
-
-	if (val == CPUFREQ_CREATE_POLICY)
-		amu_fie_setup(policy->related_cpus);
-
-	/*
-	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
-	 * counters don't have any dependency on cpufreq driver once we have
-	 * initialized AMU support and enabled invariance. The AMU counters will
-	 * keep on working just fine in the absence of the cpufreq driver, and
-	 * for the CPUs for which there are no counters available, the last set
-	 * value of arch_freq_scale will remain valid as that is the frequency
-	 * those CPUs are running at.
-	 */
+	amu_fie_setup(cpu);
 
 	return 0;
 }
 
-static struct notifier_block init_amu_fie_notifier = {
-	.notifier_call = init_amu_fie_callback,
-};
-
 static int __init init_amu_fie(void)
 {
-	return cpufreq_register_notifier(&init_amu_fie_notifier,
-					CPUFREQ_POLICY_NOTIFIER);
+	int ret;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"arm64/topology:online",
+				cpuhp_topology_online,
+				NULL);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 core_initcall(init_amu_fie);
 
-- 
2.33.0

