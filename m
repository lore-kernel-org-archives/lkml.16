Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FA035963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234840; cv=none; b=us2GL5EO07XVfcu7Th7TEQu6djPsXA55zHrRT3vAS0row7lKxpdMletNOytBX5kaDquaSB2k59ios5mvYqlR60knuZsoe9UnBiPJj9rAFjzGxZD9kWtt/IH+GR1t7aIA2ixghpwl9f/Bfs3Lv3QDp8JFJMfwnk44hyX/iyuOg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234840; c=relaxed/simple;
	bh=BeldqmaA4JVUctnGdxwNNNGtilo+WIwG+ckVCDsWG3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lDTcSEDGWmtKKOtTh5CiCvx8kGy86ijqHk+II2d2OrUVXiPVH8ljDHgdw3mL+urdH/qoyW9HERr2p7zlnE7vbPzQFdCwr+G4GfJoEFQ3echGHpt65EhTstoECZmZLKYqtyvCUZjRrVIjt6DMmqI2yr05sB/BclH41qjEuODlM+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GxnzTMwX; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GxnzTMwX"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so5378973a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750234836; x=1750839636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LKSeQMInYM4eVnyTBiOILRNGaEo266O97TjE8trNAw=;
        b=GxnzTMwXbH2rMTOtOn1hRRylWqlo5CwzkWUC26vxZFd7hPoQyKurwwQ2j6+O11+2Kg
         6zKEIKIaDajM8K7qKP1YsBh4waQlPgdrvKL67KJeS6L8NwRbI48IHZMdUkhr/4FVLRAg
         RP1T6PtvIhItPyET0nj8fUbaDLs86mMZqX8xasTHazWUrscx1TQJ8aYGzXUwbMudHAK6
         +X1KRdG1ZN47Y+gC24bPeF3gukLBYzVaKA9XOeuv7nxTNk5lZHYE1a5Pylelrd5W2OPO
         3aV3I76Vl8gNcpX42nLnNbTpCy4VNR2XZzZxWMZO3R6qqrrr/kE4sQ20ZNbBdPO1lAF+
         7xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234836; x=1750839636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LKSeQMInYM4eVnyTBiOILRNGaEo266O97TjE8trNAw=;
        b=qsJPMUDzxVKJYj+uYvUSltB+xJ0JDi6jA1u8aOMkB/Q7Q1Huxi1D1utZsc5jhGFwcd
         4HNV7JPayxP0mRTpgZw9JYue7u5st4VD9F7GITUOCfB27Mug6uU+C5pnJFFwg5ewjMSx
         FQNbkYFzAaGAHXoiRHfjMQ7VRPn2OlATU4B1cjavlUa/bLLinpWP2kvviryOQo4zMSyR
         r7N9Jfij8CIuIJExYMva7BOA9d9mbPTHXmYGuy3zrUPtNbeH0YMxbGLZrfOOk12YzyCK
         UJC8+YdTwo3TXPqUZ4NyQiKjC4xDEc6Xmgqsyj3a3O9wjL6TsgA9kDTBKWkowyZGFlau
         2COg==
X-Gm-Message-State: AOJu0Yz8PY/rH17TSN1d9JPAzT+Xo8iSCHk08qQiMgZ5+JQquvLR6N5Y
	Lz+hSzv1XPLdsBmeg/ugA+YMLjn4G+oVdawp6gGnF2zwgJVfhxOVDMNCeqC7pLWWLQ==
X-Gm-Gg: ASbGncvAeAVj4AfCiiYy5zIqohhNwQFvp+9Dk0As0M4JnR8DMChs7Sqk+ZI6oLsnAqa
	8iie0apv58dheFgk3+KZ4IcpOrMJ8O1c0Lv6wruDG0DUp7tRs1EFOxEe6yaolnnIkbJ3d7ynLqz
	v3jYeXO2NE6hOtHvInmO2mw6RKYp7/hoSS9DQl7vbg+LJcqmv6f8T+lyIr02T8fKIQI/0ecuu4G
	QcvChPFEsKqtZtjv+Bstq++5YnOd+nFrDNpJeOa/2mrfz9DfZnhZgipfe/OAWJvSdriZfAna+Db
	uuPSih8bryiQC3mm95R+UR39LYBEqVqkbA/gARZP3SK4Nm7jNnDfj7ZRUf6DmR2mflrEBKaN2i6
	m57cO0Q28UlcMsc6Lb6lxoRaqDTFCRfoE
X-Google-Smtp-Source: AGHT+IGxPU8o0sJXokT05J4TqsfJNsHo4zLF38+SbBee7L5yqtFKos637eV4Xo+NdvodD0OJoEFEYA==
X-Received: by 2002:a05:6a21:329e:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-21fbd505d57mr22227785637.5.1750234836121;
        Wed, 18 Jun 2025 01:20:36 -0700 (PDT)
Received: from 5CG4011XCS-JQI.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1691d7fsm10432084a12.69.2025.06.18.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:20:35 -0700 (PDT)
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 5/5] sched/fair: Get rid of throttled_lb_pair()
Date: Wed, 18 Jun 2025 16:19:40 +0800
Message-Id: <20250618081940.621-6-ziqianlu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
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
index aab3ce4073582..d869c8b51c5a6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5728,23 +5728,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
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
 	return p->throttled;
@@ -6726,12 +6709,6 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
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
@@ -9369,17 +9346,13 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
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

