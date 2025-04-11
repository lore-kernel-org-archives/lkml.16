Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A5E1E835D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357022; cv=none; b=d5LCKusAJ5IM/MJcrgls9bUbnCgITFF6vnhBcowSerS9QjaV/UskDGw4EpAdId+w3limdTEuNv9BNWk9LkCvSO9hJqqyfkI2QMqFb5N69yH9L1CyMPwXVO32ImV1pjgFAJlvIsnDNaS5cWokqlkpDzmssO8ceZdk9NqIzfr1aig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357022; c=relaxed/simple;
	bh=KfVFdehqow33bgEtQULYLD3N+oyD3Uq2EYep6XleFBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2RkYy04HXCktCwrE7upTcpNu+eLC0wvuofZcnTOdjJBFNPUCKcqkYKQozDBy+j/SfQ0l0ZlBOgSqbQ5YGtlN9kZ5dmDIbBaDM5d9QcuIwg+Tl8zS2cV9C5voVletJ4iqSL6y2+YIxYID1WCPfz73PBtq4wN3goVz+YLnxuiynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UH4+VuYL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UH4+VuYL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22403cbb47fso17663535ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744357019; x=1744961819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUyg6ML9LhixzC9L8kPFXh5mzqTZMszHME6+Lb2OjTs=;
        b=UH4+VuYLtGNgrrByYmgt5Gr/5/U7AgPYJmVbdckVt03HkXaHWyESNN2S/ovzQnm2Rw
         QNfSGmYfzqZdGDBfBIo13Dle5ShgAaN0MwLpUfDFd94qwZoGdIazcfzRzB1WHmqLdefP
         8Eg1niB6RoMzQ0M4ICqeTOAgCf1p+bmxIu+/bEb2+71Jm+BQOQozfJEF/89LXhFBh0RF
         x8KgNX3+q8j3oCPlwCt6ebl5BWyjbsPoNwmUrvxwGSbzuW+2iJUBWbI3sKJD4R5SeBEH
         jOmT87wDhZWPzqKA2tzWr0W+ZPZYhzRWzAYHX7ENpn0ALEctFd11ZXajPNDr9r3fAPyA
         3Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357019; x=1744961819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUyg6ML9LhixzC9L8kPFXh5mzqTZMszHME6+Lb2OjTs=;
        b=wTh4RPOdZpHGwludZ3iceioBfDr+v1ivPg6W66DvP946wiBjcD4i91Srd54fKYcVzM
         1Z0g9F6KObuQMYo9CocvkvKYMiujVuW5N3KMCQKl/Uwq3Oo2n5Gt4inbN00db1I+tRZ3
         AUd4UejhYrrGfcMunufc5IJIoIVyV6mQgghtVeR34AvjaVYU1tn6ZrhMkYSxZio8gz6J
         hxe8iTrKZId1J3elm57XRxYJ1ypUwA70wbUA7GhVVa+DjpJ+MjexX/m50tE4ZOjgLVFT
         4oOw5/ZgnU4CUKsJawwZ71mc31UD2EJIhssGDVcWF/v23dJyBZv8+gosZ4p17/9sAXSq
         L7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWbYflzKfgLMcvihe+S3RcGaXfFOGw1U4EQcsuiDYkDKb7zdwZMbsYe5QS7ZF5i5i/jpRD/Wbn4JRwlNfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6dQ4wSped2HnNDcvFO3FUs8f9M1u2wuDJxXAMMx8lXjWhnS7
	emXERYanZ5sOgjJnUaKLDroMZZULOdXB4JeeuWJXP21NIMRloRiMPeEoT32l+GE=
X-Gm-Gg: ASbGnctOMwsjtsK2444EdRrBQWIrqLbtQ3DD2ln+s47XLuRqLOlhjFH5YEseoteO/jC
	6WyTc/PeG29uEPI6W4/9wJ46m5xHPvnepyZZmCwllyKP2K+uIempK+Molp93m0F+JFLeo/RRD0f
	cs2DaLa6OSJMDpOwdd20dbvzSkuDCtI6jvIitMt/VcVGj02cQjKFBZ4uOYQ6DWW+6XKFIF993Q4
	Z1YkU0acx/4qbti6+XeWbsCcbbg4LhT6pPRHCnpTBiFADT2YfJYHXp3uOYVXF7fOeLn0Rf4j3NJ
	SvqprD6pWPhlpEcKhwLdXD7hPXFFtiQagCX1mR5OVk3awuqkLLmz82MCEneeAUtUtiREoU2QNKq
	Ql4hz6+HNfQ==
X-Google-Smtp-Source: AGHT+IEd40nfp4iwGxv5MLZynxdnkq4ombov6BmiQiZEKqPac8tr3ttbIGoc6Dd0qawCy4dcOKZdGg==
X-Received: by 2002:a17:903:3c6c:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22bea4a3453mr25307265ad.9.1744357019038;
        Fri, 11 Apr 2025 00:36:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b96sm43068365ad.13.2025.04.11.00.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:36:58 -0700 (PDT)
Message-ID: <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
Date: Fri, 11 Apr 2025 09:36:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Nylon Chen <nylon.chen@sifive.com>, linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, jesse@rivosinc.com, evan@rivosinc.com,
 zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250411073850.3699180-3-nylon.chen@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nylon,

I already have a pending fix for that bug which is to reenable
interrupts while handling misaligned faults. Please see:
https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-cleger@rivosinc.com/

Thanks,

Clément

On 11/04/2025 09:38, Nylon Chen wrote:
> Use copy_from_user_nofault() and copy_to_user_nofault() instead of
> copy_from/to_user functions in the misaligned access trap handlers.
> 
> The following bug report was found when executing misaligned memory
> accesses:
> 
> BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:162
> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
> preempt_count: 0, expected: 0
> CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
>  [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
>  [<ffffffff80002304>] show_stack+0x28/0x34
>  [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
>  [<ffffffff80010fe0>] dump_stack+0x14/0x1c
>  [<ffffffff8004e44e>] __might_resched+0xfa/0x104
>  [<ffffffff8004e496>] __might_sleep+0x3e/0x62
>  [<ffffffff801963c4>] __might_fault+0x1c/0x24
>  [<ffffffff80425352>] _copy_from_user+0x28/0xaa
>  [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
>  [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
>  [<ffffffff809f4f1a>] handle_exception+0x146/0x152
> 
> Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index d7275dfb6b7e..563f73f88fa8 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  
>  	val.data_u64 = 0;
>  	if (user_mode(regs)) {
> -		if (copy_from_user(&val, (u8 __user *)addr, len))
> +		if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
>  			return -1;
>  	} else {
>  		memcpy(&val, (u8 *)addr, len);
> @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
>  		return -EOPNOTSUPP;
>  
>  	if (user_mode(regs)) {
> -		if (copy_to_user((u8 __user *)addr, &val, len))
> +		if (copy_to_user_nofault((u8 __user *)addr, &val, len))
>  			return -1;
>  	} else {
>  		memcpy((u8 *)addr, &val, len);

