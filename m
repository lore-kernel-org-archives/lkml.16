Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35681F4C83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125081; cv=none; b=cUL5NgZgu/hQWir7x6BFHCX+lmWKRX9wmgjkAJI1tYKbm5azl/ZtnG8LTkkXFRPnRp9kIwSQy7wLMvXqOwxcOTLykbttiyLng8C23YJYFtVdC99Io+wpzDOFwI8GcRmexAWex6oqQSmx1KNPVK4yIwCLPHX2gM9sawigKIkPFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125081; c=relaxed/simple;
	bh=4CJ9hOqoui4JlCN+zuVRP7AhnJyH4wdZ69h4hStuBWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZybspPcDK0WnA6UF4mkBVucAU7Pm07GNd/54P92QkvfzdVTHopd4wT4kYMsjWiZnykJvVFds+22gSZLcsJA77JPlJXsZobBoLCiuTWYmStmZiJ2D8eVLKmCX4CwlcmLf/XP8nuk8edoXYE4mSBRbCT18ZqnMy13HrEr/GhmMJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoHZT95p; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoHZT95p"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e09f57ed4so18672205ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749125079; x=1749729879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY+1+u4tI5f3R2HsjbASLO23onNPIfvm4SbCLPrNoYs=;
        b=HoHZT95pYlx7tiPho2LqH1l239lKdBNigAe2juON/5rR8gB2iYadeSZn3Kggat5xIo
         /nfq/CGrutXgUuwpXRB83l9ofOx2V1NkvUmzC0wdlMq/NNpk8lowAU+lGdkxNCQVWN+l
         T5f0aJv7L4ellJ7xEYJk/W2slDjieUHFejG71BGyGIm4I27XOuvMOOzyM4NkMoV6r9j+
         aEHBYbenciBAjED2qBjLZgVXxBZQUaJiPNwCZEGr2pEGgAx0/g2cxrULRrggAwC72iMK
         o4Z5w/0y/K3BgRxC7xD7MKtMOTnfmHbjgQ+tURMJlAoh9jQk454GOBIWkmjoyiLem6ka
         aZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125079; x=1749729879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY+1+u4tI5f3R2HsjbASLO23onNPIfvm4SbCLPrNoYs=;
        b=iGyieXC7QjO47Goeice2oCLMCkB0QiHos9LYKqlUnPlt2m7qmc6JYSpNbGYYMKkLxS
         yUR4FlWGSv076tvs9Dow9j2auKmzNNuov2p3HKDEzIxc3AHQw0ZDI5EWUehK19FhQL/B
         2pvt7JYNdrl+tQSgwuZnuB7qDTTxOJNgTALkkxFqlBPeLssAPwdCcXL//dtZDKM46EIp
         UKHePRekrh9pwDgos8uGJKKranDKwIUHVA5stp1tWjFlwNh0m+3hQTsuga1XGy8NNOL6
         v3qixhnJG7Yh4lufAuKnEgIVShUSim2SAkecdL4XeyRHnTgm4Q52LmUkVyqBb1wwEmRq
         70sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhZxo/FeIRjcPd9U5xEXANfdR54u5BNgQ9gmXCUGwMGcnAflXDvx1T/vnvHU0Ck+CAaAn5SY0e2WQjZQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YySPvTn3PSW9kbSD2O66xWDJhJSJFyv4CYu/pubxWvPacwFmlb7
	7DvZS3xdRsD1LKQMtKqlfQMo1+4kf543v+orF6lAde1MaqWJFvP2PGDw
X-Gm-Gg: ASbGnctFDzVlEKaKmkgYN386nTb/9oBy4jAOBnn5NjZ+fSrjl9bo24q+GpdkX4ZtJIk
	v0cPtyQPy9WlAYCbnlyBtCy+MnUWyIbRe2FgknCAxC9TLZsL94fH/TaYLC/9CEiWqcp3+bAhySw
	BLVZuLWGyQgJ678dInU8WIjmDrXaCAjgiBQ72+PVVcRvRbefynvF6OMupUJirjtKrHAOlsicONe
	uAGqKbqvmcmah2ckBFCR3nKla/0RrmtMaIv1zmzGw8z/QYZcZ9wY4QyachKG2xUpkBNOr843IyQ
	Q6xHZcZVZPsTjInQZiohAUhuNNBGYkOU5XknD7lTXxs3WaVCx60=
X-Google-Smtp-Source: AGHT+IGkCSxgiSEGG4/X9kDUi9rfiJiddOaEIcYLN5aTyS3UAJMkveKy2sUWuVkQGnBZ047P6kOM1A==
X-Received: by 2002:a17:903:19f0:b0:234:986c:66cf with SMTP id d9443c01a7336-235f166ccb4mr51021815ad.16.1749125079050;
        Thu, 05 Jun 2025 05:04:39 -0700 (PDT)
Received: from jemmy.. ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bf330dsm118673755ad.105.2025.06.05.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:04:38 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Jemmy Wong <jemmywong512@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guitcct <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] sched/topology: Add lock guard support
Date: Thu,  5 Jun 2025 20:04:24 +0800
Message-ID: <20250605120424.14756-2-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605120424.14756-1-jemmywong512@gmail.com>
References: <20250605120424.14756-1-jemmywong512@gmail.com>
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
 include/linux/sched.h   |  11 ++--
 kernel/sched/core.c     |   6 +--
 kernel/sched/debug.c    |  13 ++---
 kernel/sched/rt.c       |  35 ++++++------
 kernel/sched/topology.c | 115 +++++++++++++++++-----------------------
 5 files changed, 81 insertions(+), 99 deletions(-)

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
index e40422c37033..3533b471b015 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2920,36 +2920,37 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
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
 
 	if (!ret && write) {
-		ret = sched_rt_global_validate();
-		if (ret)
-			goto undo;
+		do {
+			ret = sched_rt_global_validate();
+			if (ret)
+				break;
 
-		ret = sched_dl_global_validate();
-		if (ret)
-			goto undo;
+			ret = sched_dl_global_validate();
+			if (ret)
+				break;
 
-		ret = sched_rt_global_constraints();
-		if (ret)
-			goto undo;
+			ret = sched_rt_global_constraints();
+			if (ret)
+				break;
 
-		sched_rt_do_global();
-		sched_dl_do_global();
+			sched_rt_do_global();
+			sched_dl_do_global();
+		} while (0);
 	}
-	if (0) {
-undo:
+
+	if (ret) {
 		sysctl_sched_rt_period = old_period;
 		sysctl_sched_rt_runtime = old_runtime;
 	}
-	sched_domains_mutex_unlock();
-	mutex_unlock(&mutex);
 
 	return ret;
 }
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b958fe48e020..3f89f969666c 100644
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
@@ -2688,10 +2673,9 @@ static void detach_destroy_domains(const struct cpumask *cpu_map)
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
-	rcu_read_lock();
+	guard(rcu)();
 	for_each_cpu(i, cpu_map)
 		cpu_attach_domain(NULL, &def_root_domain, i);
-	rcu_read_unlock();
 }
 
 /* handle null as "default" */
@@ -2836,7 +2820,6 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
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

