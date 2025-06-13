Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C71369B4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797877; cv=none; b=B7qmGRCKBL4iRy/uloXzlM6IjmPU4NDxPod3JWtvlUXI4oDqTrruvLJAkWCvSbQSoZmbS4GadedDdLX7Zuw5NUm0wEyAuVI3oIrTylAMDn27CouQAQ7UCm8t9i+oG3DkWDHB+O1UE+65jMMWpZJzPpTEFM8UeBU2O3fZoRuG2T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797877; c=relaxed/simple;
	bh=OzxxhvnXD4pJdWD/IczN9cmkZHmzL3IvfnlClBASSBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2CKef158S+JWtU/fHAYH0osGRfv9y2lKwm2FagqYj4j2Yv5ucBAxdhHQmoctVBHIbbe2t5lI89HA2TMdWGu/+mps6UdjUGC+vi/CmWnsfKHhaMWopaxw5c5k/8tz9ySxr34iCkMFAOC9501cyh8Wi08HHg2DNBiBMhJwLj0e7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=drF97ypt; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="drF97ypt"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so1236284a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797875; x=1750402675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fS5629Jr+WvAX+3s1UFysCJ0aoAPCHlpZZzgXeCc68k=;
        b=drF97yptGlc77hHH7NEOS/m0EQQv0OHTTxYcdwiAlDtTAETVOdJIlH3GDK2A6jyEqp
         VqitUlU3Fq0w9S8PmlxxbQfGHK23JKwSR5jpgO8IXgFLrrsYY28mhmsUmZ+E1/1NynG1
         MRucD25YJ4zjKcIv2hZQ7YvtD2qi6iUCPwFmH5fCB3bspq5xTs1cdrDAINCeHnGgqS4b
         v6TgQ4wrXruOJjOZLiRUP3Owbf6VFAeBZ9fwERTFBCpn1H2fSk9nkORjKyc/VeQhlcfa
         tc2Lqvu93eSn6iOjqQWJfJ1K+Z+3N/uX8g1DUORUE5YOlYtIw0Dn7GQu8UUw2lqJfZQX
         89Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797875; x=1750402675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS5629Jr+WvAX+3s1UFysCJ0aoAPCHlpZZzgXeCc68k=;
        b=bcekt4eqhKGAc6csGNFUGNxX69aZ5SBod4KPitcrlWAvsddqATyyfc4YQpqsozKs4+
         Dv140it1qHOz1zp6S+TZPcaSb+je9ZA2zBpqIgRFsBzfuALvJpF/w32Xn3KM9W4sRMM7
         KLdQ6VaJ1A4ritvzJAd2gXoUS0adUEhxPvgT36mFK+64U1yyva73W6+kBJxwi0vmBkbp
         O4NYj5AoAynXd190iaAep+ntijTIKwXo1sFa5UWuKtc5fbewqfw5q1DZFdWB2o1/aYMg
         7XxZmu6W49R0dFe406E+JQDqVzKReAJyf/5RV7ZFUIkKtzYmTyO+R37PWn87Lnj6Fqwl
         fbJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk4v2n1r/ZfuFFUTlpeiLTIpvhHXnRq9WNrs8ci4u5p/VFMhoztV/Doht8pQSbt5g5PGwA80a+DMYVUes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2mPYdhbLCdt+Vsx6ceRbHgf4XIjxIpr6cZuR7UdYTCLUYHfn
	wsQvTOhRtKZubXXjhKyodZPTwqtGG748a8UA/RPnhuNkQrUtvNe7Qvv9EftQ3juvSew=
X-Gm-Gg: ASbGncsgnBwC2rAp1hFEogF/j643PsboYFzKTUhKYh2NZPv3I0Ud+ad2lW8Zo9ENhiL
	49UAz5MQVIwYlgS+ohiqJnzPMpCbJ9aVI/Q7OPERZuhMbKIv7b0c8T2lpBdvvq2qh0Df73CoAPy
	SHbqM7oO7nCftW7RHP14Nb2rIsF6ZU5yPecQBwLeg2e2lVOKq+hP5XPas0FyFYOGzGR02mrUvaB
	ppROiRYtCiTh2rRemxItADuVspSI56gyURtOg1X8JbTnjN6Cnrx1tNDdL0VvO0HHXc10KpENAXx
	/SfSn83CODaiJXpoHL8690jEUAOY+H3NtJP/ssP0t29oRNQv/1gNsvSj/XPxe3EUsFSyPtHKi2C
	jN38YOv00C2zyZSF4YVE=
X-Google-Smtp-Source: AGHT+IGbcwSxBXFORB1F4UP8rztiMzZ/iN/4l/08KXt3P8+HxU0t7mDVGHn5YSyDBavfM4IMvKl4yQ==
X-Received: by 2002:a17:90b:184e:b0:311:ea13:2e6d with SMTP id 98e67ed59e1d1-313d9ec5adamr2880839a91.29.1749797874839;
        Thu, 12 Jun 2025 23:57:54 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:57:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 00/12] MMU related improvements for KVM RISC-V
Date: Fri, 13 Jun 2025 12:27:31 +0530
Message-ID: <20250613065743.737102-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series primarily has various MMU improvements for KVM RISC-V
and it also serves as a preparatory series for the upcoming nested
virtualization support.

PATCH1 to PATCH2: SBI spec related fixes in SBI RFENCE extension
PATCH3 to PATCH6: Few cosmetic improvements
PATCH7 to PATCH8: TLB maintenance related improvements
PATCH9 to PATCH13: MMU related preparatory work for nested virtualization

These patches can also be found in the riscv_kvm_mmu_imp_v2 branch
at: https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased upon Linux-6.16-rc1
 - Dropped PATCH1 and PATCH2 of v1 series since these are queued
   as fixes for Linux-6.16
 - Addressed Atish's comment on PATCH1 in this series
 - Added new PATCH7 in this series

Anup Patel (12):
  RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
  RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
  RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
  RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
    KVM_REQ_TLB_FLUSH
  RISC-V: KVM: Don't flush TLB when PTE is unchanged
  RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
  RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
  RISC-V: KVM: Factor-out MMU related declarations into separate headers
  RISC-V: KVM: Introduce struct kvm_gstage_mapping
  RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
  RISC-V: KVM: Factor-out g-stage page table management
  RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs

 arch/riscv/include/asm/kvm_aia.h    |   2 +-
 arch/riscv/include/asm/kvm_gstage.h |  72 ++++
 arch/riscv/include/asm/kvm_host.h   | 103 +-----
 arch/riscv/include/asm/kvm_mmu.h    |  21 ++
 arch/riscv/include/asm/kvm_tlb.h    |  84 +++++
 arch/riscv/include/asm/kvm_vmid.h   |  27 ++
 arch/riscv/kvm/Makefile             |   1 +
 arch/riscv/kvm/aia_device.c         |   6 +-
 arch/riscv/kvm/aia_imsic.c          |  12 +-
 arch/riscv/kvm/gstage.c             | 338 +++++++++++++++++++
 arch/riscv/kvm/main.c               |   3 +-
 arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
 arch/riscv/kvm/tlb.c                | 110 +++---
 arch/riscv/kvm/vcpu.c               |  26 +-
 arch/riscv/kvm/vcpu_exit.c          |  20 +-
 arch/riscv/kvm/vcpu_sbi_replace.c   |  17 +-
 arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
 arch/riscv/kvm/vm.c                 |   7 +-
 arch/riscv/kvm/vmid.c               |  25 ++
 19 files changed, 795 insertions(+), 603 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_gstage.h
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h
 create mode 100644 arch/riscv/kvm/gstage.c

-- 
2.43.0

