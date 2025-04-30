Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6E1EF382
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996946; cv=none; b=D7jZfP0lwu1G3J51DWhd9x+L4Iu7400mm53bIKzN1HN2G+RGMNcjErin5qAgX1ZIXY3mlVtFYyKEi26P1beBvD05xg9buFYYREwuh3HuSTZWwwBGtiJ3WRtF5IywGxYsGEFIvd1gH/i6g+89UL7iUxt1a1RjpCgpho3cF0AJgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996946; c=relaxed/simple;
	bh=gpNXr1037Z1wEz+LS6JylmM3swnZl9G/5KuJww/pJlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKf+v8HcSVfHHbqdazUVYES5JVdoaf5gNkYAICdaYWg3vJ2SMKskdURW7af2a2UG2Q4wbJkNc3oSwLe9/IyEHzzaqucW8yf8frIIBiS6svFosA6ZtdI9IBLS+9bB2AM5CSF92tRvtzjKEKg+6eLpJQ9nyGbFzVFbQLrx9nQhbAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IcbP13pi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IcbP13pi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso47096105e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745996943; x=1746601743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSK4QD+3I+qmqDLjdFn3wb2kTRYhgTQ7voE34inPLKI=;
        b=IcbP13pihTmV2dDZzE+UuqueCiLTpOFo7Oi9u6lwBcql978QOzWcTeWD8IJgCzN6PJ
         36/e4tKrrOJVNZfYCZxZt02Zu1368VLXFqjXgT66w3CGimi0F0j247oU+QyYTlGS1mx5
         uhBF0PLPr1VKNElAgT0iMdu06B4vOMtsmy8BJCDsvHRqFHPig7q4q+973kXzo4REkm8j
         ghwhsUInBIg7LMvu8nQwutP9us9pLvBWk9HGFKYswU4JvUMg82lVYyzTa4+kQHfg9+kb
         EZpjbMYA1uHHMOxwac3zvN7lK7kkg6WfmDHAknDMLMc3N5cMrv80nzZpB9z+7zZ7wi5P
         byPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996943; x=1746601743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSK4QD+3I+qmqDLjdFn3wb2kTRYhgTQ7voE34inPLKI=;
        b=jiTXd8F2zYrINJZ3LQB0Ars/zAMcJulJ1oprZN6l4BmvRgnDSZvgktIx+dDiloPF0N
         91oHwGOeMJZTAtJr1SBXcr8aDSITJae8Q9o7KrTVkpgAgrA2UuKJicj0JCokMPJEgFcJ
         zx4vBdRouODH6l2Eq1hwwKJquEZNwoe97ZEE4a9qMsFAxtzwmNAqwgjiZbPaMHE6s64n
         10DH7kHUNM2UrrwONkvU5pxSAlUZ67NgTWhewWsnmsFW3ExbUXHHE6gn3n0sGNh1eYDF
         slsS/uac+4hpNz0aGy/b+D8jzW/D17VhdEJE9pHcp/3IL02IiVTVDEEYkDh6fjnG1m3x
         dA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyJghygwiHkz1ahxdP71mH+D1OwwINpAsBBgJMbnU9khmdQboGSl/45kpeq6pTUQsts71Vuk2mWkXiTew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzJ2RjI/YzAEmsVmmXxf/GxtMLF82ekmohqq1s9wQE4ZETUl3
	aoeBcTzGvseof0lig2sqGQSb1fNJD24f9Nt5/iKHa1+rianY+6x4EV1N6DMMV0Q=
X-Gm-Gg: ASbGnct7niKipl3/GLTQkldJ1ynSMTkg+AWVWSKFJ3emNBfP6YgaQvs7CISwOGoFQSf
	CaDU7kFUB1UOq6hSU7/yaTMV9v8H5Pk17GaiNBsOK62xlRKm1grRcwACJE6xW24FKs6ChmeW3kN
	qxtWfb9geHHE8IOGL/pv021l3hw7fm1p5FtmSyNT+lIipsIq8+h7DaepNDDg2pGT0UkyPAq89+H
	afI0ceOH1kKRqTJ2hZYjv5hefHtlCP5uXPRHJ52BLpHxsglp6fWOYEodPjwe+FyhZxRgfWQVL4t
	cbUIRi0zQVuYi5K3HsM4pT45YXv7
X-Google-Smtp-Source: AGHT+IHU6e+bAOcpIfCg/o6HSKaqmZqkWhnRBvwCbptPuIv7yzCHf3h+WWrp9vwHZZg1HMb2/urfEw==
X-Received: by 2002:a05:600c:35d6:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-441b1f306c6mr13349235e9.7.1745996943368;
        Wed, 30 Apr 2025 00:09:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b3ae0c19sm6357775e9.24.2025.04.30.00.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:09:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:09:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
Message-ID: <20250430-b40cd14818cc9264506e61f2@orel>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
 <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>

On Tue, Apr 29, 2025 at 05:18:46PM -0700, Atish Patra wrote:
> Currently, the sbi_pmu_test continues if the exception type is illegal
> instruction because access to hpmcounter will generate that. However
> illegal instruction exception may occur due to the other reasons
> which should result in test assertion.
> 
> Use the stval to decode the exact type of instructions and which csrs are
> being accessed if it is csr access instructions. Assert in all cases
> except if it is a csr access instructions that access valid PMU related
> registers.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../testing/selftests/kvm/include/riscv/processor.h  | 13 +++++++++++++
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c     | 20 ++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 1b5aef87de0f..162f303d9daa 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -11,6 +11,19 @@
>  #include <asm/csr.h>
>  #include "kvm_util.h"
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
> +
>  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>  				    uint64_t idx, uint64_t size)
>  {
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 6e66833e5941..3c47268df262 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -130,9 +130,29 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  
>  static void guest_illegal_exception_handler(struct pt_regs *regs)
>  {
> +	unsigned long insn;
> +	int opcode, csr_num, funct3;
> +
>  	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>  		       "Unexpected exception handler %lx\n", regs->cause);
>  
> +	insn = regs->badaddr;
> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
> +
> +	csr_num = GET_CSR_NUM(insn);
> +	funct3 = GET_RM(insn);
> +	/* Validate if it is a CSR read/write operation */
> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 && funct3 != 4),
> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
> +		       funct3, csr_num);
> +
> +	/* Validate if it is a HPMCOUNTER CSR operation */
> +	__GUEST_ASSERT((csr_num >= CSR_CYCLE && csr_num <= CSR_HPMCOUNTER31) ||
> +		       (csr_num >= CSR_CYCLEH && csr_num <= CSR_HPMCOUNTER31H),

We should never get csr accesses to the rv32 high registers since we only
support 64-bit.

> +		       "Unexpected csr_num 0x%x\n", csr_num);
> +
>  	illegal_handler_invoked = true;
>  	/* skip the trapping instruction */
>  	regs->epc += 4;
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
