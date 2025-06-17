Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03733F9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170314; cv=none; b=eovp3Hr/OEvFmL+dgH1grpzkkuia33n4o6aFOYPk4dndTV17zRpCSJ1mjAveK7yUR7SZkil6+gvbFfA9WALUitbxTHJF2irJVogHK7WF2UKjJPZ+i5T3KENQVrvl7v0Y8fdGu9GiurhhR/JbLfy0JsM/8pOjXhgQ07x/2YDCdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170314; c=relaxed/simple;
	bh=MJVh9FqFD3KJCh1Pp9qSs5ITe7Bdy58pKCW4efESyDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlK5400Ae+eAeFmB4baNZfg4CVzLjHs2Od53UjTFJFSxHGidTYcgMeKQSodtGdlDWxqeSvqivsZgBWjzvRG0PmCIPsxN8rq/nNOuaR6icnoM5qr/axe7YbdQmam040OPGTaDoE9/Bkvo4NYAXCD5rX1H8U2OXqtrURpvIc3tBcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=HkjTSDm5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HkjTSDm5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a52874d593so5604689f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1750170311; x=1750775111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
        b=HkjTSDm56M1RXnax/YZpIqRl69wafE///BIz0HQYmHIb4wN43hxE8R47tK+DbzUyaH
         PI0eBQvWEjdEV+YBfpiYLl2h5EOWhFoPWsa2e3ynDruSgde9QP674K2dW1ZxcnL9k0h3
         UsOaDdbaMw1XnwxC7gE6AHodyOJG6ITgJjhHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170311; x=1750775111;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
        b=ZBFLASe0iPj0VHp343HvrSed3+E53AYRQ0jJUkRNVpuPY3CekqhgwXGg2thAm9GGBE
         RbytYT79s5WBTxApmmIxXtcxvP8qRj8KT293QGFJz59pOUKA3i/1f0Qr59H3XHHHPgLz
         GPKmfvPN7bnSvZqv5YBurNICmywJWnU59dXcxHj3Dwi67RsI5NTA9JluhPIi88TO9BY4
         dgKstZj86rVXVkG7MfYPfsWJ1FJr6NDQFm1F0ZGhzrnVFacMAt7XxEDmYGIhUiQ7ZgMh
         zbJaxW2kG2ZtOyRCVH48BX+LsaAiFI5ECkiwAK32kwqYWO8I6WPIaK4BOFxgffeBRJuc
         /Yfw==
X-Forwarded-Encrypted: i=1; AJvYcCXeVxuyYxRoCSDhXallstsFfAb6XAVzsYyOowybYp9RU8IOEE64RzsFzg6mht2BYybgxEpYz68IcxnuxaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNS8o3G055e9jKsusIhiPDDi038BFwrcCZhretMHQ/159+Fsm
	ZpQYKjXHuBt8L97MHGCiuE/J5Z/96HQvofDrtu7KZrGbNICPhEh0yatKMq2QmzOv8fQ=
X-Gm-Gg: ASbGnctXPVSKtXlhEDP70eohs+fBzDN0aQ1CxJ6KKqgIWI45nsdAV/2I9nTkOEX+/LF
	E1U1B18MZrUeOixz+dHVHQCGF9btJurXDMUZ7CoTjlB2Zuyl3GOFhwkn5uM034zc/tVKI9KRaMy
	/hlukZnMXNQZnSArAvFkjJ2TTaCyfyqjIyKl7OnVOESqe5s1UZkXfpM1xtJp7ZCWfTNLkCfonuX
	ZvsQb7oRzCYEeuYTEcw8+0YNX5/MFbfRcgNosCkYBSDZRh0lOoSag9lO286dWzioWHFjpYKgJC6
	1kFZmo2gIwp07PK1E8+pc8I4/QlmNWBm699PynrC+CMCdRnmVswtLyDclMLXu/Itwp/Xn1A6BQ=
	=
X-Google-Smtp-Source: AGHT+IEbdYZbQa6vrYSOaM4WdmPVqMOqkP9lVIxOcii3jXSSMba4JKehblrgcpHlbRQBeXzMM6KpFQ==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a5723a2be9mr10791911f8f.32.1750170311421;
        Tue, 17 Jun 2025 07:25:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm14245947f8f.68.2025.06.17.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:25:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:25:09 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFF6xeu78cXTGFH0@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local>
 <aFF3YIAFkgsAKvQV@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFF3YIAFkgsAKvQV@pollux>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > + * least one of them does not execute operations that may block on dma_fences
> > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > + * can only make progress through this schduler instance), while the
> > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > + * finish. Thus, this can result in a deadlock.
> > 
> > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > explain that the wq must provide sufficient forward-progress guarantees
> > for the scheduler, specifically that it's on the dma_fence signalling
> > critical path and leave the concrete examples for people to figure out
> > when the design a specific locking scheme.
> 
> This isn't a concrete example, is it? It's exactly what you say in slightly
> different words, with the addition of highlighting the impact of the workqueue's
> max_active configuration.
> 
> I think that's relevant, because N - 1 active tasks can be on the dma_fence
> signalling critical path without issues.
> 
> We could change
> 
> 	"if max_active tasks are reached at least one of them must not execute
> 	 operations that may block on dma_fences that potentially make progress
> 	 through this scheduler instance"
> 
> to 
> 
> 	"if max_active tasks are reached at least one of them must not be on the
> 	 dma_fence signalling critical path"
> 
> which is a bit more to the point I think.

My point was to more state that the wq must be suitable for the scheduler
jobs as the general issue, and specifically then also highlight the
dma_fence concurrency issue. But it's not the only one, you can have
driver locks and other fun involved here too.

Also since all the paragraphs above talk about ordered wq as the example
where specifying your own wq makes sense, it's a bit confusing to now
suddenly only talk about the concurrent wq case without again mentioned
that the ordered wq case is really limited.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
