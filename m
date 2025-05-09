Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C179294A0D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796634; cv=none; b=D6UhLefET0gqgM59bk6YD8l0NwbuWbhj2i2ZaA370JgaAxT1m0nKPZK3n0M5tLczUNKeQc/7qNHfFowUpoHAKdQlvxkJJ9kmJalrv4DDumjd54OGaPGdaOvnmgEZTCNFL10Q8RGrPlsT52gmhJ55pu7/pdneBBKleB/xTI4FuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796634; c=relaxed/simple;
	bh=B0zHJx0l5Xb8WBxT0akPWMO2vZgmXim5DcgNC6Ar/5A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YXcMJuRycU4mpokBiwVq29KQZsoWVDO243+5yrrB4yddjjZXo96E0VOB2j6v9ncVHxClHwlIvO0VMqevspZ8OlY8y73OSk4gLS3LmUPzC2MoVx1D29zlVn7nFg/dEwJYkTgLbwEfioAWmvo16lWVNe6awt9kfnyekwti4I3gzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S6oYz8Hy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S6oYz8Hy"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a0b7c8b3e2so1385927f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796631; x=1747401431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7gSbBmwEbrzvNYYQSCJBfxoOPDdFppaV9wKD8t7PFc=;
        b=S6oYz8HyVUtEp8hbxVylCIrA57LGqD8tnx5AXMRMhMD8PZ2322/ZGFv8qJrzXPaDPm
         myR4q26uRUuUwHtkwih6nqoSzOoUTARA4iBw+0Ib4bC354FEFqB207M5BVstc0+P7vTY
         6JuQy8AevCVKvreg/3HidHeHOB3WtIfDoDvZJxb6kpuzAqWL/IoFgQWOKeuFmfpIYaog
         9U/WbJVItrEz7wz0QbQBt8QEX1ZqXapz9UW/2p9M20UQS7AR+V9jGWPIMSryGJjxVtcU
         PWLqixJ8eQmW/tTWm3YCLAJp62aHZVMRJrKWwHR9lwJWVB1A9fgA6W9ehyoGCujMVHbI
         uvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796631; x=1747401431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7gSbBmwEbrzvNYYQSCJBfxoOPDdFppaV9wKD8t7PFc=;
        b=DV3NdAdkrKpL3tiCNEH2M0pryCS9/Ka8LNoVYrRzVbXL7J9fuSxTCcJaHAUTnFi09P
         xR+pfRkEeYRa/4wR6h8TR6q73JmvnRDhAOyt2vvHe8M1EVaMhHEqymf3cKojY+aIDF46
         F4xcDtMrOMKkHLeZpwwbUYdOUdZJWHEdwpzQkYKMk/1pg1pWHjMz9/pt2neZOBcnBZkH
         /znqJ0T+3h4ib43Q8JzISyHzxS/x5qUD2MRZzICZAwbbBJhBTgGgDC58F/aQpn/N8Tev
         FYKv9+GW5YDSm1BjQFnZajGDNkljPfxaB2T5fzf2Guij980dKw/vQUISzm/LR0GW5Uc9
         8p5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8bSDs1XVnY0Axpd8qtT/BgMWuN0nfbd3uvGn3u5ThCgPz6DPpBO/3zlgV1UVynwus0CRZ4k7fE2m1QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWjLTHO7KXmXcv4GzvxuYJI0Ak2mcJNsITox32+x1A47BBeiy
	I/U8NzxuW4IKoPPDZUr/lT6JpMUzU9iHZxQRCi7CleaF7JIIxQ8iMKK2w2+Y12gmX8+guHd5Qx0
	wkkaFW9dpCpBMrWedLA==
X-Google-Smtp-Source: AGHT+IFi6w9266SPSYPxeLRdeQM8z/1XJhDeBgZ2t8xI6U1+Kw8j1L1qN5yPWtzyq3Jue0kea8Vb5SL0z32sr5OS
X-Received: from wmbfm20.prod.google.com ([2002:a05:600c:c14:b0:43d:8f:dd29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e3c1:0:b0:3a1:f654:ebec with SMTP id ffacd0b85a97d-3a1f654ec75mr2409729f8f.38.1746796630943;
 Fri, 09 May 2025 06:17:10 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-1-vdonnefort@google.com>
Subject: [PATCH v4 00/10] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This series adds support for stage-2 huge mappings (PMD_SIZE) to pKVM
np-guests, that is installing PMD-level mappings in the stage-2,
whenever the stage-1 is backed by either Hugetlbfs or THPs.

The last patch of that series is an optimization for CMOs using a shared
PMD_SIZE fixmap.

Changes since v3 (https://lore.kernel.org/all/20250407082706.1239603-1-vdonnefort@google.com/)

  - Rebase on kvmarm/next

Changes since v2 (https://lore.kernel.org/all/20250306110038.3733649-1-vdonnefort@google.com/)

  - Fix PUD_SIZE -> PMD_SIZE enforcement (Quentin)
  - Rework pkvm_host_share_guest() to remove one hyp_page walk (Quentin)
  - Remove one pgtable walk into __check_host_shared_guest() (Quentin)
  - Return EBUSY on host_share_guest_count overflow

Changes since v1 (https://lore.kernel.org/all/20250228102530.1229089-1-vdonnefort@google.com/)

  - WARN_ON() on !PAGE_ALIGNED size for guest CMOs (Quentin)
  - check_range_allowed_memory() before accessing the Vmemmap (Quentin)

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (8):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Introduce for_each_hyp_page
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  16 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 276 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 +++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  15 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 ++++----
 12 files changed, 375 insertions(+), 195 deletions(-)


base-commit: c4e91ea0cc7e6345a4f7b8167e838d728ca86c30
-- 
2.49.0.1015.ga840276032-goog

