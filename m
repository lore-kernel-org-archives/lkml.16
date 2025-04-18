Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DD215F5F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993144; cv=none; b=Oyq7/qMHodkavtWOIQ7Eno7EakAhBXvwdTe8yN8cD03nQs0FgDHikuCEQdoMyYIkIp96ZNsO2fwL8sOK6rGQM9Q1BRbbl7hEjBAwX0uY20bHohjIBS8zTwQEtGmqx39vRVMJrW2eTiywlV8l1t8gjCuLWzC7x7jl6jMm0X5Xou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993144; c=relaxed/simple;
	bh=pEQkVLsnkE1RxkW4tmeDCCG5BRacLN6ef5ZA7YDStxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCNeI9196xvUKGE12rq+QsFJ/mDfJ0rp70dWZAZpU7w/sBVWJGgQfafvLcIvfYIfad1Y55Ava845QpaidAB93O/doUA8NgodyfOyUt6zy8D5QOMPnG7fstseG+gkTQRccsImrZP/e4jVOBwUmHBg+q4GtjMK5ZAz35Qs6OuA0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=F9VzvW29; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F9VzvW29"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85db3475637so89959539f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744993141; x=1745597941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePfKgP0uKVNFgoT+zVQWJDPRxOOn/U+ue7Il0AVta4I=;
        b=F9VzvW29U6wQHoo+E3S3SpoJdx1O3lIlgWoLnbGvyuqd/iQtSbqhnurCQKIq1AqJRb
         BSez9qC7YwFvvGq9Epe1jRhpRFCU230d1H6jL++NlhtwYSdkfkiUY4gHe8ToKwdyVJ0Q
         79GQFUyDRawqqZ8CLEMmq4OwaNG9Wo0O7NnZIFFAAnkqBnOcm7z7hM7kRMDyzMoK9GB3
         7i15k31q9pMIS6BjZi8Kcz1msdQvHWm8u/coCXjywHezwKz8JjxcxQms0ykV5Xr+3Nxp
         Ab93uEQwwj8V4Unw/VYQctLFNY6ADIwXLJN1GKhSgiJFQ9YSuzKRCJ/v5bGuN/smq9iM
         1qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993141; x=1745597941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePfKgP0uKVNFgoT+zVQWJDPRxOOn/U+ue7Il0AVta4I=;
        b=i+sfz8xzKA0An7kWo2VPx+m+XX2sfo4VRsz4OA2WxG5qKL3hmsuYIrqdV7h7oL4cGZ
         oH+Ek9ugkt4IWKiUceKUhAO7WG1I/0yo3ZMGWL/Kipmp9xbSrMM+5SEqrYQt1b5Dq6m9
         aKVOiXRFH02U/0OadiigwNhDj1IsG+V6b762Lw+l0i75rGLg4Pdf6vOo0TINGNsVT4V2
         KckHvRcwIXDVNEMSkR0CGW62i2jVdmJUa5MIhUbupmTt2U+6+fftIpcD5cWawqlxsPds
         HDQ/8xgAdRfEBt1UUp0yjxETPQflUlNs5FmhNzHVwo4cngxUOgJg/+HrF9s/P6AT9kUS
         8euA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cx+ONg1QFJbWr6Rg/3fiZvpGhKbUosVNrGJoMBjrFUbmBi6kWPK8eVpHAbRKRt3/Rx3a99D4WDp3i5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+luwekler9dXCHoBmnZY2Ldx0AdK4LtfCmOPuIdfXSViv2tSc
	uYR/ysKOUOgSTesTwJHoq/fOBnUyQj1oQAZY44rbAKkh/93yyx8sHt39AJusuAc=
X-Gm-Gg: ASbGncstCoQ/h6jd8ArlTmjwxBvQcYHi+nfiuMlLxOsQdFyoxHpGZyukLhzzTowoQjt
	toyVDb3XWLfT4htJrJViYikFXFH4//gMiFd6WSy82DxmabYGzA5UpcrS+Hbb6wO8I4gTENy4gjq
	65/tgmG4hA+q+fwsUTPrNKOVn490XZPmQNE7v0e7ST4YUL9qcrlNBgQc8rP1tZVxbmVbWLJPbMV
	B7Cx8b9ovq4n9KfhAx8ZEp8rEselZPP8rl6mkcOEUsF1zdJD4q6OWZfdwGexl5HNGu8OOSUUbc1
	ikJFM4RXxHLw2XcF9vb7OkwpqXIT9rYLW+d38jV4SE/L9hCxUgm/j1CwCg==
X-Google-Smtp-Source: AGHT+IEvYD8CyOarFeAdARgzHXcquFCOFcE3q2vpY4E/2mOeo90KFv9nv8xpCX6+Lrf2zXFCiqzeag==
X-Received: by 2002:a05:6e02:178b:b0:3d4:6ed4:e0a with SMTP id e9e14a558f8ab-3d8b69608b7mr23960585ab.4.1744993141239;
        Fri, 18 Apr 2025 09:19:01 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d821d43a1bsm5092915ab.32.2025.04.18.09.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:19:00 -0700 (PDT)
Message-ID: <b864fc90-1297-4e1d-8487-61049e23e405@sifive.com>
Date: Fri, 18 Apr 2025 11:18:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fixes] riscv: uprobes: Add missing fence.i after building
 the XOL buffer
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20250417074952.1315641-1-bjorn@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250417074952.1315641-1-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Björn,

On 2025-04-17 2:49 AM, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> The XOL (execute out-of-line) buffer is used to single-step the
> replaced instruction(s) for uprobes. The RISC-V port was missing a
> proper fence.i (i$ flushing) after constructing the XOL buffer, which
> can result in incorrect execution of stale/broken instructions.
> 
> This was found running the BPF selftests "test_progs:
> uprobe_autoattach, attach_probe" on the Spacemit K1/X60, where the
> uprobes tests randomly blew up.
> 
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  arch/riscv/kernel/probes/uprobes.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index 4b3dc8beaf77..4faef92dd771 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -176,13 +176,6 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>  		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
>  	}
>  
> +	flush_icache_range((unsigned long)dst, (unsigned long)dst + len);

This works because flush_icache_range currently ignores the range, but
semantically is not quite right, because of the line just above the context that
increments dst. If the range was respected, this would only flush the ebreak,
not the preceding single-stepped instruction.

Regards,
Samuel

>  	kunmap_atomic(kaddr);
> -
> -	/*
> -	 * We probably need flush_icache_user_page() but it needs vma.
> -	 * This should work on most of architectures by default. If
> -	 * architecture needs to do something different it can define
> -	 * its own version of the function.
> -	 */
> -	flush_dcache_page(page);
>  }
> 
> base-commit: 1a1d569a75f3ab2923cb62daf356d102e4df2b86

