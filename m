Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0472228CF62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430406; cv=none; b=jCP4ApcaFxEqMYfBTij+0AjmzNyFvZk74DloyFTyBfCTbGCEVYEhOYf4/vh+YxIKCkYTKqUqXOIn2mFcto1dmytxvfWGThmx6h2YHMGldHp1jUg0ZHvsU2rWVhxiI14w21zKg46yLNDQ99BYHkIhi+xZGD8Ct3TmO7F552zvpWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430406; c=relaxed/simple;
	bh=2jPly3FVpCxyxtRqF2P47uA2Q0rD0u7EVgELLpZR3f0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=vA84hCeEmHkK8RTztcaAtWtsLLZ6SGAyPjbYDBGlKJUCwnG4foakeXdnVSo+miQiQp2iyuMmJwUOdRcfGBIsnkKOTNC3lT2GrUBUFc8It8FNsJsAz+91cPRKC+3AxAF1iGiWwcL3ttwqnqwo9xpqOdIKjH6+NyhJViCBHqa/AKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GTdmQNG4; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GTdmQNG4"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7c5b9333642so11040485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745430404; x=1746035204; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XnD+wEIsxowSWmDfKsckRsLLvdHSiUVLDRMPitX8isg=;
        b=GTdmQNG4yPdPolA6EzZmqlTtA+QsMTHsmIljs3AVEgQTjXLsp4HldKP08MYGDa96nj
         iCnFmmN3VVqrg2yr9lMCGgk5lnJ76V3UfJXFVjtLhDsAelPqhl1eZzkBKmEpKVccsccQ
         1Iv4Qr1x2Bvecnfw+UdEObxRbwe+OFmZuFnxZ7gvAkoJy1m98cNQ/Z3XL+IHyWvCYXOV
         3E4Rejdvg+9qphsTkFiQ7g6BY2ENEuM7SAxvyxTd5yikzpA3bhoXyIeMrNPnnUrPCOrn
         hZw5riAPGqnPBCgFH4C9HudyvhpJUdwqKbTMgZTGG0iQ4GupnVwoweBr3P2upEWnT6D/
         +w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430404; x=1746035204;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnD+wEIsxowSWmDfKsckRsLLvdHSiUVLDRMPitX8isg=;
        b=eZqw/O3cgKx/VFTDsNnTLYTd2lKf60F/lYfFru0jjc4QjOwCRPwB65CBG1EpmJB2Rp
         RJpSVUgVaG1gT5bkaCInL0M1fcER/LOnq+bN7MFFem8sEpSR1ax3AXzhh4RFnVBRLJNM
         RcMDvsLUZQwGcdqNhws81ZZXq0pjjF+MMzEzWvX1PUMsCC6eXFd6Ykmi74Ewtcg0Dj+N
         VqGa8R2C2HgYMs64m3Yn7NtMsT5ANFMi6+5UJm+LRFdaWY1BbYh77KryXgbpGCT2uBuE
         mCrYeMoJNMFeyaVbEMrIJA2hNK/FPXmiaSe8nSIiqgUav8QVm9124H7g16nqF2xwK0U4
         b8kA==
X-Gm-Message-State: AOJu0YzJ/Io1cJrVE+elDq1Irp82QPOqblzK6j7cECgbUuhTStXGqnTg
	qpIh+18wgNNz7atOMm8kYIkcroZC0daTA1stxl6kgpjr3Ecsq8PGxKLDBD1ogDw4hUxdTcVXJVc
	5FjO3nV/fng==
X-Google-Smtp-Source: AGHT+IEQNx5dOhAQFf0Q4E4wZiVpSwF2UVefMvGwf8ol5Um3XfRmP9E1bK0OGNw4nheOclNWsSRZY/gX9wIqsw==
X-Received: from qknpz18.prod.google.com ([2002:a05:620a:6412:b0:7c5:4c67:599f])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4544:b0:7c5:e2a0:4e64 with SMTP id af79cd13be357-7c9280494fdmr3380162685a.51.1745430403710;
 Wed, 23 Apr 2025 10:46:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:46:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423174634.3009657-1-edumazet@google.com>
Subject: [PATCH] sched/fair: reduce false sharing on sched_balance_running
From: Eric Dumazet <edumazet@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"

rebalance_domains() can attempt to change sched_balance_running
more than 350,000 times per second on our servers.

If sched_clock_irqtime and sched_balance_running share the
same cache line, we see a very high cost on hosts with 480 threads
dealing with many interrupts.

This patch only acquires sched_balance_running when sd->last_balance
is old enough.

It also moves sched_balance_running into a dedicated cache line on SMP.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Yafang Shao <laoar.shao@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Josh Don <joshdon@google.com>
---
 kernel/sched/fair.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e5807eaffcacaf761c289e8adb354cfd..460008d0dc459b3ca60209565e89c419ea32a4e2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12144,7 +12144,7 @@ static int active_load_balance_cpu_stop(void *data)
  *   execution, as non-SD_SERIALIZE domains will still be
  *   load-balanced in parallel.
  */
-static atomic_t sched_balance_running = ATOMIC_INIT(0);
+static __cacheline_aligned_in_smp atomic_t sched_balance_running = ATOMIC_INIT(0);
 
 /*
  * Scale the max sched_balance_rq interval with the number of CPUs in the system.
@@ -12220,25 +12220,25 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 		interval = get_sd_balance_interval(sd, busy);
 
+		if (!time_after_eq(jiffies, sd->last_balance + interval))
+			goto out;
+
 		need_serialize = sd->flags & SD_SERIALIZE;
 		if (need_serialize) {
 			if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
 				goto out;
 		}
-
-		if (time_after_eq(jiffies, sd->last_balance + interval)) {
-			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
-				/*
-				 * The LBF_DST_PINNED logic could have changed
-				 * env->dst_cpu, so we can't know our idle
-				 * state even if we migrated tasks. Update it.
-				 */
-				idle = idle_cpu(cpu);
-				busy = !idle && !sched_idle_cpu(cpu);
-			}
-			sd->last_balance = jiffies;
-			interval = get_sd_balance_interval(sd, busy);
+		if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
+			/*
+			 * The LBF_DST_PINNED logic could have changed
+			 * env->dst_cpu, so we can't know our idle
+			 * state even if we migrated tasks. Update it.
+			 */
+			idle = idle_cpu(cpu);
+			busy = !idle && !sched_idle_cpu(cpu);
 		}
+		sd->last_balance = jiffies;
+		interval = get_sd_balance_interval(sd, busy);
 		if (need_serialize)
 			atomic_set_release(&sched_balance_running, 0);
 out:
-- 
2.49.0.805.g082f7c87e0-goog

