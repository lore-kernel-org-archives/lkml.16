Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342349641
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033644; cv=none; b=rFKyDpM3ZyLkcWquXsPBZ4uzBZ8n6hDhxRmKImwlNmbiMy8u45+fDKlsWl6EK4txkoFajRpQUJs1rZDDZKFJng07twxu7kiVilsZ8ft5z7S2sl2X/ZgfXgcFEMQMKO50TBeYFm08f4GY+LoRS2zoxy43Srw/wuNnmyt+Fdrx+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033644; c=relaxed/simple;
	bh=nBFMMBsghcHJzLgBobziMdH8ahuh+l61GC0hU05u+N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NusD+VRMChqAu4SfWAVc9NzNH+HfkqpqX7hZ1ws8bZFcI7Dn5JaHArZSuxBWgWf/s1HY9mLVIbgl4NCfJ7n3OpzU9rfEXbezJo+kXffiCNcXKIehTI67vN57POb7l5Tu2dET4hlRAIEgYedhi4JqOawQQRmahQw+eC2WFpu2X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8jw5LJZ; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8jw5LJZ"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-af5085f7861so2697515a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744033642; x=1744638442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqi69oZTtxiQ76XlmXeV3ooNl+Gv9DPSGvNyg2kJkx8=;
        b=Z8jw5LJZ1P6TpNv+S6EpvcpZi8YlVcj1629F277lq/rBUEE0Gk+RyId1Ui2AHxeJub
         2v80Na+h4XCAg2kuNeyA+HMJp38pf0bIzibszJuRgwLy8YW4A9nwrQv9C1w0oe/1NKVJ
         Ks1QwmgZM/IaUGiJlEueZ6V0Jyitms6IkbA+s0Sn/USyqB/spSbxLI6knF7ba4BWCDZW
         GZTO1txT+Q4psSovcvoDA0ws39AK/CvjZWJThggftJVNJ+HOTF9Vav6uea3G/UIbAjAN
         yWadTm9FH6R2r9fQTlCpC2pfmyumVTQi2UdolsMAmmG0PF77hEP7NvV4GoOgYW4Xcj/l
         FH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033642; x=1744638442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jqi69oZTtxiQ76XlmXeV3ooNl+Gv9DPSGvNyg2kJkx8=;
        b=G2AzdqY6/5517frm8wPNri1fsmxE1j7IUbBXsvjpBprQ+bAih0fsBCmRZrY8kX6WOb
         zI/4tQ4RAH2EsMbYfh8GYhg4aoN0OJF94xZNxdJ9kWYw5RDRZb2HOduUQD66T9l5k1nr
         gnpwa4ipe/duOW7ZNiBnIYoZI/kn6UM9te7jjoU+l2YNDh0X5prBQh9Quk8xSUaNlGKa
         tgARFtJsfuHTpF0bhbVoCS7Wuuq7v9m0bl7HSR2cVYb5CmLQPjKKmXeZhDbDdqEHQMSv
         /V1oH556Tm0c/4UcLvI+va/418SvT46OOd8YlJ41RVhXGILnlNNKOrKDVmFljz20W6kV
         SqEg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2724z6cGMWgZfyHzwfsUwGv6THQxElnhdPz/qZHDEg2Ub1NDuNLCL4FqWFYLAcSk9HhGyrTd7VtN8M0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoa6I0Uph+53KIEb4osrs7Bjf6GrymQWaJhW4/IRpiQ+E2L5Gp
	MB0kYcnzZxM2B157acRQLjzi8BOdVhEzFIqoPUMO0s5ffc1DZswU
X-Gm-Gg: ASbGnctC1HkQC3W/PycVxTn5734mgX5HW1rwAetsw8T/LOI5vL3/a9tyte4hYwO4WRm
	NMht8YQXK/v8RzBDyBkia54F5Blzf2OuMK2l/HEovQYzq7c+6hXuvNpU5qFO9f37P/zCu+83stf
	VxtEjPxvPwdKo9kYVxVXTGS1QNiQEtwzVlyi5FJbVPwi4rH+M+FW6sPAyV2q+uNE51Xtkzenq7/
	f6tFuAzRayVAHLTsfMd/jS+Cdr7v6VJ/V9GTwxlIt+LI9k0j8azH7OIV7VgJxWQH/f7Hl5sFca4
	BQpQnFkl8oHF/A4EAi7AI9Nohh9PyBivYBwfKz9kxNWZJI87ZA3OCu/EVc1NRj/m/iYed1yt
X-Google-Smtp-Source: AGHT+IGF3POrrpxSeXgGs9iUraO6GYQoPqRSmV2ULtdstn3j2U3sHLyUjOPqlvtrIAalRZbY4kQvCQ==
X-Received: by 2002:a17:90b:3a44:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-306a4900a4dmr17898712a91.28.1744033642476;
        Mon, 07 Apr 2025 06:47:22 -0700 (PDT)
Received: from localhost.localdomain ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a86asm8988418a91.32.2025.04.07.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:47:21 -0700 (PDT)
From: hupu <hupu.gm@gmail.com>
To: jstultz@google.com,
	linux-kernel@vger.kernel.org
Cc: juri.lelli@redhat.com,
	peterz@infradead.org,
	vschneid@redhat.com,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	hupu@transsion.com,
	hupu <hupu.gm@gmail.com>
Subject: [RFC 1/1] sched: Skip redundant operations for proxy tasks needing return migration
Date: Mon,  7 Apr 2025 21:47:12 +0800
Message-ID: <20250407134712.93062-1-hupu.gm@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the proxy_needs_return() check earlier in ttwu_runnable() to avoid
unnecessary scheduling operations when a proxy task requires return
migration to its original CPU.

The current implementation performs several operations (rq clock update,
enqueue, and wakeup preemption checks) before checking for return
migration needs. This is inefficient because:

1. For tasks needing return migration, these operations are redundant
   since the task will be dequeued from current rq anyway
2. The task may not even be allowed to run on current CPU due to
   possible affinity changes during blocking
3. The proper CPU selection will be handled by select_task_rq() in
   the subsequent try_to_wake_up() logic

By moving the proxy_needs_return() check to the beginning, we:
- Avoid unnecessary rq clock updates
- Skip redundant enqueue operations
- Eliminate meaningless wakeup preemption checks
- Let the normal wakeup path handle proper CPU selection

This optimization is particularly valuable in proxy execution scenarios
where tasks frequently migrate between CPUs.

Signed-off-by: hupu <hupu.gm@gmail.com>
---
 kernel/sched/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ca4ca739eb85..ebb4bc1800e3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4162,6 +4162,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 
 	rq = __task_rq_lock(p, &rf);
 	if (task_on_rq_queued(p)) {
+		if (proxy_needs_return(rq, p)) {
+			_trace_sched_pe_return_migration(p);
+			goto out;
+		}
 		update_rq_clock(rq);
 		if (p->se.sched_delayed) {
 			proxy_remove_from_sleeping_owner(p);
@@ -4174,10 +4178,6 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 			 */
 			wakeup_preempt(rq, p, wake_flags);
 		}
-		if (proxy_needs_return(rq, p)) {
-			_trace_sched_pe_return_migration(p);
-			goto out;
-		}
 		ttwu_do_wakeup(p);
 		ret = 1;
 	}
-- 
2.47.0

