Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863342E7179
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945327; cv=none; b=iVb4PwEMUSNRfl7rxPIb2/T7txtTIvDaciz7+fC1Y5+ddDBenOH8PSQx7KFaG+6kUEFpEij9u3qZKfJmO1Wi0bBIq6hd/enpiWnR+mnHhnDRUz5JSS0hfGJqfQe/T/9Akd260tz6aWUlOEoLBh2Xq3U1bQEUcylBf1YpU48xF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945327; c=relaxed/simple;
	bh=Q0tbpRQkXgE0GKpRVt6SOx08qOnuRkHy9JVq9SBwb7g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BkyQnP7B6v3fU9n1AZPKr46UkGbiFbO7ezhSstQCQhfFPE4+GTP70qoMYQu419YHA9OtAVZKpTruTyNTROOymYOUTB+BImacpwVor2R3PIsRBvM384K9XS8IM9focfAtUZZEvvftpJMdF4kJyF/F82IWNeYFLTvP8Am6KShVQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dG3iLc5u; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dG3iLc5u"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4538a2f4212so4079955e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945324; x=1751550124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vrPr1zxHZfkYQVjw4j3e6ELu8cbOu5H7i9dTktErl1A=;
        b=dG3iLc5uq58byNaBAqwJV5U6cvYurTZmBxcwwdaEoIfuNcNhSqk4HhVnDvyfDhn8t4
         EZoA9p1hAF1dinoKKD5QkVc8LQGKKmyZabYUl5diDfzpJ++BpDPoKGMmVz7JPfprasNF
         +38YmWJjtd0WLHdhFIpILH4H3Q6z5DVbyGDkDpy+eItHP3YPD8GRq52npIUvkyc1MJsg
         N9Qewz9AT7krq2cP8/ELbr2+CnbjY3lMzbVDe53CuVlXbqqKLuPbiCUj7WYRhmDJa6Se
         +0z16drwUPhWyBMBMQx1hFPb+lc6rof+MqPNILYn9CPDnq5q0a+zgAhS3fHOHsOjUqjH
         V9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945324; x=1751550124;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrPr1zxHZfkYQVjw4j3e6ELu8cbOu5H7i9dTktErl1A=;
        b=p9dY8mIiiVuKm52/OOHusgtYGjAls07NgK358HVf1LcZcvvZC1+KQJUEKrBIkrt3od
         UbBpSkNSDcq89PSBDireO61uuNNMfMBjBhzW6xBNXnxfe4zBaS3YF3Jbu9zndWeydPRq
         j21+NPIQjYZgmI5u0wtDXOLorDyKoGkiMI0wRM2cWUDUrEERu3h6E1MLI7HACFDG/tJH
         70MhXzhqJOjzEbO9cZ45A1hVUvWQ1ukGA7Gr8E6AtP8E8QLv3p6w8BpfT06wXQQIyTqF
         nzyXlgLOhGWm4RtJEL1tNr24IaDuDV4N/jpl1hGWqXjO9AuLkPwTRQcDgBMvbVhndI9Y
         o5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMljhSZhPTPDOTPcuNlGlf0caMnlj0cFy45by7lEsspcXlgvxbyRqXG/7EPznHzv3Bq8m30TmHL6nKDa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVtQFiq96D7t/Kd2tq11Y6x8uHpbzbqD6VtydGdVt2FpA/Hfo
	JM/VSEEtqWanpI4Okl+5WF+Tro9J2QfJisNt5bvovtjg0JICKfpDjwFbFIwZl6XmzGYn17hhhJd
	5DOpxTA==
X-Google-Smtp-Source: AGHT+IF+DdYakrXa77rXDFiIIiYk013TSdnqLh5d20xYMNs29R+MnwYJj0LcLEw7Qr2ZWoi3SF+/ygSx61c=
X-Received: from wmqb8.prod.google.com ([2002:a05:600c:4e08:b0:451:d5b6:1214])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a00d:b0:453:23fe:ca86
 with SMTP id 5b1f17b1804b1-453873da0f4mr45260965e9.4.1750945323898; Thu, 26
 Jun 2025 06:42:03 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-1-glider@google.com>
Subject: [PATCH v2 00/11] Coverage deduplication for KCOV
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

As mentioned by Joey Jiao in [1], the current kcov implementation may
suffer from certain syscalls overflowing the userspace coverage buffer.

According to our measurements, among 24 syzkaller instances running
upstream Linux, 5 had a coverage overflow in at least 50% of executed
programs. The median percentage of programs with overflows across those 24
instances was 8.8%.

One way to mitigate this problem is to increase the size of the kcov buffer
in the userspace application using kcov. But right now syzkaller already
uses 4Mb per each of up to 32 threads to store the coverage, and increasing
it further would result in reduction in the number of executors on a single
machine.  Replaying the same program with an increased buffer size in the
case of overflow would also lead to fewer executions being possible.

When executing a single system call, excessive coverage usually stems from
loops, which write the same PCs into the output buffer repeatedly. Although
collecting precise traces may give us some insights into e.g. the number of
loop iterations and the branches being taken, the fuzzing engine does not
take advantage of these signals, and recording only unique PCs should be
just as practical.

In [1] Joey Jiao suggested using a hash table to deduplicate the coverage
signal on the kernel side. While being universally applicable to all types
of data collected by kcov, this approach adds another layer of complexity,
requiring dynamically growing the map. Another problem is potential hash
collisions, which can as well lead to lost coverage. Hash maps are also
unavoidably sparse, which potentially requires more memory.

The approach proposed in this patch series is to assign a unique (and
almost) sequential ID to each of the coverage callbacks in the kernel. Then
we carve out a fixed-sized bitmap from the userspace trace buffer, and on
every callback invocation we:

- obtain the callback_ID;
- if bitmap[callback_ID] is set, append the PC to the trace buffer;
- set bitmap[callback_ID] to true.

LLVM's -fsanitize-coverage=trace-pc-guard replaces every coverage callback
in the kernel with a call to
__sanitizer_cov_trace_pc_guard(&guard_variable) , where guard_variable is a
4-byte global that is unique for the callsite.

This allows us to lazily allocate sequential numbers just for the callbacks
that have actually been executed, using a lock-free algorithm.

This patch series implements a new config, CONFIG_KCOV_ENABLE_GUARDS, which
utilizes the mentioned LLVM flag for coverage instrumentation. In addition
to the existing coverage collection modes, it introduces
ioctl(KCOV_UNIQUE_ENABLE), which splits the existing kcov buffer into the
bitmap and the trace part for a particular fuzzing session, and collects
only unique coverage in the trace buffer.

To reset the coverage between runs, it is now necessary to set trace[0] to
0 AND clear the entire bitmap. This is still considered feasible, based on
the experimental results below.

Alternatively, users can call ioctl(KCOV_RESET_TRACE) to reset the coverage.
This makes it possible to make the coverage buffer read-only, so that it
is harder to corrupt.

The current design does not address the deduplication of KCOV_TRACE_CMP
comparisons; however, the number of kcov overflows during the hints
collection process is insignificant compared to the overflows of
KCOV_TRACE_PC.

In addition to the mentioned changes, this patch series implements
a selftest in tools/testing/selftests/kcov/kcov_test. This will help
check the variety of different coverage collection modes.

Experimental results.

We've conducted an experiment running syz-testbed [3] on 10 syzkaller
instances for 24 hours.  Out of those 10 instances, 5 were enabling the
kcov_deduplicate flag from [4], which makes use of the KCOV_UNIQUE_ENABLE
ioctl, reserving 4096 words (262144 bits) for the bitmap and leaving 520192
words for the trace collection.

Below are the average stats from the runs.

kcov_deduplicate=false:
  corpus: 52176
  coverage: 302658
  cover overflows: 225288
  comps overflows: 491
  exec total: 1417829
  max signal: 318894

kcov_deduplicate=true:
  corpus: 52581
  coverage: 304344
  cover overflows: 986
  comps overflows: 626
  exec total: 1484841
  max signal: 322455

[1] https://lore.kernel.org/linux-arm-kernel/20250114-kcov-v1-5-004294b931a2@quicinc.com/T/
[2] https://clang.llvm.org/docs/SanitizerCoverage.html
[3] https://github.com/google/syzkaller/tree/master/tools/syz-testbed
[4] https://github.com/ramosian-glider/syzkaller/tree/kcov_dedup-new

v2:
 - assorted cleanups (enum kcov_mode, docs)
 - address reviewers' comments
 - drop R_X86_64_REX_GOTPCRELX support
 - implement ioctl(KCOV_RESET_TRACE)
 - add a userspace selftest

Alexander Potapenko (11):
  x86: kcov: disable instrumentation of arch/x86/kernel/tsc.c
  kcov: apply clang-format to kcov code
  kcov: elaborate on using the shared buffer
  kcov: factor out struct kcov_state
  mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
  kcov: x86: introduce CONFIG_KCOV_UNIQUE
  kcov: add trace and trace_size to struct kcov_state
  kcov: add ioctl(KCOV_UNIQUE_ENABLE)
  kcov: add ioctl(KCOV_RESET_TRACE)
  kcov: selftests: add kcov_test
  kcov: use enum kcov_mode in kcov_mode_enabled()

 Documentation/dev-tools/kcov.rst         | 124 ++++++
 MAINTAINERS                              |   3 +
 arch/x86/Kconfig                         |   1 +
 arch/x86/kernel/Makefile                 |   2 +
 arch/x86/kernel/vmlinux.lds.S            |   1 +
 include/asm-generic/vmlinux.lds.h        |  14 +-
 include/linux/kcov.h                     |  60 ++-
 include/linux/kcov_types.h               |  37 ++
 include/linux/sched.h                    |  13 +-
 include/uapi/linux/kcov.h                |   2 +
 kernel/kcov.c                            | 480 +++++++++++++++--------
 lib/Kconfig.debug                        |  24 ++
 mm/kasan/generic.c                       |  18 +
 mm/kasan/kasan.h                         |   2 +
 scripts/Makefile.kcov                    |   4 +
 scripts/module.lds.S                     |  23 ++
 tools/objtool/check.c                    |   1 +
 tools/testing/selftests/kcov/Makefile    |   6 +
 tools/testing/selftests/kcov/kcov_test.c | 364 +++++++++++++++++
 19 files changed, 981 insertions(+), 198 deletions(-)
 create mode 100644 include/linux/kcov_types.h
 create mode 100644 tools/testing/selftests/kcov/Makefile
 create mode 100644 tools/testing/selftests/kcov/kcov_test.c

-- 
2.50.0.727.gbf7dc18ff4-goog

