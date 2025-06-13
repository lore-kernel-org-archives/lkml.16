Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8311FDA89
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792182; cv=none; b=R3AGG/N5oklKzxA6nRar3moMTKyXEYZ5k3yv2prYTs+TL9xYgHRbo4SikHZoQKwScgzhVbkFCX0gZNasC/l56Od4BpAGQw7CLfIUFuwLtAPDUvvfTg9HaAuUMgV710BIuvYCwWWkw05lFBgI1D4Y8JZUQK1TfxUtI6ABNsgoQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792182; c=relaxed/simple;
	bh=CzfUoU/F6OeWFirpLwxi5VsjH9jIIE4t1ioTm3n+IkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTZXqNqZW/EQxAKWBrzDVFfcGLHdPkp7iV6kf9OCrZ+ccuLbGo6E3LJaN7OwD2vvN48ThRm0NZRk62szG95C/hnFoa/2FzOSk6XVlAmiMctEImhGdfeuGwYEMnwYcKjpqANf0CtznxXI4Tn8IQbO7dgclWfDDQUOqT2RtCYq078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imVTQ/Yd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imVTQ/Yd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2351227b098so14418965ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792180; x=1750396980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvMoFYwoxd+5v+JlYcXvt8KEYE3zUwaZzStFo0AwJ1g=;
        b=imVTQ/YdX29phlxBMPLj+ZWdTw6h8S2Ri1fbt4GfVognFvrL5XUzyS1aXQWBUIc/P2
         MDFSFthb9/orgZwG5I7KfyE9wjVVW273DQdpUX7kHNRhqOolaceay1/On0mrfnqkM9a9
         MNUhWY137ElS9rBhDkUv/bFbRraEtQ4BmXqnutIe33oWPRk2jl5mK5/5v+Erqzc4+sRr
         w+2kpNFQOxM4QDzXrVc6uGYXLIj5tV1QeNq7E3fi5kLGoKO7ENskJmfKI6l+g712LkSl
         r0lHiVXg4wCySPaNSEX5dXbLoTeON0bwVuiVtO3ThMqV8dHaRg/cbkScw6TTXwwnTaAK
         u66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792180; x=1750396980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvMoFYwoxd+5v+JlYcXvt8KEYE3zUwaZzStFo0AwJ1g=;
        b=wZunO5r6dcqfMFSa7G3am+TJEh6Jp3V4hoznifrRKsq4v3nm6TTfgcJByV1GfL5CKr
         bweWgD5QrnXpuOMjsPpImnnQAhzRHzo+Lpt1giQlp6igD+YQPAPFQxCnmJAWBkQmEMSP
         IEn0icFir4pzWPA0BscuU0LjikBn5EdED5xT9W24RpUuOJDBRyuKqc9c5MSDsHnzb6fl
         CueSB0UepsBaTZbodYtk5LbAQl2EOid/bX73FcOEMJRcluUTfwxoh4ySCYfZauPS1uM5
         w9F/hFXPDrduEmWEGASn1H+SIHggu9iDRCuUMNeITylDAWcmEIuWWF83ftvQSZnZDfRt
         oAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUCBn/4z6djpiA41xw7BClkFbU9K598GI7Jyj/9eYrt8ReUVCgDL4mvzpA5zp6tLIjDHTMJVOINeri0eVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyso9RD7cN6Zt4K7w6+9sJ7D1bjWQGHA6VG/bjPJGM4xJIlAMHl
	0WsWdYiclp+PCnUCc7oq+1jZoSYk+atwgSruwTU0YIs5zue8gm70cnFm
X-Gm-Gg: ASbGnctc+XQimKFHCt1vEMIjWkzYTy7z3oh97A3mKuAn7Eoh2GmcoNwU5n21mzabbXb
	BPm0qBRNWxKVpiIK9/2ClXNKPrLCOXToMM2L/4tr0OxQwbGBddTsojN8G/pYXKJXy72orFehUJB
	7U0JYhH666ziUlYcj8UQYRsn0yKXlKOQ4nrmBRVWJYgDmk4ZRrXhLszMYn/TrItCCTf/7wwWfRl
	kpjPA5lH/86cN1MontOTbnh4kuy58fuuZo66mvyUhN+uWOQiWI0JP2m2us4+EVt/E2b69cJxgDz
	Xwxp2jbyCa2t+c6NxaHum1NFFiATMyJ542QclF6zubyy5oFKuXnC13KrHsxJOefRpzF4RT5w1Do
	VSy8=
X-Google-Smtp-Source: AGHT+IH/+q1AAngn1g1v5S0pRF3/srqeZGaw+VXxABBS2AqgAEONOjQel6ro0wVKKJxQ8DwpOzCG5Q==
X-Received: by 2002:a17:902:ccc2:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2365dc0f622mr23088165ad.37.1749792180339;
        Thu, 12 Jun 2025 22:23:00 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfc56a7sm6232405ad.233.2025.06.12.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:22:59 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:22:55 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
 <aEuw7ls9hieUv_Ox@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuw7ls9hieUv_Ox@yury>

On Fri, Jun 13, 2025 at 01:02:38AM -0400, Yury Norov wrote:
> I Hsin,
> 
> This exact change has already been submitted by me and is under review.
> 
> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
> 
> I don't understand why are you undercutting my work, and moreover do it 
> for the second time.
> 
> For the first time you submitted something that duplicates my another
> patch from the exact same series. John Stultz has pointed that, so you're
> surely aware.
> 
> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
> 
> Kernel development process implies that one makes sure that his work
> is unique and doesn't break someone else's development, at one's best
> knowledge.
> 
> What you're doing not only breaks this rule. You're in fact trying to
> get credit for the work that is done by someone else. This is the
> definition of fraud.
> 
> I cannot make sure that any other patches from you are unique and
> written by actually you. Therefore, I will not take your work anymore.
> 
> I encourage everyone else to be careful working with I Hsing Cheng
> and check his patches for uniqueness, at minimum.  
> 
> NAKed-by: Yury Norov <yury.norov@gmail.com>
> 
> Thanks,
> Yury
>

Hello Yury,

Sorry to make troubles, I didn't mean to do this, I wasn't aware that
you've send the same work and nor do I mean to interrupt your work. I
didn't have the habit to check others patches regularly, I'm sorry for
that.

I just saw Kuan-Wei's patch from months ago and I asked him whether I
can continue that work, and he agrees, so I try to do something from
there.

Again sorry for causing troubles, I'll make sure to look for others
patches first before submitting them.

Sincerely sorry for this.

Thanks,
I Hsin Cheng

> On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
> > Utilize cpumask_first_but() helper instead of first using
> > cpumask_first() and then cpumask_next(). The logic is the same here,
> > using the new helper will make it more conscious.
> > 
> > Use bloat-o-meter to check the impact on code size, the result is the
> > same, does not have positive impact nor negative impact.
> > 
> > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> > Function                                     old     new   delta
> > Total: Before=22590709, After=22590709, chg +0.00%
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > Generally speaking, I think this is just a small tweak on the code,
> > making it more readable. However, no benefit in code size or performance
> > as the implementation behind the helper is in fact the same as the one
> > used here.
> > 
> > Maybe more tests should be done to ensure the change is solid, I hope to
> > seek some suggestions from everyone who has any ideas, or this is enough
> > then it's good.
> > 
> > Best regards,
> > I Hsin Cheng
> > ---
> >  kernel/time/clocksource.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index bb48498ebb5a..12ff0c048570 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
> >  		return;
> >  
> >  	/* Make sure to select at least one CPU other than the current CPU. */
> > -	cpu = cpumask_first(cpu_online_mask);
> > -	if (cpu == smp_processor_id())
> > -		cpu = cpumask_next(cpu, cpu_online_mask);
> > +	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
> >  	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> >  		return;
> >  	cpumask_set_cpu(cpu, &cpus_chosen);
> > -- 
> > 2.43.0
