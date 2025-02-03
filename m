Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D981863E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738561409; cv=none; b=DXXL7uJqGqE+RoKyalr3fe2Y5kkax2brrLMMh61H0rEn/t+ey2ras6/EeYexwKnGusuauVydLjy+tx9VKcm9m+YyB84wXEt+ImsAnxZwOAdym/ddtZAhrzyXENQgiuAEzUYxvMKY7CcmS0W6jiowBw896IASIfQhr1mjihSBXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738561409; c=relaxed/simple;
	bh=NmcLSvXof+RXtFnk6pi3gTBVMg9ZHRhnQX1L7fgcdGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IllizkXijTFxL6iS1VaErwS8luXL5hPgUXYbBvD8ZO9n2Wh68NWv8IdBSag4tR6H3W329rfK5aLdzA8OzH2jyfstQ8fOscWlilGIQBirhgeQNFTsxD5VFnssXmtS6OMmTxGn8XXZmosmyeG785WUMJZlfXBiPWifQSrRpTbQvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fGufbaGE; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fGufbaGE"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce76b8d5bcso35601695ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 21:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738561406; x=1739166206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=fGufbaGEkoB9wwhUDmv3ORJMmPRU9GJLjkZ3LhKzikdukXvOUWdnAQTniO5qzy6GgC
         1k+nBfKB19dksMpiMncup4YsZ5myb4LvEML3vQpXaUkFdUPoVJwDc2R7wE91FvLH4AWM
         wrlX8vdzUFeIEahw8kf9WSF3QuxRnIPVMrPuCU35Y/TE/dEAvPR7Alom24s5xzI7NWOE
         QXVjrPcshHgnorH3Dpa3qp5wlcgqfQTQyvOD8jAcILdyGFGNQ25aZb1cN9YwmnYvfuuO
         fjtI2h1dhace8kRmgUdaHPESqosIF2kNfRIGdelSbWt/GbGiPAyfhtB+X2wsofImGM/9
         Cklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561406; x=1739166206;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=FZjkrwJw1KmCug1Fj0sKUduK8U9SmP3dVi+dvio+idANCBr6j6bKoAcrdcpJCwyDcr
         cPB8zUGv/Jc6x44ED0eWBwzRE9tfpISgRmEOo4GcjuItjMd9IRvu6iG/HDeofbH7V/8t
         Qu8wK1jATsifQUxgZmIhfjchlQQ8hBcvgHL938VpXSuf6Ih2r1XhfesZeZW7WxIndPvA
         MkOdoE6UWnDsD/BaJYHQFAaPuNhW6uz4wEBPLDM4LTYBx5Of+VREwTCKLpRq2u9Bowps
         Bw1Sx0bCVvhYm44hGMkG+dQq1bmY88io/8TAOOci2w+BSxdhjMtYn10wEF+Y6WX6rA9l
         yIiw==
X-Forwarded-Encrypted: i=1; AJvYcCW/jVfmL/6VMyyTRDWjGc0d+OFGf4y5jJLvTz+B80THckiaOvYSYE87yPA/uJzLjBlMuffikwlvs2XFIWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBh/BHniettvOVthkkZkaI+tfPITmGbHvmqGIsUMHvvVOA4Vr
	RgTEVaTgTAsWlMgzrABcJg/1m/rGwBZgKZt/PKjK2bXqbuhWtKQ3AvoaktgHVhI=
X-Gm-Gg: ASbGncsKf7GtZ8GBGahxgy039sDDfdfr6zJ3kCj+jnp1Vw+ySbDR8q0RXuQKm4w+H8l
	CFvG0KeTfOTGKJqdhTTAKgB9rEbzbuldC6Sq3WzsOs5jBUthdlw+Ukg4lHCoQizBqig/HbTk/cO
	QMou1cvVOHiYAK+LUEOefCu5QaQ3b4mKi4FpyXNNkyYSKTD0DW18L0zmSQDgiTJWgRCcp8TLBwk
	4z2u3Khp40fecMhRwDL6vhC/vkBsehi264+fFOtUr3RzZxFylId0x3Seuj4TQsjVU9dxEV9Bz3r
	tw8tYUJsBlq9DlvWuhrIyTGw9FHGftXxD6S/ZPc=
X-Google-Smtp-Source: AGHT+IHl4RRDfRdJ9K6Cx6v8dXThe6D880Ogx8BJ2U75l88ormi4P0wAtnHOCwaBHFLWcb6LIw7+7w==
X-Received: by 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id e9e14a558f8ab-3cffe4a7bf1mr175908815ab.19.1738561406189;
        Sun, 02 Feb 2025 21:43:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d018c28ea5sm15310115ab.35.2025.02.02.21.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 21:43:25 -0800 (PST)
Message-ID: <44468c97-06e6-4bfe-930d-444ab7ead90d@sifive.com>
Date: Sun, 2 Feb 2025 23:43:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: kvm: drop 32-bit host support
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-3-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241221214223.3046298-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 2024-12-21 3:42 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> KVM support on RISC-V includes both 32-bit and 64-bit host mode, but in
> practice, all RISC-V SoCs that may use this are 64-bit:
> 
> As of linux-6.13, there is no mainline Linux support for any specific
> 32-bit SoC in arch/riscv/, although the generic qemu model should work.
> 
> The available RV32 CPU implementations are mostly built for
> microcontroller applications and are lacking a memory management
> unit. There are a few CPU cores with an MMU, but those still lack the
> hypervisor extensions needed for running KVM.
> 
> This is unlikely to change in the future, so remove the 32-bit host
> code and simplify the test matrix.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/kvm/Kconfig            |   2 +-
>  arch/riscv/kvm/aia.c              | 105 ------------------------------
>  arch/riscv/kvm/aia_imsic.c        |  34 ----------
>  arch/riscv/kvm/mmu.c              |   8 ---
>  arch/riscv/kvm/vcpu_exit.c        |   4 --
>  arch/riscv/kvm/vcpu_insn.c        |  12 ----
>  arch/riscv/kvm/vcpu_sbi_pmu.c     |   8 ---
>  arch/riscv/kvm/vcpu_sbi_replace.c |   4 --
>  arch/riscv/kvm/vcpu_sbi_v01.c     |   4 --
>  arch/riscv/kvm/vcpu_timer.c       |  20 ------
>  10 files changed, 1 insertion(+), 200 deletions(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 0c3cbb0915ff..7405722e4433 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on RISCV_SBI && MMU && 64BIT
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 19afd1f23537..a399a5a9af0e 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -66,33 +66,6 @@ static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
>  	return hvictl;
>  }
>  
> -#ifdef CONFIG_32BIT
> -void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -	unsigned long mask, val;
> -
> -	if (!kvm_riscv_aia_available())
> -		return;
> -
> -	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
> -		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
> -		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
> -
> -		csr->hviph &= ~mask;
> -		csr->hviph |= val;
> -	}
> -}
> -
> -void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -
> -	if (kvm_riscv_aia_available())
> -		csr->vsieh = ncsr_read(CSR_VSIEH);
> -}
> -#endif
> -
>  bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
>  	int hgei;
> @@ -101,12 +74,6 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  	if (!kvm_riscv_aia_available())
>  		return false;
>  
> -#ifdef CONFIG_32BIT
> -	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
> -	    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask)))
> -		return true;
> -#endif
> -
>  	seip = vcpu->arch.guest_csr.vsie;
>  	seip &= (unsigned long)mask;
>  	seip &= BIT(IRQ_S_EXT);
> @@ -128,9 +95,6 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
>  	if (!kvm_riscv_aia_available())
>  		return;
>  
> -#ifdef CONFIG_32BIT
> -	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
> -#endif
>  	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
>  }
>  
> @@ -147,22 +111,10 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
>  		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
>  		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
>  		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
> -#ifdef CONFIG_32BIT
> -		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
> -		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
> -		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
> -		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
> -#endif

One minor cleanup: since this patch removes all accesses to these 32-bit-only
high-half CSRs, the corresponding members should also be removed from struct
kvm_vcpu_aia_csr in asm/kvm_aia.h.

Regards,
Samuel

