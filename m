Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF026FC3
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163852; cv=none; b=RhOwuscmyLYMwTQY3xEtemZXmhBrTvFjW0cB2P/bUtonTR68vHCT+7BltF6gWHiCB6qrc7/lG0imbob1VKb5iXwX366WMBu3IIE/QwElR1Wx7Oj1JHJLSXdz3cF/bZRFMaiDyg8ANfhcPYenFqQfG4j9f4hQuLyWyDgmn9bk1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163852; c=relaxed/simple;
	bh=BpcWdI+aWgmHWdo8KciGXhX31dQapmNdZg6aoEduo1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HN5r08D05zGtPPeZYC5PwSorNWj7t0LbQcWpxZt0XLiUWQDuXCMQY5guxouOuthpLiySjBHCvuI3A/wFYmPyyJxqvFYlVfePRCxqwpZNYpHsA1mB3Lcx8JASFlAsCWTvFj0D92R8leXRoco2TFGHIBX1eYUe9dtsVNV+kWF1mWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpNNbti6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpNNbti6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BCAC4CEEA;
	Sun, 25 May 2025 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748163851;
	bh=BpcWdI+aWgmHWdo8KciGXhX31dQapmNdZg6aoEduo1Q=;
	h=Date:From:To:Cc:Subject:From;
	b=OpNNbti6OXL9fav5zMdLhiLc4DY/xp/Ix/vd27RzJUnUAZg4IcmT0RjwxQTDSAD+b
	 JsKeZ6av12BFNRc0E44eHNMwmTZ+NBFHLfjH4T9KYljZMhsNip5/pxbMj7/thEdpH+
	 2krImNUfu3I8UY9FGZOneTROCN4RGSBmWukyRIAev925gGWcvBk6rHRBVQAZxYkt2o
	 jDBMFlQH3TJdL4jlvF/5XSo1BhKGKUHpdJvadvn6UjVIlE3FTVSoM3v80UwyEjehD9
	 dLdDD5ARHZeOlS6Rt/onH3FSb/OGf9cRpEcBft0drohcg/ujhKZND+IRtkSgeFo+g3
	 7m1+0G3eO2CfA==
Date: Sun, 25 May 2025 11:04:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>, Uros Bizjak <ubizjak@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [GIT PULL] locking changes for v6.16
Message-ID: <aDLdBucNJqaA4T4R@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2025-05-25

   # HEAD: 94ec70880fd376dd5cc60ba2bd7ddf830b3d4f28 Merge branch 'locking/futex' into locking/core, to pick up pending futex changes

Locking changes for v6.16:

  Futexes:

   - Add support for task local hash maps (Sebastian Andrzej Siewior,
     Peter Zijlstra)

   - Implement the FUTEX2_NUMA ABI, which feature extends the futex
     interface to be NUMA-aware. On NUMA-aware futexes a second u32
     word containing the NUMA node is added to after the u32 futex value
     word. (Peter Zijlstra)

   - Implement the FUTEX2_MPOL ABI, which feature extends the futex
     interface to be mempolicy-aware as well, to further refine futex
     node mappings and lookups. (Peter Zijlstra)

  Locking primitives:

   - Misc cleanups (Andy Shevchenko, Borislav Petkov, Colin Ian King,
                    Ingo Molnar, Nam Cao, Peter Zijlstra)

  Lockdep:

   - Prevent abuse of lockdep subclasses (Waiman Long)
   - Add number of dynamic keys to /proc/lockdep_stats (Waiman Long)

Plus misc cleanups and fixes.

Note that the tree includes the following dependent out-of-subsystem
changes as well:

 - rcuref: Provide rcuref_is_dead()
 - mm: Add vmalloc_huge_node()
 - mm: Add the mmap_read_lock guard to <linux/mmap_lock.h>

 Thanks,

	Ingo

------------------>
Andy Shevchenko (1):
      locking/lockdep: Move hlock_equal() to the respective #ifdeffery

Borislav Petkov (AMD) (1):
      futex: Fix kernel-doc comments

Colin Ian King (1):
      selftests/futex: Fix spelling mistake "unitiliazed" -> "uninitialized"

Ingo Molnar (1):
      futex: Relax the rcu_assign_pointer() assignment of mm->futex_phash in futex_mm_init()

Nam Cao (1):
      futex: Fix outdated comment in struct restart_block

Peter Zijlstra (10):
      mm: Add vmalloc_huge_node()
      futex: Move futex_queue() into futex_wait_setup()
      futex: Pull futex_hash() out of futex_q_lock()
      futex: Create hb scopes
      futex: Create futex_hash() get/put class
      futex: Create private_hash() get/put class
      futex: Implement FUTEX2_NUMA
      futex: Implement FUTEX2_MPOL
      selftests/futex: Build without headers nonsense
      futex,selftests: Add another FUTEX2_NUMA selftest

Sebastian Andrzej Siewior (18):
      rcuref: Provide rcuref_is_dead()
      futex: Acquire a hash reference in futex_wait_multiple_setup()
      futex: Decrease the waiter count before the unlock operation
      futex: Introduce futex_q_lockptr_lock()
      futex: Create helper function to initialize a hash slot
      futex: Add basic infrastructure for local task local hash
      futex: Allow automatic allocation of process wide futex hash
      futex: Allow to resize the private local hash
      futex: Allow to make the private hash immutable
      tools headers: Synchronize prctl.h ABI header
      tools/perf: Allow to select the number of hash buckets
      selftests/futex: Add futex_priv_hash
      selftests/futex: Add futex_numa_mpol
      selftests/futex: Use TAP output in futex_priv_hash
      selftests/futex: Use TAP output in futex_numa_mpol
      futex: Use RCU_INIT_POINTER() in futex_mm_init().
      tools headers: Synchronize prctl.h ABI header
      futex: Correct the kernedoc return value for futex_wait_setup().

Waiman Long (2):
      locking/lockdep: Prevent abuse of lockdep subclass
      locking/lockdep: Add number of dynamic keys to /proc/lockdep_stats


 include/linux/futex.h                              |  36 +-
 include/linux/mm_types.h                           |   7 +-
 include/linux/mmap_lock.h                          |   4 +
 include/linux/rcuref.h                             |  22 +-
 include/linux/restart_block.h                      |   2 +-
 include/linux/vmalloc.h                            |   9 +-
 include/uapi/linux/futex.h                         |   9 +-
 include/uapi/linux/prctl.h                         |   7 +
 init/Kconfig                                       |  10 +
 io_uring/futex.c                                   |   4 +-
 kernel/fork.c                                      |  24 +
 kernel/futex/core.c                                | 803 +++++++++++++++++++--
 kernel/futex/futex.h                               |  74 +-
 kernel/futex/pi.c                                  | 308 ++++----
 kernel/futex/requeue.c                             | 460 ++++++------
 kernel/futex/waitwake.c                            | 207 +++---
 kernel/locking/lockdep.c                           |  76 +-
 kernel/locking/lockdep_internals.h                 |   1 +
 kernel/locking/lockdep_proc.c                      |   2 +
 kernel/sys.c                                       |   4 +
 mm/nommu.c                                         |  18 +-
 mm/vmalloc.c                                       |  11 +-
 tools/include/uapi/linux/prctl.h                   |  45 +-
 tools/perf/bench/Build                             |   1 +
 tools/perf/bench/futex-hash.c                      |   7 +
 tools/perf/bench/futex-lock-pi.c                   |   5 +
 tools/perf/bench/futex-requeue.c                   |   6 +
 tools/perf/bench/futex-wake-parallel.c             |   9 +-
 tools/perf/bench/futex-wake.c                      |   4 +
 tools/perf/bench/futex.c                           |  67 ++
 tools/perf/bench/futex.h                           |   5 +
 .../testing/selftests/futex/functional/.gitignore  |   6 +-
 tools/testing/selftests/futex/functional/Makefile  |   7 +-
 .../selftests/futex/functional/futex_numa.c        | 262 +++++++
 .../selftests/futex/functional/futex_numa_mpol.c   | 231 ++++++
 .../selftests/futex/functional/futex_priv_hash.c   | 292 ++++++++
 tools/testing/selftests/futex/functional/run.sh    |   7 +
 tools/testing/selftests/futex/include/futex2test.h |  70 ++
 38 files changed, 2523 insertions(+), 599 deletions(-)
 create mode 100644 tools/perf/bench/futex.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_numa.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_numa_mpol.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_priv_hash.c
