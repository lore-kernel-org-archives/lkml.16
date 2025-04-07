Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED71205ADD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041473; cv=none; b=b01mGQUSVzLjBaWejOD9CLylyeECcREBx56wWQArCakJ8Q0UJ11qE/P/SSlLPafrDpd7rYNP4pTcvjU6c5PTa9pfZ6qgSlYFqrTWe3iXIYwnoHvyM2bzuoC6tpFerEnonZ7Zy3iMZfT2QSy9Om1bDhImRUl6Jx9/LlXwt13wPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041473; c=relaxed/simple;
	bh=zNVlELjjCCJLr/oZCgPdE128AC9A21ktMfKjbnujwC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qms235UzyfzPAI/OYxW/gYVfTFwijSu9Tezm/+pwP5XmSCPfLUBknzefJzcTjUX0bcHYb0TnWsuFlJ1nwODbx73ebaR8YLqSZHEZjnsDj+a5mPl2HQJb/7L2ORpC4SwWRtD6/cPCRnOiqT1kAQ/mmM43fNHQcgBTH4ziNeV/gZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=glwKqBAx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JF233zZ8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="glwKqBAx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JF233zZ8"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQXQaRQf/u7Zk9mTjIno8CUEYm2OiLba085rFWqR7Ec=;
	b=glwKqBAxI99Wscgszhc7HQmfu4DQnXRrOkaj0s2xCA93Gb0gbtnd03c2F9b8jDsx/8VXuF
	wPS9h2Xg/cleeDwCIHoStaBaGBUuJZJ4FDjnflhpNRivVEGHiRMhEvcRFk+Yaz7QXuEzaa
	RASFUpP6Sq5h8awtMWAv2G1H/52HnbWc6j+UX/F72zwhTmCzmQ7AWJ1Ls/zGb6WQQD9fwk
	Gnxj4LgWLxLgkvdu/w1PsQ07yG12C8Ecq2xDnWKD6J+Qokk4FZ6U11GS2iFG/fU+Cp1WyQ
	Byd7bsbyvKvg3D3ie/cyVj7zfhwFQ7NvUJjXa0fh0awXIOBewbfHM/pzikwxpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQXQaRQf/u7Zk9mTjIno8CUEYm2OiLba085rFWqR7Ec=;
	b=JF233zZ8Hwg/MUZvAnRcAa14WArTJKgnqQPfsq14SVYHqJB86lQzf6/P6EAGLiC72Zutum
	0l9XrtvB1pJp/cAQ==
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
Subject: [PATCH v11 00/19] futex: Add support task local hash maps, FUTEX2_NUMA and FUTEX2_MPOL
Date: Mon,  7 Apr 2025 17:57:23 +0200
Message-ID: <20250407155742.968816-1-bigeasy@linutronix.de>
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
FUTEX2_MPOL plus a few fixes on top.

The complete tree is at
        https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git=
/log/?h=3Dfutex_local_v11
        https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git=
 futex_local_v11

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

Sebastian Andrzej Siewior (11):
  rcuref: Provide rcuref_is_dead().
  futex: Acquire a hash reference in futex_wait_multiple_setup().
  futex: Decrease the waiter count before the unlock operation.
  futex: Introduce futex_q_lockptr_lock().
  futex: Create helper function to initialize a hash slot.
  futex: Add basic infrastructure for local task local hash.
  futex: Allow automatic allocation of process wide futex hash.
  futex: Allow to resize the private local hash.
  tools headers: Synchronize prctl.h ABI header
  tools/perf: Allow to select the number of hash buckets.
  futex: Allow to make the private hash immutable.

 include/linux/futex.h                  |  36 +-
 include/linux/mm_types.h               |   7 +-
 include/linux/mmap_lock.h              |   4 +
 include/linux/rcuref.h                 |  22 +-
 include/linux/vmalloc.h                |   9 +-
 include/uapi/linux/futex.h             |  10 +-
 include/uapi/linux/prctl.h             |   6 +
 init/Kconfig                           |  10 +
 io_uring/futex.c                       |   4 +-
 kernel/fork.c                          |  24 +
 kernel/futex/core.c                    | 794 ++++++++++++++++++++++---
 kernel/futex/futex.h                   |  73 ++-
 kernel/futex/pi.c                      | 300 +++++-----
 kernel/futex/requeue.c                 | 480 +++++++--------
 kernel/futex/waitwake.c                | 201 ++++---
 kernel/sys.c                           |   4 +
 mm/nommu.c                             |  18 +-
 mm/vmalloc.c                           |  11 +-
 tools/include/uapi/linux/prctl.h       |  44 +-
 tools/perf/bench/Build                 |   1 +
 tools/perf/bench/futex-hash.c          |   7 +
 tools/perf/bench/futex-lock-pi.c       |   5 +
 tools/perf/bench/futex-requeue.c       |   6 +
 tools/perf/bench/futex-wake-parallel.c |   9 +-
 tools/perf/bench/futex-wake.c          |   4 +
 tools/perf/bench/futex.c               |  60 ++
 tools/perf/bench/futex.h               |   5 +
 27 files changed, 1585 insertions(+), 569 deletions(-)
 create mode 100644 tools/perf/bench/futex.c

--=20
2.49.0

