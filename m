Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBEA1A5B91
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746056738; cv=none; b=j/JqtLVyx8wnse+XH3LmDSJo3IgMgrdnPgHRrOV7nifdBgDhxogpNm80MXxm4ONJTmG8Od2IfXGyi5uF/gqLsVFaZEniNpk2mClFEJqOCJ6l2BvrmlN5ViLZgrXqmuhLV9HjqigPgzBBsoT3AFCnzT6R6MSHySlvtSSqz/UTeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746056738; c=relaxed/simple;
	bh=2PvzHkC4Ci2Kf/kq4B2sBBVqGO4W+0BsEkDkSvTJziQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQNbyXmcAtYeEIFXsRKrzE3l5pYwtNtQJHLhovGJvPoF/dOYeGGuKApjeyrlgz8WlkqFqM42bO6VATzotv1xnBCt/MoInaosZ7/VrJT8jwN48iQTa06j7ZVRuBmB8TIuG67mAhKqEle0YEUCOx/oyZOPdt6KkrKzrEExL4a3I0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=Km1JMbXZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="Km1JMbXZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224341bbc1dso4842835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1746056736; x=1746661536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VeGFTRBMyDrhdtVEySHIpmiKzPvNuI2CRPUAotMKwQE=;
        b=Km1JMbXZSK1wYU7E0gtQ7OAddzv+RRrJa3KGYSMC+KRCYDNJEUG5osmTot5Vb8qeL1
         sAhpXxk2hk2iAVUAsZ9HQsHh7CAimU0k8ayovpbmOMUVd/DU1Vwzi5hJ/z5bV3IHlNKh
         klaAxCIMYu/m9Nd628zOA834HHZsUhEqwv56bJUV0wAQapKVBMcJ3RKsM2hiaPBnoT8p
         j2nAf4swl9Uz4UymZJbAM/2S6GAb3nV9K5nTeCZc6OH648P4zenNlt9N15U6S+GhvlEz
         Cl7KZIXtLKlLWexB7E7F9znDKpLX1JcPHI9NdoQ3Nok6lm3Z5dgTjACmtyvOGtSt1v/s
         L2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746056736; x=1746661536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeGFTRBMyDrhdtVEySHIpmiKzPvNuI2CRPUAotMKwQE=;
        b=m9mAQug6cR1cb78Pjfw7VbAEfJSemlQgLX1GVVyL3R5wl/oAG2F3gLUiVr6fYWAuz7
         YMyoQMf9BC+fsvzIe8EhkB5fW/YiYgkjWo5W1EXZzjYHRCSaWMfi36gozmo0ptdQV7ZC
         uwqRhpvhdQU4QZ0KkGcQUr1gPK+2ASEqirry16y6MHkQM8PuQRyD9CNfbd32aqJlust1
         bHS6O9YBEauPN8bq56qesW5C1ZBdBq2DaqNHvvEi0Ukn0ustywVMvxgvKRdzsYibx/iF
         TC0R6kSUMSRVlVspkEFnLv9xXuGNDb9XLKvX4WP4SPHibq02d64q4RYdwo0TMU8ecOG1
         /4tw==
X-Forwarded-Encrypted: i=1; AJvYcCVRK7ci9tQb8xk0qGwZzfi9LHpqGkDOMypWDJcsvtJv/OGWwjlTSNXg/WeACpxdIhD0ejnnTzRMJbAPOec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCY9UlSYM9D3Uwlv5FCuURTJOOdwgPHHfx6nEMuA5DUvVrLar7
	Xr83ihPP3VAmB3Pq4Yd60VD3zym7Gn9AEZwc0CgnJIQOdhUnZ8v0F5L8w+hA/lE=
X-Gm-Gg: ASbGnctxM5m5Lpe4FXYtMJmPvEIbc3nAb7YJFRIdGfCDeDImB1P8oqEMYWxZAcxy6JH
	gYCFQiMKWmTj204lNVHX89YGxvlRLx/XkYcQdo/U+PVnUF4AcYEArvN1MldDj+H74LgT9Ft+rLe
	mSWIKV+df2FNo4POVI74qUD5eipngwhZaV0FTdIFTmocEyV9ikF8h+i091WkklqopERLhb9fNIC
	1YxpjlgldSeKgTMPj7B28PO4eBklov0YT1Dzv/10keN63r8XX1KvZLWdsE/kgnat9dT1hbtgBLC
	JCVf38MjYMb66rMPFgH014X+avLH1fOUnNtKWXU6iz1xAuYSmX9iktqIjjPcucFa++iejVjZVka
	MAsgGIWa3CmFyew==
X-Google-Smtp-Source: AGHT+IF0RMsJTbPEUkDtqNc9jfYL4nCm0DRUBX52FBTtO+G+C9NY6AqimYN+6Tte/78Ki1GTlNt6QA==
X-Received: by 2002:a17:903:1aae:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22df35bf1e6mr73135335ad.45.1746056735921;
        Wed, 30 Apr 2025 16:45:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a9fsm128162615ad.111.2025.04.30.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 16:45:35 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uAH7M-0000000FQ6c-469A;
	Thu, 01 May 2025 09:45:32 +1000
Date: Thu, 1 May 2025 09:45:32 +1000
From: Dave Chinner <david@fromorbit.com>
To: Chi Zhiling <chizhiling@163.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: Re: [RFC PATCH 0/2] Implement concurrent buffered write with folio
 lock
Message-ID: <aBK2HAnoRacuO0CO@dread.disaster.area>
References: <20250425103841.3164087-1-chizhiling@163.com>
 <aBGFfpyGtYQnK411@dread.disaster.area>
 <040637ad-54ac-4695-8e49-b4a3c643b056@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <040637ad-54ac-4695-8e49-b4a3c643b056@163.com>

On Wed, Apr 30, 2025 at 05:03:51PM +0800, Chi Zhiling wrote:
> On 2025/4/30 10:05, Dave Chinner wrote:
> > On Fri, Apr 25, 2025 at 06:38:39PM +0800, Chi Zhiling wrote:
> > > From: Chi Zhiling <chizhiling@kylinos.cn>
> > > 
> > > This is a patch attempting to implement concurrent buffered writes.
> > > The main idea is to use the folio lock to ensure the atomicity of the
> > > write when writing to a single folio, instead of using the i_rwsem.
> > > 
> > > I tried the "folio batch" solution, which is a great idea, but during
> > > testing, I encountered an OOM issue because the locked folios couldn't
> > > be reclaimed.
> > > 
> > > So for now, I can only allow concurrent writes within a single block.
> > > The good news is that since we already support BS > PS, we can use a
> > > larger block size to enable higher granularity concurrency.
> > 
> > I'm not going to say no to this, but I think it's a short term and
> > niche solution to the general problem of enabling shared buffered
> > writes. i.e. I expect that it will not exist for long, whilst
> 
> Hi, Dave,
> 
> Yes, it's a short-term solution, but it's enough for some scenarios.
> I would also like to see better idea.
> 
> > experience tells me that adding special cases to the IO path locking
> > has a fairly high risk of unexpected regressions and/or data
> > corruption....
> 
> I can't say there is definitely no data corruption, but I haven't seen
> any new errors in xfstests.

Yeah, that's why they are "unexpected regressions" - testing looks
fine, but once it gets out into complex production workloads....

> We might need to add some assertions in the code to check for the risk
> of data corruption, not specifically for this patch, but for the current
> XFS system in general. This would help developers avoid introducing new
> bugs, similar to the lockdep tool.

I'm not sure what you invisage here or what problems you think we
might be able to catch - can you describe what you are thinking
about here?

> > > These ideas come from previous discussions:
> > > https://lore.kernel.org/all/953b0499-5832-49dc-8580-436cf625db8c@163.com/
> > 
> > In my spare time I've been looking at using the two state lock from
> > bcachefs for this because it looks to provide a general solution to
> > the issue of concurrent buffered writes.
> 
> In fact, I have tried the two state lock, and it does work quite well.
> However, I noticed some performance degradation in single-threaded
> scenarios in UnixBench (I'm not sure if it's caused by the memory
> barrier).

Please share the patch - I'd like to see how you implemented it and
how you solved the various lock ordering and wider IO serialisation
issues. It may be that I've overlooked something and your
implementation makes me aware of it. OTOH, I might see something in
your patch that could be improved that mitigates the regression.

> Since single-threaded bufferedio is still the primary read-write mode,
> I don't want to introduce too much impact in single-threaded scenarios.

I mostly don't care that much about small single threaded
performance regressions anywhere in XFS if there is some upside for
scalability or performance. We've always traded off single threaded
performance for better concurrency and/or scalability in XFS (right
from the initial design choices way back in the early 1990s), so I
don't see why we'd treat a significant improvement in buffered IO
concurrency any differently.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
