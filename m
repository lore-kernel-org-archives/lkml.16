Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F118E050
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949795; cv=none; b=rrttN0S3k+gWXEyoTiYRhctoJseIhYlbzkOmzJYdcRQgIE2orUisDhaY7v7bLS0tgsay/H/PA6R16UHUjH4s1adHumkP84vrSe19xP1h939IgKA67elhmfnhl/Q6h6uPtfj4N0O4biB1k4T9u8sfBBfpmd+PAF7eVz8vyMvQw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949795; c=relaxed/simple;
	bh=1faVqxAJMPp+8ZIWw6HRyO+SmL2PtbSPBhqbrVP/HA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPHknFuOTomOHa8Dgh/Cxqa56Lzoaiimq7KWqXxQYq0yDUcm9UTTGM+Df+02egGxE6ZB4i7IBwOLv+M2+YWFawfYDDGtAfOm84AtLQk7tJbrikh7dLyLdclsh68Jox8Gs5NXHtWa2UmmHlDBgIdF34cG+ZWwlDAoIrklij0jT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nH8SIpwt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nH8SIpwt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so16324405e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738949791; x=1739554591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdGyH2E/lzVgHpl45+X40ixl6XWf7SNcyX4xVKMs5qs=;
        b=nH8SIpwtnCAG0ROizt3+1Jzu6zE4xZt2BUrojDD8fRA5gViv20rRS9oRMOwC7JhhCd
         oYT5Fxt2Q+eecfSB43l06hI/KuXWifHh6/mUa4jB9UQZz1eAuIIe8jingTit4wmiRRE5
         DqJIrNxCoJVCnJAHB6YjntfpdYeqzIDuQATmcx79WmVI0LUMZKHJ+9xyIM8AjYI/3rZx
         hU0Tpo4AbRhW/Kg6AyGNG/8Ag7YDFHmiFcbyiMp2nnBYBADLlH90r5jcijZZRRQ2W4vD
         TPo3zmvTeNN+bWsBoYAS9mov0MLPD23RcS6io9sG/Rjw/cyQXKwGh0Ig8VQEtiVFWoq0
         bxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949791; x=1739554591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdGyH2E/lzVgHpl45+X40ixl6XWf7SNcyX4xVKMs5qs=;
        b=WDrcfhQwAmqVkqq6hoEUVS4Iv95EjY7FjAEUR3IVa3meXMhQCOJumxMP/ErSjOieYL
         RsALzKmBcLk15keLToE50mnTCLwHNA+6seJbtBKWOGRxDFGw7gYm19MgRppptlqw40j+
         jTaplexPJfGjQ7jisZUJgMocnFlYv6KnniLFs6s/tPcUqISTNsVFqm2LMQoN5msjonfw
         nzwXA41A2xvlhGaZEtarUXCnzn+MPkDLfeb7mXrq/ziFnSSsjOpL8QwJTG8TiOu/lESu
         deHA9YG7DcK3+8YMZjxqC+S3SbOpikCR3T6Y4BEiGiez5USJc4gjWmw0NuPELh/dmTwj
         Mlkw==
X-Forwarded-Encrypted: i=1; AJvYcCVqfYskcv6AG2b2B8qYJQ86Hd5x4cgOitijSqyfeP/4ImtEQflL83vAGLX8ZVpWpbH0tEtisnccnXe/CX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJ0gijLDgUV+FgnPw4TuO3YJSJMBiji6KYKIhAyxuTWXSkr6i
	mFn85iCSdtc3DIE4SilwMhtnj9bFAfL6TyFUygGoL83P48yzXvOJ89ZDkYaKWwg=
X-Gm-Gg: ASbGnctVqtLtYVjY+GX7nncBD6MzHGLLp/Xt1uth2wpnYA8NMEcx7SAxpUu/HUqRBy9
	vvXNGGN+JlNQ6YLi4VkAkGOqaB571vDXb9kLFFRX9rOkBLEGvaL3BhGdwNX+IEdAEJUHulfKVvL
	1F0/8bllPD2xnKGZEWvjjIzss+m4aFQpBPbiASLt1PwFby96WFjBWnbLVHJTvI8RQ0ooclS0Qmh
	qJGjjC6P3f1xAT8nyA5B90lUWZfgxxDXvLhuXgjNpOpZXW8+CXatR0t20SmaI9jiLakS4zZUIOS
	2D8aAXcU7VHgdnatgJkUxjdMxrzmXwTd5MAHqTPVY0LzJhj9pIdnOcpyw+Fn
X-Google-Smtp-Source: AGHT+IHbBPJuhBLqD2SYb4O4hhJVyROZRDiyBlna50+qnrh0+hL0DpVP0IyiE7EUFVMyiXckoCu9TQ==
X-Received: by 2002:a05:600c:3ba3:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-43924972d28mr34925535e9.4.1738949790180;
        Fri, 07 Feb 2025 09:36:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd0d3120fsm651772f8f.70.2025.02.07.09.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:36:29 -0800 (PST)
Message-ID: <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>
Date: Fri, 7 Feb 2025 18:36:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-17-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-17-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 17:19, Andrew Jones wrote:
> Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
> set up a cpu hotplug callback to check if we have vector at all,
> since, when we don't have vector, we need to set
> vector_misaligned_access to unsupported rather than leave it the
> default of unknown.
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index c9d3237649bb..d9d4ca1fadc7 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>  	per_cpu(vector_misaligned_access, cpu) = speed;
>  }
>  
> +/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +{
> +	schedule_on_each_cpu(check_vector_unaligned_access);
Hey Andrew,

While at it, could you add a comment stating that schedule_on_cpu()
(while documented as really slow) is used due to kernel_vector_begin()
needing interrupts to be enabled ? I stumbled upon that while reworking
misaligned.

Thanks,

Clément

> +
> +	return 0;
> +}
> +#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> +static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> +{
> +	return 0;
> +}
> +#endif
> +
>  static int riscv_online_cpu_vec(unsigned int cpu)
>  {
>  	if (!has_vector()) {
> @@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>  		return 0;
>  	}
>  
> +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>  		return 0;
>  
>  	check_vector_unaligned_access_emulated(NULL);
>  	check_vector_unaligned_access(NULL);
> -	return 0;
> -}
> -
> -/* Measure unaligned access speed on all CPUs present at boot in parallel. */
> -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> -{
> -	schedule_on_each_cpu(check_vector_unaligned_access);
> +#endif
>  
>  	return 0;
>  }
> -#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> -static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
> -{
> -	return 0;
> -}
> -#endif
>  
>  static int __init check_unaligned_access_all_cpus(void)
>  {
> @@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
>  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
>  				  riscv_online_cpu, riscv_offline_cpu);
>  #endif
> -#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
>  				  riscv_online_cpu_vec, NULL);
> -#endif
>  
>  	return 0;
>  }

