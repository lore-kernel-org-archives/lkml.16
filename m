Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441362AD25
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 03:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749957036; cv=none; b=bAzqLwZtsw2/HZ31tdOC3W54dRTdl3PXQSBXssn9PGAbvDQSXL3DLAdwPwBQjQzelH8p/0dbzkmlTBGV53ZdncwF5Tjg51KrTtM5SE/XtldnwLrnOVXuesLZZ8FNJZbEODo7W9jwlSNUOULWf6UTDSJs9Ib/O+bDPCBkIuNAqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749957036; c=relaxed/simple;
	bh=KfHW9rm2SVk63FWRRM417YEjh43An5AKzWmrKUsZZPc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZ/stD0hsBiI5I6FZB9ZmVxI21DqwRJhcSMgIpw3HGOCyc18g84am7xqwAV51qjTP9MajoIeK9ALu8JWq0NKJkk4LK8zLez9W7kuIrDE3bv0V7BPzwv0salvx8+uz3MQ0bSr3YhRpa2f8kKQtHLRsgKs1xLYb7csTuTxl2i4xiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Fushuai Wang <wangfushuai@baidu.com>
To: <oleg@redhat.com>, <brauner@kernel.org>, <akpm@linux-foundation.org>,
	<mjguzik@gmail.com>
CC: <mhocko@suse.com>, <andrii@kernel.org>, <pasha.tatashin@soleen.com>,
	<linux-kernel@vger.kernel.org>, Fushuai Wang <wangfushuai@baidu.com>
Subject: [PATCH] exit: fix misleading comment in forget_original_parent()
Date: Sun, 15 Jun 2025 11:09:30 +0800
Message-ID: <20250615030930.58051-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc7.internal.baidu.com (172.31.3.17) To
 bjkjy-mail-ex22.internal.baidu.com (172.31.50.16)
X-FEAS-Client-IP: 172.31.50.16
X-FE-Policy-ID: 52:10:53:SYSTEM

The commit 482a3767e508 ("exit: reparent: call forget_original_parent()
under tasklist_lock") moved the comment from exit_notify() to
forget_original_parent(). However, the forget_original_parent() only
handles (A), while (B) is handled in kill_orphaned_pgrp(). So remove
the unrelated part.

Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 kernel/exit.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index bd743900354c..a7ba9178fe34 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -692,12 +692,7 @@ static void reparent_leader(struct task_struct *father, struct task_struct *p,
 }
 
 /*
- * This does two things:
- *
- * A.  Make init inherit all the child processes
- * B.  Check to see if any process groups have become orphaned
- *	as a result of our exiting, and if they have any stopped
- *	jobs, send them a SIGHUP and then a SIGCONT.  (POSIX 3.2.2.2)
+ * Make init inherit all the child processes
  */
 static void forget_original_parent(struct task_struct *father,
 					struct list_head *dead)
-- 
2.36.1

