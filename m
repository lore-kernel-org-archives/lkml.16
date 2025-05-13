Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1D1F1524
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134734; cv=none; b=TqnfSL3kKbz1TtSVe8hh8UAiT9Aj/MS7H3b1ugdZO0y7yip06dHwkpFOYiCZyKu99jzHl/bj5xFQ7cxZk4bPshAbQueEzMzF8J2AeIiaTcsmJcFH4k6Z8X2g2h0ffkY3x6qa+pMPCDyoO6fywa7LZJavqVSbVG+3YzLwAmqjzHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134734; c=relaxed/simple;
	bh=M9P7VRjiur5eiBsdHWVXIbYdrgK+gj/vR98rbxJXJ2k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gSOslGoCt/GWSPd1G/V96IVtRegCAOcNUcF+TlZRX7RfZo2YMW8dT56QWlZcNSG1cl/9fP+mZQPfoOGsM/0M8dbh4GCaXlsOssQikxyt0VF+6MWi8ytBXQTM4A4RhqdHsZrNjdvsOBiW/kBp9/mPjJmGmxk/IY8HXPM+Xt7P5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WloXRm6Q; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WloXRm6Q"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442d472cf84so25438645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134731; x=1747739531; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ngcvtqpR9Tn8jFsVifDyueNdjhYIsQYD3EAF0jbHFh8=;
        b=WloXRm6QgFPyPb8vRS0X1jGCjzqVqFVMLe0Kq5qzG+VdMr2U+DQhSaCBTFFxESCMJ1
         4xKbbwp2tXFU2i8fpGMbMLa/UUuIabGrHC21rsaoZuQYM/yay1+vPL7fGc+EZ/dRUdko
         I/7W1qInzrP/6hIFNb8RMjDulKoqk8gtQFinnV3kRuwj9FXSNKacGSPZjW9Du5Ycr8vM
         8zd1CM0RiB41B/RMN1OR1YRbUa9r9RH2Hj30Q0eQ2ZdYVEJDDBFOK5sJHN/B0vOBII+W
         2Rc0u179nES+5bs3uZug+I8btMOSsYDnNAsgjXi8WtNNbND/0t7/u08BfkdVvXVdu5Lm
         k24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134731; x=1747739531;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngcvtqpR9Tn8jFsVifDyueNdjhYIsQYD3EAF0jbHFh8=;
        b=qAxvR8H+iJjK1lCeWkFmjKDN3GOB8g80+R95Ye4fHizZGA3Y2hG12D3UYyeA62O9+w
         y6pbx9S43MBvGNOIyyua8aOR5g3uNjbH2JmuANDibvgCwgJnZqqWnThzVVibfAxbHk/R
         1Znf9VvuABf6TLjGfq5bHvkMbiQmu21Fo+S9QIM/UvXXntJDZEl27IS9S/vtWJaHIOb5
         AecjWqTOzH2bKaZR3RjCGjM+P1Vu/oZXAnI+gEpGUapGnL/v+yHrDfvkdOhtonwPRY9T
         seJiSqU+QTUzGqKHo4rwCfpuexD8RmK9wc0vxwBeUNh/bo33Qw4Zzzx0X2QjlZVZNJi9
         56Qw==
X-Gm-Message-State: AOJu0Yzyfj03glio0hGH3neRNbanvpc+Osk0wprvSVLuoBDaOD1VUJn9
	Gr9bDvzFW5a/VJBNyduLy3oj14mTWU81P0jM/NxSMR5lphUqRWiF4kTzUdI9MJgzpPPSUlfZuLC
	TGMSjDgdEr1ATQmJJWand6LuZz2xpjC4coveQCPvEVInXyqYvSJ8Y/oeuQ9cXfOBmRRTvO7fvLR
	H316VsGM56bYRDPAs6uhpfyf9rNQTE1Q==
X-Google-Smtp-Source: AGHT+IF3MWu4KeYYq8hq4QObOlcoZzORSwnxHyD5HOpqIr/iLmn0q1hoGsBAZXGJXde6NxFh+UJHvHPF
X-Received: from wmqe12.prod.google.com ([2002:a05:600c:4e4c:b0:43d:47b9:bedd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1550:b0:441:c1ea:ac35
 with SMTP id 5b1f17b1804b1-442d6d64ad8mr151723355e9.18.1747134730686; Tue, 13
 May 2025 04:12:10 -0700 (PDT)
Date: Tue, 13 May 2025 13:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3583; i=ardb@kernel.org;
 h=from:subject; bh=iPNFYXxPwV7mBvJmmEiXtkP/28HwPYJoMx3uTro64pM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZ498r1gkMaibGjhsSfrc/fLdD8eyuf8tMtRzq79Tsm
 hGenGfQUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyyZuR4czthXu2JPux/t7e
 mMZWxq7973jO9L3/Kg++U3q4avkuln6G//X23Kt6WgwWyR/fJ/emo8ZMum+3jtvJd7uf/1tWahr 1kgsA
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-8-ardb+git@google.com>
Subject: [RFC PATCH v2 0/6] x86: Robustify pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
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

[0] https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/

Cc: Ingo Molnar <mingo@kernel.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>

Ard Biesheuvel (6):
  x86/boot: Defer initialization of VM space related global variables
  x86/cpu: Use a new feature flag for 5 level paging
  x86/cpu: Allow caps to be set arbitrarily early
  x86/boot: Set 5-level paging CPU cap before entering C code
  x86/boot: Drop the early variant of pgtable_l5_enabled()
  x86/boot: Drop 5-level paging related variables and early updates

 arch/x86/boot/compressed/misc.h                  |  8 +++---
 arch/x86/boot/compressed/pgtable_64.c            | 12 ---------
 arch/x86/boot/startup/map_kernel.c               | 24 +----------------
 arch/x86/boot/startup/sme.c                      |  9 -------
 arch/x86/include/asm/cpufeature.h                | 12 ++++++---
 arch/x86/include/asm/cpufeatures.h               |  1 +
 arch/x86/include/asm/page_64.h                   |  2 +-
 arch/x86/include/asm/pgtable_64_types.h          | 25 ++++--------------
 arch/x86/kernel/alternative.c                    | 12 ---------
 arch/x86/kernel/asm-offsets.c                    |  8 ++++++
 arch/x86/kernel/asm-offsets_32.c                 |  9 -------
 arch/x86/kernel/cpu/common.c                     | 27 +++-----------------
 arch/x86/kernel/head64.c                         | 20 +++++----------
 arch/x86/kernel/head_64.S                        | 15 +++++++++++
 arch/x86/kvm/x86.h                               |  4 +--
 arch/x86/mm/kasan_init_64.c                      |  3 ---
 drivers/iommu/amd/init.c                         |  4 +--
 drivers/iommu/intel/svm.c                        |  4 +--
 tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
 19 files changed, 61 insertions(+), 140 deletions(-)


base-commit: ed4d95d033e359f9445e85bf5a768a5859a5830b
-- 
2.49.0.1045.g170613ef41-goog

