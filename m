Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF5267B91
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847208; cv=none; b=IzL6jUAblwbWOEK+sJVXQ3htLmr3xAkDNCkP219f+lg0XpWs3S6L4mWooyir4oBa8B+p9klK9v7IdJm01ixqZTlW61lYzmvezlULqzUM6poB5ik49064oEUgSLzDakdzM3qSpgw3xtMp7S1mgPKlbUyIx8hTqwFin8M8he3UrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847208; c=relaxed/simple;
	bh=g/ypKnZkMGeLcmgWUKLIgk7T/52QPBl11q0ebRP6Xr0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fHk4TAzJomSWHkMWX3JGdqRZaBY504p1S2NVdICjo9mgrnpSW3msMpOs/671TcrS21skYr/t904SNi30S84yZxgxU7RZzLW3+nwhCeZ7WRmZWHQOVmKWSpT300qErLuTWoEZcu23NjGfypT5DjDJUyU+YW7mq3DIyOBm/e5xttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0c3hE7m; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0c3hE7m"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso46606681fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745847205; x=1746452005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OTzOZIYgOSm5iHgHYHs17cr0e11rjTGNrgKqn3vjBeY=;
        b=w0c3hE7muChvyVZshVP/5PmPST8cfuMQEQmUmcRERLVnCSEmgTVmT+erlEuth75t2Q
         khVqYQ6XILEsD0RJlbZY0IOPD2prq4ym9D/YEzhs2YZhCTWYgPwafF48ICzCiWy+BzbA
         T3Aiz1TQHyFecXwOfPrpDBFYjcTkdgzFh/4eZ1ihLdQrA3k2OeKNHbMRxju1BuijZcSp
         HwApYHYWm7V0iUZm/CIOLmYAbFKBhhXZBi4Vjnx4flVZoZlWeg5ACA8JpnYSQNPILZ6I
         Pj5i+p9LU0vy+6vUx2TH0pKRAzmlrjGVOFPVzOSUf0n7Qxfz7u/wUXxU/Pbdo32n3QB+
         uVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847205; x=1746452005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTzOZIYgOSm5iHgHYHs17cr0e11rjTGNrgKqn3vjBeY=;
        b=Oe6b/lXJ9cItzeQADJt0dgqTfxLYJvKIQ5wN12A/JPu3vO20HotnARKzV2GHlBPqNN
         8PmtdAjkZVU8Ja1Y9un1717Ol5AjfX4QChMLS1aXaC42UE9SiYgS5wC9Vi4D3xWUXuWa
         uCWXPLm/6YR7pPUFDgRV0wPNlpATx0ACT+pxSWkoTw3y3PVYssHGM6nKCglzomNIMeK5
         j25froXaXhu7J3rRxXGSwzNQnrDFugXb0CfSGvLOG2Rvxb/Rshb9YpeLXZTJ88Lql+WR
         Albi+p2HU2nWMQREeYgAN4KbjJ3COX8KWtgp8RGovM7Z+KW9uKR+XnkkmtzvYYFo4vBN
         KNMg==
X-Gm-Message-State: AOJu0YzfRgqxrRbxeLny2bd3MvkktbPg7t8ndotdbAy3eQN9UX5PM90i
	Y6DNI/e8Zcwps5GZTRnGV05wKhtjYLTRHbA7+yuOgwd/Gpc0I9Ba30YhbVdpCEl0EExrRpA92ZW
	BraGt6UBt4+gAkjjdCrL7z67ln+Mum2nanzVT/A==
X-Gm-Gg: ASbGncsmNxvWmG+gdovWpPzdjmb167dFRr8zXzTANyOeNn4eyB63j0zwvSX3NZA3/7n
	r8vEWtBdsw1rU/E0U80ktJCYotcmlTjS6uGAuXilZaGN+Hw1EcHU5hAoNgiGnuLiPI8+wUeZfF4
	F47p4yqdsysIssFQJQaEh6tg==
X-Google-Smtp-Source: AGHT+IHg0AT7QEt67ZcddZlZ0cst6ypLtze1zVI2LlhtcUEjYYjpW8WKEZ9byzb7Kcir1ctsBebclNZzqHA8eROwPPw=
X-Received: by 2002:a05:651c:210f:b0:309:2653:5dda with SMTP id
 38308e7fff4ca-31907611ed5mr41639391fa.29.1745847204931; Mon, 28 Apr 2025
 06:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 15:33:13 +0200
X-Gm-Features: ATxdqUGU8Ix5hUMDuCCK8X0KpttsBjuthMDapQsBmSFhrZWTWQmiRbpNq7qfXFY
Message-ID: <CACRpkdaAiF0=SCNBuOT7fyJwbHdMXMfBsRUiQEPnqWO-7nYz5A@mail.gmail.com>
Subject: [GIT PULL] Generic entry for ARM for v6.16
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Russell,

please consider pulling the following git branch for ARM generic entry,
for v6.16 see below.

This branch is identical to the v6 patch series:
https://lore.kernel.org/linux-arm-kernel/20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org/

It's possible to squash patches, even all of them into one
big all-or-nothing patch, given the not very gradual nature generic
entry conversion seems to have.

Main upsides and downsides are in the signed tag.

This series contains the ACKs from tglx and paulmck.

What's new apart from rebasing is the two following remasks in the
signed tag:

- Makes it possible to move ahead with ARCH_WANTS_NO_INSTR.

- Good base for CONFIG_ARCH_HAS_RESCHED_LAZY which is a good
  base for CONFIG_PREEMPT_RT.

I think Arnd may be working on this and this could be a good starting
point for PREEMPT_RT.

Yours,
Linus Walleij


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/arm-generic-entry-for-v6.16

for you to fetch changes up to 8c259349fa675315e1a80a463b04803501a045f6:

  ARM: entry: Reimplement local restart in C (2025-04-07 14:51:17 +0200)

----------------------------------------------------------------
Main upsides:

- Using the same common entry as used by x86_64, RISCV, S390
  and Loongarch, probably soon also ARM64.

- Moves ARM away from the obsoleted context tracker entry points
  user_enter_callable() and user_exit_callable() are now only used
  by ARM, CSKY and Xtensa.

- Solves a few lockdep warnings in the process.

- Converts a bit of assembly into C.

- Makes it possible to move ahead with ARCH_WANTS_NO_INSTR.

- Good base for CONFIG_ARCH_HAS_RESCHED_LAZY which is a good
  base for CONFIG_PREEMPT_RT.

Main downside:

- Slightly increased system call overhead, around 6% in
  measurements.

----------------------------------------------------------------
Linus Walleij (32):
      ARM: Switch to generic entry
      ARM: Prepare includes for generic entry
      ARM: ptrace: Split report_syscall()
      ARM: entry: Skip ret_slow_syscall label
      ARM: process: Rewrite ret_from_fork i C
      ARM: process: Remove local restart
      ARM: entry: Invoke syscalls using C
      ARM: entry: Rewrite two asm calls in C
      ARM: entry: Move trace entry to C function
      ARM: entry: save the syscall sp in thread_info
      ARM: entry: move all tracing invocation to C
      ARM: entry: Merge the common and trace entry code
      ARM: entry: Rename syscall invocation
      ARM: entry: Create user_mode_enter/exit
      ARM: entry: Drop trace argument from usr_entry macro
      ARM: entry: Separate call path for syscall SWI entry
      ARM: entry: Drop argument to asm_irqentry macros
      ARM: entry: Implement syscall_exit_to_user_mode()
      ARM: entry: Drop the superfast ret_fast_syscall
      ARM: entry: Remove fast and offset register restore
      ARM: entry: Untangle ret_fast_syscall/to_user
      ARM: entry: Do not double-call exit functions
      ARM: entry: Move work processing to C
      ARM: entry: Stop exiting syscalls like IRQs
      ARM: entry: Complete syscall and IRQ transition to C
      ARM: entry: Create irqentry calls from kernel mode
      ARM: entry: Move in-kernel hardirq tracing to C
      ARM: irq: Add irqstack helper
      ARM: entry: Convert to generic entry
      ARM: entry: Handle dabt, pabt, and und as interrupts
      ARM: entry: Block IRQs in early IRQ context
      ARM: entry: Reimplement local restart in C

 arch/arm/Kconfig                    |   1 +
 arch/arm/include/asm/entry-common.h |  66 ++++++++++++
 arch/arm/include/asm/entry.h        |  14 +++
 arch/arm/include/asm/ptrace.h       |   8 +-
 arch/arm/include/asm/signal.h       |   4 -
 arch/arm/include/asm/stacktrace.h   |   2 +-
 arch/arm/include/asm/switch_to.h    |   4 +
 arch/arm/include/asm/syscall.h      |   7 ++
 arch/arm/include/asm/thread_info.h  |  22 ++--
 arch/arm/include/asm/traps.h        |   5 +-
 arch/arm/include/uapi/asm/ptrace.h  |   2 +
 arch/arm/kernel/Makefile            |   5 +-
 arch/arm/kernel/asm-offsets.c       |   1 +
 arch/arm/kernel/entry-armv.S        |  82 ++++-----------
 arch/arm/kernel/entry-common.S      | 198 +++++++++++++-----------------------
 arch/arm/kernel/entry-header.S      | 100 ++----------------
 arch/arm/kernel/entry.c             | 120 ++++++++++++++++++++++
 arch/arm/kernel/irq.c               |   6 ++
 arch/arm/kernel/irq.h               |   2 +
 arch/arm/kernel/process.c           |  25 ++++-
 arch/arm/kernel/ptrace.c            |  81 +--------------
 arch/arm/kernel/signal.c            |  68 +++----------
 arch/arm/kernel/syscall.c           |  59 +++++++++++
 arch/arm/kernel/traps.c             |  30 +-----
 arch/arm/mm/abort-ev4.S             |   2 +-
 arch/arm/mm/abort-ev4t.S            |   2 +-
 arch/arm/mm/abort-ev5t.S            |   4 +-
 arch/arm/mm/abort-ev5tj.S           |   6 +-
 arch/arm/mm/abort-ev6.S             |   2 +-
 arch/arm/mm/abort-ev7.S             |   2 +-
 arch/arm/mm/abort-lv4t.S            |  36 +++----
 arch/arm/mm/abort-macro.S           |   2 +-
 arch/arm/mm/abort-nommu.S           |   2 +-
 arch/arm/mm/fault.c                 |   4 +-
 arch/arm/mm/fault.h                 |   8 +-
 arch/arm/mm/pabort-legacy.S         |   2 +-
 arch/arm/mm/pabort-v6.S             |   2 +-
 arch/arm/mm/pabort-v7.S             |   2 +-
 38 files changed, 484 insertions(+), 504 deletions(-)
 create mode 100644 arch/arm/include/asm/entry-common.h
 create mode 100644 arch/arm/include/asm/entry.h
 create mode 100644 arch/arm/kernel/entry.c
 create mode 100644 arch/arm/kernel/irq.h
 create mode 100644 arch/arm/kernel/syscall.c
