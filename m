Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09124DD0F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419853; cv=none; b=o4rBVjSoiG8LgsVYMX/IlQY10/jE34Kk/P9GPEu7AwvlJXC4Li9q9u5uzaN8Xe+GH6mzmGpRrDuYndCTwtNk3+fiV28NRCAkFZOenuWWHxOD6yNheizvoNyl0tIxwFThkzBuBUPcsfmI/cOQ0irCSUY4Ng9muWPbg6IapNECSoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419853; c=relaxed/simple;
	bh=mGk3g1M31GRTi5uDYP8pJrBKo0TW7wSdq0MMUjWhrwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlZ/OpQjScfqil/UGT9umy3hqWmO1752LX9Ae3mNQu9xHGxFSbZyfWJY8g9ExH5MqxCUNSwLPhUo5UPG2aO0OXWbrGSiQhIdDrPCT6jXjEaLCKVEZ67rTy7KnTfMFHU638iTKJUOWiZTbu1yOKowvWQWgsUefxCwLWCAIHSph2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r08EkqhA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r08EkqhA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB589C4CEEB;
	Wed, 28 May 2025 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419851;
	bh=mGk3g1M31GRTi5uDYP8pJrBKo0TW7wSdq0MMUjWhrwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r08EkqhAgoR/uAeiACeBHvkGaMlSZUjnp1+wcs5RcyRfhhdpj5tBazHsRM+dg2RYQ
	 l+bgCtPAV6pMaBk0wnkCIBiRrEzIfEj2UcEbsMePz1FD8Z5s/5AKPkwP6EToNG5fok
	 QupIG9Hdo3uqbxfUTveYW7vyGeaBkHPwlkEsyQD6z95yQsOaQOIGE/CN27CyVJNSfL
	 HyWXqir16OKNILKnjvNEH8Hykfj3D+WUBQL05R7bn0e/kywnMDpCkV60CpA9Qa7z+q
	 VbBl0ebG7iSGZNEr6FVhboM0twJfrhwvM1NVziI8FaUYsLelU2aKRLoCq+NZccbRUC
	 ub9CSRDXbsDnA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 18/43] sched: Clean up and standardize #if/#else/#endif markers in sched/topology.c
Date: Wed, 28 May 2025 10:08:59 +0200
Message-ID: <20250528080924.2273858-19-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

 - Fix whitespace noise and other inconsistencies.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a2a38e1b6f18..4f52b8e56c19 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -328,7 +328,7 @@ static int __init sched_energy_aware_sysctl_init(void)
 }
 
 late_initcall(sched_energy_aware_sysctl_init);
-#endif
+#endif /* CONFIG_PROC_SYSCTL */
 
 static void free_pd(struct perf_domain *pd)
 {
@@ -464,9 +464,9 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 
 	return false;
 }
-#else
+#else /* !(CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL): */
 static void free_pd(struct perf_domain *pd) { }
-#endif /* CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL*/
+#endif /* !(CONFIG_ENERGY_MODEL && CONFIG_CPU_FREQ_GOV_SCHEDUTIL) */
 
 static void free_rootdomain(struct rcu_head *rcu)
 {
@@ -1613,7 +1613,7 @@ static int			sched_domains_curr_level;
 int				sched_max_numa_distance;
 static int			*sched_domains_numa_distance;
 static struct cpumask		***sched_domains_numa_masks;
-#endif
+#endif /* CONFIG_NUMA */
 
 /*
  * SD_flags allowed in topology descriptions.
@@ -1729,7 +1729,7 @@ sd_init(struct sched_domain_topology_level *tl,
 				       SD_WAKE_AFFINE);
 		}
 
-#endif
+#endif /* CONFIG_NUMA */
 	} else {
 		sd->cache_nice_tries = 1;
 	}
-- 
2.45.2

