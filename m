Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C623ED63
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744162; cv=none; b=n1uTWr97T75a33nNtlyxsU08+bq2s/Np7n4i8CUtGyMYq/lu6V5ZXI9VA5N/0iL7yx23ubWN4s+NgEL/c0LQiK9F1Z9wG5ItGP3zBbhaWEV/8BNGEYuxVNNq0CGy+nQ+UWz54vjtf8jaNpkiZ3RI/5FsTv7a+9my9OQ2XZkV/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744162; c=relaxed/simple;
	bh=iRfohEKnexRWQpEc/lF2RxU0gSoH1L3ITPSEH0rjagc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpXgh7A5bXmySJo/rLtWWLvjokUeIWqRFfA8g93ZWzrN8ZZwjY4RMyEWBUj9bVHloYJ+FkYKCseRhVIu3j2SqWZ2huopX334W9trGhD+gQnv7XjSmROnvBjb/D9fhNVDZ9OwKIkPeiD14UXByx3yfEoLW/PQbiDnB/cdRd1KzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=AHEiKh3Q; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="AHEiKh3Q"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f8df49e75fso1762352b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744744154; x=1745348954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDD6/twwcqeHpDaR6ey66qD2RyK51nGP7CNi1q0RLAk=;
        b=AHEiKh3QOZ0H8U23v3YTMfVIaUp2F2anLnLfk4tZ+Rb+5+WWUinKiVxEnra4EPgyDO
         rGme0cF08nSdEOtfiFSi1b9Z7wX5RnE9z/LAD43j7q85sFwPVzsPrNCdfy8cLeEegJU3
         mq5DlqXBkuHsDoQaEacHUL7Zc4Nw+kLxGxYKbq0mMtj3eFfJ9zPE9/Xuayq3HGlVRiFk
         kA5DlvppNfvRUH3C6taiP4PjXJREU5JQeXHTF8pEwjHeMRvkREjxUCjtbufcQC4KfnUs
         UWF+h6LPV4wIqNeZLej3OfzgmgQmpgzeSFd4QbYzDeDHUbbBFxsOVPZ1YkVm5bAHe5/3
         y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744154; x=1745348954;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDD6/twwcqeHpDaR6ey66qD2RyK51nGP7CNi1q0RLAk=;
        b=e+uWMker3ide60QyUMYKI+mpoZvQrEB3w66R4gs4V829/qHxO6DG322rSLg00tro/3
         F7tOqD1Em6GawS4UidfBFKYOA531xYa34pmC7s5t1kUO8dcWxDLirPp9zqAvwb+qGs9E
         ezJqUslGZ8bx7+ZfoEbIkvTku6pTkpHc/y+Y8heWKj7hIDnnRyXC+kQZYBfobiPYI/Ev
         M3V/1qSnE3oKmyyw/c21u9f79ZJpJQC6u9Sukck05ib1DYGRpxOenViXUZ2TDru4Ja4i
         qAPRRyAlx03lcR9BNkzeuajhDFuvBYz4216Jfd2vEj1IzZnxIhu1ILNuozYVHyRNmSuK
         YCCg==
X-Forwarded-Encrypted: i=1; AJvYcCXRpt0POtkuUX94+Z3hfQKRKXBwZPjXutW4H/Ckf3dlItcSP6r3axvo3klQxmsTGU2CCgZFrocqstJwdNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVh+Q21Yr1L4vBnZJ8Q2mvT5DTDC+Rkx+yBPZ7eiHO2vyoKNYs
	saWeMTjphnZERxRRGItCq8AsnwGACBiNjDSOu76OselJN2LyLL5CtSVDjMJss9g=
X-Gm-Gg: ASbGncvGZPJ7rD+xIX4bIYbKL2xUWuQpLnD06uQF3Hr0pwSYSpQ5GuSxY7wf2Uc7rwv
	QdptjVx68hmnU+n0pSrrwk5oTx5G4DRmf0TCV5iTDZ9ydPjcrr+h3IofQrlQguEZqd7bYvNJK0Q
	cFuySH0o2KpkGJXM3ZVcOicWWQJEIq58lyPmjYEJzjr5b2bgbV+ufCxNVEku/fdFwGZvr7rFaTQ
	ke7Hrlx16RiTFgvpYNzYvlyPlQhPRyxn+Q7novPDNuf8Pno96ofhkEk/S0aJ6Z8v1lBqvq20nLZ
	OOsMfav3RIxeL9aHIs+7dQYoIxXGprzZsXomNJWbdkjo
X-Google-Smtp-Source: AGHT+IHec809ILFcycahfM0VKkH+r05JKpLlCKPhNTFCZi13JrfPzVw3LdxpPb3vtYm3PumnN0HUQQ==
X-Received: by 2002:a05:6808:2027:b0:3fa:8bfd:7721 with SMTP id 5614622812f47-400acb71518mr460901b6e.27.1744744153932;
        Tue, 15 Apr 2025 12:09:13 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:10d8:195c:4f40:9213])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0969b722fsm3020469fac.28.2025.04.15.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:09:13 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:09:00 -0500
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_6uzH9DsWIh-hIz@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
 <Z_5FV65cyIwiI9rs@mail.minyard.net>
 <Z_5L1J11W-ArXcUe@smile.fi.intel.com>
 <Z_5NDNeDztC1-6vx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5NDNeDztC1-6vx@smile.fi.intel.com>

On Tue, Apr 15, 2025 at 03:11:56PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 15, 2025 at 03:06:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 15, 2025 at 06:39:03AM -0500, Corey Minyard wrote:
> > > On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> > > > Debian clang version 19.1.7 is not happy when compiled with
> > > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > > 
> > > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> > > >   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> > > > 
> > > > Fix this by intermediate cast to the uintptr_t, that makes compiler happy.
> > > 
> > > Unless things have changed recently, Linus prefers "unsigned long" per
> > > https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749
> > 
> > I'm not sure I got your point. That discussion seems irrelevant to me.
> > They are talking about pointer-as-an-integer cases. Here we already know
> > that we are passing integer-as-a-pointer and this is the opposite
> > conversion.
> > 
> > > And it would match what is in the match table.
> > 
> > Match tables are tend to move to pointers, enum is usually goes to int.
> > 
> > > Is that change ok?
> > 
> > If you don't like my change, please do yours and consider this as
> > a bug report that needs to be addressed. I prefer more my solution
> > as we do that in many places for the exact scenario.
> 
> Note, the proper solution to the cases like this is to move to info-like
> structure and actually operate with the pointers instead of enums, longs, etc.
> 
> That's what's slowly moving on in IIO subsystem, for instance.

Yes, you are right, I'll probably make that change.  I'm not sure
about the uintptr thing, but I think the right change is to do an info
structure.  I never liked that code as it was, anyway.

Thanks,

-corey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
