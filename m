Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F21F2C44
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104109; cv=none; b=aauS/DRgFH6zcAzLoDYtkQTIAGkgLvaSaZazLjK2dk9HHFKcDZQjYHVG/84ZcoRZFqTi9nWgGscA6DNnjDpZHtburHpIrQJ9XVuFAVsErGYD9o3jZoTaQjI3BbgJU2Oftb+/C+WGJPEdl7fr42hnU8wKF5D+Z7t/MxXnvlQY46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104109; c=relaxed/simple;
	bh=5i7+RsVOCq4JG6AwAlf/qvPA4TN75OLrYIXjlJcGIwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mtKOLf+3JQwqUahqJ8HNEKH7qEawkDMdXuvbw0/lgvLfrZAyGVuoSWtNyDYuubLxaZwvJFJRPEvif1YcCvSknRwOm+onPjdCTVwsyUTXkdKyo9JnzTGFw0loiCepfrxC3wsLiM0kX47hOKp0IpOVM2TvDcXr4yQJkvx1o8fKKs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fR+SElK0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fR+SElK0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31329098ae8so494090a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104106; x=1749708906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYCdKhY8aW9URe8Blmx5TcE5ZqYHha77HAw4jeob92E=;
        b=fR+SElK0+TvZ25dEdIXaaFxma5pusCuX2q14ua5qsx4sq9DiTrnqn9/FloQNT2HMEK
         yt9cWnkQU9r9VPOvhqn9pjMlDkpeha8INZHVJZnS2M6lxcUDnA9XtFWVoddZcUak67PU
         CWC/2pmYacFo7+bkmeA2P7Vc7b4FkKDOp6l0iBXQwxntnDUUvjLbIjf8RPDdlqGLRPIS
         MpAnCcIvZWok1NgRxSeQi1GOUitXu57MP8ND/dLMSwFT3/Gt0s/WtND29qLScN+Jlgrz
         5BFII5wnmxPQAj1ShOHLOV+mIuvA/UNHarvvxICwfo5PuAyKmto8Qj0tohr/qm0PB0G0
         zwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104106; x=1749708906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYCdKhY8aW9URe8Blmx5TcE5ZqYHha77HAw4jeob92E=;
        b=QivxRMZlqa3//xarEJFH18JRiM/U3vvXG50unBG3eQO5gZrrPfV/eHpv9XUxMgIB0y
         bFaR73IJ1ontqQtOkLz9pnE0skYtQHvIwD16NRK3xATFNaRdFhXHg6qpuyt8nx21X6Cl
         rMSBoSclYhtvniUW6oIDU52wvk6+noWwVjbO3Mw7Xu8avyJl9LMdPSUE2LOA3qCxKCdR
         TQWMTskN5HHmvRPzYRenzRHpO834yd0fz1lp2xdUXq2yifsKRYEi/2fWAI4ZCjEJW6MQ
         XXMf9GPROsC6SLailBRqfFeEGQTjV9dfA/pb73qYbNVFTXxT2OjQTrI94q3eo7HqA1w+
         o6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhVsLt0q7+aQBF7WQoFgjLAvgHi/sAwSn194Oou3oOln5Q54tHVKRPrprADQh+gKNDCAVPRcE1QcJv7vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGe+KJzqvF+V47HGu4J8s1ESYgPlojS6aoODyaz8juvAFlStGC
	GuT/G6/gRxUGwMJigFI1pRMlfcQ7iox5BBx9rP7IDRGQGdQob8ema2+WAGP9V3307EQ=
X-Gm-Gg: ASbGnctqH8z95ewIYx26CGCNOQbpkyt1XT5e9ed8eP4Ycqebs5ENOJ0GccQ63QCoix0
	g2lGrRycV3XvUF0jB8PdrBsh3/RJUIiKrbyZWJL4AbweVScXs6mZ9ZnbZKxl1Aksyn8cXnFPDFC
	+q1BK0kTFcEXnfU8W8lyID3FQUrCGUHekLPtHLna1Ptr25gsaGdvP/+w5m4k3GNH6tBNeZSqDn+
	byiIRxyahkSbsMsSeXjVusAf8c8jLGeXR3TzlgrulfaFgohyZ+kCpVK2YWB0MKHrBqOqVYZT6Mf
	gxKwtBFoVCWI6pSzJ8zsS7gm9QeatX9GiJzLRAGBYX3sLTbHwUSx2SjUXa/RTpElaBh37WhIZpP
	wbqgRtQ==
X-Google-Smtp-Source: AGHT+IEERT0Tj/0eAgp/ef6xa8y7k+Vq1PulNXuIhfC0x9NWeX6p07jWalxiSI7B9LR8eu0ziMDdUA==
X-Received: by 2002:a17:90b:1d07:b0:310:8d4a:4a97 with SMTP id 98e67ed59e1d1-3132903824dmr3193484a91.15.1749104105532;
        Wed, 04 Jun 2025 23:15:05 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:04 -0700 (PDT)
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
Subject: [PATCH 00/13] MMU related improvements for KVM RISC-V
Date: Thu,  5 Jun 2025 11:44:45 +0530
Message-ID: <20250605061458.196003-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series primarily has various MMU improvements for KVM RISC-V
and it also serves as a preparatory series for the upcoming nested
virtualization support.

PATCH1 to PATCH2: SBI spec related fixes in SBI RFENCE extension
PATCH3 to PATCH6: Few cosmetic improvements
PATCH7 to PATCH8: TLB maintenance related improvements
PATCH9 to PATCH13: MMU related preparatory work for nested virtualization

These patches can also be found in the riscv_kvm_mmu_imp_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (13):
  RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
  RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
  RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
  RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
  RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
  RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
    KVM_REQ_TLB_FLUSH
  RISC-V: KVM: Don't flush TLB in gstage_set_pte() when PTE is unchanged
  RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
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
 arch/riscv/kvm/gstage.c             | 336 +++++++++++++++++++
 arch/riscv/kvm/main.c               |   3 +-
 arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
 arch/riscv/kvm/tlb.c                | 110 +++---
 arch/riscv/kvm/vcpu.c               |  27 +-
 arch/riscv/kvm/vcpu_exit.c          |   7 +-
 arch/riscv/kvm/vcpu_sbi_replace.c   |  25 +-
 arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
 arch/riscv/kvm/vm.c                 |   7 +-
 arch/riscv/kvm/vmid.c               |  25 ++
 19 files changed, 791 insertions(+), 601 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_gstage.h
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h
 create mode 100644 arch/riscv/kvm/gstage.c

-- 
2.43.0

