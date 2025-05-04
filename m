Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADC17A310
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746343573; cv=none; b=bwES2LCCLdwv2WocOzEjiA1VURmsmkq8AVeceORnPBDCGGM4oIoDFYSMZTTIXR11cNwhAWqUFiJSJNECiXuw6kd4yn1c6ZeFo6en0hcSLePP4tNSSruU0vYg6kVdBIG/RfFJUmTg8jVIpDYynL8Zh5wQMdGpV2m7bi8RoEDLd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746343573; c=relaxed/simple;
	bh=GTUS1HI9ySUJwYit1T9pAQENHqL74DU8KC5U1s95QAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfK4/EgWh2IYE9tbCo3PM/z8FzibjMOMC052x6pN8AiSCdwWXCCB7lJdxlxyGKFoAfXrz+au3mg9PSG3OJ24isg8I99pojTDvCwfgASIwB9jwkanUGnDq+ZDo9+kmI8GMwVeRjxzsJ/4y2B0h/Qyp6KMNuookB0OwrOJiwsFt+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec0OB3eL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec0OB3eL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17752C4CEE7;
	Sun,  4 May 2025 07:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746343572;
	bh=GTUS1HI9ySUJwYit1T9pAQENHqL74DU8KC5U1s95QAg=;
	h=Date:From:To:Cc:Subject:From;
	b=Ec0OB3eLR5HGgAWGnog0bl4A3V8JGzKID2hymJcjDcAsMfhk6blKPopYlXkNbtxF5
	 ZYzvy+XrhyQeaW2Jnp8u96kRsSYS2Rg7XZ8p+7P8xobpIwMDSPCR+APaAMJVxtCNnB
	 T+GYn16KDJp1NidmaX10E9D9WCwI9+n0p9d1QMkxYAfcKlc6xYkZPvblADJx+b1tTW
	 DY/OLawo9mrmX2m+s4F5g0A3pXURaYZPLZ1wFxY8UP9WBvqswevA4n21mTfBRz+bqz
	 Dt30lj6lOBv/i/GReV0FPRPEubbll71ypPz78fAlssK7yX4v0ba5o2jjVI0zX7P2YH
	 7BpX2lsLaGXYQ==
Date: Sun, 4 May 2025 09:26:08 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <aBcWkIOBqkKG8lH-@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-05-04

   # HEAD: 7aeb1538be5df3efa1d799e5428ac3a0ae802293 vdso: Reject absolute relocations during build

Misc fixes:

 - Fix time keeping bugs in CLOCK_MONOTONIC_COARSE clocks

 - Work around and reject absolute relocations into vDSO code that
   GCC erroneously emits in certain arm64 build environments

 Thanks,

	Ingo

------------------>
Thomas Gleixner (1):
      timekeeping: Prevent coarse clocks going backwards

Thomas Weiﬂschuh (2):
      arm64: vdso: Work around invalid absolute relocations from GCC
      vdso: Reject absolute relocations during build


 arch/arm64/include/asm/vdso/gettimeofday.h | 13 ++++++++
 include/linux/timekeeper_internal.h        |  8 +++--
 kernel/time/timekeeping.c                  | 50 +++++++++++++++++++++++++-----
 kernel/time/vsyscall.c                     |  4 +--
 lib/vdso/Makefile.include                  |  6 ++++
 5 files changed, 68 insertions(+), 13 deletions(-)
