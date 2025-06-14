Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD54A933
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749862161; cv=none; b=X8CH2PmRxqeT9Zfx61v6nWsX6paVFVQuLeFWc+IGb0L+WVysG6LetB9Y1CpFgB/fXo175TI2yd1OaTwFV3U+lUfyvVFX4WPIR7MFd68rngUQp/RVhdRQGYbZ4B699RkRLqsA5FBX5mbkWY1Dz9LCpu8njhGoM8HQQKjF+N3vJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749862161; c=relaxed/simple;
	bh=VNrYf9YvW7UZjjz7ig1k6OOs4gGEKfV0rDbtjlC1Y/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBxaUsHobD2ULqbaLeZmoYd0DQddTVgMSjgtbmZqVyMVCjEwWYrxwlaG8qDIoMDRHITMc9VzfF5geOBwME12HducZynFzyRKlapA8WKxT2glFUZgASP7GTU/vd0ponS2cMoPHso+PHg3v71NKo8+mdZEaECBQm6Q0fFRKz9TO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibZb/YYQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibZb/YYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D97DC4CEE3;
	Sat, 14 Jun 2025 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749862161;
	bh=VNrYf9YvW7UZjjz7ig1k6OOs4gGEKfV0rDbtjlC1Y/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibZb/YYQ2I8sJrO6RfU8yW0hSCvj0JczXe+KX6ag0v8akgb68AKeX1xsCBchwMT/A
	 Xi6jYspYftRz6WG1z0BcFpT//fexwlaYsugkpJbxoI5KXocckSseeenn45xwqd38Ak
	 rYK0Y/+MT+ajFzIS5PzXW1xj5Z0ur88Q5Cl1Hg70Mx5hk24LQp+bdQDwKt1+6yrPJD
	 pyK1zw1/ZOLYSK9QWtWsGOyUh9GKJXFljDPBlpD/wmRUiLVq1gSkqEPFk8q1b+c9sM
	 N3v5kFdMvCWXtW9SHZLFQ42s5DEVMGyIsnUZprapL9GJHCbjoKc/Nwck4B6/BsL/Rp
	 p9C3WbxMhYhlQ==
Date: Fri, 13 Jun 2025 14:49:20 -1000
From: Tejun Heo <tj@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: linux-kernel@vger.kernel.org, void@manifault.com, arighi@nvidia.com,
	changwoo@igalia.com, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 3/4] sched_ext: Clean up and standardize #if/#else/#endif
 markers in sched/ext_idle.c
Message-ID: <aEzHEFgNfQFiDafq@slm.duckdns.org>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
 <20250611135404.13851-4-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611135404.13851-4-yphbchou0911@gmail.com>

The following is the updated version that got applied to sched_ext/for-6.17.

Thanks.
------ 8< ------
From 8834ace4a86db0a85cb003c2efd98e6a4389243c Mon Sep 17 00:00:00 2001
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
Date: Wed, 11 Jun 2025 21:54:03 +0800
Subject: [PATCH] sched_ext: Always use SMP versions in kernel/sched/ext_idle.c

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

tj: Updated subject for clarity. Fixed stray #else block which wasn't
    removed causing build failure.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/sched/ext_idle.c | 35 +----------------------------------
 1 file changed, 1 insertion(+), 34 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 17802693e304..b79cbdb7999a 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -17,7 +17,6 @@ static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_enabled);
 /* Enable/disable per-node idle cpumasks */
 static DEFINE_STATIC_KEY_FALSE(scx_builtin_idle_per_node);
 
-#ifdef CONFIG_SMP
 /* Enable/disable LLC aware optimizations */
 static DEFINE_STATIC_KEY_FALSE(scx_selcpu_topo_llc);
 
@@ -794,17 +793,6 @@ static void reset_idle_masks(struct sched_ext_ops *ops)
 		cpumask_and(idle_cpumask(node)->smt, cpu_online_mask, node_mask);
 	}
 }
-#else	/* !CONFIG_SMP */
-static bool scx_idle_test_and_clear_cpu(int cpu)
-{
-	return -EBUSY;
-}
-
-static s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
-{
-	return -EBUSY;
-}
-#endif	/* CONFIG_SMP */
 
 void scx_idle_enable(struct sched_ext_ops *ops)
 {
@@ -818,9 +806,7 @@ void scx_idle_enable(struct sched_ext_ops *ops)
 	else
 		static_branch_disable_cpuslocked(&scx_builtin_idle_per_node);
 
-#ifdef CONFIG_SMP
 	reset_idle_masks(ops);
-#endif
 }
 
 void scx_idle_disable(void)
@@ -906,7 +892,6 @@ static s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_f
 	if (!rq)
 		lockdep_assert_held(&p->pi_lock);
 
-#ifdef CONFIG_SMP
 	/*
 	 * This may also be called from ops.enqueue(), so we need to handle
 	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
@@ -923,9 +908,7 @@ static s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_f
 		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags,
 					 allowed ?: p->cpus_ptr, flags);
 	}
-#else
-	cpu = -EBUSY;
-#endif
+
 	if (scx_kf_allowed_if_unlocked())
 		task_rq_unlock(rq, p, &rf);
 
@@ -1016,11 +999,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask_node(int node)
 	if (node < 0)
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	return idle_cpumask(node)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1040,11 +1019,7 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_cpumask(void)
 	if (!check_builtin_idle_enabled())
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	return idle_cpumask(NUMA_NO_NODE)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1063,14 +1038,10 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask_node(int node)
 	if (node < 0)
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	if (sched_smt_active())
 		return idle_cpumask(node)->smt;
 	else
 		return idle_cpumask(node)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
@@ -1091,14 +1062,10 @@ __bpf_kfunc const struct cpumask *scx_bpf_get_idle_smtmask(void)
 	if (!check_builtin_idle_enabled())
 		return cpu_none_mask;
 
-#ifdef CONFIG_SMP
 	if (sched_smt_active())
 		return idle_cpumask(NUMA_NO_NODE)->smt;
 	else
 		return idle_cpumask(NUMA_NO_NODE)->cpu;
-#else
-	return cpu_none_mask;
-#endif
 }
 
 /**
-- 
2.49.0

