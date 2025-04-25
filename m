Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863EACA6B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745560734; cv=none; b=ld5vCgHuZbmh4zgIEoLhCYyF6naRpw0ZPQscZ3WaCiMkeBYCflhS+qCtrIG+W2OzVlBNADChH40+4Z2nr+dX2ggI0cUUD3WWtRXjnE+OQ67vRHgUfBIAvRPue9+w2nA+Mn8pTEok1bo2t7htnwcVOxvzFJuEozERbuqz8AOI6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745560734; c=relaxed/simple;
	bh=AdOJavv4npYf5qi/FV9klZc18su53xLTo15nOeaZ0TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NI+zlYcZaVYzzP3uXZJXnx9JngBGB0choMGTQFDpUdjkJ2g14CTQcGoCs49Ow1vkFbhYLL0Pb/K3fD5pk00nWSbNOx/gbQknq1z/SYIrgLWMVheGUA4dXP0DWugJc/HJtLPKnhDYz4t7U/QSbtJP1o/V2YHUGoGeZLUyHd6wNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QhL4QiIQ; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QhL4QiIQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745560729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UqRFw1HGFt9aldA9F5L+qq7nz8mn7YiHsUF7T9m0RxQ=;
	b=QhL4QiIQsxrZcLvzLR9zdIPpled4YvMMJC0hwvdSSb2G2tpcWsDCxL3cYTPXoVPRbO0NvB
	l+vSd5abvCtthV/CVFOfHbTtjTHdcb5RruupYpmR37H/iHge9WfFFJNDFrRtH+dYWVzIif
	uzCepK4TqRKiXq32H3S0n5x9aSzoVDE=
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
	Mateusz Guzik <mjguzik@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Joel Granados <joel.granados@kernel.org>,
	"Bill O'Donnell" <bodonnel@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH v2] pid: annotate data-races around pid_ns->pid_allocated
Date: Fri, 25 Apr 2025 13:58:14 +0800
Message-ID: <20250425055824.6930-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Suppress syzbot reports by annotating these accesses using data_race().

Reported-by: syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com
Reported-by: syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com
Reported-by: syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 kernel/fork.c          | 2 +-
 kernel/pid.c           | 8 ++++----
 kernel/pid_namespace.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index c4b26cd8998b..5aa050418fda 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2584,7 +2584,7 @@ __latent_entropy struct task_struct *copy_process(
 	rseq_fork(p, clone_flags);
 
 	/* Don't start children in a dying pid namespace */
-	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
+	if (unlikely(!(data_race(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING)))) {
 		retval = -ENOMEM;
 		goto bad_fork_core_free;
 	}
diff --git a/kernel/pid.c b/kernel/pid.c
index 4ac2ce46817f..df59228dd27e 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -122,7 +122,7 @@ void free_pid(struct pid *pid)
 	for (i = 0; i <= pid->level; i++) {
 		struct upid *upid = pid->numbers + i;
 		struct pid_namespace *ns = upid->ns;
-		switch (--ns->pid_allocated) {
+		switch (data_race(--ns->pid_allocated)) {
 		case 2:
 		case 1:
 			/* When all that is left in the pid namespace
@@ -134,7 +134,7 @@ void free_pid(struct pid *pid)
 		case PIDNS_ADDING:
 			/* Handle a fork failure of the first process */
 			WARN_ON(ns->child_reaper);
-			ns->pid_allocated = 0;
+			data_race(ns->pid_allocated = 0);
 			break;
 		}
 
@@ -271,13 +271,13 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 	upid = pid->numbers + ns->level;
 	idr_preload(GFP_KERNEL);
 	spin_lock(&pidmap_lock);
-	if (!(ns->pid_allocated & PIDNS_ADDING))
+	if (!(data_race(ns->pid_allocated & PIDNS_ADDING)))
 		goto out_unlock;
 	pidfs_add_pid(pid);
 	for ( ; upid >= pid->numbers; --upid) {
 		/* Make the PID visible to find_pid_ns. */
 		idr_replace(&upid->ns->idr, pid, upid->nr);
-		upid->ns->pid_allocated++;
+		data_race(upid->ns->pid_allocated++);
 	}
 	spin_unlock(&pidmap_lock);
 	idr_preload_end();
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 7098ed44e717..6e2a32641904 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -268,7 +268,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_ns)
 	 */
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
-		if (pid_ns->pid_allocated == init_pids)
+		if (data_race(pid_ns->pid_allocated == init_pids))
 			break;
 		schedule();
 	}
-- 
2.47.1

