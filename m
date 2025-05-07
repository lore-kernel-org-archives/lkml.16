Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88C19AD5C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636522; cv=none; b=oIQ5iDAMEooCDXXEYHlsL/x5lhxHrKvCsCRoYSkBgs7e2gQ/JmCUHb8Ti5fSot24oJwy97NQVfKruYuiqB6ETe9Gq09D+SvpMW/m7XGGIWSc7QXi6vCDXuQbQypDyljfV1aSaJGdm6QVwl2HUiufgIzBIMdeIgQYO5AFzMwH5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636522; c=relaxed/simple;
	bh=aA/ToZGQonZA/5eB76oCZf2ml7H9qgIWVQKoXi3G4Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcIufzxAqpBYqboUtojxgEla1SIqd/Gc0mI3fi74oqmCOk9KgglRp35e49HCUNUJiqsOd9/a0NaYKWUtMSp32Qe7om/+u2b72kGolOKODuYLTv/IkQe6jJnQTq/6092Ph5rzaAYssniGq9b/wZ2JgIfl5yb8geJ12vvZ0B2KIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bZ7dojGK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bZ7dojGK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YgmvXC8KQUoeSX+ZNZxGaQI9tUIImeLg/Cp4by28rKk=; b=bZ7dojGKV14lEY1uNPRaye/56G
	TpvckhjqqRn7x5DdIGo6gELVgfINZVYeJpeAMxItrs8jPX8mYNZoyw4SvLkSTYdK52PU10mVnLsa6
	vBvmD3ATMjTRNLT4yocxGTL3TYV6c8ptndxv2wVq/iWnQ3AUg/P8BQcc+BEob6uCv0a8Axh7vOQN+
	x0Xvam3ROADWLMO7Tojas5eAuwD2Wpy51OvA3QnyUa2rLlQd65Tw1mqrGvfq3REZJ065voXlC6R2W
	1MX+vM5XIa3mid2xYVoiJyYytOdXpC2z6RJ2GQyGnMY5TKrVErqYbmQd4tTOWd26sUhujqPHosL4n
	aHcp6G/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChvK-00000008F47-1nei;
	Wed, 07 May 2025 16:47:10 +0000
Date: Wed, 7 May 2025 17:47:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	ziy@nvidia.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
Message-ID: <aBuOjrH1UpyTf8I9@casper.infradead.org>
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
 <88060373-d0b8-404a-b53b-9b5a54f5ba6f@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88060373-d0b8-404a-b53b-9b5a54f5ba6f@linux.alibaba.com>

On Wed, May 07, 2025 at 08:36:54PM +0800, Baolin Wang wrote:
> On 2025/5/7 20:10, Matthew Wilcox wrote:
> > Because I see nowhere in this patch that you initialise 'page'.
> 
> Please look at the following code in do_set_pmd(), and the 'page' will be
> initialized before using.
> 
>         if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags))
>                 return ret;
> 
>         if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>                 return ret;
> 
>         if (folio_order(folio) != HPAGE_PMD_ORDER)
>                 return ret;
>         page = &folio->page;

Ah, fair, I missed that.

> > And that's really the important part.  You seem to be assuming that a
> > folio will never be larger than PMD size, and I'm not comfortable with
> 
> No, I have no this assumption. But do_set_pmd() is used to establish PMD
> mappings for the PMD-sized folios, and we already have PMD-sized checks to
> validate the folio size:
> 
>         if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>                 return ret;
> 
>         if (folio_order(folio) != HPAGE_PMD_ORDER)
>                 return ret;
> 
> > that assumption.  It's a limitation I put in place a few years ago so we
> > didn't have to find and fix all those assumptions immediately, but I
> > imagine that some day we'll want to have larger folios.
> > 
> > So unless you can derive _which_ page in the folio we want to map from
> 
> IMO, for PMD mapping of a PMD-sized folio, we do not need to know _which_
> page in the folio we want to map, because we'll always map the entire
> PMD-sized folio.

There's a difference between "Assert that the folio is PMD sized" inside
the function because we know there are still problems, and "Change the
interface so we can't specify which page inside the folio is the one
we're actually interested in".

I reiterate the NACK to this patch.
