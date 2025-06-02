Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E1E1EE02F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864708; cv=none; b=dhqafeSy7f8lOW7XU13AejdvcIu4OK232AIzFsa4CT3twarXyCW5DljgAMrBihgbU3Ib0QXqIibraLPAcsM/lSnUfYJoaElSvlF+xl/E4FF+5a+ax2mN9cD439BkEs7u85Dq7M1cdQTKGE3dSr3nnq7Z41LI0AhrxfbjYyhK9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864708; c=relaxed/simple;
	bh=mI6YHKNlnW1qZTvXa6Sj8uLMeFMjC1fQdSYW9nHeVYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaerOMwYWUdHtUhHrBlrgGjsNbNeIyk0nw3zblQiS+lvYxD1z4e/IpIRIdpeIOub6fWS/JeYKXODEGMkwDE61O431F18jjhknnyD+D6yqT0TSbStNpCXZx6jZE/0JJ1eJWbu5TCjbHL6LIoTO2h+G2bxDOzOaYnFskcCR2yP7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BsXlx2wb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BsXlx2wb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d3f72391so19411955e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748864704; x=1749469504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Gws85zoR9SnVd6DMFy9YCg7h7huIfv39b74XZ7DYs=;
        b=BsXlx2wbVShp0Tf8W7ioFNvDq6tJCyLkO4fJ0azoSoX8HysVcc0qn1suKkWOP5A9Sy
         fS3B37hj7ybZ+ZzuXSYMT1Yvz41SblrEJCiLwjZFCuaGQBU+9LPz52w6iQ6eEREbBUU2
         XIlobwZyIKFW/gx6B9W6OPRbpeMKfjr+UbjucWIiu3w/t+TZQptSN9mN1KVkytZaMKgd
         kwKBy5Jo2JoFyJBiowqqOV5hI4JerdbPngS9zgJebgcMcCKPLo7wvaKL6DZfLHinApLO
         3lnkrn4U6feagnV7cqSoBZ1uusmpkY7LRRotTfqLQKSN/z6eisrFNtK41ViQV2xqo0hu
         N/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748864704; x=1749469504;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/Gws85zoR9SnVd6DMFy9YCg7h7huIfv39b74XZ7DYs=;
        b=bGsdXU82/Gkli/O5eiiphA0E6UQ+3vzn9x4txWcapooa3EBxShMEWOiAPZRnVX6yqm
         h1sqWMSRZDsz9KR7qGTFrHMWFH6eXMDqt6436SYbQuvnjvyHz+sv4TrEs457jE1XeBuB
         O2HZKrJS0YGX9K/mQ2+5HVMunTPk19qPMIKfdDWlWpMONEFQp/KO+RRi1R3iTKISonz6
         KY8CvJ9E5ruXNPkR+kFjc2E44YvzS3M5zQzPrKvgdAOYEXSfwk8vtRLLEOkLDaixeJ5I
         xYGB9T0PiEk0M2Ubm2DzJa/E+aus6FtjoUyzd1+axHdKUld09U73civr9mqbLPozqV+4
         KEwA==
X-Forwarded-Encrypted: i=1; AJvYcCXCEKWNhW5DRr2aE+VGbyQn5A0oI9XzjL0f5oW9bpHckIZwK/3yaOe/I35ClwToFpBriLus68aQVk3QwFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhcRQqttrEr/IBgedZNumUuljFhCfJ/OkW73G4LIk9vLNyv8++
	7Z/jC1WQ/bjqfp/FGVj35ep/UarbK8gg+2EMtroD5Kbo3dnHYpFsdKVuXURZBSxCW3A=
X-Gm-Gg: ASbGncvRxkCWUIMvDiRfA5pfGp9caXDkjkkI8k9/eMvodMHV8ptExWjzu1hrT7/yUkF
	CIgqA6QFlnDVzX6E9SCGlgvDhdJYLzdQAJQvx+DD9/cynWQBNmTyM/aB92q38Kq6vrsT/veT6C0
	pZRFy/UKM4CXDWPn3kDShMp9u+IZmzeM3AwpL2xi3X3ktZe+qiC+vlAChScQr7kvCv7dRo0zg7g
	F03UIOv3vBF0mOz9cUf0qIFH8cbMc7wOZrECu8ULVVc9GwpYLxCttlrjW5yfI4qE8nIpzha2P/s
	szrSHHIvJqWMKIBQLDVDBsO+JXa4tqzSO7KjGA945PCVW1Ma9c29Oxpk3NogI1pIwSk=
X-Google-Smtp-Source: AGHT+IFUGSzWAiHE9WCAow/7oba11of2+NcrtfT5TUW/nxlLLmE8a1z2qGU7UbqtdWbO5dFQYtw1IA==
X-Received: by 2002:a05:600c:348c:b0:442:ffb1:b58 with SMTP id 5b1f17b1804b1-450d880cc63mr98978045e9.12.1748864704327;
        Mon, 02 Jun 2025 04:45:04 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb0654sm119829555e9.21.2025.06.02.04.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 04:45:03 -0700 (PDT)
Message-ID: <92a15c2d-055c-4f4e-b232-32030a8e5e54@suse.com>
Date: Mon, 2 Jun 2025 14:45:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/32] x86/boot/e820: Clean up confusing and
 self-contradictory verbiage around E820 related resource allocations
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-13-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-13-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> So the E820 code has a rather confusing area of code at around
> e820__reserve_resources(), which is, by its plain reading,
> rather self-contradictory. For example, the comment explaining
> e820__reserve_resources() claims:
> 
>   - '* Mark E820 reserved areas as busy for the resource manager'
> 
> By 'E820 reserved areas' one can naively conclude that it's
> talking about E820_TYPE_RESERVED areas - while those areas
> are treated in exactly the opposite fashion by do_mark_busy():
> 
>          switch (type) {
>          case E820_TYPE_RESERVED:
>          case E820_TYPE_SOFT_RESERVED:
>          case E820_TYPE_PRAM:
>          case E820_TYPE_PMEM:
>                  return false;
> 
> Ie. E820_TYPE_RESERVED areas are *not* marked busy for the
> resource manager, because E820_TYPE_RESERVED areas are
> device regions that might eventually be claimed by a device driver.
> 
> This type of confusion permeates this whole area of code,
> making it exceedingly difficult to read (for me at least).
> 
> So untangle it bit by bit:
> 
>   - Instead of talking about ambiguous 'reserved areas',
>     talk about 'E820 device address regions' instead,
>     and 'register'/'lock' them.
> 
>   - The do_mark_busy() function is a misnomer as well, because despite
>     its name it 'does' nothing - it only determines what type
>     of resource handling an E820 type should receive from the
>     kernel. Rename it to e820_device_region() and negate its
>     meaning, to avoid the 'busy/reserved' confusion. Because
>     that's what this code is really about: filtering out
>     device regions such as E820_TYPE_RESERVED, E820_TYPE_PRAM,
>     E820_TYPE_PMEM, etc., and allowing them to be claimed
>     by device drivers later on.
> 
>   - All other E820 regions (system regions) are registered and
>     locked early on, before the PCI resource manager does its
>     search for device BAR addresses, etc.
> 
> Also fix this somewhat misleading comment:
> 
> 	/*
> 	 * Try to bump up RAM regions to reasonable boundaries, to
> 	 * avoid stolen RAM:
> 	 */
> 
> and explain that here we register artificial 'gap' resources
> at the end of suspiciously sized RAM regions, as heuristics
> to try to avoid buggy firmware with undeclared 'stolen RAM' regions:
> 
> 	/*
> 	 * Create additional 'gaps' at the end of RAM regions,
> 	 * rounding them up to 64k/1MB/64MB boundaries, should
> 	 * they be weirdly sized, and register extra, locked
> 	 * resource regions for them, to make sure drivers
> 	 * won't claim those addresses.
> 	 *
> 	 * These are basically blind guesses and heuristics to
> 	 * avoid resource conflicts with broken firmware that
> 	 * doesn't properly list 'stolen RAM' as a system region
> 	 * in the E820 map.
> 	 */
> 
> Also improve the printout of this extra resource a bit: make the
> message more unambiguous, and upgrade it from pr_debug() (where
> very few people will see it), to pr_info() (where it will make
> it into the syslog on default distro configs).
> 
> Also fix spelling and improve comment placement.
> 
> No change in functionality intended.
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 55 +++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 5eb0849b492f..c9bb808c4888 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -1106,37 +1106,44 @@ static unsigned long __init e820_type_to_iores_desc(struct e820_entry *entry)
>   	}
>   }
>   
> -static bool __init do_mark_busy(enum e820_type type, struct resource *res)
> +/*
> + * We assign one resource entry for each E820 map entry:
> + */
> +static struct resource __initdata *e820_res;
> +
> +/*
> + * Is this a device address region that should not be marked busy?
> + * (Versus system address regions that we register & lock early.)
> + */
> +static bool __init e820_device_region(enum e820_type type, struct resource *res)
>   {
> -	/* this is the legacy bios/dos rom-shadow + mmio region */
> +	/* This is the legacy BIOS/DOS ROM-shadow + MMIO region: */
>   	if (res->start < (1ULL<<20))

nit: While at it, change this to also use SZ_1M define rather than this 
shift.

<snip>
