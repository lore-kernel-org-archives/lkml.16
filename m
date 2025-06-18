Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C5F2BDC28
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246549; cv=none; b=ky4eiIGprG4JGHcifCkgCMAeKXcYEZjVIOwUWJiigb3OQ719KTo7dYil0d8utrLVZvY3p2k/uh122rF6Q2cDK/ltmGx2n3Aws+1x6YeISvOeyvZIoHjF7vhu31aOWWThqsEdmL51gcXConc7i/psrEqfQ7L0k/m/idVvbA2fRfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246549; c=relaxed/simple;
	bh=kUeIya0giwpxu7KpfTx3sDDPSqXKgY3zIth7tPtJyY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLmR3moJuUjvihxyaMDdZdE4Qft3rCaWb6ltFUmFgFMk7zv/1m24PO60YSB5IbeFb6ewHbIAEu2MUAQRZK8wbJZCGrl78XJo8GX0zWs0WSjrQo9389ZKkFOMeOTSJ6Gy2E58qSEHdElrJ5pb39D1qwwBkEmBmoXBCqeE1qg5+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LB/7iXR1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LB/7iXR1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23636167afeso67963405ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246545; x=1750851345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8iWAhDJxETW40ym1irbHf7bY4A+gmTdzotzkqqzyxY=;
        b=LB/7iXR1ozX7RBwCJjZGFfIWGtKN4W5SCCTg++bjlDLtIDZkyOm0HTFeOoVZTVk9Ik
         0cJCUsReUbXuGFRPXq0RJinCG9OEzxiuuPzd/EOndb7CRCAiN5Tf7KuPE1l82oYnjRVN
         iaS4J4zkeJul80wlctg2ByUswCKRKnh0L6/z0HDmXx6MsEJurn3iqd3R90BopeIIeAF1
         7s/qyQiHzfpIqAqd74wDy89JtaTa2YhXu0w8vCeKE83paje7TYLxN+0pi8pfo2z0HD3Q
         ZIXn4cNT3v/cJOESDgqE7bUFvlBbTeO+QQjmeQx+6CWr0/2LHqpJ3l69ufnnee8YHnNk
         e6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246545; x=1750851345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8iWAhDJxETW40ym1irbHf7bY4A+gmTdzotzkqqzyxY=;
        b=FlONCa/7N08fpqDNAwM0tLSEoaUBFzy5dizmcwlY1VIP3tbZM5Zewr5fD3JlBmVZnB
         Z4cXwNVYanKviV0nAuqw9iE6afNfQ5DcUV2HiRIUTbeI+2z8OaJg/TJYwvog5yuV+swq
         42fhE0nRm5ezAnuKhnWHEEs+mYOCsrMARs/clR7jwyCJjN7IOEhxRidAr+Z/GysnX2Pl
         SngVSZj3d9G7AmIYlVJdnK2QcConyVE1EtttrfriciW7f2UBQBMWyxH9slzLqkDNHBuF
         8KJ/LwFnwlm9yXYC1531FrwsHd6mHxAbMjy8ch4+8zFX2R+z02dhTH6GLjf2nxxK44RP
         faLg==
X-Forwarded-Encrypted: i=1; AJvYcCU54827rx2BUz5m2NtqHi0VaNcEEksJlD+QAtNa/UK3LTZTYlfst+MZU8BBiUzojJzepgw8J3STouFQPm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wOnMdDEYkJyo/vvTIjiywyj1sZWgO4eNrWNf0/4h9NvhKbwr
	NVymXyYpbI8/gkNSZGpCg/kBWu8iC5UtY7LGTb/Ar7ykP7KsJ0KJkEtG7kPe4+0Vje8=
X-Gm-Gg: ASbGnctQo16qavu4EA9eNbBeirgO00HfkcS6T6vYD6+DxWXvMpj1ALAsXSfIcOSxusB
	TQZiXQ1GNC7oHepjL+vr1krE2FYYKypNwyFvbG8tGVlbEwx5PG6OaYLv1DzkNM8PeAhx1bO/7WG
	DZFoOR8rpXxPrIO02sJdhLz3LjrnznZEdeZmrFtSwOc8ETckwidoO9/lgIAbVGprF6q3RBKz3H8
	KiS8OvE4ab4uedblI7O11FrPVIMbidJEulESAeChex9rjJQobqVu1hIsHOX+CqCYLW5N6zq/3X7
	1MOUI7CW9HFm1Bsfdo10XuyJHfe2A1lkozsPK0yob4HHJTVDZyptnqcRuVAWdcRHE6ifySPxdFf
	Yl+WTBR3nJramiTCD7w==
X-Google-Smtp-Source: AGHT+IHPnSOG9Zfjo3AXh1Ue9MlaL5hmmABB22HqQcHI7XHuRT4ee8G3zhSleCl++zcQ0XmNSUBiMg==
X-Received: by 2002:a17:902:ba83:b0:236:6f43:7047 with SMTP id d9443c01a7336-2366f43724emr191830325ad.9.1750246545357;
        Wed, 18 Jun 2025 04:35:45 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:44 -0700 (PDT)
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
Subject: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
Date: Wed, 18 Jun 2025 17:05:20 +0530
Message-ID: <20250618113532.471448-1-apatel@ventanamicro.com>
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

PATCH1 to PATCH4: Few cosmetic improvements
PATCH5 to PATCH7: TLB maintenance and SBI NACL related improvements
PATCH8 to PATCH12: MMU related preparatory work for nested virtualization

These patches can also be found in the riscv_kvm_mmu_imp_v3 branch
at: https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.16-rc2 and latest riscv_kvm_queue branch
 - Added Reviewed-by tags to appropriate patches

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

