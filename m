Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059992F2A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174244; cv=none; b=CPINmC2UCeu/TvvDcZyhakbgvpROJYdp5yRs/HQaJim4KRx/LyYQIxSdiQJv/fsxqYdE5DpdIojw9xHN7c9mzFaALoF5KM76ru35fINIcgu3Oxy+gS7xqOl6279lLQPhonD0v3y7UTwvvWkLk/CLeaNh7dp3u6uSsAxRLqwAZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174244; c=relaxed/simple;
	bh=hXKMFjUxmniwLPmXl/zrhJcXY2dfco4gVE9XyWgbOhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAsFRptzk3AANjf3ddkhl7Tqi0eBZRHzCRK45GSn5zBpX4vGC3KYhpUO8ifSbHHQcNzLoEwbP0ZPzR3+W0oKcr/qlUZxA9eJLtqKAZrJjpJPaqfpRww9dVO1q3OBWa9QPV0QMC9zvEEDpJ0N4QxAPimmnDkoPCJeeU6/+gYhQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cI8H2gcO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cI8H2gcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739174241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5B84Awu6JUpstdhEM0yzA51Ej2LPUV/BX8OiM6ds56M=;
	b=cI8H2gcOF/enGAj4bGF92ahx7YK7V1Bhv8yUsPjQyEDtRKS58qYp65D6znXPrNpEBYgjlD
	cTIKmSdpxB/shKqPaSFkcDdQzBvcMToXt/WG87Uz61sudszUeIXE/mIMSk1V0d16ggaMSJ
	MFGLyrsn9Xb/9rA/wGW7hOI7rLvaVPs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-YoSmS7_WMR-TI_Kzta_21Q-1; Mon,
 10 Feb 2025 02:57:16 -0500
X-MC-Unique: YoSmS7_WMR-TI_Kzta_21Q-1
X-Mimecast-MFC-AGG-ID: YoSmS7_WMR-TI_Kzta_21Q
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40BF01956095;
	Mon, 10 Feb 2025 07:57:14 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 861531800358;
	Mon, 10 Feb 2025 07:57:10 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Marco Elver <elver@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v5 1/3] sched: Compact RSEQ concurrency IDs with reduced threads and affinity
Date: Mon, 10 Feb 2025 08:57:00 +0100
Message-ID: <20250210075703.79125-2-gmonaco@redhat.com>
In-Reply-To: <20250210075703.79125-1-gmonaco@redhat.com>
References: <20250210075703.79125-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

When a process reduces its number of threads or clears bits in its CPU
affinity mask, the mm_cid allocation should eventually converge towards
smaller values.

However, the change introduced by:

commit 7e019dcc470f ("sched: Improve cache locality of RSEQ concurrency
IDs for intermittent workloads")

adds a per-mm/CPU recent_cid which is never unset unless a thread
migrates.

This is a tradeoff between:

A) Preserving cache locality after a transition from many threads to few
   threads, or after reducing the hamming weight of the allowed CPU mask.

B) Making the mm_cid upper bounds wrt nr threads and allowed CPU mask
   easy to document and understand.

C) Allowing applications to eventually react to mm_cid compaction after
   reduction of the nr threads or allowed CPU mask, making the tracking
   of mm_cid compaction easier by shrinking it back towards 0 or not.

D) Making sure applications that periodically reduce and then increase
   again the nr threads or allowed CPU mask still benefit from good
   cache locality with mm_cid.

Introduce the following changes:

* After shrinking the number of threads or reducing the number of
  allowed CPUs, reduce the value of max_nr_cid so expansion of CID
  allocation will preserve cache locality if the number of threads or
  allowed CPUs increase again.

* Only re-use a recent_cid if it is within the max_nr_cid upper bound,
  else find the first available CID.

Fixes: 7e019dcc470f ("sched: Improve cache locality of RSEQ concurrency IDs for intermittent workloads")
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>
Cc: Ingo Molnar <mingo@kernel.org>
Tested-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/linux/mm_types.h |  7 ++++---
 kernel/sched/sched.h     | 25 ++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6b27db7f94963..0234f14f2aa6b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -875,10 +875,11 @@ struct mm_struct {
 		 */
 		unsigned int nr_cpus_allowed;
 		/**
-		 * @max_nr_cid: Maximum number of concurrency IDs allocated.
+		 * @max_nr_cid: Maximum number of allowed concurrency
+		 *              IDs allocated.
 		 *
-		 * Track the highest number of concurrency IDs allocated for the
-		 * mm.
+		 * Track the highest number of allowed concurrency IDs
+		 * allocated for the mm.
 		 */
 		atomic_t max_nr_cid;
 		/**
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 38e0e323dda26..606c96b74ebfa 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3698,10 +3698,28 @@ static inline int __mm_cid_try_get(struct task_struct *t, struct mm_struct *mm)
 {
 	struct cpumask *cidmask = mm_cidmask(mm);
 	struct mm_cid __percpu *pcpu_cid = mm->pcpu_cid;
-	int cid = __this_cpu_read(pcpu_cid->recent_cid);
+	int cid, max_nr_cid, allowed_max_nr_cid;
 
+	/*
+	 * After shrinking the number of threads or reducing the number
+	 * of allowed cpus, reduce the value of max_nr_cid so expansion
+	 * of cid allocation will preserve cache locality if the number
+	 * of threads or allowed cpus increase again.
+	 */
+	max_nr_cid = atomic_read(&mm->max_nr_cid);
+	while ((allowed_max_nr_cid = min_t(int, READ_ONCE(mm->nr_cpus_allowed),
+					   atomic_read(&mm->mm_users))),
+	       max_nr_cid > allowed_max_nr_cid) {
+		/* atomic_try_cmpxchg loads previous mm->max_nr_cid into max_nr_cid. */
+		if (atomic_try_cmpxchg(&mm->max_nr_cid, &max_nr_cid, allowed_max_nr_cid)) {
+			max_nr_cid = allowed_max_nr_cid;
+			break;
+		}
+	}
 	/* Try to re-use recent cid. This improves cache locality. */
-	if (!mm_cid_is_unset(cid) && !cpumask_test_and_set_cpu(cid, cidmask))
+	cid = __this_cpu_read(pcpu_cid->recent_cid);
+	if (!mm_cid_is_unset(cid) && cid < max_nr_cid &&
+	    !cpumask_test_and_set_cpu(cid, cidmask))
 		return cid;
 	/*
 	 * Expand cid allocation if the maximum number of concurrency
@@ -3709,8 +3727,9 @@ static inline int __mm_cid_try_get(struct task_struct *t, struct mm_struct *mm)
 	 * and number of threads. Expanding cid allocation as much as
 	 * possible improves cache locality.
 	 */
-	cid = atomic_read(&mm->max_nr_cid);
+	cid = max_nr_cid;
 	while (cid < READ_ONCE(mm->nr_cpus_allowed) && cid < atomic_read(&mm->mm_users)) {
+		/* atomic_try_cmpxchg loads previous mm->max_nr_cid into cid. */
 		if (!atomic_try_cmpxchg(&mm->max_nr_cid, &cid, cid + 1))
 			continue;
 		if (!cpumask_test_and_set_cpu(cid, cidmask))
-- 
2.48.1

