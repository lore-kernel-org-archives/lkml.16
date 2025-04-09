Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98625EF83
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200520; cv=none; b=XsCav74L9Ga6ORzGWv+1LG3j8h35cum30OW9auO0P6rTy8PZH/92QNb+becq/vbDG8HPObip+za1Ob04Q1LtVseF9BSg4bHRq4AHjcspENS0ZNJVXOuZOKBrYtcDcviV4MuQ3NXWQk+bWDWrXPN9FDj1ATtbni3TyYbF26PE0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200520; c=relaxed/simple;
	bh=QVVAyUMw1GYU2eQ9MgmKJr6JmFovcIE9h4ZutUBXYDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZ7oFm9AMANwj0JF5xloyU8mQWKSTNR//eNWzWakME1l7akgXZjp25RZrWtaAUGe9pk/HnLmTxvo3qdw1P/yxBlB5SSsddxpACOXuHc869w4dyaz4vIbTdyTDEsBN8xxPtbGh3qBO/17i6GkcCmUR3bFbdBXxeApvRTUc6angcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QnzJC5+O; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QnzJC5+O"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso4426054a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744200518; x=1744805318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKAlGwjYFaaJe+h1c6LhiwkGgAd8UZrNATBWfFhiu04=;
        b=QnzJC5+OXfviyWFPL8qxF608pvCLLFd3L8OAgzgWrO+wi3rm3kZ8z/jhjMbl1VO7YK
         8NJfnWwYy8OFpJlz9iEIhO8HlME7NOAN5Q5T6styUZcW3crumGpoP3ehYgIiLqgWkdIH
         zWpZIqgyyRPTNxVPEJVyhB5j0fKvUhW8kUtbd+Kjn3O0ToPKgz/eoKM1Jg6tVJc4oK5s
         Q2zpYtiCUspHQ3cW6MZ7QUpoQkEznNWaZbGeKeLZzwFWWeuO/5aY09MeIHKfMh8cZ36m
         4iXDsimmulkbB/c2tefSfMSIHsVIJmLrczAnWAz3gZBWXE3tXFp2Rer6mo4yhJFV6Ly1
         wsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200518; x=1744805318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKAlGwjYFaaJe+h1c6LhiwkGgAd8UZrNATBWfFhiu04=;
        b=aWWhbAkBjVrpjK3wRZmbuTVsYqqdWQo6P+0nHS3/A3s5Um5nAdqC/RErn1L/RDkEWb
         gqgCmne6OzsYcU1H+ilkciDMf29LPZQp5rqaT5viKY6muSYEC4LzRzmGoqg641hdsLVl
         c29p1HCVZXCUvdTw9Oe3N/+mSL4yg/TEvdxj6TvrdqXdC5tHcI3WCuluJEunjhMSgtp0
         cU3SvXPuyg5D58iIVvaf3Br0j9DSReuSns+EVcOt3m3AwNTe4HjkM2dN0473VhNc7OGG
         zz2ZKy6Ll5uBL72WLO0mdlfOMH3F+7p3dgbmFEPuHVOO1kNSB5JNrkg8D0GNwzKCsuao
         rx3g==
X-Gm-Message-State: AOJu0YzJaCJv7OyqyEcPbwrP9Nsw1SHACQpFzzRyyxESRAkKsUykUcna
	MnaNVqVqjOebvkgjVw5omeNaWyWFkudgy78TkW9WEebK2SoHLdI2bO445lq6cleDydlcZpke5Z4
	Ecw==
X-Gm-Gg: ASbGnctmgil8mQKyB+3p54TwN4nEL09F5wu7dM2hHd3gz2RaAbd1mGvnd3XiuDjn3Nv
	tyLcni1l6adI/ApFvR5buzok1v/kk5X4BDAT/1aTjZdVICZuvJjIZTjTtWeF8MiAW4Ww6R2OVks
	m9KXxuO7zyq76tyKYUpEpn9FDv3wnUFfXl0C+SroNXV+/YdEhGR+5soNIc0WT8nvXjeM93PEI8O
	qagBHOJqM5CrhlB065rZf1/AFDRyOnmKU3Ubg01woDp8rP4m7OyCw32lOUD+Cu1w9qu4XigEUPF
	zbRzYH6Sy9Invmn1TIcjV2pHx4zInwus2qLFaYFWM60+dQGnwsd5AGjK
X-Google-Smtp-Source: AGHT+IGtU6qYiL2dkf63bw15nUQfC7L6vqwL8vIVcUfsdB/xRER/gUmRWJbjS855B6fDinrEWskrbA==
X-Received: by 2002:a17:90b:6ce:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-306dbc29851mr4471254a91.24.1744200518008;
        Wed, 09 Apr 2025 05:08:38 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c62dsm10017875ad.95.2025.04.09.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:08:37 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC PATCH v2 5/7] sched/fair: get rid of throttled_lb_pair()
Date: Wed,  9 Apr 2025 20:07:44 +0800
Message-Id: <20250409120746.635476-6-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409120746.635476-1-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that throttled tasks are dequeued and can not stay on rq's cfs_tasks
list, there is no need to take special care of these throttled tasks
anymore in load balance.

Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
---
 kernel/sched/fair.c | 33 +++------------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 76b8a5ffcbdd2..ff4252995d677 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5808,23 +5808,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
 	return cfs_bandwidth_used() && cfs_rq->throttle_count;
 }
 
-/*
- * Ensure that neither of the group entities corresponding to src_cpu or
- * dest_cpu are members of a throttled hierarchy when performing group
- * load-balance operations.
- */
-static inline int throttled_lb_pair(struct task_group *tg,
-				    int src_cpu, int dest_cpu)
-{
-	struct cfs_rq *src_cfs_rq, *dest_cfs_rq;
-
-	src_cfs_rq = tg->cfs_rq[src_cpu];
-	dest_cfs_rq = tg->cfs_rq[dest_cpu];
-
-	return throttled_hierarchy(src_cfs_rq) ||
-	       throttled_hierarchy(dest_cfs_rq);
-}
-
 static inline bool task_is_throttled(struct task_struct *p)
 {
 	return !list_empty(&p->throttle_node);
@@ -6742,12 +6725,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
 	return 0;
 }
 
-static inline int throttled_lb_pair(struct task_group *tg,
-				    int src_cpu, int dest_cpu)
-{
-	return 0;
-}
-
 #ifdef CONFIG_FAIR_GROUP_SCHED
 void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
 static void init_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
@@ -9377,17 +9354,13 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	/*
 	 * We do not migrate tasks that are:
 	 * 1) delayed dequeued unless we migrate load, or
-	 * 2) throttled_lb_pair, or
-	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
-	 * 4) running (obviously), or
-	 * 5) are cache-hot on their current CPU.
+	 * 2) cannot be migrated to this CPU due to cpus_ptr, or
+	 * 3) running (obviously), or
+	 * 4) are cache-hot on their current CPU.
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
 
-	if (throttled_lb_pair(task_group(p), env->src_cpu, env->dst_cpu))
-		return 0;
-
 	/*
 	 * We want to prioritize the migration of eligible tasks.
 	 * For ineligible tasks we soft-limit them and only allow
-- 
2.39.5

