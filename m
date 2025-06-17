Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEA2E3AE3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168050; cv=none; b=kgehOwmCg5h6UeVQaE8IjKyVTHS3arwuZPw0LQRQbvRd0YE8Lfl/Hve4IRV6nwZCJupZQlx0lTL8zacFM6HGxcEMFMKn3pBax9hDBT9YCWUiIa3frwEDvLMlCUvx9w5Ro1FFl5ME1jhOk/loUiy37ovcw7szcKR0FdAVNyITXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168050; c=relaxed/simple;
	bh=4zvU9610CYijgLdPektC93nm4XYH0yBwzdKFQ6s9AMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN8M7zfbYRLjMFknNvow32VqrB7uLCUqNOxXvtSVgW9C68QmUOVMUCz9QgtTIwo6sf3ZSrpO7TkDFnsHDVtue7rgUptMwtcaWUCRIBl/7iFoXzVqiSWEfypGtka9SMF3pjp4k8/Um/NWU5rLCWS5RC7ry3oGcvjROULapItuVjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aKXfCF5a; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aKXfCF5a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lcPJP3hUDIFtPx56TulVw4D3uKiGLoVqKD7H4NXpVQA=; b=aKXfCF5aYa5NhdK+Fz0QNYVFGD
	oYDkUtaBYrVAP/Z64R5DhPmIyTEVtyfDTeW0sMRDyPr/M9N7Qhub6kclAOpa/gHa/M5if8aHsRRNF
	Ky3kuZEa8D2BhUm12cMySm4gs12suXCww+PtwDewVllUJFbrcjVgumHSdx83Xg6q46rmrnMpSQehu
	KeHknMGdhsTig3oyNok7FggQB6eWARdVoEyQBL/EnLnhOUNA/QK+lnnzajjXmeDMnuSvWMD9Zinb4
	68ShOY81fiSMrMPrOGvKR2tFJyvQ8uITRW6zaiPw86DtgxlAWmmxzGlnoO0Vu+XKzV5SjnjNviwDf
	ogg+Abyg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWep-0000000HD4X-28Z9;
	Tue, 17 Jun 2025 13:47:23 +0000
Date: Tue, 17 Jun 2025 14:47:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dev Jain <dev.jain@arm.com>
Cc: david@redhat.com, ziy@nvidia.com, dhowells@redhat.com, hughd@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, aneesh.kumar@kernel.org
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
Message-ID: <aFFx64M_iFgeIh5j@casper.infradead.org>
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>

On Tue, Jun 17, 2025 at 10:40:51AM +0530, Dev Jain wrote:
> 
> On 26/05/25 12:05 pm, Dev Jain wrote:
> > Hello all,
> > 
> > After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
> > on the folio, and we do an xas_reload(). Is this just to reduce the time window
> > for a race?
> > 
> > If the above is true, then, there is a negligible window between xas_load() and
> > xas_reload(), because only xas_retry() exists between them, so why to even reload()?
> > 
> > Thanks,
> > Dev
> 
> I do not completely remember our discussion in THP Cabal; I recall David Howells maybe
> saying that the folios are already locked, so it is safe to do xas_load and then do
> a folio_get()? Even if we remove the redundant xas_reload(), I still don't understand
> why we won't need xas_reload() at least after folio_get()?

Because you need xas_reload() in order to solve this race:

A: load folio
B: remove folio
B: free folio
C: alloc folio
A: tryget folio
A: reload folio

If A already has a refcount on folio, folio cannot be freed, and so A
cannot get a refcount to C's folio.

The other mutexes are irrelevant here; this is purely a folio refcount
problem/solution.
