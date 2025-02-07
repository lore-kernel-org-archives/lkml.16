Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378C1E0DE5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934529; cv=none; b=bWsFO2LqH7IywNhWPFB1uIDSu6UL1yFr5OpxzkoU6rulhxudI9vmOX+EnGmrsUL7YBONbYFWI4yHuj7UV1Q10yl/ss7K8vLqAb+xoDQkex+FMFBSZcLg2qumJzgYLR3XpkR4ocNSMTXDHKgTSf7GBic1UjcxenEDw56BGLHcHUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934529; c=relaxed/simple;
	bh=QAv4Uk7xjI7U4Ul0z799/x2JfDjv6NjBN239+qGFBi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzN3uDYvteMcUpC2e0OzGfdL/gNcM5m0xiccR0btiZ6dxcoRJX+2CdSY1mJBhke4JLsqUMbkemDWV9GmEzJxrWbe2lN3w6yo9gf6WVY2OqjiZUJxlFqvjhA/O+XJ6POc1Pla/6h7/7UtahnzH0UTvgE3Ta1gjLVjNb2WYwLe3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab78bcb4b19so133814766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934526; x=1739539326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6oDg721bXUvOIh6fe5YBPLTPmdr3iKJaMpPd/VBhew=;
        b=UDt5fTzOouPL7GkHp+Ni0fo0SO3JsKSu350b21PLkfAikJJrZELhi+V1lvW7nl+xB8
         zUIsAVkOW4Mr/UCNZRM/IzzNtfgzNItpOe+qhIOQEnWVbBPDkVhtCkLvf/Ic5vK3fgmH
         +VgqvAyDmzcT110bvTP3q0r/5OwsGpR6qSJB9uZgOBZ/fbESz54+anngsK7glZjKvc1K
         G5Icr8UapZ5E/fRd34wbFDVXOdOYgJprxmMUmIlJU3NHnG9mSQbexYMCSk22T7g8b86m
         t//2P0Rv092nYk+oBYvNAuBmZv7aaC1bvXZJhMJkZjJ77yHuKJXIyi6pkDssLCMwgbg2
         TeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWnmGQYo9WPvQYRWvr+AaQsZ8xz+juYe7oBese3Jlq+NWiqTeIRoEuHI40k+io2xfM346P6j3r0bin4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwsDZwf0aDJlhgacf4RwDMNxbiEw5HPnioqjdPJtA6axRoDDU
	3IrtSKRcbJmjT6izSSNz3CXA+zLU2UFB90rAy36TsodyrqxUekU2
X-Gm-Gg: ASbGncsgv1HL0wmP1oTBPCuOGiWbMR2bOKAumQD3UBtt9oxEtwst7l116a7zWgGwbao
	e396E87Aemx82NeqG2kLj4mDbweAZ067T2wulYoSpbATWG5TvB+4bRZ11CBJxpGp+wbBo/mWQHo
	+VQYspYjsOZOOpP9+c9GOcqV84RH8YN6uSCdcVfNlIf8iEfm8hU9wRXpXiAblfob0iUQfx5VXDE
	VK/Je0xJNkqJH8keAs8TkgKE6RW9Fmo6g4G9jzhrDPaneVjr9Q60qg/8jqLck8ucYMya6yloSPs
	ftyreQ==
X-Google-Smtp-Source: AGHT+IHisEKjtNadKLbDyA72+sFuYHBGHWzwVbJ/R5NbtEJXtTXrKIsGZtiUgMNA4lG2FghoXvmGGg==
X-Received: by 2002:a17:907:6eac:b0:aa6:5910:49af with SMTP id a640c23a62f3a-ab789b1f93cmr335553866b.24.1738934525171;
        Fri, 07 Feb 2025 05:22:05 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7826ed43esm183693066b.58.2025.02.07.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:22:04 -0800 (PST)
Date: Fri, 7 Feb 2025 05:22:01 -0800
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
	qyousef@layalina.io, chris.hyser@oracle.com,
	patrick.bellasi@matbug.net, pjt@google.com, pavel@ucw.cz,
	qperret@google.com, tim.c.chen@linux.intel.com, joshdon@google.com,
	timj@gnu.org, kprateek.nayak@amd.com, yu.c.chen@intel.com,
	youssefesmat@chromium.org, joel@joelfernandes.org, efault@gmx.de,
	tglx@linutronix.de, kernel-team@meta.com
Subject: Re: [PATCH 03/15] sched/fair: Add lag based placement
Message-ID: <20250207-convivial-silver-chachalaca-fc0fba@leitao>
References: <20230531115839.089944915@infradead.org>
 <20230531124603.794929315@infradead.org>
 <20250207-petite-eminent-husky-7d1704@leitao>
 <20250207111141.GD7145@noisy.programming.kicks-ass.net>
 <20250207-tunneling-tested-koel-c59d33@leitao>
 <20250207123020.GJ14028@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207123020.GJ14028@noisy.programming.kicks-ass.net>

On Fri, Feb 07, 2025 at 01:30:20PM +0100, Peter Zijlstra wrote:
> On Fri, Feb 07, 2025 at 04:25:02AM -0800, Breno Leitao wrote:
> 
> > I haven't seen this patch in stable. Is it queue up for the next
> > submission for stable?
> 
> It's not yet queued, up. I meant to do that this week, but 'stuff' kept
> getting in between. I'll try and get it pushed into tip/sched/urgent
> this seekend somewhere -- but it is unlikely to make -rc2 at this pace.

That is fine.  I just want to assure that this patch will eventually get
to stable, so, I don't need to carry forward this patch forever in my
production tree.

I will let in ~week if we are still seeing this warning in our machines.

Thanks for the quick response,
--breno
