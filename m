Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6D2701B1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446662; cv=none; b=EmDtX1cxPk+u3wbxEG2vwAAnxGffVslkf/JJ5hhRaQtD5iHy0Cuwn8CfyMVd66DhgeZ+3KmpWkt5WKgj6iy/01zn2Pw+OPbSApZ2wgw15BoY+wir/1e3bVQhDBBlwdZdwRtSMeW4wmihyY8KNWnvyRJtskYt/hzTz5XYz+o2yR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446662; c=relaxed/simple;
	bh=fxnFhetLKP5DZZg2Quis/n5S9PjPI9uSZ2lT/VmQBjE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LeE/ogOe7eEbbBzJTZ3rmpe3Kn7BG/FkA0r1EthtnkwwBjwHOsZS1ttJC5dxWl8KnYtk3pX8xXg8Z2vR0/EPOfrazuQGbx6kpTeAfty1Lxu6Tl47C5u6OXewivNK42sk8sKQiAD+U8tx8BsWrTsbcEs+aCFcpU9YEpYcX2/AjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BVhv2Xpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BVhv2Xpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF8C4CEE2;
	Wed, 23 Apr 2025 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745446662;
	bh=fxnFhetLKP5DZZg2Quis/n5S9PjPI9uSZ2lT/VmQBjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BVhv2Xpmd6NcHhIwHCIWy74SiDi7zcF7tG9y2mRHhTqT1GZIatIolIa5ZDgCjqovu
	 w0idS03QdFftBZb2jZAd7v1Jnu5PItpNUzYM2knF9xR3FnnHoyGPR5OCMYzVxlD1IQ
	 EuUeOmYL0dYv30Jsx5h19KvAmAIhoSHK4rw2pZe8=
Date: Wed, 23 Apr 2025 15:17:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: nifan.cxl@gmail.com, muchun.song@linux.dev, mcgrof@kernel.org,
 a.manzanares@samsung.com, dave@stgolabs.net, david@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Fan Ni
 <fan.ni@samsung.com>
Subject: Re: [PATCH v2 4/4] mm/hugetlb: Convert use of struct page to folio
 in __unmap_hugepage_range()
Message-Id: <20250423151741.7e27a94abfc3b41bb659a6b2@linux-foundation.org>
In-Reply-To: <aAhdAgeOXx1S_Z6g@casper.infradead.org>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
	<20250418170834.248318-5-nifan.cxl@gmail.com>
	<aAhdAgeOXx1S_Z6g@casper.infradead.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 04:22:42 +0100 Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Apr 18, 2025 at 09:57:42AM -0700, nifan.cxl@gmail.com wrote:
> >  
> > -		tlb_remove_page_size(tlb, page, huge_page_size(h));
> > +		tlb_remove_page_size(tlb, folio_page(folio, 0), huge_page_size(h));
> 
> Surely this should be:
> 		tlb_remove_page_size(tlb, folio_page(folio, 0), folio_size(folio));

Thanks, I removed this version of the series from mm.git's mm-new branch.
