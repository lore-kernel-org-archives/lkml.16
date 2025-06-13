Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FA256C73
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805967; cv=none; b=Rk6Aedq7y6YbbV5n54vmRXVGR6yCkJFb5cGS2OidK8DXwWlxcnNjwyXHiW0TSygq8qfF3P6gn/0vR8C6XAaaVbBVJJGFQ7hfzW1VhFWIvD7Rf78BTCiz0BMH8U4zbx45aRl52TfECvh+0BC16WMYaPtcuBWXdoW5bLiVIlMA1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805967; c=relaxed/simple;
	bh=EgO8/J9TSK3lp0A/jEDvE/1XywlIpLg9jc743Hm3wEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIvepMBs11BomAfkQu2WenBuABGaefo/TD0VqpCy5ACHPyFtamCwgGa6vEzoOwAMwb9l3fj2MLbxOKcfHifXWQIH8Fnjte8M16UStFonR3Wnai8dYRyhDch51rpPeb5B/o0/O3fNqFMkrYnU+vzHfEmXh3+V7BmO1iuBx6jqVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bfrr+YQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bfrr+YQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749805961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gI9A1k+Ki5u23efPFWRrnCYNlK9q/HjuOqpPPLtHuu8=;
	b=Bfrr+YQ/lEMuCNEJs5/gyet/MYA746ly2tML/pl4stmSSjjI07MY49crMBFTo0Oe5IJjO2
	OlQfGLLL4LfRVxvzpz4/1hMTwqrPMo0YleQ/zNorDGuQfIwvS8zEiKQZw43OGCm7x1sstS
	J7qtw8i750ITEhPqRtYano1N66hySjk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-s3c_pIO2OwyyedDnE8HTuQ-1; Fri,
 13 Jun 2025 05:12:40 -0400
X-MC-Unique: s3c_pIO2OwyyedDnE8HTuQ-1
X-Mimecast-MFC-AGG-ID: s3c_pIO2OwyyedDnE8HTuQ_1749805959
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22A26180136B;
	Fri, 13 Jun 2025 09:12:39 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.102])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7036A195E340;
	Fri, 13 Jun 2025 09:12:36 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [RESEND PATCH v13 0/3] sched: Restructure task_mm_cid_work for predictability
Date: Fri, 13 Jun 2025 11:12:25 +0200
Message-ID: <20250613091229.21500-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This patchset moves the task_mm_cid_work to a preemptible and migratable
context. This reduces the impact of this work to the scheduling latency
of real time tasks.
The change makes the recurrence of the task a bit more predictable.

The behaviour causing latency was introduced in commit 223baf9d17f2
("sched: Fix performance regression introduced by mm_cid") which
introduced a task work tied to the scheduler tick.
That approach presents two possible issues:
* the task work runs before returning to user and causes, in fact, a
  scheduling latency (with order of magnitude significant in PREEMPT_RT)
* periodic tasks with short runtime are less likely to run during the
  tick, hence they might not run the task work at all

Patch 1 add support for prev_sum_exec_runtime to the RT, deadline and
sched_ext classes as it is supported by fair, this is required to avoid
calling rseq_preempt on tick if the runtime is below a threshold.

Patch 2 contains the main changes, removing the task_work on the
scheduler tick and using a work_struct scheduled more reliably during
__rseq_handle_notify_resume.

Patch 3 adds a selftest to validate the functionality of the
task_mm_cid_work (i.e. to compact the mm_cids).

Rebased on v6.16-rc1, no change since V13 [1].

Changes since V12:
* Ensure the tick schedules the mm_cid compaction only once for tasks
  executing longer than 100ms (until the scan expires again)
* Execute an rseq_preempt from the tick only after compaction was done
  and the cid assignation changed

Changes since V11:
* Remove variable to make mm_cid_needs_scan more compact
* All patches reviewed

Changes since V10:
* Fix compilation errors with RSEQ and/or MM_CID disabled

Changes since V9:
* Simplify and move checks from task_queue_mm_cid to its call site

Changes since V8 [2]:
* Add support for prev_sum_exec_runtime to RT, deadline and sched_ext
* Avoid rseq_preempt on ticks unless executing for more than 100ms
* Queue the work on the unbound workqueue

Changes since V7:
* Schedule mm_cid compaction and update at every tick too
* mmgrab before scheduling the work

Changes since V6 [3]:
* Switch to a simple work_struct instead of a delayed work
* Schedule the work_struct in __rseq_handle_notify_resume
* Asynchronously disable the work but make sure mm is there while we run
* Remove first patch as merged independently
* Fix commit tag for test

Changes since V5:
* Punctuation

Changes since V4 [4]:
* Fixes on the selftest
    * Polished memory allocation and cleanup
    * Handle the test failure in main

Changes since V3 [5]:
* Fixes on the selftest
    * Minor style issues in comments and indentation
    * Use of perror where possible
    * Add a barrier to align threads execution
    * Improve test failure and error handling

Changes since V2 [6]:
* Change the order of the patches
* Merge patches changing the main delayed_work logic
* Improved self-test to spawn 1 less thread and use the main one instead

Changes since V1 [7]:
* Re-arm the delayed_work at each invocation
* Cancel the work synchronously at mmdrop
* Remove next scan fields and completely rely on the delayed_work
* Shrink mm_cid allocation with nr thread/affinity (Mathieu Desnoyers)
* Add self test

[1] - https://lore.kernel.org/lkml/20250414123630.177385-5-gmonaco@redhat.com
[2] - https://lore.kernel.org/lkml/20250220102639.141314-1-gmonaco@redhat.com
[3] - https://lore.kernel.org/lkml/20250210153253.460471-1-gmonaco@redhat.com
[4] - https://lore.kernel.org/lkml/20250113074231.61638-4-gmonaco@redhat.com
[5] - https://lore.kernel.org/lkml/20241216130909.240042-1-gmonaco@redhat.com
[6] - https://lore.kernel.org/lkml/20241213095407.271357-1-gmonaco@redhat.com
[7] - https://lore.kernel.org/lkml/20241205083110.180134-2-gmonaco@redhat.com

To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.org>

Gabriele Monaco (3):
  sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes
  sched: Move task_mm_cid_work to mm work_struct
  selftests/rseq: Add test for mm_cid compaction

 include/linux/mm_types.h                      |  26 +++
 include/linux/sched.h                         |   8 +-
 kernel/rseq.c                                 |   2 +
 kernel/sched/core.c                           |  75 ++++---
 kernel/sched/deadline.c                       |   1 +
 kernel/sched/ext.c                            |   1 +
 kernel/sched/rt.c                             |   1 +
 kernel/sched/sched.h                          |   6 +-
 tools/testing/selftests/rseq/.gitignore       |   1 +
 tools/testing/selftests/rseq/Makefile         |   2 +-
 .../selftests/rseq/mm_cid_compaction_test.c   | 200 ++++++++++++++++++
 11 files changed, 294 insertions(+), 29 deletions(-)
 create mode 100644 tools/testing/selftests/rseq/mm_cid_compaction_test.c


base-commit: 2c4a1f3fe03edab80db66688360685031802160a
-- 
2.49.0

