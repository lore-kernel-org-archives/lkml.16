Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413BCA6B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588040; cv=none; b=vB3yMEBZKKTT65odqCbQrp54shb65KOg4cCP9eSv2kuV8XmyefnidnrSfbc9vpG/U2LtZr1o3X0ZP2At72gxtowhH5H/Bi1Ok0X7s/MDlwXYG/aYVV0sR37otyJ+H2btOVrLBVwr3Ug5Qh2Z3vGzr0xx9Czl+zQwSKckcxIMZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588040; c=relaxed/simple;
	bh=cduZd8Ltq5422qMan5ANCK5a+bkT5I0nJA5znBziT9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaQI4MPzJBu+BZeTTVeRhqe8TELKAFjdGXg7Xnh7S5zUpA4LdVn7E7iPeiBkHfI7lZajvobc/SPpCLFdSUd4SoRdJLM89a/bjiewunJHBXJHcwxSrYsCvv4f7hRnYI83GlinMulxx9FnAbd+rmkYrA8OIeyEhxuC9hlatLFzQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Pw1N19uc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Pw1N19uc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1348988f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745588036; x=1746192836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvxSe8a/Se9B7XO1sswsds6D5F7SBQkR6pj1GPZGuF4=;
        b=Pw1N19ucwGhqAJdGkL62h6/+hmhQcY2/cCmKVMpDC1L7PsS56S7nIwFkEJgV8JTBXq
         u9+hKmZBcKFnImyQviGrDxPzguGM9zumbxkjXalN9eE9PEs7dSMGDIzZ/jC1m7E0P78g
         poEsVvzXyHHXeRGwHDBKHL+FhAjnyWK6md/7TlIh39e3QMKwGrC4W+2uTdHp5u83TKuL
         kVuX6fnO6g1aXnKlvUqjA2nLkJPgyJkufmrZiIFoC9tzDq6g7tJEIvkWtYXt/04RIXk4
         7BCpw24SG1pDqge6qxBpl8NaFYqOO8eW70b59oCl+CaX3oiDsFx4o+PdzY+AOBMXrr99
         fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588036; x=1746192836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvxSe8a/Se9B7XO1sswsds6D5F7SBQkR6pj1GPZGuF4=;
        b=WZ5ItVspwC1I2yGDGEKT8eQne5IzBV2D2SqBsZ1KFvndAaBBq9SwJVVcWXzHzqm1DW
         +f9T6JytFmGpAeG41LLH9AycLKFYDZeYH//WfeyctlOr9xteBvthFrct7RhQY+/UKnBT
         /VtGGikFCcXzBSYTPmkdBO5RJtxlyOYrhJXBbDBfOSHj/up2nM+GA+onElZtMiP66Y3i
         yNgAXbbOvnglP0KSSdTO5v0y8sekgQ+SEGKdsDZLytZADQM/lw4C2gTip+ft0FNOXa4j
         /BuVrb3NuPhbvFS2V5uPxjFi2AWjnFXBO9iTczgxDOJIrienoN9Hbn6k3D+ZwAPCuric
         SVYg==
X-Forwarded-Encrypted: i=1; AJvYcCVyTwG9uArg7mt/s2RQY17uQipPo6SFzZ/a3Iy/m6dZT7wJuH9RsJHo5Bwtyk0AuzaodDAlokai2vtJ7EQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5R4PqJTI+pulb3PcA01P/AYDfSqgg2asZVDO7jyABfNZUIHmY
	iIZVbc5xjyHjLBHQZYjuPU3EnQrFFA7Z9pQw2d8pLfsOLlTi5s3YSJZ2yL7GDJQ=
X-Gm-Gg: ASbGncsdYYlFNLCiUaOD4smGrIUPfhr4C5ZWsdat66UaSWSquGss22KtD73QQ1qJfLQ
	m8jVmNI60KWw1LzvAH520fPUU00l6OEE+FQrnlfE7CIb/IR6WzVguEH0vro98Fwsu3cukLh+iNe
	nJcuFGj1qt6qo8ImLv1npXPmzuNHxPcIlKRnTJe4gSGlqOU9a1t8UXcTY0vGjE71Qyk2MLmE9N6
	eujPkaDuE1j2xfvxE2oaVX6Dhplhn1/AWezmG+xRVmoXu9wDn1lKZRXTuB60QbSIa5HkhP9xZWF
	iOV22lQXCxC2D579QZIfP/+4CxuS
X-Google-Smtp-Source: AGHT+IH345KXBx7WTUF/NPXxKh0vTQxkkkmRW+ErxhOe06A807pl+3G2m+RyiKZsRHwXpurwjK/pVQ==
X-Received: by 2002:a05:6000:1867:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3a074e37776mr2084638f8f.25.1745588035744;
        Fri, 25 Apr 2025 06:33:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm2467062f8f.30.2025.04.25.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:55 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:33:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
Message-ID: <20250425-f458b9801a83cc35bda55c74@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>

On Mon, Mar 24, 2025 at 05:40:30PM -0700, Atish Patra wrote:
> Currently, the sbi_pmu_test continues if the exception type is illegal
> instruction because access to hpmcounter will generate that. However, we
> may get illegal for other reasons as well which should result in test
> assertion.
> 
> Use the stval to decode the exact type of instructions and which csrs are
> being accessed if it is csr access instructions. Assert in all cases
> except if it is a csr access instructions that access valid PMU related
> registers.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 32 ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 03406de4989d..11bde69b5238 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -128,11 +128,43 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>  }
>  
> +#define INSN_OPCODE_MASK	0x007c
> +#define INSN_OPCODE_SHIFT	2
> +#define INSN_OPCODE_SYSTEM	28
> +
> +#define INSN_MASK_FUNCT3	0x7000
> +#define INSN_SHIFT_FUNCT3	12
> +
> +#define INSN_CSR_MASK		0xfff00000
> +#define INSN_CSR_SHIFT		20
> +
> +#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
> +#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)

It'd be good to put these macros in include/riscv/processor.h or some new
include/riscv/ header to be shared with other tests that may want to
decode stval.

Thanks,
drew

> +
>  static void guest_illegal_exception_handler(struct ex_regs *regs)
>  {
> +	unsigned long insn;
> +	int opcode, csr_num, funct3;
> +
>  	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>  		       "Unexpected exception handler %lx\n", regs->cause);
>  
> +	insn = regs->stval;
> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
> +
> +	csr_num = GET_CSR_NUM(insn);
> +	funct3 = GET_RM(insn);
> +	/* Validate if it is a CSR read/write operation */
> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 || funct3 != 4),
> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
> +		       funct3, csr_num);
> +
> +	/* Validate if it is a HPMCOUNTER CSR operation */
> +	__GUEST_ASSERT(csr_num == CSR_CYCLE || csr_num <= CSR_HPMCOUNTER31,
> +		       "Unexpected csr_num 0x%x\n", csr_num);
> +
>  	illegal_handler_invoked = true;
>  	/* skip the trapping instruction */
>  	regs->epc += 4;
> 
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv
