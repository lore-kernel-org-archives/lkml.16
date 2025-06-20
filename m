Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026C2DFF25
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433004; cv=none; b=td61xP0fqzh70hWJFJbrCTxOvr7Q6dVEczmr2yvK3RylxthmQRVH1d5mEBBcCjb7HFg/6FI2im8EN/eSEXwyVlBuhbFEPznkj+LmEQtHhri/fmyPwUMz3FlNMAUv6T5R2u8CS8WTiaclJxx964KYxB5JRoDc97e1xiJDXns5gWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433004; c=relaxed/simple;
	bh=LRokWWX9WY4bH5RJ09iKb9EhBlunAS0FLllkbGyEOWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDPnjfir3QaxspmfvWr2JrRpMnN6ha+Q889zWioXtQh4XrzNLOyYMzNdLcUomACHn/MtOTb10S+wAYKgcNh0dmyddNFieUyOrOuVVI/EYwD8phBQ7DF6QkWZ5FENu2UDwfRXE+Zz4aDq76JsACsRRskGuslagmh7bCtg2/ny1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huPgtdS4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huPgtdS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEB8C4AF09;
	Fri, 20 Jun 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433004;
	bh=LRokWWX9WY4bH5RJ09iKb9EhBlunAS0FLllkbGyEOWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huPgtdS4svT8PsLCLa8AjLik66tSOROHDlJ4/5K9PLwUu9fjklyiW3RoTZ1pIKRTv
	 xj8DuiHn1hKxqsiJmA1/fygYu1CRIUxFgU9+aZlyK/0XMDrrGcnW2RtatqUaA1+afa
	 448Ir1Y33Ysc0ux+6fopZFHQwA1OcwgKUbQZ9rSM5FK2iMKMgjYoNrY754mMDGsZS7
	 npUsxOD7plNK/34pG3ezpJELTBv8iVfm0U5sVX9dGuRNseN4vnQiTtFWJv5GdGqbna
	 0Pig3gxi94mgs2tBJAgL1rY0ZykWDSiRFenCUOqXy6FEWb+55Y5yV72Jn4ApfYsB8r
	 WLR4EBhB7FyGg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 04/27] cpu: Protect against concurrent isolated cpuset change
Date: Fri, 20 Jun 2025 17:22:45 +0200
Message-ID: <20250620152308.27492-5-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_cpu_down() is called through work_on_cpu() on a target contained
within the HK_TYPE_DOMAIN cpumask.

But that cpumask will soon also integrate the cpuset isolated
partitions and some synchronization is needed to make sure that
the work_on_cpu() doesn't execute or last on an isolated CPU.

Unfortunately housekeeping_lock() can't be held before the call to
work_on_cpu() because _cpu_down() afterwards holds cpu_hotplug_lock.
This would be a lock inversion:

   cpu_down()                                         cpuset
   ---------                                          ------
   percpu_down_read(&housekeeping_pcpu_lock);         percpu_down_read(&cpu_hotplug_lock);
   percpu_down_write(&cpu_hotplug_lock);              percpu_down_write(&housekeeping_pcpu_lock);

To solve this situation, write-lock the cpu_hotplug_lock around the call
to work_on_cpu(). This will prevent from cpuset to modify the
housekeeping cpumask and therefore synchronize against HK_TYPE_DOMAIN
cpumask changes.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a59e009e0be4..069fce6c7eae 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1398,8 +1398,8 @@ static int cpuhp_down_callbacks(unsigned int cpu, struct cpuhp_cpu_state *st,
 }
 
 /* Requires cpu_add_remove_lock to be held */
-static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
-			   enum cpuhp_state target)
+static int __ref _cpu_down_locked(unsigned int cpu, int tasks_frozen,
+				  enum cpuhp_state target)
 {
 	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 	int prev_state, ret = 0;
@@ -1410,8 +1410,6 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 	if (!cpu_present(cpu))
 		return -EINVAL;
 
-	cpus_write_lock();
-
 	cpuhp_tasks_frozen = tasks_frozen;
 
 	prev_state = cpuhp_set_state(cpu, st, target);
@@ -1427,14 +1425,14 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 		 * return the error code..
 		 */
 		if (ret)
-			goto out;
+			return ret;
 
 		/*
 		 * We might have stopped still in the range of the AP hotplug
 		 * thread. Nothing to do anymore.
 		 */
 		if (st->state > CPUHP_TEARDOWN_CPU)
-			goto out;
+			return ret;
 
 		st->target = target;
 	}
@@ -1452,9 +1450,6 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
 		}
 	}
 
-out:
-	cpus_write_unlock();
-	arch_smt_update();
 	return ret;
 }
 
@@ -1463,16 +1458,17 @@ struct cpu_down_work {
 	enum cpuhp_state	target;
 };
 
-static long __cpu_down_maps_locked(void *arg)
+static long __cpu_down_locked_work(void *arg)
 {
 	struct cpu_down_work *work = arg;
 
-	return _cpu_down(work->cpu, 0, work->target);
+	return _cpu_down_locked(work->cpu, 0, work->target);
 }
 
 static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 {
 	struct cpu_down_work work = { .cpu = cpu, .target = target, };
+	int err;
 
 	/*
 	 * If the platform does not support hotplug, report it explicitly to
@@ -1483,17 +1479,24 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
 	if (cpu_hotplug_disabled)
 		return -EBUSY;
 
+	err = -EBUSY;
+
 	/*
 	 * Ensure that the control task does not run on the to be offlined
 	 * CPU to prevent a deadlock against cfs_b->period_timer.
 	 * Also keep at least one housekeeping cpu onlined to avoid generating
-	 * an empty sched_domain span.
+	 * an empty sched_domain span. Hotplug must be locked already to prevent
+	 * cpusets from concurrently changing the housekeeping mask.
 	 */
+	cpus_write_lock();
 	for_each_cpu_and(cpu, cpu_online_mask, housekeeping_cpumask(HK_TYPE_DOMAIN)) {
 		if (cpu != work.cpu)
-			return work_on_cpu(cpu, __cpu_down_maps_locked, &work);
+			err = work_on_cpu(cpu, __cpu_down_locked_work, &work);
 	}
-	return -EBUSY;
+	cpus_write_unlock();
+	arch_smt_update();
+
+	return err;
 }
 
 static int cpu_down(unsigned int cpu, enum cpuhp_state target)
@@ -1896,6 +1899,19 @@ void __init bringup_nonboot_cpus(unsigned int max_cpus)
 #ifdef CONFIG_PM_SLEEP_SMP
 static cpumask_var_t frozen_cpus;
 
+static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
+			    enum cpuhp_state target)
+{
+	int err;
+
+	cpus_write_lock();
+	err = _cpu_down_locked(cpu, tasks_frozen, target);
+	cpus_write_unlock();
+	arch_smt_update();
+
+	return err;
+}
+
 int freeze_secondary_cpus(int primary)
 {
 	int cpu, error = 0;
-- 
2.48.1

