Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0CD2472BA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794421; cv=none; b=KFzj7FSsVuODfTTBEeHkyMCpG5+03uXStcEZPmyD3fx8ATUZy1/s50nROvh5icCSU453SJD0UL24PveCBDvtTJx/3HZ3sUU3IAxzahA0xFtOvxPdAQ/RHN8WMoCOzjOyqQQzFNG1kWsOb8q1uCDcEiOoq/i3fm0aNQu2ZbTaneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794421; c=relaxed/simple;
	bh=xd1WRXZnGRWv5xuw3jkYhCV6TD5I7gKQG1iZyIzTtW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ2R6X2oxeqCXE2+5TjleIlmZnUSnAetQsp2QXO/jIAF8ujNt4zwzC0BBmOy6LLHOCUHljgE54xLEKYFME5osu4PrgE2vWfktvh/ZkfsvP08X8T8oZ+LcZ8Qoi4Mr/PcQYJNPeTwM7on0XY2PmIB5sZlJiExIZwV8F8vfoUZOk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq93K9uH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq93K9uH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363497cc4dso15862965ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749794419; x=1750399219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtrexJiJV5KfOryr4wLb9tk9+YgUksl5+oYnNcUBE8E=;
        b=kq93K9uHb9ggzEHl6EzBXtpUoSmcxQVzjpj36/WHF2Y29K2M/mI3BopRyN4lUNDoEE
         CGXBwNNLX4wrZztF4TkuDEvSBJLYvNifuNuk7gu9k7YDRtqQcBSnbZRINDQLpPD+RAVi
         Fz+pTTxky2M/mFOIDn8t7AHcFVaZiBs/T57rSU8Yk/jvo2h/uuuk0IkuRCrqbZ/67dyL
         4Cwq6jWT9B+I/gfu0TjJRVlw/pFQEjnp2TuSpzHhVX+G3j+AdnE4RlW0/ueFU62VECrR
         /6jRU/jt/VYLFRDjb5XkdJHDY4KfoMumSHIVoYftv5oBYN13USuL5WQJdOt7MRoaO7FC
         qFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749794419; x=1750399219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtrexJiJV5KfOryr4wLb9tk9+YgUksl5+oYnNcUBE8E=;
        b=YGqhFJQ+YfitaqW4CivViVEzTYPVccDVwKNv+3RCxBqg1RWEM5dKw1i6Nhc/zhb6QM
         gQQvAy0QBzQgsTNAeFsWpjakqEFQa41o3VnOzCwoi5JqibgOqTI1Nb5olZ5K1SUkZ689
         dPa4LRRPryGBLOOXJZcJxZvoHoDpFhA8iDB8PV9To6j84zhGk/gVLwWyCPX0F/HxMeDV
         SyTr1PU0S/UqyOt9PUx/5MZdZZkFCoilf7N8iCBJb2vZC8F2ERyrLzKYfBXzgPe6IXYo
         W1+EmCBkCsgq+eIc2AB0dDS68H3Q6w28FkOZMeN3qjo5P7qStnXsReQ1VAJl1x/Mjm4I
         ZVyA==
X-Forwarded-Encrypted: i=1; AJvYcCVg0NSHfNT85ozoOAM3z859qw+KygljzZVtyiPSH08fkXHFxKNNFMwCaozmHbe/bsG59AnKlbGlLyX4u18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgFvj4WbheNvXNsLA02GnFqxlwaA5xMVNgp3k2aU6yjr3HNIY
	AeVNCHhFRDXqybTrQ4u4TZKvX2ESqz43Bs13zfPtBbCyZrSAnMr6HPqDD20Y/NkY
X-Gm-Gg: ASbGncvSXH09bAj/+0H9QKulTiLS/FuwoG4D8T2Nj58fTi9LRQs3BxvBtBDwmbP1UFr
	ie6xiK1yPNB+p134uKgHknHNjAoOCkUhASdEb16A6wz+S76KBHsTXJRcdB7W+8lJ/obQOjxhSsM
	Q9gL8DqUjnun7r6xVnwZ9RkLbeq2tV8J4/b2HlnE8uUWse6186RkL0VPczkXBCaBcpQHO0ygKpU
	sqXR6AFxHzhqAMw22xG7jA2fZSWdB7JsyR6nqxImcfda2iTUJEYi9i1Nl7OkFUHlbToIt5Q+DOy
	ZmRzXcmYDUISANpoFPGKDTRxaO3PzVEoSgjnQJJ20IW2wrN7zGTDehcezsrtB76PsQyWdMzFdhs
	39H8=
X-Google-Smtp-Source: AGHT+IGix+knDYS2gFoFAgSKx7bKYJyo2ywZZMBvpzsSJ3FNml7Po3zm1Vvh1p/2+tiIlaSFsk13FA==
X-Received: by 2002:a17:903:46c8:b0:234:c8cf:a0e6 with SMTP id d9443c01a7336-2365db08eaamr31433705ad.24.1749794419371;
        Thu, 12 Jun 2025 23:00:19 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b8183sm2555743a91.4.2025.06.12.23.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:00:18 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:00:15 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEu-b9IkdDrFRFTS@vaxr-BM6660-BM6360>
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

However, I have to defend myself while I'm sincerely sorry for causing
your trouble. I think the statement here is an excessive accusation, if
I mean to stole other's patch, why would I send the patch to the author?

I hope you can understand this, I was not careful enough and made this
trouble, I should've browse through your patch series thoroughly and
thus made this trouble, I'm sorry, but the accusation here is too over
for me.

Thanks,
I Hsin Cheng


> NAKed-by: Yury Norov <yury.norov@gmail.com>
> 
> Thanks,
> Yury
> 
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
