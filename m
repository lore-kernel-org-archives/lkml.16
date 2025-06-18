Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C32C08CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246592; cv=none; b=N8r/7NcreyqCOSwfFNA0FmnWh1sAe+3TFJU+zf/b4qkVzxAd6m+xB4ETeeh8Ro0sizyJkNu+hZpxukr5H8cgWHcrRWVFhPvpTxhcocbfcgwT7qGkMjvtbArAiZ+lNy2/5j4U3LvrjZUWEzLpPC3thraF4KdZxv0mi/vYbAaTGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246592; c=relaxed/simple;
	bh=LmzNlGu33bNvUvS1lMtzXBfA59WCOHBjyR8h3AOZEfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPdAJE/cSfu/5cR3YPpkQHUnpJ3vF/O/DRxraWM0rycN8zbnsV9XEx4d6Vwl1t3Sdip2ggeOG92uigF0prTxOCnbLfHU7XZhqNltwV+1U+iDzRTSUPGQF44Acl8Vfm3SCdQPHtJXxlUuR+4HWfBsG1T+TX2Y7BRZcX1OqL4EhkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BxnDea7R; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BxnDea7R"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a58d95ea53so6392651cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750246589; x=1750851389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hyfMiE8uuz+y/z3NeyrsTyIcYJmihmEztguDbit+cGo=;
        b=BxnDea7Rgq4GnG37EHz65hjhQ13D4C8Ljb5jahM3HO/PSYiCuezjje71Gff2uP2p8z
         jhKQt81KcCxORwf0FWgFEvBZvQKoZpLOx82m5WlP8SKT+XeiDJJWJzOBRS41st4f0ZS6
         WBo0EeQRhDzguqg8voA1m1JlrQCZL0CI5ngCIehLpHdfk+Ge+Lh/WFo++1gX20u0MtJ9
         yWnhWEfYmjWJTiksqISLNsknpQRsrR30/OTSdT2awUCDLCNvb0gWTI5oFdUIYOKud01P
         qHiHx37KcN1bwYm9CHk/EyZiwUpaFpG0TuCAn6+GNhPfR25LL7D85t+Ztr9eK8AQL3oq
         SvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246589; x=1750851389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyfMiE8uuz+y/z3NeyrsTyIcYJmihmEztguDbit+cGo=;
        b=Z+ezTt8ZAJLTos0eFKRm/4eHlDxslm3dIdTnyHXtTwUKh/smwZSJF864OayFWtLeTL
         3bTWrbQJKl2hjdHEdJxIK1Jon54MEcNjK/zRmHes3d4M8Bcm6cPZf1hZLGIU6Y+BxoyV
         yx4vmfwaKEa8T2ZZmnE0d7/0Gdv3ZGy5Bqe5s2kGMelACNDTrRUg+i1uxMe/DofNojja
         ZvzDQw3rz+enW67iWPQAJTlyUo9sCUncuCEwU/iSSu1kvu+b9cDcA/+zWhi/Jfsqt6PO
         zeRIvdwposrfiEZhv6eEmx3mirU73pk+smjCC1gt6al67s7kZbUNyt1KwcTtQ9IrMtnv
         hp6g==
X-Forwarded-Encrypted: i=1; AJvYcCXMR7upuirJqFV6ZzIxGG9eMh6URclKKKVl7xIkyn8j/TPrcMCUX5reYj0ZFYZt9Hi6hwbczWNOerY75Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKP3eYct7ppV2X93adOodsSnYqTumZdijg4/NLdQW2m2yCv20a
	TYd+lIqJQq9wm4bKUzJkCxU6dH263hwB81aWyO9F6tVpZf1vorunX3ZwqLt8eGp6yo4=
X-Gm-Gg: ASbGnct2But/uisYxIU4kRfx57D7OQA/nJBh8XgG6HlLMAm4WronFyqBiZuNL3ZTn69
	U7ks2tR0NJpEVUBy/1kWvT+Mhke54ORfzh5lenp9RUm8T6DErl1fD1d+HdQJSbnvOU5Oy6lflUr
	C1sOzAw0jFZOCnA3TfaFqh4qBb92B63rUJRNYO3AF7xXrL24Iaa9szOV2cAhyHa0QGqotefdT/l
	aU6Bw7xlJ/4KImsOZ6MhO9n+1OXc/iuF5Aho4UACoeqdtXM5zKMFUUe5fgR3rFgMfCWPZx3ovLi
	uRly7CmHUTmnLuhhra4JbYV9BJ9YYG7uoOMUNk/Il6/zhXK3wzictg7i71ZKUfHJFj7X2+TD1Pd
	tRvkIm5E8VJAU+zAYij8/qCwoTF2UfME0bfiCgA==
X-Google-Smtp-Source: AGHT+IHq1OscbF4KPU5hFbTgPYNzkYK0Dn5e3x8Z/FwfkjMj5kOX5Qmi2rHItfOgV2BwPSbzTJ1zqQ==
X-Received: by 2002:a05:622a:1b8d:b0:4a5:9993:ede8 with SMTP id d75a77b69052e-4a7645b600bmr34414011cf.15.1750246589268;
        Wed, 18 Jun 2025 04:36:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a315c58sm70481041cf.36.2025.06.18.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRr5e-00000006kyd-3HZk;
	Wed, 18 Jun 2025 08:36:26 -0300
Date: Wed, 18 Jun 2025 08:36:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, akpm@linux-foundation.org, alex.williamson@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250618113626.GK1376515@ziepe.ca>
References: <20250617152210.GA1552699@ziepe.ca>
 <20250618062820.8477-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062820.8477-1-lizhe.67@bytedance.com>

On Wed, Jun 18, 2025 at 02:28:20PM +0800, lizhe.67@bytedance.com wrote:
> On Tue, 17 Jun 2025 12:22:10 -0300, jgg@ziepe.ca wrote:
> > +	while (npage) {
> > +		long nr_pages = 1;
> > +
> > +		if (!is_invalid_reserved_pfn(pfn)) {
> > +			struct page *page = pfn_to_page(pfn);
> > +			struct folio *folio = page_folio(page);
> > +			long folio_pages_num = folio_nr_pages(folio);
> > +
> > +			/*
> > +			 * For a folio, it represents a physically
> > +			 * contiguous set of bytes, and all of its pages
> > +			 * share the same invalid/reserved state.
> > +			 *
> > +			 * Here, our PFNs are contiguous. Therefore, if we
> > +			 * detect that the current PFN belongs to a large
> > +			 * folio, we can batch the operations for the next
> > +			 * nr_pages PFNs.
> > +			 */
> > +			if (folio_pages_num > 1)
> > +				nr_pages = min_t(long, npage,
> > +					folio_pages_num -
> > +					folio_page_idx(folio, page));
> > +
> > +			unpin_user_folio_dirty_locked(folio, nr_pages,
> > +					dma->prot & IOMMU_WRITE);
> 
> Are you suggesting that we should directly call
> unpin_user_page_range_dirty_lock() here (patch 3/3) instead?

I'm saying you should not have the word 'folio' inside the VFIO. You
accumulate a contiguous range of pfns, by only checking the pfn, and
then call 

unpin_user_page_range_dirty_lock(pfn_to_page(first_pfn)...);

No need for any of this. vfio should never look at the struct page
except as the last moment to pass the range.

Jason
