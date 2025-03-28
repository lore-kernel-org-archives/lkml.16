Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C013D89D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131138; cv=none; b=OkK8GsyJGdLwJNeAMUxQQmOqdD2QIOh3dlx0u8moEO53xmC2wVKSRBFzlq5pnSGOcTwKk0GNEg4WQF4h9dawX2qdWwvUHF7v3X2ppcv3F8mY4O7ze2C0qRnw6CQz/vEm6+lffDm6N0BkFl9ueR5DWF63r0l62VyyYDp2QtI3GGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131138; c=relaxed/simple;
	bh=uL7K7Oxkg0ZyGUHq7fGmfsR6fpbyS5xqtgUMQaVV8EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ds/A45lT6pB33yKyjfBvr2YFn7GfD3x15/5pUvve5TJthxbRkXQunpPKyfgS2LG5wWyRWEX3Yihs2cuS32CpvgRMEmZUt5T7mQD/XUcW7s2I23t5fV1geIibtWBuHh4PrXm350pvE4jn3/QlGa6nDsMbcaBGSh8dI/BimINEFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JHdjuN6V; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JHdjuN6V"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3249288a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743131133; x=1743735933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OwXJYCGGcE2SVbW4qD0DhmFu8Kp17onwga+4ifcP/DU=;
        b=JHdjuN6V3ndsQqpThNenROR3xU3JILol5krR/P8vlIGVcSg+WTngWafguK2g2T/Agu
         p2IBK6NYLMXwNt0hZicRGMq06RuaoV9xlnjJ+SsVF8CDqajpeLwuaL4yTCg71C5aSzU6
         nXMthRdz4ATigWWdofc+KxoxmS7zXhLit9oI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131133; x=1743735933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwXJYCGGcE2SVbW4qD0DhmFu8Kp17onwga+4ifcP/DU=;
        b=dchK+56YHzRUwnXEnt3x8ON2ISOt1JAMtxjfLT9X3LU7LNQ5knjpA+JyYqR/cGeXRg
         EVGMi8hke5iijn1uNevtzNaR7v8rzjG4oCnPKh++uA3CDxAQ0hnmxKMatCOQtAICNEAe
         FXCif1Srsea5hqGZJZ14Ulv83prr4lN6HlD+vclu2BLYTgHQFA6cV5HyvLgbybRH8r3a
         6jsQTJETH9IBCU+H3HkKuNyI5bfIf7jbr5Aq4A/f0iW3uuQf4+Qfzm4iwDynI8c898D6
         lwviiH8y14X0NwR5ciTo3mIBXAPT4iTrRlBHxUNgx0yKlXFWtKif2LdPzWmDR1/XwAmd
         pHsA==
X-Gm-Message-State: AOJu0YwVU1F1MerBJgDLMk4z5lNx2qU8uN3KU8RcbLl8vOBDuEjDCWrr
	q5Nd/TtZRoGsdHQYKPeupoB7V2fhKkQ7t1nR5SCeZQc6cZ7bwJg+GPQHBNiK7PtQe5LkMcCqwUw
	VkFI=
X-Gm-Gg: ASbGncs6UEGG/CIB1/9k4w2O2lm3CKNf91z2r1yslxzm2t7iiRIWauw4NAlWADCA5QG
	+LJN8xKu35aTglSZq04hOUCfWJsyXti2drgpo73/zpLyTNQyQI3rvvvEGjPXDUJJ0oTzaanQCLk
	UGVcn8tIaxXxidrkPQnWDShY3vwXXSaxJkPAkvsDo6pU0b6yzwQSZFv98ujjFL5PO4qFFx7B1b1
	Eh+uek0AT1AN9+/zbbN5jy0njm3xcP0YK/ieM5Y6AOahoT3vL/njqVZoyaI/jrqCNCAJYgy2BZV
	hBNCpYyGR+621fs7PyXq6Ba6//BtBWU7IEJIDcTZly/bFPpg57ONlYXOfLXFpcPeg00uFWHZlum
	zyT9awdsZj9IigcOgRLk=
X-Google-Smtp-Source: AGHT+IFkKLh3aLMnaO2w6cJGgYsDaNAU4sZT8aMupQcd2qyD6uPKmcZt345yKYoffi0wPbLVeeCbjg==
X-Received: by 2002:a05:6402:3593:b0:5d9:82bc:ad06 with SMTP id 4fb4d7f45d1cf-5ed8e15a2bfmr5674170a12.3.1743131132853;
        Thu, 27 Mar 2025 20:05:32 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d475esm675688a12.28.2025.03.27.20.05.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 20:05:32 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac34257295dso321273266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:05:31 -0700 (PDT)
X-Received: by 2002:a17:907:97d3:b0:ac2:842c:8d04 with SMTP id
 a640c23a62f3a-ac6faefc2demr552867366b.17.1743131130986; Thu, 27 Mar 2025
 20:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home> <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
 <20250327224400.304bc106@batman.local.home>
In-Reply-To: <20250327224400.304bc106@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 20:05:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzQAYKuoFm9WGOE-QJJ47xvh0VN+RW1EEPCHTERQntQA@mail.gmail.com>
X-Gm-Features: AQ5f1Jog6nUlmW1gV27drbgOZ-x5yTpd1IFfg5jhKa6DGViurElgqfsL9lpPzzA
Message-ID: <CAHk-=whzQAYKuoFm9WGOE-QJJ47xvh0VN+RW1EEPCHTERQntQA@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

 On Thu, 27 Mar 2025 at 19:44, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> When we want to map it to user space, which was added in 6.10. Before
> that struct page was hardly used.

Right. That *used* to be the situation. But that's no longer the
situation since you want to mmap things.

Again: if you remove mmap(), all this goes away.

That's an option. But instead, you added *more* mmap, and made the
problem acute by also making the code much uglier.

What used to be a small and fairly harmless hack is now ugly beyond
belief and fragile.

> I'M NOT LYING, and honestly I'm quite offended that you accused me of
> lying!

What's the definition of lying again? Saying something that wasn't
true? That's literally what you did. You claimed only the virtual
address was used. That's *CLEARLY* not true.

The fact that it *used* to be true, and that the code was originally
designed in a time when it was true is really not relevant to the
current situation, now is it?

> Before 6.10 (from 2.6.28 through to 6.9), the only uses of struct page
> was in the allocation and freeing of the ring buffer. It wasn't used
> before that. The virtual address is what the kernel writes to, it's
> what was read.

What the hell is your point?

Bringing up something that *used* to be true, but isn't any longer true?

Seriously, what's the point of that?

So face the music. The fact that you mmap the thing means that now it
needs 'struct page'. Stop making excuses, stop making things up, and
just deal with it.

or don;t.

> But when you read the "trace" or "trace_pipe" file, or even read the
> "trace_pipe_raw", the struct page is never used.

Again, WHAT IS YOUR POINT?

Those aren't the issues. The issue is that you added mmap. Stop
bringing up completely irrelevant issues. Stop saying "but but but
other code doesn't need it".

The code directly under discussion clearly does in fact need it and use it.

> Well, it wasn't that I thought it was hackery, it was that it feels like
> you are looking for anything to yell at me for at every pull request I
> do. And this one I figured you would find something with.

So next time, make sure it's clean. You clearly knew that code was questionable.

And yes, you also knew very well that I look at your pull requests
more carefully. I've made that clear before. There's a history to your
pull requests, and now we're dealing with that history.

People who don't cause issues have an easier time, because I assume
that they will *continue* to not cause issues. I've made that very
clear. It means that you need to be more careful than the average
bear.

So when you go "this will cause controversy", you should take a step
back, and think about how you can *avoid* writing things in an ugly
manner.

Instead you just went for it, and here we are.

So for next time, just don't repeat the same ugly hackery five times
in a row, for one thing. If that code had been *clean* code, I would
almost certainly not have reacted to the nasty "translate pointers
back and forth".

But as it is, instead of having some clear abstractions and helper
functions to do things in one place with sane tests for "if this is a
,TRACE_ARRAY_FL_BOOT thing, we have a clearly separate path" you
repeated the disgusting hackery overr and overr and made sure it was
front and center.

Now it's too late. I've seen that horror, and I'm not willing to take it.

You need to keep the 'struct page' around for mmap. Instead of living
in the past and saying "before mmap, we didn't need it", just realize
that the "before mmap" situation is not relevant any more. We're not
there.

Or just say "mmap just isn't worth the pain of cleaning up this code".

That's ok too.

                Linus
