Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F31213240
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067155; cv=none; b=qAt7OpiXUTlcvppnv/gf5+yQ2ntNvd0+M2hPIwNkg3AEmBWYT8l7s7HnMgvTSGZmbJO7yJ9E2C2jwn3QT5AjKFfhcMTVbkF9xVte0gJtLFXiHeL28aZDm5VMU3LLMTY0hmZRijCBhTTrxIbJGDs714fnGWTqCsRSIMZSaLq9Qjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067155; c=relaxed/simple;
	bh=hNsugqu2cMOw3pa8As49Fq/LBELbjZEHbAsiXWjpb0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MmrhhMdj4VRtVLOXVXH/+gzZscSmKZ41Mbeh+Alg08+0qkGV07/7jGrbhG0Yp+GUcGYMtU7Zzp1T8LIBYuQcNT08CFn54n8iCYWw/pykqPOxDM2/X1c9PhL6I9xEePqb55mIlXaEkiMHULfrjnIpIAsRP+MNnq6ixBDuj0W3TRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s3gl0WMx; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s3gl0WMx"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c5cd0f8961so45034285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067152; x=1749671952; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BE1JvPau67Augvd0EXHJU7jahlXkBqnSAfRcstGC/1o=;
        b=s3gl0WMxCWAEhejB5+3aHxDuIdD3auK2C7bKpw6uvf7XIey0E6UNUo67IaqEOLeP46
         ZYdil9Ghwpdz2iVR4Bd0kyitD2rUNNfW2ZnV/+T3fMqSx34XCbXksfVXjSUkodIKC6Mz
         /uu/NvMz+fP8wow3HlW3U7KLaElpl7Wyj3vwAyoZ9gJRhWdHea744j9c9qGzymf8cJlf
         hn59ySwsMcGcw+eI2L1bpY/eHCzABiNAMwJQlJLSA/0sfqZ7e36yjZbw/xAsHVsD4cEW
         1DDrxrIMxRDSNHCP8Z6dYo+lu0dp5UtRgRmxWSAo0UTRfUgYB1TFpHsxY+OXRfNp3kWZ
         hm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067152; x=1749671952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BE1JvPau67Augvd0EXHJU7jahlXkBqnSAfRcstGC/1o=;
        b=O1Js8nDWz7g8LxrMkMGKZaJJj2VHLfd1FI+eJrVLD++1BE770NRn+r2yDrUxU23sY/
         q5JiCF5QMjyOYs0CrBCyVf6BnZFEslF0HyzZrfqVtp2+/MSrJVip/Je0DecAGUrUyH/I
         XTet+rIX2T6AZgc0kQHStqTAMu5ZkS5WS+EkV0Vd6OE0xAWAoAPIoz6cnj2IafvLu1Ks
         k7zY/05H5bmGhRvDcLojp31NopIWoyy9g9bN2Yhua5yQYiaZm3VRTUVu393kpuUBlRAu
         c8CF9XnPnqTm22LxTzg21KnBCVQKwvhYaxAV8q0VI0pVWjweOh2bGDI7i+vEEFh9xGK5
         Aiqw==
X-Forwarded-Encrypted: i=1; AJvYcCVB0l2pHENdz7c2hHDJkIXDtvgVxMDJKv5mHO9O+on4YWkDSynscsNF28j/Mj9MaMs6THDSs1tRJ5PcSAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxefFUIuLyp7tt+YaUkNUP0m70RKVG0PElSPrrvy+nLQfvAiqNw
	UtVaVUdpTgnchzRw5Df2N5CcVwQiAWZD6m4741pIp7aD70aQqAmh36rGpo5LEuQtRm+MM8Z3KZ9
	tTuSXFl+pgw==
X-Google-Smtp-Source: AGHT+IH2PVPU+jnCDOWlvH1nmTCsP6zZPCzuBIXNirLucuXHv9eITdBYMuX/KC8xAAlbaVmrnjaKIXmwEmUt
X-Received: from qkzz15.prod.google.com ([2002:a05:620a:8cf:b0:7ce:d551:8079])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:45a7:b0:7d2:1509:752e
 with SMTP id af79cd13be357-7d21991bef7mr636055485a.58.1749067152578; Wed, 04
 Jun 2025 12:59:12 -0700 (PDT)
Date: Wed,  4 Jun 2025 19:58:41 +0000
In-Reply-To: <20250604195846.193159-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604195846.193159-1-zecheng@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250604195846.193159-2-zecheng@google.com>
Subject: [RFC PATCH 1/3] sched/fair: Embed sched_entity into cfs_rq
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

To improve data locality and avoid pointer chasing, embed struct
sched_entity within struct cfs_rq. This co-locates the runqueue state
(cfs_rq) and the entity's scheduling state (se).

This patch implements the following:

- Adds a struct sched_entity field to struct cfs_rq.

- Modifies alloc_fair_sched_group() and free_fair_sched_group() to
remove the separate allocation and freeing logic for sched_entity
objects themselves.

- The task_group->se pointer array (struct sched_entity **se) is
retained. The pointers in this array are updated to point to the
corresponding embedded &cfs_rq->se for each CPU.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 kernel/sched/fair.c  | 10 +---------
 kernel/sched/sched.h |  4 ++++
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..c2af9896eef4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13343,8 +13343,6 @@ void free_fair_sched_group(struct task_group *tg)
 	for_each_possible_cpu(i) {
 		if (tg->cfs_rq)
 			kfree(tg->cfs_rq[i]);
-		if (tg->se)
-			kfree(tg->se[i]);
 	}
 
 	kfree(tg->cfs_rq);
@@ -13374,11 +13372,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 		if (!cfs_rq)
 			goto err;
 
-		se = kzalloc_node(sizeof(struct sched_entity_stats),
-				  GFP_KERNEL, cpu_to_node(i));
-		if (!se)
-			goto err_free_rq;
-
+		se = &cfs_rq->se;
 		init_cfs_rq(cfs_rq);
 		init_tg_cfs_entry(tg, cfs_rq, se, i, parent->se[i]);
 		init_entity_runnable_average(se);
@@ -13386,8 +13380,6 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 
 	return 1;
 
-err_free_rq:
-	kfree(cfs_rq);
 err:
 	return 0;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 47972f34ea70..6e26b7d59c13 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -738,6 +738,10 @@ struct cfs_rq {
 	struct list_head	throttled_csd_list;
 #endif /* CONFIG_CFS_BANDWIDTH */
 #endif /* CONFIG_FAIR_GROUP_SCHED */
+#ifdef CONFIG_FAIR_GROUP_SCHED
+	/* sched_entity on parent runqueue */
+	struct sched_entity	se ____cacheline_aligned;
+#endif
 };
 
 #ifdef CONFIG_SCHED_CLASS_EXT
-- 
2.50.0

