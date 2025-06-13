Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B32E7F0B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822982; cv=none; b=gQl0+YT4B1suH5OCkKzXgP4s8B/5HhugK18+IQsC+C4wRdy4v7rvjwZgjia+CFKtXlzHmgdPHICxHUg7e5ynEidRi1Hu6Bglar79P/Av+eZcrfqFJ+Hf4R3F+XH6vFw7Rpcjyb9MkjtN8wG9CagZ3tLIamjgDF2N9lqbBuAILwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822982; c=relaxed/simple;
	bh=+Lt+aJeoMp4rLXMPXxZCKfS83puQtCI25m4YHfQnEiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMzBcxmEGOye5XsezhEy9FrEvIAt4E7Kp2K647QdUconBW8Ups35s1fgzY9/YWpOEevSbOKr7+r5SAMh4VsYwCY405IxPnpZT5TkF0Bdq+rFxOguB5KOpZEs7t0VzwOyndF7KmBN3HawDn9Fn229g+PH4WUxb1RN/F9MhSWq98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FMbnhciy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FMbnhciy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cZZTAyR3L7xXMolK1buklHExnGw+lKRgc0udrYSBHOI=;
	b=FMbnhciy9g9WNC/UCrXysCewKkFGKIOjuPIwtfW3w9d+viknjpPxonHCoN/XMuXP/sMv8d
	9Qq9oHu8Yl9ONZaFS2dvhAezbw21I+H/zz556k1BlDr5Fz3YwV19IR40InXbIKTKWiacyN
	Dl3wd1eRcF5HxSRnm7EoNxhIE0nAE1A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-xAO8ZxEhPCerlldgGIIgJA-1; Fri, 13 Jun 2025 09:56:18 -0400
X-MC-Unique: xAO8ZxEhPCerlldgGIIgJA-1
X-Mimecast-MFC-AGG-ID: xAO8ZxEhPCerlldgGIIgJA_1749822977
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso1600763f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822977; x=1750427777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cZZTAyR3L7xXMolK1buklHExnGw+lKRgc0udrYSBHOI=;
        b=WUq0DIJxnO3wo86LwPQAP3d+zIQpSdQPBWhInekZrVnz0g10TvTuj6vAokDWXVOa8k
         rDmFN9Jq6B3ZH5ilWEixSM54cnALDICgf+w19BQYa/tTl+HHjTOUnFv9c32tbUuebh24
         nqjvoTYaWBC93T7qj+/qkGqwByYWVkmLilCDsfIm3JqIByhW05nOTp5iXt6QyVy9UYo9
         6MqtUuKHGRWo5kZFuYafSLNUOhyodTUqUJcPQ6ixHe0pf0jmuFKkdsin+dB0vu4gogMt
         6UZrgqBXlYbCKN2vSzFNJA3vJ6ExhZc5XrJBT9bQrkgSekcGk2gT+zxeLyr1aRMJNlIM
         ucNg==
X-Forwarded-Encrypted: i=1; AJvYcCVnbmjrA+XENRrh4fZ4sPZObig2Lk6+vrUx4hS7j6xNy0AYJfLs58aUI/LFEnbcOy+dNzw5NAxswKZi5tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkULBQ89Cy7cI12zVMWOfb1C8+F/QK2mMIsIDtIT9iOhRvUjPx
	aML3+p/o7JGCqey1d5gZnu+JubUJfV6JyNWn/bQvve7OhyMNXqiCpzgR0bWuO8KrQIYz+qLEtD8
	z7e13hv/s9/hHcPmS44iijpZ7NEpZSSvf+3REo57L+3oZxe77FVg3oQbHp8498HV2fQ==
X-Gm-Gg: ASbGncs0sVQo2jr0evSFgp9HyZttXqmfUnTATgxvRwcaFJqrSbi54vxR4gc7c7IhqQy
	bZmz5NVDnaNhaWxmB8V6vuhkdjDt2LhxtpSZWujmXzZfItkpuA8bTlJSwU9Gvzq7NVQtTq0TR8v
	KASGEvCoU/6gO4LeBEdkfpaM2yfd/ORq9hluOc3Eu+eCk98Qh1B63JHg0J22kw7FmXu8rOcwJC7
	7xgA2hQHbst1FM1KMISjWyfwjKPha62j4cFoxiOPsmmde0e/duAjloxfaAyfN7i7GVQ854ytSYY
	tgwvdvoLAzgeQ7rEUEsUt+K+yoSorAuV47bEE8SaeBn55Y/tP26gTbcRKuf+GQX3b36MGW2E7q9
	QFCIdB9yMnJLWEjUkcMvIuqaPhRTfVf/z6M8ECqy7/UnnOJTR5g==
X-Received: by 2002:a5d:5f8f:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a568683084mr2389196f8f.11.1749822976999;
        Fri, 13 Jun 2025 06:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+AUQ67FxQXkXnJvgHJUfRbV65ACh92FVRfsh1iiVxb6C4+UU3bzDrQ82gNo3cxEWrvdCBuA==
X-Received: by 2002:a5d:5f8f:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a568683084mr2389176f8f.11.1749822976593;
        Fri, 13 Jun 2025 06:56:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a543d9sm2440816f8f.5.2025.06.13.06.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:56:16 -0700 (PDT)
Message-ID: <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
Date: Fri, 13 Jun 2025 15:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
 James Houghton <jthoughton@google.com>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250612134701.377855-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 15:46, Oscar Salvador wrote:
> Recent conversations showed that there was a misunderstanding about why we
> were locking the folio prior to calling hugetlb_wp().
> Document explicitly why we need to take the lock, explaining on the way that
> although the timespan for the locking of anonymous and file folios is different,
> it would require a major surgery to represent that difference with the current
> code.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   mm/hugetlb.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 175edafeec67..dfa09fc3b2c6 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6537,6 +6537,10 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   			}
>   			new_pagecache_folio = true;
>   		} else {
> +			/*
> +			 * hugetlb_wp() expects the folio to be locked in order to
> +			 * check whether we can re-use this page exclusively for us.
> +			 */
>   			folio_lock(folio);
>   			anon_rmap = 1;
>   		}
> @@ -6801,7 +6805,19 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		/* Fallthrough to CoW */
>   	}
>   
> -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> +	/*
> +	 * We need to lock the folio before calling hugetlb_wp().
> +	 * Either the folio is in the pagecache and we need to copy it over
> +	 * to another file, so it must remain stable throughout the operation,

But as discussed, why is that the case? We don't need that for ordinary 
pages, and existing folio mappings can already concurrently modify the page?

-- 
Cheers,

David / dhildenb

