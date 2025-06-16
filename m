Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A449C1B4248
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085293; cv=none; b=gBW6hc/ZOGywC6wifDQurhU1hTEVf4IELiq3J7AgPWn8tzCmaEpw5STCUwzJvO9L7wd0f0L3wJQW/c4GORcBQIhM4w+2C8TaWfx0/zBmVjIoIp5TNNpxvRD1JREPD4j7eV2gD80Pqp7OdIUdkSiGodHqxKM+yM7G/RM6aYfDG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085293; c=relaxed/simple;
	bh=2RoQWtrD3+9A8zs6Jp07O7FoDMcSwSU+sIAiBRj5tcc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQxLhcNjxNZfGi9SXW+Qty0XdOQelslU8r1C1HtDQSI6Vmvd8qElLgG5Ry2pMUt3TbL7gtafIw6jDrcWzRdFPXBVEeZKvsno2aCyn61d/kdlDd/yqHOHjV312/3hSs/KNNP4DXuTqaF2hMXyJrN2ixenBDiXMno61NvOOhZIwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl0pftrP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl0pftrP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-452f9735424so14743355e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750085290; x=1750690090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHwYQwMYD8HGhfcGJAzl5DofcsNW/ioN3W1s5s1o62U=;
        b=Sl0pftrPVCAtTdnZuJte6FSEEYDXuQzcyb6mTN3Hs2F9SvYGf0C8IuHx7PIcr11ddU
         NZLUYB35VEYq4l4BNcQSD9JH+CxbVO99oePrKhMyReBu9lfCkWBli18NxtKgDlK3CXcG
         CFtvV9IwTz0KisL9lH4Tqbb+OCI9okdTuH1KBJMn1QyW9E2RoyRX7A7JUMTMy5RRY24I
         k6psFn905ij2Nc9TmBuaoD7ONROCKa9x1pEVI6F/Y7HZLNNi7eAhJArMKZn5CtxbVa/d
         Jef1BuvmqrO+zkGewaBmNY2Lv4vpkS1AwzQl+/O0rcL1pMVwPz/t41iuvvEWJACNt6DT
         cITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085290; x=1750690090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHwYQwMYD8HGhfcGJAzl5DofcsNW/ioN3W1s5s1o62U=;
        b=iHZKa0CiUnE77kNSuQHcB++UW5IYC96kcC/QCpXxTTdCfX62NSKkBNWmzIagbsZoZd
         4rsg0o8Wdt7OJFNz6CoQfPPgMl6hK1Vu7kCMXWhzM5iYwO82v344/vb7cR1xCGNH4frk
         F4NSUbYRPUrPs5nfJBVJCJb+5rXzffwCKSJflIPUlZoZI+35h0UJKK7Jib94hRYkwfOc
         emS4VmW3LKeEVTTmFNOEXrTEaAo269lw01sqqJG2iq2aJ4L1nW1j03rncH+WQRcPrizk
         XgHo/nq/BzjOJS3YCPmmg8TslUig+Fk7mum1Qoq2l2MK1VIxhzNm03wWOmaMqwl5IeYs
         K+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPh7ZyA89xlwWVlHRdur+j8z3gJOouI5x3irGPfmSl7vczAVxMxDs3iPY2ZTkGjM9hqqTwTgI8HwtbujM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqe8bcbNmAWk+ZIivFXVcLOej8rWD3Nb60x09+j1sWJU79tMtS
	DUGxuPAr1ZaTtURkBDpKhjHiazvWHuVvje4g1L/E8NJbgpIQUSps0DJI
X-Gm-Gg: ASbGnct1qsoZnsQKhoemfZBrmzszraqAHZU3w0t79UAz0OdRdrKom1TC4uZPFtoZ3pa
	+oxBhr1MsYzWKosCsdfx4Va2B3/VllbVb7SY+zGH4U90x1yRMY7iLK8bBqmfNxRuJEObFrcfJwc
	6PeAEMnFfsqSjysnniVtvbKFaLoTnEt6g22uDwz/FaTb0pVPrWShT/h840wK+3Uig+jK1GNNGuH
	SLbhVPI5NWbq6GOo5k9Tzqi8JEa9hRSClEUJWhx9ic7eRBfAT/u6aj1fpZW8pSYVl/T/8P1gM9u
	Wiv5/qHAdRYcXwpJ6YI9b3NgGlcUKV+rqWKGs+/4VGAXmHbv3fyeLoaK1wLP9XDie48aAVpmpgO
	3CSAsxKvs5Cem2lFzjXjhx+E0
X-Google-Smtp-Source: AGHT+IGrESMPemQqzhzf8+kQ86JE7GA/KnfhXCDSlB46zrZnG+xzF3XuZVSki/BGNsmLPz8iIo783Q==
X-Received: by 2002:a05:600c:4e87:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-4533cac57efmr102304595e9.31.1750085289657;
        Mon, 16 Jun 2025 07:48:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm11408981f8f.52.2025.06.16.07.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:48:09 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:48:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Li,Rongqing" <lirongqing@baidu.com>, "mingo@redhat.com"
 <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>,
 "juri.lelli@redhat.com" <juri.lelli@redhat.com>, "dietmar.eggemann@arm.com"
 <dietmar.eggemann@arm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "bsegall@google.com" <bsegall@google.com>, "mgorman@suse.de"
 <mgorman@suse.de>, "vschneid@redhat.com" <vschneid@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched/cputime: Fix a mostly theoretical divide by zero
Message-ID: <20250616154801.0dc94c1f@pumpkin>
In-Reply-To: <CAKfTPtBKm7WgwcUHcMXnH3PL3KFSniy02mb6Ag4eQ1fA3e+H3g@mail.gmail.com>
References: <20250604110442.8251-1-lirongqing@baidu.com>
	<54c4aa198131420d9c77542bad5d27e7@baidu.com>
	<CAKfTPtBKm7WgwcUHcMXnH3PL3KFSniy02mb6Ag4eQ1fA3e+H3g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Jun 2025 14:51:56 +0200
Vincent Guittot <vincent.guittot@linaro.org> wrote:

> On Mon, 16 Jun 2025 at 13:46, Li,Rongqing <lirongqing@baidu.com> wrote:
> >  
> > >
> > > Sum of utime and stime can overflow to 0, when a process with many threads
> > > run over total 2^64 ns  
> 
> Theoretical is the right word; If all 2^32 possible threads belong to
> the process, we can get an overflow to 0 after ~4sec run time of each
> thread. But then how long will it take to have those 2^32 threads run
> 4sec on a system ...
> 
> It would be good to get number to show how realistic or not it could
> be to reach this value

I did wonder when re-writing mul_u64_u64_div_u64() how common this path
is and whether both stime and utime could be zero.

The current mul_u64_u64_div_u64() is particularly horrid on 32bit.
(Note that it no longer generates an approximate result.)
On 32bit x86 the worst case (lots of 1 bits in the result) is ~900 clocks,
my new version takes ~130 for pretty much all (large) values.

That is in userspace with cmov, without cmov it will be worse.
I also think the kernel has one less register to play with - %epb.

Other architectures are likely to be worse, sh[rl]d makes double
length shifts less painful - especially when combined with cmov.

See: https://www.spinics.net/lists/kernel/msg5723178.html

	David


> 
> > >
> > > Signed-off-by: Li RongQing <lirongqing@baidu.com>  
> >
> >
> > Ping
> >
> > Thanks
> >
> > -Li
> >  
> > > ---
> > >  kernel/sched/cputime.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c index
> > > 6dab4854..c35fc4c 100644
> > > --- a/kernel/sched/cputime.c
> > > +++ b/kernel/sched/cputime.c
> > > @@ -579,7 +579,8 @@ void cputime_adjust(struct task_cputime *curr, struct
> > > prev_cputime *prev,
> > >               goto update;
> > >       }
> > >
> > > -     stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
> > > +     if (likely(stime + utime))
> > > +             stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
> > >       /*
> > >        * Because mul_u64_u64_div_u64() can approximate on some
> > >        * achitectures; enforce the constraint that: a*b/(b+c) <= a.
> > > --
> > > 2.9.4  
> >  
> 

