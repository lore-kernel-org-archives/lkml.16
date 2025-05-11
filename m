Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983B4315E
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746962561; cv=none; b=Jqs8vKjQ0DrEyk5aBxDw/mfBxYH4H8z9UxOzqRLQ6NaEFEFC8wTiKKzKk9QF9FbUXMw+WLGD49UsGzLbngJ/nKsZoY+MetTBKqFJ6t/10APkNFQlCKEmYUamUE66oT+Yz3px+TTxsDF23Xm37PWZC5kDfTmZtIStU3eAElNsa04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746962561; c=relaxed/simple;
	bh=xMg4bh+bQA+IPFAhVKIA/zhq5G+/gV3IsMQRSnrn8ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o4UyPefjZOqvc2i7fxctRSoGSOdBCzJq54wD2C1Xh54DIrAZgTjrvawE12Jh7aBWfo31b0/hwn4fdFZEZ6BNvF0WXc1Zfrv7frnfFumEdHEUO+/eVVtTMHEYNLADv8Z5B16+GWrqdj7TssqoLyRnzKcFHp8bHLYpes4aNVcpcfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aLCrLbca; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aLCrLbca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746962557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/EODiwMTIGjE0ilIelFQY+bLRs3QQynzSkDS0Rn1VtM=;
	b=aLCrLbca7LUykbH0ZLTaQeegPS+5dQIHbFrv8xJconlMVztLTbayRi1LOSh3awcFoIiLxb
	o++gUWO/Jqr0tgtMXRytn6G0mnPbMNIS5GaBqCK3rzx6crcWiRGzXtwnNeXEphlW9jtuUV
	tOEn1c7YXYwrAjJQcqkHoREmss/U7lI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-3OcuhxnIOSuBn7Xi57D4Rw-1; Sun, 11 May 2025 07:22:32 -0400
X-MC-Unique: 3OcuhxnIOSuBn7Xi57D4Rw-1
X-Mimecast-MFC-AGG-ID: 3OcuhxnIOSuBn7Xi57D4Rw_1746962548
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ad24107fc5eso68829766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746962547; x=1747567347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EODiwMTIGjE0ilIelFQY+bLRs3QQynzSkDS0Rn1VtM=;
        b=rUQzQzOUJWz7pCSppAemk7cRjcv5tCbB2LbibP8cssUKav4CpL1lTU7SFJ0vWZ+GId
         HRSEvY/5P3FaOat+/ScoBPu7sYKBgVuPqLiIz2uHTLklExpkrUNISCSDL1kdC5hKylP5
         l7J4OYmh+ntamFfL6ZAaLeBsKv/mSrh9Tjix8Yyi/CsTRHCcm2yTBytltU45TwyXSXx2
         Ji875IhoBRd4VJjPJgeIg56mT3P2b3wZmXNEr1t0q2cRtINo8lMKAUUoucXNYDYwYTzN
         826xxFrhqOMZBxgCaJCrOpnDg39tUfyryaun/5yglKu42YAOyMjryhh9PaICiHwkMY/W
         xvrw==
X-Gm-Message-State: AOJu0Yy3cFnWWoP8T9skPAees8oQXHHZNDvJKjGvFhQp5nNnheCVFtPZ
	xPPah6vnpCE0bUDdba7ojXJ2GO+1FbwH8ppSQqWevIKo1cN6ezHCQByi/2qeWaRpmzzDOGGVmlj
	exiHnwNzUN75oAr6QThU2O8LUbh5nxtKKZXSq0kr0gnuHh8/UZgmVoKL7V/xtT8rNIpUazw==
X-Gm-Gg: ASbGncs8OipvaJ1hVtveKJiQ/+/opljBUz6zGxCOXPDKWoi65CFqmPjAkIN9K+xisa4
	k7bPACaq1TP0HFAwoclpazwU1paInOasFfX0T/0sW/4DrSZhuFFcfSfn+KDK1FmauJqEaR1d4kA
	+eNfWlSTIxcSgTEAfyv0+Xg2LZlw1c1yoJMeRa6IBebVvntFI7RmMBYeHyYQuj9ajWhTpEmQNeh
	AI5nloo3+ySN2xlFua8dsKHU1YXGH45FWsDT1RNgyPLiYy19h2M8t5jpONaOu4uzx9+GW0J2eiR
	EW4qFy+3lRBy8Yg=
X-Received: by 2002:a17:907:9444:b0:ad2:532e:abde with SMTP id a640c23a62f3a-ad2532eafffmr47907666b.1.1746962547496;
        Sun, 11 May 2025 04:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYeSjy1KdQYUnm++WAgswDRuwlIqOy1LMznzsEtnEw1htUbIqZluyhKPquF82ELDvFe7A6HQ==
X-Received: by 2002:a17:907:9444:b0:ad2:532e:abde with SMTP id a640c23a62f3a-ad2532eafffmr47904966b.1.1746962547048;
        Sun, 11 May 2025 04:22:27 -0700 (PDT)
Received: from [192.168.122.1] ([151.62.197.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23da570desm232018466b.118.2025.05.11.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:22:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM changes for Linux 6.15-rc6
Date: Sun, 11 May 2025 13:22:23 +0200
Message-ID: <20250511112225.47328-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus,

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/kvm.git tags/for-linus

for you to fetch changes up to add20321af2f882ad18716a2fb7b2ce861963f76:

  Merge tag 'kvm-x86-fixes-6.15-rcN' of https://github.com/kvm-x86/linux into HEAD (2025-05-10 11:11:06 -0400)

----------------------------------------------------------------
ARM:

* Avoid use of uninitialized memcache pointer in user_mem_abort()

* Always set HCR_EL2.xMO bits when running in VHE, allowing interrupts
  to be taken while TGE=0 and fixing an ugly bug on AmpereOne that
  occurs when taking an interrupt while clearing the xMO bits
  (AC03_CPU_36)

* Prevent VMMs from hiding support for AArch64 at any EL virtualized by
  KVM

* Save/restore the host value for HCRX_EL2 instead of restoring an
  incorrect fixed value

* Make host_stage2_set_owner_locked() check that the entire requested
  range is memory rather than just the first page

RISC-V:

* Add missing reset of smstateen CSRs

x86:

* Forcibly leave SMM on SHUTDOWN interception on AMD CPUs to avoid causing
  problems due to KVM stuffing INIT on SHUTDOWN (KVM needs to sanitize the
  VMCB as its state is undefined after SHUTDOWN, emulating INIT is the
  least awful choice).

* Track the valid sync/dirty fields in kvm_run as a u64 to ensure KVM
  KVM doesn't goof a sanity check in the future.

* Free obsolete roots when (re)loading the MMU to fix a bug where
  pre-faulting memory can get stuck due to always encountering a stale
  root.

* When dumping GHCB state, use KVM's snapshot instead of the raw GHCB page
  to print state, so that KVM doesn't print stale/wrong information.

* When changing memory attributes (e.g. shared <=> private), add potential
  hugepage ranges to the mmu_invalidate_range_{start,end} set so that KVM
  doesn't create a shared/private hugepage when the the corresponding
  attributes will become mixed (the attributes are commited *after* KVM
  finishes the invalidation).

* Rework the SRSO mitigation to enable BP_SPEC_REDUCE only when KVM has at
  least one active VM.  Effectively BP_SPEC_REDUCE when KVM is loaded led
  to very measurable performance regressions for non-KVM workloads.

----------------------------------------------------------------
Dan Carpenter (1):
      KVM: x86: Check that the high 32bits are clear in kvm_arch_vcpu_ioctl_run()

Marc Zyngier (5):
      KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
      KVM: arm64: Prevent userspace from disabling AArch64 support at any virtualisable EL
      KVM: arm64: selftest: Don't try to disable AArch64 support
      KVM: arm64: Properly save/restore HCRX_EL2
      KVM: arm64: Kill HCRX_HOST_FLAGS

Mikhail Lobanov (1):
      KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception

Mostafa Saleh (1):
      KVM: arm64: Fix memory check in host_stage2_set_owner_locked()

Paolo Bonzini (3):
      Merge tag 'kvm-riscv-fixes-6.15-1' of https://github.com/kvm-riscv/linux into HEAD
      Merge tag 'kvmarm-fixes-6.15-3' of https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
      Merge tag 'kvm-x86-fixes-6.15-rcN' of https://github.com/kvm-x86/linux into HEAD

Radim Krčmář (1):
      KVM: RISC-V: reset smstateen CSRs

Sean Christopherson (2):
      KVM: x86/mmu: Prevent installing hugepages when mem attributes are changing
      KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=> 1 VM count transitions

Sebastian Ott (1):
      KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()

Tom Lendacky (1):
      KVM: SVM: Update dump_ghcb() to use the GHCB snapshot fields

Yan Zhao (1):
      KVM: x86/mmu: Check and free obsolete roots in kvm_mmu_reload()

 arch/arm64/include/asm/el2_setup.h              |  2 +-
 arch/arm64/include/asm/kvm_arm.h                |  3 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h         | 13 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c           |  2 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c                 | 36 +++++-----
 arch/arm64/kvm/mmu.c                            | 13 ++--
 arch/arm64/kvm/sys_regs.c                       |  6 ++
 arch/riscv/kvm/vcpu.c                           |  2 +
 arch/x86/kvm/mmu.h                              |  3 +
 arch/x86/kvm/mmu/mmu.c                          | 90 ++++++++++++++++++-------
 arch/x86/kvm/smm.c                              |  1 +
 arch/x86/kvm/svm/sev.c                          | 32 +++++----
 arch/x86/kvm/svm/svm.c                          | 75 +++++++++++++++++++--
 arch/x86/kvm/svm/svm.h                          |  2 +
 arch/x86/kvm/x86.c                              |  4 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c |  8 +--
 16 files changed, 210 insertions(+), 82 deletions(-)

