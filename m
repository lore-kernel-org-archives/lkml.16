Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1071F2367
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379160; cv=none; b=t9i9HHMb5rJ2s17bn9NG2PSPTJ0WS8bVdklNtGU2tb+J8uQe56G/qt4+cYWVhSifGShUKYcZOOylPsrk7FomfjKTal1aa//nmLwaIOgR4/4Al+xSfB0T04WRUDzQ4W6yj+uIJdpGzNPNA6sIueEyI6iO1lhO7jKxfqbjeVLDYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379160; c=relaxed/simple;
	bh=0EhzynUQSHcwHPsq9OLq2/pVpubzU07LM1zxqs9Lpb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVpwVhbwnRMOcjPOnZVi45Et22ohtNjXRSY4Nrbyrj/Z8/Tes8kR2O189NJzyaUs6m+e6jOLeOkgncNs/5l1ZT9Cst6LNxj/k76JW9selDIF8rFvIaPFJSDgRwKTZocACGlTidVTa5bv8r+Bgk6pBWUjb4GRrGFNPS1kvapd1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=OaXkVdfs; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="OaXkVdfs"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4767e969b94so32960021cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744379155; x=1744983955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zxmmu2NCRuHQ/p0IZo4CKnrYoaf6gi4nt3+l5uXITBc=;
        b=OaXkVdfsaUu7dWQMnD7pOB9WpShE8bSbkIE4HRihDzFy0pDDU+LcjbahK/rAYtVcTQ
         isME3eT2yHX3uvCpJ7qfCcdZV03H0QtJp9Pp+++lSYBu04FE4w74bzEA/vzRyHWSj97H
         8JgCkBGEWH09wNIqDVTo+Y6Mn90xOdL2i6ni/34Y/ubM+pBq8PuuOHJ/TZn9/Wn95rcT
         a2xbkDiYwXItnM5q181KZzqdXnLvhUQSWFP45T8h8qCqYUjFIsje6JZ3MrG5w7OOZKe4
         RAmc/1JbP1KEg10Rm9XGi+z+7I57QqTK5L6p8OM7v6o34ONtSLFPs4Ann605OUwm+d6b
         4wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379155; x=1744983955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zxmmu2NCRuHQ/p0IZo4CKnrYoaf6gi4nt3+l5uXITBc=;
        b=bcP4Ani4RiIN1JKiV21vH7E++84gYtVPDTFr9L4FRsOwDspGH4C9ek63GQvsjZJ+TT
         BSVfrSz/f5ZsNEocQuUjuMIg9k+XgkR53U2LGY3GiV7gs+JBrgWWDXNdhb9DXL32uGWq
         BCXBGhKGhnvowWUcQ+AyclHXMhva7yc5Zr+Bs2BqE0wHgTEgH8WbbMoM38olCt/g2W8P
         id6Vu8cjUD21XhWv9VKYN8NjMeXqCUGLv4mYis3O/3kYAqJvMvaBa1wWgNdKbQrATl9Q
         LaOOd25V6IW0nBhAa6wswoerj1qPbTzvpYTvZd72xhPCCzX9u5GtmtM4sBB3cncA89H4
         2hOg==
X-Forwarded-Encrypted: i=1; AJvYcCWLmPldJYTWGxxUh8a/OnJP/OXmCvJ1Np6TCRzoJU+KZG3AfT6BqA/0NJ285RYvYXmptwxx7faAVPuudGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU9RO7vax3bx6XXmjKlbqWIf8Ba5dUqY3rEfWubAeyJCIHsKJ
	7FuLN87skTFttq7tEiLIoQaA3tvh3uTp+7v/ftLGej06KpdKRBAx+i/q+t+RBUg=
X-Gm-Gg: ASbGncvMjVHQEgdIdoBP+Ni8+DencazShrugSTpoAYWyQrDrXUkYOGexm7FYW/LFo1S
	rEJ8zyegNg9cZQbSgwXo4oJqTe7FVUXFkUh7WtxFM9emdgsqd+AbcRNdvRwGSOeinCeqaBwXbGo
	6+LIEpkPrv8J1/swJsuY5VSxnSGa8f+OeUUhi/snUbmwpyMXObqLkilJ+/7pZR4wpDDelqbKGED
	4f1/dOglAO4c24ePQORpOkFMl6eUM4tRGIUhoYlXLG9sW2O7sbsEczaN0869ahOTCsQyJhGVZiA
	JevsJOpggbkdcJ8CXK/jRq8r49H7uSrcSQgYmqM=
X-Google-Smtp-Source: AGHT+IHocieVa/GLTrNp8bq2cpL9Zyfxy3zMjOWH8Uc94+yoMWWfQgNkIoyy9EBomrM62q71TWWrWQ==
X-Received: by 2002:ac8:5992:0:b0:476:91f1:9de with SMTP id d75a77b69052e-479775e95afmr32144771cf.47.1744379155606;
        Fri, 11 Apr 2025 06:45:55 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796edc1c1esm25559621cf.68.2025.04.11.06.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:45:54 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:45:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mel Gorman <mgorman@techsingularity.net>,
	Carlos Song <carlos.song@nxp.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
Message-ID: <20250411134550.GB366747@cmpxchg.org>
References: <20250407180154.63348-1-hannes@cmpxchg.org>
 <20250407180154.63348-2-hannes@cmpxchg.org>
 <D930DO9PAJR8.SOYZSGRG5Y2O@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D930DO9PAJR8.SOYZSGRG5Y2O@google.com>

On Thu, Apr 10, 2025 at 01:55:27PM +0000, Brendan Jackman wrote:
> On Mon Apr 7, 2025 at 6:01 PM UTC, Johannes Weiner wrote:
> > find_suitable_fallback() is not as efficient as it could be, and
> > somewhat difficult to follow.
> >
> > 1. should_try_claim_block() is a loop invariant. There is no point in
> >    checking fallback areas if the caller is interested in claimable
> >    blocks but the order and the migratetype don't allow for that.
> >
> > 2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
> >    have to run those tests.
> >
> > Different callers want different things from this helper:
> >
> > 1. __compact_finished() scans orders up until it finds a claimable block
> > 2. __rmqueue_claim() scans orders down as long as blocks are claimable
> > 3. __rmqueue_steal() doesn't care about claimability at all
> >
> > Move should_try_claim_block() out of the loop. Only test it for the
> > two callers who care in the first place. Distinguish "no blocks" from
> > "order + mt are not claimable" in the return value; __rmqueue_claim()
> > can stop once order becomes unclaimable, __compact_finished() can keep
> > advancing until order becomes claimable.
> 
> Nice!
> 
> My initial thought was: now we can drop the boolean arg and just have
> the callers who care about claimability just call
> should_try_claim_block() themselves. Then we can also get rid of the
> magic -2 return value and find_suitable_fallback() becomes a pretty
> obvious function.
> 
> I think it's a win on balance but it does make more verbosity at the
> callsites, and an extra interface between page_alloc.c and compaction.c
> So maybe it's a wash, maybe you already considered it and decided you
> don't prefer it.
> 
> So, LGTM either way, I will attempt to attach the optional additional
> patch for your perusal, hopefully without molesting the mail encoding
> this time...
> 
> Reviewed-by: Brendan Jackman <jackmanb@google.com>

Thanks!

> From 25f77012674db95354fb2496bc89954b8f8b4e6c Mon Sep 17 00:00:00 2001
> From: Brendan Jackman <jackmanb@google.com>
> Date: Thu, 10 Apr 2025 13:22:58 +0000
> Subject: [PATCH] mm: page_alloc: Split up find_suitable_fallback()
> 
> Now that it's been simplified, it's clear that the bool arg isn't
> needed, callers can just use should_try_claim_block(). Once that logic
> is stripped out, the function becomes very obvious and can get a more
> straightforward name and comment.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  mm/compaction.c |  3 ++-
>  mm/internal.h   |  5 +++--
>  mm/page_alloc.c | 33 +++++++++++++--------------------
>  3 files changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 39a4d178dff3c..d735c22e71029 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2363,7 +2363,8 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  		 * Job done if allocation would steal freepages from
>  		 * other migratetype buddy lists.
>  		 */
> -		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
> +		if (should_try_claim_block(order, migratetype) &&
> +		    find_fallback_migratetype(area, order, migratetype) >= 0)

So I agree with pushing the test into the callers. However, I think
the name "should_try_claim_block()" is not great for this. It makes
sense in the alloc/fallback path, but compaction here doesn't claim
anything. It just wants to know if this order + migratetype is
eligible under block claiming rules.

IMO this would be more readable with the old terminology:

		if (can_claim_block(order, migratetype) &&
		    find_fallback_migratetype(area, order, migratetype) >= 0)
