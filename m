Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA567DA8C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917750; cv=none; b=Em+2PdxZqrCIDvNLt1LZExK//Z0nMeZDZOi7dix84xah+YlHN59W5NRz4Jyn9kGWkfQyZCZoOu9DRB1/h2PStMCwdM//BkewFORbs/D9PXEFLVN9r4YZX55e+TWlZfsY+Ir9tpWn391ybqyYoSpKoDQPSijpVL9+H5ZuzV8ss4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917750; c=relaxed/simple;
	bh=iAGg+xg2NUc+XRQTdP8eZB9hG7Zo+bVCCheptZzR+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BM+Qa2r1lPFkIatzvSmhmDVxPuGgWUC/AUpIl8AZPBZPr16uNNjn8qmwT+tZ0McTSRiUI7OxSQh/mVPdFaBzkcWaJsYIf68F3GgEBNhhRyfgGqxE/27OV80AvIhRNhlYl0IJSeEZjzVzo8yoePgurQB8dDCKzjeKoePfc8yUajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ch7ermET; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ch7ermET"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wvpxhV55yXnqli8nVFJQuB8+/LifzLEAkA2f7vVo5k4=; b=Ch7ermETZypyd2lq3zVr6SEvTB
	FIMpP7G0FYB9nSHAY3Jch1QSzrOA6ETecO88HNvUryqaGqHytgPjlFZkWzlm/BqMFvL32D0CaYR8U
	bYSrLVrAIIlOlubtj9ineylquyzypHAXIeO/KJesD6gYToOHN+kyXrk1JnDGmVGdeTGHEVO2STEdk
	WuY/gnNOgxeJkxzllhhOe4bEALMTSTLN2USzAxEQiOyF3qXPJoBPsxIRR22j+k72zjltABWnPEIKu
	TZLImkmyTDnKb3ZOrSDcu6ysL9CWyu3ulPPZD+eAu5J8gwqdio/l2OKFcd9ayqGv5JPYQcfP7Cilq
	eEmEsxWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJwO-00000007VHN-22Bv;
	Fri, 07 Feb 2025 08:42:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 03433300310; Fri,  7 Feb 2025 09:42:24 +0100 (CET)
Date: Fri, 7 Feb 2025 09:42:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
Message-ID: <20250207084223.GX7145@noisy.programming.kicks-ass.net>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>

On Thu, Feb 06, 2025 at 10:34:09AM -0800, Bart Van Assche wrote:

> I'm looking forward to the feedback from others about what their opinion
> is about how to enable thread-safety checking in the Linux kernel.

So Bart's patches are rather SHOUTING A LOT:-(, which I find really
jarring to look at.

Also, however much I despise the sparse thing, that is something we
already have some of, so we might as well adapt that.

But I should probably go read up on the whole clang feature first. 

I've seen both have a __guarded_by() variant for structure members, can
you stack those?

Eg. perf has locking where a structure has both a raw_spinlock_t and a
mutex and modification requires holding both, but holding either is
sufficient for reading.

