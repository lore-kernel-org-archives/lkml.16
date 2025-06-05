Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EB01F12F8;
	Thu,  5 Jun 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151868; cv=none; b=BY/ex2O27zhC+bo2eyUudcok9wAu31zda6hc0zJRM28SYmbbS1sriqkxMIiTP6VLo4V6JPXG7JnwQlqAlT6DlcPGBXYyI1rOFVKp6JTzTNJc3RjR+a4gFbV4+czPCVPB1W2U4Tax1qHaDmkcpqcQNUxrR7shzcBR0tUr1/gSoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151868; c=relaxed/simple;
	bh=h59S5S1u9vMLMxe1jN+tUHdzOCLKBM7ZdWNtmf+wHA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhjNFltS4SRZQ4tO7Uo37MVkb7RGiJy8WAfonE+b/GdCscSDGsOB7bLcoxdy1iGYsOF8TbwIb4NzHBuRoTd0zVUTdx0Q2hQyUd95HxAq9BezBLo1gfVujpk+J33lVLalr60j7w4P1/yuMU/mS+SW3KmlW692Ac0Pier+EEbFMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sY5Eoj0z; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sY5Eoj0z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Di35m64wW7cXSvLt7vXf+4LHH6sxLrueLsuX5i2B3Dc=; b=sY5Eoj0zzo3800W15hQupxzguW
	3OeKWA1MAb5aqVpsYqqmQ+oSV0bK4dNdkw95WLRyozZEABxljokVlXhuNt0My7S113Q6P/DDHuitQ
	YFlcaoiTV40NBdWaDBzs89grTct2z8J+h6FBMrfZVkfKJTq4KrFeVYbOe8CyciRR1KHIfkEKlPuQv
	tmZ6FaxRoJr4EDl7HBEx4XnMlfDuJbV913DqjXFJGF0iydBrkJgOy5xeAc2BddhOzaN1pxdkR+zic
	qLvQtNNj/G8S0TGfxKZGc4qXJdeZ/FynqGtd8iU+x9XvGlclvDRhXNS0u34tSyeoBBmmAIOXmcvqR
	SbFXVkgA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGIp-00000004ZKc-078Y;
	Thu, 05 Jun 2025 19:31:03 +0000
Date: Thu, 5 Jun 2025 20:31:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function prototypes
Message-ID: <aEHwdoNCrF4-KY_i@casper.infradead.org>
References: <20240326054149.2121-1-rdunlap@infradead.org>
 <aEHq_Jy3hPQIzaO-@casper.infradead.org>
 <875xhaf145.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xhaf145.fsf@trenco.lwn.net>

On Thu, Jun 05, 2025 at 01:18:50PM -0600, Jonathan Corbet wrote:
> Matthew Wilcox <willy@infradead.org> writes:
> > This turns out not to be enough.  For example, krealloc() is
> > currently undocumented.  This is because we match the function name
> > in EXPORT_SYMBOL() against the function name in the comment, and they
> > don't match.  This patch restores the documentation, although only
> > for the python version of kernel-doc, and I'm pretty sure there's a
> > better way to do it (eg building it into the export_symbol* regexes).
> > I can turn this into a proper patch if this is the way to go, but for
> > now it's just to illustrate the problem.
> 
> FWIW, I have no problem with leaving the perl version behind, I expect
> we'll drop it in 6.17.
> 
> (Meanwhile I don't object to your fix as a short-term workaround)

OK, will give Mauro 24 hours to comment, then resend as a patch if
there are no objections.

> We see other variants of this problem out there, where we want to
> document foo(), but that's really just a macro calling _foo(), where the
> real code is.
> 
> I wonder if we could add some sort of a marker to the kerneldoc comment
> saying "we are documenting foo(), but do you checks against _foo()"
> instead?  That would be more general than trying to keep a list of
> suffixes to hack off.

kernel-doc is our own format, so sure, we can add whatever marker
we want to it.  I think it's not quite general enough because we have
situations like:

static inline void foo(int x)
{
	numa_foo(x, NUMA_NO_NODE);
};

/**
 * foo - Frobnicate
 * @x: How many
 * @nid: Which node
 */
void numa_foo(int x, int node)
{ .. }

and now we're documenting a parameter that doesn't exist.  The only
solution is to move the kdoc to the header file, which is annoying for
everyone.  Or replicate the declaration in the C file and kdoc it there.
