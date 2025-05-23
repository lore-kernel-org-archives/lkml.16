Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A52980B0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025049; cv=none; b=KVmhxoNB2pjI5gsj3Bao3dZPXr++GMwI/Ve7pzs32mh9cbFM5UE108I+K3VjOp6EFkYj3DXHb9X1rZKm5x4CafoRWvNJFe57vogEzv0ICCCrxG9AQBkcJypHNINKqlVS0devpMQwm6cA8GrRQSG/GKKB9a+WSlQLEtQiJjYy3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025049; c=relaxed/simple;
	bh=JbUIjDHozqFZ2+ZIIgiUMiStVmYqgccKErpZffZ0FfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upEdq5CH78xKJMjoIsFmqGr5Q1GqwWCid20CXWhmUyu971BYhNhw464utLpWK/gUuHngzHM6i9qwSqWnN7p+Q2YI/K6bKpA4zFJI6v3OUOwK97z7U7vNrsBS3JBIQmb1oI7SXhO595CMgr58p19R2TqecOFLhe7jr1qukWG+QLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rhEIa+hf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rhEIa+hf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-879d2e419b9so116002a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748025047; x=1748629847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=rhEIa+hf27Y0eogw4f14fmL/RUgsPCjErP4boL5tqlV8qiJU5oNRGebUrW3BfBg/pl
         HcXzZRCbqoSNCxHmt5M/FEFoY1vQIAA6gMLKstDImwuioj4yJOyHcPMujIPE8CuC3Rk4
         lkWcWTRYa1V5brIK/1fGVlHa7Bhyqf5ZHS4762XOzAg9nL1gAkAbunOSfhjyz2FMTimR
         9WHgPUMo+OOTOGAxDz4nXBQflbBr40xR1HDB2OB6DAkp0RfSjT/F3wE8KXMMvXV/43wD
         5f0TZVNHIaevd7EJhxS7SD3x+qXkh4caexYLB3t/x5pf92rZqDsiWfotAhwq/uEtN45Q
         8IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025047; x=1748629847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWbUHPNgvAgT5G9XCmvjzlBHTlpN3kX1yERm+5eFQko=;
        b=vHch5FSoozinFJVuAOI7LICC/f/d0ReZcm/ebtNyGhLTXC5PAz+lVAIYdRzuX8jOt5
         LRIijzviCUTw8AE+MzDizhRYfPJHaxBA5EsDe0LlZjMuNCsE0ENK5K0Mu32HbRxqJKJu
         qySxNwrm5sIYYp96xzXLNcp5C1xjQA4mJr+vpOrazoATAMaBlwS/20IfWa8Pp8wB3vjV
         7wtzNyAxPfYsTXIuPDFtespU83ExOJ+accsz3oOfVGQeNDSpBliY6Rad6j7cFhZW6BLj
         CvuaQa1Q1DwNR14LZgC4wqHwYZo2yS8UbNmGN9QHy3/B1hzrjVNv4thepkfpOAZ9hvSt
         6KYg==
X-Forwarded-Encrypted: i=1; AJvYcCXg7MDNpreTALT/30jjQ/UxWZQpqHk612tJFvY2L1x3jlzzBN4DKSJRP1ueRzBJul/xi0nAGCVL6Rx+/xE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmN0eI9xl/POhDatWbcVgZTwS2/ML/WmhLl3AtauKFyFV+8RiY
	AZz0LvmbJJ9xIy07wNxk/nW6JuAQ62wgIJ76wbWgjp99/NzJottoYxYxBZiGHjhwUFk=
X-Gm-Gg: ASbGncsRDKjAopNi6yv3KT2b0JOfkrApkKVeNgaS5tlkLLgwWdRWWjQO2v9jJGXXDja
	jdus78IQxMVgc9lmiZYgl6p1CsrWEp8uTcsAnSh2JV+gUlBu9PvwYe8z9QmoU7LMaQrqaX38+Ti
	OtYbU/aCu7NJLQ9PJXfUIsXVipaFDyBsgZGPdjTMunEP2R5/PmcFqtIl4foQeuJ7g/ff9tlAlH4
	TwfUjWzTHJtTTr5B9roIFvx9ltliR12Vp/3+b57XzrYU7mPGFjKnQhRE5B/2Mn+1gNAJwGnnwo2
	F1AU3qNzjTVl7HIiniul0M915sVMd4Sn2CiLlJ+n+GPuxxo=
X-Google-Smtp-Source: AGHT+IF6EgWK2eUC5Xu5iRop7pXN3/Fhxf1IfDgAGTEelKq535OUbR+gaTA3ptsvLBrT9R7jy18zfQ==
X-Received: by 2002:a17:90b:17c1:b0:310:c46c:ee6b with SMTP id 98e67ed59e1d1-31111a4c866mr121461a91.33.1748025046448;
        Fri, 23 May 2025 11:30:46 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:bb2c:c7d9:9014:13ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f7eb53a9sm1014559a91.12.2025.05.23.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:30:45 -0700 (PDT)
Date: Fri, 23 May 2025 11:30:42 -0700
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
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
Message-ID: <aDC-0qe5STR7ow4m@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523101932.1594077-10-cleger@rivosinc.com>

On Fri, May 23, 2025 at 12:19:26PM +0200, Clément Léger wrote:
> Split the code that check for the uniformity of misaligned accesses
> performance on all cpus from check_unaligned_access_emulated_all_cpus()
> to its own function which will be used for delegation check. No
> functional changes intended.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index f1b2af515592..7ecaa8103fe7 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  }
>  #endif
>  
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> +{
> +	int cpu;
> +
> +	for_each_online_cpu(cpu)
> +		if (per_cpu(misaligned_access_speed, cpu) !=
> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> +			return false;
> +
> +	return true;
> +}

This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
will always return false in that case. Maybe there is a way to simplify
the ifdefs and still have performant code, but I don't think this is a
big enough problem to prevent this patch from merging.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> +
>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>  
>  static bool unaligned_ctl __read_mostly;
> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>  
>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
> -	int cpu;
> -
>  	/*
>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>  	 * accesses emulated since tasks requesting such control can run on any
> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>  	 */
>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  
> -	for_each_online_cpu(cpu)
> -		if (per_cpu(misaligned_access_speed, cpu)
> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
> -			return false;
> +	if (!all_cpus_unaligned_scalar_access_emulated())
> +		return false;
>  
>  	unaligned_ctl = true;
>  	return true;
> -- 
> 2.49.0
> 
