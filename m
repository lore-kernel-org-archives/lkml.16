Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C4F1B85CC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745830; cv=none; b=rB8qilkgVULKzrDKmNwEaMMg9c8qri4DzC6tOz9SF2/t2uyWzxzWlG5OGLb6JhPau/XSm8/jPj0elHOwSItTdJodJVcPYW8pBB1XT0zXtvMzw+pKcOWQ+zjlNx11vYswUPIiIXh+0NW7FPymUcQMaDc+r+5t2lG5lzSV2wRz9eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745830; c=relaxed/simple;
	bh=SXf3nJQEknxEY3EYZHD9+6W1rd56wjyB11Wv8y1bj1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CG+aZ0keS62QdbH7mTM6Xz5mmXuJ75BP+eeNlRnWYKO9baCoeGJwmywGbvy55jHp3Bo+oRrlmIm26RfZ39uq1aI3wyUeUlYxn0drRvkO/lGsXpvBD3DrMlel9U2RhgyPTKAmM5nxU1IH/L4Bsxrr4ysWt06iphfESReSwBg3hbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=aw5BzYFF; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="aw5BzYFF"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ddd38ee5b8so402765ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750745828; x=1751350628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=aw5BzYFFRS1iDn8O7YP02elSx9equKVDp0ilroHT4NspXOTlCjNzYgYf2jN84UqhZn
         NIyM1v7dCaugz3V6go9OCsfVue1Dy/5HKQwum6F1vMHf3uRDrmVeQMGo9z1bRAHtl+wH
         SNmxTtd2IZmq/nLI8Ib0o9eOM085pEHOubn4+CPlR0j7Wg1mlqLo4pu7TSYsITNUJkQo
         9DLHqArbTLLbPXz/pGJMhVBTW0zP0F9Qm8auIEM0+F7kacL3n5h6Eflwj86l+5FjOfI0
         PbQj9mX0dn6mMajM7N9h+nIT10dlGol2bK3gDJp/90+gD30lyUSS9GBlE7dgYLhayJKP
         iXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745828; x=1751350628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=WdImcDxpbF5fhccdKbUBAvag+aKAXNYeE6gNSgN2na8aU7QHy7d7BG5X2HvZzajt3f
         3SFiRpomwmhOKQK/hL1j0VURzWOjW6AvzOa0es7+7Y6Xm9Be4bDVQTBH2KyTtjshYkhv
         iACFJnUDyOscvUyc9nDGbDJCkUiXVr0bytkXfNvrCtz5fAos/Z+x5QAUPwkZZ/GjZYYm
         5mhbd7Q5+doPLeNyR6Y5a09pTFP/Ncnbc+mSBIfeu0ROdqXVLqFt5x12/1mlhBFfaB8x
         KDdoOyKilBICHvHKC1kFo7QvBkHiZXr9jOd1Bojzf7RegmfUngMEfwV24MNklLPv5gZv
         UMJw==
X-Forwarded-Encrypted: i=1; AJvYcCXGtCSqAOg6wGZ3vhir0OzoQoPnW+r78hDZMGEc7B5s6Zv6zu2IaD4bI7emE5TsFaWqZtPvjHQNJw11xLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzgZ02w91g8ajxgFfOt4ylN1XPsWEcIYFfH2/rqz0OhWUJKRy
	ydLOwX8+uh0B1dib68IQkjwZmbBkmHgY9qVJsu39tgDWWXqDDy+3LRRcMGjXLcDbZ/ABpNHsFzr
	BMwMbLUcbEW2fT8IoDRHALqdMFgoSinW450eCKKZY2w==
X-Gm-Gg: ASbGncs/LbZmrh6/YATB51s5RQ1lBRX+M24lqvm0HiukXeYQ3H+MqYasVPsR+xC2CdF
	vlmW3hnkmCwiJW/0FLimwSGajF9o70HpVPq/G+U2r5SAlUqedop5prLrvnnqo7EDZQCHxtH/GQB
	oSHDcOSq90C1e4lZWD/hT3ueTisYXnURsq1gRtXWfdCqjyd4x84Yln8KwPhuOTA+Fwo+Z6vDCqt
	dZfW2BC0Q/4GpA=
X-Google-Smtp-Source: AGHT+IFwOF9k2nb1vIM4HBKlhQn3P/HTPfDXxywRlHGTWdHMw5hoNm/+IT6iRV+qxyKkYESXR3ipGWMbxS5qleBQHcE=
X-Received: by 2002:a05:6e02:1fc8:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3de38c5547cmr149451765ab.9.1750745828023; Mon, 23 Jun 2025
 23:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618113532.471448-1-apatel@ventanamicro.com>
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Jun 2025 11:46:56 +0530
X-Gm-Features: AX0GCFs_mePpNxQYfE3ujwI_mugaGrSNJrso1cJLOw_Iw1ipREGGeBwAWpV5eNU
Message-ID: <CAAhSdy0=aAzu=Hu72h21GU2bxBZ+oVWuZG6TDiOag2NYBf=ATA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:05=E2=80=AFPM Anup Patel <apatel@ventanamicro.com=
> wrote:
>
> This series primarily has various MMU improvements for KVM RISC-V
> and it also serves as a preparatory series for the upcoming nested
> virtualization support.
>
> PATCH1 to PATCH4: Few cosmetic improvements
> PATCH5 to PATCH7: TLB maintenance and SBI NACL related improvements
> PATCH8 to PATCH12: MMU related preparatory work for nested virtualization
>
> These patches can also be found in the riscv_kvm_mmu_imp_v3 branch
> at: https://github.com/avpatel/linux.git
>
> Changes since v2:
>  - Rebased upon Linux-6.16-rc2 and latest riscv_kvm_queue branch
>  - Added Reviewed-by tags to appropriate patches
>
> Changes since v1:
>  - Rebased upon Linux-6.16-rc1
>  - Dropped PATCH1 and PATCH2 of v1 series since these are queued
>    as fixes for Linux-6.16
>  - Addressed Atish's comment on PATCH1 in this series
>  - Added new PATCH7 in this series
>
> Anup Patel (12):
>   RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
>   RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
>   RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
>   RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
>     KVM_REQ_TLB_FLUSH
>   RISC-V: KVM: Don't flush TLB when PTE is unchanged
>   RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
>   RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
>   RISC-V: KVM: Factor-out MMU related declarations into separate headers
>   RISC-V: KVM: Introduce struct kvm_gstage_mapping
>   RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
>   RISC-V: KVM: Factor-out g-stage page table management
>   RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs

Queued this series for Linux-6.17

Thanks,
Anup

>
>  arch/riscv/include/asm/kvm_aia.h    |   2 +-
>  arch/riscv/include/asm/kvm_gstage.h |  72 ++++
>  arch/riscv/include/asm/kvm_host.h   | 103 +-----
>  arch/riscv/include/asm/kvm_mmu.h    |  21 ++
>  arch/riscv/include/asm/kvm_tlb.h    |  84 +++++
>  arch/riscv/include/asm/kvm_vmid.h   |  27 ++
>  arch/riscv/kvm/Makefile             |   1 +
>  arch/riscv/kvm/aia_device.c         |   6 +-
>  arch/riscv/kvm/aia_imsic.c          |  12 +-
>  arch/riscv/kvm/gstage.c             | 338 +++++++++++++++++++
>  arch/riscv/kvm/main.c               |   3 +-
>  arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
>  arch/riscv/kvm/tlb.c                | 110 +++---
>  arch/riscv/kvm/vcpu.c               |  26 +-
>  arch/riscv/kvm/vcpu_exit.c          |  20 +-
>  arch/riscv/kvm/vcpu_sbi_replace.c   |  17 +-
>  arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
>  arch/riscv/kvm/vm.c                 |   7 +-
>  arch/riscv/kvm/vmid.c               |  25 ++
>  19 files changed, 795 insertions(+), 603 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_gstage.h
>  create mode 100644 arch/riscv/include/asm/kvm_mmu.h
>  create mode 100644 arch/riscv/include/asm/kvm_tlb.h
>  create mode 100644 arch/riscv/include/asm/kvm_vmid.h
>  create mode 100644 arch/riscv/kvm/gstage.c
>
> --
> 2.43.0
>
