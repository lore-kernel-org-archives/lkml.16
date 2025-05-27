Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5DA1FFC45
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375968; cv=none; b=RrJC99Ynh26PFgm9WhZv/rJFdcq8UdaCp6cmHCqtSknuyZsfdIOBYXS+p5hrioc2CU8GAphxpyW3Irw+KNbSYJzMb1cPM9vcAcS0L33hB1PkROkF9eLjkKhCbfdvg3Os5Yv/EMy2IHubBPG7Fdj7HIw7oC/xRXkvgvBOrSI25Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375968; c=relaxed/simple;
	bh=D+URVbF8KHctoo4j3SGBGBFh2V6XyMY4sv/GBO/E3mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzR1NihctS+QPrWf60P79NhhcrSOlLJatd+SYzFd+MZHjcf2at9jcot6qf/nTjGE9fzYGHTFVV2p21W30sfzkKp2uJ0EUSvL1aJuaHf76hqIa82mB/lmbIn9AKZiLFpXGIUzVpOJ4GcPuvRX54z6jzkG23WQ95zLqg7AIA8t8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feLJhSSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feLJhSSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241E5C4CEE9;
	Tue, 27 May 2025 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748375968;
	bh=D+URVbF8KHctoo4j3SGBGBFh2V6XyMY4sv/GBO/E3mg=;
	h=Date:From:To:Cc:Subject:From;
	b=feLJhSSX5R/Wn43uiE/kbbfdbUihJARzCBSJ9aJM1sKKHDFY5uAAqueGyjqjnaanX
	 6g8TFHH0ELIht63fOnDoVtxOGuMQtmy3CuXPezYuCyJ10OAQS4XMlJc6IRSGF1Rw5O
	 bHmeWHot7Obw0ylKowig5+nUOQ958bNt3KgzHuoZjiR/EV/dch1FvmCeCZ3fAQpfH0
	 C7vrKUZ8rdkF5bdki/isGMHwf36AnMVuIRA6RJVvlyfEXB8L1Y4GpazH3P69xupvqw
	 VIAsZamdBTWMoNsXqFjX2yvEH5QlNwu24zRHrSpvR+zgZWPxYlgQSD1UBJmjgmvgad
	 JoJe0Uf40T/Jg==
Date: Tue, 27 May 2025 09:59:27 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [GIT PULL] sched_ext: Changes for v6.16
Message-ID: <aDYZnzyBFzUn_EYA@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 428dc9fc0873989d73918d4a9cc22745b7bbc799:

  sched_ext: bpf_iter_scx_dsq_new() should always initialize iterator (2025-05-07 06:24:07 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16

for you to fetch changes up to 273cc949655c70001778eb0b9e7db993df845912:

  sched_ext: Call ops.update_idle() after updating builtin idle bits (2025-05-22 09:25:15 -1000)

----------------------------------------------------------------
sched_ext: Changes for v6.16

- More in-kernel idle CPU selection improvements. Expand topology awareness
  coverage add scx_bpf_select_cpu_and() to allow more flexibility. The idle
  CPU selection kfuncs can now be called from unlocked contexts too.

- A bunch of reorganization changes to lay the foundation for multiple
  hierarchical scheduler support. This isn't ready yet and the included
  changes don't make meaningful behavior differences. One notable change is
  replacing some static_key tests with dynamic tests as the test results may
  differ depending on the scheduler instance. This isn't expected to cause
  meaningful performance difference.

- Other minor and doc updates.

- There were multiple patches in for-6.15-fixes which conflicted with
  changes in for-6.16. for-6.15-fixes were pulled three times into for-6.16
  to resolve the conflicts.

----------------------------------------------------------------
Andrea Righi (14):
      sched_ext: idle: Extend topology optimizations to all tasks
      sched_ext: idle: Explicitly pass allowed cpumask to scx_select_cpu_dfl()
      sched_ext: idle: Accept an arbitrary cpumask in scx_select_cpu_dfl()
      sched_ext: idle: Introduce scx_bpf_select_cpu_and()
      selftests/sched_ext: Add test for scx_bpf_select_cpu_and()
      sched_ext: Clarify CPU context for running/stopping callbacks
      sched_ext: Add RCU protection to scx_root in DSQ iterator
      sched_ext: Avoid NULL scx_root deref in __scx_exit()
      sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
      sched_ext: idle: Validate locking correctness in scx_bpf_select_cpu_and()
      sched_ext: idle: Allow scx_bpf_select_cpu_and() from unlocked context
      selftests/sched_ext: Add test for scx_bpf_select_cpu_and() via test_run
      sched_ext: idle: Consolidate default idle CPU selection kfuncs
      selftests/sched_ext: Update test enq_select_cpu_fails

Honglei Wang (2):
      sched_ext: change the variable name for slice refill event
      sched_ext: add helper for refill task with default slice

Jake Rice (1):
      Documentation: scheduler: Changed lowercase acronyms to uppercase

Shashank Balaji (2):
      sched_ext, docs: add label
      sched_ext, docs: convert mentions of "CFS" to "fair-class scheduler"

Tejun Heo (33):
      sched_ext: Drop "ops" from scx_ops_enable_state and friends
      sched_ext: Drop "ops" from scx_ops_helper, scx_ops_enable_mutex and __scx_ops_enabled
      sched_ext: Drop "ops" from scx_ops_bypass(), scx_ops_breather() and friends
      sched_ext: Drop "ops" from scx_ops_exit(), scx_ops_error() and friends
      sched_ext: Drop "ops" from scx_ops_{init|exit|enable|disable}[_task]() and friends
      sched_ext: Drop "ops" from SCX_OPS_TASK_ITER_BATCH
      sched_ext: Merge branch 'for-6.15-fixes' into for-6.16
      sched_ext: Indentation updates
      sched_ext: Remove scx_ops_enq_* static_keys
      sched_ext: Remove scx_ops_cpu_preempt static_key
      sched_ext: Remove scx_ops_allow_queued_wakeup static_key
      sched_ext: Make scx_has_op a bitmap
      Merge branch 'for-6.15-fixes' into for-6.16
      Merge branch 'for-6.15-fixes' into for-6.16
      sched_ext: Introduce scx_sched
      sched_ext: Avoid NULL scx_root deref through SCX_HAS_OP()
      sched_ext: Use dynamic allocation for scx_sched
      sched_ext: Inline create_dsq() into scx_bpf_create_dsq()
      sched_ext: Factor out scx_alloc_and_add_sched()
      sched_ext: Move dsq_hash into scx_sched
      sched_ext: Move global_dsqs into scx_sched
      sched_ext: Relocate scx_event_stats definition
      sched_ext: Factor out scx_read_events()
      sched_ext: Move event_stats_cpu into scx_sched
      sched_ext: Move disable machinery into scx_sched
      sched_ext: Clean up SCX_EXIT_NONE handling in scx_disable_workfn()
      Merge branch 'for-6.15-fixes' into for-6.16
      sched_ext: Clean up scx_root usages
      sched_ext: Add @sch to SCX_CALL_OP*()
      sched_ext: Cleanup [__]scx_exit/error*()
      sched_ext: Add @sch to SCX_CALL_OP*()
      sched_ext: Explain the temporary situation around scx_root dereferences
      sched_ext: Call ops.update_idle() after updating builtin idle bits

yangsonghua (1):
      sched_ext: Improve cross-compilation support in Makefile

 Documentation/scheduler/sched-ext.rst              |   14 +-
 kernel/sched/ext.c                                 | 1782 +++++++++++---------
 kernel/sched/ext.h                                 |   13 +-
 kernel/sched/ext_idle.c                            |  307 +++-
 kernel/sched/ext_idle.h                            |    3 +-
 kernel/sched/sched.h                               |    4 +-
 tools/sched_ext/Makefile                           |   23 +-
 tools/sched_ext/include/scx/common.bpf.h           |    2 +
 tools/sched_ext/scx_qmap.bpf.c                     |    4 +-
 tools/sched_ext/scx_show_state.py                  |   14 +-
 tools/testing/selftests/sched_ext/Makefile         |    3 +-
 .../testing/selftests/sched_ext/allowed_cpus.bpf.c |  144 ++
 tools/testing/selftests/sched_ext/allowed_cpus.c   |   84 +
 .../selftests/sched_ext/enq_select_cpu.bpf.c       |   74 +
 tools/testing/selftests/sched_ext/enq_select_cpu.c |   88 +
 .../selftests/sched_ext/enq_select_cpu_fails.bpf.c |   43 -
 .../selftests/sched_ext/enq_select_cpu_fails.c     |   61 -
 17 files changed, 1668 insertions(+), 995 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/allowed_cpus.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.c

-- 
tejun
