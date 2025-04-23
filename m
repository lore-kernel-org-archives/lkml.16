Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611D2701D7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412843; cv=none; b=Z7hT4nqMjpmA9afb3W/vVL3JYCoUH7gmo9KQ9FtRQs6S66q7qOX/AR39e2mAUBQdY9iZZf5fXuCQrPSSQlZa4sVdSi21Z60bdeezYdmwe0dp+Jm3AHE6/bKN+ztDvQgbkbU5lG1SueJ+GZP9sMaSj5tXk4AEosknrSUS4IQ4/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412843; c=relaxed/simple;
	bh=NHdZjySggeTDKobceZS9DQ5Yfvb8aCo2uv+8BnJA33g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QaXvg9xIakW1zG9hmo0hyDFhRLD77O4Ez44fBn48DXbJbM+TS7PlmbJ7Ghs9lmpA4gpTwE8LALTQabR1oiRlwQQKo9UWjdl/GNa+ogiTJqtE9+GekXkMJSgvLCdydSqtjesQv7Fn2Tgv3jRGK/yTG72+ebwatABc/ouA8uZsu/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SyY+MpGo; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SyY+MpGo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745412838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FVH6kGTenEWZHy8NHiK0SANB1ahHff4reeRNMe869nw=;
	b=SyY+MpGoXUy1WPK3S/KJW8Nt7cTxfHFbxaM65qSxxnSVUmgzu6sRQNtMtAPfx1gQ+G+03v
	2j015L8tU8J270Fqs+AGcFvfQ954wNZpvejqdgyVP5lad43BJn3GMOJS0O3yzg9cYsoBYq
	X5lqIF24Po77teCff15cPCYqzxH7CpM=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: mrpre@163.com,
	mkoutny@suse.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+01affb1491750534256d@syzkaller.appspotmail.com,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH v1] workqueue: annotate data-races around pwq->stats
Date: Wed, 23 Apr 2025 20:53:41 +0800
Message-ID: <20250423125341.503659-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Suppress warning by annotating these accesses using
READ_ONCE() / WRITE_ONCE().

Reported-by: syzbot+01affb1491750534256d@syzkaller.appspotmail.com
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..d78640b5d188 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -3241,7 +3241,7 @@ __acquires(&pool->lock)
 	 * point will only record its address.
 	 */
 	trace_workqueue_execute_end(work, worker->current_func);
-	pwq->stats[PWQ_STAT_COMPLETED]++;
+	WRITE_ONCE(pwq->stats[PWQ_STAT_COMPLETED], READ_ONCE(pwq->stats[PWQ_STAT_COMPLETED]) + 1);
 	lock_map_release(&lockdep_map);
 	if (!bh_draining)
 		lock_map_release(pwq->wq->lockdep_map);
-- 
2.47.1

