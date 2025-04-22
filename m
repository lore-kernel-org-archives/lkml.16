Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC11A3154
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745364025; cv=none; b=Z01g4wAX+pAqsZjrk9vnWNpjsqqL0I6wEsRzTnZx6dBtbbepmfEG1iRVvivyNghQGe5nYccp9Xq61ZYSHe+DDv3YIcglVAedBK4Il7C2l7Hn24X9/KUmJ3xzpyyHBKQI6OBritxDfo8vl9BjgAU24Q77KJstXz5gPmiNl3bzaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745364025; c=relaxed/simple;
	bh=toNpLN0b4y+5FtmnTAVhVrQg3drpdjrGHUOUalfpdtQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DsjqXP6hFwYuiWUe74hxgyWogt7pYPlG+NJ4sELiaxdJ51/6bm3EfjoAQJK+kHdONFyP7dbgK1aURm/693mBV8JRs1QbkKL4KDGuwbq3zeO1c2Kkb5PZ4VbZ7j0jfQSd/y5l6Y3CipeuzBGYzLl+8ucm4DsD/jjLirYpvnzTo6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hch8Fpkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hch8Fpkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F3BC4CEE9;
	Tue, 22 Apr 2025 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745364024;
	bh=toNpLN0b4y+5FtmnTAVhVrQg3drpdjrGHUOUalfpdtQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hch8FpkfcH+q0UkBw/Q2FRvIxZrCtNLLRB56Ll6I77rWXDaMbPcEPaUoYDkEEdoZc
	 H19BGn+tcC5UE/InNCz/1CB3yJMwC0/SrajAaLsEZb2Ghu3uPamh0ZUdAftMQ/TdpL
	 hg3zqx374VgtHATFLsTxw5OtHyW6YOjezZblsUeQ=
Date: Tue, 22 Apr 2025 16:20:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, mingzhe.yang@ly.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Lance Yang
 <ioworker0@gmail.com>
Subject: Re: [RESEND PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
Message-Id: <20250422162023.55c4899cfa3486b409289efa@linux-foundation.org>
In-Reply-To: <fa4c886f-81d5-4679-bba3-4357f1d9c6ff@redhat.com>
References: <20250418152228.20545-1-lance.yang@linux.dev>
	<20250420162925.2c58c018defee9ee192be553@linux-foundation.org>
	<641755b75b4ecb9c9822e15e707a0ebf1e250788@linux.dev>
	<20250421122239.710f5d63487853556cb8f57e@linux-foundation.org>
	<f091c3e4183e6d6384f645e609aeed926b320818@linux.dev>
	<fa4c886f-81d5-4679-bba3-4357f1d9c6ff@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 09:00:54 +0200 David Hildenbrand <david@redhat.com> wrote:

> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -1230,10 +1230,15 @@ static inline int folio_has_private(const struct folio *folio)
> >   	return !!(folio->flags & PAGE_FLAGS_PRIVATE);
> >   }
> > 
> > +#ifdef CONFIG_MM_ID
> >   static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
> >   {
> >   	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
> >   }
> > +#else
> > +bool folio_test_large_maybe_mapped_shared(const struct folio *folio);
> > +#endif
> 
> Fine with me. At this point, I do prefer inlining the function, though.

The above has the advantage that if the compiler unintendedly emits a
call to folio_test_large_maybe_mapped_shared(), the link will fail.

I do think a little comment which explains this trick is needed.
