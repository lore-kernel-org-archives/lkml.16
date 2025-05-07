Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC728E578
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642643; cv=none; b=ji7eFObb2leNJNVRyn2SSI4e1PLDKOw45SARLz8tJS0ubXE4o5NAA9sx6txXP9QFzQbYpmXGgnpxU3F+y+d9Mf6+OiFrZY3xugoopCDlIwP/Nvozytf1TV7iO72xz9wfOUK0WeMKD1Rtm1TaQCG2tL0S/lm76xkp6O1jad9J3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642643; c=relaxed/simple;
	bh=N2sGjyf0ew84NvwqalybuidwPrX4ySiWi0Sblpa+XV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofIVbZIVuYVbCoWl7o4NP44SDpUVXE8Fz6SO1WTi6rJdPkqmhyHScdirKpxhwZH7MvxDrWF1ejNcQr7DtvC8veXO4HMwhpL/4YfBamrCZDKr4YWrTz/yawu+RC5rBX+GmoWu3CsX3I9sm2ot9CS7OBcO8/38JCXDVdPkcjJir/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/zuspSZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/zuspSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746642637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H7D8p2kvyzYhC1aQiNjgJ3Kur9pgjMPJPiAXQiYVvL4=;
	b=c/zuspSZV4G9P0e1roXunFWc86A57cBhOHjV3RVIn5hfQnuH5Zq04NitoREAHrC+POJPnb
	aOc+wlNziok28rxfFKh1zOprtBo8558MfcbUuzod9CNowLTPInjoduwH4ZM4iKbstST3L9
	5mW91Ig4fMe4nULkb7em4Du9BZF3PEc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-lBb3vKCgNcqPJx8hribFQw-1; Wed,
 07 May 2025 14:30:31 -0400
X-MC-Unique: lBb3vKCgNcqPJx8hribFQw-1
X-Mimecast-MFC-AGG-ID: lBb3vKCgNcqPJx8hribFQw_1746642630
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 19E011955DC5;
	Wed,  7 May 2025 18:30:30 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.66.1])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5183619560A7;
	Wed,  7 May 2025 18:30:28 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] cgroup/cpuset: Extend kthread_is_per_cpu() check to all PF_NO_SETAFFINITY tasks
Date: Wed,  7 May 2025 14:30:11 -0400
Message-ID: <20250507183011.550307-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Commit ec5fbdfb99d1 ("cgroup/cpuset: Enable update_tasks_cpumask()
on top_cpuset") enabled us to pull CPUs dedicated to child partitions
from tasks in top_cpuset by ignoring per cpu kthreads. However, there
can be other kthreads that are not per cpu but have PF_NO_SETAFFINITY
flag set to indicate that we shouldn't mess with their CPU affinity.

As all the per cpu kthreads have PF_NO_SETAFFINITY set, fix this
issue by dropping the kthread_is_per_cpu() check and checking the
PF_NO_SETAFFINITY flag instead.

Fixes: ec5fbdfb99d1 ("cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index d0143b3dce47..581032d73e4b 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1130,9 +1130,9 @@ void cpuset_update_tasks_cpumask(struct cpuset *cs, struct cpumask *new_cpus)
 
 		if (top_cs) {
 			/*
-			 * Percpu kthreads in top_cpuset are ignored
+			 * PF_NO_SETAFFINITY tasks are ignored
 			 */
-			if (kthread_is_per_cpu(task))
+			if (task->flags & PF_NO_SETAFFINITY)
 				continue;
 			cpumask_andnot(new_cpus, possible_mask, subpartitions_cpus);
 		} else {
-- 
2.49.0

