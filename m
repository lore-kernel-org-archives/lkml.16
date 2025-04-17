Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645B1F8908
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927358; cv=none; b=lbSli9LJFwWLjLfpkhFvZjcsO96xb8vSpZ4QLa9aVhlQAE4MI4aaPrl22ITxa4Son9+946aVztudfyLV2YB0zIqopPpdDBniJqK+tpTRwjtrKXiHY/RyqsmVAVFOYxZPR2DLPbJPB1VNSEHALemz6xrozLRjaQ0oeqcms+f6Ed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927358; c=relaxed/simple;
	bh=W7CCP9L5bFkXyfewGBcCIklWH0IrMGEJ2hwOO7sWpfc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Vfa0vwLs/YrvTA0DtJQmjk7OwApo/T9qXM70U0dB0zkfV7uv4DasPmQcuxR+qGjFB2B69sTtAhbLeNjqLslNA7E5Pi9hn0T0Niod1ZnkRp+504iwqT6jyJXqjbRg3gdn2ZGVTb6hOuPqOrEgzL57avB/a2zZZPwV+pqvA58HmIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dySeBa+/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dySeBa+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37CBC4CEE4;
	Thu, 17 Apr 2025 22:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744927358;
	bh=W7CCP9L5bFkXyfewGBcCIklWH0IrMGEJ2hwOO7sWpfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dySeBa+/bT7WPrUOlSM+GoWCvzrThfqEJXPqBeuo0dWsgt0rn9h/R9bhCxF5FrYlS
	 ViWqh6qDmJedlPmZ2QyiLDJvNlF6GEcmwLp4kuQYiQwlD4ukyP35Tu3bGtfJ20KkcY
	 6vRLNACAJKwqw+SBClHwSgxJw0zN+tIN5O1SoFOY=
Date: Thu, 17 Apr 2025 15:02:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Mingzhe Yang <mingzhe.yang@ly.com>
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
Message-Id: <20250417150237.ba3bbb3f55f992c692932841@linux-foundation.org>
In-Reply-To: <20250417124908.58543-1-ioworker0@gmail.com>
References: <20250417124908.58543-1-ioworker0@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 20:49:08 +0800 Lance Yang <ioworker0@gmail.com> wrote:

> Add a compile-time check to make sure folio_test_large_maybe_mapped_shared()
> is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm_ids
> field that only works under CONFIG_MM_ID.
> 
> ...
>
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
>  
>  static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>  {
> +	/* This function should never be called without CONFIG_MM_ID enabled. */
> +	BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
>  	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
>  }
>  #undef PF_ANY

I don't get it.  Sounds like we're adding a compile-time check to check
for a compilation error which would have happened anyway.

If folio_test_large_maybe_mapped_shared() is only used with
CONFIG_MM_ID enabled, then do

#ifdef CONFIG_MM_ID
static inline bool folio_test_large_maybe_mapped_shared(...)
{
}
#endif

?

Or, as "_mm_ids field only works under CONFIG_MM_ID", make it
not-even-present when !CONFIG_MM_ID?

--- a/include/linux/mm_types.h~a
+++ a/include/linux/mm_types.h
@@ -438,7 +438,9 @@ struct folio {
 					mm_id_mapcount_t _mm_id_mapcount[2];
 					union {
 						mm_id_t _mm_id[2];
+#ifdef CONFIG_MM_ID
 						unsigned long _mm_ids;
+#endif
 					};
 	/* private: the union with struct page is transitional */
 				};
_

or

--- a/include/linux/mm_types.h~a
+++ a/include/linux/mm_types.h
@@ -436,10 +436,12 @@ struct folio {
 					atomic_t _pincount;
 #endif /* CONFIG_64BIT */
 					mm_id_mapcount_t _mm_id_mapcount[2];
+#ifdef CONFIG_MM_ID
 					union {
 						mm_id_t _mm_id[2];
 						unsigned long _mm_ids;
 					};
+#endif
 	/* private: the union with struct page is transitional */
 				};
 				unsigned long _usable_1[4];
_



I dunno, it sounds like something hasn't been fully thought through
here.  It's hard to say because the changelog is unclear.  Perhaps
start out by fully describing what problem the patch is addressing?

