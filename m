Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7027932A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737719; cv=none; b=P2zymnlanKsIOH6yunb2NZtBHOgh32WcMiWZb17js1n9lV1WEK1CV0F8zOAVWDwQZwCqRCp8mvserCUspFdCH+asZgmaxuHWHXl69DWIAzST2C2iJ6m92EfhQNz5kjLA5/z99sYKWCnXVRNGM74QZiNje2GwHSuCkaUPbSFOsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737719; c=relaxed/simple;
	bh=5+DdnQrD8Jm7ALCp3LsrdVZBmTTMhmvX4Okxp7+4aZE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gt6GlpcgzWWhw0q7PMWinEZMn1ajsp5Fqh+Wu2wcVZdeLMJ7CxwtxnuU5qdWqYJSTjRMQ8TJH+mnhRjFUHo4ZHrOlZ2noUt2LZp10vOBySMUGaWxqnoIYZiF5ROvO8DZyz2HVCMqWxPyqdNV07orK9nLWZluSaUKFKeoSYgLb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yp0bVz6p; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yp0bVz6p"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43eed325461so31616405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737716; x=1748342516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=syvU+98K4794Raf3X6G+lZLkSQNhm8MB57r88GVHtjY=;
        b=Yp0bVz6pNBShaMjr51z6Hvxj2vjqyeYm/5rAZ+3/RwIOpiY2VKLh6mj+JvhGNWhJYc
         BnSAkAEyijMAfiDsNlZv6CdKf7lWrTeQDy1bvt0JxsphVlISCefCnCrec4lbvgwDG6bs
         XOixVbnTt+9XPIIB59neoAhjYi1NkuxOuu7SYXGZCvcywwYBAsxRlzMrszAyqqF2dD6O
         LV1U4O/2DaY9AiUJG36HVYhjuppVcFbkpk9oKLrJZ52mml8T1F3+wbZ7/vuAWXV0In3S
         kVyzeG1V926ts0p/FU+yAilgvdZYUY0eavd6mZ+OXt3p2X9NMhgoDUbPPjI8XXrjg1AP
         MwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737716; x=1748342516;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syvU+98K4794Raf3X6G+lZLkSQNhm8MB57r88GVHtjY=;
        b=Dv9JDr59EX+Y+Gc4O/PBg2qRdlOMmGbHpnwT2zWdXVJFWFAhWQ3eCEP/xDW27s2VsZ
         3QCVksjUdzQUdNotevXNT5MUmNbAKM/GO0gfayzSS9EqRaBzrwUSdC+Sf7LiMpJFSX9q
         W9L/9dOialZ1WGfa9wt7s+XgcVabIQV5BBUY13C/sjgAgV+QPiwPyWuHJQsgqSK5n5GU
         7Ka0KpAWmGvROMml4WTJiPIwFE+tFuuEPFGK2s80pL7vANd4UgY0aLK/EDNtzVqnh6BL
         tvUJqLGfFDTzSC36fakh/HjMfWiICfT1qdrGKJuNsTPan6uVTreJdbVu+cGcESKu+CX+
         2hzA==
X-Gm-Message-State: AOJu0YxB4mKEVGiBGb3lMX6zb1CUHSS2rovABWoTIeKB+6L4qCbiM/uU
	+k3E6whNgsPFptHWFoYl8A1/QBdzxD2RYaAOtq9r4iNxTxON4ZUi57o4YWjmp6dIeuxw5atGEa3
	TYbZQgOxDHndxkCAC4VkDvgD2oUnYhwzC88BSsB4sw/P9D9Pl9EuOqJVh62Mthy+MNd1jSsXEjP
	XNFZ2VOqOnWOo6OTIioIfCAivj1wdGYcFRbQ==
X-Google-Smtp-Source: AGHT+IHkTafgnDTkldvnfKXwrHhcaDnjGVxDAfPbmXSQMWezNOea/JqGoCUrkPujtq4FH7yTvRedyn+j
X-Received: from wmbei7.prod.google.com ([2002:a05:600c:3f07:b0:442:e9ed:dccc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c8:b0:43d:abd:ad0e
 with SMTP id 5b1f17b1804b1-442ff000bf6mr117767795e9.18.1747737716491; Tue, 20
 May 2025 03:41:56 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4847; i=ardb@kernel.org;
 h=from:subject; bh=aHOyYap++8M1FZ4FuojjmVoeUUIngzDbPEyELQnz7z8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJuVcyFGbAG77t+8XvzXjaE97vpBptte+Qyuzjb+EV
 nLOCgnuKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNpy2f4w2cY+ugZL1fYIj5t
 wWn5Ymmq+k52Zy9JLpzO99q55uRMaYb/7ryP53Pd47kjbL30TVK21M4Ols0u+/PmnzLlYT2n+s6 UFQA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-9-ardb+git@google.com>
Subject: [PATCH v5 0/7] x86: Robustify pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
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

This revision of the series still provides a single implementation of
pgtable_l5_enabled(), but no longer based on cpu_feature_enabled(), for
a number of reasons:
- fiddling with the early CPU feature detection code is not risk-free,
  and may cause regressions that are difficult to debug;
- Boris objected to the use of a separate capability flag, and using the
  existing one is trickier, as it gets set and cleared during the boot
  by the feature detection code a couple of times, even if 5-level
  paging is not in use
- by their very nature, manipulations of level 4 and level 5 page
  tables occur rarely compared to lower levels, so it is not obvious
  that the code patching in cpu_feature_enabled() is needed.

So instead, collapse the various 5-level paging related global variables
into a single byte wide pgdir_shift variable, and move it into the cache
hot per-CPU section where it can be accessed cheaply. Set it from asm
code so C will always see the same value, and derive
pgtable_l5_enabled() and PTRS_PER_P4D from it directly, ensuring that
all these quantities are always mutually consistent.

If pgtable_l5_enabled() requires more optimization, we can consider
alternatives, runtime constants, etc. but whether this is actually
necessary is TBD. Suggestions welcome for (micro-)benchmarks that
illustrate the perf delta.

Build and boot tested using QEMU with LA57 emulation.

Changes since v4:
- Add patch to fix MAX_PHYSMEM_BITS (and drop an occurrence of
  pgtable_l5_enabled())
- Re-order the changes and split across more patches so any potential
  performance hit is bisectable.

Changes since v3:
- Drop asm-offsets patch which has been merged already
- Rebase onto tip/x86/core which now carries some related changes by
  Kirill
- Avoid adding new instances of '#ifdef CONFIG_X86_5LEVEL' where
  possible, as it is going to be removed soon
- Move cap override arrays straight to __ro_after_init
- Drop KVM changes entirely - they were wrong and unnecessary
- Drop the new "la57_hw" capability flag for now - we can always add it
  later if there is a need.

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
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Borislav Petkov <bp@alien8.de>

Ard Biesheuvel (7):
  x86/mm: Decouple MAX_PHYSMEM_BITS from LA57 state
  x86/mm: Use a single cache hot per-CPU variable to record pgdir_shift
  x86/mm: Define PTRS_PER_P4D in terms of pgdir_shift()
  x86/mm: Derive pgtable_l5_enabled() from pgdir_shift()
  x86/boot: Drop USE_EARLY_PGTABLE_L5 definitions
  x86/boot: Drop 5-level paging related global variable
  x86/boot: Remove KASAN workaround for 4/5 level paging switch

 arch/x86/boot/compressed/misc.h         |  8 +++---
 arch/x86/boot/compressed/pgtable_64.c   | 10 --------
 arch/x86/boot/startup/map_kernel.c      | 18 +------------
 arch/x86/boot/startup/sme.c             |  9 -------
 arch/x86/include/asm/page_64_types.h    |  2 +-
 arch/x86/include/asm/pgtable_64_types.h | 27 ++++++++------------
 arch/x86/include/asm/sparsemem.h        |  2 +-
 arch/x86/kernel/alternative.c           | 12 ---------
 arch/x86/kernel/cpu/common.c            |  3 ---
 arch/x86/kernel/head64.c                |  9 -------
 arch/x86/kernel/head_64.S               |  5 ++++
 arch/x86/mm/kasan_init_64.c             |  3 ---
 arch/x86/mm/pgtable.c                   |  4 +++
 13 files changed, 26 insertions(+), 86 deletions(-)


base-commit: 54c2c688cd9305bdbab4883b9da6ff63f4deca5d
-- 
2.49.0.1101.gccaa498523-goog

