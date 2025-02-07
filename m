Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA51192B6D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946559; cv=none; b=aLzu3r9w+NRz6nSQ3BSH087s6uvxc9JRvOYB7RXYN8uMp4sRP9Bj59I2hBudDn8mmM6OkmDsalQTad24eFxHAs+MjrhkZCSYPHrKEI85J8vemxIwrhVMQERIHsSH1y7ihPFLxoK5Lepb9UAZN7wboWB4Cg0P4oPRk5QQB5jYT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946559; c=relaxed/simple;
	bh=JZ/B2GnqaYMj06z1WHxZMz1svapB0kh9gs+Iaev+UXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1MjOQXT+ZDtgW+yvpw+uiv9SrY7lvGGoeXys4I5wjxLtOgbr73YzxLkUhchyFn46wd6mo7nbot/LEo5NhIe1lvZsUwJC7MXLXc4PKKIu08CFvtBLqtkvY8Hf+CKE5b1pfOziMdfeX2c+SmC5ZArmMbH3qK6VBmnM1CwlvcI4vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gyB3S3j2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gyB3S3j2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso20770415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946555; x=1739551355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhByG6ma/CCtg99IeiiHau0X6tUcp/TIvfIcykd8Mjw=;
        b=gyB3S3j25FpDuBWaHlXGfoMU12QJEClQZM6ZYr7/WEyhMBJdIqZ1ai74tAva1DZIEC
         rtnIHQ8L4KLBDv8vE73+lnfm08QJmc3JOIs8rHM/Mg/sWSizK1qhG6uNGbeZQWka9Qvl
         xlnRRHrMG4d/1Y+B2xO0Pwx6COXUXQPUPt2LfplXjvLOFWPEZp745oSROmAcCcbkmUYo
         SLZAeD5sKDIvJAcv6nolHR2lJCEqdwy7OU1GkMni87UUpgpyAYa3LSDyAiFihGh56vaP
         qsI0PAcaQwl8O21emZmRr1e8HIpW6EGl6SJ6gKz7pI6HxvPGQ8fPJAjQCshz1q+a7xm2
         7AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946555; x=1739551355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhByG6ma/CCtg99IeiiHau0X6tUcp/TIvfIcykd8Mjw=;
        b=sL5p5jHw0J8Lj+Rf4XG4d7nRdjGt+fxT4AbWYfj5mzRHKpzEVtuS3gSY7U0ml5QesA
         uMpNbshRPPvcL7pRbM2bP7gfUr4D/t4VeIpw08gSfPYHvv0hKnbssgAgXZIeqk+wt/+x
         hWLtQYDhyLJg+JMbXB6Fx0Tdex1i/Iu+a+7d/nJgVIYrEnHmNFxpq/GWOJ+tjbsUkzx6
         D2MOuL96AN98l3SfqlBGpHpW/ot5vWrsDMqNjkCdBBqu5/rL+B7GipMtz++pGt2sq6Yi
         DdNoACq3ngR5rF7Watw8bAFDm1LD/mgcqre2m6nn6WG/eq3GbtuG26FuxZccEfCRKhj2
         q/vg==
X-Forwarded-Encrypted: i=1; AJvYcCXqc+qknwneE+fGbqPy3C+yGNXmJV0LZsMATSHH9kc31ADKnHJlRn4ERJwbza9SqNSFW9DHDnm/YRWZuK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvDH89sdqmIs59CET8l2TTD8lWD9R50oIglv0z9+V7LpfzLs0G
	nI7mqgZUIcXH4nVXwIvnrD1vvsEKs5Bjt3JWOXh2oqB5Cr8/u0RZUTePNjXSmmXzfm5oWGufUGS
	I/2E=
X-Gm-Gg: ASbGncuEpDmTaRule27zXP8ThOx++KrUCf7bQlXsBYXD26HIs/xEarpPJpGevcUQe0k
	NfIHABtNqKCkL4ZJXlY9cxtakY74Jk8HPCaRtga47Dmdk7KnB4OaD7lU5fmAMAB5ALUmLJsvIPw
	RlO6Fd1psijO7h14jr+cYM7TlJ4rIVnVhDNHuWU3TSAKU1W8B6+z4OEjwaPpkH73ResHtHFGGKV
	OAZGLXJRS3y7eZrg+SyoUbdEN74UjHROgClTXSz97WeYcUBMrv2tKwafx1w/9tHh8zkdYO2odID
	720ssGS9JzxXA0hIUaE1UyniK+FsGVe+6pVazYQEKhCifZP/ZVOuirkNlztg
X-Google-Smtp-Source: AGHT+IFndOVqVL6fCq+3s96eJy475G+cWXMlxn4LNE1FeT93u8xS7tBkrWZrckpAsU4XEeMbaXtLdQ==
X-Received: by 2002:a5d:5f48:0:b0:386:37f8:451c with SMTP id ffacd0b85a97d-38dbb20b159mr7040560f8f.1.1738946555464;
        Fri, 07 Feb 2025 08:42:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm94877305e9.9.2025.02.07.08.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:42:34 -0800 (PST)
Message-ID: <95bcf744-63b0-4b44-800e-ff2ba1ddf86a@rivosinc.com>
Date: Fri, 7 Feb 2025 17:42:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] riscv: Change check_unaligned_access_speed_all_cpus
 to void
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-15-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-15-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 17:19, Andrew Jones wrote:
> The return value of check_unaligned_access_speed_all_cpus() is always
> zero, so make the function void so we don't need to concern ourselves
> with it. The change also allows us to tidy up
> check_unaligned_access_all_cpus() a bit.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 02b485dc4bc4..780f1c5f512a 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
>  }
>  
>  /* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int __init check_unaligned_access_speed_all_cpus(void)
> +static void __init check_unaligned_access_speed_all_cpus(void)
>  {
>  	unsigned int cpu;
>  	unsigned int cpu_count = num_possible_cpus();
> @@ -226,7 +226,7 @@ static int __init check_unaligned_access_speed_all_cpus(void)
>  
>  	if (!bufs) {
>  		pr_warn("Allocation failure, not measuring misaligned performance\n");
> -		return 0;
> +		return;
>  	}
>  
>  	/*
> @@ -261,12 +261,10 @@ static int __init check_unaligned_access_speed_all_cpus(void)
>  	}
>  
>  	kfree(bufs);
> -	return 0;
>  }
>  #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static int __init check_unaligned_access_speed_all_cpus(void)
> +static void __init check_unaligned_access_speed_all_cpus(void)
>  {
> -	return 0;
>  }
>  #endif
>  
> @@ -403,10 +401,10 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>  
>  static int __init check_unaligned_access_all_cpus(void)
>  {
> -	bool all_cpus_emulated;
>  	int cpu;
>  
> -	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> +	if (!check_unaligned_access_emulated_all_cpus())
> +		check_unaligned_access_speed_all_cpus();
>  
>  	if (!has_vector()) {
>  		for_each_online_cpu(cpu)
> @@ -417,9 +415,6 @@ static int __init check_unaligned_access_all_cpus(void)
>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>  	}
>  
> -	if (!all_cpus_emulated)
> -		return check_unaligned_access_speed_all_cpus();
> -
>  	return 0;
>  }
>  

Hi Andrew,

I had a similar patch in an upcoming series but you were faster !

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément



