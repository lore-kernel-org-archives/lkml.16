Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B921FF32
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497925; cv=none; b=XG3lVuJyq2pzvsNIgtgUzJyY+ZYLs22c40UAhoDV3EFwARnDGMBRsAGPbpQIrFUUENZYIqDBZTgbaILNKOgDyYkDbdvhTr8ZAS6sjvV36m5ZFlpbGlDUGetZM62SLzi+NpLeR1f4+8D8q7IJkHp6d8dqJzJ89xAxzoShXToSrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497925; c=relaxed/simple;
	bh=2Rv9p6tNaMgQnX7ROTD/t3VPANSO2JnMTzpQk6fahbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=igkhw/4a5zdfTJ1L0kEQgFjB1uAn8yGhw2xuUU/C36vo0uMb+BfewVjObrCZ+bMiFk+OsUGvT1BudHGM8x+Os3pqCIEWENZPiBd5zF7h84azG+NTdQfRrj/l+YpI0xsS2vxnHzajqe5vJ2vXtPb7Y5TdC0GLmVTkGqINWsSKmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ro8j07Hh; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ro8j07Hh"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-6fae0df0b35so77688016d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749497922; x=1750102722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PNHkUJ9ZGq1uRh4C8x9DUhH6un0NctvGdYHnDp4NNo=;
        b=Ro8j07HhMtNvQ4GPdxb9dRV/g+EK53JfYHTx1L8cPtZcOF7AIZ7edhT6pVqlxw/fRe
         4PsX3HJ+1SFUCyc5PFPSvkQ1haJXtghVRNeGC3z35nb299ZOq/kqWdE6/O+sc1/CyBG8
         3Uw+JrVyIQ4Rgs/KGxusNrytHJjkLDGudiKBHePJBMIB7RbqPDgIG4WGdJb2RrYD2AnC
         FOXgiTPRf+6w1c22SByqsOuzdfl0aykaK4LYTMrcvwt1bHJp9FyZ13Vbhmyyae90eHXj
         P7ZNeCdJG/9DNiOr9Nz5+Nsy9GSASN1mtnLOivLG1PfyT/0IE6yQBgcbgV2whINizdEG
         Xw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497922; x=1750102722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PNHkUJ9ZGq1uRh4C8x9DUhH6un0NctvGdYHnDp4NNo=;
        b=gVwNxSxMr4Bam4b7hNdEVliCaQ00i1cIQnDY3g4OGRO5tBwA4RZFxg/6R/5gslHGDD
         3vKytz8gH9y2ViUl5IYSt/AQnnBGviCX9uWpQZLLwXuvIdUI+3gMw5G6TlDaFWWa2fMF
         ndzTy9xE7Egw/P0+UNDBU1tfBGo3UP/KFv2hw69a2f8ZexrADOZ0upG4LWvpgYNguGn6
         jIXZRZc3eZBCPyrkyGQ35zyM4r5mhLkU71SLKcCFXjWu9aVAm7O9ZDsq7LnWSbgiPfHx
         ERt1zeuYNpai2xU3gBHrhEWkyx9XScZvb4bUJWV1Hvl+OGkTiRaclDpDxn/b1HIUyzCR
         dicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHuo/nFZT+Vt4kNssXUzRFgc9MUME7CbpMgb3IM6DzXs8CrCr/udYDcU5AQ2ZPmZBOaNjHxWNDxApZQDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8CPYDqdxY83Ihpvt3TRcH3ALkXI69lwtidPdwYYo0x/3pW8L
	+8ZysiMpSyqLMdj8iCckkDlAQFDcq/BnWd0VQZ6QRAzVOFLwaCraP/dAyuhMVugxqHCQjYaLYSV
	gVtRxaldh/A==
X-Google-Smtp-Source: AGHT+IGwtLwTR9bWi9Hwt6GDozWcxWkI/YF7qOX7xhVb8YMMVmF6tMkKyLLE8BSiOPQrxcmodNBY/RjOll1f
X-Received: from qvbqp11.prod.google.com ([2002:a05:6214:598b:b0:6fa:c619:8ba1])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:d02:b0:6fa:cdc9:8aff
 with SMTP id 6a1803df08f44-6fb08f612c7mr259085596d6.25.1749497922301; Mon, 09
 Jun 2025 12:38:42 -0700 (PDT)
Date: Mon,  9 Jun 2025 19:38:31 +0000
In-Reply-To: <20250609193834.2556866-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250609193834.2556866-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609193834.2556866-2-zecheng@google.com>
Subject: [RFC PATCH v2 1/3] sched/fair: Co-locate cfs_rq and sched_entity
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Improve data locality and reduce pointer chasing by allocating struct
cfs_rq and struct sched_entity together for non-root task groups. This
is achieved by introducing a new combined struct cfs_rq_with_se, that
holds both objects in contiguous memory.

This patch:

- Defines the new struct cfs_rq_with_se.

- Modifies alloc_fair_sched_group() and free_fair_sched_group() to
allocate and free the new struct as a single unit.

- Modifies the per-CPU pointers in task_group->se and task_group->cfs_rq
to point to the members in the new combined structure.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/fair.c  | 23 ++++++++++-------------
 kernel/sched/sched.h |  8 ++++++++
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..cd090ceec633 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13341,10 +13341,11 @@ void free_fair_sched_group(struct task_group *tg)
 	int i;
 
 	for_each_possible_cpu(i) {
-		if (tg->cfs_rq)
-			kfree(tg->cfs_rq[i]);
-		if (tg->se)
-			kfree(tg->se[i]);
+		if (tg->cfs_rq && tg->cfs_rq[i]) {
+			struct cfs_rq_with_se *combined =
+				container_of(tg->cfs_rq[i], struct cfs_rq_with_se, cfs_rq);
+			kfree(combined);
+		}
 	}
 
 	kfree(tg->cfs_rq);
@@ -13353,6 +13354,7 @@ void free_fair_sched_group(struct task_group *tg)
 
 int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 {
+	struct cfs_rq_with_se *combined;
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
 	int i;
@@ -13369,16 +13371,13 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 	init_cfs_bandwidth(tg_cfs_bandwidth(tg), tg_cfs_bandwidth(parent));
 
 	for_each_possible_cpu(i) {
-		cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
+		combined = kzalloc_node(sizeof(struct cfs_rq_with_se),
 				      GFP_KERNEL, cpu_to_node(i));
-		if (!cfs_rq)
+		if (!combined)
 			goto err;
 
-		se = kzalloc_node(sizeof(struct sched_entity_stats),
-				  GFP_KERNEL, cpu_to_node(i));
-		if (!se)
-			goto err_free_rq;
-
+		cfs_rq = &combined->cfs_rq;
+		se = &combined->se;
 		init_cfs_rq(cfs_rq);
 		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
 		init_entity_runnable_average(se);
@@ -13386,8 +13385,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 
 	return 1;
 
-err_free_rq:
-	kfree(cfs_rq);
 err:
 	return 0;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea70..af23917194fb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -740,6 +740,14 @@ struct cfs_rq {
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 };
 
+#ifdef CONFIG_FAIR_GROUP_SCHED
+struct cfs_rq_with_se {
+	struct cfs_rq 		cfs_rq;
+	/* cfs_rq's sched_entity on parent runqueue */
+	struct sched_entity 	se  ____cacheline_aligned;
+};
+#endif
+
 #ifdef CONFIG_SCHED_CLASS_EXT
 /* scx_rq->flags, protected by the rq lock */
 enum scx_rq_flags {
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

