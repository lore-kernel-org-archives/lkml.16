Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126C31BD9D2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282445; cv=none; b=pJyBxyKEO57ftUli/YIK/+KM8kirXxAjYNveV7PgIq49pW3wPexBnPwDBAu2pMFSR9jFpenIsqVJPyyBxZET8U3wxLwJER2Ry9XOJdIHXRXFtoKohAdYcOPYHUwTDVWMtAaYSP613Cjvy3VsExeEfYBJWZ4MCgGwNh4MRv0y45o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282445; c=relaxed/simple;
	bh=mElTIDNmwZ7fK6qrnxRJ04kEFdbRW5if+3ez1/ReoNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=tFxG6Dm/MGdOf51gioV8f/9WF3eC+RpMccls/EcXg89JFjBPwm+VA49o52gpcUsOSy5/KVDef9di2P4IjBvH3LormIGn5S+lO5oYYtB/tGiSuIuBrw6EZ/UHvUjJNAp0MuTUU3aaJyKhvZ8HUg/aMUkeEvqRjBM1b8ENCJ532RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvJ0ZQvi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvJ0ZQvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739282443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MDx1cxlwBHqL2iEqH7fQi+QDvcjuYEFYsmccUdipaBA=;
	b=dvJ0ZQviw9idvPHqo7q3hXN7/JHgGqt3RgRgcLL449c8lw5giBnX8KYJ1/BHBJZs07Gy5e
	ixR4JSNbhQloEx3NoAFzuZujyxYgPk8QfiLbOofc2YXhO2tBpor54m6CTcLzqj+B8vy9zQ
	2iSHl2JtFByfPUDFsOy+Aq7/m1FiQEg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-fwb6Qg7pOq6ATimer-YoIQ-1; Tue,
 11 Feb 2025 09:00:41 -0500
X-MC-Unique: fwb6Qg7pOq6ATimer-YoIQ-1
X-Mimecast-MFC-AGG-ID: fwb6Qg7pOq6ATimer-YoIQ_1739282440
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 227BA1955E83;
	Tue, 11 Feb 2025 14:00:40 +0000 (UTC)
Received: from isengard.. (vm-10-0-109-147.hosted.upshift.rdu2.redhat.com [10.0.109.147])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBCBF1956094;
	Tue, 11 Feb 2025 14:00:38 +0000 (UTC)
From: Phil Auld <pauld@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [CHANGE 1/2] sched/isolation: Make use of more than one housekeeping cpu
Date: Tue, 11 Feb 2025 14:01:04 +0000
Message-ID: <20250211140104.420739-1-pauld@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The exising code uses housekeeping_any_cpu() to select a cpu for
a given housekeeping task. However, this often ends up calling
cpumask_any_and() which is defined as cpumask_first_and() which has
the effect of alyways using the first cpu among those available.

The same applies when multiple NUMA nodes are involved. In that
case the first cpu in the local node is chosen which does provide
a bit of spreading but with multiple HK cpus per node the same
issues arise.

Spread the HK work out by having housekeeping_any_cpu() and
sched_numa_find_closest() use cpumask_any_and_distribute()
instead of cpumask_any_and().

Signed-off-by: Phil Auld <pauld@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/sched/isolation.c | 2 +-
 kernel/sched/topology.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 81bc8b329ef1..93b038d48900 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -40,7 +40,7 @@ int housekeeping_any_cpu(enum hk_type type)
 			if (cpu < nr_cpu_ids)
 				return cpu;
 
-			cpu = cpumask_any_and(housekeeping.cpumasks[type], cpu_online_mask);
+			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
 			if (likely(cpu < nr_cpu_ids))
 				return cpu;
 			/*
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index c49aea8c1025..94133f843485 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2101,7 +2101,7 @@ int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
 	for (i = 0; i < sched_domains_numa_levels; i++) {
 		if (!masks[i][j])
 			break;
-		cpu = cpumask_any_and(cpus, masks[i][j]);
+		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
 		if (cpu < nr_cpu_ids) {
 			found = cpu;
 			break;
-- 
2.47.1

