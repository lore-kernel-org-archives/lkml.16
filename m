Received: from out0-213.mail.aliyun.com (out0-213.mail.aliyun.com [140.205.0.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4E3209
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660243; cv=none; b=RIZZEOZUhjcasf7EWNgk2hdhjdkei2SAj/3a89kiybxqLbhTxmo/KKfjELpss6CsgWTwGCRwZp6JOwdX49gd25RCYkStJ8idGqDQQYPShH3CCphJFG+FyBvegCUi8bDczyAvkdC0Y9Lhl4pN6vLiOm597qhWzU6vBAz4SqPK4eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660243; c=relaxed/simple;
	bh=8UB5J9QFz3miwngYF1CdElY7shv5f9JlCbEc0vPBKxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzXF6YACZE2lpM7wKQg+J8RA4jzxPPM9lbZQ9QfK+WbBjHI7tPBZrftCK+x6nUZl1i/4Nm+QjsJCipkZ6vyXna3Wo4+ExawZH65i4XpFQltATrKvdtQGyqQ0F1AHhDIr4FFdfs/Lo0WvOwsWdVWX+vpp8XlUfAiQrotOWBauNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=g3G91KsD; arc=none smtp.client-ip=140.205.0.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="g3G91KsD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750660236; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=C0NvNwFf/o57be/X034T7v2QTbb/xicL+rUUX8Sv9Ac=;
	b=g3G91KsD+8+qbmxExXz9ETDtLkYs10fPT4YlimUbTsUvKxd35/Uc08xKLWp+4ijT2spwepYSbIiVpIS8G+WRHOfeNexvjkPQ/kCCeombd7oRqy2uSnrFKHWmI+ZyjwfiZlt9OiqQ2qIsM5GtP1CnT+MZxv3k4ITd9G8wLdhauo4=
Received: from localhost(mailfrom:henry.hj@antgroup.com fp:SMTPD_---.dUAhwJz_1750660235 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 23 Jun 2025 14:30:36 +0800
From: "Henry Huang" <henry.hj@antgroup.com>
To: changwoo@igalia.com,
	arighi@nvidia.com,
	tj@kernel.org,
	void@manifault.com
Cc: "=?UTF-8?B?6LCI6Ym06ZSL?=" <henry.tjf@antgroup.com>,
  "=?UTF-8?B?WWFuIFlhbihjYWlsaW5nKQ==?=" <yanyan.yan@antgroup.com>,
   <linux-kernel@vger.kernel.org>,
   <sched-ext@lists.linux.dev>,
  "Henry Huang" <henry.hj@antgroup.com>
Subject: [PATCH v3] Implement SCX_OPS_TRACK_MIGRATION
Date: Mon, 23 Jun 2025 14:30:32 +0800
Message-ID: <20250623063033.76808-1-henry.hj@antgroup.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In our environment, we need track task migrations to update per-cpu
map.
Implementing fentry(on enqueue_task_scx & dequeue_task_scx)
is a feasible solution. But there are some limitations:
1. Can't modify p->scx.xxx
2. enqueue_task_scx & dequeue_task_scx can't have some
special compilation optimizations.
3. Has more overhead compared to struct_ops
So we introduce SCX_OPS_TRACK_MIGRATION to support tracking task
migrations.
If SCX_OPS_TRACK_MIGRATION is set, runnable/quiescent
would be called whether task is doing migration or not.

For v2:
1. if task_on_rq_migrating(p) == true
   set DEQUEUE_MIGRATING to deq_flags in dequeue_task_scx
   set ENQUEUE_MIGRATING to enq_flags in enqueue_task_scx

For v3:
1. introduce SCX_ENQ_MIGRATING(=ENQUEUE_MIGRATING),
SCX_DEQ_MIGRATING(DEQUEUE_MIGRATING)
2. change patch title:
include SCX_OPS_TRACK_MIGRATION --> Implement SCX_OPS_TRACK_MIGRATION

Henry Huang (1):
  sched_ext: Implement SCX_OPS_TRACK_MIGRATION

 kernel/sched/ext.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

-- 
Henry

