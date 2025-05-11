Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701D191F6D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746949752; cv=none; b=kpoI8HK2o2QXRa62rOmsNCvKnjojnLucR//IMaITxz1WMGVi6BAVG0fwTaTNdoxgi7KmEw5kGbw+xXcVIH/S6TNnz3VI4yatttix2vLUFmkzT1FT6pIPRtDluhvb0AIYZeexdmprO+W/j75LLyZaafCW2kMwjKXlWE1cYJo8BOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746949752; c=relaxed/simple;
	bh=7Jj8CXKlYlOfWLHXN3XBoeY0sEtJaZ4kuGropzS7Hq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHET6hhd3HC7ZWxLdAQfmKwD0Cigzzlbxw6pvgfjaPcMOQSmD+gLWI1YGEwpfeliWC/RjrA3kQHwSN+TQ91giHtLbg39EyuSlgW00AnD8OmFwEpyDmu4MKdrohCdEvzvlv68vGCAZio2RH8bKJlY6cQHDbyEGKn3rHxjB0kmJDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQ0gcY1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQ0gcY1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3C7C4CEE4;
	Sun, 11 May 2025 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746949750;
	bh=7Jj8CXKlYlOfWLHXN3XBoeY0sEtJaZ4kuGropzS7Hq0=;
	h=Date:From:To:Cc:Subject:From;
	b=vQ0gcY1DhnCj2+UOBvy7L4K4OENydFITGHy2WZOFy/geo8APrwSaHwIUamFLx2rC2
	 k+4oCyTJ9VRBx+bg86e2Z3NIyJYFIsSSiUwsuNkVZ5xTgmBxa/LclQk0MMiazSLFID
	 8GKm7j5tmAmdavBix7avbwDvGFNfpUvbALDq0SQxk3pgdS1IJiC8e6ZayYsmFqRJ8B
	 7asakV5xLY5nTazgAXhZiFKOIO2mErSJHL8n6b3PD+GWFNRZjPi/eugWLefJAvFpxm
	 yWTNvPgMQczYFA6GdInXNFJbzUorp0LRn7L48KWml8AkyqLzGMW9N4zIjWBZqaFpeX
	 QpffBi4zffz9A==
Date: Sun, 11 May 2025 09:49:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <aCBWcZpS1JNuEG4T@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-05-11

   # HEAD: 94cff94634e506a4a44684bee1875d2dbf782722 clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()

Misc timers fixes:

 - Fix time keeping bugs in CLOCK_MONOTONIC_COARSE clocks

 - Work around absolute relocations into vDSO code that
   GCC erroneously emits in certain arm64 build environments

 - Fix a false positive lockdep warning in the i8253 clocksource
   driver

 Thanks,

	Ingo

------------------>
Sebastian Andrzej Siewior (1):
      clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()

Thomas Gleixner (1):
      timekeeping: Prevent coarse clocks going backwards

Thomas Weiﬂschuh (1):
      arm64: vdso: Work around invalid absolute relocations from GCC


 arch/arm64/include/asm/vdso/gettimeofday.h | 13 ++++++++
 drivers/clocksource/i8253.c                |  4 +--
 include/linux/timekeeper_internal.h        |  8 +++--
 kernel/time/timekeeping.c                  | 50 +++++++++++++++++++++++++-----
 kernel/time/vsyscall.c                     |  4 +--
 5 files changed, 63 insertions(+), 16 deletions(-)
