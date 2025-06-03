Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5722F767
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748967994; cv=none; b=CuqOzqblz4zaA1skbw1ot3sP82t1eOl8fAN1c7xSNbG9O2/+kuZMKOhwElMXt5lJ2c+PUbEY2jZW1TDu9PalMYgQoBtFeATrg2CE1ZbauUSS2uWuLNf1Jrl/QpGB43J/xHILdTo2g8ddC98cwqrh17DAM/4E0dJNFwscuPE3Xj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748967994; c=relaxed/simple;
	bh=XQFcO3jIuCEkwzcGxloMRedKwseZRSde/x3nuNgygxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkV72cZF9+AgpMoNzrz6DiqJlRLkuuJ4xGsgHw/RVADawjoTR94/351BCenVdz8EvGSvY6KocJyvRy2H56CuwEGQ4+SEa7GiaZ3UTSW37SNTts5xDKbi+PLXZBtbX3cVQvtVuuvw7nbX1Igh2GJ7rzphu0EzPslUFRw2a0UCMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CjRi43v6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CjRi43v6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QPPrwqg5OcGBBj5PDZHknLOshRuGX/IFFD7vuMwN2tk=; b=CjRi43v614ygXQkn/RTTOm6PUs
	aEel1RoXmFPzwpGYLGeiKWTqL+NOy8yAGPXJFEfWSQHrQh1qcI2/4gmg0ZZuzoRxt+mW4HS7J88Py
	DhPwFCRVV36qf7Bg4B/WsWLHEGmsJTZfSZ6qefBvOFG8+0k0QtWlTPUvefD6saLHs8QKbYWYIVWyz
	aAywkOQP2hoK+ZTL9Us56g0ySHspxVItqdscnMU3fH0LWpmskY4ZRDcHSCWaqpLickCoZWEthKH/R
	UW5+BBZRPPofiWW8ZF4bjuCKbzpITWVaS472IRuek88LJb2kUPXnk3OJSiqmMSBnLQcnTlCGpUaY5
	aihhVCEw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUT1-00000002DcX-44uI;
	Tue, 03 Jun 2025 16:26:24 +0000
Date: Tue, 3 Jun 2025 17:26:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Hugh Dickins <hughd@google.com>, LKML <linux-kernel@vger.kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <aD8iL4cFoXpIVK_0@casper.infradead.org>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603102959.20c85adb@gandalf.local.home>

On Tue, Jun 03, 2025 at 10:29:59AM -0400, Steven Rostedt wrote:
> On Tue, 3 Jun 2025 01:02:36 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> 
> > Agreed that ramfs does not use swap, so calling swap_writepage() would
> > be weird.  But, thanks for the build fix Steve, but it cannot be right
> > because return 0 says shmem_writeout() successfully sent the page to
> > swap, and that has unlocked the page (or soon will do so).  It should
> > return an error (-ENXIO?), but I haven't checked what the callers do with
> 
> Yeah, I figured it should return an error, but looking at the code I
> couldn't figure out what the proper error would be. Then I also noticed
> that the other stub functions just returned zero so I did the same.
> 
> Perhaps add a WARN_ON_ONCE() if it is called without CONFIG_SHMEM configured?

Or just make this module depend on SHMEM?  I don't think it makes much
sense to use it without being able to swap, and shmem can't swap ...
