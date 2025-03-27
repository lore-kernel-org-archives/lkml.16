Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C2F2AE95
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082192; cv=none; b=memlbSyKgJH71Vl3JgDrErWTLz52+oK5IodaD4z70P+I0k719CJq50oGG9SharKPedKuPTCm82sFCQCWYQ3++KGU80D8Q9uPYJqMgvD6Kcgut43mgdhEHlQnQJn46bPk7GYsn+TjIG73W4XUlHE1f6zQUVaA8sQMmwEH3d/bQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082192; c=relaxed/simple;
	bh=9x+Qdmup/ni1pNYnI9PBa/S/fYuuJwwfsn5CUetikps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=msAieXEY0m87njXMGwjUGowxQzj75ft2VHX7OxtJ3wWkQAAPWiGPGfjl+DjtyaWMG9YSk0CPyzR5K/g5rAGnJQhJd5QPaFq/5aLtJBfs6SsmCQe2rSQHGn2UbrQAnxFsqpljzLM975xZuQdTzjlUx2iqzNvJ7ikR9Van6x48XzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=J/eNieq6; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="J/eNieq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1743082189;
	bh=9x+Qdmup/ni1pNYnI9PBa/S/fYuuJwwfsn5CUetikps=;
	h=From:To:Cc:Subject:Date:From;
	b=J/eNieq6wxvHjdCaL9lIeKST5UA8J4BbTVZOCvC9WJpyu2Vgb1QBnPeuO+mIwZc4q
	 G9GZ70AeUBRrvYDAMYlT2qOEOrva2LAeiURI6B8P71UPx4kP2WcgA+fWQllNaqwdc2
	 k0UOoDPVBIV0zPcNvkGmiLE1OjrV+HrMKigUxWGfIbt/6a1EH8bxoQ0p9DmvVcRSO7
	 KQ194F6pwdEsnZd76SVS6YGEjpQuXkBTJHG3PeO6ZSyIOgwDLhnhGuVlIiEZWuUyxC
	 5ZkvWmPu1wrA0Ngqdzj5e0EQD2BiBcDQeKHDep1azn6Eg47cQr/Q3RALSr44CwCWI2
	 UQ5ACRpjabLIQ==
Received: from thinkos.internal.efficios.com (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4ZNkzK5B2Gzj6G;
	Thu, 27 Mar 2025 09:29:49 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [RFC PATCH v2] rseq: Eliminate useless task_work on execve
Date: Thu, 27 Mar 2025 09:29:45 -0400
Message-Id: <20250327132945.1558783-1-mathieu.desnoyers@efficios.com>
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

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Michael Jeanson <mjeanson@efficios.com>
---
Changes since v1:
- Build fix: t -> current.
---
 fs/exec.c           | 3 ++-
 kernel/sched/core.c | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 506cd411f4ac..e8a9a6aa5ab2 100644
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
+	rseq_set_notify_resume(current);
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

