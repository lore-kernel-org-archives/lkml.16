Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7B1DED7B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473412; cv=none; b=YiU5n5s5M5gz5TGxXrzAp5TjXJKr3RvCLFCML9TVy51AzIae2HrguXgXx0o//bn2iuNdk854eo3sZiK5uU2vlWRC27FrSTjHCvskL3d87stbSPh5RvBH+nsO34P+e9yr2oWIzgQ1zzepxff7u/+NpjM2x+5DRnrLM4bi3cKps+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473412; c=relaxed/simple;
	bh=mEl2tABsYET07IVIEVcBJJPOHVcHBG41Kgp+nuudG0s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XOtgOLDILRAA4hQNc6I7zRF/OTtwrjTZlaHq28hPq2O6jnVZPiIiDtDJXg5Vn61plEsfz/LJZSXnNLfsOBTTAHdFSd3SqqxA5QxV0EMIHBb9f7E6u/X9oy5xxBwDZJHUXK6Lgp0g8tRj8XCrMrdLv6AXyPU2HcwcDbuRtWtuf3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxRo7vzm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxRo7vzm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so21232375e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473409; x=1748078209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zKD1fr0dvFZDx0Vf0ovMWaJSxRQOPPlPOTZc3cisH8g=;
        b=nxRo7vzmxFdwfRQVwhVWHUB7tHnWhzeumINDt6Uk9/jPZNtuUp9OSKIAhkjqtGnlDI
         gmDynMGEIi+Xbero9z+1pB6kz+nRqcsZoWV7ilO8zCTFNZ02rlykjfuNcqtQwgL8rJVa
         42OGs+KkLd07vz5NBrOCUEnlp3T483nm3OdcYqSs3ayUjpIF5h9d7wUa/2boJCkIgA6g
         7odphc8ZBSSRM6Z6SkPD1E1A0Y/jaFU+xSdIQvlHWtAe7TZiiWMthtDiMbDbBvV8hnAE
         NKQzmB9eHi0tPBTsQqggpo5fNJUtqffSJ2jMhLcRf97Ql/2R3Gm5gU9aFH24HN1Uh5/7
         GnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473409; x=1748078209;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKD1fr0dvFZDx0Vf0ovMWaJSxRQOPPlPOTZc3cisH8g=;
        b=YrVAro7HwED6TSTkvDKfPWcaDBxoFrHR8K0DsEsvcia81oIR2kZus2dV+GdpdMJ4nE
         QjwRkBRYHs/RnJun4Q8T0fjqmIYVr76VZskUl73Y9V6in+y3yrBz0Wm/b20R3IgIgDtL
         XIVsd/hNXtbYTTNhMvXUSUYrMrJmfIY1vnAKBDHxSx+8T191u7J9KG522Avj2nmFEi+W
         tW98Ys7v+IAOL/wyf0D/Imz8wqAzMXmZp6ZQ8k0R/TS1Jr8g4J6fHLdJ3jIwaCHGQqSc
         dBl4AWG+dunDNwYfxDBEvDAj8odkFXrOad279DNQjvdCki++B/xCMeaG5nlNgNEUEBGn
         Vgyg==
X-Gm-Message-State: AOJu0YzJlm6sotB4cHxvgPK3JV/DDoRyCK9x0aqzdTw6hOQwN3ZHysTB
	v5odvzW13J2vgsla4hgE1gWtiwXa5NqE4F0gIiSLwySMApXJVR2gf5PIFtkiNjlrONk9A9oF/GQ
	3LPkl+6bmpGIBYfMbw3EjDviGTEWB6eOwHP+LXcYm8BJR5Y2BMd5XOrbx9gM0HR0U6IGSoO8hXj
	upKRDIES8gcQANpGwfiFVPpEy7Dp9DW7YA8g==
X-Google-Smtp-Source: AGHT+IGyYWQaw2GQ1dD3LJr69FRR+08Xl05dJLdFoDbr0O8fpTHpcK2JoD07YC12jPeRWGMjH28zSjTw
X-Received: from wrbgv14.prod.google.com ([2002:a05:6000:460e:b0:3a3:5c33:ea66])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:400f:b0:3a0:83a2:1e79
 with SMTP id ffacd0b85a97d-3a35c809269mr6334406f8f.11.1747473408786; Sat, 17
 May 2025 02:16:48 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066; i=ardb@kernel.org;
 h=from:subject; bh=HkynXQGOwcEnvLYd/alnjVwYq3hXZ1GTwA3A7xff43E=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+MfDqBV1L6Y4ML54tS7D7Wh/xZsMRU/tNRqtO6UNV
 RkTV87tKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMpKmb477c/18zzHdMvTk6p
 ppkRxxr/p2voxzw1ZLv+97zUsQsOFxkZHpgf3vOP6Vg52+l8cYO/tQmFyUcsTnI0ewrMS5e8nST ABAA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-8-ardb+git@google.com>
Subject: [PATCH v4 0/6] x86: Robustify pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
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

This series drops the early variant entirely, and makes the existing
late variant, which is based on cpu_feature_enabled(), work as expected
in all cases by tweaking the CPU capability code so that it permits
setting the 5-level paging capability from assembler before calling the
C entrypoint of the core kernel.

Runtime constants were considered for PGDIR_SHIFT and PTRS_PER_P4D but
were found unsuitable as they do not support loadable modules, and so
they are replaced with expressions based on pgtable_l5_enabled(). Earlier
patching of alternatives based on CPU capabilities may be feasible, but
whether or not this improves performance is TBD. In any case, doing so
from the startup code is unlikely to be worth the added complexity.

Build and boot tested using QEMU with LA57 emulation.

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

Ard Biesheuvel (6):
  x86/cpu: Use a new feature flag for 5 level paging
  x86/cpu: Move CPU capability override arrays from BSS to
    __ro_after_init
  x86/cpu: Allow caps to be set arbitrarily early
  x86/boot: Set 5-level paging CPU cap before entering C code
  x86/boot: Drop the early variant of pgtable_l5_enabled()
  x86/boot: Drop 5-level paging related variables and early updates

 arch/x86/boot/compressed/misc.h         |  6 ++--
 arch/x86/boot/compressed/pgtable_64.c   | 12 --------
 arch/x86/boot/startup/map_kernel.c      | 21 +------------
 arch/x86/boot/startup/sme.c             |  9 ------
 arch/x86/include/asm/cpufeature.h       | 12 ++++++--
 arch/x86/include/asm/cpufeatures.h      |  3 +-
 arch/x86/include/asm/page_64.h          |  2 +-
 arch/x86/include/asm/pgtable_64_types.h | 31 ++++----------------
 arch/x86/kernel/alternative.c           | 12 --------
 arch/x86/kernel/cpu/common.c            | 26 ++--------------
 arch/x86/kernel/head64.c                | 11 -------
 arch/x86/kernel/head_64.S               | 13 ++++++++
 arch/x86/mm/kasan_init_64.c             |  3 --
 drivers/iommu/amd/init.c                |  4 +--
 drivers/iommu/intel/svm.c               |  4 +--
 15 files changed, 41 insertions(+), 128 deletions(-)


base-commit: 4375decf50f74878e73c29c9dcd8af51dd3f7376
-- 
2.49.0.1101.gccaa498523-goog

