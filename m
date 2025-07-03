Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961A1F16B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551653; cv=none; b=ccpVAIzssVqLNlAVfzgjjA5i0QKm7xYD3Wo4gxwXSB5vexDo9atVoLLJQN8B+9h2McNsSwFrNtTYnCRBivh6ui/OCMS9tKWllNeZj73MsQRHDKH6OsPeHj8NhW64VQtSveXTSAzTWqERSflOk0RzWJpFE2Y+85YE0bR3ZpbJ/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551653; c=relaxed/simple;
	bh=aGQWnq0QCADOSirD4jg6Bw1RAIJiwhztAM0VS25tjiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSge08fIjRJHDKsb4DQ9bYFrafw+ex3nSpUHDX86sbOgP3Z2n+QxwZy6zowkA1u5nDmN93sbh2UDgqzTM5jfJSKH9F24b7YOdmSLu9inUM7WLApvvrX+Ymkhv4CTLFWby0bax9gGFj22zaa8qaPDtv+AGXtCu7vuLcJM10MLJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvfbuRZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvfbuRZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7358EC4CEE3;
	Thu,  3 Jul 2025 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551653;
	bh=aGQWnq0QCADOSirD4jg6Bw1RAIJiwhztAM0VS25tjiw=;
	h=From:To:Cc:Subject:Date:From;
	b=GvfbuRZzCxRSB3obuOFCZE2quIRObLGytbFv6dYkGBo5IQ/JWNx8EnUQCZHB7NxB9
	 3/LQJLiVO7Kc/k80CbT3rEc+K7Tm9BeWryFuYWiXt7YExOKMTrD8uC3ax+A+48jnew
	 g3QkrNpziYBP35FXyJwVIpzebFASVdVRevDlgD4YpSBSpnNzItlATS5gdO2WjRb0CI
	 TAve5DpVi6Xm0ata7oCZk7qo+Ws9aFE/vO9om1QvqRMbZJafl1thHb4Nq6TuOapJCQ
	 pZRm5Cv62Z5NgyOPJWYgZTlV+dW1It3qxW61ZNrn0NZx+hVMDWVUxxrE1FFrtze+7O
	 Td6fgJcHq/gSQ==
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
Subject: [PATCH 0/6 v4] sched/mm: LRU drain flush on nohz_full
Date: Thu,  3 Jul 2025 16:07:11 +0200
Message-ID: <20250703140717.25703-1-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
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

Changes since v3:

* Apply review from Oleg and K Prateek Nayak (handle io_uring kthreads
  and use guard)
  
* Confine this into a new CONFIG_NO_HZ_FULL_WORK because it is still
  experimental.

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	task/work-v4

HEAD: 87896fa0dc36b421533c9dc85dd32b61eaff887b

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
 include/linux/sched.h           | 18 ++++++++++++------
 include/linux/sched/isolation.h | 17 +++++++++++++++++
 include/linux/swap.h            |  1 +
 include/linux/task_work.h       | 12 ++++++++++++
 kernel/sched/core.c             |  6 ++----
 kernel/sched/fair.c             |  5 +----
 kernel/sched/isolation.c        | 26 ++++++++++++++++++++++++++
 kernel/sched/sched.h            |  1 +
 kernel/task_work.c              |  9 +++++++--
 kernel/time/Kconfig             | 12 ++++++++++++
 mm/swap.c                       | 30 +++++++++++++++++++++++++++++-
 12 files changed, 122 insertions(+), 33 deletions(-)
