Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B418DB2E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946700; cv=none; b=GduSdyW90Jn6kF6+ag/GLGfLE+AbrGR1JlYL2qND7l4pDNUik/c7bomDF9uTdOZUCVwqJtpN06NsN0fC3hVPGo9L332dnKseARviLqrILy0C7AFINHc2NzQGvctXc131lO0BKkJVxRORzzas5Q4XUQiAMUQB5qVpja4vnSDrlco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946700; c=relaxed/simple;
	bh=mTOQL42nAXKtizbXCMERyHLamG9SlVz4aP3wEhd3a18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqe4DTQrbr+t87mEUOm7BgihZjmABRioyVcitkQreRvuEndUxvJlhW+h9QMMKsFDmlYelPRPRYffW3ADRstxS1JLOphwPU2A9NaKfh1mp1oxAhp6r2a7dzWjUaAQOeWpzEkbvQj3Ka/F6sPSN+i5HiWRps56XIXnERj2EZHvkhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BXZZ90ht; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BXZZ90ht"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so22720585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946697; x=1739551497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZIYulAKvyE39mwEaJ29cg5h3kNH7aHvV9BF/VrZe24=;
        b=BXZZ90htq3OJdJC3Sn1KTCOx5+L2CAvLK35xEckZnoqLZg9rtvW5mmN3wGxaFRSrIc
         0MCYMaTzTg8LdlA7P/I6zPJXym8j+iML5hKUk3kg00m+ErX4tqvbesGuI/Gz1h4IFPkC
         ZaWgFaKdgOCCYnjhy/8qaaah++WOJB9tDISA/f2ofpQS2uYa1Xmk79LrhJsUwk9qOnzy
         JnUri708gg9HadtceTw8TQl3uODeBbRnHcHdB6kD4Y4rkKcSrly4b78sHx6CFeStivL0
         UyGZLvhyHWTsJUM8t+GungjII+scHs6YyedjMDwl0eXlaDY8fGev2ONyRq1bRgpfY+s/
         g5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946697; x=1739551497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZIYulAKvyE39mwEaJ29cg5h3kNH7aHvV9BF/VrZe24=;
        b=eG4ZpFrwa4+WZ+NF/8mQzi9L6+5t4TO0wBI9ZpUfkG3pBYyWAnBQCpFEm404iToIAL
         seTAuGv9Z0Guw40SuOf3yMS6EUVHs2KYBmw1GHlCzNcEAKCEhh9cAlre0uWzuVxkwJ00
         MyrWSXKwrlIg26jEmUeDWh781e1C71tLnTq7J/1CeWjf4k5v2QzEK0kMfXGp4xTbIpVU
         b0NB9NvdAYXmZCguQoXykimFpTbmRj7vmzlqOErGxJCwep50kTRxcWe24VTdB6EFcc2l
         HamIekycyIrl0FWCiypqkWpRBEMRpU1cXME5irTQhbJKT+3q8yigBo8F++Tpz1nJDBZ3
         Ubmw==
X-Forwarded-Encrypted: i=1; AJvYcCXrbceojFpDICLLPFXQrFHSbhfeLU+wjcp8iMr09GIYoDA158EZP6Ka3QOCmn2ig6ZVKtgLoudHHNUZjPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJXcHWzCn7lyOUQOR3Veh2OYEAwqMW1Wbs8aOegy4wNiuLmA7
	A2KplUG9IH3Pmy1eOyd6JeF6IhG4qzIyeuJ8slH+Vmq81Qb55TH02bgmJoseJov+v5wsOmnn4le
	YBqo=
X-Gm-Gg: ASbGncsNX43FLvn+Mg1YbOUmI6Y/i9wn0z+E9BBvqXZgoIY2cXbz9jp2gnNpGxzbgUN
	BYStvQeZ5li+nP08eG/xBx43MEpZm30oLv/N9+6UHeInYLYZltuawN72Y+ZaGqmasQABRwwOlhj
	FhtZrIRGNEQ3fQtW6FBNX0he9IeIKNVVUaF5fnqF9O+s06uIZ2ra6QM9EvxzKJ/PdJ2x0z5UQQE
	yjvnOI6HR5+6bzI9/eLQPsnceKk+67Fc/qWYkdYUYF+484LcIwd+PMZBdW6F83UbpGCqiu6zgBR
	xodVIKVhfjGwmirIyxIjYZFiuISZDkjloPx4apw5tn3aGaNu6TVUpUlkISWk
X-Google-Smtp-Source: AGHT+IGQB1zu4BTh1IXtztuQ6/swkcvzjhEnqBbnVm3ESnobwl8EqdLDpJndofoHvNQtTE4qA8de7Q==
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr30934385e9.26.1738946696980;
        Fri, 07 Feb 2025 08:44:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm59185385e9.13.2025.02.07.08.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:44:56 -0800 (PST)
Message-ID: <b69b46a8-a37f-4d1b-94fc-0838c6ca24a9@rivosinc.com>
Date: Fri, 7 Feb 2025 17:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] riscv: Fix set up of cpu hotplug callbacks
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-16-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-16-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 17:19, Andrew Jones wrote:
> CPU hotplug callbacks should be set up even if we detected all
> current cpus emulate misaligned accesses, since we want to
> ensure our expectations of all cpus emulating is maintained.
> 
> Fixes: 6e5ce7f2eae3 ("riscv: Decouple emulated unaligned accesses from access speed")
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 27 +++++++++++-----------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 780f1c5f512a..c9d3237649bb 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -247,13 +247,6 @@ static void __init check_unaligned_access_speed_all_cpus(void)
>  	/* Check core 0. */
>  	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
>  
> -	/*
> -	 * Setup hotplug callbacks for any new CPUs that come online or go
> -	 * offline.
> -	 */
> -	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> -				  riscv_online_cpu, riscv_offline_cpu);
> -
>  out:
>  	for_each_cpu(cpu, cpu_online_mask) {
>  		if (bufs[cpu])
> @@ -383,13 +376,6 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>  {
>  	schedule_on_each_cpu(check_vector_unaligned_access);
>  
> -	/*
> -	 * Setup hotplug callbacks for any new CPUs that come online or go
> -	 * offline.
> -	 */
> -	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> -				  riscv_online_cpu_vec, NULL);
> -
>  	return 0;
>  }
>  #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> @@ -415,6 +401,19 @@ static int __init check_unaligned_access_all_cpus(void)
>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>  	}
>  
> +	/*
> +	 * Setup hotplug callbacks for any new CPUs that come online or go
> +	 * offline.
> +	 */
> +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> +	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> +				  riscv_online_cpu, riscv_offline_cpu);
> +#endif
> +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> +	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> +				  riscv_online_cpu_vec, NULL);
> +#endif
> +
>  	return 0;
>  }
>  

Hi Andrew,

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément

