Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CA1547EE
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140213; cv=none; b=rnWVutDLFmxUXUdWB90IJWOlfF/631dRKDYc75zcRxgqhAk5adel5bR7VmS2Ngo4l1RCloAadbm3k6IXfNaPTNti/YnIyWO1V9ghSLgXBMF6JXrQPR+0Vc/I2g9pxlj068A9azZjAFzEKYhOb/alv7NDp439LlYXKs48WqTbW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140213; c=relaxed/simple;
	bh=1rNkUd1hCd+4vEvTywqE43/ZrYdxvChv2CgPqlTsF4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnOTXHzmEGX6bggz0CtBNMhXhqwi2UbWTjrAgCDxmaFZQqgVWbJqDtxOt7e+p7a7hDYLJcae+RO+4Lictgz6wCHNZJMAl8+Dflix1lHmZzg9YY2ayghIG14UkK8fUe38/mC0nPrnVc+YomrLeFVcGUXNCk3pV2Vej1Dz/6TUmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYevvj0X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYevvj0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98273C4CEDD;
	Sun,  9 Feb 2025 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140213;
	bh=1rNkUd1hCd+4vEvTywqE43/ZrYdxvChv2CgPqlTsF4o=;
	h=From:To:Cc:Subject:Date:From;
	b=KYevvj0XQZ94iWXrQkZyh0/2bwCrKQ0zHPItVvdNT96mU7Xd6NmVWhHJ84KJrRIxl
	 bdECFdUxa9wuxRwFTl9GvSVbJ+Y+KfHsWGPDwWeUHHO3nID89Uut3eEUDQmi3VJ2fo
	 XVmKEkcZDFMApKR+6W56EmpGw7ae9mk8HNv75DjLYMu/cH4Qr+/8qnV10TEy7PVfXi
	 m6yUHiIo1Fn9VloFQ3mA0kuaxG8ongRV0fcY4YduN1iKnoQIcC7OknrxWF0fY7uQ7/
	 HT6iM5iYqZ/7hiP6QLd8kLaSNo4sMCpNxnKYeO+IRfpAdAvYw9Jd5hkEVrZ8+ILNrQ
	 o1ylUgvYdYf7A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 0/6 v2] mm: LRU drain flush on nohz_full
Date: Sun,  9 Feb 2025 23:29:58 +0100
Message-ID: <20250209223005.11519-1-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When LRUs are pending, the drain can be triggered remotely, whether the
remote CPU is running in userspace in nohz_full mode or not. This kind
of noise is expected to be caused by preparatory work before a task
runs isolated in userspace. This patchset is a proposal to flush that
before the task starts its critical work in userspace.

Changes since v1:

_ Various task_work improvements (Oleg)

_ Remove leftover comment on numa_work (Valentin)

_ Add Reviewed-by tag from Valentin

_ Use housekeeping_cpu() instead of housekeeping_test_cpu() on
  fastpath to benefit from static branch (Vlastimil)

_ Spare the actual remote LRU drain when the target CPU is nohz_full. It
  is assumed the LRU drain will happen locally eventually. (Michal)

Frederic Weisbecker (6):
  task_work: Provide means to check if a work is queued
  sched/fair: Use task_work_queued() on numa_work
  sched: Use task_work_queued() on cid_work
  tick/nohz: Move nohz_full related fields out of hot task struct's
    places
  sched/isolation: Introduce isolated task work
  mm: Drain LRUs upon resume to userspace on nohz_full CPUs

 include/linux/sched.h           | 15 +++++++++------
 include/linux/sched/isolation.h | 17 +++++++++++++++++
 include/linux/swap.h            |  1 +
 include/linux/task_work.h       | 12 ++++++++++++
 kernel/sched/core.c             |  6 ++----
 kernel/sched/fair.c             |  5 +----
 kernel/sched/isolation.c        | 34 +++++++++++++++++++++++++++++++++
 kernel/sched/sched.h            |  1 +
 kernel/task_work.c              | 11 +++++++++--
 mm/swap.c                       |  8 +++++++-
 10 files changed, 93 insertions(+), 17 deletions(-)

-- 
2.46.0

