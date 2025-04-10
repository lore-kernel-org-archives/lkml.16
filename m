Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABE189F5C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298616; cv=none; b=hmUmVwZuRHHd4C/VegQMV/7O8buKdbtItgCZzC/25PL+Rf6CMMh1rpAf7ABhSMBxQ+BSLYw5AnuWBcZqAI4qZ4Ofhp8iy/hnMeKXBbp451n0+g6yWeE3fgiJNvGPPqOYeqZ7RLW8JtemsJa2F6GzF47Z2+KPCyFR50Guc9ncreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298616; c=relaxed/simple;
	bh=FpOGbwQcU99IRG5219dYaKiwbru+lle3AdO+ngLJjoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnY8CGfy8JFpxRJBlRafxajtlellkg2uBhi9Ssk/+rhYvVn3vDuKIi+wRUaU60eFHJqijGnC28ujKBNtwjR5hA34uWwDIxc6sRdqmZQwTvnOO+AM7tyX5t9TJsLuPwWYFoAAHORzsiukJQPvnycq7gYWdttWr2efr4ZbsA/dCOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHi9ajEH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHi9ajEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296ADC4CEDD;
	Thu, 10 Apr 2025 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298615;
	bh=FpOGbwQcU99IRG5219dYaKiwbru+lle3AdO+ngLJjoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AHi9ajEHrnTWY6cnmEu/F2i+ZOnhF5Q3pifTmxzOcPBphw060jYldw7lnRSzNYZxR
	 +ND7A2iwU3++G0VOGoaaaA4Huwu97LzxSI5WGnBw+N0rmnH+ZSDxoyEZJJ8sj/UC9e
	 JLesy7pZgFpoKTC5TBTUDli55gCv4ugCv+m5xdPjjh58Fu+hl6YNs63ZrULIxQ2E5G
	 UV7BGMxfcQKVLJzFHsQr2Azj3vQmv+7/Z2vGN/vV2vCqsJ/t7tmNYQZHIqJpyD+uCe
	 DRc4GssMN2maynxQh01nUnGy9eaMe8862kflLTjORr+gwG+UfnSZMAlGRzFs71W6Q1
	 J0VdmmFiiQ+pw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/6 v3] sched/mm: LRU drain flush on nohz_full
Date: Thu, 10 Apr 2025 17:23:21 +0200
Message-ID: <20250410152327.24504-1-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

When LRUs are pending, the drain can be triggered remotely, whether the
remote CPU is running in userspace in nohz_full mode or not. This kind
of noise is expected to be caused by preparatory work before a task
runs isolated in userspace. This patchset is a proposal to flush that
before the task starts its critical work in userspace.

Changes since v2:

* Add tags (thanks everyone)
* Assume TASK_WORK_DEQUEUED is set before calling task_work_add() (Oleg)
* Return -EINVAL if queued from kthread instead of silently ignoring.
* Queue from a more appropriate place (folio_batch_add()) (Michal)
* Refactor changelog on last patch (Michal)

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	task/work

HEAD: 036bfe5153de18c995653ee5074d5eec463bbde0

Thanks,
	Frederic
---

Frederic Weisbecker (6):
      task_work: Provide means to check if a work is queued
      sched/fair: Use task_work_queued() on numa_work
      sched: Use task_work_queued() on cid_work
      tick/nohz: Move nohz_full related fields out of hot task struct's places
      sched/isolation: Introduce isolated task work
      mm: Drain LRUs upon resume to userspace on nohz_full CPUs


 include/linux/pagevec.h         | 18 ++----------------
 include/linux/sched.h           | 15 +++++++++------
 include/linux/sched/isolation.h | 17 +++++++++++++++++
 include/linux/swap.h            |  1 +
 include/linux/task_work.h       | 12 ++++++++++++
 kernel/sched/core.c             |  6 ++----
 kernel/sched/fair.c             |  5 +----
 kernel/sched/isolation.c        | 34 ++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h            |  1 +
 kernel/task_work.c              |  9 +++++++--
 mm/swap.c                       | 30 +++++++++++++++++++++++++++++-
 11 files changed, 115 insertions(+), 33 deletions(-)
