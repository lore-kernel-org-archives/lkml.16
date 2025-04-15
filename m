Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036817A317
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728548; cv=none; b=ooEqYJqH+Bvbgzk33bOFsvGXDs8AWF9FuMpOboY2/IdIEr0f9u7NVDYbBHyAH6TzpG2ZfK7WfQABTpHW2oj3+spZJKjY5JbBmVe048KxLrg5Rl91QMNi5Vu1e2GbOD6fPWgCdWOdAUaiEY10x1nTpM7HtTf0U7biTyuyN4cQyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728548; c=relaxed/simple;
	bh=zub2iEdzPRv/a4C2MehFMsAWUA/E8tJ2htu/opwciYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtHtBOT1U3t58zDqk1qyLkR0RzKbqt0nIJn3blRfFXs+D5ezgmW5/pEB8zXulII/K+j2/b+xT78mHmO5+Ho51S45G16xrDDD6PRyATdfXI2hvO/92MEstatpQJ09Hf50oATWPLfMwnf/xkLQt+pFy0TnEedw0zmKB/1yWdBRNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WsmZ/g5E; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WsmZ/g5E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z6zqpjvrpHaEuoOIAvXqb+IXZCwa5Y1OzBBKDHbviBE=; b=WsmZ/g5E8Ve0mMFJqgN9hR9FX/
	zOt7HOpjok6vlr/dhjqp4XTHq9/CWDJRqwZPahbUQYUq91oAPQUm9xWaEo9N8IG/gVTHQXSeTjNb2
	ZDnz4h6QI/EiGQ8y5tUxQ5Jl42ZVe16GlybHzdIEzkCu7+LGGe7WNvNEleO3Hb5ZFEnH14kjNDTTy
	ETWT1BXCmc14NkSFfA2VBff9ENclv45FacfOurawvlCiVcCsb5ZryAruOMYBPK26h0eKG9Pvwug16
	7EkwldAkkLS2orTtsjQMT8wqOXGQ/6u21fmNaSTlminNZsBYp3AR4wc90AEh1YG9sLUT6Svp2+Qz1
	3h3BQ4Cw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hau-00000008hNT-3vc4;
	Tue, 15 Apr 2025 14:49:00 +0000
Date: Tue, 15 Apr 2025 15:49:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: gaoxu <gaoxu2@honor.com>
Cc: Barry Song <21cnbao@gmail.com>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	yipengxiang <yipengxiang@honor.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
Message-ID: <Z_5x3AwzTWeBXoZB@casper.infradead.org>
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
 <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
 <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
 <CAGsJ_4xDc_5q8dBYVq-Ga0iKJD9pTQdYSHrKw8R=1RHNb4+r7Q@mail.gmail.com>
 <c915776e308f49e7867ecb50afa44d36@honor.com>
 <CAGsJ_4x+5Pm6r655k+H9A67-d9AchD9qgsEKgU5oY6N1=JbTRA@mail.gmail.com>
 <Z_xGzAx13diuCdvv@casper.infradead.org>
 <b2bde1ca046949599d74cb9e88c21ba3@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2bde1ca046949599d74cb9e88c21ba3@honor.com>

On Tue, Apr 15, 2025 at 12:34:27PM +0000, gaoxu wrote:
> > Growing it doesn't feel like a big deal.  Although "saves two assembly
> > instructions" is also not exactly a big win.  If it saved a cacheline reference,
> > that might be more interesting, but it seems like it's more likely to introduce a
> > cacheline reference than save one.  Maybe just not worth doing?
> 
> Zone, zone_pgdat, and node_zones are all considered hot data; most of the time,
> they reside in the cache. In contrast, zone_idx in the patch is not hot data,
> and executing ((zone)->zone_idx) will add a new cache line.
> Am I understanding this correctly?

CPUs are not limited in the number of instructions they can execute today.
For example the ARM X4 can execute 8 instructions per clock.  Most of
the time most of the CPU is idle, waiting on cache misses.  A cache
miss (all the way to memory) is about 100ns, so if said CPU is clocked
at 3.4GHz, that's 2700 instructions that could be executed instead of
waiting for that cacheline.  Other top-end CPUs have similar numbers;
you can find weak CPUs out there which have smaller ratios, but we don't
tend to optimise for low-end CPUs.

Therefore it is more important to avoid cacheline misses than it is to
reduce the number of instructions executed.  You haven't measured any
improvement from your patch, so I think we should defaut to not
changing anything.
