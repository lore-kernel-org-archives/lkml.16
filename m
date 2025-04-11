Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9722A7F1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391246; cv=none; b=KyWJ92pSd+u37Oomvy7ezgtM0uNjH7Mgx6EGHl+xDuKl2YtBp0CCNbRchPt3peSpnZUKEYPJC6WmOHrbvOJS0onwGBWRRTjknaB2Jekb8s1okmkrVlK+zPkp6eBK1nWq1ftye+tyf/4eDvRI/06hMHWTK/VMYISOg3TVRAuIQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391246; c=relaxed/simple;
	bh=rmJ7BOjIGD3wfL4v8J1rVlD5TycBAbQ+hAVg1our8b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDwAOHKKrybuGwcFWi6O7G657w0XVixagqhaVLyl0cUa1QZ7vqGs0sD9xsoNS7Q5Rr92uPy0VKN8BocwFJXNrZ5mHSMvW2qU4w3g0ue5416wbQPW3+ygSyPHRXI4861GciCOFlcvKvL4yZlO0xmfdIDMD/DSc7SgZORgNiArxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=OCeAP7jQ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="OCeAP7jQ"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e904f53151so18883026d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744391242; x=1744996042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4v9z21z7lBh3l66WJPk9k529wTJWXA4RrUGU7K5I9E=;
        b=OCeAP7jQcKkCrWBO5zmZL+S4MddL/AtzjrCt5268pVASj3NreXcmHS1f7l24+CngUp
         NL/pxnlgIoDidDzG1mXNCjV9ka3NfXb9oBj3+2CW7kSFO+5+gfZKXwokqcPbgKFhuOhA
         TkeoawmbVGYxXcMsW/7slpHonmCNKMPDO/he+kI+IEu7XO8wTgrxiOt0Zin1NSa3kkjf
         N31ZPmmTUj72pJNUnASESujRCMFxNrB87FTwnNHY6s6rw2N94nesDIORPykHdpfK0f1n
         4S1VdK9QgIYWXnbk81FDCL0+nbHp0RGQ9mV6eUHdby1B0VKfJ6Q1CeqIFARDQ4g4GirG
         W0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391242; x=1744996042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4v9z21z7lBh3l66WJPk9k529wTJWXA4RrUGU7K5I9E=;
        b=fiDxgLpEVhVwHPd5TeJABlRmRpYIbIMs+EOkBIVo4/7L7SvAVtc9qgPRCoE0Tl5z3Z
         eaByaRdaJ7DRy7AYoSLrNOZcb3lYxL8s5koo9DLISTakLfTABSIITF2b3ugH1DTJIoNi
         NfG4Hju49GLT7ivXAsNnAWwjJonAUEQB+XiSOqQ8ZM52MA4uexS4Koem/Nk85UMZfnZe
         NGj+TKQ1FOQealazxey5ta6FxTMT53TGQXFTc/PEkXu4eWQ694CRG7fMe9b4SvL7b6j2
         5tFTQocZ4jWy+CMyrBLssVLjnisHv4sRTCpz4KY57VwJOWldacJHaN2w6kykpRBlarLH
         8B4A==
X-Forwarded-Encrypted: i=1; AJvYcCVjrLeJrXAS6OuWb/yUk3tZMFpTXiu276fiBJaMJl9bHSsSM5GMl3WE3A3Ysot2H2UWPbq+Tlhs+mJqwvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkFYc2UHHLMsBRVvCj66U1pHaur/qn40p9TMCgJCXsyYdOF3h
	Op1ezm/avpoII/C002EwFpYaqhlVpfovDLEeE0KMygFz5qugeYl8ibilDZksIcY=
X-Gm-Gg: ASbGncvxnLXsFGKdtUZ29wAWUCwlxWZImbwQnwQwVyqnslepVA4TOz8KF+BDpyGajy/
	Lk+/di3gUlHiXJeYZMwn1VrRctQiIXnMC/OPh+JlX5CZil8YXzKOM2I9xA28mPtArttLHRgAnBQ
	N21LFYf38FQZacEbz6dEGD93U/OZNpLjhX2+KTnOR6Pq1++WRAlMIfNEleBxjqCfcTrntjllqH3
	2WrwlVxJO3EHaOAZao2/vK9sOrgaE1FzhrLKzicycXzdtl4EBaOGEr72eKRrRj48Rpg+I4+0tqh
	EjIjH5JjQgmv+sKTfLYhhCaY6j4ELwRArioefNU=
X-Google-Smtp-Source: AGHT+IExtLm0SnxvmVY870oqBP7ZwmH4472cLwXwjY+7sRjxaW9zDPzJHyV2adUyH8d6z+aJoYm69g==
X-Received: by 2002:a05:6214:cc6:b0:6e4:4011:9df7 with SMTP id 6a1803df08f44-6f230d1a647mr57185266d6.16.1744391241825;
        Fri, 11 Apr 2025 10:07:21 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea101aasm38816736d6.96.2025.04.11.10.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:07:20 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:07:20 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	Carlos Song <carlos.song@nxp.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
Message-ID: <20250411170720.GD366747@cmpxchg.org>
References: <20250407180154.63348-1-hannes@cmpxchg.org>
 <20250407180154.63348-2-hannes@cmpxchg.org>
 <D930DO9PAJR8.SOYZSGRG5Y2O@google.com>
 <20250411134550.GB366747@cmpxchg.org>
 <D93WJ0HYKRGL.1NWTMXWJBWE80@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D93WJ0HYKRGL.1NWTMXWJBWE80@google.com>

On Fri, Apr 11, 2025 at 03:07:01PM +0000, Brendan Jackman wrote:
> On Fri Apr 11, 2025 at 1:45 PM UTC, Johannes Weiner wrote:
> >> -		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
> >> +		if (should_try_claim_block(order, migratetype) &&
> >> +		    find_fallback_migratetype(area, order, migratetype) >= 0)
> >
> > So I agree with pushing the test into the callers. However, I think
> > the name "should_try_claim_block()" is not great for this. It makes
> > sense in the alloc/fallback path, but compaction here doesn't claim
> > anything. It just wants to know if this order + migratetype is
> > eligible under block claiming rules.
> >
> > IMO this would be more readable with the old terminology:
> >
> > 		if (can_claim_block(order, migratetype) &&
> > 		    find_fallback_migratetype(area, order, migratetype) >= 0)
> 
> Sure, that makes sense, here's a modified version of the patch:
> 
> ---
> 
> From 85be0fca4627c5b832a3382c92b6310609e14ca4 Mon Sep 17 00:00:00 2001
> From: Brendan Jackman <jackmanb@google.com>
> Date: Thu, 10 Apr 2025 13:22:58 +0000
> Subject: [PATCH] mm: page_alloc: Split up find_suitable_fallback()
> 
> Now that it's been simplified, it's clear that the bool arg isn't
> needed, callers can just use should_try_claim_block(). Once that logic
> is stripped out, the function becomes very obvious and can get a more
> straightforward name and comment.
> 
> Since should_try_claim_block() is now exported to compaction.c, give it
> a name that makes more sense outside the context of allocation -
> should_claim_block() seems confusing in code that has no interest in
> actually claiming a block.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks!

One minor nit:

> @@ -914,8 +914,9 @@ static inline void init_cma_pageblock(struct page *page)
>  #endif
>  
>  
> -int find_suitable_fallback(struct free_area *area, unsigned int order,
> -			   int migratetype, bool claimable);
> +int find_fallback_migratetype(struct free_area *area, unsigned int order,
> +			      int migratetype);
> +bool can_claim_block(unsigned int order, int start_mt);

Switch those around to match the C file order?

(Just being extra, and this is probably a losing battle, but hey...)
