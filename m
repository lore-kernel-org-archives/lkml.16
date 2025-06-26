Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB9411713
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906952; cv=none; b=fcmeH0dFSUSxNNYC0sPW13VV5CxRej+CjHlL+ZEt5MUPwQunBAhlMSxMklDcM+nd6bf8q3F3wpeLuev/rFt70LiUk9miZcsL2gL6wC/gMccW/sbUIECN6zgdf7GMl7zzbA+BYd4F5z5PWOXzfrwuGhg0XVXLU6K77jDjfi11QS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906952; c=relaxed/simple;
	bh=YE4ePGLeQbzxa9QxVUV5itd1HnSdUMRbdO/eS2k6gfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgo915Wwwq0S/IoWN1rczw7XQHYDVdysRVFtSVHo4nYeZtqD17c//irIeCUeat6QQL4DB4pU4zLTArbpCCP6KMNDwxHTds9pa5DQjTvdqJPsV31I6pLEif36zuwBWfCsrMx6nVCRmtU2S0dbitEVYpfQMYUV4WMSdS0HdFtqJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PAg+rPG7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PAg+rPG7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NGfT+jHFFWxoMZv9baITkq2QG6ysP8GZ2EscGcHNRw8=; b=PAg+rPG72yJyrk64CBgqPGN2nO
	Iy4X88m7MZW6z78ZhreKNOxkeMx7sjgK/U/IvHAVGzggTc1X+ZQ1IK+c9z2o8StOIU5NKaHgmSd/2
	WDuajKrplRJq5egYP26SN0kL7HLnNmDv26kViHzFfB/yYNV0O0iGmvvZXjOKgKLSNjb8x2lVrkrnO
	IzOi+rWm7axizN9HqAmr9kbBVPzptsu4eOHmxYGpKY6WxoCHeeQ5Ouje37kZd4hruyo3Atz1wNNMS
	Th+0JXLKKoFw6DmL/5cLcIw9SzSenfPnmqKBG7mxydh1jwR363o0B6FGOwkfTN8EbqHGu2xDYah3i
	2V72lCGw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcsb-0000000Akti-2hai;
	Thu, 26 Jun 2025 03:02:25 +0000
Date: Thu, 26 Jun 2025 04:02:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to
 folios
Message-ID: <aFy4QaXmKicMLGLR@casper.infradead.org>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
 <20250625174841.1094510-2-vishal.moola@gmail.com>
 <aFw5NuCbgJOBmG97@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFw5NuCbgJOBmG97@casper.infradead.org>

On Wed, Jun 25, 2025 at 07:00:22PM +0100, Matthew Wilcox wrote:
> > +		folio_offset = offset_in_folio(folio, addr);
> 
> Umm.  Not sure this is safe.  A folio might be mapped misaligned, so
> 'addr' might not give you the right offset within the folio.  I think
> you might need to use addr - (vma->vm_pgoff << PAGE_SHIFT).  But I'd
> defer to others here ... particularly when it comes to anonymous folios.

Sorry, this calculation is obviously wrong.  It should be something like
the calculation in linear_page_index(), only without throwing away the
bottom PAGE_SHIFT bits.  But that's for file VMAs only, and I'm not sure
what should be done for anon vmas.  Possibly there is no way?
