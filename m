Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CC1F4611
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219384; cv=none; b=ZbUps8duDCVhZjLkADn6dXIaC7yBT6jpDNo6Mj5zaimOCXVhKyvznwZBeoPXBNaJ7gl2mVGWAElBL5/8UlrUD4DJFxBQzmsLLn7r8bN/PnBBQ/OL5keya0+ctTK7vfSoIslf0WUjREepD/yOYhHFtaSMawGNperKOkDzK9BAj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219384; c=relaxed/simple;
	bh=yxpRDaXQ0oD5yOuhFsK/cjE9fYO5RsIUokYtNCOOmU0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fyh17YZvDE9hPJmkJ/rMD6jzyjj+EMV0/engMrQLjW7AOHpKQsNT3ZEtm6FR0wXK6fL6gi2SRmJiaVw8d/NMQqKGHa//YXo5EQZGjbPWsXQF5wFkCINdZ9K9xj3CrbRxl1/vMX//HDNYiB8dVuEXDDWPC5/78M6Z0cFU3HXptss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i62khi/x; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i62khi/x"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442cd12d151so46207295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219381; x=1747824181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tWcLVbqvM8OdX8Xrj0W4Do+rrn8NbuSF3KWq+UJch+4=;
        b=i62khi/xIjqJBOPiOF/QJVXpGuIl/Q1bZ3f9ooHyjCkoafGbcDe4ylQ6ikOBKHfhoL
         kB2I36tqN94ExikYbT356iWpJEO9QEJ9lkOc0QET8Kk40pUxSEKaSvw+pItyO7YfW5TR
         nW/61EUsWrWAh48/zpnl9ZH+oOQ7sXT1ttzXLTeu3KaBcoL5oaxGL698A4VN3d3TT0+U
         Yoid5gs7WLVeFw/shGnTClGibgqrYB3PVEM45vXcHSc2zyhjKsKl+fFjlQQyg5StczOk
         tYnB0vBjATNGJzRaFVqWiGXEw45Z3lHXnees6v66SSVpRbyvWRPWBlYtyxTimL5L/p3Y
         K0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219381; x=1747824181;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWcLVbqvM8OdX8Xrj0W4Do+rrn8NbuSF3KWq+UJch+4=;
        b=VqqG/tZ7OaccLBFRt+EAe4Etrjq4m8FbJbF8lW1L9qO61DZTmSERYaPSwfGGDXoblh
         xOuX3fmdbJChdjtvnoRGUiEg+/AUMXMKx7gJ/Pdho9uyTz2qk3/9jYzAJP4o80n0nNqE
         LqIOh/WyqW2ibVIVzMUuhiaDzlbbv4cNSTxQFKwO3L0FlyYANk8VUdw2k9FtB1eQi11y
         1FmDv5sn9EUhesMaZSvImzSQvy/Eo1lWBC4ry0zedFq9mDcHf1mzsTPm6KOi+Y2rBy8D
         cksioNBf8a0OVihLqlePiERQooB7PNfbH2QHFtqHAZQQCrp5J8C+GTD7u/w0lQ83cWCl
         QFAA==
X-Gm-Message-State: AOJu0Ywjzmjw78giX/0XMnrsMujY2OMCmmfYc9R39G+i0xP52P8+RhXQ
	5lYnoZKcjAl+JXYENeA00aDIwrScLwn0iNQ5koRbngls315kS5mj5vQyOxdWf3yDLafwe5+7oah
	jwreeq40f1224kEoP9HtqHBaelfOWHOmlSsFAy3xh02KFoT6QesshoxuOlXDqhQcK/ROXaSp4Bm
	z16jWVqiZJYqrj6mTtPosF7MvhKLASqQ==
X-Google-Smtp-Source: AGHT+IFmHiQzSODKtQPB3eZ+mlgjWeZ7UetSBHXxKn0JAVIb5Yh0OaZHqnrS1iGnElaynESwat71Odv+
X-Received: from wmbes27.prod.google.com ([2002:a05:600c:811b:b0:43b:bd03:5d2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e11:b0:441:b5cb:4f94
 with SMTP id 5b1f17b1804b1-442f20baefamr28591775e9.5.1747219381017; Wed, 14
 May 2025 03:43:01 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966; i=ardb@kernel.org;
 h=from:subject; bh=QjHGIO6l5Tyo84ulsaWQKmauCBnGuK5nh/dokZsyLV8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleDEjx25Jm7Kln1S+sS/4cec989ONNfWy9azXt+gVu
 r08vC6go5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwkj4Phn0JW47Fj21fvU3kU
 OP8re4ekkn6Uqt1lG7UHlxgKPG+Wr2FkmHnzSJKB9Ev3K9vC1x9NKRIU7P914yRrYVrqt19slgt 92AE=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-9-ardb+git@google.com>
Subject: [PATCH v3 0/7] x86: Robustify pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a follow-up to the discussion at [0], broken out of that series
so we can progress while the SEV changes are being reviewed and tested.

The current implementation of pgtable_l5_enabled() is problematic
because it has two implementations, and source files need to opt into
the correct one if they contain code that might be called very early.
Other related global pseudo-constants exist that assume different values
based on the number of paging levels, and it is hard to reason about
whether or not all memory mapping and page table code is guaranteed to
observe consistent values of all of these at all times during the boot.
Case in point: currently, KASAN needs to be disabled during alternatives
patching because otherwise, it will reliably produce false positive
reports due to such inconsistencies.

This v2 drops the early variant entirely, and makes the existing late
variant, which is based on cpu_feature_enabled(), work as expected in
all cases by tweaking the CPU capability code so that it permits setting
the 5-level paging capability from assembler before calling the C
entrypoint of the core kernel.

Runtime constants were considered for PGDIR_SHIFT and PTRS_PER_P4D but
were found unsuitable as they do not support loadable modules, and so
they are replaced with expressions based on pgtable_l5_enabled(). Earlier
patching of alternatives based on CPU capabilities may be feasible, but
whether or not this improves performance is TBD. In any case, doing so
from the startup code is unlikely to be worth the added complexity.

Build and boot tested using QEMU with LA57 emulation.

Changes since v2:
- Drop first patch which has been merged
- Rename existing "la57" CPU flag to "la57_hw" and use "la57" to
  indicate that 5 level paging is being used
- Move memset() out of identify_cpu()
- Make set/clear cap override arrays ro_after_init
- Split off asm-offsets update

[0] https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/

Cc: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Gerst <brgerst@gmail.com>

Ard Biesheuvel (7):
  x86/cpu: Use a new feature flag for 5 level paging
  x86/cpu: Allow caps to be set arbitrarily early
  x86/asm-offsets: Export struct cpuinfo_x86 layout for asm use
  x86/boot: Set 5-level paging CPU cap before entering C code
  x86/boot: Drop the early variant of pgtable_l5_enabled()
  x86/boot: Drop 5-level paging related variables and early updates
  x86/cpu: Make CPU capability overrides __ro_after_init

 arch/x86/boot/compressed/misc.h                  |  8 +++---
 arch/x86/boot/compressed/pgtable_64.c            | 12 ---------
 arch/x86/boot/startup/map_kernel.c               | 21 +---------------
 arch/x86/boot/startup/sme.c                      |  9 -------
 arch/x86/include/asm/cpufeature.h                | 12 ++++++---
 arch/x86/include/asm/cpufeatures.h               |  3 ++-
 arch/x86/include/asm/page_64.h                   |  2 +-
 arch/x86/include/asm/pgtable_64_types.h          | 25 ++++---------------
 arch/x86/kernel/alternative.c                    | 12 ---------
 arch/x86/kernel/asm-offsets.c                    |  8 ++++++
 arch/x86/kernel/asm-offsets_32.c                 |  9 -------
 arch/x86/kernel/cpu/common.c                     | 26 +++-----------------
 arch/x86/kernel/head64.c                         | 11 ---------
 arch/x86/kernel/head_64.S                        | 15 +++++++++++
 arch/x86/kvm/x86.h                               |  4 +--
 arch/x86/mm/kasan_init_64.c                      |  3 ---
 drivers/iommu/amd/init.c                         |  4 +--
 drivers/iommu/intel/svm.c                        |  4 +--
 tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
 19 files changed, 55 insertions(+), 135 deletions(-)


base-commit: 64797551baec252f953fa8234051f88b0c368ed5
-- 
2.49.0.1101.gccaa498523-goog

