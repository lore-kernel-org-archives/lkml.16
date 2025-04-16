Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2BE22D787
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793700; cv=none; b=iiqosGmFWO51FBGtzBMtZfj1IKdrhqoJaglRv+HOh2ql9hMw8VrEFP6FzrnfHtOyYYWUzdUuIQIBTFWpzRJxjqRK53TxArECNAoxZrIi7Ygo6MKCuTt4luRRcgbMGCMDPUP67NLBuaYw3xQnpSZevpDDHh98tL317BN70RxZze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793700; c=relaxed/simple;
	bh=zjZ/RBuXceZsPVIaul8tS6WSj+8ZH60kv84R6Jp9hYA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NqgfKuYWO4AB1CYXLYBRVVrFQmQqPZgZaVsQ8ff8O/4uWkMWK+deEk/7TCUis1kzW++YyWJzqi1kQgD+4ItS/MaQlW9T1Icv3B2FvssDHcpoRYgwy/8QldbMegx5MrOhEL5xbzfn7+Uj4UCg4zZAGoCC/Q3Kamg6Tz3O50FN3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NGBuJegd; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NGBuJegd"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5f435440ea1so2937700a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744793697; x=1745398497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4V5sKaO6KF+CpbL0Hc6XBejXO7C4P5Jvce3Dn0tr8s=;
        b=NGBuJegdSYp/QazK4GToQeFbp1zIqlEf7ALxd35+zYdWuNMvVki3K0sBCcF8rt70UP
         Q1C6JF1InQuYUQNX4u5hyBuyakXXjoyuSBAnYgSCYh+F7FAd9l7v5whWVtViHS7hp+xo
         TkSsyvifFnwbbjI8sXGjNoMhgyuY7pmTWLwC1pe0QKYcgpls8M4CJc1W+Z5BwFSH13cu
         wIrRRXsXRgeZXn7FWtCqXRnVvNfJ8DfRWHaUGLNNUnEH51a7bk+qWtgR3/dK17OONe1b
         OCwkvvV7zyrbXgBVCFJOucU3SLJRfeLKCXJXZ0I2wiLXyPE7m7j0rYAiKtObW6jL5Ze7
         BL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793697; x=1745398497;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4V5sKaO6KF+CpbL0Hc6XBejXO7C4P5Jvce3Dn0tr8s=;
        b=AEw1m9lPl9omOuVZ2JJApqaxZ1lc+pNopq4KM4/459OlQ5MgtIpIkL+G4lbjaPvK0Z
         DkiVM5pJTVZBXigPNBEvO852TAx/Q/mfPnyVDz91eEwyIQUBhbgKr/uYU4DxaLMl8cIb
         3g6lulwMfL+KZ/qIDhaNkoKVtyMh7Y3/yYy+2Xv1m+9wgvOHBkb0S75036PRlXybiIuv
         Pg4XQidJjDDfUwUnJCqzCM3oSIJEvwKZAlzmvXdaZMza4Y3h358soIZUkUxZbumCEGjp
         TUQkj8NGfGOSO6KTWxcLL+2m5tmEzndnsjwcAheWuI7ZS0BrTEA886A2727Mhh5BChXM
         av3A==
X-Forwarded-Encrypted: i=1; AJvYcCX0bMNWkSpDvr3UydAQ1uULtxLjJ0HHNPr5DNRUvgyM78/ItQ6DKzIqC3cUUsnMIOzLaKNNEjzlIxDus78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxStXf3c7j8MlHni0D9rh9pPyOoU992Iq02Qu2ySguKAnNGFjA1
	nOQ4dxUDvJGr004WaXsMxrKk5REYreRpJueXVw1owAsGcKEMnnnev28+S345DFYFLR5QFZAl+QC
	J7Q==
X-Google-Smtp-Source: AGHT+IGc1IErpT2e0qqB8H7TMX31OLLWJfP32Sp5/cbyuxPIVBbSZjoCaouIFD2y59n9WEiTSvSvmt6gCt8=
X-Received: from ejbo18.prod.google.com ([2002:a17:906:3592:b0:ac2:9a4c:6337])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9721:b0:acb:1184:cc29
 with SMTP id a640c23a62f3a-acb42d39990mr80502766b.59.1744793696746; Wed, 16
 Apr 2025 01:54:56 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416085446.480069-1-glider@google.com>
Subject: [PATCH 0/7] RFC: coverage deduplication for KCOV
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

The current design does not address the deduplication of KCOV_TRACE_CMP
comparisons; however, the number of kcov overflows during the hints
collection process is insignificant compared to the overflows of
KCOV_TRACE_PC.

In addition to the mentioned changes, this patch adds support for
R_X86_64_REX_GOTPCRELX to objtool and arch/x86/kernel/module.c.  It turned
out that Clang leaves such relocations in the linked modules for the
__start___sancov_guards and __stop___sancov_guards symbols. Because
resolving them does not require a .got section, it can be done at module
load time.

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
[4] https://github.com/ramosian-glider/linux/pull/7 


Alexander Potapenko (7):
  kcov: apply clang-format to kcov code
  kcov: factor out struct kcov_state
  kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
  kcov: add `trace` and `trace_size` to `struct kcov_state`
  kcov: add ioctl(KCOV_UNIQUE_ENABLE)
  x86: objtool: add support for R_X86_64_REX_GOTPCRELX
  mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init

 Documentation/dev-tools/kcov.rst  |  43 +++
 MAINTAINERS                       |   1 +
 arch/x86/include/asm/elf.h        |   1 +
 arch/x86/kernel/module.c          |   8 +
 arch/x86/kernel/vmlinux.lds.S     |   1 +
 arch/x86/um/asm/elf.h             |   1 +
 include/asm-generic/vmlinux.lds.h |  14 +-
 include/linux/kcov-state.h        |  46 +++
 include/linux/kcov.h              |  60 ++--
 include/linux/sched.h             |  16 +-
 include/uapi/linux/kcov.h         |   1 +
 kernel/kcov.c                     | 453 +++++++++++++++++++-----------
 lib/Kconfig.debug                 |  16 ++
 mm/kasan/generic.c                |  18 ++
 mm/kasan/kasan.h                  |   2 +
 scripts/Makefile.kcov             |   4 +
 scripts/module.lds.S              |  23 ++
 tools/objtool/arch/x86/decode.c   |   1 +
 tools/objtool/check.c             |   1 +
 19 files changed, 508 insertions(+), 202 deletions(-)
 create mode 100644 include/linux/kcov-state.h

-- 
2.49.0.604.gff1f9ca942-goog

