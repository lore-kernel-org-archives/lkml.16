Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104D20DD65
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820970; cv=none; b=tquh4KRU2KOPRu5tMTU8uEN8lcbn3e0iEWWYg3aqbquPh/0HLdqDVjtAI/iHVaC0BNr7LipjeM7kUSJJ1MiLpg/iQ27iep3E6/rXldoxwNAqcbkeR4fNxQK3LY2FZ9wWVf1cXjm619z2n9uaKVBOd10oIl1NVrNFrnXhP3Z59gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820970; c=relaxed/simple;
	bh=PB6XcSCYfNJQdGCAKXhDm2oNQcbS8M1HTYiw7vECgEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OD6HGuB4DsxK99Tae/xPWsoNrv5sQsmbT9RmjQSENFpDxib+6T2M3C9vh0hRRP5Js8gBBFEDln18TF9srTHFrV2W+C2Zd2jdDTmBg0C8peTU3Bnjl0NHSfhohCv7gi7rhKyTkrrnzSNi29hmGjP90V/n7tkkrYghk4H9i13nAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N9eSl3jX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7bqALs5B; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N9eSl3jX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7bqALs5B"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=spD35W96nKD49Crow6RpCiupvQnh/aVqf2XKsPESEx8=;
	b=N9eSl3jXl+mhHtn9QoXk5YFCw6fZRqeEYUwJ/o1L5reCSm2IyZMbCw0w25AV7od28lLNPi
	O2ck6XWhOKRGcfzKx0O0TtNmq+7mYXzwIxSXVrI13l33aVoQw7GwbELYlBSQn7TWhoi9Cm
	/Doe330tQm/J2FpyCfCVtg3jG5Gw+nbsdp/GhE/Apkgz/Dkmc9NzONYhjsV015rA5zEuo/
	oKbvNOmHN23jC6PzFu4yWjPqmmyb33sdMGHh0+YdvCKK0xgc/fsJfgjsmwXeDCGgOhNwAi
	cE+yYO5pxP0HXJ8oOsP5onZ1C7XUtMBZ7vmXJa1EpsXaRl5Z79K6etkaBkz+yQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=spD35W96nKD49Crow6RpCiupvQnh/aVqf2XKsPESEx8=;
	b=7bqALs5B0gU5ZGQ30pEEDczfnW8jdmJpDBWua5DFhjS2Yh7mSijX4M+kzfOurG9rj5x40q
	195nFAhgeynDRUCg==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v12 00/21] futex: Add support task local hash maps, FUTEX2_NUMA and FUTEX2_MPOL
Date: Wed, 16 Apr 2025 18:29:00 +0200
Message-ID: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

this is a follow up on
        https://lore.kernel.org/ZwVOMgBMxrw7BU9A@jlelli-thinkpadt14gen4.rem=
ote.csb

and adds support for task local futex_hash_bucket.

This is the local hash map series with PeterZ FUTEX2_NUMA and
FUTEX2_MPOL. This went through some testing now with the selftests=E2=80=A6

The complete tree is at
        https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git=
/log/?h=3Dfutex_local_v12
        https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git=
 futex_local_v12

v11=E2=80=A6v12: https://lore.kernel.org/all/20250407155742.968816-1-bigeas=
y@linutronix.de
  - Moved futex_hash_put() in futex_lock_pi() before
    rt_mutex_pre_schedule() for obvious reasons.
=20=20
  - Use __GFP_NOWARN while allocating the local hash to supress warnings
    about failures especially if huge values were used and vmalloc
    refuses.

  - The "immutable" mode is its own patch. The basic infrastructure patch
    enforces a "0" for prctl()'s arg4. The "immutable mode" allows only 0
    (disabled) or 1 (enabled) as argument.
    The "perf bench" bench adds the "bucket" and "immutable" support.
=20=20
  - The position of node member after the uaddr is computed in units of
    u32. Added a cast to (void *) to get the math in right.
=20=20
  - Added FUTEX2_MPOL to FUTEX2_VALID_MASK assuming that we want to expose
    it. However the mpol seems not to work here but it is likely that my
    setup is proper.
=20=20
  - If the user specified FUTEX_NO_NODE as node then the node is updated
    to a valid node number. The node value is only written back to the
    user if it has been changed.
    While this only avoids the unnecessary write back if the user supplied
    a valid node number the whole interface is slighly race if
    FUTEX_NO_NODE is supplied and two futex_wait() invocations are invoked
    on parallel then the first invocation can set node to 0 and the send
    to 1. The following callers will stick to node 1 but the first one
    will remain waiting on the wrong node.
=20=20
  - Added selftests for private hash and the NUMA bits.

v10=E2=80=A6v11: https://lore.kernel.org/all/20250312151634.2183278-1-bigea=
sy@linutronix.de
  - PeterZ' fixups, changes to the local hash series have been folded
    into the earlier patches so things are not added and renamed later
    and the functionality is changed.

  - vmalloc_huge() has been implemented on top of vmalloc_huge_node()
    and the NOMMU bots have been adjusted. akpm asked for this.

  - wake_up_var() has been removed from __futex_pivot_hash(). It is
    enough to wake the userspace waiter after the final put so it can
    perform the resize itself.

  - Changed to logic in futex_pivot_pending() so it does not block for
    the user. It waits for __futex_pivot_hash() which follows the logic
    in __futex_pivot_hash().

  - Updated kernel doc for __futex_hash().

  - Patches 17+ are new:
    - Wire up PR_FUTEX_HASH_SET_SLOTS in "perf bench futex"
    - Add "immutable" mode to PR_FUTEX_HASH_SET_SLOTS to avoid resizing
      the local hash any further. This avoids rcuref usage which is
      noticeable in "perf bench futex hash"


Peter Zijlstra (8):
  mm: Add vmalloc_huge_node()
  futex: Move futex_queue() into futex_wait_setup()
  futex: Pull futex_hash() out of futex_q_lock()
  futex: Create hb scopes
  futex: Create futex_hash() get/put class
  futex: Create private_hash() get/put class
  futex: Implement FUTEX2_NUMA
  futex: Implement FUTEX2_MPOL

Sebastian Andrzej Siewior (13):
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

 include/linux/futex.h                         |  36 +-
 include/linux/mm_types.h                      |   7 +-
 include/linux/mmap_lock.h                     |   4 +
 include/linux/rcuref.h                        |  22 +-
 include/linux/vmalloc.h                       |   9 +-
 include/uapi/linux/futex.h                    |  10 +-
 include/uapi/linux/prctl.h                    |   6 +
 init/Kconfig                                  |  10 +
 io_uring/futex.c                              |   4 +-
 kernel/fork.c                                 |  24 +
 kernel/futex/core.c                           | 802 ++++++++++++++++--
 kernel/futex/futex.h                          |  73 +-
 kernel/futex/pi.c                             | 306 ++++---
 kernel/futex/requeue.c                        | 480 +++++------
 kernel/futex/waitwake.c                       | 201 +++--
 kernel/sys.c                                  |   4 +
 mm/nommu.c                                    |  18 +-
 mm/vmalloc.c                                  |  11 +-
 tools/include/uapi/linux/prctl.h              |  44 +-
 tools/perf/bench/Build                        |   1 +
 tools/perf/bench/futex-hash.c                 |   7 +
 tools/perf/bench/futex-lock-pi.c              |   5 +
 tools/perf/bench/futex-requeue.c              |   6 +
 tools/perf/bench/futex-wake-parallel.c        |   9 +-
 tools/perf/bench/futex-wake.c                 |   4 +
 tools/perf/bench/futex.c                      |  65 ++
 tools/perf/bench/futex.h                      |   5 +
 .../selftests/futex/functional/.gitignore     |   6 +-
 .../selftests/futex/functional/Makefile       |   4 +-
 .../futex/functional/futex_numa_mpol.c        | 232 +++++
 .../futex/functional/futex_priv_hash.c        | 315 +++++++
 .../testing/selftests/futex/functional/run.sh |   7 +
 .../selftests/futex/include/futex2test.h      |  34 +
 33 files changed, 2199 insertions(+), 572 deletions(-)
 create mode 100644 tools/perf/bench/futex.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_numa_mpo=
l.c
 create mode 100644 tools/testing/selftests/futex/functional/futex_priv_has=
h.c

--=20
2.49.0

