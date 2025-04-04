Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190FB10A1F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754749; cv=none; b=UQ4G1xrJ4wjmZ7sqDCq17YvabLcZcLu6KTzgMtf8Q0+GVxGJm+nx+02EbVzB+ZGIu46e4QWIcqzPY3T9whqDTbvCBuYnYDSIdcG3NZJqO2UU6XVy+UV1MBV361fV1ZEiiu0Zx0AxrN3bmvDvrxcf9M7I5EJ5a5gIhKRFt9pefV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754749; c=relaxed/simple;
	bh=eeQ5KTZ6QO/Ny9HSjhj5+fsos8YayBGxNjSBdU/nBvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqJ39gtskNX3wx350njhFja89sRNyKR/4t1CR0FRLjnyyhlFL6RVjzaglYbvegM//DKjpltAtQX4pn6Yms+QfeqkbNdzKDgJ0PjJcGUl/Gy8j/fPvnpBOyFucGQvC13XFrNFDFfZf0cPG+QBezUOhBi6nTPdnpCb4vAsLCxF8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eNfe4Akj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eNfe4Akj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso11913625e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743754744; x=1744359544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMaitPjoGERVC7XU3m9fzYahwaSabbG0xaIVCDJmj74=;
        b=eNfe4Akjy49Zdn73K8r4LjtLRZUmGtsFhrSf7jWTNFn0Y44mzaxWUCbjoltqItJYkO
         yXHv/jOVd2AjNrKq1fFJ1kaST34LCqTq10UOfVCkiI+JfgC1zeDZZinZIncQZ3+thWx7
         Jo9nYbaCZ4tCWdq/midZqCu4dORVZx0JQoPSIDybf3AxBGKgxl44WZzFwvkRbSctysPp
         aVtslM50f0UopmUbXURC5PHy10l9nKLUA+yNBORKBLbRhs9KbYSH40J8Cz6MnjIs2Cb7
         NBVVrS87puxLBfcdinDhR8xzhL+iYb+vYtpkw88Oz7VlBhHrhOIcz/Zly5wU4dhc1yIZ
         J3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754744; x=1744359544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMaitPjoGERVC7XU3m9fzYahwaSabbG0xaIVCDJmj74=;
        b=pfB4Rwem4O52aEefRGrYTWgMrqpMujAl6LlIsVYJ+QnVFNlGOO8B2QzQeXe0iM0VV0
         M09Rfx4kr/E+vpBYn3x+uUcpP8ucdMSbhKRnxk71heTs1gIpnvG+dRSA3p4yI4m3Y5oZ
         ulep4Dj+3qbRCJykcS+7/Kh7jRjVrnj+YllD6bxy7zd3wrN1xdUZTuR7rBxx2OUou1GD
         E1KqKCIdUba6NOE1g77E1tEvENYSpCbrCkznl2aYuFBUTO1RKrpd/q6o+rdYWfqHd5Jn
         kFYrpwVy6eR+KLimVDiJbYdefJnlxqzwYO4wJkBfTJWfmB5HVhRQp0dS7FuPzLW1cMsX
         PB7g==
X-Forwarded-Encrypted: i=1; AJvYcCXg04BrrkQIYnOoTvO0EakNpHCcH+lS0x6x6YBiBHkOysoMqfBhD3x0DI4B0w6DnI1CEVrgj50/w2Dynh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfkOdEwGQ/n5lUfLOvwPgYXykWKoNcBJAa8bK10MwltkLDZia
	vbz4M8ba2J6hkLHPvgExtFK6/xcgs2O1k7CnPV8SdNmOoaT8rcS0ravuAoT4H0Q=
X-Gm-Gg: ASbGnctnhRKjAfZroEzKYuQW6PVgFbh9epGGd8PJrilM86XyyG9BZ8dxfwSHIAB93V+
	Rohrlrk7/zcV0bXi2u/bd7oZVwhneHE8x2HNbkYMLM4dv58mRH0YheqHWVHbPTqZs/VncW6kmT2
	pc1bn/+aMVwlIbw8OT2udquqOE3xt9tygf7KgtOweyPTO0jAupuSR0tGkpCrOkNPCYKuB/W8uDu
	1oIxkETm5PYVX7dSjdTDEkPDuVECbJrIB+FiBza6s+5Icml68cQe8w329Qk9pAy+G4/6p6fDuLn
	Be4XIDKsd2MuBLrBVgbAza0FPyPwWMKUsBGvdX0uQj2YfcM=
X-Google-Smtp-Source: AGHT+IGPyOu5CDX3g2xKJG5T/xCoib+CsS7O+G+cD5Iwj2V3fc175a8nwyVspEINauD/7X6MfYX8Tw==
X-Received: by 2002:a05:600c:1f0c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ecf85db8bmr18899755e9.9.1743754744603;
        Fri, 04 Apr 2025 01:19:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm42539845e9.39.2025.04.04.01.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:19:03 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:19:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <Z--V04jtF16r63eO@pathway.suse.cz>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
 <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
 <20250402203422.GA655609@ax162>
 <Z-557YrwVr8bONq4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-557YrwVr8bONq4@smile.fi.intel.com>

On Thu 2025-04-03 15:07:09, Andy Shevchenko wrote:
> On Wed, Apr 02, 2025 at 01:34:22PM -0700, Nathan Chancellor wrote:
> > On Wed, Apr 02, 2025 at 10:25:46PM +0300, Andy Shevchenko wrote:
> > > +Cc: Kees and Nathan (I believe this discussion has some material for
> > > you, folks, to think of / comment on / etc)
> > 
> > Thanks, I have commented on the part of the message that seem relevant
> > for me.
> 
> Thank you!
> 
> > > On Wed, Apr 2, 2025 at 10:06 PM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > > On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > >
> > > > > Yes. Clang complains on unknown pragma.
> > > >
> > > > Can we please use wrapper defines instead so that we don't have that
> > > > #ifndef in the middle of code? And since those don't work with
> > > > '#pragma', they need to use the _Pragma() operator instead.
> > > >
> > > > Something like
> > > >
> > > >    #define GCC_PRAGMA(x) _Pragma(#x)
> > > >
> > > > in compiler-gcc.h, and then add a
> > > >
> > > >   #ifndef GCC_PRAGMA
> > > >     #define GCC_PRAGMA(x) /* Nothing */
> > > >   #endif
> > > >
> > > > and then you can just do
> > > >
> > > >    GCC_PRAGMA(Wsuggest-attribute=format)
> > > >
> > > > in places like this?
> > > >
> > > > (Entirely untested: I *despise* pragma in general).
> > 
> > We have the __diag() infrastructure for this already. I think this issue
> > would be as simple as the following diff, which makes clang and GCC
> > happy without any obvious ifdeffery.
> 
> FWIW, I have tested this in my case for both compilers and they are happy with it.
> 
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Great!

Nathan, would mind to send this as a proper patch, please?

> > diff --git a/include/linux/compiler-igcc.h b/include/linux/compiler-gcc.h
> > index 32048052c64a..5d07c469b571 100644
> > --- a/include/linux/compiler-gcc.h
> > +++ b/include/linux/compiler-gcc.h
> > @@ -127,6 +127,8 @@
> >  #define __diag_GCC_8(s)
> >  #endif
> >  
> > +#define __diag_GCC_all(s)	__diag(s)
> > +
> >  #define __diag_ignore_all(option, comment) \
> >  	__diag(__diag_GCC_ignore option)
> >  
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 01699852f30c..6ff4d85e144e 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1699,10 +1699,8 @@ char *escaped_string(char *buf, char *end, u8 *addr, struct printf_spec spec,
> >  	return buf;
> >  }
> >  
> > -#pragma GCC diagnostic push
> > -#ifndef __clang__
> > -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
> > -#endif
> > +__diag_push();
> > +__diag_ignore(GCC, all, "-Wsuggest-attribute=format", "<reason>");
> >  static char *va_format(char *buf, char *end, struct va_format *va_fmt,
> >  		       struct printf_spec spec)
> >  {
> > @@ -1717,7 +1715,7 @@ static char *va_format(char *buf, char *end, struct va_format *va_fmt,
> >  
> >  	return buf;
> >  }
> > -#pragma GCC diagnostic pop
> > +__diag_pop();
> >  
> >  static noinline_for_stack
> >  char *uuid_string(char *buf, char *end, const u8 *addr,

Best Regards,
Petr
