Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3F3594F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539738; cv=none; b=SBiripsPW+YRJijNKqss0JftvXGfRgkkxK/AgrJTMu+qIhNKjWd+GNlQMII3oaNEiVIddJdLCBUMBh3N8DfJHvXhZIvTkxUyg99ENJd6IrcxRRkIUejGfbR8nUtw8VoGsbt3o60JkInHZ3LaE1Fy92xakZUXXJudWrQQM4LzDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539738; c=relaxed/simple;
	bh=9sKcb4xKEn+pXIZQFBBPXg+lVgO5W3kVPvEqVBD8VZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnI/633jUD4We6q7d9BEUs37vr3GAymjjPSw3aVNNCQ8amWrtjLEeLp4pJiaGbEPl1jmY9UPI42jtLjuk1sKqpsIl+ciQXRjq5ZXNNwTxDLp2RJ7w/pqG6m4iSexRHxH/6wsvJ6e/gWvtYhRwCfU7L+TiSe2u6SITZDGuOtWLq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/Fy2dGf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/Fy2dGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F48CC4CEE4;
	Tue,  1 Apr 2025 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743539738;
	bh=9sKcb4xKEn+pXIZQFBBPXg+lVgO5W3kVPvEqVBD8VZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/Fy2dGfgcdk3uMjyi3r1gCBIv4kxQiZ1pucW5s7DkLBWKzVrelOGq35tetM26tiK
	 waYdvqRq0uG8jK+XuUDp9gfj9GAiDLJkbTSRoJLvUFJ7LDMQu033Ifced0ojq9La7v
	 nTg/TDWuyEBwIlsQUjErkhDgrtvUX/JB+DtY9X4qugw3202fMjZWXlQelwewG41N3Z
	 VULtBGtk3VA7kCdGAIYTGzWPxeYs5eXyhwiTY5YeVgCiSLXdmWcS8yb0no/XxIN+tN
	 Qr7U8v3GDou3T7bUVQdqdSS2CMeAW4SqElBOwkCxvehSLfIZrM7WQuVLmCDvqvdGaO
	 tYgb6644SsVuA==
Date: Tue, 1 Apr 2025 22:35:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
Message-ID: <Z-xOFuT9Sl6VuFYi@gmail.com>
References: <20250401203029.1132135-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401203029.1132135-1-mjguzik@gmail.com>


* Mateusz Guzik <mjguzik@gmail.com> wrote:

> This works around what seems to be an optimization bug in gcc (at least
> 13.3.0), where it predicts access_ok() to fail despite the hint to the
> contrary.
> 
> _copy_to_user contains:
> 	if (access_ok(to, n)) {
> 		instrument_copy_to_user(to, from, n);
> 		n = raw_copy_to_user(to, from, n);
> 	}
> 
> Where access_ok is likely(__access_ok(addr, size)), yet the compiler
> emits conditional jumps forward for the case where it succeeds:
> 
> <+0>:     endbr64
> <+4>:     mov    %rdx,%rcx
> <+7>:     mov    %rdx,%rax
> <+10>:    xor    %edx,%edx
> <+12>:    add    %rdi,%rcx
> <+15>:    setb   %dl
> <+18>:    movabs $0x123456789abcdef,%r8
> <+28>:    test   %rdx,%rdx
> <+31>:    jne    0xffffffff81b3b7c6 <_copy_to_user+38>
> <+33>:    cmp    %rcx,%r8
> <+36>:    jae    0xffffffff81b3b7cb <_copy_to_user+43>
> <+38>:    jmp    0xffffffff822673e0 <__x86_return_thunk>
> <+43>:    nop
> <+44>:    nop
> <+45>:    nop
> <+46>:    mov    %rax,%rcx
> <+49>:    rep movsb %ds:(%rsi),%es:(%rdi)
> <+51>:    nop
> <+52>:    nop
> <+53>:    nop
> <+54>:    mov    %rcx,%rax
> <+57>:    nop
> <+58>:    nop
> <+59>:    nop
> <+60>:    jmp    0xffffffff822673e0 <__x86_return_thunk>
> 
> Patching _copy_to_user() to likely() around the access_ok() use does
> not change the asm.
> 
> However, spelling out the prediction *within* __access_ok() does the
> trick:
> <+0>:     endbr64
> <+4>:     xor    %eax,%eax
> <+6>:     mov    %rdx,%rcx
> <+9>:     add    %rdi,%rdx
> <+12>:    setb   %al
> <+15>:    movabs $0x123456789abcdef,%r8
> <+25>:    test   %rax,%rax
> <+28>:    jne    0xffffffff81b315e6 <_copy_to_user+54>
> <+30>:    cmp    %rdx,%r8
> <+33>:    jb     0xffffffff81b315e6 <_copy_to_user+54>
> <+35>:    nop
> <+36>:    nop
> <+37>:    nop
> <+38>:    rep movsb %ds:(%rsi),%es:(%rdi)
> <+40>:    nop
> <+41>:    nop
> <+42>:    nop
> <+43>:    nop
> <+44>:    nop
> <+45>:    nop
> <+46>:    mov    %rcx,%rax
> <+49>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>
> <+54>:    mov    %rcx,%rax
> <+57>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>
> 
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
> 
> I did not investigate what's going on here. It may be other spots are
> also suffering.
> 
> If someone commits to figuring out what went wrong I'll be happy to drop
> this patch. Otherwise this can be worked around at least for access_ok()
> consumers.
> 
>  arch/x86/include/asm/uaccess_64.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
> index c52f0133425b..30c912375260 100644
> --- a/arch/x86/include/asm/uaccess_64.h
> +++ b/arch/x86/include/asm/uaccess_64.h
> @@ -98,11 +98,11 @@ static inline void __user *mask_user_address(const void __user *ptr)
>  static inline bool __access_ok(const void __user *ptr, unsigned long size)
>  {
>  	if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
> -		return valid_user_address(ptr);
> +		return likely(valid_user_address(ptr));
>  	} else {
>  		unsigned long sum = size + (__force unsigned long)ptr;
>  
> -		return valid_user_address(sum) && sum >= (__force unsigned long)ptr;
> +		return likely(valid_user_address(sum) && sum >= (__force unsigned long)ptr);

Cannot we put this into valid_user_address() definition, via something 
like the below patch?

It's also the right place to have the hint: that user addresses are 
valid is the common case we optimize for.

Thanks,

	Ingo

 arch/x86/include/asm/uaccess_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index c52f0133425b..4c13883371aa 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
 #endif
 
 #define valid_user_address(x) \
-	((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
+	likely((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
 
 /*
  * Masking the user address is an alternative to a conditional
