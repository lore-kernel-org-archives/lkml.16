Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAA1B4233
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661362; cv=none; b=bKwf6MUAnwrEd9YD1hFfwmGTX8N1L2x90MyI5conYAWuVuQByXh2xXLNr3mQFNX5TBfePycGb2i4uqhWOikQfa1G5usrDs+Rt0o+3WTvg2zbkL7qedof6GdV6vIt9tHzz18Zlg5hObC3GNmbnTmImvRQcy8ZBOuv8SbWyqdAlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661362; c=relaxed/simple;
	bh=4WDCQNSjaodIeN3lKj0ADScA/nC318e7L7RKOAGTdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEUFUEkxD+C9VvBqBU52S9kdo3EZrJc0ise48n4kt8ALwDlSW0qHUE8RWOSS/SCZGoQCHyXngBt1RcZrHaXGzIxtDAUGywSf7Ofhb0iV6TOKQpsYt/QSzkZTuG8qaxPt/Vuwi7kcv09aUzPGOMH5g5ReGVxJYHY4SsLri1p9/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R6wnx3m1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R6wnx3m1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7iA3Ihr5qa4nH3OBiWe8HCN2AJNFi9fEeh9aTTqrmO0=; b=R6wnx3m1cKY1lEs7Z/up3F5cpj
	TkutvShKoVcQouAZhI2jGz+tBMOaTExFpG86lowTau6EqCZfu9xBSG3wJJS11yroH8o3ZxftptT/0
	kWaV+4j/yDG2jX5En24/REJ0K33gWjNlXqMVS8qY7k4N/LXqDP4bo/L1gdKhag9gbDup6qkVsga0Y
	andu5Ee+CZtVXlQ/NUhPsRwOs8WLnrQWtycHX1wiysL0X9u70ZcudTdUwaAdDECqWaavZIYDu3M8G
	n2Dk1u2wcAcvTXZDOHjgqpcvE6tennuPyfdQ92pYXmNSTxkQC1JinWxnCZvrUJx92JOppjWeCoQIk
	9f4OOyig==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Q7E-0000000GtNJ-3KVt;
	Mon, 14 Apr 2025 20:09:12 +0000
Date: Mon, 14 Apr 2025 21:09:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
	luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
	rostedt@goodmis.org, tglx@linutronix.de, jon.grimm@amd.com,
	bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
Message-ID: <Z_1raKrmWzXIZ0G_@casper.infradead.org>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <87wmbm1px6.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmbm1px6.fsf@oracle.com>

On Mon, Apr 14, 2025 at 12:52:37PM -0700, Ankur Arora wrote:
> Ingo Molnar <mingo@kernel.org> writes:
> >> +void clear_pages_orig(void *page, unsigned int length);
> >> +void clear_pages_rep(void *page, unsigned int length);
> >> +void clear_pages_erms(void *page, unsigned int length);
> >
> > What unit is 'length' in? If it's bytes, why is this interface
> > artificially limiting itself to ~4GB? On x86-64 there's very little (if
> 
> I was in two minds about the unit. Given that the largest page size is
> 1GB, decided to go with 32bit. But, as you say below, there's no reason
> to limit the x86-64 interface for MM reasons.  Will fix.

Actually, I think there is (and we went through this with SPARC, if you
remember?)  We _shouldn't_ be calling memset() with a large size (ie
larger than 4GB).  If we have that much memory to clear, we should be
doing something smarter, like using padata to get lots of CPUs clearing
individual portions of the page.

I don't know how relevant this is now that you're going to be using
ALTERNATIVES.
