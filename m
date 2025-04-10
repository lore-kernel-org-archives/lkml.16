Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBD2E62A7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320851; cv=none; b=WHqze4d0gCW1VXp9G/6tgfqzety0aszYKwLlj+YpP/rFxOxhnGC89af6xZqAiGuxRRpV/hBcEekBzLcWd5yG60QhgzqvjkeazDXQFGFu/AjpANnYo+OT8UN810hB/hgs3CRX1uhnLxk0Xa6SWYVzWJh4Bn9dWmSmdGm9HmXAM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320851; c=relaxed/simple;
	bh=s1QImXxiyoqGdj3ooZgignXFdNmxDsbwoDw9EDIHsXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gryb1ryxKUfVeeyootDDzUz6G3cEsj9/AjgqmJMM6kX725ENHpY/MhyE/2zlp++nfLKVr2hJ4eIDFJpR4gUn5eq6O2tBrjygkisCMHFkufNjsA3eAFxTQOC/K+vfnsg5bsyu30+5Vn7VF2SatJDY8JXTebMZIQoDQRCLu1a3IyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtPzlumZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtPzlumZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B199C4CEDD;
	Thu, 10 Apr 2025 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744320851;
	bh=s1QImXxiyoqGdj3ooZgignXFdNmxDsbwoDw9EDIHsXY=;
	h=Date:From:To:Cc:Subject:From;
	b=GtPzlumZufFs0qhG8v/G3sA1m53JxdtipAty03yVhEtPo41wOlSIzb+7YvfZE2Sp5
	 rDNOlXgpTOLPD9xoGSgYi0TdXwJC3itwwVW5Q0AhxZTWcDXjlqtgmTax1fY/ZjkfkB
	 UGrFEf6pKh5cbJt0H7Qi8RgATmgxienq1AFVzMlQURTBQ3zHHsKlP/hAX8SGmUFv/5
	 PRlDMXq+TDwC3ISkNL9txWEQC6JhwvvY08ZD3DwsxWTbo3PRdTPJPSGi0duPjXqNCh
	 mh039GYgZfbXD1lFqQdD8fXnJsvJdy8fvfzUf7zPxe7WEyYXE/B3bJSgtmIjeVoMM4
	 s9JszoZF9+w+w==
Date: Thu, 10 Apr 2025 23:34:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [GIT PULL] timer fixes
Message-ID: <Z_g5ToUpEw-GPsuY@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-10

   # HEAD: acea9943271b62905033f2f8ca571cdd52d6ea7b vdso: Address variable shadowing in macros

Miscellaneous timer fixes:

 - Fix missing ACCESS_PRIVATE() that triggered a Sparse warning

 - Fix lockdep false positive in tick_freeze() on CONFIG_PREEMPT_RT=y

 - Avoid <vdso/unaligned.h> macro's variable shadowing to address build
   warning that triggers under W=2 builds

 Thanks,

	Ingo

------------------>
Nam Cao (1):
      hrtimer: Add missing ACCESS_PRIVATE() for hrtimer::function

Peng Jiang (1):
      vdso: Address variable shadowing in macros

Sebastian Andrzej Siewior (1):
      timekeeping: Add a lockdep override in tick_freeze()


 include/linux/hrtimer.h   |  2 +-
 include/vdso/unaligned.h  | 12 ++++++------
 kernel/time/hrtimer.c     |  2 +-
 kernel/time/tick-common.c | 22 ++++++++++++++++++++++
 4 files changed, 30 insertions(+), 8 deletions(-)
