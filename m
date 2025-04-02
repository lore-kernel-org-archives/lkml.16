Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74219258E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620783; cv=none; b=WYqofRdyaeSvcl3xiM309Z2/Y0hrNTN4qa8+iPpADKpO9nzcjJMN7hQxUXtnOjZH7BjgeCYo3AHIoKoRI5DecMhW5If0soxVz+XRoMMPwra5Bh9gN4WDi1AJ0GGDPz1dZDAH4LMOjpAxuTcyEzoAbulISmRCPnRGF/Vq/LNYLFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620783; c=relaxed/simple;
	bh=m6/4v0UxeKoFf1PngF2N/9siFHvhfuuKEk7LpI6IxMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/7NwqprztBjLKaJRFWSxpOsEjlhx6Wm1HdO7ONTfhqMrFAybPP7egCeu5YqLojzst4HCKKk0092V1+YWO10tHxQoqfhWu15+LGF6cOh6lwBncH+qOBKHr25CU6YE9zjPrfEkOQbpovvRMZv2oSitv1HGC8C6oRZ3HScg6Sci7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dowdtrLY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dowdtrLY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so17797066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743620779; x=1744225579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=52JUw1ErA3HHEknZD8WNBaHQmMu9OIIBSg51hV8tf60=;
        b=dowdtrLYo/vVe4BfAiFWzEiJttIHRhMtAuwaec6kiYgTA6zMktLXC+wv3tmSnDqVbY
         /KuwVPGWvtHplbilwBrYAAHpC9VLBGUbbCWU0JNNV6LWMtAjOTka3VIYJK3vVHdrz/1L
         byG9GwJRrn6mwevZ9mjweMoxYeglwUIdrtCL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620779; x=1744225579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52JUw1ErA3HHEknZD8WNBaHQmMu9OIIBSg51hV8tf60=;
        b=i5sHepLdSayjG1FOLnzCMeYjznUYjgWhd8LIokVWwSvIYqCxl8vCmFhfSD3hnoDxuh
         /rf+nf62rWSHyQaoOwQLs2qyBmXJbrBykjNFnAbsgb/RK8SCbo8KQef8NxIMmyhVQmkf
         pd9O3TGaC0JU4kBCyU/VR4lY/uyTSqXWb6xezYKQlrcBcWx7/jHn7rGoJeySDl2Zcm01
         ktfajg644MOBnxLEoslHHYwO/yr0Eio6OB2kRRp3+NiAm2QwSTDxouoKZkRIaK41IW1C
         Jhfqb8jFg8v6DmtD21PRGA0u7qgwwWi00SqcdCmRxfJTUXl49HGZ8eUWbS3bIbjcr1xE
         ZRwg==
X-Forwarded-Encrypted: i=1; AJvYcCVix0LB0vh1o53MyyzKgFfwpdrR3I4txBoQ5lpoO2i4bQ6YCoq11rLxFtJOE5V8JU+C+kreAoo59MWnn5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOIC8XvrYmE7MHYBg6YFVF8m5lY0slcHAaOqvwCkekapRWHL+
	bMIBeoDHBh4wkiFP8a9Wrvkm8BN6pjnmTpGiRoi67CNrRz62aczQhP3sQtli5ywiHusWvMDWNl7
	CrWQ=
X-Gm-Gg: ASbGncstgtyBX8Y1sbjvH80563sryacqtqmoZvuuO+4+afYZkJ9+edlR/uPptFkCRIu
	u9ODQrbmeal916T9xK5qf3TWX6wZsnZD0ZBycakd/yF/MpJvtLUxgQcbH87fKCndPVzXOAqwqNR
	Bl1xSecz21qCmHQvgHRwH5gAGSoo32H+BhP9xTz8K2Mq82ni92QlAbO/jeU1FjEAYdjQS8lbNjr
	KEvm9YbEvNwANO5U2k7iRVY6nMNAfBPsqExThAnU6y1txrdLB7LmMZjZLVrTFE7eg+9bpcUmm8n
	9JiUa5Jy4J47pSsNMI5WjXOgFRaO2fs1S4AdJNesNRrowP0TWU50DiZwKut/XKjzaOseGVy9AZK
	10oiQdMzUWoJITp2rPFc=
X-Google-Smtp-Source: AGHT+IG3eVehI7jqdLx+mEwO8FXTBrROnN35+ZWfccSeODwizMJ80XDh/CJ7lUapVYAOUsazlrUv+g==
X-Received: by 2002:a17:907:2d07:b0:ac3:ed4c:6a17 with SMTP id a640c23a62f3a-ac738a36df5mr1408502066b.24.1743620779198;
        Wed, 02 Apr 2025 12:06:19 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b150sm960438766b.46.2025.04.02.12.06.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 12:06:18 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25520a289so16881666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:06:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEufd/3qIpHDKOLgvdgp2KvNsJrIon72EhsmcsL3rMOUiwIRarSah7w682ZD8fFYG8U2j9rVI8Me9wJ0g=@vger.kernel.org
X-Received: by 2002:a17:907:948b:b0:abf:6db5:c9a9 with SMTP id
 a640c23a62f3a-ac738bbe871mr1492737766b.39.1743620777634; Wed, 02 Apr 2025
 12:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
In-Reply-To: <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 12:06:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
X-Gm-Features: AQ5f1JqgE25Nn2o7EBefMjMmIEeqb5vd-x-n7sNzUDmVn8OYmRVY2HxnVVydSdc
Message-ID: <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> Yes. Clang complains on unknown pragma.

What a crock.

It says GCC, for chrissake!

And clang clearly doesn't complain about

>   +#pragma GCC diagnostic push
>   +#pragma GCC diagnostic pop

which are *not* protected by that #ifndef __clang__ thing.

So this smells like a clang bug to me.

Can we please use wrapper defines instead so that we don't have that
#ifndef in the middle of code? And since those don't work with
'#pragma', they need to use the _Pragma() operator instead.

Something like

   #define GCC_PRAGMA(x) _Pragma(#x)

in compiler-gcc.h, and then add a

  #ifndef GCC_PRAGMA
    #define GCC_PRAGMA(x) /* Nothing */
  #endif

and then you can just do

   GCC_PRAGMA(Wsuggest-attribute=format)

in places like this?

(Entirely untested: I *despise* pragma in general).

Or hey, how about we just add "-Wno-suggest-attribute=format" to the
compiler command line? Like we do for all the other garbage warnings
that we don't want to see.

                Linus
