Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253B1E0E13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436761; cv=none; b=ErbXT3WrR+/mBcq8gU/e57gGr1lxz+PoHJmeKTaEeFaj98DHEkUTVgd+CekWzglXjnXPV2DnRkHDaDxuAWvQaPZY2h93vuB2FmAQZBi1OK12+9sDLYG7LAH8CpW79InC4nnBjOXR4Dl7Epn39rBdgigSfp0hBUtTVGl6Lo6qoX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436761; c=relaxed/simple;
	bh=tma55MFNAw/GJDKtckvQxQu0LVPdFFI5mA9H4aKzVco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+Cud+lzxl7zpg991+GU91KcE5BsHTV01C9EANIEitzbYIt/aoIW2k0HZXkB/XPJS1Ax3Jj76LXDSHB6XhNiMAw5GUkQ7odPZDvLFBA1NkyREmJCuQWMp3Iv1gf1CJea/aMKoMd/cU+epworoQDSK3eXacgNBV05vv1a9dyLoEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wBmUbAH2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wBmUbAH2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wnh8uoRPkusnTEUMr7tAStK6YSVlZsb7i2nO0MdBKcQ=; b=wBmUbAH2KymnttpDPouzeQslac
	U3mrhK679+29flucbG8YWnreKR7BnEgby9ro26L5g2UmxRDc1wFLnsaaih58pgNz/nwJk9ELMJgaJ
	WSg7cDAvG84YUuXbmNA/s1AqMz+h5piobg9qScpB4zdj7zxN3w26nLX7sdMy4Uf2tN0fZjzh8J16x
	UKLgZU3MCmiQ1RqOA2QZgqrQIoqG108yJbFSBxhSPlsWp5JDUA1Uo4S9DWlKIbAQQ9F3fGChYfrzi
	vhsodcK9NbLfLLy2tWbxDQ13PeazJa50K56ZmWQ8IT3PTCyRA8g5PDiBBWIYTo5E+sY59BXyCHjXS
	m+7XQ/HQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHXh-0000000F0SR-0ZRA;
	Mon, 31 Mar 2025 15:59:17 +0000
Date: Mon, 31 Mar 2025 16:59:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
	Ye Liu <liuye@kylinos.cn>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
Message-ID: <Z-q71LlcCQ5I-2D-@casper.infradead.org>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>

On Mon, Mar 31, 2025 at 08:08:01PM +0800, Ye Liu wrote:
> 
> 在 2025/3/28 22:29, Matthew Wilcox 写道:
> > On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
> >> Consolidate the handling of unlikely conditions in the 
> >> page_expected_state() function to reduce code duplication and improve 
> >> readability.
> > I don't think this is an equivalent transformation.
> Could you explain it in detail?

page_expected_state() is called both at free and alloc.  I think
the correct behaviour on encountering a HWPOISON page should be
different at alloc and free, don't you?

> > Please, stop with these tweaky patches to incredibly sensitive core code.
> > Fix a problem, or leave it alone.  We are primarily short of reviewer
> > bandwidth.  You could help with that by reviewing other people's patches.
> > Sending patches of your own just adds to other people's workload.
> Thank you for your feedback. I understand the sensitivity of core code
> and respect the limitations on reviewer bandwidth. However, I believe
> that reasonable optimizations should not be rejected solely because
> they involve core code. If an improvement enhances performance,
> readability, or maintainability without introducing risks, wouldn't
> it be worth considering for review?

If it's a reasonable optimisation, absolutely!  But if it's an
optimisation, it should be accompanied with a benchmark showing an
improvement.  As far as improving readability, I'm not yet convinced
that you have the expertise to make that call.  Every change that is
made invalidates everybody else's mental model of "how this works".
So all changes carry a cost.  Sometimes that cost is worth paying,
other times it isn't.

> Regarding the reviewer shortage, I’d be happy to help by reviewing
> other patches as well. Could you please share the process for becoming
> a reviewer? What are the requirements or steps to get involved?

There is no process!  Choose a patch, read it, think about it.  What
problems might there be with it?  What may have been overlooked?
Is the commit message unclear to you, how could it be improved?
When you're done, send a Reviewed-by: tag (read the kernel process
documents for the full meaning of that tag).

