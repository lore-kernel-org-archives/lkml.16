Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E6255E31
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374060; cv=none; b=YuVJjg2vS6NEY3WDa1zjV+BoQFP7GljEbFwninYKBJQdiQtw42F7CGrTaBYpPg10YapbPKYl+lDbpeb0N3QnXg6rv7sRVRdSziywXwg4S6mPfDaaYiH3Emq0AZBotVcU1zBgSOHU6ADXahToGIzSnuhNuLiekAU0UTCQrAWGvnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374060; c=relaxed/simple;
	bh=iFO9sIvMLfAtIRJe8DuFrkDGtMs6KITrsfxMzgYB540=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnH81vsiET8tmbJMXP42gY05mAn4F/MIRGLobKz7lx6EAFfKArC77cvegAQ+wgc7fUTfK1awS4ZF3t+AS3ZZ49VrkCzNhTeN4+e+03lpPev6HxyGwFyhMiIluUxYxFh1V6G00eUgl7tWfSFzKiHBS/MvYLeKN2rBbQD1WcdtRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XVljt1Mx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XVljt1Mx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K3bvHhOuzFDWG21uSveSS4IlmdR6tNlM7Eg3Pt1CNJQ=; b=XVljt1MxBfBaQS0j7G3ARlX46X
	XQd0euqi1MvW3hy5nnMwaXu1DdBkHCwC/f/3IZrX7Yw37eFiwiqaLL8WeIoghv7j758UL+35nKK6I
	Kd5M536psondnaVNg8Rg2eotJVZ8mDuc45baWhyMs0nX9xLTHUeNZybjJlL6FRTfty9BqVjBQs9A+
	pXXJCkwHzHEV7d7keWUeuGQlq4K2Y1Dc1t51WmaYR5Th1+Vh5sXtzW7xyKUlwY+6YWFk1CbL6fVZy
	4maL93cgQShcP0QYBIFpLhqwxxqxdllg7qZvKt9ONVmCHctNOvbxHXeHil3EAa837EOXAO1y2ZAhp
	EIkWn7Ag==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PWQ-00000006lwV-2N5S;
	Wed, 23 Apr 2025 02:07:34 +0000
Date: Wed, 23 Apr 2025 03:07:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] mm: workingset: Simplify lockdep check in update_node
Message-ID: <aAhLZgLT6qPNK4lz@casper.infradead.org>
References: <20250421-workingset-simplify-v1-1-de5c40051e0e@suse.de>
 <bmzzod73cuumphqg6nyhegogc6wciyw7oewydljexni7tgdcni@32hathqdj7qo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bmzzod73cuumphqg6nyhegogc6wciyw7oewydljexni7tgdcni@32hathqdj7qo>

On Mon, Apr 21, 2025 at 06:39:53PM +0100, Pedro Falcato wrote:
> Actually, not sure if this is wanted given the original code is a little more
> explicit on what the lock is. +CC the original author
> 
> If people think this is worse, just drop the patch, I don't really care - was just
> checking out the function for other purposes and found this bit a little confusing.

I think it's clearer.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
