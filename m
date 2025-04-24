Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577C280CCE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517452; cv=none; b=MTW1MLsRiuJCyeaQ56cIM8doZdAjOtAZXeQpNB0VlnU9dIt8MH4VcDM01pFphBB0EpouIABpj5JLOxYptIifo8JBVB+X0YeAXPwaT5SXbmXBJkT0/SFi4r0wlVD/xhr50FFW/4l0HILUyZTSOvXN15XKcAkx/tUAl/NhhgBvCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517452; c=relaxed/simple;
	bh=IYSsaVyZ/jQu86leRWPMsvLKyxubireBxzBp6lyjr4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWCHnSASvuUqnLMMqPu69wIoA3Xyszg/57b0UMtCOqw+6WW1PNMVelGOKTjWhdbhvbc+hi/JN7dMADx/vgzvl8h84irAbRGFMpzeh7abxy44qmY6MBVpbzYUgCjiK93xqBI9DBZ9nf0oQmKn8Y3/g1EgRWRxp02VyAn4tYbBwtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lhPPXIFy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lhPPXIFy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HNQE79Zzehz0xxWtckooaLaCuXbA2OFuRvuA5IaVdgI=; b=lhPPXIFyJsxsg/+bh6ukwIcAVd
	XWXlQdofLH16fK9mTY8R70xBbPfhgkyFM65Zg4pADMzDZgt0ZUdy9ABLEJvJPDNjfHvzWUALtX83E
	zEzO7WJfNHorxhfip9jDdO/Pm2WjW03KoHqnX2yCtAADii1G/NJ/CkjtX6/O1LodGtRi4sDrbcqCX
	3NJp1UcQVdpImf771pJaEVD+eAAKCjK/92v9EwaRoDeVoz2dXr/4O0+avcu3J4YX0kcCfdOEnmb/I
	doRdudKIPPOKP80Z4OudmKzyuO6m7AV03xIy+IAjfOBOvhY12F02Py3nm1GSOAOHlvNz1IE+qtOEf
	YljB1eYA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80p8-0000000CxI1-2BGr;
	Thu, 24 Apr 2025 17:57:22 +0000
Date: Thu, 24 Apr 2025 18:57:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Message-ID: <aAp7ggknCytUyAXd@casper.infradead.org>
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>

On Thu, Apr 24, 2025 at 12:16:32PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.

I'm quite queasy about this.  I'm doing my best to make "THP" disappear
as a concept.  How would you define what THP is?  Originally, it was
PMD-sized-and-aligned allocations, and some of the way we expose it to
userspace, that's still the interpretation.  But we also have folios which
are of some hardware-defined magic sizes, as well as (for filesystems,
at least) random other non-zero orders.

Memory is just managed in variously sized quantities.  There should be
nothing magic about "THP", and I'm still annoyed at the anon-mem people
for baking various magic sizes into user-visible APIs.
