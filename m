Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037484EB51
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899864; cv=none; b=AVGOLPlP8y3gfzqbQ4VSwx3816y7BfOOzYWZaqIkHcu92qeYilebxAPQIaOkFjpm/Z9liDruhuCi0zw9Sse5nntGUOhSNSDsm6pRrxOT8R350h92iEh6LH8ShUG6WA4gCGHnKwFs9G3rRyqU8UdZehMMCWEdPT9nn1kD8sWy+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899864; c=relaxed/simple;
	bh=ZU+PG5g5mPdh+pgeZYBnmun0CnZ8rrBs+19fl52+G+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAQ/pe/EdeHwLcMpyMQS6ERJ0NuZHcsfNWmvvTZ5SNqtbyuKSfSdXvg7yPjb2O+FkzIU9qIYdz4dUaBtQHjS0upxAOayrrkHOdqFkAO9NBtq9UYboMz9qqfjDYGB2uuK+eTuYU1fWQHPQfxpHfCE4/zFWSe1C1Uc4ttPpzxprsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2660968C4E; Fri,  7 Feb 2025 04:44:11 +0100 (CET)
Date: Fri, 7 Feb 2025 04:44:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
Message-ID: <20250207034410.GA4596@lst.de>
References: <20250206175114.1974171-1-bvanassche@acm.org> <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 06, 2025 at 07:20:33PM +0100, Marco Elver wrote:
> Combining approach #1 and #2 may somehow be possible, but it is
> currently eluding me. Clearly, based on the bugs that Bart found, some
> way to do tree-wide analysis is very useful!
> One idea was to have "capability-selective tree-wide analysis" (such
> as mutex only) be controllable via a Kconfig option - the
> implementation of that (without excessive ifdefs sprinkled
> everywhere), however, most likely requires compiler support.
> 
> Depending on the feedback that results from these RFCs, I think we
> will be able to plan better which direction things should go.

Opt-in just means some code will never get it.  So I think we'll
need to eventually force all the useful capabilities everywhere.

Doing that step by step by opt-in/opt-out for early adopters sounds
fine.

