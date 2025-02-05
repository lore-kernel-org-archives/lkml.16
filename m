Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D2151982;
	Wed,  5 Feb 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797454; cv=none; b=nQnilxkQzPw814lgzuFplLBA56IHfhMQ4pkh71sedh6ZwNBdq9KSJwVcwGbRLgkvc8DY/j6/JW1cF7KRZI0l09Mqhnb+hBcWyM7J0i9zlEPji60l5yiBPXXYEmkpDCxUEFx118xo+8ohZtoznpHO+Xk3L14NnozpjuTMS0EsDDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797454; c=relaxed/simple;
	bh=SNY9HJsOA/maBbuh8nh6FtwZqv+v1FfKTwKYcxjfl8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCHLHLwzGLusVXQtma7qw6t9qC+EfJxCaHzdQDhfGw+jv+kRbh7in6ny90RyUDc4koSQHZPHaWnLNRdj0h+uYpavulhPhslDcFw2vLyGLxTHwiTs9QjDUt91hkstNkCBrD6Z3tCM2Hrsg4rVA+7osmpXh7oRpVh8wlgv5zcmEyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cC+0IT9z; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cC+0IT9z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Eo8iddA5F3+GfWnUXk00TmgLrVbfJuqGlTFhAHUQxOU=; b=cC+0IT9zSR753XY+TILiRLEpHu
	954DArINS0Z/g3l1UXY7LvAmL+Ca8JC8U1PlzIYkR5BlqmYQRo4uRq69R8yhGc2zN3XLnsEVQ1b34
	P/+2S6NBylkv//Nz5ywwl3HJ6snDBCCRdGFJ6EPYRBj6TtzKStzhc54X+Y3/o4nfBGNmm1DzTdKqH
	XKuBS6DaN9TRjKfup4VY1Ykl0VT62FDJ1B0qUPqFW8uVEr5Znwq1Y+4VeJprFzdtmqVRSUgAGCMRd
	jSieY1LguqWUNEOwJZfcIrRQqw4kXEWlmKiMsToIY+xg9cyz0cjWE0F+H8LkGkACUFPGLWbdjBJl+
	gVDEp1Qw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tfody-000000059Mt-2d7z;
	Wed, 05 Feb 2025 23:17:18 +0000
Date: Wed, 5 Feb 2025 23:17:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <Z6Pxfo1xDHUOna6a@casper.infradead.org>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
 <20250204204947.GM2296753@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204204947.GM2296753@ziepe.ca>

On Tue, Feb 04, 2025 at 04:49:47PM -0400, Jason Gunthorpe wrote:
> The phys_to_virt() I mean is on the page table pages themselves, not
> on a leaf.
> 
> All page table pages came from alloc_pages_node() and you'd do
> virt_to_phys() to stick them into a next-table PTE, then
> phys_to_virt() to bring them back:
> 
>   phys_to_virt(virt_to_phys(page_address(alloc_pages_node())))
> 
> Effectively.

except for s390 & ppc where the page table can be smaller than
PAGE_SIZE, so you really only have a physical address that can be
converted to a virtual address.

