Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1A1802DD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738900432; cv=none; b=nYxzrLWL9kdHD3vFh1RqLaJS2O6gwtUK1u8y5qo4xAFWMVO4+nGwpsqk0H2itobwA7CBa7T9y6N5cDtGWYjfQm14CGDH3e8tCjwjLbXVJ86XD7a+uf4ha8NfzUbTOUf6ki6UOc7eTdGXZ0J9mvxGrX4vmRHnjmE0CiPNTalIghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738900432; c=relaxed/simple;
	bh=MhrFzLJadTvCRdmE1l5Ye055TrBLjI/R3DJ1O1jO1pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snZY8jhkHEmD7l0en2ZO5KFZzrTkzfaE6RzolYk0poCS81YimaFKrRWb9bAxEKH1Ml4BXcaE5ntagNwmhjMZYPrCCgmu0Gf13J4S6XLwfc8FVzsh6KIQO6hjIXBR29CG+cM2+g6S8nZhuQIRqLi1vKqsBxy5+Lg3Ace7fxHtcEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DCEB668C4E; Fri,  7 Feb 2025 04:53:45 +0100 (CET)
Date: Fri, 7 Feb 2025 04:53:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
Message-ID: <20250207035345.GA4920@lst.de>
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-4-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206175114.1974171-4-bvanassche@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> - a struct that represents a synchronization object is annotated with the
>   CAPABILITY() attribute,
> - the operations on that synchronization object are annotated with the
>   ACQUIRE() and RELEASE() attributes,
> - if variables or members that should be guarded by a synchronization
>   object are annotated with GUARDED_BY(),

Those are all nasty shouting names, without and good prefixing.

But more importantly ACQUIRE() and RELEASE() seems to duplicate the
existing __acquires/__releases annotations from sparse.  We really need
to find away to unify them instead of duplicating the annotations.

