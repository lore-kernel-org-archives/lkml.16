Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90A202978
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406638; cv=none; b=o8LRu7WtYWT7SseIvqOB7z8+w3FFP0GwB6W12dCUF1iyxeT8aQ2yooNdY+N1XglmBRrK3VVPGEE4m9aVjUD0VfyHEuN/Xv2LyD2v9Ie6jgQufHa/ZxOz0f5iRCME7t4NkBD6cjVPjU+B0F9Cd9MlFkSEfDY/PzU+xnLcjSbqag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406638; c=relaxed/simple;
	bh=k3Bn/GBxkfNx/u4lwNAFdGdIkKWNz1KfOT2CNV/pQCc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XO/N9raf1P2UWiarIkFIHfEHMpotmDJ5ZDm+geJ9aHGvPGCWzd8ihCa2NAKQawa9+tlJ34DZ27mJQDMaqOVtzrNhsJNUdCqi6XqOvMUFsNfe/d7kUbM/i4ss10540NrDuZFEYaYPW6zEO4yyy5qbWEX4P4vdZoVrduv9KLOes5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aSqLbbDt; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aSqLbbDt"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so2176071f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406635; x=1746011435; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+Jgdo0E/3+F++54iSxrOokJDtZIP7Sy3xrh+eNgtec=;
        b=aSqLbbDtFRM98iVCiQIG0bftvVPdTAKzkmqpLDFPldmR2WUyIRTXo2YGcjD8rODZZQ
         C2ImAMB61xu5ujEGXGqG6wyzRJBt1Dx18m7iCljzHMY0VudDcr5hbcrfTP0DIw+ttO/S
         1nFwHsaX8nWmpu0Alvr3jlcxTXgWhWennJzk8I9whWw5+y2ThIkjZfDQqxYQ3xPLJA7w
         L//m9h9lwwuL+9evf0BYEw/KbPaJeYvA/UVvR7TwHZZ2VDUP3C5ljRvLTzL4ik/oMg9J
         TVIsNHreCJALThbpz2qjlLSEk+SYDF8GNA1oDGnsPf3G7wahoeKJYCX9gWS1Q86/Rjgg
         LWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406635; x=1746011435;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+Jgdo0E/3+F++54iSxrOokJDtZIP7Sy3xrh+eNgtec=;
        b=rVhQ8RyM+dOGeg3BelRJVU1FBrDMN1714LEwHfzldP+ZLWPN32gxsrfpukkWeTVcpj
         zdtcZ+mJePA3m1Nurppd2SeF5o44kPwitzH59haqhUmFGLa+8qfQKpRHBKVVQ9jZ+DWT
         SStflnTOw7SsfN2Scc3H2L/PiEvPSkR2lNOrOWyk6eC0rdFesY5nm8FhegLlbd+EOvnl
         CzgAioh3N47kIS4l2YloO5lIU7pbROcM+xIoUDwnu3vOLtjUhUI56sH8zeJsvcArQUCQ
         4uCLBxkrZtTaNg4iaOFp7BaqJmQn2clxF+2EpJccbIIzDlvxf2qylE6Dd29BHMZJ7FBE
         k79g==
X-Gm-Message-State: AOJu0Yx94TsVVlPkmAUmKZYlIhlmSuWTfnYpG+GjQ4dCly/sS/CwYT1C
	xYEhYqkcXf0ln0BOkqhDK9Gxd7F8DMNYEW7K+QENpInAkJbKymfrLR39LWMaL36spRK3HXb9En3
	AkW3uzqNPx+Hf49rH6K/08eGDDP29IDicUZwH8FxknpO6dA6KmZXIPyYIL4JzTgNQb1qVPbfjBF
	abH8HXG0GkOgfNvQu40wNvo+LDPX04zw==
X-Google-Smtp-Source: AGHT+IH2YISglLSqfDiqsez4L1Y7R2x7evvEn/OLPoRH4Tz9n3j+Yd+5GGsnkRg0ugTYxwyVIT9CR0GF
X-Received: from wre10.prod.google.com ([2002:a05:6000:4b0a:b0:39a:d20b:5c20])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:178d:b0:39c:1258:2dca
 with SMTP id ffacd0b85a97d-39efbaf22d7mr14574151f8f.59.1745406635141; Wed, 23
 Apr 2025 04:10:35 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090; i=ardb@kernel.org;
 h=from:subject; bh=F1iFvvG9z8EAcxJtrjR9394llOYTs56SJlf/F0unljM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPjVKPeEh4r2/ZvrPt7mr5PW9Ft+Hz5diu5g9cP5m2Yt
 /HZ/07ejlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRk+KMDBuLI9xXP0ozdru0
 JjyR/YvshlNJ/jMebQg9fqLu0hKdqNMM/xP26O4yTxHY9mDLPMuueVc8a5P6DH9W206+sHi2t+u JVj4A
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-13-ardb+git@google.com>
Subject: [RFC PATCH PoC 00/11] x86: strict separation of startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a proof-of-concept series that implements a strict separation
between startup code and ordinary code, where startup code is built in a
way that tolerates being invoked from the initial 1:1 mapping of memory.

The current approach of emitting this code into .head.text and checking
for absolute relocations in that section is not 100% safe, and produces
diagnostics that are sometimes difficult to interpret.

Instead, rely on symbol prefixes, similar to how this is implemented for
the EFI stub and for the startup code in the arm64 port. This ensures
that startup code can only call other startup code, unless a special
symbol alias is emitted that exposes a non-startup routine to the
startup code.

This is somewhat intrusive, as there are many data objects that are
referenced both by startup code and by ordinary code, and an alias needs
to be emitted for each of those.

This ultimately allows the .head.text section to be dropped entirely, as
it no longer has a special significance. Instead, code that only
executes at boot is emitted into .init.text as it should.

This series is presented for discussion only - defconfig should build
and run correctly, but allmodconfig will likely need the last patch
omitted. 

Ard Biesheuvel (11):
  x86/linkage: Add SYM_PI_ALIAS() macro helper to emit symbol aliases
  x86/boot: Move early_setup_gdt() back into head64.c
  x86/boot: Disregard __supported_pte_mask in __startup_64()
  x86/boot: Add a bunch of PI aliases
  HACK: provide __pti_set_user_pgtbl() to startup code
  x86/boot: Created a confined code area for startup code
  HACK: work around sev-startup.c being omitted for now
  x86/boot: Move startup code out of __head section
  x86/boot: Disallow absolute symbol references in startup code
  x86/boot: Revert "Reject absolute references in .head.text"
  x86/boot: Get rid of the .head.text section

 arch/x86/boot/startup/Makefile      | 26 ++++++++++++++--
 arch/x86/boot/startup/gdt_idt.c     | 17 ++---------
 arch/x86/boot/startup/map_kernel.c  |  6 ++--
 arch/x86/boot/startup/sev-startup.c |  3 ++
 arch/x86/boot/startup/sme.c         | 31 ++++++++++++--------
 arch/x86/coco/core.c                |  2 ++
 arch/x86/include/asm/linkage.h      |  6 ++++
 arch/x86/include/asm/setup.h        |  2 ++
 arch/x86/include/asm/sev.h          |  2 +-
 arch/x86/kernel/cpu/common.c        |  1 +
 arch/x86/kernel/head64.c            | 19 ++++++++++++
 arch/x86/kernel/head_32.S           |  2 +-
 arch/x86/kernel/head_64.S           | 16 +++++++---
 arch/x86/kernel/setup.c             |  1 +
 arch/x86/kernel/vmlinux.lds.S       |  9 +++---
 arch/x86/lib/retpoline.S            |  1 +
 arch/x86/mm/mem_encrypt_amd.c       |  2 ++
 arch/x86/mm/mem_encrypt_boot.S      |  6 ++--
 arch/x86/mm/pgtable.c               |  1 +
 arch/x86/platform/pvh/head.S        |  2 +-
 arch/x86/tools/relocs.c             |  8 +----
 21 files changed, 107 insertions(+), 56 deletions(-)


base-commit: 121c335b36e02d6aefb72501186e060474fdf33c
-- 
2.49.0.805.g082f7c87e0-goog

