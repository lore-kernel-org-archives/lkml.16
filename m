Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B4199FC1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378571; cv=none; b=miy2qt8f1QNEi/C7qlHlx88d0TLGgqjs6c7WKyMlzk/ei84onf90/Rtewrk/Asrjwn6oR93ybxY/FL04HsEzRFvaqSuEKGOzA7UDPYgaZTz5ja5dVVGzLv2o99XVbe9pAkJYoCWU4j1EC3ra4PCHNMMRztgN2iEDOkCJSnR2Gmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378571; c=relaxed/simple;
	bh=0Jmyx2zQd26w/P9g6mNt2h6Rf/NPQvZ3LKiDaWUkjbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VopJlUyWSAXuTnJ3Eh3vq2p47xn917zC1gswUKCk2FU+gczgUxClmZXDUOK8vDi3WKgiBbBQhajq9U+IzpJNLIXNQE5BcKBrMsLBgNf08Ui22EXLpmq5s5PJL91OBwLHhBxmOZ42dIINqYp9F78TlF3TntfEr3YNLC8R+mcyjfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XJjV1sa1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XJjV1sa1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xkzgZ+DaZiB29pk0Yhq/GUakbOMzDh1a7aFUoZGdCKc=; b=XJjV1sa1y/OQytxXFZdaylM38v
	FVs85+dePF5/WdhKlfhpiB5Nqq5K03nPZ0/8hVOHN91uyOqZS7IynrSfoLm8zmLTJHUrWHI5jJwIQ
	lL6pjEwY4K5l8HAOznRImgFrDQZCcihtUxZEXMreOGQy+mABl5viucFe9SsjVPoThrmY2hWayN636
	aczOtEfw3oVvDGRHT6IcKspxs/meVl8OztNIJ8UMOcLZTrj+TQTg69KUz8DsCkVgXHGkyaIZ3+4jL
	kQOfDfNfWv3lYDWqR2mGg1+5+OjSvbG2D/0hNANQobYBvw4/KxcwG8lO/alIc97ypk0p6M474TPaa
	ET2UT78Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Qh8-000000070XE-2SJk;
	Wed, 23 Apr 2025 03:22:42 +0000
Date: Wed, 23 Apr 2025 04:22:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, mcgrof@kernel.org, a.manzanares@samsung.com,
	dave@stgolabs.net, akpm@linux-foundation.org, david@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v2 4/4] mm/hugetlb: Convert use of struct page to folio
 in __unmap_hugepage_range()
Message-ID: <aAhdAgeOXx1S_Z6g@casper.infradead.org>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-5-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418170834.248318-5-nifan.cxl@gmail.com>

On Fri, Apr 18, 2025 at 09:57:42AM -0700, nifan.cxl@gmail.com wrote:
>  
> -		tlb_remove_page_size(tlb, page, huge_page_size(h));
> +		tlb_remove_page_size(tlb, folio_page(folio, 0), huge_page_size(h));

Surely this should be:
		tlb_remove_page_size(tlb, folio_page(folio, 0), folio_size(folio));

