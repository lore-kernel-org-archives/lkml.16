Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE111DED60
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560199; cv=none; b=FAW9zA3zG1wFlM7SnjZisPd3VhrV0XHDwlCZfO3pjffPFt/usKXMYKltxqvNZpBIt7bWAkEi15/+gl5g5GVGQc3clPFtx8nhZoGtLRyxHkX6RiZb+hlDe9hQfrAGySixpzh9uD2K4xnUqk91R7F5dK96QaOfXjjcoMnBnxTYeSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560199; c=relaxed/simple;
	bh=fCIgv/N8yoMzwcOqZ41EnHJ4VxpjhwghJMt+YehsdPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzqTdvDAyA791JiJJ88vY/hyYYevmbfrbfYbTGiF+1kBN0JXoRgtoMPk4GWMibs22iux4VSHH60I5B6x+yZw3/n1Q+snqzVqPMCSXYtdJSfyRSZi7Rq8+prrX9LpePz08GVW21ApiwipW9vPmRTohuAz7yaqBwR8o0Su51zKEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tby9ETG8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tby9ETG8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uZd/E8aqEp6rcmE1csr2nKssU+4+ZJwoZz4uwg8GaWA=; b=Tby9ETG8OfXXSnMJRqXdSPxyEV
	wHNau/XLfsERq/UfOPVVCI1jWTAzztcbOkZzJsKm55yaW0R6S+MKj6991QLiLb9JdSw7djIksjlFe
	vGuDpOopwCUiAQIkqaSz/gRMlUiKq/tFkS6nepD1sQsNYOwlB5Yw6jlfLe9dxRfhL52jIS2Vu0C3M
	WLsMlRSBvQ1HVg6qlR44Ff3m6vRef70Kyhwn29jgU4/FURRaozGw59/v5kDuJkHdo2WgqiDzrNUf5
	pLnxmsBKNB+AIpnrw/DtALSU3Nz8nGOZeQsgLp5R5KzLhRn0gIa0nvT6Gc/fwD6A7U6duK3EvvERU
	bpv+/sKA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCO4i-0000000ADJ5-1QO8;
	Tue, 06 May 2025 19:35:32 +0000
Date: Tue, 6 May 2025 20:35:32 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/1] Convert is_migrate_isolate_page() to
 is_migrate_isolate_folio()
Message-ID: <aBpkhGBp40pUPqms@casper.infradead.org>
References: <20250506184155.587070-1-nifan.cxl@gmail.com>
 <aBpeR5E6XoneDcEj@casper.infradead.org>
 <aBpho6pICFz-0Mbw@lg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBpho6pICFz-0Mbw@lg>

On Tue, May 06, 2025 at 12:23:15PM -0700, Fan Ni wrote:
> We have a free_frozen_pages(page, order), which have two types of users
> 1) head page and order directly from a struct folio; or
> 2) page pointer that does not neccesarily be the head page of a
> folio and order that may not be directly related to a folio;
> 
> Does it make sense to introduce a dedicate function like
> free_frozen_folio(struct folio *folio) to handle case 1)?

No.  free_frozen_pages() will eventually be just free_pages()
when struct page has lost its refcount (as the refcount will have moved
into the memdescs which need it).  It's premature to do anything to it
now, we have many steps to go.
