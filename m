Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B130270563
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737742; cv=none; b=ha6XPdooHs3xhpyNoEcEXW6GTwS2b5HqRz0xQixNPfzUjpLbHq08Pe48hgjA3yFSf9vYQ1KhAcr26JIvewb21/TS8kES957sFievG5esy+hP95CaMlsZvYJQQjGGfA4SEvg+8pSizI0XV3iQ1RNcqmMzE5aO5zGxErroDAydUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737742; c=relaxed/simple;
	bh=DNI4KUTdIiNAMAxBFxHwmbuQrjAHQHbL5Toe3Sp6AFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KB2LvguI9u+KrBtasYJqxSDOxUwzqSpL6T8UUi51kWGrqRns8kqq9fWMusM5mK0UzY5leIPqZCJTuMWwDfPg+bDCapAvUjuN/1SGrFxfhjo0DYMNsW2wP9qNtI9/JGNidQO/LjIbgSH8HtLbVEq2KBexLoZB07RQgGCtYWnC89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZIKWR9Jb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZIKWR9Jb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30ec226b7d6so2473857a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747737737; x=1748342537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaS0HedpcaRBMMa9Dux7MJUqBml94jvopVU0/1WL8p4=;
        b=ZIKWR9Jbp2FJi2pqt0phaEhQzHlAVKXf/pDNlPMKMWv3QXUN2IAjKWlEPI1DOjNRDg
         WNcIQfsvtm+yD0ujKzYsfMgHHWNkerT31jPpjtaKNbOSQkQ9fQjXEz5In4dukVYfGezq
         szXWyM4WMZ1EPEHoevbYUxinsA7pgd1y7Cf52fAgbyY4Yt3Hx1k2xwDBb2z2vXTaCoBu
         DG23D5NZlgYS2D0vzGR6x6FSUbtLxJcOvKP2nDeS+dtpJSlvTMpyzWR6U3UNkapE23lo
         3j8j+JiRDf219Qwh07DWubbeVU5XUKB03GJaxFs36ay1tX0u6qkXx7hBvS5XZOsFUlQu
         ngcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737737; x=1748342537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaS0HedpcaRBMMa9Dux7MJUqBml94jvopVU0/1WL8p4=;
        b=kJOZJ9lGsiwQS9jNHfKji6geYZ68e/YZ7WzZElAubGJ9t44DD3clfHCNAt97en5GHY
         1+/BcRnmpBKqe8DMOGjGfWTjugMmcylZJpiAKpvzRykuix67rlfy3iXcWF5h7Eah7/yG
         4cKKkSsqWsOOUpLTfzI4yi4DQ5Co+vr6NHW1SB/LTjvEjB2a1uPzVGMGUqL+Qxa0+0xR
         uTmlGgQgaHQUd/DL6JfdIKIqMhmbm8HJvLnNZfh6wuVEkLeL88XOKTVk955LA5x8H3eQ
         cmvi2oX6NNERk2Wr4GHVM1SBI04sBcKvK7OYWF79rtB0W45oKmhc5b4UC/DDCx89zI2s
         b9iQ==
X-Gm-Message-State: AOJu0YwIWkGIwKND4BrMvp/qJ3Z9myhYeI4isBJiPWr5B1wxHFVrVb+9
	phDZpJq27HXvH2dBbR8y3NTyq0FvRlc+OXDbOpCSQ4UWYTj8dIp4r3ZwbVtkos5ugA==
X-Gm-Gg: ASbGncue6fBGVDh8RX7HpjIBQHbl7Ye6urpPPjq17rf1IWHdzTTl4QEsBbYt1OAD+g6
	g5bOmyY9I+RJNrCgygrqRuQdZkfPcQoGwdDkgOi9P8/+qVLIywk0DwEX+GS2gyinwG4IKtDN9fh
	e0I0/hCKUvt5eth3vJDxIJrSrvXIVLZq35z/0sKSWQvhoNi0FltgJAMV2Jo4h8gXTY1ZhgKZEfu
	CTe6RVcTC2PmlijieHX5dDHabJBToPDOqAVkIzwLyPaGQDSElvqEPxLxnXYzJuhaFyDqf5aizjR
	nZ833ojoNfZXVkCQZdzYV3gt9rhNdd/n871mzY5FI5tutNHAcfIGIbdEU58YD4iGctw=
X-Google-Smtp-Source: AGHT+IHpBDXGYWl/RrcXTJSh17Hti9EqQPY0w9/SiV2MgnsTxwyXp7rWcAnLd8AJrVPHipv79AC9Gg==
X-Received: by 2002:a17:90b:3c8f:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-30e7d51fa7cmr25284471a91.10.1747737736680;
        Tue, 20 May 2025 03:42:16 -0700 (PDT)
Received: from n37-107-136.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5d31sm1359431a91.38.2025.05.20.03.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:42:16 -0700 (PDT)
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
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 7/7] sched/fair: get rid of throttled_lb_pair()
Date: Tue, 20 May 2025 18:41:10 +0800
Message-Id: <20250520104110.3673059-8-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520104110.3673059-1-ziqianlu@bytedance.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
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
index 4646d4f8b878d..89afa472299b7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5796,23 +5796,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
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
@@ -6743,12 +6726,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
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
@@ -9387,17 +9364,13 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
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

