Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674821991D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746413975; cv=none; b=KQqaIjmZ2984C89WGhfa8zJuQ70K1j4ifXRFkhXdqJfisgTKpYtiBVzZDBRbeu2ii3sXXBrJNlIXCrsnDw1El8nhgnlrYoByLa6p7X53FvD70MTv3h+xeNSt5LsOKSRcrZl3siL1QsZ8JPEXy44gc8myYjkgB2C/njOCURsNfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746413975; c=relaxed/simple;
	bh=J4NyUUfofqsfFfAjVz2AAebOT2Jju0UGRTJl147RiGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAKflUPWVG8ZQAlDY2qFH+6TrnKe8/vVsbYt0TUSsLXw4gUYAvS6cBMI0Ce3whdRndwl3jnaGOadq49sNGHI3n7DrwZKHvyN7pAk62UgoTl7YCK77DDzdbtdArAT0EbHPH1phtD20Aw3XfLN68+ZOggqqGYeHyHu9vy7vam7fXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=TsKAk6pB; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="TsKAk6pB"
Received: from [IPV6:2601:646:8081:9485:d39:ba00:6233:b821] ([IPv6:2601:646:8081:9485:d39:ba00:6233:b821])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5452x9is051160
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 4 May 2025 19:59:10 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5452x9is051160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746413951;
	bh=OCX3QXNy8wxj6RfUlQPhas9PKsyvsK3QOqFqJLVrd4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TsKAk6pBptudocnuhAYRudmtFSa5ZWLA1Es92dlpJk7iijmbOgCyIG5HBfaWGFZHe
	 kAUAHQgpD0RgMUBgG6CoL/89XAKx5zx70Ht7SzX+56ZzHYSqv6bkIbwjnR8rJLhBmQ
	 RtA7g3imYzb6OlChI3iddYIrhEgKeIMQE4U/UD6noKRuQTPeZdNStZ5Rg/iHhK2Rr/
	 1QeRHmjjxG2ZJRdlmlhddxlefm83UAPVezybxTNZuVj9ndB2IlDy0KB/QTkOwhl89w
	 MNmpU8te6X3Fim8m7WeubfrmItL2bF7vyahfvbnQ3r4NWjnP1oiShTY913kkPgrkSA
	 bGA3WUy9SmtBA==
Message-ID: <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com>
Date: Sun, 4 May 2025 19:59:04 -0700
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

Also, this function really should be __attribute_const__ rather than __pure.

Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
