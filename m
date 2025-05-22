Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBBE2505D8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900562; cv=none; b=WYs0rXD9YR3RBkXyJAHJb83VSz80KempKvJeseruhhINYfhkfzboq/QpGNQ6DmQ0qBHpN7JCCToTrACGnDCAmzOIlvIanx687P2Q70VwcvgPFulDqIqKmFdMNCoy6RN81RrtpUyiho55VIwPGpcjFRVSeQAf31vxR8CktDav8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900562; c=relaxed/simple;
	bh=Y0bZYcvF9+9lkjpYmSvsSDY9TlAaGUiBHyHcnL0xFa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwDFTXpHcFY9eZ1u1+ObRFYUooHqCy5vUm/o0dpbvKn4g9dBDptMuad85+lJKi7UMwxPpgq3CClJoHUE6VRfpUaY7igHot6DwBd0eceFF+Z1ydwjqUqp7w4Mp+GXv0PXnVRdUtGI4FKb2tUp3MtoLlMYLAGxPBYnEDmqp/O395M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dVCtjV+Q; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dVCtjV+Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EousAwX9Gy0M7mH5mXeFXdv8f2FFIrnywnmZSDBYFhQ=; b=dVCtjV+QTuO0vMFK243xaj1Kye
	ypCyVNHWmPZldy6NwFeX4t3GiN+OnOU8hShrZZdhRcmIjZg210SlCn9m5mLD1+8KQ1CvY/hA6zHoD
	HcDD01KMxHbFrPdwkwMbI6tAJ4vqkDTDAnMAJJAkoyJENiPgUlJ8jFCWB2GwKfIwjen0ZqdpfqgCf
	t0E8f4+L/OXDXSGL2QLv8CV31KeJXuy2jXAdJKgDCjC9fyBM4otO1OLTHnbZQBBhE0ENqcLuiGYFn
	1NVw6uoAHn2qyk2Pj9ov0VvnmNoBFhJWk9dGufflMQGpwC8xaTwi9ESQ3iIjrTnjQolYBr54Lk5CK
	u3Ku8lGw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0mP-00000005noY-3X9f;
	Thu, 22 May 2025 07:55:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 561CC30035E; Thu, 22 May 2025 09:55:53 +0200 (CEST)
Date: Thu, 22 May 2025 09:55:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250522075553.GG24938@noisy.programming.kicks-ass.net>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
 <874ixernra.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ixernra.ffs@tglx>

On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:

>    4) Drivers having access to CPUID is just wrong. We've had issues
>       with that in the past because drivers evaluated CPUID themself and
>       missed that the core code had stuff disabled.

I had this patch that read the module instructions and failed loading if
they used 'fancy' instructions. Do you want me to revive that?


