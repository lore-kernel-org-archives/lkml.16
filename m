Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDC1C3C08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621986; cv=none; b=FnjHunFb0VL+bOdWbC28X1ShVlYcXiFHbPidTks/zS3dhmFMDK3omjGsM/s6CvcrWmhwYWq7unMb9dg9HEWfe8rLeXVP+tN2F3pwNHfXtDEUTwWuh7BDza/6YKsmC/or8orfxDa//C1p7MKcOMI+3ns4f5/SkQBXHl+hdB8afFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621986; c=relaxed/simple;
	bh=EVrCVrVXJlLKgBVOreuWjw9DnbjO5pYN4We8V08Ay5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIjeBEBT1Fng5+B9Or2BVp9J2ZldsGkWqGmeZ5F7gpSVKOSnXEVGX43ZPpkwcLKYSh1xvELBsSy8UiVE1gm5XL2IPKk86h+NU0XI+wwPDPzwRONu5U98akwrO7oeu1VK3NHeG9ap1Egy+AeMiBn5bhwW9hk8/6ExJqYTYECr3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6GiGW7f; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6GiGW7f"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac29fd22163so18426066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743621983; x=1744226783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSvBVuBebd9JcmdYocBWK5Sa3sXB2gmV6emMmt+aTQ8=;
        b=P6GiGW7fROn1kRMhbJCRXpzog7MTx+skuJ5Pd/mxtAh13yTjlhDQS1ADA0QafIp1At
         ELeCfpr7kz9EPRUfFUq1vBymCKNRlJXcULkoLMRfzRH6dSMzr+ZrawiNzNxFO5iF03RT
         ysNPO6fHIh9MUPbh6GvLV3YLEiFal9TXuRdmxDCc9yf0CdalJ54CO+odgVRqWZHlv226
         Xx3vrHRjSln1cwn2Oz5J8jcJCsnZf7rY7Flgx4hNiyrhHGBwDo7WoTqk6KY+TWr+mAmy
         3tPQmVzI/jXlu6a8jRvBNUjRSMgDrhOoSJRt4zl908lRMhhQQOdfWYDW1HQ9Dmk52ojh
         wPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621983; x=1744226783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSvBVuBebd9JcmdYocBWK5Sa3sXB2gmV6emMmt+aTQ8=;
        b=aZ7DSF1Y8+6mdnRCYyfzxpWe7xZ5BmYqPqM9LWAL1iq+7jArpuFyq/oTfMw+2DOb2x
         T1bIaeqKc/e84NewoLHFU9XUqTBDwamshyQRibKEjPjIJCuOn7nfpp/PgsHEji5dq1uQ
         /s+eXkIAnf7qztJw8XBvqi7L5QHyWmbjOapsJG1G5QYH1aYfZYmLHpWkSnYgzHQU1OzT
         62CjTflBEBVB5ScGi74dRxVEr/8Y9KcYdoHylu/sla5ukpWYyCxqOVKyk/DpfXdY3aGw
         PRDY6fgkwX+7QVilQELOwrBxq4c6QqqNaohO43Ku/P1dnF5bfYX3ENsqoruVAnbbULHT
         iPBA==
X-Forwarded-Encrypted: i=1; AJvYcCWr6/XWMQThiwuNwJHTHc0BVb3x1siN0Osdpk10mwNudKvROp6/OYQJfHrSDmkPYQ3VF7M0V3sowExiDO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/MRXmn2HASZCTan7A0EFbTyXjMdEWVitSFvtzZIhcrLNXCb7
	5Z/pqc8vxn/BOhMax6yj+qfKrpfmiUQM04R3pt1hjFkCy0+eLs6wR7ucE336OZvVtcJiZSPc3m6
	De5vXugsUmsnHePrIWzWbBEPuLfA=
X-Gm-Gg: ASbGncs9pFOWSGL2doBpRI4vhDU9fHQWuyhbZlIBY52H9DwV584kNlaottwHW+jZ7gJ
	UzR0ldgBcaABXwMuLN++mqlpHzmAFYh+qv9ylN1TWJiXfQOl1Gqpxfo/67Yh+oFEQ9FH+eYJitx
	RyVV5OmpsqLzyP3VOzeV2i+M03YVi7Q42/AqjF
X-Google-Smtp-Source: AGHT+IEfG4oN84onUdKhC3t8aF9kQsL+4P/iBkogCDLiFTSfftCHU1FyfMS1bgMtYz+dZzfmUIyDsqd83OYpsmneT94=
X-Received: by 2002:a17:906:f587:b0:ac3:f1dc:f3db with SMTP id
 a640c23a62f3a-ac738a42849mr1599349366b.13.1743621982647; Wed, 02 Apr 2025
 12:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain> <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
In-Reply-To: <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 22:25:46 +0300
X-Gm-Features: AQ5f1Jor_GfaxCVu5I8HRHR0WJhJDi_n9-9HslXXk6JT-1YtlrcdOuXCqXcF4os
Message-ID: <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Cc: Kees and Nathan (I believe this discussion has some material for
you, folks, to think of / comment on / etc)

On Wed, Apr 2, 2025 at 10:06=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
> >
> > Yes. Clang complains on unknown pragma.
>
> What a crock.
>
> It says GCC, for chrissake!
>
> And clang clearly doesn't complain about
>
> >   +#pragma GCC diagnostic push
> >   +#pragma GCC diagnostic pop
>
> which are *not* protected by that #ifndef __clang__ thing.
>
> So this smells like a clang bug to me.

I Cc'ed Nathan, perhaps he can comment on this.

> Can we please use wrapper defines instead so that we don't have that
> #ifndef in the middle of code? And since those don't work with
> '#pragma', they need to use the _Pragma() operator instead.
>
> Something like
>
>    #define GCC_PRAGMA(x) _Pragma(#x)
>
> in compiler-gcc.h, and then add a
>
>   #ifndef GCC_PRAGMA
>     #define GCC_PRAGMA(x) /* Nothing */
>   #endif
>
> and then you can just do
>
>    GCC_PRAGMA(Wsuggest-attribute=3Dformat)
>
> in places like this?
>
> (Entirely untested: I *despise* pragma in general).

Maybe. Tomorrow I can look at this.

> Or hey, how about we just add "-Wno-suggest-attribute=3Dformat" to the
> compiler command line? Like we do for all the other garbage warnings
> that we don't want to see.

I actually don't know what the benefit of __printf() attribute from
security (?) point of view is. I may speculate that this helps to
validate the format string and arguments (when provided as ...) and
helps with potential wrong argument sizes, etc. Kees, what do you
think about Linus' proposal?

--=20
With Best Regards,
Andy Shevchenko
