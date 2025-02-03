Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115B205503
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591188; cv=none; b=mNnTQ9iFMQQyyqvhcaxmMKV3dkdhqY6jkTL7gAPmz/jy4r9bCx+sojZpJHUcw/G3S04Z58aEKX4hGCmnn1FT0LdZF93MNcnlSdoZTYQUKF+s+jyivWpyifhtSsgZ7inmnxy7fbIG6Bnd68+9mEi9svwqYHEpZC3Jt1QaZXYhnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591188; c=relaxed/simple;
	bh=eLyeDOA7AfLtZ18Y41wvV6X1CWkNCo4FYiTLkeVuxEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oOLHR4DfvnY1BX96+4TTnj5zjJAL4L+dlwBlfcvYovApmNJYPUeJr40R9xIbxx92KmJK6W6SQ27ydq6QVBCmQsOA634ZYU3GrYdeZnL8e1yU9yBMg4wXAeHlVgNon4m/DCDSQHVLZgh1z1yK92/VDkZO8fjJy7oxU+TxF7uo2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gqnklgSs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=reSmTRwP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gqnklgSs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="reSmTRwP"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d4AzMmF362MxYkpGT2W/PZeZmzowhuq+yKmtudIx7Qs=;
	b=gqnklgSson0hgGHRKyCCs2q+2uyjOWrUNwiETsscD6ZUdlfHgwPhbomTJ35TkOqCg1dgm+
	bYLlmDT7q/dvRqjELoBVTO9XBkdqSTMBQcjcWH7NvfApvPj8ZzhlE53PRoLzkyokXafrfW
	UyOXnbYN47/wArJDGRuUX/N7z5xFksNvCfFOgR8GJ1/cAqNriSc2wdEOi2h8+SbtIBNFWI
	zctkQHaZ5yfWPnZv0RNOVJI0tJ2EIgdMuWFsGIx/u49Jth4u/voS2BrtXLz//84CiCEeTm
	nXmAuUQ7Yqrt1oYjFV2Z/rZO8ofyY9BPD6V7X6RbDH6Tf/VTnSMqQWNy+dcHyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d4AzMmF362MxYkpGT2W/PZeZmzowhuq+yKmtudIx7Qs=;
	b=reSmTRwPUU73oIXa4rYI2boRoAyYrSCkVN/Q4/Q6NcEQncrRfhZCGiS10RD2rRhIaAC5YW
	9+6Fy/nN/kpjy9Aw==
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
Subject: [PATCH v8 00/15] futex: Add support task local hash maps.
Date: Mon,  3 Feb 2025 14:59:20 +0100
Message-ID: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

this is a follow up on
	https://lore.kernel.org/ZwVOMgBMxrw7BU9A@jlelli-thinkpadt14gen4.remote.csb

and adds support for task local futex_hash_bucket. It can be created via
prctl().

This version supports resize at runtime, auto resize while creating
threads. The upper limit is at 256 * num_possible_cpus() but I guess we
can lower that. The resize can only increase, never lower the the amount
of available local hash bucket slots.

I posted performance numbers of "perf bench futex hash"
	https://lore.kernel.org/all/20241101110810.R3AnEqdu@linutronix.de/

While the performance of the 16 default bucket looks worse than the 512
(after that the performance hardly changes while before it doubles) be
aware those are now task local (and not shared with others) and it seems
to be sufficient in general.
For the systems with 512CPUs and one db application we should probably
resize. So either the application needs to resize it or we offer auto
resize based on threads and CPUs. But be aware that workloads like
"xz huge_file.tar" will happily acquire all CPUs in the system and only
use a few locks in total and not very often. So it would probably
perform with two hash buckets as good as 512 in this scenario.

v7=E2=80=A6v8 https://lore.kernel.org/all/20250123202446.610203-1-bigeasy@l=
inutronix.de/
  - Rebase on v6.14-rc1

v6=E2=80=A6v7: https://lore.kernel.org/all/20241218111618.268028-1-bigeasy@=
linutronix.de/
  - Closed a local hash release race during resize.
  - Closed a resize race in exit_pi_state_list()
  - Closed a resize related race in futex_get_locked_hb() (observed in
    futex_lock_pi() and futex_wait_requeue_pi()).
  - Avoid losing task state in futex_wait_multiple_setup().
  - CONFIG_BASE_SMALL systems use only 2 hash buckets within the private
    hash. The global hash uses here always 16.

v5=E2=80=A6v6: https://lore.kernel.org/all/20241215230642.104118-1-bigeasy@=
linutronix.de/
  - Let only futex_hash() perform the delayed assignment of the new
    local hash.
  - Make sure that futex_hash_allocate() does not drop the initial
    reference of the current local hash more than once.
  - Split "futex_hb_waiters_dec() before unlock" into its own patch.
  - Reword the commit description in a few patches as suggested by
    Thomas Gleixner.

v4=E2=80=A6v5: https://lore.kernel.org/all/20241203164335.1125381-1-bigeasy=
@linutronix.de/
  - Changed the the reference-tracking scheme: The reference is now
    dropped once the lock is dropped. The resize operation also requeues
    all users on the hash bucket from the old one to the new one.

v3=E2=80=A6v4: https://lore.kernel.org/all/20241115172035.795842-1-bigeasy@=
linutronix.de/
  - Completed resize. Tested with wait/wake, lock_pi, requeue and
    requeue_pi.
  - Added auto resize during thread creation.
  - Fixed bucket initialisation of the global hash bucket resilting in a
    crash sometimes.

v2=E2=80=A6v3 https://lore.kernel.org/all/20241028121921.1264150-1-bigeasy@=
linutronix.de/
  - The default auto size for auto creation is 16.
  - For the private hash jhash2 is used and only for the address.
  - My "perf bench futex hash" hacks have been added.
  - The structure moved from signal's struct to mm.
  - It is possible resize it at runtime.

v1=E2=80=A6v2 https://lore.kernel.org/all/20241026224306.982896-1-bigeasy@l=
inutronix.de/:
  - Moved to struct signal_struct and is used process wide.
  - Automatically allocated once the first thread is created.

Sebastian

Sebastian Andrzej Siewior (14):
  futex: Create helper function to initialize a hash slot.
  futex: Add basic infrastructure for local task local hash.
  futex: Allow automatic allocation of process wide futex hash.
  futex: Hash only the address for private futexes.
  futex: Move private hashing into its own function.
  futex: Decrease the waiter count before the unlock operation.
  futex: Prepare for reference counting of the process private hash end
    of operation.
  futex: Re-evaluate the hash bucket after dropping the lock
  futex: Introduce futex_get_locked_hb().
  futex: Acquire a hash reference in futex_wait_multiple_setup().
  futex: Allow to re-allocate the private local hash.
  futex: Resize local futex hash table based on number of threads.
  futex: Use a hashmask instead of hashsize.
  futex: Avoid allocating new local hash if there is something pending.

Thomas Gleixner (1):
  rcuref: Avoid false positive "imbalanced put" report.

 include/linux/futex.h      |  21 ++
 include/linux/mm_types.h   |   7 +-
 include/linux/rcuref.h     |   9 +-
 include/uapi/linux/prctl.h |   5 +
 io_uring/futex.c           |   2 +-
 kernel/fork.c              |  24 ++
 kernel/futex/core.c        | 447 ++++++++++++++++++++++++++++++++++---
 kernel/futex/futex.h       |  38 +++-
 kernel/futex/pi.c          |  36 ++-
 kernel/futex/requeue.c     |  37 ++-
 kernel/futex/waitwake.c    |  50 +++--
 kernel/sys.c               |   4 +
 lib/rcuref.c               |   5 +-
 13 files changed, 602 insertions(+), 83 deletions(-)

--=20
2.47.2

