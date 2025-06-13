Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D22727EC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803842; cv=none; b=PvWxt5Njc5LxE2d5BoyDl7xHV0SRCGFf837A0oVX7yYa7XMhF3dUxpcfLfzE48b+57kP5SwS0h3BJ44TB3QzzQt5T+AVC9/MD5nRxya+SPE9N8N62MEHiRqIVq2QVFH7EU6BvN2ssl+pEDVL/OUJbREfL7xEWasKo9I1eDZIAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803842; c=relaxed/simple;
	bh=SCq+WFpcubtgHrxUVYtidECtUpj93KF00N69HuGkB38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUxIZWMLQipgJnMFykWel4tNaZFRWjSdzBPfMoupTVNNTUO+jEXGUj+iROUGlAzWFf3zJeaJyUXnDQCYgaVvG63S9rREgfWYJUqM0uIld8ssfUVcRFYwr5lrtjCFyFU29YdbyShIHAu9RIyqf5fcZl0y3pVjRQhnavkTy/6XwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isJFSo6N; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isJFSo6N"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363497cc4dso16863175ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803840; x=1750408640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zta+EuR6ah2S3PmOGDWvErS6Zgcf2HwKO4ZMJM7cM8=;
        b=isJFSo6N+z3plgEnSes7pI4bc6yA7lMWHThPVHqChDbyjIRl58v6Qbx5YehomsmETQ
         usykzI3EC7smlP235+U57sADGKHJO90vLLpYUxFfT61+lj91kOdvZCRxzlRkYD777pCt
         ryU8IiqTbVcWSR5luulkxPNLbEisdsDE1ie2vGVChbQVwYwuIxSwKfn7WmSPlIJH6/GZ
         I3o4Dq73DFGRTtsxjqmmnx6nOJQ+FnKZyxrxVo7gjUJlVmRYikVqOITTCGCBSwGD2KSE
         06BOIIzFbUnLCYZbAbsvEuB3qJRObUFihFujzcO/XQr4SjYNOTzIaM2BVq+tVWzyrGe/
         hs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803840; x=1750408640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zta+EuR6ah2S3PmOGDWvErS6Zgcf2HwKO4ZMJM7cM8=;
        b=oJMSQWT7JnmL50lpWaM0E74LK7mdm34SLKy4R1Ogrfm4//Wqzzn/ax2q7ppfVYNpwG
         8zj7fvclKRloihPk1E+M1WrxoE6kLSqe6Q/HpgxsxX2W3nJsyb1EiuSZvyTqJ53/9Dms
         BfGRzNDzRkC3WemSq92DUWSTHYiBB0Qz9MYnqGlERpUPUuiHlTsNQig2ztpoNSl881Ri
         hmCZ1odb7HIK4pONV47V8kTPGpbAiK8t50fwMotbF4lWbABYazAh0inBFFnZvzxizZrj
         dBiiMCjfegm3RcM+YGnzHt6Dt1HJy6VmJuNI/0bI0egEGSTAM7ciMFV+53moPRgOpA7D
         N5iA==
X-Forwarded-Encrypted: i=1; AJvYcCWn18hFZkd8pheAP0ddHkcwwHtraHZUrPEL7boiDhBM3aCBnw+cy13pFHu5oe1d0b7dGyNo6+CXISDVNCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2z2S85RdQ4m7wzPdsBPdxL2RO3NLinclkywA53/bTL5Cx/BO
	bisd9FfhcrrwDH51kravrKurD5d2WYa2LscEE6LJtvDyvoxSo9J+bgws
X-Gm-Gg: ASbGnctm1DRXTxDixO4qCZUtc+1f4AcxMQELUl7BowOYlcPYPAWxbip6RB+oLnOg23X
	prAWU1r/i/SyUDZoSt1zC6TykklVnyezEWFacxLKEqsWE3wBVWvevo4BiwlTrDuYokgjVrnvkHr
	TmHAEBCzJ4UzOAJQaX12TDOCd6EgBFI6idqa2G1HOe6ePON/ylNgRWbY6HmUQfbKyebjKmDKjZi
	rimXqSKl1GW1VIUbMOR7u7ZYrFzudqd0Jlpu0eU/711xRKPNxSa5zzX0oK89w4LURLEZzX+bAwF
	I7vJ0l9GuMi89iiAj1lqhkgpgdqaSiR3i6SVo+03CSkLVUM1WTon1uuPut6PcwHw
X-Google-Smtp-Source: AGHT+IHQ/BrcXje2dJzq7wsSCk3aMGiRHJhIDzBVNo8bVTgPMFXn9S94g5igfTecE7TW71Tf6Uk43g==
X-Received: by 2002:a17:903:1905:b0:231:d0a8:5179 with SMTP id d9443c01a7336-2365d8cb99bmr33131455ad.23.1749803840427;
        Fri, 13 Jun 2025 01:37:20 -0700 (PDT)
Received: from localhost ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782bdsm9410015ad.113.2025.06.13.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:37:19 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	jemmywong512@gmail.com
Subject: [PATCH v2 1/1] sched/topology: Add lock guard support
Date: Fri, 13 Jun 2025 16:37:09 +0800
Message-ID: <20250613083709.19071-2-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613083709.19071-1-jemmywong512@gmail.com>
References: <20250613083709.19071-1-jemmywong512@gmail.com>
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

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

---
 include/linux/sched.h   |   9 ++--
 kernel/sched/core.c     |   2 -
 kernel/sched/debug.c    |  13 ++---
 kernel/sched/rt.c       |  47 +++++++++-------
 kernel/sched/topology.c | 117 ++++++++++++++++++----------------------
 5 files changed, 88 insertions(+), 100 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64beb52..cbc3476eef0e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -46,6 +46,7 @@
 #include <linux/rv.h>
 #include <linux/uidgid_types.h>
 #include <linux/tracepoint-defs.h>
+#include <linux/mutex.h>
 #include <asm/kmap_size.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
@@ -398,11 +399,11 @@ enum uclamp_id {
 #ifdef CONFIG_SMP
 extern struct root_domain def_root_domain;
 extern struct mutex sched_domains_mutex;
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
index dce50fa57471..4a7fc81c0745 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8457,9 +8457,7 @@ void __init sched_init_smp(void)
 	 * CPU masks are stable and all blatant races in the below code cannot
 	 * happen.
 	 */
-	sched_domains_mutex_lock();
 	sched_init_domains(cpu_active_mask);
-	sched_domains_mutex_unlock();
 
 	/* Move init over to a non-isolated CPU */
 	if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..1c00016fd54c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -293,8 +293,8 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
 	ssize_t result;
 	bool orig;
 
-	cpus_read_lock();
-	sched_domains_mutex_lock();
+	guard(cpus_read_lock)();
+	guard(sched_domains_mutex)();
 
 	orig = sched_debug_verbose;
 	result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
@@ -306,9 +306,6 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
 		sd_dentry = NULL;
 	}
 
-	sched_domains_mutex_unlock();
-	cpus_read_unlock();
-
 	return result;
 }
 #else
@@ -517,9 +514,9 @@ static __init int sched_init_debug(void)
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
index e40422c37033..84a6dcb8d49c 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2913,6 +2913,25 @@ static void sched_rt_do_global(void)
 {
 }
 
+static inline int sched_global_validate(void)
+{
+	int ret;
+
+	ret = sched_rt_global_validate();
+	if (ret)
+		return ret;
+
+	ret = sched_dl_global_validate();
+	if (ret)
+		return ret;
+
+	ret = sched_rt_global_constraints();
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int sched_rt_handler(const struct ctl_table *table, int write, void *buffer,
 		size_t *lenp, loff_t *ppos)
 {
@@ -2920,36 +2939,24 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
 	static DEFINE_MUTEX(mutex);
 	int ret;
 
-	mutex_lock(&mutex);
-	sched_domains_mutex_lock();
+	guard(mutex)(&mutex);
+	guard(sched_domains_mutex)();
+
 	old_period = sysctl_sched_rt_period;
 	old_runtime = sysctl_sched_rt_runtime;
 
 	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (ret || !write)
+		return ret;
 
-	if (!ret && write) {
-		ret = sched_rt_global_validate();
-		if (ret)
-			goto undo;
-
-		ret = sched_dl_global_validate();
-		if (ret)
-			goto undo;
-
-		ret = sched_rt_global_constraints();
-		if (ret)
-			goto undo;
-
+	ret = sched_global_validate();
+	if (!ret) {
 		sched_rt_do_global();
 		sched_dl_do_global();
-	}
-	if (0) {
-undo:
+	} else {
 		sysctl_sched_rt_period = old_period;
 		sysctl_sched_rt_runtime = old_runtime;
 	}
-	sched_domains_mutex_unlock();
-	mutex_unlock(&mutex);
 
 	return ret;
 }
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e020..631bb04e5e10 100644
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
 
-		if (cpumask_test_cpu(rq->cpu, old_rd->online))
-			set_rq_offline(rq);
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
 
-		cpumask_clear_cpu(rq->cpu, old_rd->span);
+		atomic_inc(&rd->refcount);
+		rq->rd = rd;
 
+		cpumask_set_cpu(rq->cpu, rd->span);
+		if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
+			set_rq_online(rq);
 		/*
-		 * If we don't want to free the old_rd yet then
-		 * set old_rd to NULL to skip the freeing later
-		 * in this function:
+		 * Because the rq is not a task,
+		 * dl_add_task_root_domain() did not move
+		 * the fair server bw to the rd if it already started.
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
+	guard(rcu)();
+
 	distances = rcu_dereference(sched_domains_numa_distance);
 	if (!distances)
-		goto unlock;
+		return found;
 	for (i = 0; i < sched_domains_numa_levels; i++) {
 		if (distances[i] == distance) {
 			found = true;
 			break;
 		}
 	}
-unlock:
-	rcu_read_unlock();
 
 	return found;
 }
@@ -2131,26 +2119,24 @@ void sched_domains_numa_masks_clear(unsigned int cpu)
  */
 int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
 {
-	int i, j = cpu_to_node(cpu), found = nr_cpu_ids;
+	int i, j = cpu_to_node(cpu);
 	struct cpumask ***masks;
 
-	rcu_read_lock();
+	guard(rcu)();
+
 	masks = rcu_dereference(sched_domains_numa_masks);
 	if (!masks)
-		goto unlock;
+		return nr_cpu_ids;
 	for (i = 0; i < sched_domains_numa_levels; i++) {
 		if (!masks[i][j])
-			break;
+			return nr_cpu_ids;
 		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
 		if (cpu < nr_cpu_ids) {
-			found = cpu;
-			break;
+			return cpu;
 		}
 	}
-unlock:
-	rcu_read_unlock();
 
-	return found;
+	return nr_cpu_ids;
 }
 
 struct __cmp_key {
@@ -2201,7 +2187,7 @@ int sched_numa_find_nth_cpu(const struct cpumask *cpus, int cpu, int node)
 	if (node == NUMA_NO_NODE)
 		return cpumask_nth_and(cpu, cpus, cpu_online_mask);
 
-	rcu_read_lock();
+	guard(rcu)();
 
 	/* CPU-less node entries are uninitialized in sched_domains_numa_masks */
 	node = numa_nearest_node(node, N_CPU);
@@ -2209,7 +2195,7 @@ int sched_numa_find_nth_cpu(const struct cpumask *cpus, int cpu, int node)
 
 	k.masks = rcu_dereference(sched_domains_numa_masks);
 	if (!k.masks)
-		goto unlock;
+		return ret;
 
 	hop_masks = bsearch(&k, k.masks, sched_domains_numa_levels, sizeof(k.masks[0]), hop_cmp);
 	hop = hop_masks	- k.masks;
@@ -2217,8 +2203,7 @@ int sched_numa_find_nth_cpu(const struct cpumask *cpus, int cpu, int node)
 	ret = hop ?
 		cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node], k.masks[hop-1][node]) :
 		cpumask_nth_and(cpu, cpus, k.masks[0][node]);
-unlock:
-	rcu_read_unlock();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sched_numa_find_nth_cpu);
@@ -2570,17 +2555,17 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
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
@@ -2657,6 +2642,8 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 {
 	int err;
 
+	guard(sched_domains_mutex)();
+
 	zalloc_cpumask_var(&sched_domains_tmpmask, GFP_KERNEL);
 	zalloc_cpumask_var(&sched_domains_tmpmask2, GFP_KERNEL);
 	zalloc_cpumask_var(&fallback_doms, GFP_KERNEL);
@@ -2688,10 +2675,9 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
-	rcu_read_lock();
+	guard(rcu)();
 	for_each_cpu(i, cpu_map)
 		cpu_attach_domain(NULL, &def_root_domain, i);
-	rcu_read_unlock();
 }
 
 /* handle null as "default" */
@@ -2836,7 +2822,6 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],
 			     struct sched_domain_attr *dattr_new)
 {
-	sched_domains_mutex_lock();
+	guard(sched_domains_mutex)();
 	partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
-	sched_domains_mutex_unlock();
 }
-- 
2.43.0

