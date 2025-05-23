Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB20297B68
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025440; cv=none; b=h8ljW5IERfTeC6fkNy6nctZR1CDhE4WFEaYXvVZMaDhkX1dYCtDrLlplzRPe5qGxUCAhf8cc1b7YBu/IepJtviAvp5eZIlRhEc66NmCCejwhDci0zAWmJKBjoQp6sDvf3t66oSmgBrt6YIXCwmS1ssCL+PK2aVzYWF+khGiD6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025440; c=relaxed/simple;
	bh=fBP8ebQ6vsk2kNEGZF28FbWUrY3UqYBKVgD7KsehzoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV3tQm1NfCGWXg11gWYD5UrA2oxszxtN3oBXgVLFMOcm+MfDv72DxC0k/XyIKtEz67o4EP+t1QBo2ojitYkHA7DrM+UtNz/hyeYbGjVxQgN7W8TIm9lwzjKeUkyCZb0MmM2UGLV6vqe+dmReUz3chmkdZ2GtwthRTX7Z+wSaZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kx+jOfLF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kx+jOfLF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2322f8afe02so1543135ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025437; x=1748630237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=kx+jOfLFtsQKMtUb47OqLL1G6Io3wm0pD7E2k7rrjbnweQg/NLyAIJyeEu/kyvMhBv
         UQ1hyQxVbMTH3wsGV+2Q+6nM7EDNJGEO+pJ9qNuNd+IGT+E0mANo8wBxsQINqAfnUKqb
         8j2/2v/rD0LLKsDfVorS7JYIypIIA2nuXcPKORQo3Hx5jic2lowqWYB/7eB9KUpHKm+T
         zo6U0kaN6mZ7SqNY+fYX1onRVfj7mqrHVQ/43xyGgRlZINPjp1wNXcEMhGHnSEjJt/+V
         NlkEn+Zqr8j76T1OfE/7WGXYY9+dPbFOz+/k9/YktBhvfeG3QjDvNsuKZLyp6CTcRNle
         hHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025437; x=1748630237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jN5GB4ngQwEolzoVEKYGux1P77VDkeV8jyjKjQj7pI=;
        b=QzTZA6i7+8zhfeLS6AxHeeSpHXt1jyEDoYh3EtItKR0e6KstCvzFNCBf+TUbi4svya
         KOlKQa8Ow8v61lIUg693BMM6nqurFtwqiHITgNzkHd2YvKjb3ogxBzyUmEeuzkI8yjKN
         5nE6O37PUW4gpyWl6RCarvpEBWn2jnNjvqPYQCp3k5GQUYqIJLC1g3wQECz4lCfLbQLq
         XKQ5A47OYUAgjIp5AXZtZ8beOenaB8YC9vtPP3uoZv0MdR3ZZNcnbrhLCc/T2UXUfAPa
         8U4kzgDEeu2Wi76JWVhlPLaGKooNTW/gb4RY4bpmtIEn9MMWYNYKOP99xKaD1i+98D1/
         YZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUmtbWHT6UUkkGyNNvX/txuJ7jYBLJKKIlRrEcHYC9lYkR2feiqwrnAMhMTwUHR6NGUqsPWAU0BbQsASE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTp6o+ul/7wzsN61/X2bI3+AF94arGH900DYl52zo6AxjqzR0h
	4kqdPJ3H3Opm3GWGmmHq3bqmtuPtxTKWhSdeJRrhBhUgDeAhHfU3ORJpl9KiUCJmhII=
X-Gm-Gg: ASbGnctJ3NKMqkIYkFKSQToxtfQNrc7HD7NnfF7pp9KNnxy8oOgGEouwEHM/XykeIYJ
	u/2fBDEvn0AJpoDERQx3CJHW+esLR2n6xMEs90zN0rs44YriLMgt4JIu3mzhF7YZnxI5rF/HDsH
	rXSaU6eyQWgyS099Uag9KSVucag1wyP/QwaIWZUgVWgSibXApqMv9/HZQp+AGq7asCc1/gLUgcQ
	nBNgagBiG43hIAoyBhxz458gNHv7f8LaKI/jNtcyWiU28eHwbxE26j3N0FKV9fywPk+YYGuSnN3
	+aIE9lLiOXoq+jku2VmUOhcIJ1a22rWEII9+P3nA4jQ7/VY=
X-Google-Smtp-Source: AGHT+IG8tomY7/3cAclRkVBgo4GdCG/oz04LT8S0Un+srTCw4pvpQpH3EIf/46AHjipa24+aocSy/g==
X-Received: by 2002:a17:902:fc44:b0:22c:35c5:e30e with SMTP id d9443c01a7336-23414f69078mr5977735ad.13.1748025437265;
        Fri, 23 May 2025 11:37:17 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm127127745ad.149.2025.05.23.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:37:16 -0700 (PDT)
Date: Fri, 23 May 2025 11:37:14 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v8 07/14] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
Message-ID: <aDDAWmNlr_mzrdLm@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-8-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523101932.1594077-8-cleger@rivosinc.com>

On Fri, May 23, 2025 at 12:19:24PM +0200, Clément Léger wrote:
> schedule_on_each_cpu() was used without any good reason while documented
> as very slow. This call was in the boot path, so better use
> on_each_cpu() for scalar misaligned checking. Vector misaligned check
> still needs to use schedule_on_each_cpu() since it requires irqs to be
> enabled but that's less of a problem since this code is ran in a kthread.
> Add a comment to explicit that.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 592b1a28e897..34b4a4e9dfca 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  {
>  	int cpu;
>  
> +	/*
> +	 * While being documented as very slow, schedule_on_each_cpu() is used since
> +	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
> +	 */
>  	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>  
>  	for_each_online_cpu(cpu)
> @@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  
>  static bool unaligned_ctl __read_mostly;
>  
> -static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
> +static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu = smp_processor_id();
>  	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	schedule_on_each_cpu(check_unaligned_access_emulated);
> +	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  
>  	for_each_online_cpu(cpu)
>  		if (per_cpu(misaligned_access_speed, cpu)
> -- 
> 2.49.0
> 
