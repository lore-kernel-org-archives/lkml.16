Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81534610B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980087; cv=none; b=CUHI5YGCdojyH0juGqasRrvYy4FaeAgS9UhH4ecD+HlVM5z4IsyxVJqw51WJxwDTMWIA17s/GIILuf6Oi2Vi7SPy/HMh1VPrrtZGsYVtNTbhoQXvjbLrW1HDghF2NWjCH6BmF8JblQM+BhLIKy/40gGzxqL8+WcT/E5A9yYhGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980087; c=relaxed/simple;
	bh=bktEbC11ltHTmoTnljhEe9hWX6Banqk9ZcBh6U+q9gg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tv7VAav7QrftSNzOK7JHx/rNmcklfXxDWu6jCGYFyFXSUh1qrZFf+O9P3jme/5RKhOAuxcGIQqBdYNzBcXhf5t59E1SgjXjqAyEAtVzcpvUnS5JutSuX4kerHPNJvwusIgP2okklTqhGIs112H/ThMwQMJrOtOnQ5zUWqIyVUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1rhVlNl; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1rhVlNl"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-71e1c06f830so923239a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 18:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738980082; x=1739584882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h057a6wBvbw/h7/thrY5CNdcIWE5bhRIXwUHBVJJdVc=;
        b=c1rhVlNlymaLSr1XLRaN75MUBjp/RgAMFd3JTJHV3xpBuCABr6k9aD8aR/kN18bPLo
         OesCk1RaEHMFJBXLvGOyLeGyymbIXKD/Ukpqa2IbIeYmuqCdOaqCguBy2NOP6l1JqkC/
         HJw3AptAdjgtdluQKDEc/uQZxKLLZbZ7lzY6GSiE9NC583BuWQ56cojQGml86/ny2dyd
         M/Lfa6qZBI+VmFdnP22svs807Pjlac0mQ0O0PweflANVNFaxJ/AFi9lVCGKGBTdEUQSN
         OO5ohlg25Dgg5FnDDVs4/P7CH7t2QlmEObYtY1PiX/5t1ZDJO19x37s4rI50J3kTzRW0
         UlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980082; x=1739584882;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h057a6wBvbw/h7/thrY5CNdcIWE5bhRIXwUHBVJJdVc=;
        b=o+ipwH5MMbveZRr5D49BzrfrEyIiRtGIEtkpCcx3cYTG+HekQ0mSVVYNUxu9PDJv0F
         kjbe/Gwp0sqna1wekh9NLU8LHsLh43T0SSIj1Fq8pSF3Cct48yzt/QpjLYBy4Ye3vzJT
         N9MGOETSxEA6uBcvxotHLucMWZG6gxXLiffmCMFcx4p1Q5S8nXqZmPcRNGtHXM0HkEXM
         62hZ1LMKJG+hIrwiFoGIvxgvO18eDQN3mW5WjtReSk9nfMstIsbJUs3pEtTb8KxO0tuh
         icZDuVmulhCwk9Y4Ab6AeLId1SkEepfkerwSdpNqYbXHwHdfHCXv+NTynjtpzThK+baP
         xumQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWMchOTl+zNVL0gnGjzC9S2WiUo2R8fsuOGF2XhhOeW9Olko6f94YpUM0RhToF9zF6HOz1NA7KPM04Rak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbBKnP3JjfVen7uST3EYSYQrlXi+boElOg3El+7ZwJQNVjdtRm
	PTQsxFGUHQ8PMR0XBYVp0sKh1OC0NpYa36NXRS1R45w+KaSTxvYxW+XNFIVvB/ydCYu1ZQGuGEN
	YRR/uRbOXcYaJqaddtnZpAw==
X-Google-Smtp-Source: AGHT+IEeIQl7ICG4+Tc/ss00exHzkJsS1m2K/kNfEhqSBG/Hd5ytT4t77wwZci5K7lAYgGA5tByy2i89yzSGB3II1A==
X-Received: from otbel32.prod.google.com ([2002:a05:6830:71a0:b0:71d:e05c:915b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:4989:b0:71d:62bc:85ec with SMTP id 46e09a7af769-726b87f4aecmr3709624a34.13.1738980082581;
 Fri, 07 Feb 2025 18:01:22 -0800 (PST)
Date: Sat,  8 Feb 2025 02:01:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208020111.2068239-1-coltonlewis@google.com>
Subject: [RFC PATCH v2 0/4] PMU partitioning driver support
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

This series introduces support in the ARM PMUv3 driver for
partitioning PMU counters into two separate ranges by taking advantage
of the MDCR_EL2.HPMN register field.

The advantage of a partitioned PMU would be to allow KVM guests direct
access to a subset of PMU functionality, greatly reducing the overhead
of performance monitoring in guests.

While this feature could be accepted on its own merits, practically
there is a lot more to be done before it will be fully useful, so I'm
sending as an RFC for now.

v2:
* Rebase to v6.14-rc1, and take into account Oliver's debug cleanup
  changing some KVM handling of MDCR_EL2.

* Reorder patches to put related things closer together for easier
  reading.

* Ensure driver compiles for 32-bit ARM by defining 32-bit access to
  MDCR_EL2 correctly, which is called HDCR there. These will not be
  called due to the below requirement for VHE mode but a functionally
  correct definition seemed preferable to making it a no op.

* Rename parameter to reserved_host_counters to better reflect
  underlying hardware semantics and ensure host counters are easier to
  preserve.

* Document parameter with MODULE_PARM_DESC

* Restrict partitioning to VHE mode only. Using HPMN restricts the
  host counters to EL2 access only. Trying to make this work for the
  driver running at EL1 would require hypercalls for every access of
  those registers and a lot of additional handling at the KVM level.
  This would defeat the whole purpose of having the feature at
  all. Define has_vhe() on 32-bit arm to always return false.

* While Rob asked about making the parameter configurable at run time
  rather than boot time through sysfs, that is potentially very tricky
  because it is only safe to reprogram HPMN when we are certain no
  one, host or guest, is using any counters that might change
  ownership. If this is determined to be worthwhile, it should come
  after getting the core infrastructure right.

* While Marc asked about reusing the sysreg masks instead of
  redefining them for MDCR_EL2, that doesn't work because sysreg masks
  are only defined for arm64. I'm not sure how to avoid the
  duplication.

* Wrap code for determining if a counter index belongs to the host or
  guest partition in functions

* Typo fixes and additional testing

v1:
https://lore.kernel.org/kvm/20250127222031.3078945-1-coltonlewis@google.com/

Colton Lewis (4):
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Introduce module param to partition the PMU
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: Make guests see only counters they can access

 arch/arm/include/asm/arm_pmuv3.h              |  13 ++
 arch/arm64/include/asm/arm_pmuv3.h            |  10 ++
 arch/arm64/kvm/debug.c                        |   3 +-
 arch/arm64/kvm/pmu-emul.c                     |   8 +-
 drivers/perf/arm_pmuv3.c                      | 117 ++++++++++++++++--
 include/linux/perf/arm_pmu.h                  |   2 +
 include/linux/perf/arm_pmuv3.h                |  34 ++++-
 .../selftests/kvm/arm64/vpmu_counter_access.c |   2 +-
 8 files changed, 168 insertions(+), 21 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
--
2.48.1.502.g6dc24dfdaf-goog
