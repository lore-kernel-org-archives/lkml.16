Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3C1E9B0A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255833; cv=none; b=QrHTl1Ivj/nyfzppIO5sWfEMjKwTWDJ08tQMDER65qUEbOmWjHrHRbpDurmXr+6JwWRPMmA9t1BF//Wl5wUUt1b9INsfbQWFslt91pytb8KUtvVtxyZ2DYdaKR1l9TPPiJ3mGCdyUdDyOZYXpwt2kVEea+6C+bNTSbDzKfaUUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255833; c=relaxed/simple;
	bh=USsgt3nAVhZ0Zv/kBH3ZmhJWyVIQLdUJM+hRIBl9Ht4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YsMReylNVtS0k4tqPqQGyu1ZcZfikD/7zjAgpR1MMof1oNQAOJQNl+ZJDXSnNWZLST9ic4ef5hcqSeP7bTALlL2Z3kJ29+0EzKmHlE97CEd9ilz0MXhp1C7BomwsD+vVWW2ZkYJWaF9nL6mzpWtkAgVNDpHeanyYMSfn79tNx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ByHbg+cC; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ByHbg+cC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739255826; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=dqAyo2ReN2P0QJoWH2gGeQPluWKTOZLcnIOz78ef+dc=;
	b=ByHbg+cCfZK0VoADyHFH7RHYt2gXj4NCaunVBRLxZojvYih6iLO9EmNrqkoS2UqbNWKgHY27ErUPsa6nc+5BUlM7uEy1NtYNrFUs8WhBto7DUc8EX1fVEq77eMlTOtWdYZPyuHx6zInzQyyw9cy8ZpQh9vZ6GbnKrM4Ijzdmo/4=
Received: from localhost.localdomain(mailfrom:dtcccc@linux.alibaba.com fp:SMTPD_---0WPFmM14_1739255819 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 11 Feb 2025 14:37:05 +0800
From: Tianchen Ding <dtcccc@linux.alibaba.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] sched/eevdf: Force propagating min_slice of cfs_rq when {en,de}queue tasks
Date: Tue, 11 Feb 2025 14:36:59 +0800
Message-Id: <20250211063659.7180-1-dtcccc@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a task is enqueued and its parent cgroup se is already on_rq, this
parent cgroup se will not be enqueued again, and hence the root->min_slice
leaves unchanged. The same issue happens when a task is dequeued and its
parent cgroup se has other runnable entities, and the parent cgroup se
will not be dequeued.

Force propagating min_slice when se doesn't need to be enqueued or
dequeued. Ensure the se hierarchy always get the latest min_slice.

Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
Signed-off-by: Tianchen Ding <dtcccc@linux.alibaba.com>
---
v3:
I modified some descriptions in commit log, and rebased to the latest
tip branch. The old version of patch can be found in [1].

The original patchset wants to add a feature. As the 2nd patch may be
hard to be accepted, I think at least the bugfix should be applied.

The issue about this patch was described detailly in [2].

[1]https://lore.kernel.org/all/20241031094822.30531-1-dtcccc@linux.alibaba.com/
[2]https://lore.kernel.org/all/a903d0dc-1d88-4ae7-ac81-3eed0445654d@linux.alibaba.com/
---
 kernel/sched/fair.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e78caa21436..0d479b92633a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6970,6 +6970,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		update_cfs_group(se);
 
 		se->slice = slice;
+		if (se != cfs_rq->curr)
+			min_vruntime_cb_propagate(&se->run_node, NULL);
 		slice = cfs_rq_min_slice(cfs_rq);
 
 		cfs_rq->h_nr_runnable += h_nr_runnable;
@@ -7099,6 +7101,8 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		update_cfs_group(se);
 
 		se->slice = slice;
+		if (se != cfs_rq->curr)
+			min_vruntime_cb_propagate(&se->run_node, NULL);
 		slice = cfs_rq_min_slice(cfs_rq);
 
 		cfs_rq->h_nr_runnable -= h_nr_runnable;
-- 
2.39.3

