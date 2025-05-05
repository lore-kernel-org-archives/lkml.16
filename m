Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5319CC37
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746413770; cv=none; b=eidQfB8qHx/1C5RoOgZzwvL7H1elva2e6e/9IgnSIyEldOmNSLEfqQ3nxrrg7PMbBP1lhc8sOMI7pyR8Wnvn3zsweJRGSbcr0VqU7bgzVwvZhhD8d9X1BObjl53BEkSLOBG/OsFbljezUpTruKXtIN4dhoxMJNoLBm1mLiuoGqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746413770; c=relaxed/simple;
	bh=g8ZfqxQevakSHbP70PF6uZ1nZV4fWjKT0W3WFVvC170=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sY51YwpRQuck30A7e5NZOCDztgymEkAR/QhPqVyHgE+tIg8nVF9WUgBR1MtXRBFpSMK57PD5sFRq3LRant7C2TuYckwP9a1wD7tTX8ZOtV2qOA6btbhBlYL55rM/rwOin0HiedhZHmWNPkKbDNcT4d/tUglDMN8ZUEpU6QSoNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fh7uh1Nh; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fh7uh1Nh"
Received: from [IPV6:2601:646:8081:9485:d39:ba00:6233:b821] ([IPv6:2601:646:8081:9485:d39:ba00:6233:b821])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5452tNYg050455
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 4 May 2025 19:55:24 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5452tNYg050455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746413725;
	bh=qslVJgtxcpM5ATx7UNnEkQm/V3eLMzNA76FVbnTCWCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fh7uh1NhEbKC1Knf8IhnvzR6C89W0EcP0gHvA5kYJNDebL6z98ui8H8NXhAClcYQH
	 oFRYf4U5winP29QohbanTBwCgmYxpe2ySy0KgYiuVW5JYLayEfucaYA2WEKHDPw2kd
	 fixEKXMjoMMjvQ5RYTpAyyeW6IWBtfHAWvLRXGk72NuKsPmv076rTpBr0EnALbZj5v
	 0dpDVNwNvhY8mTSeYI7VVBE+Eo5weG/9ig4DMqOcSiX/KzNwlPPv+xjVP3d1Obs+q1
	 nfyC7F9+GIqIy0zraI/NYW+evF3m1PwOqmeY2O6f9lzt2Z7OgU6VF2ul6xuMPDSBqk
	 youC6Ur4T8FCw==
Message-ID: <56635437-3ad6-48a8-ac72-0fe7f10a2270@zytor.com>
Date: Sun, 4 May 2025 19:55:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -tip] x86/asm: Use %a instead of %c(%%rip) in
 rip_rel_ptr()
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>
References: <20250504184342.125253-1-ubizjak@gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250504184342.125253-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/25 11:43, Uros Bizjak wrote:
> The "a" asm operand modifier substitutes a memory reference, with the
> actual operand treated as address.  For x86_64, when a symbol is
> provided, the "a" modifier emits "sym(%rip)" instead of "sym".
> 
> No functional changes intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> ---
>   arch/x86/include/asm/asm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/asm.h b/arch/x86/include/asm/asm.h
> index f963848024a5..d7610b99b8d8 100644
> --- a/arch/x86/include/asm/asm.h
> +++ b/arch/x86/include/asm/asm.h
> @@ -116,7 +116,7 @@
>   #ifndef __ASSEMBLER__
>   static __always_inline __pure void *rip_rel_ptr(void *p)
>   {
> -	asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> +	asm("leaq %a1, %0" : "=r"(p) : "i"(p));
>   
>   	return p;
>   }

Addendum to this: we recently had a discussion about this and it appears 
that %a should work across i386/x86-64 (with i386 emitting the address 
without (%rip)).

	-hpa



