Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E22581
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652385; cv=none; b=C2R39cxaZUnX7au4fgveZVkrgNMLM3nmeQLGCwJIaNiJGGVIWFO6/Ox0E4ueWyAMtf+0AgkqiQNpyDk+dpJfOz6nnzV6H755W7t72uByaIAjLdVxMxvt6GhRwdvG05n0pR2eFR/NcdmTHpnV8GJMFhlKOY2KeOh45/XgwpJKtUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652385; c=relaxed/simple;
	bh=+bKOBr6oJ3CIXEd1XQ1fLFlp76U82a9LBBJ6ao3VyMY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VYQF/oy/06CHwn6l0Mrt8hubyYnymJPb7+pI28hL9L4vHsx7VqL+ZxsvbpPhJl6Xrl8W7BroTeATTO7XjOiiCaTeiLGusXPPqA8BHe5fvNXNENJJCOFhtvwvp/BoW4tu8Gd6Kuvet1F7+aWc0JFj9DiuvFtK0bHG9L6sI5FJEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f/g8ECLL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f/g8ECLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5618DC4CEE3;
	Thu,  3 Apr 2025 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743652384;
	bh=+bKOBr6oJ3CIXEd1XQ1fLFlp76U82a9LBBJ6ao3VyMY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f/g8ECLLssdRV6tGolsPoTRy7IWzCpgWUBDHNBdbTWeMblM2kypdLGk4uI0xsFOQI
	 gQ9Vm7u1fq1I59V/0yVYB2EPUYCzu6Pxnbr82KYvqLQmeY2TS7Mmqihe7P/G+7Z4hZ
	 /XxXTE2RvcqyqNqC37G+FTn1EtWdj7A3Tie58pTg=
Date: Wed, 2 Apr 2025 20:53:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@redhat.com>, Oscar Salvador <osalvador@suse.de>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Peter Xu <peterx@redhat.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mm/hugetlb: update nr_huge_pages and
 surplus_huge_pages together
Message-Id: <20250402205303.17846a389ee2ec2a9ee7ae13@linux-foundation.org>
In-Reply-To: <8f63f6bd-41ab-c819-291c-f66c239da27b@huawei.com>
References: <20250305035409.2391344-1-liushixin2@huawei.com>
	<8f63f6bd-41ab-c819-291c-f66c239da27b@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Apr 2025 16:12:29 +0800 Liu Shixin <liushixin2@huawei.com> wrote:

> > +	/*
> > +	 * nr_huge_pages needs to be adjusted within the same lock cycle
> > +	 * as surplus_pages, otherwise it might confuse
> > +	 * persistent_huge_pages() momentarily.
> > +	 */
> > +	__prep_account_new_huge_page(h, nid);
> > +
> >  	/*
> >  	 * We could have raced with the pool size change.
> >  	 * Double check that and simply deallocate the new page
> 
> Hi,
> 
> Sorry, there's a mistake that the nid may be mismatch.
> Please use the following code to fix it, or should I send a fix patch ?
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 39f92aad7bd1..6670f9b9e07a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2271,7 +2271,7 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
>          * as surplus_pages, otherwise it might confuse
>          * persistent_huge_pages() momentarily.
>          */
> -       __prep_account_new_huge_page(h, nid);
> +       __prep_account_new_huge_page(h, folio_nid(folio));
>  
>         /*
>          * We could have raced with the pool size change.

Yes, please send a formal patch, with

Fixes: 2273dea6b1e1 ("mm/hugetlb: update nr_huge_pages and surplus_huge_pages together")

