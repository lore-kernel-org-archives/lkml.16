Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E16224B1E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826556; cv=none; b=MDsV3ujzJNS/aicBa/BkAIii/HJcRdMOqWQaxMocBw/Y8yEsQjAOwDlvEodlaCByc4kb9B6cQONj74HOePCaD+vApYz/CTEsnlNU5/OtaGKvpvSNVpuPwG790yMZK99DNVWTvMrPy5vLtxCHpxL9KRGMrj6HNJxltqvTyCngs70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826556; c=relaxed/simple;
	bh=n0iVGn/x0ctPMtAMx95KVtwpFhg/mGbPc7w3e1BBHLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thUdLV14nV0rg2L4hE0rYnk4DRoMCw2a5wC4yDONNVS6lZGvUg5ZCREoHTW7H6/EkYYyyISGTjirli19x6/76w3h817XLmxbfim2FZlxUM0izWTktMUm1B7kmL651TqRqmr2J/cBGzaSFVyDK9mqcKf0K+W95Yc4dntoHIXJciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bXsCubjs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bXsCubjs"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f20666e72so12248165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738826554; x=1739431354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ND3YwwZD7x/+hPDujpYDVCvxd5yZcP3jGfKq28g5ss=;
        b=bXsCubjsqbv0WIh2Wavq3qk+iKD+ZJxqPNk9eAuSEHO/SlKdlsmE8kuikwEQLHyN6T
         OM7kbhVKORUk2M1WM+t7nQXuVj/bgg7Mfna7muMwXl7NSu/RiOHs6/4+tQLq8vBIHDIA
         lRiuXwv4Er7xXsjiz3hzWZELN0D6PJOmywXHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826554; x=1739431354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ND3YwwZD7x/+hPDujpYDVCvxd5yZcP3jGfKq28g5ss=;
        b=ZGA4pre/TDxFICBXZlVlZUfinws+F/IZLx4JHC0x6Lq1JeapHrHpSp3OzuVI6uUZUg
         aEt3WapVpZV7ArFd3GmZarHyqU1nbWoPEfbLUcb3/YUAAPWsQe/0lMzKCCH3FVm9d8y3
         O1Ckz9/hkJ0PrLYZgS/utR1CuTVifG/kCyPmcF22Cz8xv16agHCUQdHaDw0tR/TYs8jc
         2CoHusE5RjB1TQKoWCXNlTxTe09b1TakgeeOepEYTURHdQC27Kybg9SdLA466ZDOZRwp
         1cWhP/6NJv1BL8SJfJmmm9Qmh+1PFoddWqwUF9gOkkDzmObcbLgL4OoH+Y18XLPfLuPz
         Bc5w==
X-Forwarded-Encrypted: i=1; AJvYcCWf9/cvRkbChEbVObiT/aanv7/pfVzxwob9SR6bseUP2ZSB0uo+vIiQeDq2Z6pFXqHChd9E0v5G4lHCW7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqkstxtc8jMg8k+V8LUda/9XBSN4R/30TEnysf3L88wcs/CtAV
	CScNuY6Ks57HTvbHCdGJm8V/4YcU+95a9IKtCcbYslWtwVAvDLLtMhpuactgvg==
X-Gm-Gg: ASbGncu5sH8ZsYNpO5GdwxxY3TvKccRiKvD3bUPEYiqr6h391/wfwEbL8uq0SetL1ek
	Mn/bA3qxaCtXxD8ffZbMWY4PmeCKEpejFmyLly9ttCORs3lgBrZy8o7erz2pbI7tFxGtgHb0VUc
	Dz2eFZUwbokuhbAKDymjaZTf4t4LKv9FYelHlFM8SpFvvg0LwSXK9ELcq1F6V5L+hCBZr6wOo34
	KXN8nCiEDrRL68Wk+Hq+0q+n8VM6e3GqT1xgHe+R2DFoX/dKMIjuE0h3cLEFLOPIpgPFp+1y4pe
	DxbF+XhqgPu5w9Zb6p4=
X-Google-Smtp-Source: AGHT+IEWqlUmGEMZDMpp/ZVMExE1e2zM+lWtI6158t8LS5XpAGtkgzj7kcVIZOm7bY8N47//IfjoXA==
X-Received: by 2002:a17:902:f64f:b0:215:b75f:a1cb with SMTP id d9443c01a7336-21f17e26cf8mr95007055ad.9.1738826554127;
        Wed, 05 Feb 2025 23:22:34 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d8ffsm5632095ad.150.2025.02.05.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:22:33 -0800 (PST)
Date: Thu, 6 Feb 2025 16:22:27 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>

On (25/02/06 14:55), Kairui Song wrote:
> > On (25/02/01 17:21), Kairui Song wrote:
> > > This seems will cause a huge regression of performance on multi core
> > > systems, this is especially significant as the number of concurrent
> > > tasks increases:
> > >
> > > Test build linux kernel using ZRAM as SWAP (1G memcg):
> > >
> > > Before:
> > > + /usr/bin/time make -s -j48
> > > 2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
> > > 863304maxresident)k
> > >
> > > After:
> > > + /usr/bin/time make -s -j48
> > > 2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
> > > 863276maxresident)k
> >
> > How many CPUs do you have?  I assume, preemption gets into way which is
> > sort of expected, to be honest...  Using per-CPU compression streams
> > disables preemption and uses CPU exclusively at a price of other tasks
> > not being able to run.  I do tend to think that I made a mistake by
> > switching zram to per-CPU compression streams.
> >
> > What preemption model do you use and to what extent do you overload
> > your system?
> >
> > My tests don't show anything unusual (but I don't overload the system)
> >
> > CONFIG_PREEMPT
> 
> I'm using CONFIG_PREEMPT_VOLUNTARY=y, and there are 96 logical CPUs
> (48c96t), make -j48 shouldn't be considered overload I think. make
> -j32 also showed an obvious slow down.

Hmm, there should be more than enough compression streams then, the
limit is num_online_cpus.  That's strange.  I wonder if that's zsmalloc
handle allocation ("remove two-staged handle allocation" in the series.)

[..]
> > Hmm it's just
> >
> >         spin_lock()
> >         list first entry
> >         spin_unlock()
> >
> > Shouldn't be "a big spin lock", that's very odd.  I'm not familiar with
> > perf lock contention, let me take a look.
> 
> I can debug this a bit more to figure out why the contention is huge
> later

That will be appreciated, thank you.

> but my first thought is that, as Yosry also mentioned in
> another reply, making it preemptable doesn't necessarily mean the per
> CPU stream has to be gone.

Was going to reply to Yosry's email today/tomorrow, didn't have time to
look into, but will reply here.


So for spin-lock contention - yes, but that lock really should not
be so visible.  Other than that we limit the number of compression
streams to the number of the CPUs and permit preemption, so it should
be the same as the "preemptible per-CPU" streams, roughly.  The
difference, perhaps, is that we don't pre-allocate streams, but
allocate only as needed.  This has two sides: one side is that later
allocations can fail, but the other side is that we don't allocate
streams that we don't use.  Especially secondary streams (priority 1
and 2, which are used for recompression).  I didn't know it was possible
to use per-CPU data and still have preemption enabled at the same time.
So I'm not opposed to the idea of still having per-CPU streams and do
what zswap folks did.
