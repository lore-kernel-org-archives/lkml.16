Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF375221FAA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493259; cv=none; b=ENJsyrKm7xL1pSdIwcmxkpUo7QWgjH++RP3ofHaI1+oVWUaG1yYpnBcyPQTKv9MSk8velXvtui8Mf75HUmlfFNLmBwryVnZbq6BT2GhJJzTNGa35rffDp9QUHGIWW4yCrjViwo66qUKK3hQBjVcOojo7IBg7dDcMAPvAUqQT3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493259; c=relaxed/simple;
	bh=u78bBw8PGW/PPJwhMQVogINCFXJeS29B2iDyf63kgi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GobLeKxH5BgzfDMKd+dAj0zFVbIR0cVi2xTToBaLkeurazuaZAHrkboYJYzGHbPIkwyo1WCyK7V4vG90NKpcIYH8u3Xhq804dm47WDhWXPqky6EfWlXZAZuy0V1ScHfgxcM9WFHOiy+Xux4XmmV3XUO193sf4KJrGH8u5U6URBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=NU0rUEcC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="NU0rUEcC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so606966f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745493255; x=1746098055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4mU1T1rDk6z4pxFiDA5HYk4vYtaLPU9FhiecEK1MtY=;
        b=NU0rUEcCwDTn/Oj/PtK9pRuOlBbuCs8Chtp8xKgTC7rRfg/wBeM7WmQysstFId81PT
         qwovDO9GN7s0ngE6aV/YTNGyQKdN71EXnzjk1FKe2EkgGfJlQyoIVl8k+bRpGxasNXUF
         tOoLDTPW1efwD2ug5RywAVrOfwe1ziCwc63uZERYcZT61ig8ecl1KXBT8NFPo4Qk0qOM
         jNhajOeUhRJn7syf0qFNHlbVsvsIcv4qKf7CXeoKKeFhrhLyY67FwDjezYlWkraxdNvY
         PEdIAmto9bof6Ti0GVrT0Fe7ZoVcRDND9o56BjvqQ7jUVaroaKI8t7gD83+0VZxybPL+
         4jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493255; x=1746098055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4mU1T1rDk6z4pxFiDA5HYk4vYtaLPU9FhiecEK1MtY=;
        b=TwAnXsaDPw8G8P4bx29kI+TIFFBnOTfesn+Ser6vbiXM82vhLNngOB1Dp1RNpsx8yn
         Zr/mSVw8+Gobhi8iTEJMKdt/gha0rBTAtP3FZFAcrDhjWx4MDOwQeBrUl90dxKFwWsbI
         1l5QF2YyCxJ8wEc611wkgqheFA49JgMScf5bRFkru3FOcNpIHltqhi717BqzLPEueoo9
         gKxwhGw6vroqlwHLIobRBKNf/HD7uilAXDoAregL+o3JqhmNkOL/IbWat8PuA+jFeTXN
         Q2Wp6oVnQME6boncuhtjINMzOh0q9tw1hOWjQnA19u06pPnnHT60f2V3pQB1KIfhJ/dq
         P4aA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0HYUV8m9xVrnZJwGRdb4eIWuzDCQEusp0sXKsDXTTzLDW5KCZsO8NXnDKRZrVzIdylWGT7mZ4guP0AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/H8lWWSxGuGRvcuLPNSwcsto9VDmvxWvybUBwpICtvmWR5F2W
	1mWhX1TmC/D1oyAN7uk3E6f4TiMNvh37yuBN56LJJFvHai8UgocYnhS5kyrYIdM=
X-Gm-Gg: ASbGnctPBpsF1+hQBdB05WHRfOQgMBfac8lprjW1oRSpisbXSjLHKHe1j9auDIJE2rP
	aN5O6q8juO05BlputozhF4B4yImB8E1TGbyjQ+KJ8CbK/zhdjaloliG8k2UrBez6+y8w84Fdtbe
	0a8iBH1wp6xHM4IOxSAqoKRCgvhjUtJOtEoF5H6NBMv49XwjjZ7nGYHXdCVD33Oqlpoe+HRWAir
	LMuckqIDB2+83DwltjxvQM/hzTiw2pe6Ol7dyDZQkvno5LO9UI+I5ropboTkIZNgIxUlh9wXuoE
	DF/BrTIGRrKfaMs1qzvIAj00Sd55
X-Google-Smtp-Source: AGHT+IHbSyOOi5/yit6BfiuuY0FmW2s/FlFU8x3sL1VvFlP3l8fAUyFn4SseT8fosFzbmlvobKvRQA==
X-Received: by 2002:a05:6000:438a:b0:39e:e3fa:a66b with SMTP id ffacd0b85a97d-3a06cf6bc1cmr1687080f8f.34.1745493255239;
        Thu, 24 Apr 2025 04:14:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b87b1sm17134325e9.28.2025.04.24.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:14:14 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:14:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 05/13] riscv: misaligned: request misaligned exception
 from SBI
Message-ID: <20250424-763a7a1d90537ecee5bfa717@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-6-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417122337.547969-6-cleger@rivosinc.com>

On Thu, Apr 17, 2025 at 02:19:52PM +0200, Clément Léger wrote:
> Now that the kernel can handle misaligned accesses in S-mode, request
> misaligned access exception delegation from SBI. This uses the FWFT SBI
> extension defined in SBI version 3.0.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/cpufeature.h        |  3 +-
>  arch/riscv/kernel/traps_misaligned.c       | 71 +++++++++++++++++++++-
>  arch/riscv/kernel/unaligned_access_speed.c |  8 ++-
>  3 files changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index f56b409361fb..dbe5970d4fe6 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -67,8 +67,9 @@ void __init riscv_user_isa_enable(void);
>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
>  
>  bool __init check_unaligned_access_emulated_all_cpus(void);
> +void unaligned_access_init(void);
> +int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
> -void check_unaligned_access_emulated(struct work_struct *work __always_unused);
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
>  DECLARE_PER_CPU(long, misaligned_access_speed);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 97c674d7d34f..058a69c30181 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -16,6 +16,7 @@
>  #include <asm/entry-common.h>
>  #include <asm/hwprobe.h>
>  #include <asm/cpufeature.h>
> +#include <asm/sbi.h>
>  #include <asm/vector.h>
>  
>  #define INSN_MATCH_LB			0x3
> @@ -629,7 +630,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  
>  static bool unaligned_ctl __read_mostly;
>  
> -void check_unaligned_access_emulated(struct work_struct *work __always_unused)
> +static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
>  {
>  	int cpu = smp_processor_id();
>  	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -640,6 +641,13 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
>  	__asm__ __volatile__ (
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
> +}
> +
> +static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> +{
> +	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
> +
> +	check_unaligned_access_emulated(NULL);
>  
>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
> @@ -648,9 +656,10 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
>  	 */
>  	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
>  		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
> -		while (true)
> -			cpu_relax();
> +		return -EINVAL;
>  	}
> +
> +	return 0;
>  }
>  
>  bool __init check_unaligned_access_emulated_all_cpus(void)
> @@ -682,4 +691,60 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
>  	return false;
>  }
> +static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_RISCV_SBI
> +
> +static bool misaligned_traps_delegated;
> +
> +static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
> +{
> +	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
> +	    misaligned_traps_delegated) {
> +		pr_crit("Misaligned trap delegation non homogeneous (expected delegated)");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +void unaligned_access_init(void)

__init

> +{
> +	int ret;
> +
> +	ret = sbi_fwft_local_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
> +	if (ret)
> +		return;
> +
> +	misaligned_traps_delegated = true;
> +	pr_info("SBI misaligned access exception delegation ok\n");
> +	/*
> +	 * Note that we don't have to take any specific action here, if
> +	 * the delegation is successful, then
> +	 * check_unaligned_access_emulated() will verify that indeed the
> +	 * platform traps on misaligned accesses.
> +	 */
> +}
> +#else
> +void unaligned_access_init(void) {}

__init

> +
> +static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
> +{
> +	return 0;
> +}
>  #endif
> +
> +int cpu_online_unaligned_access_init(unsigned int cpu)
> +{
> +	int ret;
> +
> +	ret = cpu_online_sbi_unaligned_setup(cpu);
> +	if (ret)
> +		return ret;
> +
> +	return cpu_online_check_unaligned_access_emulated(cpu);
> +}
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 585d2dcf2dab..a64d51a8da47 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -236,6 +236,11 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
>  
>  static int riscv_online_cpu(unsigned int cpu)
>  {
> +	int ret = cpu_online_unaligned_access_init(cpu);
> +
> +	if (ret)
> +		return ret;
> +
>  	/* We are already set since the last check */
>  	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
>  		goto exit;
> @@ -248,7 +253,6 @@ static int riscv_online_cpu(unsigned int cpu)
>  	{
>  		static struct page *buf;
>  
> -		check_unaligned_access_emulated(NULL);
>  		buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
>  		if (!buf) {
>  			pr_warn("Allocation failure, not measuring misaligned performance\n");
> @@ -439,6 +443,8 @@ static int __init check_unaligned_access_all_cpus(void)
>  {
>  	int cpu;
>  
> +	unaligned_access_init();
> +
>  	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
>  	    !check_unaligned_access_emulated_all_cpus()) {
>  		check_unaligned_access_speed_all_cpus();
> -- 
> 2.49.0
>

Thanks,
drew
