Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC872F949E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270915; cv=none; b=Z36ep254EkAHaKvpr8i7KwV4mxwpymtfd2E0A6r1XAf82xXaqo+m0qmyyZX4NW84q+tYHhFu/VEpulhnEvbYzsslAlOsEdbj/cgL3d/z0RoO88Yz4a6r2b06VMNmTH912fsGsTfN/YW+VYbD10CiJVQVXES+s/I6OYnWE4BIsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270915; c=relaxed/simple;
	bh=HEb10UrMOCgohlL9Nxhp873UqhXKYVZZ5sEwo42BWsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5Z/EUYBBE/1u61niCwmDRwy0KcujoUnnkZEXjAt3pPVOfg6lPDVWI8oDLucO2nivKtjepMD9B9l2n0gliPOmSpL08JDjYQMNdIIyu7FMX+A1RKWk/VwrZpb/ie9Q5tCUnYK9oOIFmI9VCF2TdqXlfQyE/9gjbxg71N+r5vzmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTHUAET4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTHUAET4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270911; x=1781806911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HEb10UrMOCgohlL9Nxhp873UqhXKYVZZ5sEwo42BWsw=;
  b=iTHUAET4QNzU15KipInKDKa553rGd8p4EGv5ueHYEHtVMDJBGVWb9jyb
   0f+AUwD60jIkZnWy1Hh0X/GY6o6skz2X0cFXL5PYANaViVdrNCYYcBI9+
   93Yy0pV59RjM4ec4buLe0pykhrmHjPvgPH4t2P2rCGCOr9UAxesex95B2
   ljR8tWCmfhg2uyQELaySWiA4N1O7lUWXcjia1sXNj2D47V0T1Gu0IqDrm
   dg1Y/Am2QjVh/PycKohb5TLEWxUNqGp1dzcMX1OUkpYS92qdY5o4yxWJp
   mPLxjSRGG+jTFdBLrVXXU3kBfrZAbV2I+WaHLGmP5yRhH+/iv/CBputDH
   g==;
X-CSE-ConnectionGUID: nGL6WccUTluIsoPploYN4A==
X-CSE-MsgGUID: vdU2TrNrS76S5tDix/iXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931537"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:51 -0700
X-CSE-ConnectionGUID: 2qoc+SXgS1igWBhKnpTp2g==
X-CSE-MsgGUID: +fdgV0C1R2CwRkSohE+TnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959878"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:50 -0700
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
Subject: [RFC patch v3 07/20] sched: Add helper function to decide whether to allow cache aware scheduling
Date: Wed, 18 Jun 2025 11:27:55 -0700
Message-Id: <abb433c3345587d068e5381c65e9d0b3f50828d9.1750268218.git.tim.c.chen@linux.intel.com>
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

Cache-aware scheduling is designed to aggregate threads into their
preferred LLC, either via the task wake up path or the load balancing
path. One side effect is that when the preferred LLC is saturated,
more threads will continue to be stacked on it, degrading the workload's
latency. A strategy is needed to prevent this aggregation from going too
far such that the preferred LLC is too overloaded.

Introduce helper function _get_migrate_hint() to implement the LLC
migration policy:

1) A task is aggregated to its preferred LLC if both source/dest LLC
   are not too busy (<50% utilization, tunable), or the preferred
   LLC will not be too out of balanced from the non preferred LLC
   (>20% utilization, tunable, close to imbalance_pct of the LLC
   domain).
2) Allow a task to be moved from the preferred LLC to the
   non-preferred one if the non-preferred LLC will not be too out
   of balanced from the preferred prompting an aggregation task
   migration later.  We are still experimenting with the aggregation
   and migration policy. Some other possibilities are policy based
   on LLC's load or average number of tasks running.  Those could
   be tried out by tweaking _get_migrate_hint().

The function _get_migrate_hint() returns migration suggestions for the upper-level
functions.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/debug.c |   4 ++
 kernel/sched/fair.c  | 110 ++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h |   5 ++
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 56ae54e0ce6a..7271ad1152af 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -532,6 +532,10 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("hot_threshold_ms", 0644, numa, &sysctl_numa_balancing_hot_threshold);
 #endif
 
+#ifdef CONFIG_SCHED_CACHE
+	debugfs_create_u32("llc_aggr_cap", 0644, debugfs_sched, &sysctl_llc_aggr_cap);
+	debugfs_create_u32("llc_aggr_imb", 0644, debugfs_sched, &sysctl_llc_aggr_imb);
+#endif
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
 	debugfs_fair_server_init();
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 02f104414b9a..10ea408d0e40 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8804,7 +8804,39 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 }
 
 #ifdef CONFIG_SCHED_CACHE
-static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
+static long __migrate_degrades_locality(struct task_struct *p,
+					int src_cpu, int dst_cpu,
+					bool idle);
+__read_mostly unsigned int sysctl_llc_aggr_cap       = 50;
+__read_mostly unsigned int sysctl_llc_aggr_imb       = 20;
+
+/*
+ * The margin used when comparing LLC utilization with CPU capacity.
+ * Parameter sysctl_llc_aggr_cap determines the LLC load level where
+ * active LLC aggregation is done.
+ * Derived from fits_capacity().
+ *
+ * (default: ~50%)
+ */
+#define fits_llc_capacity(util, max)	\
+	((util) * 100 < (max) * sysctl_llc_aggr_cap)
+
+/*
+ * The margin used when comparing utilization.
+ * is 'util1' noticeably greater than 'util2'
+ * Derived from capacity_greater().
+ * Bias is in perentage.
+ */
+/* Allows dst util to be bigger than src util by up to bias percent */
+#define util_greater(util1, util2) \
+	((util1) * 100 > (util2) * (100 + sysctl_llc_aggr_imb))
+
+enum llc_mig_hint {
+	mig_allow = 0,
+	mig_ignore,
+	mig_forbid
+};
+
 
 /* expected to be protected by rcu_read_lock() */
 static bool get_llc_stats(int cpu, unsigned long *util,
@@ -8822,6 +8854,82 @@ static bool get_llc_stats(int cpu, unsigned long *util,
 	return true;
 }
 
+static enum llc_mig_hint _get_migrate_hint(int src_cpu, int dst_cpu,
+					   unsigned long tsk_util,
+					   bool to_pref)
+{
+	unsigned long src_util, dst_util, src_cap, dst_cap;
+
+	if (cpus_share_cache(src_cpu, dst_cpu))
+		return mig_allow;
+
+	if (!get_llc_stats(src_cpu, &src_util, &src_cap) ||
+	    !get_llc_stats(dst_cpu, &dst_util, &dst_cap))
+		return mig_allow;
+
+	if (!fits_llc_capacity(dst_util, dst_cap) &&
+	    !fits_llc_capacity(src_util, src_cap))
+		return mig_ignore;
+
+	src_util = src_util < tsk_util ? 0 : src_util - tsk_util;
+	dst_util = dst_util + tsk_util;
+	if (to_pref) {
+		/*
+		 * sysctl_llc_aggr_imb is the imbalance allowed between
+		 * preferred LLC and non-preferred LLC.
+		 * Don't migrate if we will get preferred LLC too
+		 * heavily loaded and if the dest is much busier
+		 * than the src, in which case migration will
+		 * increase the imbalance too much.
+		 */
+		if (!fits_llc_capacity(dst_util, dst_cap) &&
+		    util_greater(dst_util, src_util))
+			return mig_forbid;
+	} else {
+		/*
+		 * Don't migrate if we will leave preferred LLC
+		 * too idle, or if this migration leads to the
+		 * non-preferred LLC falls within sysctl_aggr_imb percent
+		 * of preferred LLC, leading to migration again
+		 * back to preferred LLC.
+		 */
+		if (fits_llc_capacity(src_util, src_cap) ||
+		    !util_greater(src_util, dst_util))
+			return mig_forbid;
+	}
+	return mig_allow;
+}
+
+/*
+ * Give suggestion when task p is migrated from src_cpu to dst_cpu.
+ */
+static __maybe_unused enum llc_mig_hint get_migrate_hint(int src_cpu, int dst_cpu,
+							 struct task_struct *p)
+{
+	struct mm_struct *mm;
+	int cpu;
+
+	if (cpus_share_cache(src_cpu, dst_cpu))
+		return mig_allow;
+
+	mm = p->mm;
+	if (!mm)
+		return mig_allow;
+
+	cpu = mm->mm_sched_cpu;
+	if (cpu < 0)
+		return mig_allow;
+
+	if (cpus_share_cache(dst_cpu, cpu))
+		return _get_migrate_hint(src_cpu, dst_cpu,
+					 task_util(p), true);
+	else if (cpus_share_cache(src_cpu, cpu))
+		return _get_migrate_hint(src_cpu, dst_cpu,
+					 task_util(p), false);
+	else
+		return mig_allow;
+}
+
 static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 {
 	struct mm_struct *mm = p->mm;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d16ccd66ca07..1c6fd45c7f62 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2818,6 +2818,11 @@ extern unsigned int sysctl_numa_balancing_scan_period_max;
 extern unsigned int sysctl_numa_balancing_scan_size;
 extern unsigned int sysctl_numa_balancing_hot_threshold;
 
+#ifdef CONFIG_SCHED_CACHE
+extern unsigned int sysctl_llc_aggr_cap;
+extern unsigned int sysctl_llc_aggr_imb;
+#endif
+
 #ifdef CONFIG_SCHED_HRTICK
 
 /*
-- 
2.32.0

