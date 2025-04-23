Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBC1FF5E3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409406; cv=none; b=YXJfoBrE4/Tq1z/+9zHt+oU9+/apz76kSGz28+n9cMtoy+1dGTclpkIbYaLhXjtzmbr8OiZk1O05ZqoPW5Dd8TMj/d1co1OX78EjT7FLgn5nro0SDSpQ1h5jRwzB6SgDNoJ0OQKNEPgGdqPbR5MPnLbw9IOrjdNMsChsS6XY4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409406; c=relaxed/simple;
	bh=hiy2hruOobYyT54qMhvJ/RZzWSPHo+8rh+k6mCl3t40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIialtuBSbk7USPrYNeQKWuzQ+fhXA8zvjArmyHqAG7u+HU/rs2mLGH+erklLObL8iXnBv1l4GyzIs9W9L7T451CDweNPWmDUb/xUsjO5iVg6bbs4daabh8AFtqD3W6iWdapgOgzan5Pn3wMi0NUu0N92K1Z5ktNPkmWPS8Vt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OH/MmTyK; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OH/MmTyK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745409400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1K1uG+dD8exlj3POnoa7cZS/iOBcShi5OhOWYPntaKw=;
	b=OH/MmTyK1e9HdC51om9g1+8x7rqAPKptAGoY95gBmco0TRKXo+ndopdOGRaS5sDSi1KOKT
	YaLyaCClP9wPG1YPrVVvNVc+6NqxThsCpNvG52E/HhPV1UakU2cMk7SV+/+E7MR77qI1nz
	pPz/z8DlujcrmCifT+xBHMF4qe7FzIA=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: mrpre@163.com,
	mkoutny@suse.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
	syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Oleg Nesterov <oleg@redhat.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Joel Granados <joel.granados@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Wei Liu <wei.liu@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
Date: Wed, 23 Apr 2025 19:55:32 +0800
Message-ID: <20250423115542.7081-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Suppress syzbot reports by annotating these accesses using
READ_ONCE() / WRITE_ONCE().

Reported-by: syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com
Reported-by: syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com
Reported-by: syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 kernel/fork.c          | 2 +-
 kernel/pid.c           | 7 ++++---
 kernel/pid_namespace.c | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b..1966ddea150d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2584,7 +2584,7 @@ __latent_entropy struct task_struct *copy_process(
 	rseq_fork(p, clone_flags);
 
 	/* Don't start children in a dying pid namespace */
-	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
+	if (unlikely(!(READ_ONCE(ns_of_pid(pid)->pid_allocated) & PIDNS_ADDING))) {
 		retval = -ENOMEM;
 		goto bad_fork_core_free;
 	}
diff --git a/kernel/pid.c b/kernel/pid.c
index 4ac2ce46817f..47e74457572f 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
 	for (i = 0; i <= pid->level; i++) {
 		struct upid *upid = pid->numbers + i;
 		struct pid_namespace *ns = upid->ns;
-		switch (--ns->pid_allocated) {
+		WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) - 1);
+		switch (READ_ONCE(ns->pid_allocated)) {
 		case 2:
 		case 1:
 			/* When all that is left in the pid namespace
@@ -271,13 +272,13 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 	upid = pid->numbers + ns->level;
 	idr_preload(GFP_KERNEL);
 	spin_lock(&pidmap_lock);
-	if (!(ns->pid_allocated & PIDNS_ADDING))
+	if (!(READ_ONCE(ns->pid_allocated) & PIDNS_ADDING))
 		goto out_unlock;
 	pidfs_add_pid(pid);
 	for ( ; upid >= pid->numbers; --upid) {
 		/* Make the PID visible to find_pid_ns. */
 		idr_replace(&upid->ns->idr, pid, upid->nr);
-		upid->ns->pid_allocated++;
+		WRITE_ONCE(upid->ns->pid_allocated, READ_ONCE(upid->ns->pid_allocated) + 1);
 	}
 	spin_unlock(&pidmap_lock);
 	idr_preload_end();
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 7098ed44e717..148f7789d6f3 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -268,7 +268,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 	 */
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		if (pid_ns->pid_allocated == init_pids)
+		if (READ_ONCE(pid_ns->pid_allocated) == init_pids)
 			break;
 		schedule();
 	}
-- 
2.47.1

