Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD631ACEC2
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739005590; cv=none; b=nXmjxmsct31wN02Xyvni89bQA1Qwd89IpD3sZmeis6BuKtx4jUhCN54tIk7XOmSNMaj+IucQf+oNbYzGDawonuSdWFXPDige3pU4cewm04Tgf6pY8nwnAcTvalQJP5miaOITEalULhwsgRyreyQXWx/Pi8/Wte/IRXAgDy/eyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739005590; c=relaxed/simple;
	bh=VTlnH2WIW7kGDHdeUWMtjkh2mRxOkDEdh9+SKHufAp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iVSNhszLqFG231ANbc41sB1XH5Zsnto1jdKI+OmE8lB1jy+lJcHU9VE5kg5BqQNUi4ODqsw1QeRjWd/kEPdGUyftUheZQK68F3b8tLL4En2iazb5+V3hbhUPizBjZHwUvzaDqWDmzGgWAOCJjVBzcBYc1z00zahfqA6X/s/itPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bYDYxM33; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bYDYxM33"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f44353649aso4227633a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739005588; x=1739610388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwpeSFZdmhzfc8/qFA4MyT2tUOC8UA2OsGoSXanSYG4=;
        b=bYDYxM33BbEgnfzSSCPJcdM8m8EFh7Iivsb4Q+Iknn4grYfL/bIeADsbSYem5gmEYj
         z1BjXZw3bZoqiiYTHrI4r0kU/VtHqABWFCgHpxCbneXknjuSRBX2okk23OjlbjpA2rSC
         kmfCk4YZvk7E1cdu/4MA1OP8E1fGmsH0sLZZbhr7R2OP1D55zI8OMoaiuRJ5WQgzfK7a
         MPsh8TBj/yov9TeVCwm8DThhqGJPj9iZZmnrgbHWJ8K8H8TMZ8gz56LQ67p8ZSXQ9PYV
         xqmwDP28LovAEFeshyzksXZayPrXkfrm1lHEHJujUDRLhD6Uhxxo6KqU/CCYc4TK/oRV
         RJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739005588; x=1739610388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwpeSFZdmhzfc8/qFA4MyT2tUOC8UA2OsGoSXanSYG4=;
        b=NJTKK8raithD7cgMofp7mLewdnbetansToPh45Hkw6xV0ORT42BdFnmF15EYN5ytH8
         qk7I2hWm+xuuGpDgyawro0jaYdwAFRlSZyvl7AD8n5+G/z5tcXm/LlblHlGWytStjSK7
         4DWm3P9GtFk5q7GZdfVuEj1aYPH1EhfwXUtttUSHuZRi9lxhUGDEWsLHHXlZ3JiIawta
         E46LmRpKAVWnLMJ4XeVKEdIlVzxP7M/pkPfVlv7vkRPQtVBeGKdXbkTjfUyp0OBQ+Ogs
         +NhRr2q+42BbwD8V28zTWNt0pWyF8SQvBBePgXM20wYd/0nwjTGTtt1M0PxqY/K2hz6Y
         bMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyq3A8M+RJFsEFhKh4xjVzNeMOx6NKn9dGSm5EsFubiQ9pKqVVPlS8waLMgbplniZbkav7L2wt4g7WzLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMAc0UOnu9uslT7374T7wagLEFmWorzjS0iGFZnlrhkBlDtd4
	pQ75fIhlugBWsYe8MsN5Vc1mRLeoqaJi+5wqric/2XdoYxnrPhMzsvN/uJB3YDY=
X-Gm-Gg: ASbGncudAGGjvEaQe3gdhVkXGgmbgt0jw6byqLPd9lqMJTXEAlUvkrzU8aTmZPG60DW
	gSQJKfFInpyZlRdmR/LXvRyyAsypyGZ1/eI6cCFSafApiN4Woth9kTHpecGiR3Y7ud5fQDjRH81
	MGqzJgA8LxSi+qkzMVxI0dJJaJUbos9yV7mRPS84YOAAgPiPU8rZ1aK46hM0S+brjFhNo3nHf4V
	+6Xw2Rw+pHayYJLB5tZeFtVNHv9I77uzy4fikYvQhwebcEabKGIJXmtw7u9ZNk/ic64ddsn2qjZ
	9pszhVxHzABU/kSmW2FM4OEQnDcJlkhIwN1008q5ul95AqNQ
X-Google-Smtp-Source: AGHT+IEOzt7459PAL07RC0zWz9pUH4t/bPsMiuYAaixY1RbqkKf6mlyq4FCdk22TvE92fusFNuVvuA==
X-Received: by 2002:a05:6a00:2289:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-7305d4f01f2mr10463243b3a.15.1739005587659;
        Sat, 08 Feb 2025 01:06:27 -0800 (PST)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1413sm4366493b3a.98.2025.02.08.01.06.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 01:06:27 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: axboe@kernel.dk,
	tj@kernel.org,
	yukuai1@huaweicloud.com
Cc: chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Yu Kuai <yukuai3@huawei.com>
Subject: [PATCH RESEND v2 2/2] block: refactor rq_qos_wait()
Date: Sat,  8 Feb 2025 17:04:16 +0800
Message-Id: <20250208090416.38642-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250208090416.38642-1-songmuchun@bytedance.com>
References: <20250208090416.38642-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When rq_qos_wait() is first introduced, it is easy to understand. But
with some bug fixes applied, it is not easy for newcomers to understand
the whole logic under those fixes. In this patch, rq_qos_wait() is
refactored and more comments are added for better understanding. There
are 3 points for the improvement:

1) Use waitqueue_active() instead of wq_has_sleeper() to eliminate
   unnecessary memory barrier in wq_has_sleeper() which is supposed
   to be used in waker side. In this case, we do need the barrier.
   So use the cheaper one to locklessly test for waiters on the queue.

2) Remove acquire_inflight_cb() logic for the first waiter out of the
   while loop to make the code clear.

3) Add more comments to explain how to sync with different waiters and
   the waker.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Yu Kuai <yukuai3@huawei.com>
---
 block/blk-rq-qos.c | 68 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/block/blk-rq-qos.c b/block/blk-rq-qos.c
index 0b1245d368cd1..5d995d389eaf5 100644
--- a/block/blk-rq-qos.c
+++ b/block/blk-rq-qos.c
@@ -223,6 +223,14 @@ static int rq_qos_wake_function(struct wait_queue_entry *curr,
 	 * Remove explicitly and use default_wake_function().
 	 */
 	default_wake_function(curr, mode, wake_flags, key);
+	/*
+	 * Note that the order of operations is important as finish_wait()
+	 * tests whether @curr is removed without grabbing the lock. This
+	 * should be the last thing to do to make sure we will not have a
+	 * UAF access to @data. And the semantics of memory barrier in it
+	 * also make sure the waiter will see the latest @data->got_token
+	 * once list_empty_careful() in finish_wait() returns true.
+	 */
 	list_del_init_careful(&curr->entry);
 	return 1;
 }
@@ -248,37 +256,55 @@ void rq_qos_wait(struct rq_wait *rqw, void *private_data,
 		 cleanup_cb_t *cleanup_cb)
 {
 	struct rq_qos_wait_data data = {
-		.rqw = rqw,
-		.cb = acquire_inflight_cb,
-		.private_data = private_data,
+		.rqw		= rqw,
+		.cb		= acquire_inflight_cb,
+		.private_data	= private_data,
+		.got_token	= false,
 	};
-	bool has_sleeper;
+	bool first_waiter;
 
-	has_sleeper = wq_has_sleeper(&rqw->wait);
-	if (!has_sleeper && acquire_inflight_cb(rqw, private_data))
+	/*
+	 * If there are no waiters in the waiting queue, try to increase the
+	 * inflight counter if we can. Otherwise, prepare for adding ourselves
+	 * to the waiting queue.
+	 */
+	if (!waitqueue_active(&rqw->wait) && acquire_inflight_cb(rqw, private_data))
 		return;
 
 	init_wait_func(&data.wq, rq_qos_wake_function);
-	has_sleeper = !prepare_to_wait_exclusive(&rqw->wait, &data.wq,
+	first_waiter = prepare_to_wait_exclusive(&rqw->wait, &data.wq,
 						 TASK_UNINTERRUPTIBLE);
+	/*
+	 * Make sure there is at least one inflight process; otherwise, waiters
+	 * will never be woken up. Since there may be no inflight process before
+	 * adding ourselves to the waiting queue above, we need to try to
+	 * increase the inflight counter for ourselves. And it is sufficient to
+	 * guarantee that at least the first waiter to enter the waiting queue
+	 * will re-check the waiting condition before going to sleep, thus
+	 * ensuring forward progress.
+	 */
+	if (!data.got_token && first_waiter && acquire_inflight_cb(rqw, private_data)) {
+		finish_wait(&rqw->wait, &data.wq);
+		/*
+		 * We raced with rq_qos_wake_function() getting a token,
+		 * which means we now have two. Put our local token
+		 * and wake anyone else potentially waiting for one.
+		 *
+		 * Enough memory barrier in list_empty_careful() in
+		 * finish_wait() is paired with list_del_init_careful()
+		 * in rq_qos_wake_function() to make sure we will see
+		 * the latest @data->got_token.
+		 */
+		if (data.got_token)
+			cleanup_cb(rqw, private_data);
+		return;
+	}
+
+	/* we are now relying on the waker to increase our inflight counter. */
 	do {
-		/* The memory barrier in set_current_state saves us here. */
 		if (data.got_token)
 			break;
-		if (!has_sleeper && acquire_inflight_cb(rqw, private_data)) {
-			finish_wait(&rqw->wait, &data.wq);
-
-			/*
-			 * We raced with rq_qos_wake_function() getting a token,
-			 * which means we now have two. Put our local token
-			 * and wake anyone else potentially waiting for one.
-			 */
-			if (data.got_token)
-				cleanup_cb(rqw, private_data);
-			return;
-		}
 		io_schedule();
-		has_sleeper = true;
 		set_current_state(TASK_UNINTERRUPTIBLE);
 	} while (1);
 	finish_wait(&rqw->wait, &data.wq);
-- 
2.20.1

