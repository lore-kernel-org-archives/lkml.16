Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1AB322B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254466; cv=none; b=Tp/QrJtOBUiGxvNys58/x1fqktC4jJR5Hysp3pKB0r1zywEpZiWtBfZrnUp8EeBCNKoqioSKqgC5VvaDZ3EkXpsqlILhGjTvu7gKiY8waihjp5lL9OL0hLQZjadV6+NDAgGdvZ3Yfta+EvkxLqdfsyX66RHneLuFjmK/Z7GzJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254466; c=relaxed/simple;
	bh=q5mRAbvLjTD3zkc/Yf+QJYBO9w2oONNkEfsrJkuAtpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEyDzpzKwNPU3pPEwIazk0aKONMaIxEiiuSdsXJoi8yBKCPKv/wqP9FCRvX1VY7bZZcrVLgFyKl4tfN3EpTGBM7ORDBzm/U3C7kJHYK/ngSnAwi542EzTPaEg3MzYGeEqICDApm2qZVuMGCuO9jHuEnC+Z0T/Fc1GAbi5Mp52cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xxiOhWk5; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xxiOhWk5"
Date: Thu, 30 Jan 2025 16:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738254462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ujaI8pRfjL8nb8oaU9SuzdWjLjHuAQvmbrJdAwmlxfI=;
	b=xxiOhWk5vZkVkrGjeRv1dR8sviL3nj+1t8Lrnw2NgAETePewLAzd2si8k2b4LvCsdS7SCB
	rNHidEitfqRyhtsb2z0BU8ur3LBYEZNaN9KXU0uAQnIILnCjerskalJqribJs0SIq7ibUP
	qq1G8GEd5ZwX9se8umXuUeYBpgx15e4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 4/6] zsmalloc: introduce new object mapping API
Message-ID: <Z5uoek8UA9sFBWvj@google.com>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-5-senozhatsky@chromium.org>
 <Z5pl6OOVcb_rsgTC@google.com>
 <4slya4kbgfvkvlgkvwep2cgghs233lfhfpctfrrgvho4fpgzwr@cjp643bd4ml6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4slya4kbgfvkvlgkvwep2cgghs233lfhfpctfrrgvho4fpgzwr@cjp643bd4ml6>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 30, 2025 at 12:21:14PM +0900, Sergey Senozhatsky wrote:
> On (25/01/29 17:31), Yosry Ahmed wrote:
> > On Wed, Jan 29, 2025 at 03:43:50PM +0900, Sergey Senozhatsky wrote:
> [..]
> > > The old API will stay around until the remaining users switch
> > > to the new one.  After that we'll also remove zsmalloc per-CPU
> > > buffer and CPU hotplug handling.
> > 
> > I will propose removing zbud (in addition to z3fold) soon. If that gets
> > in then we'd only need to update zpool and zswap code to use the new
> > API. I can take care of that if you want.
> 
> Sounds like a plan.  I think I saw zbud deprecation patch (along with z3fold
> removal).  I guess you still want to keep zpool, just because it's there
> already?

Now the proposal is to remove zbud right away (patch already sent). If
this lands then our lives become easier.

I am keeping zpool around for now because it is not doing any harm, we
can remove it later. For the zbud/z3fold their presence is a problem due
to bit roting, and having to support new APIs (like this one) in them if
we want to use them unconditionally in zswap.
