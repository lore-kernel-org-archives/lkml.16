Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377D1E102D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874427; cv=none; b=k/qAEXkwhR3OSV6sxlZizvhZronNvTxsOA+XKy75KesmLr3J7nPw+T6a58NiodyDrSsj+SgLO3bJAWkJQgYDJVIoW4lG1s29OqhA2svWvDD6i+k488yyQ5SUm2aySl1EM+twcDsmKEqqeln+y2IAc6EdNOBk1VX0ZCA/MgW7YHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874427; c=relaxed/simple;
	bh=eHGYijEC2FMoUlfPEerpucTLs+zsZUcRugTpwmB0WhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJHKjKg9qW7Kxz9BHbmplOf8FtTYirvZWv1vSIA2RFbDGFCjnTbrW1KsQ32iZfnUKEP5QlPUz7zttv9v7KeG1DrhkyVUDu6zZc+aObguJE20ydKvVOCAGBtPmJFV7aILV4/oJr1v4PBIFR5T4xEX0bX85BRDiEqgaN/yWtUe/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O036/4Ph; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O036/4Ph"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jk1v+l0g9eTmQlXNCeuyS9ezhYiOOgaiu8K1KIm6yfc=; b=O036/4Phc22K9QKb+v6Gh3g7NM
	gsw8QmLdsNDS4PDUNQC76lpnWZNTnF7tdWiPWjY/d1vl9BzjCZeWy5ngkoTMgLzNvn34YA7tExdpa
	DGXfZqGj0qD52xRqEusY9jAJa5T+eo2MVcBOkmih5ri+xCFbRG5iJleA51oe4SqfT6+g7f8bB6opD
	Xf4WPMj/fGaEZqDym+xT4dM1WkHB3639zellOest8jzRgf5/CJQr+kZnpes5k9i/SwsELrrarKIiz
	ENOB4fjBAtjlJq53lXw3OwzwGjl38abe7AQXwtVdsr2HRwP0t+clF/XnLRqj6UJnz63b1MpKVe8uR
	nyxpqaWQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUQ3-00000009tzy-0TRJ;
	Wed, 25 Jun 2025 18:00:23 +0000
Date: Wed, 25 Jun 2025 19:00:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to
 folios
Message-ID: <aFw5NuCbgJOBmG97@casper.infradead.org>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
 <20250625174841.1094510-2-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625174841.1094510-2-vishal.moola@gmail.com>

On Wed, Jun 25, 2025 at 10:48:39AM -0700, Vishal Moola (Oracle) wrote:
> +++ b/mm/memory.c
> @@ -6820,9 +6820,10 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
>  	}
>  
>  	while (len) {
> -		int bytes, offset, retval;
> +		int bytes, folio_offset, page_offset retval;

offset_in_folio() returns a size_t so that we can support folios larger
than 2GB (which is a real possibility here; hugetlbfs might end up with
a 16GB folio on some architectures).

> @@ -6837,17 +6838,20 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
>  			goto out;
>  		}
>  
> +		folio = page_folio(page);
>  		bytes = len;
> -		offset = addr & (PAGE_SIZE - 1);
> -		if (bytes > PAGE_SIZE - offset)
> -			bytes = PAGE_SIZE - offset;
> +		folio_offset = offset_in_folio(folio, addr);

Umm.  Not sure this is safe.  A folio might be mapped misaligned, so
'addr' might not give you the right offset within the folio.  I think
you might need to use addr - (vma->vm_pgoff << PAGE_SHIFT).  But I'd
defer to others here ... particularly when it comes to anonymous folios.

