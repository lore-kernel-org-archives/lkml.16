Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43564221FDC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800748; cv=none; b=iqrLEmFb/FOIDqp66Du1HzpieCaAI4zII/r7MkR/Dw593PhsUzAR1ANVO90gvBsWQEBpIBLj/gC+NGJCnxPkqta5fVmGvjDgVw/GNTvLrSgGVgHi1KGfuA5DQipGHyAO1YL5F22NxhAPRcMhj/V7IzVN8CI7M9d+CVNyGx8XAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800748; c=relaxed/simple;
	bh=iNofOyeBakfiaWETqlU/loWnmHR7CJzqBPwNICLStLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzYiXU4aBQZYmD4IgnEyZfDeQxV6JQEJI2dN7I/06FBKQyXTeIFOcRTq1mB9eCoNT9DbnJYLh9mgyq578rM+X/jN5v9uWaymAGHR9Bg665Me1EbugcHvYg6XzxDkrmjLuT15fD1gb5iQg4rPL0ashWeZgyZiBaV+kbLYeTMA3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N4PwclRr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N4PwclRr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54998f865b8so1632519e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744800744; x=1745405544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezteQ2riofZ7Hrj5BXFbLyhRNWueJY/Se/hzX4W8NVQ=;
        b=N4PwclRrbOKdQiyzCuRIhBJEaT9QZZaMbKPGAqloF0hxMpg1Pg7KpBpR1giXgC1IC9
         wX1aW9YKcNyt8JJKPTq5P/7JAT4rPnKqLVHc9xkQKHkKfE+e6Ke5HzM0ICx6QGQe1yzB
         T2SjHVAmUPVFLGnxGbXqvar494D2C+4Gj19o9C9d/lBQpj+K17+0vFrlej+FsQOqku++
         5qR8uRIBBQTUpiOwnYLU5rMv+VOrL5pLVuDcBo92skyJBK30okfTnPMd2AjTLA9wGZeL
         S5+ktWvOUlJC//BVc51qeVtWsyq5mUy05acQV0ZYzmR3Pvqd1CBDo6DZb0+Vonrj65qD
         y3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800744; x=1745405544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezteQ2riofZ7Hrj5BXFbLyhRNWueJY/Se/hzX4W8NVQ=;
        b=js+zudkBws+pR2Hv8QoZQ2MqHmiRuFyXTzchNovZoE2GPC6gfh/d+fod0cUO+hP/1N
         ooio4SswpHaIgodAUSPoBip1ExxVAHMeHsRAUGik5xdBBgDtkhBVmZ0FAP2hFB3+xuPO
         e6OuUVj5PrXp9qeaU6eY4p+3trFNBteMWLSgFv86aC8ZwlZtzfdXwcvAfO4fCEwB8IhW
         ItmyxtnDP0Gt/Q6JpTdGtaoJ2C3AIjZ7+afO979zXXR1IY9pPm8aROA1mk60wpjzfJMa
         ecypJtrNbUYSR9+zziG5xko2wMF0BXdaBXghpLsELtaVjXyP7YpIxevYYHTkHOUGCsnm
         H+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwWoCapcN+/a02PsJU22zP6H6fOrG6NwrjWia2lUd4g1wcYw/X6GekfkeExEvRPftIMsLir4J+eJTggnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJa3oMNDiQibx+fRndkE7DPrav6Iok6xRIhlYg3631zpeM3M9a
	vQ4N+SAHM6+wTYLtvCi0FQ77dItY/aoOYEArQ9RsFODPyZQ+nU8cyGQBTbKEisIvL8FxlI06fmX
	IGn79HixFXNAx3IhGLTGE5to/kFybofcfExEg
X-Gm-Gg: ASbGncuMDGiHnYTRloepx7Xl4hXGbyTAW27eOieWAwK5a5q9rLO2CpWdPyrW6gr6fxN
	ZAcr06gpiTt7izwb7OzjazUOmqpyQuvqf1m2VbrnN7ZrTB8A5c1hv+bJ3b4vfReLXXHEju/WG8K
	/vJSjJfjTdMxd16hQhRZ9OLBT5lu+mYYM2wFwozLT43oGm5x5kiUa4p6E=
X-Google-Smtp-Source: AGHT+IFVKUVr5njxxlyQ99XNXATvKTMpaL0bme3NPquYmxsdWIkf2jPCZtG5OdgrGsCFMkEw3fWVTW+th5wSbVkT4ms=
X-Received: by 2002:a05:651c:1988:b0:30c:7a7:e87c with SMTP id
 38308e7fff4ca-3107f73cfdfmr3673361fa.35.1744800744089; Wed, 16 Apr 2025
 03:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
In-Reply-To: <20250416085446.480069-1-glider@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 16 Apr 2025 12:52:12 +0200
X-Gm-Features: ATxdqUHO84ZMKC02-TwodTZhg_pM7vWiRGycrQw7cTn0S02O05yX6np4vLAohn8
Message-ID: <CACT4Y+b06RBSgcxooStVLoUVZRR=_L3Pxo6Ozp45s8brw1Ybfg@mail.gmail.com>
Subject: Re: [PATCH 0/7] RFC: coverage deduplication for KCOV
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 10:54, Alexander Potapenko <glider@google.com> wrote:
>
> As mentioned by Joey Jiao in [1], the current kcov implementation may
> suffer from certain syscalls overflowing the userspace coverage buffer.
>
> According to our measurements, among 24 syzkaller instances running
> upstream Linux, 5 had a coverage overflow in at least 50% of executed
> programs. The median percentage of programs with overflows across those 24
> instances was 8.8%.
>
> One way to mitigate this problem is to increase the size of the kcov buffer
> in the userspace application using kcov. But right now syzkaller already
> uses 4Mb per each of up to 32 threads to store the coverage, and increasing
> it further would result in reduction in the number of executors on a single
> machine.  Replaying the same program with an increased buffer size in the
> case of overflow would also lead to fewer executions being possible.
>
> When executing a single system call, excessive coverage usually stems from
> loops, which write the same PCs into the output buffer repeatedly. Although
> collecting precise traces may give us some insights into e.g. the number of
> loop iterations and the branches being taken, the fuzzing engine does not
> take advantage of these signals, and recording only unique PCs should be
> just as practical.
>
> In [1] Joey Jiao suggested using a hash table to deduplicate the coverage
> signal on the kernel side. While being universally applicable to all types
> of data collected by kcov, this approach adds another layer of complexity,
> requiring dynamically growing the map. Another problem is potential hash
> collisions, which can as well lead to lost coverage. Hash maps are also
> unavoidably sparse, which potentially requires more memory.

The hashmap probably can compare values for equality to avoid losing
coverage, but the real problem is that it allocates and can't work in
interrupts, etc.

> The approach proposed in this patch series is to assign a unique (and
> almost) sequential ID to each of the coverage callbacks in the kernel. Then
> we carve out a fixed-sized bitmap from the userspace trace buffer, and on
> every callback invocation we:
>
> - obtain the callback_ID;
> - if bitmap[callback_ID] is set, append the PC to the trace buffer;
> - set bitmap[callback_ID] to true.
>
> LLVM's -fsanitize-coverage=trace-pc-guard replaces every coverage callback
> in the kernel with a call to
> __sanitizer_cov_trace_pc_guard(&guard_variable) , where guard_variable is a
> 4-byte global that is unique for the callsite.
>
> This allows us to lazily allocate sequential numbers just for the callbacks
> that have actually been executed, using a lock-free algorithm.
>
> This patch series implements a new config, CONFIG_KCOV_ENABLE_GUARDS, which
> utilizes the mentioned LLVM flag for coverage instrumentation. In addition
> to the existing coverage collection modes, it introduces
> ioctl(KCOV_UNIQUE_ENABLE), which splits the existing kcov buffer into the
> bitmap and the trace part for a particular fuzzing session, and collects
> only unique coverage in the trace buffer.
>
> To reset the coverage between runs, it is now necessary to set trace[0] to
> 0 AND clear the entire bitmap. This is still considered feasible, based on
> the experimental results below.
>
> The current design does not address the deduplication of KCOV_TRACE_CMP
> comparisons; however, the number of kcov overflows during the hints
> collection process is insignificant compared to the overflows of
> KCOV_TRACE_PC.
>
> In addition to the mentioned changes, this patch adds support for
> R_X86_64_REX_GOTPCRELX to objtool and arch/x86/kernel/module.c.  It turned
> out that Clang leaves such relocations in the linked modules for the
> __start___sancov_guards and __stop___sancov_guards symbols. Because
> resolving them does not require a .got section, it can be done at module
> load time.
>
> Experimental results.
>
> We've conducted an experiment running syz-testbed [3] on 10 syzkaller
> instances for 24 hours.  Out of those 10 instances, 5 were enabling the
> kcov_deduplicate flag from [4], which makes use of the KCOV_UNIQUE_ENABLE
> ioctl, reserving 4096 words (262144 bits) for the bitmap and leaving 520192
> words for the trace collection.
>
> Below are the average stats from the runs.
>
> kcov_deduplicate=false:
>   corpus: 52176
>   coverage: 302658
>   cover overflows: 225288
>   comps overflows: 491
>   exec total: 1417829
>   max signal: 318894
>
> kcov_deduplicate=true:
>   corpus: 52581
>   coverage: 304344
>   cover overflows: 986
>   comps overflows: 626
>   exec total: 1484841
>   max signal: 322455
>
> [1] https://lore.kernel.org/linux-arm-kernel/20250114-kcov-v1-5-004294b931a2@quicinc.com/T/
> [2] https://clang.llvm.org/docs/SanitizerCoverage.html
> [3] https://github.com/google/syzkaller/tree/master/tools/syz-testbed
> [4] https://github.com/ramosian-glider/linux/pull/7
>
>
> Alexander Potapenko (7):
>   kcov: apply clang-format to kcov code
>   kcov: factor out struct kcov_state
>   kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
>   kcov: add `trace` and `trace_size` to `struct kcov_state`
>   kcov: add ioctl(KCOV_UNIQUE_ENABLE)
>   x86: objtool: add support for R_X86_64_REX_GOTPCRELX
>   mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
>
>  Documentation/dev-tools/kcov.rst  |  43 +++
>  MAINTAINERS                       |   1 +
>  arch/x86/include/asm/elf.h        |   1 +
>  arch/x86/kernel/module.c          |   8 +
>  arch/x86/kernel/vmlinux.lds.S     |   1 +
>  arch/x86/um/asm/elf.h             |   1 +
>  include/asm-generic/vmlinux.lds.h |  14 +-
>  include/linux/kcov-state.h        |  46 +++
>  include/linux/kcov.h              |  60 ++--
>  include/linux/sched.h             |  16 +-
>  include/uapi/linux/kcov.h         |   1 +
>  kernel/kcov.c                     | 453 +++++++++++++++++++-----------
>  lib/Kconfig.debug                 |  16 ++
>  mm/kasan/generic.c                |  18 ++
>  mm/kasan/kasan.h                  |   2 +
>  scripts/Makefile.kcov             |   4 +
>  scripts/module.lds.S              |  23 ++
>  tools/objtool/arch/x86/decode.c   |   1 +
>  tools/objtool/check.c             |   1 +
>  19 files changed, 508 insertions(+), 202 deletions(-)
>  create mode 100644 include/linux/kcov-state.h
>
> --
> 2.49.0.604.gff1f9ca942-goog
>
