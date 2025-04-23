Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449177081C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425091; cv=none; b=aiumf0K/S1ZvNHd+LJ4ChBeF2nrln0PFH2Pn7q9mSurkNobxZFEb+aLv3Xo4v9rrRliAjW3yGDPv5oC4ZiX7zfu+ZUWIzWygqXDeeMAf6VaR6f9OYYJT8U3PpFYdaz0ub1mumRq0rnsJvr9xx4OPvcTd9eGbn4Q+TKAhvZBw8ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425091; c=relaxed/simple;
	bh=U5PIkbIUgk+3S2S3bUd4x7nzK/6HrvucHZmzTrBDzdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWA3vF9GPoWcj9bVQ5/gYOfeW9Mq8oDeC9Nv/kveBOGXWcaoeAWCkxp4K2JiFb7mkGxWZ3hZVJqgrll6URQdh0Yw2JBjUOAJAXcjj1jc7vM0/u5wfvUz6Ry01D+C7FYQhqLj09Q0UK43+ieO8MQY/uzniS2go8S/Ai7Pc+38smI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aRTe8A2S; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aRTe8A2S"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745425087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tqPlhOz8s3x2etCvhSBLZAFjymyAa3oUMh8P0cikEdQ=;
	b=aRTe8A2SLmXsOIsv6ILpTkribAvqSADgBmpTeP+ycuTQo9kzrtVF92RXjpNUzxjSR0RnAo
	q94bf6IwcolZqovQo3JQIF8qVqKQF7K5PqXngaxbrkUjfR0gkvEzKoDxwxkgjp3dOx28OX
	2pX5mo3+cR0qOBf9YDjuBpDQ+lLM8Yg=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: mrpre@163.com,
	mkoutny@suse.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+01affb1491750534256d@syzkaller.appspotmail.com,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH v2] workqueue: Fix race condition in wq->stats incrementation
Date: Thu, 24 Apr 2025 00:17:42 +0800
Message-ID: <20250423161742.14429-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fixed a race condition in incrementing wq->stats[PWQ_STAT_COMPLETED] by
moving the operation under pool->lock.

Reported-by: syzbot+01affb1491750534256d@syzkaller.appspotmail.com
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 kernel/workqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..1ea62b8c76b3 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3241,7 +3241,7 @@ __acquires(&pool->lock)
 	 * point will only record its address.
 	 */
 	trace_workqueue_execute_end(work, worker->current_func);
-	pwq->stats[PWQ_STAT_COMPLETED]++;
+
 	lock_map_release(&lockdep_map);
 	if (!bh_draining)
 		lock_map_release(pwq->wq->lockdep_map);
@@ -3272,6 +3272,8 @@ __acquires(&pool->lock)
 
 	raw_spin_lock_irq(&pool->lock);
 
+	pwq->stats[PWQ_STAT_COMPLETED]++;
+
 	/*
 	 * In addition to %WQ_CPU_INTENSIVE, @worker may also have been marked
 	 * CPU intensive by wq_worker_tick() if @work hogged CPU longer than
-- 
2.47.1

