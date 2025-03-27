Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BF21506B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082028; cv=none; b=m5rHOrH0z2KFY6ZzLk/uK2h0e6DHZq5Oylm7JK9Ll3aQq/SLFT8jI5djav0AuQ3/qOfFvHVgfLNaVaAu0xkfx65yp42yoN3QBcjKfkdYFaffaQfhcfFy2NDyZuBJ6TqxpfU5zzLPII56yZp+ELfVp+aQGvqjlI5X5QE4gjC+oP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082028; c=relaxed/simple;
	bh=5k6rqNGPiuhS9+h0L+ZMHxF4b7f+7c8CGV87z80J/54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eXeVB6tbU3OkzhSpzl1n41IZDQBD+BOtj3LC0vJ7Z5+m9wi5zN6e1GtlmkfIq2RkvoRIy1rOB7Wg14VcTnqke5+MgOTT2xzalMwVBWHK6F5juCCFmBDBpYT/Azgv5zTyCw9iwWO5nMP4fwlB8CX5PY7WaQDCJnauw49ZxV7doxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=sCHktAAQ; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="sCHktAAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1743081649;
	bh=5k6rqNGPiuhS9+h0L+ZMHxF4b7f+7c8CGV87z80J/54=;
	h=From:To:Cc:Subject:Date:From;
	b=sCHktAAQb0k5/uqypds4IN9qqtc89DrDYUEgn65EUrVvCYLAiNLoq6mwKfznC0hYv
	 e3sfLXx7D0ZsTSXBP5RW6ymArFxdijJpi2jjwp6UoTRonc8Fd8TfWqt4f0el4n8PDj
	 4qMwIm7wDK1StA8h0L6K8mn/bynO9wUqnQT4cf4F7GNb6hfEnd77A45Xg1HNvk9fRy
	 Cd9z+kkw2HO8v0zRdG0aiECuho3gIc7N2re9J2CSTm+WbcVW7VrYp+LKsLJdhocHGN
	 eHYqHha8oxrPbch4oirhCSk5HD4KuT9hIfQDmQ/4bPopkptO1fU9jKWKiPJcGuyYD6
	 XfM4R8CWzvg/A==
Received: from thinkos.internal.efficios.com (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4ZNkmx2H2VzhrY;
	Thu, 27 Mar 2025 09:20:49 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [RFC PATCH 1/1] rseq: Eliminate useless task_work on execve
Date: Thu, 27 Mar 2025 09:20:41 -0400
Message-Id: <20250327132041.1548426-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate a useless task_work on execve by moving the call to
rseq_set_notify_resume() from sched_mm_cid_after_execve() to the error
path of bprm_execve(),

The call to rseq_set_notify_resume() from sched_mm_cid_after_execve() is
pointless in the success case, because rseq_execve() will clear the rseq
pointer before returning to userspace.

sched_mm_cid_after_execve() is called from both the success and error
paths of bprm_execve(). The call to rseq_set_notify_resume() is needed
on error because the mm_cid may have changed.

Reported-by: Mateusz Guzik <mjguzik@gmail.com>
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Michael Jeanson <mjeanson@efficios.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/exec.c           | 3 ++-
 kernel/sched/core.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 506cd411f4ac..35ee689ec00a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1861,10 +1861,10 @@ static int bprm_execve(struct linux_binprm *bprm)
 		goto out;
 
 	sched_mm_cid_after_execve(current);
+	rseq_execve(current);
 	/* execve succeeded */
 	current->fs->in_exec = 0;
 	current->in_execve = 0;
-	rseq_execve(current);
 	user_events_execve(current);
 	acct_update_integrals(current);
 	task_numa_free(current, false);
@@ -1881,6 +1881,7 @@ static int bprm_execve(struct linux_binprm *bprm)
 		force_fatal_sig(SIGSEGV);
 
 	sched_mm_cid_after_execve(current);
+	rseq_set_notify_resume(t);
 	current->fs->in_exec = 0;
 	current->in_execve = 0;
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 042351c7afce..e59a4e2a6453 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10652,7 +10652,6 @@ void sched_mm_cid_after_execve(struct task_struct *t)
 		smp_mb();
 		t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, mm);
 	}
-	rseq_set_notify_resume(t);
 }
 
 void sched_mm_cid_fork(struct task_struct *t)
-- 
2.39.5

