Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07411298254
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017515; cv=none; b=FoR38SPyELN51D3Mmr5QZAtMETiS1jdKE8glFmNeArgFhntPqwXFP1ZAY3TGIFqbzEfvffp0/+JZ2M8tmFUnXWbvodMk2qEa8jjnLeZ51m/6o94TEVq6ajw1JaGPWzfRfdh2ak8zmRS17exlIIcH6XX/bWdwgyuQ+ALwKFg7U4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017515; c=relaxed/simple;
	bh=A2BpuinKfRRJqdFOqpQpb5+40ap/YpRsvM2as1c/Yj0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=evhs2fQwKLoCb65NKxmWx7bC525HnJfbJJPue3JxHiNLvNVneTMGJcSK/4EbhuEhMLdYRlHl+bih34+pCSa2EPuclFioKER6TOEnhJV+4yuVA7F9BdX0+xDLplRmlo+LY1MTMTiVp7ikb3P80ax239SUWrIaf7LTdKQEOnsXDig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nGKEoDxO; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nGKEoDxO"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e896e116fso126777a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748017513; x=1748622313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T2d9+v8yG6VYGRmA7bp1ipRCsMBjg+oAKgA4CiXnFY0=;
        b=nGKEoDxOG4YzaticOHvNm5tUM6C+J2rsI4YN/d4ee0k7TSYbJ3E4fh971pT9AL9o7C
         OBk8CHbZ9n7bnujBfgSrvAEMiHsbGnXFCqzLx2WEH49/L8XAU0Eoj+HWkFNPmqfTiY0J
         lvhvZZ+xH4Gg1Is8wo9eyYjozOUEfholvc+XASe1X0XKHV7L+kTWJR6L9XfuQIdWdc2M
         dZSjXGk7a05RqWZl+esLFUEyXWc5QkAzPoE3WPit1ivyXU0tM/bm8X96cU+elnmkCgAA
         x9BmTZz7n+Z7g2QCKnnWcTw3ad3fzdqRczDaXs4xtPWeBxfC8znHp6lPksfsy+zkpC+Y
         8jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017513; x=1748622313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2d9+v8yG6VYGRmA7bp1ipRCsMBjg+oAKgA4CiXnFY0=;
        b=wvibYokS48VgipxJxEmXktYWQewXgweb9RZgRWeuS8G8O8bmX11O38v25qv4E/+U26
         aG0z8LO+oulk2KCf+rmRvKUIH/UMdOQdI6Y6V+eWuLAYT9UCnXogmaJhUqM3+3OKeiOe
         AQYzB327KSqNKOkxhgaBZUbE257kQBEHpC4R4wtSPmPYPGHf/QTNu0DfC3NEjegKiVSt
         Fds4poEz6exqqXOccp7CWsKzxIfKcRnAilNKnY6EHI0PmQ8y140GR9AD1NQGu6rEcDo+
         eTyp1CYujxC8LwKVdEp++6kU96Ne4BW/32yqOrz/yygqFsaP3mEgvnQI7/7wPq+Tjn1R
         fagQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyiBhkZHMF4+K+bhTbQbvZi3Awj5d7CwYQwABi15k2dXLpWXx59FPdLsd2/udWQNpZng4Jc1QP3E28+cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbkAgDknqurhTypzsDXzMQbAfrtQeMIQdyQqNtBJEWPFMx0MV
	PHFYP9HDgNPDdUEwQflZvOP41r+VwQxqdKhbw54Rfianl1j6CBaYmWg7HkXoNyxc1MzAc1piFSz
	3SPflFQ==
X-Google-Smtp-Source: AGHT+IHPeJDTujm+huK+5lKp95SS/kzsRWJkGcEFDt/c/tZ/8t0fbm6cjrcqfSNRCogVYKRhZdB5OcKygRs=
X-Received: from pjbqn14.prod.google.com ([2002:a17:90b:3d4e:b0:2fc:201d:6026])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b45:b0:30e:823f:ef21
 with SMTP id 98e67ed59e1d1-30e83228e05mr36988963a91.32.1748017513310; Fri, 23
 May 2025 09:25:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 23 May 2025 09:25:01 -0700
In-Reply-To: <20250523162504.3281680-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523162504.3281680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523162504.3281680-5-seanjc@google.com>
Subject: [GIT PULL] KVM: selftests changes for 6.16
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for SNP and MGRLU in selftests, and add a test verify fastops
(which was easier than walking PeterZ through getting a guest running with
unrestricted guest disabled :-D).

The following changes since commit 45eb29140e68ffe8e93a5471006858a018480a45:

  Merge branch 'kvm-fixes-6.15-rc4' into HEAD (2025-04-24 13:39:34 -0400)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-selftests-6.16

for you to fetch changes up to d166453ebd2925edde24872d9b8ac60065eb0618:

  KVM: selftests: access_tracking_perf_test: Use MGLRU for access tracking (2025-05-16 12:58:21 -0700)

----------------------------------------------------------------
KVM selftests changes for 6.16:

 - Add support for SNP to the various SEV selftests.

 - Add a selftest to verify fastops instructions via forced emulation.

 - Add MGLRU support to the access tracking perf test.

----------------------------------------------------------------
James Houghton (3):
      cgroup: selftests: Move cgroup_util into its own library
      KVM: selftests: Build and link selftests/cgroup/lib into KVM selftests
      KVM: selftests: access_tracking_perf_test: Use MGLRU for access tracking

Maxim Levitsky (1):
      KVM: selftests: access_tracking_perf_test: Add option to skip the sanity check

Pratik R. Sampat (9):
      KVM: selftests: SEV-SNP test for KVM_SEV_INIT2
      KVM: selftests: Add vmgexit helper
      KVM: selftests: Add SMT control state helper
      KVM: selftests: Replace assert() with TEST_ASSERT_EQ()
      KVM: selftests: Introduce SEV VM type check
      KVM: selftests: Add library support for interacting with SNP
      KVM: selftests: Force GUEST_MEMFD flag for SNP VM type
      KVM: selftests: Decouple SEV policy from VM type
      KVM: selftests: Add a basic SEV-SNP smoke test

Sean Christopherson (4):
      KVM: selftests: Add a test for x86's fastops emulation
      KVM: selftests: Extract guts of THP accessor to standalone sysfs helpers
      cgroup: selftests: Move memcontrol specific helpers out of common cgroup_util.c
      cgroup: selftests: Add API to find root of specific controller

 arch/x86/include/uapi/asm/kvm.h                    |   1 +
 tools/arch/x86/include/uapi/asm/kvm.h              |   1 +
 tools/testing/selftests/cgroup/Makefile            |  21 +-
 .../selftests/cgroup/{ => lib}/cgroup_util.c       | 118 ++-----
 .../cgroup/{ => lib/include}/cgroup_util.h         |  13 +-
 tools/testing/selftests/cgroup/lib/libcgroup.mk    |  19 +
 tools/testing/selftests/cgroup/test_memcontrol.c   |  78 +++++
 tools/testing/selftests/kvm/Makefile.kvm           |   5 +-
 .../selftests/kvm/access_tracking_perf_test.c      | 281 +++++++++++++--
 tools/testing/selftests/kvm/include/kvm_util.h     |  35 ++
 tools/testing/selftests/kvm/include/lru_gen_util.h |  51 +++
 tools/testing/selftests/kvm/include/test_util.h    |   1 +
 .../testing/selftests/kvm/include/x86/processor.h  |   1 +
 tools/testing/selftests/kvm/include/x86/sev.h      |  53 ++-
 tools/testing/selftests/kvm/lib/kvm_util.c         |  21 +-
 tools/testing/selftests/kvm/lib/lru_gen_util.c     | 387 +++++++++++++++++++++
 tools/testing/selftests/kvm/lib/test_util.c        |  42 ++-
 tools/testing/selftests/kvm/lib/x86/processor.c    |   4 +-
 tools/testing/selftests/kvm/lib/x86/sev.c          |  76 +++-
 tools/testing/selftests/kvm/x86/fastops_test.c     | 165 +++++++++
 tools/testing/selftests/kvm/x86/hyperv_cpuid.c     |  21 +-
 tools/testing/selftests/kvm/x86/sev_init2_tests.c  |  13 +
 tools/testing/selftests/kvm/x86/sev_smoke_test.c   |  75 ++--
 23 files changed, 1273 insertions(+), 209 deletions(-)
 rename tools/testing/selftests/cgroup/{ => lib}/cgroup_util.c (88%)
 rename tools/testing/selftests/cgroup/{ => lib/include}/cgroup_util.h (91%)
 create mode 100644 tools/testing/selftests/cgroup/lib/libcgroup.mk
 create mode 100644 tools/testing/selftests/kvm/include/lru_gen_util.h
 create mode 100644 tools/testing/selftests/kvm/lib/lru_gen_util.c
 create mode 100644 tools/testing/selftests/kvm/x86/fastops_test.c
