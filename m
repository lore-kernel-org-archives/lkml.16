Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922E2F94BC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270914; cv=none; b=qo1W6boom/FPcJM6aUbqBPYFsJsbF683DNq+T76orD1BhUuPT/cDgxLm/IdIt7lsAwwvhls6rRgrRp3wVI2a2orhxiRxH4pzTcUnStzKQ94lhDbiQkmwAnBP+Oe6i31HfDZbyBWWJXZl9duCrd/52c4F5rx8/huBgPpKES9g+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270914; c=relaxed/simple;
	bh=cQUCpe4LZfLrzrqrRvhJ4zn32opdkosRxPW3YpSdQpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8VqwMymU4J6e9GkRGLqFZapA+h/KmaiCqV6pWjSVsWwmgnsiVhiYCMQUYaIYCuRy8xdvkKxXLmpnnj81wxXCZFpX6tgVD+1igdqcNGnsw+8Dd7OREe7hmOl9DpLac08ZCVRrBBzXbfElsFBTfBsioIq0k6loXV4uYpQZrYBrMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUltCdk8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUltCdk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270912; x=1781806912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQUCpe4LZfLrzrqrRvhJ4zn32opdkosRxPW3YpSdQpw=;
  b=FUltCdk86P1n8b/xtaRLXyRNaWFyT3up5/DOjijJa7AptKtTq7F17sT9
   +qgOnAsLS4hrBcE0M3b/NgTR2SCnVrsRwXJKozVz4N9t01io3n/dvVQKq
   38gbrgGuDv4YYXh0s0Tdj8hQgPW825VDrCKW2iASUc/Zz+VmPLgQmKiPp
   FyR41eBRrDbzEAAwNxvUiMbjT740rIgIieuCoK8C/tv7tcqrUHNVi1T/k
   b/vnTpMgt+sYhmf2tlLBsLIZRkLEKBWUqEj3rUfk1D31j6gtYWu/kqjBU
   asxz7novbH7ygWHnG2F/F9OvSjwzEc0+3fkEynQRMLwKacbHoHNVa0CrB
   w==;
X-CSE-ConnectionGUID: pkqYpBEfS3upf7WK/GoLIw==
X-CSE-MsgGUID: paR/450tR6eOwDodmnSOag==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931550"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:52 -0700
X-CSE-ConnectionGUID: uNM5F0vKRkCxQO9WvZjBoQ==
X-CSE-MsgGUID: qccG1toMTWyEIVjk+nl3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959901"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:51 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC patch v3 08/20] sched: Set up LLC indexing
Date: Wed, 18 Jun 2025 11:27:56 -0700
Message-Id: <71e251a086be786fb2a0480bbab69142d14bd22d.1750268218.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for indexing arrays that track in each run queue: the number
of tasks preferring current LLC and each of the other LLC.

The reason to introduce LLC index is because the per LLC-scope data
is needed to do cache aware load balancing. However, the native lld_id
is usually the first CPU of that LLC domain, which is not continuous,
which might waste the space if the per LLC-scope data is stored
in an array (in current implementation).

In the future, this LLC index could be removed after
the native llc_id is used as the key to search into xarray based
array.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 include/linux/sched.h   |  3 +++
 kernel/sched/fair.c     | 12 ++++++++++++
 kernel/sched/sched.h    |  2 ++
 kernel/sched/topology.c | 29 +++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d0e4cda2b3cd..7ce95a32e9ff 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -810,6 +810,9 @@ struct kmap_ctrl {
 #endif
 };
 
+/* XXX need fix to not use magic number */
+#define MAX_LLC 64
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 10ea408d0e40..5549710d95cf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1183,6 +1183,18 @@ static int llc_id(int cpu)
 	return per_cpu(sd_llc_id, cpu);
 }
 
+/*
+ * continous index.
+ * TBD: replace by xarray with key llc_id()
+ */
+static inline int llc_idx(int cpu)
+{
+	if (cpu < 0)
+		return -1;
+
+	return per_cpu(sd_llc_idx, cpu);
+}
+
 void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
 {
 	unsigned long epoch;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1c6fd45c7f62..74eb2f3615aa 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2037,6 +2037,7 @@ static inline struct sched_domain *lowest_flag_domain(int cpu, int flag)
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_llc);
 DECLARE_PER_CPU(int, sd_llc_size);
 DECLARE_PER_CPU(int, sd_llc_id);
+DECLARE_PER_CPU(int, sd_llc_idx);
 DECLARE_PER_CPU(int, sd_share_id);
 DECLARE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_numa);
@@ -2045,6 +2046,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 extern struct static_key_false sched_asym_cpucapacity;
 extern struct static_key_false sched_cluster_active;
+extern int max_llcs;
 
 static __always_inline bool sched_asym_cpucap_active(void)
 {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index f1ebc60d967f..b7bb13045dd8 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -672,6 +672,7 @@ static void destroy_sched_domains(struct sched_domain *sd)
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_llc);
 DEFINE_PER_CPU(int, sd_llc_size);
 DEFINE_PER_CPU(int, sd_llc_id);
+DEFINE_PER_CPU(int, sd_llc_idx);
 DEFINE_PER_CPU(int, sd_share_id);
 DEFINE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_numa);
@@ -681,6 +682,25 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
 
+int max_llcs = -1;
+
+static void update_llc_idx(int cpu)
+{
+#ifdef CONFIG_SCHED_CACHE
+	int idx = -1, llc_id = -1;
+
+	llc_id = per_cpu(sd_llc_id, cpu);
+	idx = per_cpu(sd_llc_idx, llc_id);
+
+	if (idx < 0) {
+		idx = max_llcs++;
+		BUG_ON(idx > MAX_LLC);
+		per_cpu(sd_llc_idx, llc_id) = idx;
+	}
+	per_cpu(sd_llc_idx, cpu) = idx;
+#endif
+}
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -699,6 +719,7 @@ static void update_top_cache_domain(int cpu)
 	per_cpu(sd_llc_size, cpu) = size;
 	per_cpu(sd_llc_id, cpu) = id;
 	rcu_assign_pointer(per_cpu(sd_llc_shared, cpu), sds);
+	update_llc_idx(cpu);
 
 	sd = lowest_flag_domain(cpu, SD_CLUSTER);
 	if (sd)
@@ -2394,6 +2415,14 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	bool has_asym = false;
 	bool has_cluster = false;
 
+#ifdef CONFIG_SCHED_CACHE
+	if (max_llcs < 0) {
+		for_each_possible_cpu(i)
+			per_cpu(sd_llc_idx, i) = -1;
+		max_llcs = 0;
+	}
+#endif
+
 	if (WARN_ON(cpumask_empty(cpu_map)))
 		goto error;
 
-- 
2.32.0

