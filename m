Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764827F01C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255608; cv=none; b=TkuLemt1uk47tnJOxQPwOkxsl3r3hbZnX/9+6bw82T5N37FIkAwZVp17ASxjUqmtQ1qNwlU/zZ2HWqNSRl7/gnhEbbD6m7uKqho0o6GSSzA4E8Wo0qUQ6T0IOp4BfgO3PhPO/Xz89iwyh88rEJIbgqzH1YGr+Er+Wvuya6bA7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255608; c=relaxed/simple;
	bh=4SpJtulDxgkwHamMuWPzZtOvXwcuwEKwW+CpJ01OLJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kmj6TziXaHMdmvFXMfCslvoIG2HXVqk7eTVSz6ZIM+W4rDGMxBuHWnH1kkyC6j+C1Y/YvJG+l5uMdIi0fM84hRujleSiRH4lJ7eMzBRCPYUWVsFoHjey5j8oRDWVO0pY2QGTsXA7SbKhPpmxlOZFZvjgdwpiSZ0gcEj6vhYA9WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=g3+rQmxC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="g3+rQmxC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso6688644f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1750255605; x=1750860405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCz4xhVEuMZq7I5JmKa8hUWG+eHQFPySS2ntysLkYhI=;
        b=g3+rQmxCXItl4YNt0eQr7slxy0YzsIzJo6PJPx9DcbcxkVUEay6NJqGDlyHhxIXfUh
         35eI6cKPtizOlvRDYYXdqAR5ot2pwFpLw/2mEYsMN7qANfeADn7vIP+QF7CTn+eNA5kN
         TrCgPLdWU19HKaBlkg1eHHnyd119bUkzY6ue8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255605; x=1750860405;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCz4xhVEuMZq7I5JmKa8hUWG+eHQFPySS2ntysLkYhI=;
        b=NpaWSlfIj8mjSXjbvf3SVJD9eP4NwipDfsGI+FVL/hnzXGUufPzIxUu+beTbuabh29
         B6p1QJyJvwKP4kiipHdzp9NkPnykqhVhrUMRp4LvDn5UHIzjp6YKQCKStgojRSt+Uvkn
         qqHphOaCLKKIV427bAVbZIDU5pwGAPbGl4YMYU4/wRTTSFgaIifYj6d/RsLCs6YNhgcH
         Owe9Atz7B7Jx4wtiW5BibSxNcqI6gTdGg1gfAwEn5wsxOPMH0N42y1OKFC7DPl4e5N3B
         Gob6QzGMYjm5yXsexkRy5DyivJcwWpyL34PX68fYsklT2XPh1mGtgek3dFW/YJ6leWs1
         nzxw==
X-Forwarded-Encrypted: i=1; AJvYcCUccKLNZo+nxZHgcZXPE+x7sbXcT1LCe6ywg88HXP7esaBFuyGcOloeVzmbDTe9M3yc5u3bWx5C/OAJUSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxykA7rhpKBV4bBV2ox12pN+rF1ly8nCwuCUJqHmmh2Att8FnJO
	nB3JT/J3Svy3fArsPK6h6tEO1lEluTGxELgXBu5g1hd15FxdLl8ZDuSXQm6Vyj9FSO8=
X-Gm-Gg: ASbGncscqM6i9n1w0GzszC5Gg1Yahp0zLOV56yVgq+dNQCHbPwLrHBtn044ElmZ8rcy
	N53HqNc8Km1A08TObPfkHZWtz1dipUWhEk/TrRWDBsNgkT32ldq9XlzoMGlRWXKY2zxUNjHRXFl
	zVsPO8sFdm8r992DIjx3if5nZwWB92Bi7o66II3qVyeMJnt6udfHoRLomhTKnYaTSGIBHZi1BTv
	eIthn5tACYu1/r5Iz5TSH77zPmz1+7j2erv03kQ+IEe3HIi38a8bqgRYNabRn6LmJw7RfxRBmha
	5GXSaPIvwzLG1+MUK3cI1wsEyet1NZvYLtpdxbbsRy+JAzAgioZfws4fUmpZYUFyCP3FIncsiw=
	=
X-Google-Smtp-Source: AGHT+IHBs3duxJoTqq/WKMIDJsARyVHA9luTU8eetiw/0sqRdC35N2eZTCPFDaMYdyL/wiDxrA95lA==
X-Received: by 2002:a05:6000:4282:b0:3a4:e60a:c409 with SMTP id ffacd0b85a97d-3a5723aecd1mr12354467f8f.41.1750255604366;
        Wed, 18 Jun 2025 07:06:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm209233415e9.40.2025.06.18.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:06:43 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:06:41 +0200
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
Message-ID: <aFLH8Us_e_U6gNHV@phenom.ffwll.local>
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
 <aFF6xeu78cXTGFH0@phenom.ffwll.local>
 <aFGFCc7eiZJM8RKM@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFGFCc7eiZJM8RKM@pollux>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jun 17, 2025 at 05:08:57PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 04:25:09PM +0200, Simona Vetter wrote:
> > On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> > > On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > > > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > > > + * least one of them does not execute operations that may block on dma_fences
> > > > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > > > + * can only make progress through this schduler instance), while the
> > > > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > > > + * finish. Thus, this can result in a deadlock.
> > > > 
> > > > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > > > explain that the wq must provide sufficient forward-progress guarantees
> > > > for the scheduler, specifically that it's on the dma_fence signalling
> > > > critical path and leave the concrete examples for people to figure out
> > > > when the design a specific locking scheme.
> > > 
> > > This isn't a concrete example, is it? It's exactly what you say in slightly
> > > different words, with the addition of highlighting the impact of the workqueue's
> > > max_active configuration.
> > > 
> > > I think that's relevant, because N - 1 active tasks can be on the dma_fence
> > > signalling critical path without issues.
> > > 
> > > We could change
> > > 
> > > 	"if max_active tasks are reached at least one of them must not execute
> > > 	 operations that may block on dma_fences that potentially make progress
> > > 	 through this scheduler instance"
> > > 
> > > to 
> > > 
> > > 	"if max_active tasks are reached at least one of them must not be on the
> > > 	 dma_fence signalling critical path"
> > > 
> > > which is a bit more to the point I think.
> > 
> > My point was to more state that the wq must be suitable for the scheduler
> > jobs as the general issue, and specifically then also highlight the
> > dma_fence concurrency issue.
> 
> Sure, there are more guarantees the driver has to uphold, but this is one of
> them, so I think we should explain it.
> 
> > But it's not the only one, you can have driver locks and other fun involved
> > here too.
> 
> Yeah, but it boils down to the same issue, e.g. if a driver takes a lock in
> active work, and this lock is taken elsewhere for activities that violate the
> dma_fence signalling critical path.
> 
> All the cases I have in mind boil down to that we potentially, either directly
> or indirectly (through some synchronization primitive), wait for things we are
> not allowed to wait for in the dma_fence signalling critical path.
> 
> Or do you mean something different?

You could also grab a mutex in those driver work items that is held while
waiting for a dma_fence somewhere. The dma_fence annotations should catch
that, but at least in my reading of the text here it's not covered.

But my main point is what I explain below, the text fails to clearly
address the issues that all current drivers (maybe all reasonable drivers,
but sometimes I lack imagination) can encounter, so to me it's too generic
and not that directly applicable in practice. And then on the other hand
dma_fence is definitely the big thing, but fundamtentally you tie anything
you schedule on those wq to the drm/scheduler design in it's entirety. So
for the general rule, it's not generic enough for my taste.

> > Also since all the paragraphs above talk about ordered wq as the example
> > where specifying your own wq makes sense, it's a bit confusing to now
> > suddenly only talk about the concurrent wq case without again mentioned
> > that the ordered wq case is really limited.
> 
> I mean, it talks about both cases in a generic way, i.e. if you set
> max_active == 1 in the text it covers the ordered case.
> 
> Or do you mean to say that we should *only* allow ordered workqueues to be
> shared with the driver?

Both examples talk about ordered wq, they don't make any sense with
max_active > 1, and I can't come up with any example that would. So yeah
I'm leaning in that direction, at least in the docs. Only discussing
max_active > 1 for this specific issue is imo very confusing and not
helping much. I guess we could even WARN_ON if a provided wq is not
ordered, because that does smell funky for sure.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
