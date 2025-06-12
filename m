Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA509299957
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742404; cv=none; b=ZYi9iAN2pHVqd16ohRMiwu33GdbB1FQtKC6gp2dPfdKHtFDik7Lq0rgkS2hRe8/BPnLs8+ocs7pB9jSb3SiRlXO4mirvRxmvEreXS9u/P50/vaZ925IRZcylaZV4RVLKAgp8bX5Oz0Ue+RQNOL6a9qugNIminaDeA+f9BD2L4Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742404; c=relaxed/simple;
	bh=6YnmEXOKL6PbXyUgipPtC7A4s4uacsXT4XYQ9+iz6Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8iKAbDoqtwC2Vd/IpxuwUCU/V2PYIpssicFh4DcEatuZ1Lu0dXe/hVpmynx0zVhnMh7ZyGy3TqJqIRLpS4UUIdq1gaNANLh5tTkxomLXOMdc4fNW6Ut8lCzjrghParxLFKP8YZ84sT3TeXn2iu5qhGPHFcNvg9EEkrDIAfotRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYLO9ehY; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYLO9ehY"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1153270a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749742402; x=1750347202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MGxDFg/HmJoySIMD4YNK40OWrOvflDMI9dS116JdMxc=;
        b=dYLO9ehYhjY2mfElJwJ8kXYiozFzxJUBYQyzWTB4FcjKBhx4IxLbIgRgN4IfxkrbEg
         xeCVyQ5MeWeTnQ8sHluPyWscoIvdp9L3nsTYAcXQuNGoJN0xPtYWaa5j3milrbSicf5w
         WHrpmBGln0KJVfHhLlb1g/TSTY6+ctQMNZUn2feZrkVblIPEZc32RF5voBdcYAlzUloU
         vG6WAc9Qwxeqr+SxLob/2X/PBUs8xJmO6yEYp9V4a1VC1zYDfg+gyqdXpRTLQLb9uB4e
         aXgaUFpkUl4NQsYpjVamdA5+cW8yd5gmGQ3sfARFRBD/p0S+NG4+cf/z0qs0vDQoQZLn
         sHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742402; x=1750347202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGxDFg/HmJoySIMD4YNK40OWrOvflDMI9dS116JdMxc=;
        b=sLx2dOOyY30iURvz8XpXVLohim9eI5s/+O9aIH5rshv39th2iEcXpAaq+x1QGfeTXS
         u4PIJudx7K9Wl1lyoqOYFGlGOOICukfSYhzHplYM4VdszRYtspTeGM15eC0brr5mktCj
         z3T5ars8picnR6lbnEDoX5hIL0bjyweVl5LedYH48iWGd+sI6iq3m1uDZwCYgzzIV6mE
         7qE4F2fFR4XLAmoqOlOABA8jQCzEaA8+N2yXpwPYmYvT53IV65Xgi0gCdhy7SuGvmuDp
         P8LfZwsmuwmCE5ZKiq11ckd/bCVhGIho1G8PI2U4Saz0+L/ROGPxlshemwepftsI5gB7
         zTQw==
X-Forwarded-Encrypted: i=1; AJvYcCWAr1dfUsVeWxYwzj6J1Ne9czDODmhe9LsKjhbD1JCQGdiKZqK0yUQqw0A0cnimxpn7tw/3v5lipoZIK+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ysTukUvIQOVKDON4gvsFJ3GPjyBbhzQWXguCa4uI2N2mlOq8
	LP62MZrYx+vl335fj3Zi2gJu4Z3JK+KLlL1hGz6RjMD+hqTrJWbPXJdi
X-Gm-Gg: ASbGncsrxs1OHl0o8Owm70KauCRUCV++pARSBhHa6fHONlT1OkHihVYXXwcpDk/A5VP
	dlQvsaoeCwrUf2BI/4pgKsrqZ7nTZj4BThMpuVnvz2/jb2JJRBhAVZfO/zGWhe8hgFkDMvRQOq2
	cDsbxJQE1pA2d+8zDrDFJGnPGB74x3jXBXW2e3XWwdzkOFnIqVSkZGBhicmPMdTZbItcHn7F48g
	pJHG+47zUyBZ7T7B3xi96jL31EA3t1eHB5nXybgv/9UBzyO2mhaGxRedgT65jqRf8hadnu4Ik/F
	v0VHlBmmCWubLxMnzffLHMzd7+eAm5EJbq2i8ecNr0UI9PznaDrwWeqSecn+nQ==
X-Google-Smtp-Source: AGHT+IGXJWSFfYqIeIxyvNC99OFsIj/yUoYuwJDQRxxBbsMN9frrVX8Wp6lDlwJUxZwUhjyJaX/Nyg==
X-Received: by 2002:a17:90b:134f:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-313bfbb3a42mr7061210a91.12.1749742401747;
        Thu, 12 Jun 2025 08:33:21 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6fa30bsm15442535ad.176.2025.06.12.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:33:21 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:33:18 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aErzPhCYGLqOdlTe@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>

On Thu, Jun 12, 2025 at 03:45:36PM +0800, I Hsin Cheng wrote:
> On Wed, Jun 11, 2025 at 03:04:42PM -0400, Yury Norov wrote:
> > On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> > > On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> > > >
> > > > Simplify the procedure of CPU random selection under
> > > > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > > > logic is still the same but with this change it can shrink the code size
> > > > by 18 bytes and increase readability.
> > > >
> > > > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > > > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > > > Function                                     old     new   delta
> > > > clocksource_verify_percpu                   1064    1046     -18
> > > >
> > > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > > ---
> > > >  kernel/time/clocksource.c | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > > > index bb48498ebb5a..ab580873408b 100644
> > > > --- a/kernel/time/clocksource.c
> > > > +++ b/kernel/time/clocksource.c
> > > > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> > > >          */
> > > >         for (i = 1; i < n; i++) {
> > > >                 cpu = get_random_u32_below(nr_cpu_ids);
> > > > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > > > -               if (cpu >= nr_cpu_ids)
> > > > -                       cpu = cpumask_first(cpu_online_mask);
> > > > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> > > >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> > > >                         cpumask_set_cpu(cpu, &cpus_chosen);
> > > >         }
> > > 
> > > I think Yury submitted the same change here recently:
> > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > 
> > > Though, I think he has another iteration needed as Thomas had feedback
> > > on the subject line.
> > > 
> > > The bloat-o-meter data is a nice inclusion here!
> > > 
> > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > yours and adding them as co-author via the Co-developed-by: tag?
> > > (Assuming I Hsin Cheng agrees - See
> > > Documentation/process/submitting-patches.rst for how to do this
> > > properly).
> > 
> > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > I Hsin, do you agree?
> 
> Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> patch work?

I'll send v2 and include your results.
