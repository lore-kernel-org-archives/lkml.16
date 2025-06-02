Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32221DE4C2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748900775; cv=none; b=bYI20CKqJ1j5jDvgOAb8k4VySQGLyJq3+3VlhwJfOPt0ued1W965ZUAJbrSNVH8vhsn4unma0fgd6PYSpCY3atHRvpR/OJou0jfxDZPaYXA/hTnrAjXCjB3A2u4Y0JguCTJJKoayIAx07kuNmi3Uk+r2uuIGGwP/U91GLDTxHx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748900775; c=relaxed/simple;
	bh=i03a0gEOQ8sqo+TjLK80otPzRQn4e7S2y/MwwvPRNyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLVVGU5VDWP5ABfClJkY/skWrTy3nLjrre2o+/s8+pBrQtSEqKMQhp0JBdg5X+vWp/vNz2TxFd0soPyRi4bCnsOShh35vKCDWwpgDJL9SSIwB7RCaevDn0EwUtjTrbBzCM/fz+quSmKCXthwCsXEM4eepb3b75UCAcsJ4dwvIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AMU+1Akq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AMU+1Akq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lT+HRH6QjA3KSvp9CsIpP+VPy5730b4IvOKtxzXqYYo=; b=AMU+1Akq47fj1ahARZP3lorMYz
	gWxiVTs6Gvro4V9kQJXk4/9MHRbERwQvbyl/BefO0s0ZYNLRV3zP4PW9ulQfscoy3qNReqTY+fWE5
	slzaFDleE+84bdBoXQ160bL6WB6fZMkeLb4SndAnkGr7RrjRhbwzyVwf/hfnnNeS1/subsXHe3KmD
	C6Q8S3BOPqcu+oDkyR9K9c/OUhE/ezjs45tQT7YgrKno+gPB9QahsInL8rb9rnv28Z/KO5w7KzFxH
	UlMttkqs00HjM0/Tw/r/Jv++3EibKYhYOLAxeHbvoMASU6I0Cd+WtQguOkrKWy2tX9TRMcHAgLfDr
	o6d0XJ7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCyu-00000001MIc-0oeF;
	Mon, 02 Jun 2025 21:46:08 +0000
Date: Mon, 2 Jun 2025 22:46:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <aD4boBrdZXtz_5kL@casper.infradead.org>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602171458.7ceabb1c@gandalf.local.home>

On Mon, Jun 02, 2025 at 05:14:58PM -0400, Steven Rostedt wrote:
> On Mon, 2 Jun 2025 17:05:00 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > When CONFIG_SHMEM is not set, the following compiler error occurs:
> > 
> > ld: vmlinux.o: in function `ttm_backup_backup_page':
> 
> I'm not sure this is the right fix or not.

> > +int shmem_writeout(struct folio *folio, struct writeback_control *wbc)
> > +{
> > +	return 0;
> 
> Perhaps this should return:
> 
> 	return swap_writeout(folio, wbc);

I don't think so.  ttm_backup_backup_page() gets its page from:

        to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
...
                ret = shmem_writeout(to_folio, &wbc);

and if you look at the implementation of shmem_read_folio_gfp() does:

#else
        /*
         * The tiny !SHMEM case uses ramfs without swap
         */
        return mapping_read_folio_gfp(mapping, index, gfp);
#endif

so I would say that if anybody is actually using it this way (and 99%
chance they're not), they literally cannot write back the folio.  So
I think your initial patch is fine.
