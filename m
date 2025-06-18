Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6821ADCB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750284345; cv=none; b=kRNnuSenlhaA2Uul7Iktan2ng6bi72dlzRXItgxIu9W9IBjkc3tAfqE21WksD5NQfwM0NXhwbOLMW540l/ij1Rhu68on70W3LkpJGbVOcREOx/4pe5328C2+v1LeaSw2FZMY5cm4k0t3zeGsx+REf29dlnDVG573hb9b6Asqw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750284345; c=relaxed/simple;
	bh=5rW+yEzRFYI3xAPSoXYIpVxe+kLenfYFo9nAp3S3p7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jckQScuSSH7F+x78MuHM9IrKlqRTwOQA40CzeXXmp5u2PFKWgsJH0n/DkHd4KUB110zrfCiMC6M/LSlDX4xY+FkJSY3rDDoPXFOFI608trM2mRo2KDpWLklFJJug8bs6YpxRQA9h8G+2UWd+8owHAw5HoQ6wDTvpJFwB8I8TK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qEZl4+Qx; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qEZl4+Qx"
Date: Wed, 18 Jun 2025 18:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750284341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PE2DkpVsnMSMwHSwMo0XH+9GhyNn27nNW7R4KOJ/9vI=;
	b=qEZl4+Qx+IpgfUEK0yJKqTW+j3yJXYiRb3nHn8pf134PuuPnwKlmqUzSe28SzyoHBlyXDT
	WTacvxtt6C/NOlM5PfjrshFo0agZqAB2dHQeGVBgTU6Dl4jmtdD7GlHWhioNfhQQgZQWKC
	aIFOGmhgdL5wvebglcUR12mxO5hA9oQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [GIT PULL] Crypto library fixes for v6.16-rc3
Message-ID: <dmkpj6q5mjw3bet6orkhcxtxwof4gufxknbroyfuwzrzcmdru6@4dmuaznfvkvz>
References: <20250618194958.GA1312@sol>
 <w3t36hsxocm3uotbhnonsioomnvkqpmazctyogmx36ehlxezyz@h4vytlcacc7k>
 <20250618215918.GB1639822@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618215918.GB1639822@google.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 18, 2025 at 09:59:18PM +0000, Eric Biggers wrote:
> On Wed, Jun 18, 2025 at 05:40:27PM -0400, Kent Overstreet wrote:
> > On Wed, Jun 18, 2025 at 12:49:58PM -0700, Eric Biggers wrote:
> > > The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> > > 
> > >   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus
> > > 
> > > for you to fetch changes up to 9d4204a8106fe7dc80e3f2e440c8f2ba1ba47319:
> > > 
> > >   lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch() (2025-06-16 12:51:34 -0700)
> > > 
> > > ----------------------------------------------------------------
> > > 
> > > - Fix a regression in the arm64 Poly1305 code
> > 
> > Some more tests too, perhaps? :)
> > 
> > This was a bit of a scary one, since poly1305 was returning an
> > inconsistent result, not total garbage. Meaning most of the tests
> > passed, but fortunately the migrate tests read data written by userspace
> > with a different library.
> 
> Yep, I have a KUnit test for Poly1305 planned.  Actually, I already wrote a
> preliminary one and used it to test this patch.  I just haven't sent it out for
> review quite yet, since so far it's just a one-off test that isn't too complete,
> and I'm not satisfied with it quite yet.  I'd like to reuse the
> hash-test-template.h I'm adding for SHA-2
> (https://lore.kernel.org/linux-crypto/20250616014019.415791-5-ebiggers@kernel.org/)
> which would result in a more complete test.  I'd also like to include tests for
> some of the overflow cases that are specific to Poly1305.
> 
> So we're kind of still in an early stage where we're defining what the KUnit
> testing for lib/crypto/ is going to look like.  I am working on it, though!

I do a little dance any time someeone says something like that about
testing. Bravo :)

(And now, back to sifting through the rest of the rc1 breakage.)
