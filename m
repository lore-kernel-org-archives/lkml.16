Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339E24BCE9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201598; cv=none; b=Le88KUlQ6lzqGzTpiKwJvhAPPZpFPzyddCOsN6GX9S54PWbh8O1AJqBCvDj1QfAmMQtiLnkbEY/o/KBr+A+hVv8cDgbgVLeK61hqYcz3myrUfnW0NJwZmCluH/g+uJehtF0SZGLdWdTwbvXUQXC4gEXaAXRWzIlztXLtnan7WPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201598; c=relaxed/simple;
	bh=EPxg2vuIPde8wI7OFwEcn7eo2lJFTvpWh9vfBUqd9E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOtpDU7XL7114WtQWz/Y5q8e56Kv3cC5To6zIoOUQ/fE++rUkDRSWq438GeHG9Mztf6EK100OnoycXOnsCCvrho8f7vWtwm6MBJqBnGj61SIciRW8dK9DX65jYV1CVJ0xc4vIxTKY8YiOBrb5YUal/ibfrwyB7w9YixuGwJ1p6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXHTJT6O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXHTJT6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739201594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fUnvnGSy7d8KARdhNW8vax06A3CqMJJcvRUMg/G4Jz4=;
	b=JXHTJT6O6HJ00OQaTCxDleevC/tsZXVlusbT57MZLIrLtIxMEl2NlA0h3/iUBl+eYE0K6u
	v+VZNpqFvOtCpN7Wp/Eu2TZgQe7c7Tl7lwZnUxkioqNoZe009ZPdlSM0H2vv1CR4a/amtc
	IqTg2nyIf9JnlnjPDA6B+FRbIMvGalk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-3PpysBU9N9u_8NN2mwuBMg-1; Mon,
 10 Feb 2025 10:33:11 -0500
X-MC-Unique: 3PpysBU9N9u_8NN2mwuBMg-1
X-Mimecast-MFC-AGG-ID: 3PpysBU9N9u_8NN2mwuBMg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7C36195608E;
	Mon, 10 Feb 2025 15:33:09 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.34.65])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BADB618004A7;
	Mon, 10 Feb 2025 15:33:06 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v6 0/3] sched: Restructure task_mm_cid_work for predictability
Date: Mon, 10 Feb 2025 16:32:49 +0100
Message-ID: <20250210153253.460471-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

This patchset moves the task_mm_cid_work to a preemptible and migratable
context. This reduces the impact of this task to the scheduling latency
of real time tasks.
The change makes the recurrence of the task a bit more predictable.
We also add optimisation and fixes to make sure the task_mm_cid_work
works as intended.

The behaviour causing latency was introduced in commit 223baf9d17f2
("sched: Fix performance regression introduced by mm_cid") which
introduced a task work tied to the scheduler tick.
That approach presents two possible issues:
* the task work runs before returning to user and causes, in fact, a
  scheduling latency (with order of magnitude significant in PREEMPT_RT)
* periodic tasks with short runtime are less likely to run during the
  tick, hence they might not run the task work at all

Patch 1 allows the mm_cids to be actually compacted when a process
reduces its number of threads, which was not the case since the same
mm_cids were reused to improve cache locality, more details in [4].

Patch 2 contains the main changes, removing the task_work on the
scheduler tick and using a delayed_work instead.
Additionally, we terminate the call immediately if we see that no mm_cid
is actually active, which could happen on processes sleeping for long
time or which exited but whose mm has not been freed yet.

Patch 3 adds a selftest to validate the functionality of the
task_mm_cid_work (i.e. to compact the mm_cids). The test fails if patch
1 is not applied and is flaky without patch 2. We expect it to always
pass with the entire patchset applied.

Changes since V5:
* Punctuation

Changes since V4 [1]:
* Fixes on the selftest
    * Polished memory allocation and cleanup
    * Handle the test failure in main

Changes since V3 [2]:
* Fixes on the selftest
    * Minor style issues in comments and indentation
    * Use of perror where possible
    * Add a barrier to align threads execution
    * Improve test failure and error handling

Changes since V2 [3]:
* Change the order of the patches
* Merge patches changing the main delayed_work logic
* Improved self-test to spawn 1 less thread and use the main one instead

Changes since V1 [4]:
* Re-arm the delayed_work at each invocation
* Cancel the work synchronously at mmdrop
* Remove next scan fields and completely rely on the delayed_work
* Shrink mm_cid allocation with nr thread/affinity (Mathieu Desnoyers)
* Add self test

Overhead comparison in [4]

[1] - https://lore.kernel.org/lkml/20250113074231.61638-4-gmonaco@redhat.com
[2] - https://lore.kernel.org/lkml/20241216130909.240042-1-gmonaco@redhat.com
[3] - https://lore.kernel.org/lkml/20241213095407.271357-1-gmonaco@redhat.com
[4] - https://lore.kernel.org/lkml/20241205083110.180134-2-gmonaco@redhat.com

To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
To: Paul E. McKenney <paulmck@kernel.org>
To: Shuah Khan <shuah@kernel.org>

Gabriele Monaco (2):
  sched: Move task_mm_cid_work to mm delayed work
  rseq/selftests: Add test for mm_cid compaction

Mathieu Desnoyers (1):
  sched: Compact RSEQ concurrency IDs with reduced threads and affinity

 include/linux/mm_types.h                      |  23 +-
 include/linux/sched.h                         |   1 -
 kernel/sched/core.c                           |  66 +-----
 kernel/sched/sched.h                          |  32 ++-
 tools/testing/selftests/rseq/.gitignore       |   1 +
 tools/testing/selftests/rseq/Makefile         |   2 +-
 .../selftests/rseq/mm_cid_compaction_test.c   | 200 ++++++++++++++++++
 7 files changed, 246 insertions(+), 79 deletions(-)
 create mode 100644 tools/testing/selftests/rseq/mm_cid_compaction_test.c


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1

