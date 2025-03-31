Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301D2144C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433206; cv=none; b=uaksriFxpAcq25DmeFH+s2tvpXAUziHPbqqpOk7IQNEXhyoTVIuVSBk0vgQ3yss0p2xqxOy+Ov2BO8D8NOH99n0GBoJXlXC0J9a+kg54/TPTVkl4GN99/HBBFDYDa9iLyzHYSsrkhxrmVvV5Ltub5SsGPsCf7kbpmn0Tc17tJgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433206; c=relaxed/simple;
	bh=1EN/cIMgUtWr0qWN49ERSHoJ6jcvO58c2E3XnD9QX1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O//5BzukTUKCIo47/VhGdQghvA+zHyNNyXvhgB/NiR5013R7iTheVV8PjMWlBYhIhHtfbkD67BacqjOLtTpPh3gtFMqIKdvx+Sx+tCq/+dlx9pAuz1qe9EDE9X5hZ4lIcicSZtvo07Pu8+MCpQZpre3oI+ZSRDvluxQgbgq91fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=VvKN2nlt; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VvKN2nlt"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476b89782c3so50772441cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743433203; x=1744038003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/XP5iQdJ2sfX5iQDsDzT/UIhpAdSsTpMGtKs110k1o=;
        b=VvKN2nlt3tFyCTyT+cKUdfgSwQVwkP6ps/amL+FYl7nSq5S5noWmOp3e+UCPYSZs6K
         SPKddWdgvScKp4PfnOujme1iYrAgAbIFnNin4aFXrCeimA7ZMNL5R4yKpHD7l/awwD0u
         uPRevIz4sRx+qGuDNlbLnQ0A+uzESW1JUhyhrTdbgG7Vntb9G2lHp9+zTEma0gx2GXwa
         JlzWbr8r974q94aGwiIDTWcJ8IuJHpF/yWqJzY0kIKCVPt/c4JMo8AGh8ugYQZYLq+YB
         W83Iy/rQUELTUrrrTOIvwvQBQPWOAU5W2a9i7SUZzbBzQ7ZnM7/NhWQUatqTSyYxAPqA
         zHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743433203; x=1744038003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/XP5iQdJ2sfX5iQDsDzT/UIhpAdSsTpMGtKs110k1o=;
        b=VB+rla4WXAsCeNgEKx+KgTBGBq9dXY39t3KFnIUC6HB4mhInmNthhDui2BhW5CoPls
         m242MOfQM4t/p5IbGbp7hYO5LdylCQKKzWg2tei6iLK5kzAVz3eeehl/tBXTWAhUbaQZ
         iMnXKKgerIAAJ4XBBYn93cFJzvE8R6d8lzujvWexu/VowkVMatiWjJT5IGisoE5s6tI3
         /C042mGBMNqTZnq7+ISgrgnRcs8tGnZgAyoCf3QiygKUKpH2TEbVpTxCCjoP7c7rnly3
         zvbFLhuZMK8VoujsWpDLJehTH7TdAxyOzQDvpNSxb0MGyIitKoeBZEf2gvv4/UFLzAEx
         BYkw==
X-Forwarded-Encrypted: i=1; AJvYcCWnRi/a7yMiXTUS2HdUmwyLOsbxzTQ84w9bbBro0/0pXadEVSlPTZKpcmlTCjfO8qvkFKRkecziyQCvw0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIwy0EvtBGeyUwwLAIeqb0krKMwen+KPvgfvHlxzCOU5WxiCl
	Rjat2ARMEUWFszxw0+O4fuyOVodIhBmQ/JriqVF7A9o0faCY8HMYjjCKLlDBXIk=
X-Gm-Gg: ASbGncsUhZTqGauMObXDrMptUrlkQfDKyaStMPSACRXy5VGhcZwnV1TDILI465RM3Wc
	UyeUb5lMXtleS8WWh5Ay451LLrGnUaV7ZeC75MMH8Rw6yP/hw/+8FGlAEk46q77yl6vrmLozzuf
	tb9A+W2i59gjmQt7nhlAsR1G7sX3UT6VJs63m2y74Lw56634XpWz8CGZusVmPMbMOL95KbephT5
	XGWuHVylqiHbfIEBpGaeG+y9X28GM8yju3Ybn36V068PzyDNM0tm2EKth3qX4LoM4foWiDv9Sqm
	RTBIdlxZhodA98+5zZdptpX3j1TJkhRISFzyDdgdNQk=
X-Google-Smtp-Source: AGHT+IE9kLbI8h0rUyhUxntQ/fxPgI58b5Kb5NuIQENL4V46jZPC7rePLkR5c64cC1zxLsKy2I1Ivg==
X-Received: by 2002:ac8:7d08:0:b0:471:cdae:ac44 with SMTP id d75a77b69052e-477ed78e91cmr123041321cf.47.1743433202781;
        Mon, 31 Mar 2025 08:00:02 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47782a49facsm50913661cf.31.2025.03.31.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:00:01 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:59:57 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Sebastian Sewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Michal Hocko <mhocko@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Introduce try_alloc_pages for 6.15
Message-ID: <20250331145957.GA2110528@cmpxchg.org>
References: <20250327145159.99799-1-alexei.starovoitov@gmail.com>
 <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
 <CAADnVQJBHPbq6+TQhM2kmWNBTiPoB50_fnVcwC+yLOtpjUWujA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJBHPbq6+TQhM2kmWNBTiPoB50_fnVcwC+yLOtpjUWujA@mail.gmail.com>

On Sun, Mar 30, 2025 at 02:30:15PM -0700, Alexei Starovoitov wrote:
> On Sun, Mar 30, 2025 at 1:42 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, 27 Mar 2025 at 07:52, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > The pull includes work from Sebastian, Vlastimil and myself
> > > with a lot of help from Michal and Shakeel.
> > > This is a first step towards making kmalloc reentrant to get rid
> > > of slab wrappers: bpf_mem_alloc, kretprobe's objpool, etc.
> > > These patches make page allocator safe from any context.
> >
> > So I've pulled this too, since it looked generally fine.
> 
> Thanks!
> 
> > The one reaction I had is that when you basically change
> >
> >         spin_lock_irqsave(&zone->lock, flags);
> >
> > into
> >
> >         if (!spin_trylock_irqsave(&zone->lock, flags)) {
> >                 if (unlikely(alloc_flags & ALLOC_TRYLOCK))
> >                         return NULL;
> >                 spin_lock_irqsave(&zone->lock, flags);
> >         }
> >
> > we've seen bad cache behavior for this kind of pattern in other
> > situations: if the "try" fails, the subsequent "do the lock for real"
> > case now does the wrong thing, in that it will immediately try again
> > even if it's almost certainly just going to fail - causing extra write
> > cache accesses.
> >
> > So typically, in places that can see contention, it's better to either do
> >
> >  (a) trylock followed by a slowpath that takes the fact that it was
> > locked into account and does a read-only loop until it sees otherwise
> >
> >      This is, for example, what the mutex code does with that
> > __mutex_trylock() -> mutex_optimistic_spin() pattern, but our
> > spinlocks end up doing similar things (ie "trylock" followed by
> > "release irq and do the 'relax loop' thing).
> 
> Right,
> __mutex_trylock(lock) -> mutex_optimistic_spin() pattern is
> equivalent to 'pending' bit spinning in qspinlock.
> 
> > or
> >
> >  (b) do the trylock and lock separately, ie
> >
> >         if (unlikely(alloc_flags & ALLOC_TRYLOCK)) {
> >                 if (!spin_trylock_irqsave(&zone->lock, flags))
> >                         return NULL;
> >         } else
> >                 spin_lock_irqsave(&zone->lock, flags);
> >
> > so that you don't end up doing two cache accesses for ownership that
> > can cause extra bouncing.
> 
> Ok, I will switch to above.
> 
> > I'm not sure this matters at all in the allocation path - contention
> > may simply not be enough of an issue, and the trylock is purely about
> > "unlikely NMI worries", but I do worry that you might have made the
> > normal case slower.
> 
> We actually did see zone->lock being contended in production.
> Last time the culprit was an inadequate per-cpu caching and
> these series in 6.11 fixed it:
> https://lwn.net/Articles/947900/
> I don't think we've seen it contended in the newer kernels.
>
> Johannes, pls correct me if I'm wrong.

Contention should indeed be rare in practice. This has become a very
coarse lock, with nowadays hundreds of HW threads hitting still only
one or two zones. A lot rides on the fastpath per-cpu caches, and it
becomes noticable very quickly if those are sized inappropriately.

> But to avoid being finger pointed, I'll switch to checking alloc_flags
> first. It does seem a better trade off to avoid cache bouncing because
> of 2nd cmpxchg. Though when I wrote it this way I convinced myself and
> others that it's faster to do trylock first to avoid branch misprediction.

If you haven't yet, it could be interesting to check if/where branches
are generated at all, given the proximity and the heavy inlining
between where you pass the flag and where it's tested.
