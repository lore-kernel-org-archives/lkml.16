Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102AB28A3F0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289880; cv=none; b=XLJZBRtD3Xmo4ZGAUQW7bi+ioKY1LK4YxBUj1BDwuAihtb/vOYC/MG4MvPbzKVs0kT2kKGP0+8ieQQVox8JWmGkylg9MJU3Msreu/R9+L1K10RsazNwxbJH7Xgga7xrl3RSA3QG+JkFH0V5NPfQ4vWVb1nn6r77/Gsn/U1zmxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289880; c=relaxed/simple;
	bh=D+Vr0VCPWIG76NyAnF/sMsuey2NRvnnYUaaao0Kcngw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4+lpc391CYu+LC8DIkWci3KFuWfVRhRj8GAkKAYwLKO4uPrGp64nNaYL/cCAr207D4N78gen087+kAQWQ7uuFLq/gS6qnRkEBj8FoIA8szRXduFlCFaFhTX+rBq/eFRVqEOshoV6mWYGk1aDbVvfXm/aLwp5j6JQSxemauUfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Oz+I5Qxt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Oz+I5Qxt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9GwMK9x3WCABBjFntvv4h6YF1K7aGQmmIuj9afQXVmg=; b=Oz+I5Qxtd5kC1eLWYuumnE68nC
	NETlXJLUClWA9ZirIw6mm3OLXTCJ3NrCH5RtdZnJCssSt1aSQdqSl9AOesrkiCB2r3AwU623CzDWI
	n+SrD5Xui1DPNPaBpjJmbpFK2xf7fjGsFE0s3ZnA85hazVKSUbQ3w9vArgI3XfpFD4QMog7CBmRMb
	I9jK4Bw1Z583IkblmXcOvxl3kqf1JdtPGFiYKOmaklmeNfMipWpgU7nRZnIAd5khCmcGZmO3ks8eT
	MGZlQlbBpKB4Ayq4Rxco5Gu8sOoQ2csev3z0gtMyMpsj3CT0uHxfxDkA1ihmg/n/wAHH0i+TwFYT2
	33ig3kuQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rTe-00000002uD6-3XSB;
	Thu, 10 Apr 2025 12:57:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 12BB03003FA; Thu, 10 Apr 2025 14:57:55 +0200 (CEST)
Date: Thu, 10 Apr 2025 14:57:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 00/49] Simplify, reorganize and clean up the x86
 text-patching code (alternative.c)
Message-ID: <20250410125755.GC9833@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250401143115.GG5880@noisy.programming.kicks-ass.net>
 <Z_bdxrahsyB5wrg8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_bdxrahsyB5wrg8@gmail.com>

On Wed, Apr 09, 2025 at 10:51:18PM +0200, Ingo Molnar wrote:

> Anyway, any other suggestions for shorter names, or can I proceed with 
> these plus the above shortening of the trap handler name?

Sure; I suppose I can always rename some later if I get really annoyed
:-)
