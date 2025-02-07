Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58231A8F97
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962441; cv=none; b=glKHPsU8EpK6DGdr3fmT8/Q+rk+spCzNxxanN2zYazdXdx+F9h7WAI5yAKQwmyqcd1CvsVjqzRmh6n/+r65rLemWGDclr0CmNCuFJqU76hzc2zI7We0E/ki2FXLSGScOVGhBM8lFUqXgyAfUj4zsBNUfDu7cCvsmQ/MneTdQC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962441; c=relaxed/simple;
	bh=awKtkVJy9GraxCUQ5rVtEPrYiFMPh+s4ZfeVWQEapZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0Gll7Ru+AeonzuLBNqHd8O1snde3yk+IQcTGFdBwEDZy9pMfwtsycl0Uqsa1IYTwtTzez8Mf/GfcSjzXeSwOA20/wkDvwprVLkN7XgHeM8jYi0+j7xXg8jriJpV5xtqq9rmJ9Hw5aG+XW9FUw/o5bXvZwQY/95kCBH89Ob09kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qcsVvhJo; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qcsVvhJo"
Date: Fri, 7 Feb 2025 21:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738962435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmviEOCCZ3FEayvBoB30A6/sggUbm9MiOK3KTy0XkVE=;
	b=qcsVvhJo/u937201RK+UEopjyM3wUvdWfdiDJLWQ/TGHdsmsz7PUbUecjmNK5c+LfQujmC
	SMNVqs6U2nRaVEyilFbtv2LTRObkeQWO6LS2SaL/8Ofay3BgXUbO37t9JGTyU4NQdJgpP7
	9u2+9jRFuiX33Fx08o/gp6mCxUa5o1o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kairui Song <ryncsn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <Z6Z1_XxcoBnM9E2o@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
 <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 07, 2025 at 03:12:59PM +0900, Sergey Senozhatsky wrote:
> On (25/02/07 11:56), Sergey Senozhatsky wrote:
> > struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
> > {
> >         for (;;) {
> >                 struct zcomp_strm *zstrm = raw_cpu_ptr(comp->stream);
> > 
> >                 /*
> >                  * Inspired by zswap
> >                  *
> >                  * stream is returned with ->mutex locked which prevents
> >                  * cpu_dead() from releasing this stream under us, however
> >                  * there is still a race window between raw_cpu_ptr() and
> >                  * mutex_lock(), during which we could have been migrated
> >                  * to a CPU that has already destroyed its stream.  If so
> >                  * then unlock and re-try on the current CPU.
> >                  */
> >                 mutex_lock(&zstrm->lock);
> >                 if (likely(zstrm->buffer))
> >                         return zstrm;
> >                 mutex_unlock(&zstrm->lock);
> >         }
> > }
> > 
> > void zcomp_stream_put(struct zcomp_strm *zstrm)
> > {
> >         mutex_unlock(&zstrm->lock);
> > }
> > 
> > int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
> > {
> >         struct zcomp *comp = hlist_entry(node, struct zcomp, node);
> >         struct zcomp_strm *zstrm = per_cpu_ptr(comp->stream, cpu);
> > 
> >         mutex_lock(&zstrm->lock);
> >         zcomp_strm_free(comp, zstrm);
> >         mutex_unlock(&zstrm->lock);
> >         return 0;
> > }
> 
> One downside of this is that this adds mutex to the locking graph and
> limits what zram can do.  In particular we cannot do GFP_NOIO zsmalloc
> handle allocations, because NOIO still does reclaim (doesn't reach the
> block layer) which grabs some locks internally and this looks a bit
> problematics:
> 	zram strm mutex -> zsmalloc GFP_NOIO -> reclaim
> vs
> 	reclaim -> zram strm mutex -> zsmalloc
> 
> GFP_NOWAIT allocation has lower success chances.

I assume this problem is unique to zram and not zswap because zram can
be used with normal IO (and then recurse through reclaim), while zswap
is only reachable thorugh reclaim (which cannot recurse)?
