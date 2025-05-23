Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570147F4A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025393; cv=none; b=FziOpokyIzb3S8a0mUAWwHtYEheTCQfF8s/tTiyETHA2fLct9rytqpVoPxdeaTsEX0jJN0MHYVLI6swTIy6AcA4KIGpe1Kc2+zHlO10RmeVxPpGZGEOP76WQO3JZDIStSdYXNuvrbVuVnE0ASzb9my79bAIDkKQpeaJ38C6jLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025393; c=relaxed/simple;
	bh=QOHDK0F2LEI21yWReKMJ2qBW2Ku8NNmNWGVoqKGiruA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnTyAQsaSEEy/P02ZlFIZdCwV0S2emMguaAozQ3p0TenCQAHOEPgxEH7pexkqzTSeh5ip6xXFE0BljNBX1mAcFTG3zyAvLjwtwo8LulsYf5I0IwiGjXzd7k2LSrWxaqcPsIJ8IhA1cNl9xBkmfsZlQS/kSWJ+A8FuXEhl2Cf6rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=brVdetyL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="brVdetyL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e21d3b63so2235545ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025391; x=1748630191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=brVdetyLQ40C6IaOjMmbqJ7m9i5p4e4vwEd5WantWmRRyGkknwUd9iG1jew9mgrh5B
         7lFczKCieAehO5x97nz0zaH3Dg31V1eqcSz/0avP/D/N3HGZ6nYcqjXvUuQf+shV+QvF
         u5kaugL1a+Ul5iI0OKJnkIet0vXRhv5SEco43yEm213Yo9uxGnq+t8RNY7Hds3JATeyU
         V79lCPn+iNhI8e6eBF7KUyW9TRflxTNGyIk7Ed0icV/VXlou0XU5fyr53o8OkNMSKRTI
         S8itP1c9SEuMbj62XOIpPYZrdjmKvNTARvK01iqT2RrHHd28Cndxvm0k2CBDckAfFzXH
         4eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025391; x=1748630191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnO8ioDanheZvAb9A+PQvS64cAnXAyms8SMalyfchF4=;
        b=hINiemi5EAewlfWgLbAEvTPXq6PmTM/pwosQgYmqBQy87NPQ3AnabrHYZgxFRJsVQG
         NhmUTOx63xYAgQurMsYYPrS4MMI8gI/AhdG0NHw1Spc4bgjCyH5g/dyvNqBKQ5I/pKGk
         dVDp2N30/3kcBlXOCMgXj5Ck7yZi5X8hBE4//QfZJZcTizBTNd4O1mHutqfX5P8rngSs
         auB7trUEUwcnl0+0/In7+Xhw5T1DiwUatsoXFJxNMQbRErHhFJI4KHtUAqy9+9LojwS2
         h4hbnLn2e6wJQiESVYWc2gU1zsV5bot6JiW67Rta/wzlouZVSIIE9k/SxxbKjUazhLrS
         oqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwHDxiuKs9tKaXzu9cNP4KD8vZe49lQU/rstXDUwHQ0kKWxcfrqlprtEhYIyhpIAMfrAKP1HKfE8UiGHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJIuZuTiqe0USucrAwBRPONjMIBaq0XK4DrPRSCTLTPllp97w
	F+R4FnjKFt1MavlutCiiW5mRSxMZ6UKRrxCybU14ScFL1y5UYE3/b38Lyf7BbJtLYUk=
X-Gm-Gg: ASbGnct5eGul1FG13i4hLAUWaiC+LoiqPNDeWjC7yHyJYrNIHyaPzQLT/tmNMbtT5CW
	pZ6PuVw/OkrzFtAGbK2MdjdkMPMxJ1Iv6ETlZYTlGkNP/BisDwQmEB8KymgPvSM6UGrEY/Q8hcb
	n5W+TEuNtelZf46vBBZvXh6vyPdSF8uKcKlAaZXppNGhBgrdbLxsnKtvQK9koE76QWxAaLblMW/
	KXRJWlM9lkcfAVN/vCmRrf0dvQ3G/NFRHzmTA60m4wwd7c+BB9f0uEbqinKjT4jHFC3Sq6H2rfN
	TKAQatcmFzRTHuD6HipZLvBYwwLvpV8nIAQpsX/dqWB+oCxz0+OhI7WgJA==
X-Google-Smtp-Source: AGHT+IEwnYCpZ451OQ3B+iw4XNmTax9n7nwuUqC+o2uJAltQvhC5r0FNuL4BvGINCHYUs7gwuPUCJg==
X-Received: by 2002:a17:902:da8b:b0:224:c46:d166 with SMTP id d9443c01a7336-23414fafe1emr6331075ad.40.1748025390826;
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed897asm127271765ad.250.2025.05.23.11.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:36:30 -0700 (PDT)
Date: Fri, 23 May 2025 11:36:28 -0700
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
Subject: Re: [PATCH v8 08/14] riscv: misaligned: declare
 misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Message-ID: <aDDALDt_k1ZoID1H@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-9-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523101932.1594077-9-cleger@rivosinc.com>

On Fri, May 23, 2025 at 12:19:25PM +0200, Clément Léger wrote:
> While misaligned_access_speed was defined in a file compile with
> CONFIG_RISCV_MISALIGNED, its definition was under
> CONFIG_RISCV_SCALAR_MISALIGNED. This resulted in compilation problems
> when using it in a file compiled with CONFIG_RISCV_MISALIGNED.
> 
> Move the declaration under CONFIG_RISCV_MISALIGNED so that it can be
> used unconditionnally when compiled with that config and remove the check
> for that variable in traps_misaligned.c.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/cpufeature.h  | 5 ++++-
>  arch/riscv/kernel/traps_misaligned.c | 2 --
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index dbe5970d4fe6..2bfa4ef383ed 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -72,7 +72,6 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> -DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
> @@ -80,6 +79,10 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  
> +#if defined(CONFIG_RISCV_MISALIGNED)
> +DECLARE_PER_CPU(long, misaligned_access_speed);
> +#endif
> +
>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
>  #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
>  void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 34b4a4e9dfca..f1b2af515592 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -369,9 +369,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  
> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
> -#endif
>  
>  	if (!unaligned_enabled)
>  		return -1;
> -- 
> 2.49.0
> 
