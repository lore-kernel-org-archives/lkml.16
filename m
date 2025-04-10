Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016F1C174A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294720; cv=none; b=CWKRHsOLoL6VukSwjgvFyj4eIGJlIO7HkJc9EE8yA0oNVud0d304fPEWYUlu81OssCPBYBru1OCIvRa1BssjndWV9jfF860DVddZ4XmQwiiftBmA31vlw7t22R2xwRE3sUrlPCWqbSCIiDEm43p3gPqj+uZ7zFQ4x9SixB5W+IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294720; c=relaxed/simple;
	bh=ZTPniWk+gwHlOqC+nHi4v/Fyne8jH72MKBN0kwML94s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ4BES+QZ83JrjGafPsBcyu3Py/knX8P/Ta5hcFEBNTIkxnfGhAiIJ9m5tbTqx40oTjuJYcoEMDBa6UnGIPDec8nTSiQ7TE33BI33NcnSvoaiPFwTqVes2wT0Y07JXADsNq4D1CvJHGyptE33sgioGM1Iy7d6y33SD2VlgLKSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yn6+zAqt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yn6+zAqt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9740445e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744294716; x=1744899516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lA8ugxNApKDVruUHOGb/dr7HV4XJd1QLO6iDDRxI14M=;
        b=Yn6+zAqtilO6csXOoWAzKMLUtMQChZkF1BlGzqZPJj5FCkIspGXxxWD4Ke4j+eazfd
         krXsyG11rXomUm/3eShiURdzt5g7cE3P+jIZEMADrWmz4oSqMPKm1BhknJDNqmtoPUiZ
         KBpXmzv3VF08ikRBk9W88wli5cunRzw4yNEPEysYz0+Bcsq3J2ICaZHPh/X99gp6bccM
         icrGEYQcIrmkU1JcdWEGifQICtdj7vr2LUKNWoxy3PSYOmD7K4yNT6FlD5dOVL3PvbfE
         rCYJbLH8M+YobDf8jsCkfgLDj6lUI3VgDqehvDu/5xB3gg0aIuu7dFKZWvnGkUtnyLNo
         j9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294716; x=1744899516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA8ugxNApKDVruUHOGb/dr7HV4XJd1QLO6iDDRxI14M=;
        b=sWDovq2if/S2d/lV8B2oEWyoY4hVPetz/UF23YRDCGo2Ict0rbzLm073Ohj6oiesSB
         84A9YKIzn004x1pPIvCCUGcsfwbot1v2yaLPuRB/6A5SpWnfL0Ie3gKoK7ZpXtLNmvVJ
         hP/OdIM5ZnfjWdar6rgrgeE3GOgVsMB+KWOtigWZSf6S3mjEE+R1OJQZqVcd7gd+qYgg
         qrscI/KXRlCg2lIYadTbVTYfLTgrZpw5M/1ycxyZQYuRQVXVrj5fOh45xBZxz0gyydDA
         GWXMWh6FyOxT4f2AySdG7AMDNHzJ0bvqOV62KCZDTGdq+U9tIYnCQzSkkHTzgh+1I34q
         t09A==
X-Forwarded-Encrypted: i=1; AJvYcCV4vnY35Amuy2PV1IxzoEQg+3nE0z7DXLn4sdev+c34BY+XeWXiOMz2mUZ2xUsF5MyyQceqhHC/WP2rjj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZA+OdX5Q3kzFSoS7XKv7oTMX80Zj6thVw4Ru7XXsMG0sEN8X
	JeiJjQiq0TO7tYnI5K50U+9FUHdZj+6lUT6JKskU36AHw1M49QteDUssnjwRDsPfi6VZEp+/LMb
	B
X-Gm-Gg: ASbGnctKRTMfGe3kTAl91cVKZN2dlD+hOSyx+NIFPvcGuqZ1GTtGeC/NJC3LPON/k4L
	e9fohcpDWDQgrmJqyIqW90l1fnIJJgufFkafSp1nUBzoWhVBHnV3rLRU8IbXmCr8WFvokN1Rvoc
	cuOcpYBaldUVpSZ8cmzPrwxaJUCSUEKIoPf9yUkcc+QC/b+gYW9XTU+PQlaAo8yANtaKO55yNyD
	aHU5f2QBHygGa9eTjBel7tEXnvY4aOn8fOE9ZkwhAEVYBSPdJ95C0IhZSYts1xnFgJrrWq5Ev12
	pzLeAiAPMqfqfEqaNos9gch6cKHK3sBlnpQZkExfUKs=
X-Google-Smtp-Source: AGHT+IHQQrG+kDpStKXf079iI3yW+7NAkiLStcY+KtjJrS94ufdEEtnyLK2CdGP9zz29xIylIoX3zQ==
X-Received: by 2002:a05:6000:2ab:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-39d8fd3d2d7mr2247711f8f.6.1744294716074;
        Thu, 10 Apr 2025 07:18:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938b5e7sm5040832f8f.55.2025.04.10.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:18:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:18:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Message-ID: <Z_fTOc5JCTcDzzv4@pathway.suse.cz>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
 <20250405101126.7a2627a6@pumpkin>
 <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
 <87zfgs5sxb.fsf@prevas.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfgs5sxb.fsf@prevas.dk>

On Mon 2025-04-07 09:31:28, Rasmus Villemoes wrote:
> On Sat, Apr 05 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Sat, 5 Apr 2025 at 02:11, David Laight <david.laight.linux@gmail.com> wrote:
> >>
> >> Perhaps the compilers ought to support __attribute__((format(none)))
> >> to disable the warning.
> >
> > D'oh, that's a good idea.
> >
> > And gcc already supports it, even if we have to hack it up.
> >
> > So let's remove this whole horrible garbage entirely, and replace it
> > with __printf(1,0) which should do exactly that.
> >
> > The 1 is for the format string argument number, and we're just *lying*
> > about it. But there is not format string argument, and gcc just checks
> > for 'is it a char pointer).
> >
> > The real format string argument is va_fmt->fmt, but there's no way to
> > tell gcc that.
> >
> > And the 0 is is to tell gcc that there's nothing to verify.
> >
> > Then, if you do that, gcc will say "oh, maybe you need to do the same
> > for the 'pointer()' function". That one has a real 'fmt' thing, but
> > again nothing to be checked, so we do the same '__printf(1,0)' there
> > too.
> >
> > There it makes more sense, because argument 1 _is_ actually a format
> > string, so we're not lying about it.
> >
> > IOW, something like this:
> >
> >   --- a/lib/vsprintf.c
> >   +++ b/lib/vsprintf.c
> >   @@ -1700,9 +1700,10 @@ char *escaped_string(...
> >    }
> >
> >   -#pragma GCC diagnostic push
> >   -#ifndef __clang__
> >   -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
> >   -#endif
> >   -static char *va_format(char *buf, char *end, struct va_format *va_fmt,
> >   +/*
> >   + * The '__printf(1,0)' thing is a hack make gcc not ask us to use a
> >   + * a format attribute. 'buf' is *not* the format, 'va_fmt->fmt' is.
> >   + */
> >   +static __printf(1,0)
> >   +char *va_format(char *buf, char *end, struct va_format *va_fmt,
> >                        struct printf_spec spec)
> >    {
> >   @@ -1718,5 +1719,4 @@ static char *va_format(...
> >         return buf;
> >    }
> >   -#pragma GCC diagnostic pop
> >
> >    static noinline_for_stack
> >   @@ -2429,5 +2429,5 @@ early_param(...
> >     * See rust/kernel/print.rs for details.
> >     */
> >   -static noinline_for_stack
> >   +static noinline_for_stack __printf(1,0)
> >    char *pointer(const char *fmt, char *buf, char *end, void *ptr,
> >               struct printf_spec spec)
> >
> > Does that work for people who see this warning?
> 
> IMHO, this is much worse.
> 
> Yes, as I also said in the previous thread, I consider the
> warning/suggestion here a gcc bug, as it shouldn't make that suggestion
> when one doesn't pass any of the function's arguments as the fmt
> argument to another __format__(()) annotated-function.
> 
> But we have this __diag infrastructure exactly to silence special cases
> (and sorry I forgot about that when suggesting the #pragma approach to
> Andy), and this is very much a special case: It's the only place in the
> whole codebase that has any reason to dereference that va_fmt, and any
> other function anywhere calling a vsprintf()-like really should have
> gotten the format string that goes along with the varargs from its
> caller.
> 
> As this is apparently some newer gcc that has started doing this, you
> just risk the next version turning the wrongness to 11 and complaining
> that "buf" or "fmt" is not passed to a vsprintf-like function. Let's not
> do "a hack make gcc not ask us to use a format attribute" when we have
> a proper way to selectively silence such false-positives. If this was
> something happening all over, we'd do -Wno-suggest-attribute=format, not
> spread these annotations. But this really is a special case in the guts
> of our printf implementation.
> 
> So, FWIW, ack on Nathan's fixups, nak on this one.

I think that we all agree that this patchset is better than the
current state.

I have added Andy's Tested-by from
https://lore.kernel.org/r/Z-557YrwVr8bONq4@smile.fi.intel.com

Link to the previous thread, see
https://lore.kernel.org/r/CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com

and pushed this into printk/linux.git, branch for-6.15-printf-attribute.
It was the branch with the already pulled code, see
https://web.git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/log/?h=for-6.15-printf-attribute

I am going to give it few days in linux-next and create another
pull request to have this sorted in 6.15 where it stated.

Best Regards,
Petr
