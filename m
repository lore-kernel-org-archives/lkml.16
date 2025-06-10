Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3A260599;
	Tue, 10 Jun 2025 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599528; cv=none; b=Hbv/x75Oa4G/FMg1l5/WazIgX6qo//eAbFHQPKaFZe6OToaMJesERcjJEu8cajzIQ6SaIoJypMbkvnWp8youCcLq+wFLGUCvadFvFdHpKJylQRRuki3jT69KCHZDPSDijOMahpureE6FEwxESXgQo9EH7NhmMGyPkKn+bMknDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599528; c=relaxed/simple;
	bh=qQraJCypR7mocRiyD3fy0arC6tKe0jPdLYFn0fD38tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVg7k1F02lFQCYxAO0lQIE6GLjFgmUvubankZHPUMmbzO7oMajdlS0geXg9s/+EJ113r3LVBC7FydGDZVkkRJk2rUeGT7sPf61GSmzhTxw+R1+3rT7JFrgltXYtR6ZjZIlHtOx4KPA1t29RLDxGrZW/GAXJpeSoB5TcnPCPrOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tPL2rbDg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tPL2rbDg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YvmedPYjPb9U6JbcwoYnTt7uRtk5MEk3P9tgcGZSkz4=; b=tPL2rbDgCrwSLBvA/Wb9q8dm77
	yG/57nMEYnBDh7M8UiHMj2qDoMF8y6Tdg76pl4NCAtByi1iKk3fN29NbUlEyz1ugRlGPPf3zHN0A5
	XesuZD4o83l01UGVA6zH3/E1I4K2FPJSkPFnWUGTdR//+muPDQA6iAo6dgezvu1yRa7eRnfArIMk2
	O1iO5GuYEPXqWte9Q7z4JM4EdY34+qezCJLhAaf8PcauE9TbJl5ATqHtIuQRQGdl5k+VwJI3ZzEtM
	vc7jFVJkZl1zB+Ptgbsq2djgelYwOZ3Ofi8G3kJYZ4Vd9ajBZnIO6Knc2eeSXnAW5F5mqpK4TBMpa
	xBVdNhDw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8l2-00000009zwH-0eJh;
	Tue, 10 Jun 2025 23:51:56 +0000
Date: Wed, 11 Jun 2025 00:51:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Feng Tang <feng.tang@intel.com>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] mm: slub: Wrap krealloc() __GFP_ZERO semantics diagram
 in literal code block
Message-ID: <aEjFG6nFDW6rJ1Pu@casper.infradead.org>
References: <20250610092153.55093-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092153.55093-1-bagasdotme@gmail.com>

On Tue, Jun 10, 2025 at 04:21:53PM +0700, Bagas Sanjaya wrote:
> Sphinx reports htmldocs warnings:
> 
> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]

Jon already fixed this.  I've picked it up into my current set of slab
patches.
