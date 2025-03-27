Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42E2046AF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071402; cv=none; b=Ew7u0O658lJ3QiapTf6/iqSCaI5EXtz0p4C+ELPUmkS89GXgsPTNdxs64wdRCtRtizUcjrSLZwkzz+iDWeDYLMxg/hzib3EYi7y3azeh4nNsGev3Rkg+bZSoTbFxG0clQRtd+ZsJrHVQMJMU/Oqc8GM8DBGVZV3VBbaFOaR0k2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071402; c=relaxed/simple;
	bh=5iX6MYsztni2I83p3mdAavaXBTlsxMLhK+v+CsA5CPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTDjyN9AjVdt+4w6jlRNcsLI8A6aNtYpUk8+v+fxaQIUQ15CsDf8Sv/FVTJas7MqRgM2p8Ru06uxN6Mkl4OxhrSNnvcVC/xHRIZBAeyKBYey/6suAtglmy1hbK3qkD8XPeJyHNg1nQy2fhYN/rG3uBa9jO8kuZ/q9IiaxPKjr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwKC5/vO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwKC5/vO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81265C4CEE8;
	Thu, 27 Mar 2025 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743071401;
	bh=5iX6MYsztni2I83p3mdAavaXBTlsxMLhK+v+CsA5CPM=;
	h=From:To:Cc:Subject:Date:From;
	b=WwKC5/vOWfRoLrDkOBfCy16t1oPJkSKLOA8qCu58XKnM+VzYKmZ6tyj5WjEc9FLqe
	 Df27kR8pvJdR9BTQ3rl1AtGeWT9BSFCuvt1whFjjt6HkIWOztzFdE9T4pM/tuvkzfJ
	 NDqldqnCCGpc0VaRb+Fu54ILepGQAxZNyr19GVaK7PU6sm1DRA+b7H2jilWBgy0bD0
	 s7bhsnutTQQyR/OcfjRzjpLqnR/BhTOk4na+yDooWdw9hcoxDb8kirxycPKO+Op8Yc
	 x3N42fiQqrYFjC+pnt8hMpdR6gStrELX2px4MwrCcah7d0T2PzWuMNsNbGT5EARmwN
	 BbKSNIg32cTLQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 00/14] Improve WARN_ON_ONCE() output by adding the condition string
Date: Thu, 27 Mar 2025 11:29:39 +0100
Message-ID: <20250327102953.813608-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the current WARN_ON_ONCE() output from:

  WARN_ON_ONCE(idx < 0 && ptr);
  ...

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to (on all __WARN_FLAGS() using architectures except S390):

  WARNING: [idx < 0 && ptr] kernel/sched/core.c:8511 at sched_init+0x20/0x410 CPU#0: swapper/0

(Note the addition of the '[condition string]', and a reorganized CPU/comm/PID trailer.)

... and on S390 and non-__WARN_FLAGS architectures to:

  WARNING: kernel/sched/core.c:8511 at sched_init+0x20/0x410 CPU#0: swapper/0

and on non-x86 architectures (the CPU/PID fields in the WARNING line are skipped):

  WARNING: kernel/sched/core.c:8511 sched_init+0x20/0x410
  CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.14.0-01616-g94d7af2844aa #4 PREEMPT(undef)

The motivation behind this series is the SCHED_WARN_ON() primitive that
got removed in this merge window:

  f7d2728cc032 ("sched/debug: Change SCHED_WARN_ON() to WARN_ON_ONCE()")

... which produced more informative debug output, as it included the
WARN_ON_ONCE() condition string - at the expense of worse code generation.

This series, based on Linus's latest Git tree, merges the code generation
benefits of modern WARN_ON_ONCE() bug_entry architecture code with the expanded
information content of SCHED_WARN_ON().

The cost is about +100K more .data on a defconfig kernel, and no runtime
code generation impact:

       text       data        bss         dec        hex    filename
   29523998    7926322    1389904    38840224    250a7a0    vmlinux.x86.defconfig.before
   29523998    8024626    1389904    38938528    25227a0    vmlinue.x86.defconfig.after

The series was build and boot tested on x86, with an expectation for it to
work on other architectures (with limited cross-testing on the affected
architectures).

This tree can also be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip WIP.core/bugs

Thanks,

    Ingo

================>

Ingo Molnar (14):
  bugs/core: Extend __WARN_FLAGS() with the 'cond_str' parameter
  bugs/core: Pass down the condition string of WARN_ON_ONCE(cond) warnings to __WARN_FLAGS()
  bugs/x86: Extend _BUG_FLAGS() with the 'cond_str' parameter
  bugs/x86: Augment warnings output by concatenating 'cond_str' with the regular __FILE__ string in _BUG_FLAGS()
  bugs/powerpc: Pass in 'cond_str' to BUG_ENTRY()
  bugs/powerpc: Concatenate 'cond_str' with '__FILE__' in BUG_ENTRY(), to extend WARN_ON/BUG_ON output
  bugs/LoongArch: Pass in 'cond_str' to __BUG_ENTRY()
  bugs/LoongArch: Concatenate 'cond_str' with '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output
  bugs/s390: Pass in 'cond_str' to __EMIT_BUG()
  bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()
  bugs/riscv: Concatenate 'cond_str' with '__FILE__' in __BUG_FLAGS(), to extend WARN_ON/BUG_ON output
  bugs/parisc: Concatenate 'cond_str' with '__FILE__' in __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
  bugs/sh: Concatenate 'cond_str' with '__FILE__' in __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
  bugs/core: Reorganize fields in the first line of WARNING output, add ->comm[] output

 arch/arm64/include/asm/bug.h     |  2 +-
 arch/loongarch/include/asm/bug.h | 25 ++++++++++++-------------
 arch/parisc/include/asm/bug.h    |  6 +++---
 arch/powerpc/include/asm/bug.h   | 12 ++++++------
 arch/riscv/include/asm/bug.h     | 10 +++++-----
 arch/s390/include/asm/bug.h      | 10 +++++-----
 arch/sh/include/asm/bug.h        |  4 ++--
 arch/x86/include/asm/bug.h       | 14 +++++++-------
 include/asm-generic/bug.h        |  7 ++++---
 kernel/panic.c                   | 16 +++++++++-------
 10 files changed, 54 insertions(+), 52 deletions(-)

-- 
2.45.2

