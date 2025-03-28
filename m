Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490920E018
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131143; cv=none; b=nKl1QiFXAP6NSGmwPeh6tkSP1sXi/rTIZ6XSXhIQXbTzmve5+6LcXK67PxuO1lbFNJn50jiK761W5l9M8kqOisHYW6mrDrE2SL+xjQ3EhvCE/g+STYiVE9iDyjcObo05r9xs6a9tzzXvNJN6JaV+Ei7R/U6oEuVfsAaMHmlU4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131143; c=relaxed/simple;
	bh=NpK+r7ALcifoHeRmEAt0kU4Y5MdDPVNP414I2u3arWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPrbRys6/b/vJfzow6IjixLm9Uq/k0pJYPw1Ja6hi7RFrS2Z64Ubvwm1VHIYZ3YxO2SPTakqVqcmm2m1dZ5Nw209nXeDhOiUIaq7vuD8QV5kcR1Q9oCcZHYR5ByJrFu86zpJeDB0Sr3nppVS/14cNTrC+wgWseTQSuHBxVeGR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e78jHQT+; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e78jHQT+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743131131; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=yoAZb+W4Lc/VWZfROhrh9Zf7rVlu+D1yNr2/yUQE60o=;
	b=e78jHQT+8wuc2AI1fMJjrm3q4aOzPPuifLsTEzHkbbtmjlxwX15ZCRK76JzSkRZ4n3HL2tq73lY2jZVerFF5gm2ulqRrbYFutfNFCjNW1iZQwG8/82l1kbDKoDgj9ve5WX9XOw17cso3JCOVQSqGgDsi9sUDS8RkTSpLUmKh2SM=
Received: from j63c11469.sqa.eu95.tbsite.net(mailfrom:CruzZhao@linux.alibaba.com fp:SMTPD_---0WTCkHMh_1743131121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Mar 2025 11:05:30 +0800
From: Cruz Zhao <CruzZhao@linux.alibaba.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	boqun.feng@gmail.com,
	will@kernel.org,
	longman@redhat.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] percpu_rwsem: let percpu_rwsem writer get rwsem faster
Date: Fri, 28 Mar 2025 11:05:17 +0800
Message-ID: <20250328030519.897032-1-CruzZhao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the scenario where a large number of containers are created
at the same time, there will be a lot of tasks created in a
short time, and they will be written into cgroup.procs.

copy_process() will require the cgroup_threadgroup_rwsem read
lock, cgroup_procs_write will require the cgroup_threadgroup_rwsem
write lock. As the readers will pre-increase the read_count and
then check whether there is any writers, resulting that the
writer may be starving, especially when there is a steady stream
of readers.

To alleviate this problem, we add one more check whether there
are writers waiting before increasing the read_count, to make
writers getting lock faster.

Signed-off-by: Cruz Zhao <CruzZhao@linux.alibaba.com>
---
 kernel/locking/percpu-rwsem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
index 6083883c4fe0..66bf18c28b43 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -47,6 +47,11 @@ EXPORT_SYMBOL_GPL(percpu_free_rwsem);
 
 static bool __percpu_down_read_trylock(struct percpu_rw_semaphore *sem)
 {
+	if (unlikely(atomic_read_acquire(&sem->block))) {
+		rcuwait_wake_up(&sem->writer);
+		return false;
+	}
+
 	this_cpu_inc(*sem->read_count);
 
 	/*
-- 
2.43.5

