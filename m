Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4C202969
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107668; cv=none; b=IrATxJJB7NexiuKI6UGWu9ATwJIyklTa+MRfsXqBFLof77MQQS8j6QKCL1KCq/AVeYJLFofX8KX+Hy6+fXJuBI907We9UlZ7uRqJqO0dBXENScIMUC4FWf8z9tjVtCI+k3iUtPSBURJXRLIzIbfrGxJGII9C/2GuuAdOCug81bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107668; c=relaxed/simple;
	bh=BymqvX7d+Ux8Jvc4cWzfgCRPYKN6iYt3wLfE8k23f/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul0hl/FmayO5JPZg1HXtm1uUWSqMe6rmTYkVOIsWaOA3wFDdIWqMsFXx1nTriPIet1Omh8ELlHPgccn1fm27nLiENvc6EYoEYQDkIWXRaV8sQhMyes9HZflk4oOxowiShpb/YCpb0mrKb3aBkmMG8u/68sV78ZHzrz+Ws33uJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acWq7oEd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acWq7oEd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso1468315e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107665; x=1749712465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQIxOYf7kXX1kxVhb+VBXZt6NYP23Z7bRj9VUYfQMSU=;
        b=acWq7oEdXRNDWQ8LiXJ0qvAPoRGrOT28jel4ttim7GYNtCLhMd/FMZJ5g8DAJCv2lE
         IEFkB4qrdkgJljqRIy/rVlYyh+PEHUqWAYQVxaWoqK4MiT0xnimF0z1dBej5kGKRMXCU
         5h8A+C3t+ZYJ1j8c7S8QV9k+PLYXZ71vazuGGfrO1GpA1yi5VkQed5Odqfs5INAhEukG
         bjwrzz4hcoE37ATe55Ai9j3zjZxMUDOStxHeke536QMrCf9E2HLJG9rJ4NWGVmSHQPHq
         7qYrV2Ecf7AdyPOBUuTdNDgSFTIMeUaT5iDmpz8kO7nKCM0vFGVFfHDNCIlFZqxPky0L
         qWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107665; x=1749712465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQIxOYf7kXX1kxVhb+VBXZt6NYP23Z7bRj9VUYfQMSU=;
        b=GbljSchmAU1Txy2qN2WHHMO7MeIwYA1OvfVKNTPUifNmMPG7KEsw7SkYoorkaGFE7z
         Hye10/7HKvbtICFkfOkFLbJr+//s2dPJwQxyvdYnHIkQ9+YJYcD4aoaVjVj5Rvn2FFL8
         lhY3b/hjgAKTGbKUWvaecZ3JFsumUjXcqjUR9DhaPdwZtlEbR9MWKOlvpR7R0D5OKOtl
         gD11snRvOaj/9nHm+9B02FPBuRAfZ10MLFos1cur7lbUfT62AGak2AR5f9BhCu/4zJPd
         mX0Hkj8U5NVrGQYCVQ2EQrsG+fCRS19RF8w+bzmiM0T9ENj30Bj7iohl18zOvesm7OG+
         EZng==
X-Gm-Message-State: AOJu0Yw9fBjfHxXSrmgRErOIYC6VuaImTQrgxkqcE2OljPPPHhIrivyB
	CloyoQfbsyDpitEV18ue6RUyotlMIIFXSmBq70WWQ7tLn6zCwghiRlhY
X-Gm-Gg: ASbGnctPJwvOd/fyWyRtTdvS7ys7SD3EStUMVJ+AmnG32uBu8r8/65ypHnFRsXsUnsR
	Xjp4LGGMMAObM5wN3kzLSO529bh5uQYou/jzWLjAHeLO6kbAtuAImY1Ntb+9LfPjpL2YyKTZiym
	OuCfoQOeboq4ljj/x9SHUg8CKV7rL3K+tmZVm6UTGjEzdPMDQXn2qGM5eS87Xk1pDDWLVO80Y4p
	cOVlyG+NEAqAoiYvlSeKq7O4BafopzG8p+xbrl+khWhsJ8ztq7s6Vd6b2QA4NdPJ/BK1T34+abM
	+Kui2Vgxlh5/i37OhjoAOehS4STfGUxpW9WuMoVJntFzjDn+20qD9Liv+QKpdi4B
X-Google-Smtp-Source: AGHT+IFLJOOCuXzy59FS4QxM9xLFiuJUfW7dVSUK0u+Wv14Lw6bkRzh8toNtN5jJ/dtyyxzepFTwjg==
X-Received: by 2002:a05:600c:34c9:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-451f0b0e7a1mr57910725e9.18.1749107664852;
        Thu, 05 Jun 2025 00:14:24 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:24 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
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
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 4/9] sched/rt: Move some inline functions from rt.c to sched.h
Date: Thu,  5 Jun 2025 09:14:07 +0200
Message-ID: <20250605071412.139240-5-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605071412.139240-1-yurand2000@gmail.com>
References: <20250605071412.139240-1-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: luca abeni <luca.abeni@santannapisa.it>

Make the following functions be non-static and move them in sched.h, so that they
can be used also in other source files:
- rt_task_of()
- rq_of_rt_rq()
- rt_rq_of_se()
- rq_of_rt_se()

There are no functional changes. This is needed by future patches.

Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 kernel/sched/rt.c    | 52 --------------------------------------------
 kernel/sched/sched.h | 51 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 52 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 046a89fc7..382126274 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -167,34 +167,6 @@ static void destroy_rt_bandwidth(struct rt_bandwidth *rt_b)
 
 #define rt_entity_is_task(rt_se) (!(rt_se)->my_q)
 
-static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
-{
-	WARN_ON_ONCE(!rt_entity_is_task(rt_se));
-
-	return container_of(rt_se, struct task_struct, rt);
-}
-
-static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
-{
-	/* Cannot fold with non-CONFIG_RT_GROUP_SCHED version, layout */
-	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
-	return rt_rq->rq;
-}
-
-static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
-{
-	WARN_ON(!rt_group_sched_enabled() && rt_se->rt_rq->tg != &root_task_group);
-	return rt_se->rt_rq;
-}
-
-static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
-{
-	struct rt_rq *rt_rq = rt_se->rt_rq;
-
-	WARN_ON(!rt_group_sched_enabled() && rt_rq->tg != &root_task_group);
-	return rt_rq->rq;
-}
-
 void unregister_rt_sched_group(struct task_group *tg)
 {
 	if (!rt_group_sched_enabled())
@@ -295,30 +267,6 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 
 #define rt_entity_is_task(rt_se) (1)
 
-static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
-{
-	return container_of(rt_se, struct task_struct, rt);
-}
-
-static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
-{
-	return container_of(rt_rq, struct rq, rt);
-}
-
-static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
-{
-	struct task_struct *p = rt_task_of(rt_se);
-
-	return task_rq(p);
-}
-
-static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
-{
-	struct rq *rq = rq_of_rt_se(rt_se);
-
-	return &rq->rt;
-}
-
 void unregister_rt_sched_group(struct task_group *tg) { }
 
 void free_rt_sched_group(struct task_group *tg) { }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 755ff5734..439a95239 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3128,6 +3128,57 @@ static inline void double_rq_unlock(struct rq *rq1, struct rq *rq2)
 
 #endif /* !CONFIG_SMP */
 
+#ifdef CONFIG_RT_GROUP_SCHED
+static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
+{
+#ifdef CONFIG_SCHED_DEBUG
+	WARN_ON_ONCE(rt_se->my_q);
+#endif
+	return container_of(rt_se, struct task_struct, rt);
+}
+
+static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	return rt_rq->rq;
+}
+
+static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
+{
+	return rt_se->rt_rq;
+}
+
+static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
+{
+	struct rt_rq *rt_rq = rt_se->rt_rq;
+
+	return rt_rq->rq;
+}
+#else
+static inline struct task_struct *rt_task_of(struct sched_rt_entity *rt_se)
+{
+	return container_of(rt_se, struct task_struct, rt);
+}
+
+static inline struct rq *rq_of_rt_rq(struct rt_rq *rt_rq)
+{
+	return container_of(rt_rq, struct rq, rt);
+}
+
+static inline struct rq *rq_of_rt_se(struct sched_rt_entity *rt_se)
+{
+	struct task_struct *p = rt_task_of(rt_se);
+
+	return task_rq(p);
+}
+
+static inline struct rt_rq *rt_rq_of_se(struct sched_rt_entity *rt_se)
+{
+	struct rq *rq = rq_of_rt_se(rt_se);
+
+	return &rq->rt;
+}
+#endif
+
 DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
 		    double_rq_lock(_T->lock, _T->lock2),
 		    double_rq_unlock(_T->lock, _T->lock2))
-- 
2.49.0

