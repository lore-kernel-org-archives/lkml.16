Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB73270EA1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532913; cv=none; b=OELyllnJ1Q9KOviKFZnPSXg7qgcv4U7rlSZ4PxJrZy/DwnDMa+sJY9IIlvMKMAjMlMrJ7IcOmjCV+Avrm00q2VWoJfXVV9QkDOqQhNeT42x6b7hlXA7VazZaM9WNSEkHCTlt8DYTxeAk0g6dJkbF3K8TVN2X0Z3QLL3CZWGx8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532913; c=relaxed/simple;
	bh=grSs7Q9oNzsBgMn5sHgYcjBDVM3ojcSOsr4ThtytB2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEabOa1hQ/Twko5yJcCIY5YmYe1HV6bkH4uMmILfvFSi9yvIdW5V3tCzwATGO/UaDHPH7wX3QHdhHuEdsubyg8/qF7qYutEA0Z3U0xSxElNnsJjRFoV6F6e68QwckS9Yk3zwqivENoQBqRgSaj2M3T3WMt6VaeZ4JXqMvKI05Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZSIB37So; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZSIB37So"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso42475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746532909; x=1747137709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSzvORr/gVZ7jSN0HABhiXm3spnKfDLNDT+Dp/cd+n0=;
        b=ZSIB37SooRxVM+F1oQX9wcQg6YHb6rziPpNC8fEINV8bW3TncL27tXWMr6xJj8jZ44
         OyNLtzA6janXzoYOQdegQIk4HBY6JpfIa2pXBWPPWmF/YaOgclYvPYmEEdfJ7TtSAUqz
         wvX3OohYv6jCav1yUyW1er9ugRGH/vZSQYdEiIuDOgRwlnSCXo+qppMcxEqaAm4w4jQO
         O2+Cc3QdkGiemGsKUzeOdfkFTmbGX+5L40Vpq9jVysfenCL/Odryv7Mt8Cw7Q7jJJk4i
         fMwABWHHUk2Vgd4poqM1F64MwW15NdE4+vWwG1xNID6DYQN6gDJDpHKk/8a6UbvoOjyV
         4lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746532909; x=1747137709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSzvORr/gVZ7jSN0HABhiXm3spnKfDLNDT+Dp/cd+n0=;
        b=HO7DywUuJcmV20lTAqWQDbQtpPpQ9aM2HO7F4c6a91JOD5/M6+8QJ18N55N9wPU9mi
         krhxu1XjI+mY6PK34jyP71DCmGb6yHaNLGZdKqLu08uKZhT1QsMDweUOLn4lzE32gOV0
         UiFtmWgbuaD6YngMQ1n5gZ17N3Hc3BiYX+0iNq1Uy9605puyh7wv9MNrvyOF5EsOtWcq
         7s5qKKj4BqZmqV1/xOjRFEtiKNaVZ+Bl/YHESneOi1talTVt4/41P7HpPaHDh4DqjXIh
         q4OKpm9fYbZ0zlI8yGsrxaSNBtnhJtvw6widrarKTlaN6L1ptZaCZdKVuym97R7JLclN
         BKvw==
X-Gm-Message-State: AOJu0YxUP53g02jP6HDGOPgUyfD71oYCBD5CvFclwUQ2oRCpv96pi3lS
	+Cj9KVKOojic9kXImubcNilRXwd2Rmn4kgJOAYJ73B2vzGmDfqoo3hQP6T7+lw==
X-Gm-Gg: ASbGncv7fXC1gnqhIxNSvwbkLuuXsk253i90gnNOw7mV652ThMZEyAWZRRgPKsWHioN
	byjB9OypLDlcSSZxGYMppx7rt/jKPDKdm9cZ98CDVWwGNa2kOrCFl3HxRpOSrK6D6A/3bAjSXof
	JKSkTL31BhTSliwM+KyH5yJ/lVkhv+6rBRXhwH0d9l+G3OHVwr8xz6CAgc3COkx4/DrETXSw+eD
	0B/94FPHIkegbsaZ+ZXcBT3CQXJVmpBiLs8lQUEO386khfh/ckafRfdXDVcFXn1PU/O9F5aqSMb
	rY4qv6nooVJYyC6Csnw6egopaogiVwEcFX5OCZpw737F7CBGwAHVjr3hueXGT7Pt9uAQsiVKKIz
	sABaxIQ==
X-Google-Smtp-Source: AGHT+IFBpEtiuzrhdK03rKZqJG6PwBucCmCJtiJ6cB8NuTFy5G+tiPNJu5pB483uNv06dEHDGi/VFw==
X-Received: by 2002:a05:600c:4657:b0:43b:c2cc:5075 with SMTP id 5b1f17b1804b1-441d123f608mr713235e9.5.1746532909129;
        Tue, 06 May 2025 05:01:49 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae831esm13723056f8f.57.2025.05.06.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:01:48 -0700 (PDT)
Date: Tue, 6 May 2025 12:01:42 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com,
	Per Larsen <perlarsen@google.com>, Ayrton Munoz <ayrton@google.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Bump the supported version of FF-A to 1.2
Message-ID: <aBn6JlRUoA9hKdZd@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
 <20250502092108.3224341-3-perl@immunant.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-3-perl@immunant.com>

On Fri, May 02, 2025 at 02:21:07AM -0700, Per Larsen wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A version 1.2 introduces the DIRECT_REQ2 ABI. Bump the FF-A version
> preferred by the hypervisor as a precursor to implementing the 1.2-only
> FFA_MSG_SEND_DIRECT_REQ2 and FFA_MSG_SEND_RESP2 messaging interfaces.
> 
> We must also use SMCCC 1.2 for 64-bit SMCs if hypervisor negotiated FF-A
> 1.2, so ffa_set_retval is updated and a new function to call 64-bit smcs
> using SMCCC 1.2 with fallback to SMCCC 1.1 is introduced.
> 
> Update deny-list in ffa_call_supported to mark FFA_NOTIFICATION_* and
> interfaces added in FF-A 1.2 as unsupported lest they get forwarded.
> 
> Co-Developed-by: Ayrton Munoz <ayrton@google.com>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 109 ++++++++++++++++++++++++++-----
>  2 files changed, 94 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index b43426a493df..95404ff16dac 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -27,6 +27,7 @@ hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o
>  	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
>  hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
>  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
> +hyp-obj-y += ../../../kernel/smccc-call.o
>  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
>  hyp-obj-y += $(lib-objs)
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 10e88207b78e..8102dd6a19f7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -94,13 +94,57 @@ static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
>  	ffa_to_smccc_res_prop(res, ret, 0);
>  }
>  
> -static void ffa_set_retval(struct kvm_cpu_context *ctxt,
> +static void ffa_set_retval(u64 func_id,
> +			   struct kvm_cpu_context *ctxt,
>  			   struct arm_smccc_res *res)
>  {
>  	cpu_reg(ctxt, 0) = res->a0;
>  	cpu_reg(ctxt, 1) = res->a1;
>  	cpu_reg(ctxt, 2) = res->a2;
>  	cpu_reg(ctxt, 3) = res->a3;
> +
> +	/*
> +	 * Other result registers must be zero per DEN0077A but SMC32/HVC32 must
> +	 * preserve x8-x30 per DEN0028.
> +	 */
> +	cpu_reg(ctxt, 4) = 0;
> +	cpu_reg(ctxt, 5) = 0;
> +	cpu_reg(ctxt, 6) = 0;
> +	cpu_reg(ctxt, 7) = 0;
> +
> +	/* Per DEN0077A v1.2, x8-x17 must be zero for SMC64/HVC64 results*/
> +	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {

We don't currently handle SMC32 so ARM_SMCCC_IS_64(func_id) should not
be needed and we can also drop the func_id argument.
Also hyp_ffa_version should be accessed with a lock.

> +		cpu_reg(ctxt, 8) = 0;
> +		cpu_reg(ctxt, 9) = 0;
> +		cpu_reg(ctxt, 10) = 0;
> +		cpu_reg(ctxt, 11) = 0;
> +		cpu_reg(ctxt, 12) = 0;
> +		cpu_reg(ctxt, 13) = 0;
> +		cpu_reg(ctxt, 14) = 0;
> +		cpu_reg(ctxt, 15) = 0;
> +		cpu_reg(ctxt, 16) = 0;
> +		cpu_reg(ctxt, 17) = 0;

How can we know from the hypervisor(which is the caller) whether these registers are
used or not by the calee ? IMO this should be TZ responsibility to mitigate the
risk of leaking information through register if these are not used.

> +	}
> +}
> +
> +/* Call SMC64 using SMCCC 1.2 if hyp negotiated FF-A 1.2 falling back to 1.1 */
> +static void arm_smccc_1_2_smc_fallback(u64 func_id, u64 a1, u64 a2, u64 a3,

Should we rename this to arm_smccc_1_x_smc to keep the same name format
?

> +				       u64 a4, u64 a5, u64 a6, u64 a7,
> +				       struct arm_smccc_res *res)
> +{
> +	struct arm_smccc_1_2_regs args, regs;

Initialize regs with {0} to prevent leakaging the hypervisor
stack values in case the callee doesn't make use of it.

> +
> +	/* SMC64 only as SMC32 must preserve x8-x30 per DEN0028 1.6G Sec 2.6 */
> +	if (ARM_SMCCC_IS_64(func_id) && hyp_ffa_version >= FFA_VERSION_1_2) {
> +		args = (struct arm_smccc_1_2_regs) { func_id, a1, a2, a3, a4,
> +						     a5, a6, a7 };
> +		arm_smccc_1_2_smc(&args, &regs);
> +		*res = (struct arm_smccc_res) { .a0 = regs.a0, .a1 = regs.a1,
> +						.a2 = regs.a2, .a3 = regs.a3 };
> +		return;
> +	}
> +
> +	arm_smccc_1_1_smc(func_id, a1, a2, a3, a4, a5, a6, a7, res);
>  }
>  
>  static bool is_ffa_call(u64 func_id)
> @@ -115,12 +159,12 @@ static int ffa_map_hyp_buffers(u64 ffa_page_count)
>  {
>  	struct arm_smccc_res res;
>  
> -	arm_smccc_1_1_smc(FFA_FN64_RXTX_MAP,
> -			  hyp_virt_to_phys(hyp_buffers.tx),
> -			  hyp_virt_to_phys(hyp_buffers.rx),
> -			  ffa_page_count,
> -			  0, 0, 0, 0,
> -			  &res);
> +	arm_smccc_1_2_smc_fallback(FFA_FN64_RXTX_MAP,
> +				   hyp_virt_to_phys(hyp_buffers.tx),
> +				   hyp_virt_to_phys(hyp_buffers.rx),
> +				   ffa_page_count,
> +				   0, 0, 0, 0,
> +				   &res);
>  
>  	return res.a0 == FFA_SUCCESS ? FFA_RET_SUCCESS : res.a2;
>  }
> @@ -174,10 +218,10 @@ static void ffa_mem_reclaim(struct arm_smccc_res *res, u32 handle_lo,
>  
>  static void ffa_retrieve_req(struct arm_smccc_res *res, u32 len)
>  {
> -	arm_smccc_1_1_smc(FFA_FN64_MEM_RETRIEVE_REQ,
> -			  len, len,
> -			  0, 0, 0, 0, 0,
> -			  res);
> +	arm_smccc_1_2_smc_fallback(FFA_FN64_MEM_RETRIEVE_REQ,
> +				   len, len,
> +				   0, 0, 0, 0, 0,
> +				   res);
>  }
>  
>  static void ffa_rx_release(struct arm_smccc_res *res)
> @@ -628,6 +672,37 @@ static bool ffa_call_supported(u64 func_id)
>  	case FFA_RXTX_MAP:
>  	case FFA_MEM_DONATE:
>  	case FFA_MEM_RETRIEVE_REQ:
> +	/* Optional notification interfaces added in FF-A 1.1 */
> +	case FFA_NOTIFICATION_BITMAP_CREATE:
> +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> +	case FFA_NOTIFICATION_BIND:
> +	case FFA_NOTIFICATION_UNBIND:
> +	case FFA_NOTIFICATION_SET:
> +	case FFA_NOTIFICATION_GET:
> +	case FFA_NOTIFICATION_INFO_GET:
> +	/* Unimplemented interfaces added in FF-A 1.2 */
> +	case FFA_MSG_SEND_DIRECT_REQ2:
> +
> +	/*
> +	 * FFA_MSG_SEND_DIRECT_RESP2 is not meant to be invoked by the host or
> +	 * a guest VM because pkvm does not support communication between VMs
> +	 * via FF-A. Direct messages can only be sent from a non-secure sender
> +	 * endpoint to a secure receiver endpoint. Only receiver endpoints are
> +	 * expected to invoke FFA_MSG_SEND_DIRECT_RESP2.
> +	 */
> +	case FFA_MSG_SEND_DIRECT_RESP2:
> +
> +	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 13.53. */

I don't know if the comment is relevant to the upstream code, should we
drop it ? The same with the previous one and few after this.

> +	case FFA_CONSOLE_LOG:
> +
> +	/*
> +	 * Mandatory for secure endpoints per DEN0077A 1.2 REL0 Table 13.1 and
> +	 * optional for non-secure endpoints according to Table 13.38.
> +	 */
> +	case FFA_PARTITION_INFO_GET_REGS:
> +
> +	/* Reserved for secure endpoints per DEN0077A 1.2 REL0 Table 17.2. */
> +	case FFA_EL3_INTR_HANDLE:
>  		return false;
>  	}
>  
> @@ -680,7 +755,8 @@ static int hyp_ffa_post_init(void)
>  	if (res.a0 != FFA_SUCCESS)
>  		return -EOPNOTSUPP;
>  
> -	switch (res.a2) {
> +	/* Bit[0:1] holds minimum buffer size and alignment boundary */
> +	switch (res.a2 & 0x3) {

What is 0x3 ? Can you please define the mask for it ?

>  	case FFA_FEAT_RXTX_MIN_SZ_4K:
>  		min_rxtx_sz = SZ_4K;
>  		break;
> @@ -871,7 +947,7 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>  
>  	ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
>  out_handled:
> -	ffa_set_retval(host_ctxt, &res);
> +	ffa_set_retval(func_id, host_ctxt, &res);
>  	return true;
>  }
>  
> @@ -883,7 +959,7 @@ int hyp_ffa_init(void *pages)
>  	if (kvm_host_psci_config.smccc_version < ARM_SMCCC_VERSION_1_2)
>  		return 0;
>  
> -	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_1, 0, 0, 0, 0, 0, 0, &res);
> +	arm_smccc_1_1_smc(FFA_VERSION, FFA_VERSION_1_2, 0, 0, 0, 0, 0, 0, &res);
>  	if (res.a0 == FFA_RET_NOT_SUPPORTED)
>  		return 0;
>  
> @@ -903,10 +979,11 @@ int hyp_ffa_init(void *pages)
>  	if (FFA_MAJOR_VERSION(res.a0) != 1)
>  		return -EOPNOTSUPP;
>  
> -	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_1))
> +	/* See do_ffa_guest_version before bumping maximum supported version. */
> +	if (FFA_MINOR_VERSION(res.a0) < FFA_MINOR_VERSION(FFA_VERSION_1_2))
>  		hyp_ffa_version = res.a0;
>  	else
> -		hyp_ffa_version = FFA_VERSION_1_1;
> +		hyp_ffa_version = FFA_VERSION_1_2;
>  
>  	tx = pages;
>  	pages += KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
> -- 
> 2.49.0
> 
