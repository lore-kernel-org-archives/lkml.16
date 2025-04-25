Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE215199A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571204; cv=none; b=EpRCFId86cREnuW+WYRsRwvaBYxz3jBFJCydVf2azELeXNp3gWxEG7QKXZFoVY+yhptCE3c82/l4Y3BOPU4ELvtzSEeQakydYAXrUzyQsR1vO6cdExbZdYBIo1wHqxy5xCQ51JDtwrK+IhpslzS5g/YbVGJspHvErd4LzNkVDHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571204; c=relaxed/simple;
	bh=qgDwMiYZ03jZ3VtL+iQWdqO0dM+ODU13Aog/AyevosA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCZI5+adoPiFhoKv1bW9YrgLaK8XRLbuvL6439zCzTqifnZHbUlaIasOpWr1UEyPVomEPXA1KU0GhpfgBM5gBI3333p4roJ8dd0xI68InnaJy/P9uNwd8jEJVwCF9n94nQ7RSdK/xzqD94THdq+AmX5CgkEWbxnzAHUnmbH1VT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=wrSpVzne; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="wrSpVzne"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22792ef6215so4111745ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745571202; x=1746176002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHzaBwzTKLMB8wXpN6R71/QTn3oT0lrrtPmHK341lbw=;
        b=wrSpVzneBuDhyi3onzognhVpFe388QkFDoOdELiBjrvlhhv/o6dV61po2pVvK+YLG7
         n8lGhiPGs+ZAjIWNARjNU64JGtgpRkbQnmImOEwwjZkIDxaKhTOUBxooZM5epVeqpEAz
         UAPi6QEKxuHaXl5aMVT0iurd6W0mPuobqQmneDy5y2L23NgZUQGi4e5FpZ4s5wjRCAsF
         yzNiotl5/K6+neDIw0tlgm8cJUsXU7ys1Cd31yu7zBucX/aA2zfr7Nk9m180uQZ9A+CF
         mSAbHX+1327aB3TqbZ9KMdSJPLvQDEMT8sBXJNm3EFYZyLfht7MPemviwFwTYqAfId0t
         me0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571202; x=1746176002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHzaBwzTKLMB8wXpN6R71/QTn3oT0lrrtPmHK341lbw=;
        b=wJ2Mtp01FCdR5VDcD2ZMs316Yp2/y7CNsvEOJBIQuv+0852STX6coWxdVk/AQwxNlv
         LdgT7/PU/KVgqdpSURI0QMVhT1bdyKdUYKN8B7GxdScsFnrrU8PsTtk8pod1UI6oiyjC
         mDoF2M4aI+bwqUBhiXZdI2VGH1pJ1SkEIH6+SdCCEL6CSzDYqbpwit3IpUqcOAzhpR2w
         K3moKPrADONZ1a3uanTfFRrDqDn7DDvIltCFBlYq9iUUEu7H2szGeYzFlfsqTJnQipEz
         WN09G8vXyl4K6Mc4Tb4A4pAabJe+ba8hM5MWXXcUORwmmrhcB4q2GwBDtk6knkeQg0Qt
         99+g==
X-Forwarded-Encrypted: i=1; AJvYcCUw6rhHcOQf9EPeMxLdZB2ilXCF3Utq/NG3zfJXQiluSm1GDFnSO19XqFWjE82hBiTf1b1qhd3NZw22IEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/hbeSn6nFQgHCa6Vfhw0nXOqJikiUAIpYPL52R+oZUvVhOQS
	c+THsgQY9X+PeznFO9LWf/AH9aQwVVzG8XlI7TW6T4m8xBYYDVS/Nhp3fWd/euo=
X-Gm-Gg: ASbGnctXLXyDsnW/AXOYNSZc5emGK7S9fESKHfW1l+Jxhc9Z52ZDab9iAvpUFXcdKSm
	pWWYRCRxGmNM6fE9hn/39+Fg3kGiOWC97SGYoIyGv2mn8gAo2F4/O0z1is7NAN4bw5OMUpQRQSC
	7UmFOBu/hsF9swp+OSLrEuHRivQJ39pfZH9GzsMELKwXvajZiyWdtOHWi/Kar+BYAg6Pw/i/XYo
	Fy7E23yYnAg5arSe3T1M1e7kUaNhiDsTs+QckIstV+Avh1qK3/IPxTeX4LD0XfYP3rK1HIZGZHc
	NyqE6r7gI/Hqy8zf9TLBeJs=
X-Google-Smtp-Source: AGHT+IHy79p8wpw9a/bGmuVyH6iKCQpoDtLC7+Y2eHtrwToW7GhqV++yQOsVgd9uP6UhFx1jyjEVpQ==
X-Received: by 2002:a17:903:1b07:b0:216:3dd1:5460 with SMTP id d9443c01a7336-22dbf4d04c1mr8243245ad.2.1745571202300;
        Fri, 25 Apr 2025 01:53:22 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:daee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51025fasm27066575ad.189.2025.04.25.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:53:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 01:53:19 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <aAtNf6QMG7Dj6snR@telecaster>
References: <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
 <aALk9DVfjTTHGdvA@telecaster>
 <aAbdlTISuaJnc5AG@telecaster>
 <20250422141351.GG14170@noisy.programming.kicks-ass.net>
 <20250422151421.GB33555@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422151421.GB33555@noisy.programming.kicks-ass.net>

On Tue, Apr 22, 2025 at 05:14:21PM +0200, Peter Zijlstra wrote:
> On Tue, Apr 22, 2025 at 04:13:52PM +0200, Peter Zijlstra wrote:
> > On Mon, Apr 21, 2025 at 05:06:45PM -0700, Omar Sandoval wrote:
> > 
> > > Hey, Peter,
> > > 
> > > We haven't been able to test your latest patch, but I dug through some
> > > core dumps from crashes with your initial zero_vruntime patch. It looks
> > > like on just about all of them, the entity vruntimes are way too spread
> > > out, so we would get overflows regardless of what we picked as
> > > zero_vruntime.
> > > 
> > > As a representative example, we have a cfs_rq with 3 entities with the
> > > follow vruntimes and (scaled down) weights:
> > > 
> > > vruntime           weight
> > > 39052385155836636  2      (curr)
> > > 43658311782076206  2
> > > 42824722322062111  4886
> > > 
> > > The difference between the minimum and maximum is 4605926626239570,
> > 
> > Right, that is quite beyond usable. The key question at this point
> > is how did we get here...
> > 
> > > which is 53 bits. The total load is 4890. Even if you picked
> > > zero_vruntime to be equidistant from the minimum and maximum, the
> > > (vruntime - zero_vruntime) * load calculation in entity_eligible() is
> > > doomed to overflow.
> > > 
> > > That range in vruntime seems too absurd to be due to only to running too
> > > long without preemption. We're only seeing these crashes on internal
> > > node cgroups (i.e., cgroups whose children are cgroups, not tasks). This
> > > all leads me to suspect reweight_entity().
> > > 
> > > Specifically, this line in reweight_entity():
> > > 
> > > 	se->vlag = div_s64(se->vlag * se->load.weight, weight);
> > > 
> > > seems like it could create a very large vlag, which could cause
> > > place_entity() to adjust vruntime by a large value.
> > 
> > Right, I fixed that not too long ago. At the time I convinced myself
> > clipping there wasn't needed (in fact, it would lead to some other
> > artifacts iirc). Let me go review that decision :-)
> 
> In particular, the two most recent commits in this area are:
> 
>   https://lore.kernel.org/r/20250109105959.GA2981@noisy.programming.kicks-ass.net
>   https://lkml.kernel.org/r/20250110115720.GA17405@noisy.programming.kicks-ass.net
> 
> (from the same thread).
> 
> Note that it does call update_entity_lag() which does clip. So after
> that it's just scaling for the new weight.
> 
> Notably, virtual time = time / weight, and the clip limit is adjusted
> for weight.
> 
> So if it is inside limits pre-scaling, it should still be in limits
> after scaling.
> 
> l = max / w;
> 
> w->w' --> l' = l*w/w' = (max / w) * (w/w') = max / w'
> 
> I've stuck some trace_printk()s on again, and the numbers I get here
> seem sane.

For anyone following along, I found the source of the bad vruntimes and
sent a patch:

https://lore.kernel.org/all/f0c2d1072be229e1bdddc73c0703919a8b00c652.1745570998.git.osandov@fb.com/
