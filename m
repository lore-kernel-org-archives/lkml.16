Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B622D8DB6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432999; cv=none; b=sAcJ0MGCK66GIMOgjmxUwjgQ1KjA8MME9F/Rc2EDqTKI+Q2uYCPjFlrBMtVzDTmUlnWvtu4sFZ4qhsJiqcJTm0Yxja0ka+12SLgrbzCgF7IedPKUyK+4Cnr35bynvEyz7Jub12E+mtOC6QJxXpKRzeBy69FzU/zWqe+MtoiJBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432999; c=relaxed/simple;
	bh=7JBz2aGfpObfMrYEMzZRqb7NgZBg573bIt1x2XUn3Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvzKEx+jpxsdA8iYkVc5ebE+r/+vE3p8ZdPYLhhV9Tm8qDZai0vQfr80Cq6wgBNImSXbXdNyphyVeWcEzmVEvLEQYIBn2ai0ufPEQ58QFfbWXru02xZXiXigJ0DH3C9y5PUQ1zMo+jtvMDw8iSRupjtCtG7ufeTPJO3ffCLAt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2BAbYZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2BAbYZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488FEC4CEEF;
	Fri, 20 Jun 2025 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750432999;
	bh=7JBz2aGfpObfMrYEMzZRqb7NgZBg573bIt1x2XUn3Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M2BAbYZ+woLX7eXdidaqzDYNeHK2WbEUcsFC/bx8fkT3GOEQv2trb/iiQLtvO/CfO
	 kXhZTJ/kv0r+/QN6Ju0HO2PHjVkVwO8iH+dqcDHUHUoSVyU18Aa3mkMKsmfdiBN5W5
	 Oyi7fhxvqwFDmY/8zQN/aGIsqLMCOTGrdHAL7fiiVIz1FVdqVDJgFAybnN2Xhxcwcm
	 kxXM3D9IGHJgNMbx+r7o/2rHJILF5ObsQiPY8U70LY+xh+pQIj6RrC3GRxCyt1aCXB
	 rNMAO7/22bYqfcP1TngPM3jLtb82T5POkro6RKPq4A4+zpPVejgL6gnaqXAhVyV8Yz
	 8bkK1yxpMdrLQ==
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
Subject: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu rwsem
Date: Fri, 20 Jun 2025 17:22:43 +0200
Message-ID: <20250620152308.27492-3-frederic@kernel.org>
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

The HK_TYPE_DOMAIN isolation cpumask, and further the
HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
future.

The affected subsystems will need to synchronize against those cpumask
changes so that:

* The reader get a coherent snapshot
* The housekeeping subsystem can safely propagate a cpumask update to
  the susbsytems after it has been published.

Protect against readsides that can sleep with per-cpu rwsem. Updates are
expected to be very rare given that CPU isolation is a niche usecase and
related cpuset setup happen only in preparation work. On the other hand
read sides can occur in more frequent paths.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched/isolation.h |  7 +++++++
 kernel/sched/isolation.c        | 12 ++++++++++++
 kernel/sched/sched.h            |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index f98ba0d71c52..8de4f625a5c1 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -41,6 +41,9 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
 		return true;
 }
 
+extern void housekeeping_lock(void);
+extern void housekeeping_unlock(void);
+
 extern void __init housekeeping_init(void);
 
 #else
@@ -73,6 +76,8 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
 	return true;
 }
 
+static inline void housekeeping_lock(void) { }
+static inline void housekeeping_unlock(void) { }
 static inline void housekeeping_init(void) { }
 #endif /* CONFIG_CPU_ISOLATION */
 
@@ -84,4 +89,6 @@ static inline bool cpu_is_isolated(int cpu)
 	       cpuset_cpu_is_isolated(cpu);
 }
 
+DEFINE_LOCK_GUARD_0(housekeeping, housekeeping_lock(), housekeeping_unlock())
+
 #endif /* _LINUX_SCHED_ISOLATION_H */
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 83cec3853864..8c02eeccea3b 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -18,12 +18,24 @@ static cpumask_var_t housekeeping_cpumasks[HK_TYPE_MAX];
 unsigned long housekeeping_flags;
 EXPORT_SYMBOL_GPL(housekeeping_flags);
 
+DEFINE_STATIC_PERCPU_RWSEM(housekeeping_pcpu_lock);
+
 bool housekeeping_enabled(enum hk_type type)
 {
 	return !!(housekeeping_flags & BIT(type));
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
+void housekeeping_lock(void)
+{
+	percpu_down_read(&housekeeping_pcpu_lock);
+}
+
+void housekeeping_unlock(void)
+{
+	percpu_up_read(&housekeeping_pcpu_lock);
+}
+
 int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..0cdb560ef2f3 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -46,6 +46,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex_api.h>
+#include <linux/percpu-rwsem.h>
 #include <linux/plist.h>
 #include <linux/poll.h>
 #include <linux/proc_fs.h>
-- 
2.48.1

