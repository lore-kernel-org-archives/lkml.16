Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A87320F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063060; cv=none; b=OaftlFHRxhSth0DU0c/8ocSwsVVSzwPgVNwRmTp+YjcGKaGbIiBLz44/yvvzSPCvEvBsuwD536+4aQ79/fhuSFRbrOdTs46Yib44TFfJ3fOrUbFB0QTz+Cvh7bA5f94AxgJRHAT84z5ugPlikrvhYJCVDPcOtL/fvWtfW2FMz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063060; c=relaxed/simple;
	bh=FxPkVXPgmjGPX6M0guImr8r/PrOJnAKi/VjijeqzxK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfaTOA+AU06az3anUl8I5rzIim6eIvy0z32q6v05AiaPrrTzTB2PPOBFUwRiugYhhY5Jyiha0LWWfoGSPkFuwCSTuilVVENPH1UYZeZ2oW9YnMfjsfFMbQBco7pfJOSNbuzTmWvQQsDgUQX3XvgrYtBOK9SDvP9sXxcs+4JQXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGJKwHyx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGJKwHyx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2f11866376so101102a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749063058; x=1749667858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egcueUDPmQ4zjH2fFZe1A8zgRhiKrtWJVJwb4Ssp4ZA=;
        b=bGJKwHyx0khcUVFgF6a12pHvQo9bq42oFiccAn5DHYmDT3UdPwAck0XXEl/VrXqziP
         eqgGaLqtK8cARSmKKVtvjy4wEDBn98Q0Urt9i6Alo2AVaYLFydCNxwmg3Rpqet8+sNAm
         WJ5cA0k0mTa6+TIeSZbQiv4Jz2BhTTGqi3isOd146FY8hHhzDTNVR9ZOu1gkwVFcItqQ
         av4E5ZWqlqQzLxykBCFr0CQpTyWfxpgGbQW0ImMmIuguRwbYGnj3CFvrPe4InlAMSJkg
         jFLUk7lRLrSYchgnjIHu4Cho+2NvBUByAqtIosOvDPMbC9tm+c4qWjMxVlwiZJh/1p2r
         O01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749063058; x=1749667858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egcueUDPmQ4zjH2fFZe1A8zgRhiKrtWJVJwb4Ssp4ZA=;
        b=lsbFtMfGP0aiEDUyxXNn66vMTTOipqCglejqsnModeLh9R4Fb1MnaWqnTEbBGhERui
         R2NdZ5FVZnySl2pLrqYWdBbcHxtVgYHkfUjYnS9QJM7MmOB0LYz+ajHJxDW8TngWqvNZ
         okrnwrEWI4oTg4cJQwKhbEJPPM6qp5UU7G8QeqolMaok4kIRHBixs8RiV9v1dJN+imLc
         FaD8SfafKmm/4/Xmil3+wJ/stSOKpaUM6FfbN9tMLzTIgxfzg7bDXvCAEybhsXZfmr39
         z6jSN24R8r2seVfRNB15JMuchClktV6UlqfX67wH0I7WVt+S69Y+8yGE31CWDRjE3++T
         JZig==
X-Gm-Message-State: AOJu0YzIOhIc0gwTtdvO8My9PHVAz8jRp5MweS7maaJ1+4PG/H5wIvSI
	aC+DS/CPne/Ta9YADhrX6CnoDNoEI4aOqmzEw9wJjXRHLjNQj/6J5X0g
X-Gm-Gg: ASbGnct07IN2bJzzsPt+xfrWWJ+6PVkQUpBcUmux0MjlMfTyD3zj7iYFMISnZ0rs9jV
	SUuSLR/ImbVE+Jn1bHYMX4r+jUBp3VWTX53n8lUXj0pBloNvNgj3bdz0RdzdLShdZdXSZlUNRlF
	caB9t3yaqqAqSfEdXeDyP1dxlJl9RUlkIaEnh9mRPq73naKvNnChqCMFDhprjIA7ASRiLBSurYD
	jokhGC9VDjyRV9lZpauFcxf8f3zL8XrLIv9s+2od1bh5x9+8fPneZIJeRd2Qzmh9gGPyl3zlcCw
	ureYYThZQwalyRIbCi1sMuOw2g3oxktyqdOrBzzcmEIS7o8VJ9K1deSrxnTusg==
X-Google-Smtp-Source: AGHT+IEvsdhglh36/fa2ngtlROJeX6iEZRRjp+xKoB9eJqGym9rRo23ncA7mw9aW9Wjpd4+UW9DYaQ==
X-Received: by 2002:a05:6a21:7a8c:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-21d22bc3d91mr6655895637.41.1749063057758;
        Wed, 04 Jun 2025 11:50:57 -0700 (PDT)
Received: from jemmy.. ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab7a6sm11499194b3a.45.2025.06.04.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 11:50:57 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	jemmywong512@gmail.com
Subject: [PATCH v0] sched/topology: Add lock guard support
Date: Thu,  5 Jun 2025 02:50:49 +0800
Message-ID: <20250604185049.374165-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change replaces manual lock acquisition and release with lock guards 
to improve code robustness and reduce the risk of lock mismanagement. 
No functional changes to the scheduler topology logic are introduced.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

---
 include/linux/sched.h   |  11 +--
 kernel/sched/core.c     |   6 +-
 kernel/sched/debug.c    |  28 ++++---
 kernel/sched/rt.c       |  46 ++++++------
 kernel/sched/topology.c | 162 +++++++++++++++++++---------------------
 5 files changed, 120 insertions(+), 133 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64beb52..10a9d6083b72 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -46,6 +46,7 @@
 #include <linux/rv.h>
 #include <linux/uidgid_types.h>
 #include <linux/tracepoint-defs.h>
+#include <linux/mutex.h>
 #include <asm/kmap_size.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
@@ -395,14 +396,14 @@ enum uclamp_id {
 	UCLAMP_CNT
 };
 
+extern struct mutex sched_domains_mutex;
 #ifdef CONFIG_SMP
 extern struct root_domain def_root_domain;
-extern struct mutex sched_domains_mutex;
-extern void sched_domains_mutex_lock(void);
-extern void sched_domains_mutex_unlock(void);
+DEFINE_LOCK_GUARD_0(sched_domains_mutex,
+	mutex_lock(&sched_domains_mutex),
+	mutex_unlock(&sched_domains_mutex))
 #else
-static inline void sched_domains_mutex_lock(void) { }
-static inline void sched_domains_mutex_unlock(void) { }
+DEFINE_LOCK_GUARD_0(sched_domains_mutex, ,)
 #endif
 
 struct sched_param {
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dce50fa57471..b2b7a0cae95a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8457,9 +8457,9 @@ void __init sched_init_smp(void)
 	 * CPU masks are stable and all blatant races in the below code cannot
 	 * happen.
 	 */
-	sched_domains_mutex_lock();
-	sched_init_domains(cpu_active_mask);
-	sched_domains_mutex_unlock();
+	scoped_guard(sched_domains_mutex) {
+		sched_init_domains(cpu_active_mask);
+	}
 
 	/* Move init over to a non-isolated CPU */
 	if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..f56401725ef6 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -294,19 +294,17 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
 	bool orig;
 
 	cpus_read_lock();
-	sched_domains_mutex_lock();
-
-	orig = sched_debug_verbose;
-	result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
-
-	if (sched_debug_verbose && !orig)
-		update_sched_domain_debugfs();
-	else if (!sched_debug_verbose && orig) {
-		debugfs_remove(sd_dentry);
-		sd_dentry = NULL;
+	scoped_guard(sched_domains_mutex) {
+		orig = sched_debug_verbose;
+		result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
+
+		if (sched_debug_verbose && !orig)
+			update_sched_domain_debugfs();
+		else if (!sched_debug_verbose && orig) {
+			debugfs_remove(sd_dentry);
+			sd_dentry = NULL;
+		}
 	}
-
-	sched_domains_mutex_unlock();
 	cpus_read_unlock();
 
 	return result;
@@ -517,9 +515,9 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
 	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
 
-	sched_domains_mutex_lock();
-	update_sched_domain_debugfs();
-	sched_domains_mutex_unlock();
+	scoped_guard(sched_domains_mutex) {
+		update_sched_domain_debugfs();
+	}
 #endif
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..3f6f181de387 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2920,36 +2920,36 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
 	static DEFINE_MUTEX(mutex);
 	int ret;
 
-	mutex_lock(&mutex);
-	sched_domains_mutex_lock();
-	old_period = sysctl_sched_rt_period;
-	old_runtime = sysctl_sched_rt_runtime;
+	guard(mutex)(&mutex);
 
-	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	scoped_guard(sched_domains_mutex) {
+		old_period = sysctl_sched_rt_period;
+		old_runtime = sysctl_sched_rt_runtime;
 
-	if (!ret && write) {
-		ret = sched_rt_global_validate();
-		if (ret)
-			goto undo;
+		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 
-		ret = sched_dl_global_validate();
-		if (ret)
-			goto undo;
+		if (!ret && write) {
+			ret = sched_rt_global_validate();
+			if (ret)
+				goto undo;
 
-		ret = sched_rt_global_constraints();
-		if (ret)
-			goto undo;
+			ret = sched_dl_global_validate();
+			if (ret)
+				goto undo;
 
-		sched_rt_do_global();
-		sched_dl_do_global();
-	}
-	if (0) {
+			ret = sched_rt_global_constraints();
+			if (ret)
+				goto undo;
+
+			sched_rt_do_global();
+			sched_dl_do_global();
+		}
+		if (0) {
 undo:
-		sysctl_sched_rt_period = old_period;
-		sysctl_sched_rt_runtime = old_runtime;
+			sysctl_sched_rt_period = old_period;
+			sysctl_sched_rt_runtime = old_runtime;
+		}
 	}
-	sched_domains_mutex_unlock();
-	mutex_unlock(&mutex);
 
 	return ret;
 }
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e020..dac1dd5a6eca 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -6,14 +6,6 @@
 #include <linux/bsearch.h>
 
 DEFINE_MUTEX(sched_domains_mutex);
-void sched_domains_mutex_lock(void)
-{
-	mutex_lock(&sched_domains_mutex);
-}
-void sched_domains_mutex_unlock(void)
-{
-	mutex_unlock(&sched_domains_mutex);
-}
 
 /* Protected by sched_domains_mutex: */
 static cpumask_var_t sched_domains_tmpmask;
@@ -470,44 +462,41 @@ static void free_rootdomain(struct rcu_head *rcu)
 void rq_attach_root(struct rq *rq, struct root_domain *rd)
 {
 	struct root_domain *old_rd = NULL;
-	struct rq_flags rf;
 
-	rq_lock_irqsave(rq, &rf);
+	scoped_guard(rq_lock_irqsave, rq) {
+		if (rq->rd) {
+			old_rd = rq->rd;
 
-	if (rq->rd) {
-		old_rd = rq->rd;
+			if (cpumask_test_cpu(rq->cpu, old_rd->online))
+				set_rq_offline(rq);
+
+			cpumask_clear_cpu(rq->cpu, old_rd->span);
+
+			/*
+			 * If we don't want to free the old_rd yet then
+			 * set old_rd to NULL to skip the freeing later
+			 * in this function:
+			 */
+			if (!atomic_dec_and_test(&old_rd->refcount))
+				old_rd = NULL;
+		}
 
-		if (cpumask_test_cpu(rq->cpu, old_rd->online))
-			set_rq_offline(rq);
+		atomic_inc(&rd->refcount);
+		rq->rd = rd;
 
-		cpumask_clear_cpu(rq->cpu, old_rd->span);
+		cpumask_set_cpu(rq->cpu, rd->span);
+		if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
+			set_rq_online(rq);
 
 		/*
-		 * If we don't want to free the old_rd yet then
-		 * set old_rd to NULL to skip the freeing later
-		 * in this function:
+		 * Because the rq is not a task, dl_add_task_root_domain() did not
+		 * move the fair server bw to the rd if it already started.
+		 * Add it now.
 		 */
-		if (!atomic_dec_and_test(&old_rd->refcount))
-			old_rd = NULL;
+		if (rq->fair_server.dl_server)
+			__dl_server_attach_root(&rq->fair_server, rq);
 	}
 
-	atomic_inc(&rd->refcount);
-	rq->rd = rd;
-
-	cpumask_set_cpu(rq->cpu, rd->span);
-	if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
-		set_rq_online(rq);
-
-	/*
-	 * Because the rq is not a task, dl_add_task_root_domain() did not
-	 * move the fair server bw to the rd if it already started.
-	 * Add it now.
-	 */
-	if (rq->fair_server.dl_server)
-		__dl_server_attach_root(&rq->fair_server, rq);
-
-	rq_unlock_irqrestore(rq, &rf);
-
 	if (old_rd)
 		call_rcu(&old_rd->rcu, free_rootdomain);
 }
@@ -1809,18 +1798,17 @@ bool find_numa_distance(int distance)
 	if (distance == node_distance(0, 0))
 		return true;
 
-	rcu_read_lock();
-	distances = rcu_dereference(sched_domains_numa_distance);
-	if (!distances)
-		goto unlock;
-	for (i = 0; i < sched_domains_numa_levels; i++) {
-		if (distances[i] == distance) {
-			found = true;
+	scoped_guard(rcu) {
+		distances = rcu_dereference(sched_domains_numa_distance);
+		if (!distances)
 			break;
+		for (i = 0; i < sched_domains_numa_levels; i++) {
+			if (distances[i] == distance) {
+				found = true;
+				break;
+			}
 		}
 	}
-unlock:
-	rcu_read_unlock();
 
 	return found;
 }
@@ -2134,21 +2122,20 @@ int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
 	int i, j = cpu_to_node(cpu), found = nr_cpu_ids;
 	struct cpumask ***masks;
 
-	rcu_read_lock();
-	masks = rcu_dereference(sched_domains_numa_masks);
-	if (!masks)
-		goto unlock;
-	for (i = 0; i < sched_domains_numa_levels; i++) {
-		if (!masks[i][j])
-			break;
-		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
-		if (cpu < nr_cpu_ids) {
-			found = cpu;
+	scoped_guard(rcu) {
+		masks = rcu_dereference(sched_domains_numa_masks);
+		if (!masks)
 			break;
+		for (i = 0; i < sched_domains_numa_levels; i++) {
+			if (!masks[i][j])
+				break;
+			cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
+			if (cpu < nr_cpu_ids) {
+				found = cpu;
+				break;
+			}
 		}
 	}
-unlock:
-	rcu_read_unlock();
 
 	return found;
 }
@@ -2201,24 +2188,25 @@ int sched_numa_find_nth_cpu(const struct cpumask *cpus, int cpu, int node)
 	if (node == NUMA_NO_NODE)
 		return cpumask_nth_and(cpu, cpus, cpu_online_mask);
 
-	rcu_read_lock();
+	scoped_guard(rcu) {
+		/* CPU-less node entries are uninitialized in sched_domains_numa_masks */
+		node = numa_nearest_node(node, N_CPU);
+		k.node = node;
 
-	/* CPU-less node entries are uninitialized in sched_domains_numa_masks */
-	node = numa_nearest_node(node, N_CPU);
-	k.node = node;
+		k.masks = rcu_dereference(sched_domains_numa_masks);
+		if (!k.masks)
+			break;
 
-	k.masks = rcu_dereference(sched_domains_numa_masks);
-	if (!k.masks)
-		goto unlock;
+		hop_masks = bsearch(&k, k.masks, sched_domains_numa_levels,
+			sizeof(k.masks[0]), hop_cmp);
+		hop = hop_masks	- k.masks;
 
-	hop_masks = bsearch(&k, k.masks, sched_domains_numa_levels, sizeof(k.masks[0]), hop_cmp);
-	hop = hop_masks	- k.masks;
+		ret = hop ?
+			cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node],
+				k.masks[hop-1][node]) :
+			cpumask_nth_and(cpu, cpus, k.masks[0][node]);
+	}
 
-	ret = hop ?
-		cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node], k.masks[hop-1][node]) :
-		cpumask_nth_and(cpu, cpus, k.masks[0][node]);
-unlock:
-	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sched_numa_find_nth_cpu);
@@ -2570,17 +2558,17 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	}
 
 	/* Attach the domains */
-	rcu_read_lock();
-	for_each_cpu(i, cpu_map) {
-		rq = cpu_rq(i);
-		sd = *per_cpu_ptr(d.sd, i);
+	scoped_guard(rcu) {
+		for_each_cpu(i, cpu_map) {
+			rq = cpu_rq(i);
+			sd = *per_cpu_ptr(d.sd, i);
 
-		cpu_attach_domain(sd, d.rd, i);
+			cpu_attach_domain(sd, d.rd, i);
 
-		if (lowest_flag_domain(i, SD_CLUSTER))
-			has_cluster = true;
+			if (lowest_flag_domain(i, SD_CLUSTER))
+				has_cluster = true;
+		}
 	}
-	rcu_read_unlock();
 
 	if (has_asym)
 		static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
@@ -2688,10 +2676,10 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
-	rcu_read_lock();
-	for_each_cpu(i, cpu_map)
-		cpu_attach_domain(NULL, &def_root_domain, i);
-	rcu_read_unlock();
+	scoped_guard(rcu) {
+		for_each_cpu(i, cpu_map)
+			cpu_attach_domain(NULL, &def_root_domain, i);
+	}
 }
 
 /* handle null as "default" */
@@ -2836,7 +2824,7 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],
 			     struct sched_domain_attr *dattr_new)
 {
-	sched_domains_mutex_lock();
-	partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
-	sched_domains_mutex_unlock();
+	scoped_guard(sched_domains_mutex) {
+		partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
+	}
 }
-- 
2.43.0

