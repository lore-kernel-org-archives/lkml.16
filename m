Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D20248F6A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419926; cv=none; b=CpIb3ruSGfWOCLT1ZemFxhK8XvU1LZw6oLEKQ6f/sQJ+jrxsOw1+w38nQSo06MbJwkVAczwnAkyHFJ5+TQpuIvKfEyNVFLxQhx5ROfxDwZEpbMIo2G1irxUgY4KowS4hLfJGlGCxbdEQyuoPHdy174PmPlCvG3d71T4ApO7tVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419926; c=relaxed/simple;
	bh=EWBGbiAoT9c7/GC67CiLl0LDzZ4HPT2SbxPRGmzMgYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRee8a9VydQwLXbUnho3BzVhPAqIUXCnRZrFqNxkf1FYKGAA6eEmkc93TL45Dj9JFPTp6eRnQ0c0B55OJNILcX4NoNvrJ3n+eN6w3TvglEIYzJy8qsAfdZNfQiowdkwqP0KlGR1CSdjXBLs/qYpeO8F477AI6YoRvGEcQAqlDBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwX1b/+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwX1b/+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB5AC4CEEB;
	Wed, 28 May 2025 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419926;
	bh=EWBGbiAoT9c7/GC67CiLl0LDzZ4HPT2SbxPRGmzMgYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iwX1b/+CZjdfcTZIjSLQ1CxOgkjSd/9P5M3zefKWRKcYC/gESUzVeHYji2rMT3iDc
	 fR+zJBjxcFBxKLUsAAhUHwzQPC2cY38YKR6J4u+AWFSrUVnAdLE8NhbnLhoiMHRwdi
	 ocinKFFfRWx1og3EfReT6xHCxSh+tdY8RXvZ2wdTVAeM42h54k0pHeguGzFKIHs7mA
	 N1PqexnDHyDOo7SLzC+QYOD0ngOm+5m676b6SLK2qD7CsX9I7u7UJyvpXQ+8AYcXIV
	 UjHJvSrnCvoCZBXUxcyT0SJRTSJQpRLE/eVLZPP+zPqaYl9apuzP2QHqIbGzOq0wfN
	 Mpn/Ak2OzW2kw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 39/43] sched/smp: Use the SMP version of task_on_cpu()
Date: Wed, 28 May 2025 10:09:20 +0200
Message-ID: <20250528080924.2273858-40-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 28e2847a3584..fbc9d25a3e6c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2237,11 +2237,7 @@ static inline int task_current_donor(struct rq *rq, struct task_struct *p)
 
 static inline int task_on_cpu(struct rq *rq, struct task_struct *p)
 {
-#ifdef CONFIG_SMP
 	return p->on_cpu;
-#else
-	return task_current(rq, p);
-#endif
 }
 
 static inline int task_on_rq_queued(struct task_struct *p)
-- 
2.45.2

