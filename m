Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8B1E1DE8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840269; cv=none; b=uUwFB1p6XwFVt1Yt/GsUTlvYgjNWyo8fEx6/MtN0LqupcCrOMJB3y26C0+xcuqUEVpcxTdtSpJQlbwDd12GQ+5I4y8iPRwdyPkXbbS1lHqkaSX3flB5WfDzY5OnOxMm/2rX2L1426iNTcYCsI1WYxEUHTec/eQ+t3SdziHx/fgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840269; c=relaxed/simple;
	bh=MgusqrsP4jQRvN2ZbwgHtJHD9vJReGL/eON2O25Ohe4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tMvvqmkeslzTrhK5QdkcubwoPAFxdNU61EZVAAO+HOk3Jm6eioWTq/6JABAo860ppodecDiHl/Q5ZuOlgFAmPBnJcyHZslbIcZpZxYsM/HR9ksU/VcC5kx441KCpb/n/j1EQNkuRXPynf7ZId2uaIcx2UC1Q/azQWuMPixOcZ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GjkdCnYg; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GjkdCnYg"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72ecb4d9a10so7636692a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747840263; x=1748445063; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9i49PuCqE8syzOpxQq46ilt6U5tDrx4U1lPzUK5JhQ=;
        b=GjkdCnYgi1vtn18uDRruBzcSz+qchWx/m3043M98MPbZkkaX0T/0Qkti48oa3P237W
         okgEkX3zrWrmKdm+TrUMYPsdawL/0bQZ2dI2ZzPxt09Sy0WEQJckV9tugHRGD0+vKriq
         maSQ7WEJjW3BJJDn8Zqa3fctpl9mM2fmMy2VwB8QwTdbJhbi/XYnzAsr6A/imWbuyJq7
         d1XN4J1+f1hGXTtrHRuz5DvPtzCrEjJvx3XEEtjMp65bc70UdVo4EiKqQ4O9JXe+3/zS
         CgIEDodR9Onj5o7SNE7mLltNvXWuwsHxUQ2JZn0efRPfW17iz/h17baZOu2iRyKgLt66
         Y9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840263; x=1748445063;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9i49PuCqE8syzOpxQq46ilt6U5tDrx4U1lPzUK5JhQ=;
        b=BqvSXrtxVzDKdicBzemLWQ4u+IAbs5gIz7DEenu+GwOcvuccuzNng5tt7Z2yWPYaJC
         TXJI3uRIi7MLMI7fg2kq/ioQiUdRNImGpZV635efh/JcckLlx8mO1gYeO1CRGVDb8t/k
         p8X5gf5RM1aR/GGRBtHkYBX99PVkkpvrMY8f6f8QWpNF1KKJqE2VZeohNXIO00xhEfug
         aqUOtcWK7RSW2/WEoE6XGQ+1SVF/QGXtg8FUdUjdmuqlTQ58NmK1ekdzDkblVGOJRh2H
         5axTJ/U4NBs7/It0agU5H29e5B51CskQafPnIg4V2qms+a1h9IRiIu/lexY9x49m5YGU
         1ZNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvF1gDqJKcGCaoDuHHSZMm+bxQlhPFfD+WaZKPaMHIcTm3NQpkqZA0lGAjXalqgnxNh/sWin+1VgFqbFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVJlxLUa+zL31bnSix3pUHk6OL+bsGsy1ro3LVDM3cOG8o//9
	YSbZgbp6kKoPdcVd1lTDSOd0DTEf44rtxZEyY35NVL2lx23BVaTtjD5Fih8rCayt2A==
X-Gm-Gg: ASbGnculkMP88R0nx21drYHOsBLc6ma5syyX3a6uyem0l/aYk5psBLAJ/l6q+Dgd5KG
	M+Uoy8DaNc9Q1ICfpzpybMp/tNDb0IdIgIL01LB/r0kiFaB1sCuXz4XcD5jTDbZy0wGbgI2ntGo
	kJjOeT82hC3FJ7lRe5N7Mkfq34Dru+UegsV43aRu8fyMRHYk87q/G7OeFVvKttVdPmfoZWHrnb/
	n8QF3oM22xJoO16SFg23lH4rqcFRp8ftVppSkiNf9JZj38DAQJHsebr4M3iAgqnK+8PuRjFdXCj
	818I0GYz5z0hjjwjsB9EzsZyN3PtwCfDrYbfiSULbLHH2NiKlFcUZLE9pDZRP5DB2rEiEvaDvE2
	9dXm2L8SF6f2dCxB6A6IP2rfVZyC292ueBeTz+3bZc+orUw==
X-Google-Smtp-Source: AGHT+IFd0X9cejNLaHAapyuvMyXDy1BdBiZcRkj1K61S3pTev9a+43FMuQ1GnPCmniq9Zk65ksWmaw==
X-Received: by 2002:a05:6830:6404:b0:72a:d54:a780 with SMTP id 46e09a7af769-734f6b61b16mr14246398a34.17.1747840262558;
        Wed, 21 May 2025 08:11:02 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6b60081sm2158746a34.56.2025.05.21.08.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:11:01 -0700 (PDT)
Date: Wed, 21 May 2025 08:10:46 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Gavin Guo <gavinguo@igalia.com>
cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev, 
    osalvador@suse.de, akpm@linux-foundation.org, mike.kravetz@oracle.com, 
    kernel-dev@igalia.com, stable@vger.kernel.org, 
    Hugh Dickins <hughd@google.com>, Florent Revest <revest@google.com>, 
    Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] mm/hugetlb: fix a deadlock with pagecache_folio and
 hugetlb_fault_mutex_table
In-Reply-To: <20250521115727.2202284-1-gavinguo@igalia.com>
Message-ID: <30681817-6820-6b43-1f39-065c5f1b3596@google.com>
References: <20250521115727.2202284-1-gavinguo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Gavin Guo wrote:
>...
> V1 -> V2
> Suggested-by Oscar Salvador:
>   - Use folio_test_locked to replace the unnecessary parameter passing.
> 
>  mm/hugetlb.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 7ae38bfb9096..ed501f134eff 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6226,6 +6226,12 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>  			u32 hash;
>  
>  			folio_put(old_folio);
> +			/*
> +			 * The pagecache_folio needs to be unlocked to avoid
> +			 * deadlock when the child unmaps the folio.
> +			 */
> +			if (pagecache_folio)
> +				folio_unlock(pagecache_folio);
>  			/*
>  			 * Drop hugetlb_fault_mutex and vma_lock before
>  			 * unmapping.  unmapping needs to hold vma_lock
> @@ -6823,8 +6829,13 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  out_ptl:
>  	spin_unlock(vmf.ptl);
>  
> +	/*
> +	 * hugetlb_wp() might have already unlocked pagecache_folio, so
> +	 * skip it if that is the case.
> +	 */
>  	if (pagecache_folio) {
> -		folio_unlock(pagecache_folio);
> +		if (folio_test_locked(pagecache_folio))
> +			folio_unlock(pagecache_folio);
>  		folio_put(pagecache_folio);
>  	}
>  out_mutex:

NAK!

I have not (and shall not) review V1, but was hoping someone else
would save me from rejecting this V2 idea immediately.

Unless you have a very strong argument why this folio is invisible to
the rest of the world, including speculative accessors like compaction
(and the name "pagecache_folio" suggests very much the reverse): the
pattern of unlocking a lock when you see it locked is like (or worse
than) having no locking at all - it is potentially unlocking someone
else's lock.

Hugh
