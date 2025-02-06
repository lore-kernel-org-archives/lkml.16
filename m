Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19983198851
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864404; cv=none; b=bW6XurMYRqahIP+69P4sqwlupV6nEoPhrTregGlb3qVA3Y8tI2/pFhaZ8sr16hyk21FdjzAHLGw8qfGmBoJQdlh7OMo9sNW0y+lpyngf6XjVRxIrBmhA8HyXXcluSWHHQ6cI1ytYwX8OWUT+96WeOtejoXIwiZ0BAkv/BkqQl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864404; c=relaxed/simple;
	bh=2r6tMUYVwj3whDjezwamySB0aClfPFK5y9acbGkA5sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnQfy0w/QtyZuCCTUeO31jN/JQq6KQPk6sRbBjmWggDhh+MbuEFhmly46h79nur1RzERfwpmx0znP6BWMjmOcfjpN+uS2795ZkDW6ZA+Kki2+Uh6uvSkF4I9yYI0S/OmzH8gK8NMRnDjmde/r73Ckxz0yAa6NzZkj23XDMfLiho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNbqOqJ6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNbqOqJ6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso2229558a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738864401; x=1739469201; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfqFCnQ98jLLNy4deEtYPxGHx/clucBzH05z7c8/BY0=;
        b=XNbqOqJ6CbPqODEfItcC0xtIDSMc8eUpbY2uqCEWAFB3N1kNkxQCx0rvwJ1+0T6OH/
         3K234iWYwRrGyujCEhaR1acxEN6LuClUIjviXKfG87PgEwzrEuW7YvT30qbNmFXIGsD+
         7WalSzS1BrckzIUB1KBtLbHcjm4meL8mKRBrYfrjloLjHSWfwj1iGTvWGKSoNTN1+Gwy
         4PIDNJdCQvnUh6l0OcU+QlqtCqiUhC9MA8QpD2Lvfp84KxNdNRpIx0xv9zURhgYOgZ06
         p8WByHfzFB0nQhShcY+H3VMKEgE24xONmqEBYvYZzzhMt1qvqdE4bZttQS/+p48GuZ7I
         WR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864401; x=1739469201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfqFCnQ98jLLNy4deEtYPxGHx/clucBzH05z7c8/BY0=;
        b=UFW0OJmVC5KYh5dcTp80WNCKqPqnnAvkc4TQAr48YFBDAg+n3VMSyzCNuUjqYKZ3Gf
         wCYo51+Sz9+HS7TrIZ4KxL2qqUfj/eJ1HHcAAYmiqCABLWHpOwtuaJAMAD2NLociHBt6
         EnpD6En8MWgYfHGuENZdtZnZKnO2Pet9ouuDBRJWIvGw5rqlesPEumdCOwZYaZlccomg
         c22oy3DvZ6vA8/9iRiXZEMt4Q68appwhmJ7ukGYELyA+MVWpRbJZr8hu79DR9BihTMp1
         kNYAP58emY0yN0BC9GjAI7YH7yY/1GJ4RSs0OUWqjz7KnLWdM0K1oXvq7LPq1aiSh/TV
         luVA==
X-Forwarded-Encrypted: i=1; AJvYcCUfp89hCSAIdAwlUOFoQMpElHjFYqZpuAQ9C07W00OiRqH495nPxqCQgdkiow+hqvlS7G5ki3ZAaWaOJlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMXXSI8IKaP9q6h4VUb2fNqAUCiehjQ8IBeoefa0NCMjFfwvL
	PCqhiu/jPK22wNSH/wMwCYKprFarYlilrrw6qyboRt+3Lx+Jf8WP
X-Gm-Gg: ASbGncu3j0ix68Bhgz07MquvC5iv6fEqTVr8u5drRctf1yBt1973RwZgZGe+nQIvZsd
	tdRvOpHKM8RMqDtTpMsEJPmap4A/r0Azbp3IBZyVi/JTNGvv5yRirzYzAynjL4rHjXxcS3I3LkS
	gx5kn+WjGgCJj4KWd3v8rnwuKyJeNhiZBFaSG2/TmrmiPVFRI17hSHsTO0SgHggORbqV743ppGp
	rNpstcpnpSbz0wE17ltCd0JJwKIWI2F09iqKgPZt9N51mTdoJ5X8FoBdmkNJHgIzu/GEYNcUlmD
	fqXC3Zvh0/BoTkY=
X-Google-Smtp-Source: AGHT+IEuF9r+1zoUnxiuRFGcZz98K/U8jBjQeSXFj1DXdovflLMUp8IZEN61Do/HfwEIVb/T4flISg==
X-Received: by 2002:a17:90b:3a4f:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-2f9e0792e1dmr11036156a91.19.1738864401027;
        Thu, 06 Feb 2025 09:53:21 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f91asm15846495ad.18.2025.02.06.09.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:53:20 -0800 (PST)
Date: Thu, 6 Feb 2025 12:53:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Message-ID: <Z6T3Dv09chNN3lh5@thinkpad>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
 <Z6KF8UBsQ4NmR9KS@thinkpad>
 <20250205170651.GA56382@yaz-khff2.amd.com>
 <Z6PRRXgYYEoMbjsp@thinkpad>
 <20250206020227.GA322224@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206020227.GA322224@yaz-khff2.amd.com>

Add a couple of compiler experts.

On Wed, Feb 05, 2025 at 09:02:27PM -0500, Yazen Ghannam wrote:
> On Wed, Feb 05, 2025 at 03:59:49PM -0500, Yury Norov wrote:
> > On Wed, Feb 05, 2025 at 12:06:51PM -0500, Yazen Ghannam wrote:
> > > On Tue, Feb 04, 2025 at 04:26:20PM -0500, Yury Norov wrote:
> > > > On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
> > > > > Cast inputs to 'long' to avoid the following 'type-limits' warning:
> > > > >   warning: comparison of unsigned expression in ‘< 0’ is always false
> > > > > 
> > > > > The 'long' type can hold +/- 2G which far exceeds valid inputs for the
> > > > > GENMASK helpers (current max use is 128 bits).
> > > > > 
> > > > > Idea is similar to implementation in __is_nonneg().
> > > > > 
> > > > > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > > > > ---
> > > > > Note to maintainers:
> > > > > I found some previous discussions on this topic in the mailing list
> > > > > archives. The upstream code has changed a bit since then, and this
> > > > > proposed solution seems fairly simple when based on the latest code.
> > > > > 
> > > > > I figured I'd look at something outside my normal focus areas. I
> > > > > apologize for the noise if this solution is too naive or incomplete.
> > > > > 
> > > > > Thanks!
> > > > 
> > > > Hi Yazen,
> > > > 
> > > > Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
> > > > We normally shouldn't see this type of warnings even when compiling
> > > > with W=1, at all. 
> > > > 
> > > > We have quite a lot callers in kernel already that do GENMASK(xxx, 0)
> > > > 
> > > >   yury:linux$ git grep GENMASK | grep 0\) | wc -l
> > > >   13788
> > > > 
> > > > And nobody complained so far. 
> > > 
> > > Right, this is with W=2.
> >  
> > > I focus mostly on x86 MCE, and I was doing some extra checking.
> > > 
> > > > 
> > > > Still, I tried to compile a small userspace app that calls
> > > > __GENMASK(10,0), and found no warnings with Wall, Wextra and
> > > > Wtype-limits enabled.
> > > 
> > > The warning comes from the GENMASK_INPUT_CHECK(). Using __GENMASK()
> > > would bypass this, correct?
> > 
> > Yeah.. I actually tried GENMASK(). This is my code. (I have to pull
> > more macros because I run it against Ubuntu 6.8.0-52-generic kernel)
> > 
> >   $ cat tst.c
> >   #include <linux/const.h>
> >   #include <stdio.h>
> >   
> >   #define false 0
> >   #define __is_constexpr(x) \
> >           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
> >   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
> >   #define const_true(x) __builtin_choose_expr(__is_constexpr(x), x, false)
> >   
> >   #define __BITS_PER_LONG (64)
> >   #define __GENMASK(h, l) \
> >           (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
> >            (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
> >   
> >   #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> >   #define GENMASK(h, l) (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> >   
> >   int main()
> >   {
> >   	printf("%lx\n", GENMASK(10,0));
> >   	return 0;
> >   }
> >   $ gcc -Wall -Wextra -Wtype-limits tst.c ; ./a.out
> >   7ff
> >   $ gcc --version
> >   gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
> >   Copyright (C) 2023 Free Software Foundation, Inc.
> >   This is free software; see the source for copying conditions.  There is NO
> >   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> > 
> > >> Can you share more about your compiler, compilation command and config?
> > > 
> > > Compilers with warning: GCC 13 and 14
> > > Compilation command:    make W=2 arch/x86/kernel/cpu/mce/
> > > Config:                 make defconfig (on x86_64)
> > > 
> > > I don't see the same warnings with LLVM/clang. The '-Wextra' flag does
> > > not include '-Wtype-limits' (at least on clang 18 and 19). But I still
> > > don't see the same warning when I add it.
> > 
> > This looks like a specific compiler issue. Nothing to fix on kernel
> > side, but you may want to file a bug in GCC.
> > 
> 
> I'm able to reproduce the issue with your test code by using a variable
> for the 'h' parameter. I assume many of the warnings around the kernel
> may fall into this case, i.e. 'h' is 'unsigned' variable and 'l' is '0'.
> 
> >From the GCC docs:
> Warn if a comparison is always true or always false due to the limited
> range of the data type, but do not warn for constant expressions.
> 
> So it seems the warning only applies to non-constant expression, hence
> the need for the 'h' parameter to be a unsigned variable to trip the
> warning.
> 
> My changes to your tst.c:
> 
> 	int main(void)
> 	{
> 	        unsigned int TEST;

Uninitialized?

> 	
> 	        printf("%lx\n", GENMASK(TEST,0));
> 	        return 0;
> 	}

I also tried some combinations, and it makes no sense to me.
'const unsigned int' should definitely help to evaluate this
expression at compile time:
 
        const unsigned int h = 10;
        printf("%lx\n", GENMASK(h, 0));

But gcc -Wall -Wextra -Wtype-limits tst.c doesn't think so.

I can understand why Wtype-limits is happy with 'int h = 10, l=0'.
I can't understand why it's happy with the 'unsigned int h = 10, l=0',
and at the same time is not happy with the above.

> When compiling and keeping the intermediate files, I see the following
> for the __is_constexpr() macro:
>
> (sizeof(int) == sizeof(*(8 ? ((void *)((long)((0) > (TEST)) * 0l)) : (int *)8))), (0) > (TEST), 0)))
> 
> The "(0) > (TEST)" check seems to be the issue in that "TEST" is
> 'unsigned int'. So it seems that the GCC warning is correct, AFAICT.
> 
> Clang generates the same code, but doesn't complain. So I'm inclined to
> think something is different with its checking. It does catch a simple
> case like "if (0 > TEST)", so maybe there's something that gets applied
> differently through the macros.
> 
> Maybe Clang immediately fails the __builtin_choose_expr() check when it
> sees that any part of the 'const_exp' is a variable. And it short
> circuits its warning checks. If so, then this could be a limitation in
> GCC. Of course, this is just conjecture from me.
> 
> We could ignore the warning or do more complex type checking. Though a
> simple fix is to reverse the conditional. Please see the patch below.
 
You can try something more complex, just keep in mind that from kernel
perspective, we'd like to be able to call GENMASK() with non-constant
high and/or low limits, as soon as the 'l > h' combination eventually
evaluates to a const expression. For example, in linux/find.h
we call GENMASK() like this:

        if (small_const_nbits(size)) {
                unsigned long val;

                if (unlikely(offset >= size))
                        return size;

                val = *addr1 & *addr2 & GENMASK(size - 1, offset);
                return val ? __ffs(val) : size;
        }

In lib/test_bitmap.h we've got this:

        for (nbits = 0; nbits < EXP1_IN_BITS; ++nbits) {
                ...
                GENMASK_ULL((nbits - 1) % 64, 0));
        }

I would like to keep both examples working.

> In any case, this was an interesting topic. :)
> 
> Thanks,
> Yazen
> 
> >From 00e95116ef5a971e53e49b732839edd5d0887545 Mon Sep 17 00:00:00 2001
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Date: Mon, 3 Feb 2025 18:44:33 +0000
> Subject: [PATCH] linux/bits.h: Squash unsigned comparison warning for GENMASK
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Invert conditionals to avoid the following 'type-limits' warning:
>   warning: comparison of unsigned expression in ‘< 0’ is always false
> 
> The warning is enabled with W=2 and is present on GCC.
> 
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  include/linux/bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 61a75d3f294b..45f70fb56ac3 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -21,7 +21,7 @@
>  #if !defined(__ASSEMBLY__)
>  #include <linux/build_bug.h>
>  #include <linux/compiler.h>
> -#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> +#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true(!((l) < (h))))

(l > h) negation would be: !(l <= h). And if you do this properly, the
warning will stay there.

Maybe true compiler gurus will help...

Thanks,
Yury

>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> -- 
> 2.43.0
