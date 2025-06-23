Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC781741
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687907; cv=none; b=Ymu0Fr+MYcPGTnprPhMStqN2yVgs3Bd8l0BMBeZy0NNrrWiEkGADtmLCgTv4ZI/r9HmQ0rNnppwNQEq7ekjbwZECnAKWex8w3Phm3QoAp0TiGOBvlAQr0REflbI7p4A+rhoxax3EPc22dulMOJtmanPnJVWrY98xemjlSdStrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687907; c=relaxed/simple;
	bh=FUHhvZYlcxOYq5E/TzuPfl7j5HuWqYgHE1JV3vDizd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDG602KQYD9ZssL2mqSPGNfOyv6haohEXHOqpa8oK08KLL5GrzaNBoMGdX6dN7tYvm24ZdPHTBDPpnYbr75rvB5yaxCZb2fKXXHfeknuYcYVmFVYXmOxcbVJYle9muutt1frdkKYmZ5LEXkAqHHd+m7OkSoSxNCt9jA6lJ+1nIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iop9Pg9x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iop9Pg9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750687902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FbVXkEgSWz83fuzVuKQUZWBWROsTc3StR21eD4GqRw0=;
	b=iop9Pg9xecKEnuWesRm0pbHfpN8Detinep8kimxit02tZPSJwDERs58CtYRipdRDUCgmo0
	t3/qGvdEYDsTWY3vtkzgQqwub8LAm3icM5wcoT14QEO6CP6wFFYTF1JFqckt0PT0AIndCI
	Z0dMXWCq6Bmvm7jHaIvneHBMh/btH1U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-yVE9uwifMT-FceXr46Ghlw-1; Mon, 23 Jun 2025 10:11:41 -0400
X-MC-Unique: yVE9uwifMT-FceXr46Ghlw-1
X-Mimecast-MFC-AGG-ID: yVE9uwifMT-FceXr46Ghlw_1750687900
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1927839f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687900; x=1751292700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FbVXkEgSWz83fuzVuKQUZWBWROsTc3StR21eD4GqRw0=;
        b=Zu5okLXpI6m56hUfq3cw7Ip0ikv7JarUylxF4uSKPklCdeoKWBj94KrXpneExcCgTT
         lA6WQ4I2h789gkU++YNbTt4eA9vwh+jTJjdRxvLmCCI/mkXapM14+v9gH38fv9rY3vUm
         0OS7td7TeqotyS+HDhKrKvW3EUuFwB2dzqsez6Oqbgya/m1ZmRugSIftTW06xKylFSlZ
         t9NMP4j4JBAYGUOBB0dkm7swQiuFwuXKSC4RTHhkHLAYk1XZbMYLaMZwSZPlXiTIuj2n
         EvMrYWriSHi4v2Eptsfky2dulPxrqi/UmjQ5a2Lqc20WxV8blTDDSp7N13+NmtJEgwsj
         R/sg==
X-Forwarded-Encrypted: i=1; AJvYcCXqK7yniguegjo9AzQRIkdk7iJFUfJT0IbHk4jfHj2IIebVao+T9XPmjaDjsXCY/2AUJ4oU66qN3mYLTmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDBqD0opDv1gT8brsFtyiSAf5H75EJ8ImVEMKzNOyN6nDyB8+
	xu4L8TtTmHomSG1tJitLzbPxsNbDWTp16EkGya1zxf3+NehFzyCOJBvlqJeI5YxjqBZjppWk/wB
	gUYGKjzvLYOFYYY2AEbrTMJ1uPYUIkEBysGONMFAcV8fxGyuGt41ZmLPp65JDQ7SjTQ==
X-Gm-Gg: ASbGncu1pjfOuAI69qy39H4Abziv4Pn/OTs0PIRXeJBFGs6AYl/339gKHmaxSZ2KOQD
	UeKOJyOK4s8egffBIQ04Y6hlS8mE+jxybOXAaienfMAtvJkFBkpBqEi7RxgYek+5vmfJ8E+RZjt
	DmYdNNIfzAhMSzZBkiU0XlflENwIogX04SA4z3J89WCQPb1cBs5+A7Bmrnpb6cbgUKGE+VjXDbm
	au5P+cnvVqdKIc49ZQ89USGXwtKaIwH4A2FUv5VGQNoh6D5fIoM/JGYxN9+0oGNlDapU9WjH/Xu
	6Saad17oh1N9MZTy2UZJFZzWNlgMII1RoVOp+VXTMRKs5YHZuEudimy1kS00PlnREU5h+iPo5bm
	R6gYMaAzxyjh2R62vQs7LO49Kb28/wDMkAyBrnAg0+qRYk350EQ==
X-Received: by 2002:a05:6000:387:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6d12d90cbmr11415642f8f.28.1750687900409;
        Mon, 23 Jun 2025 07:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHxOZgUriWqUY6K7qQW6qASUaWvvjJp1eJPWgudBsc01edWF0+wpYwOAJlpv3z/PVsleITSA==
X-Received: by 2002:a05:6000:387:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6d12d90cbmr11415601f8f.28.1750687899935;
        Mon, 23 Jun 2025 07:11:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1054bsm9455563f8f.9.2025.06.23.07.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:11:39 -0700 (PDT)
Message-ID: <35b03911-74c3-4626-aaa8-4c331c086f8f@redhat.com>
Date: Mon, 23 Jun 2025 16:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mm,hugetlb: Sort out folio locking in the faulting
 path
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-3-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250620123014.29748-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 14:30, Oscar Salvador wrote:
> Recent conversations showed that there was a misunderstanding about why we
> were locking the folio prior to call in hugetlb_wp().
> In fact, as soon as we have the folio mapped into the pagetables, we no longer
> need to hold it locked, because we know that no concurrent truncation could have
> happened.
> There is only one case where the folio needs to be locked, and that is when we
> are handling an anonymous folio, because hugetlb_wp() will check whether it can
> re-use it exclusively for the process that is faulting it in.
> 
> So, pass the folio locked to hugetlb_wp() when that is the case.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   mm/hugetlb.c | 43 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 175edafeec67..1a5f713c1e4c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6437,6 +6437,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   	pte_t new_pte;
>   	bool new_folio, new_pagecache_folio = false;
>   	u32 hash = hugetlb_fault_mutex_hash(mapping, vmf->pgoff);
> +	bool folio_locked = true;
>   
>   	/*
>   	 * Currently, we are forced to kill the process in the event the
> @@ -6602,6 +6603,11 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   
>   	hugetlb_count_add(pages_per_huge_page(h), mm);
>   	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
> +		/* No need to lock file folios. See comment in hugetlb_fault() */
> +		if (!anon_rmap) {
> +			folio_locked = false;
> +			folio_unlock(folio);
> +		}
>   		/* Optimization, do the COW without a second fault */
>   		ret = hugetlb_wp(vmf);
>   	}
> @@ -6616,7 +6622,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   	if (new_folio)
>   		folio_set_hugetlb_migratable(folio);
>   
> -	folio_unlock(folio);
> +	if (folio_locked)
> +		folio_unlock(folio);
>   out:
>   	hugetlb_vma_unlock_read(vma);
>   
> @@ -6636,7 +6643,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   	if (new_folio && !new_pagecache_folio)
>   		restore_reserve_on_error(h, vma, vmf->address, folio);
>   
> -	folio_unlock(folio);
> +	if (folio_locked)
> +		folio_unlock(folio);
>   	folio_put(folio);
>   	goto out;
>   }
> @@ -6670,7 +6678,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   {
>   	vm_fault_t ret;
>   	u32 hash;
> -	struct folio *folio;
> +	struct folio *folio = NULL;
>   	struct hstate *h = hstate_vma(vma);
>   	struct address_space *mapping;
>   	struct vm_fault vmf = {
> @@ -6687,6 +6695,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		 * be hard to debug if called functions make assumptions
>   		 */
>   	};
> +	bool folio_locked = false;
>   
>   	/*
>   	 * Serialize hugepage allocation and instantiation, so that we don't
> @@ -6801,13 +6810,24 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   		/* Fallthrough to CoW */
>   	}
>   
> -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> -	folio = page_folio(pte_page(vmf.orig_pte));
> -	folio_lock(folio);
> -	folio_get(folio);
> -
>   	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
>   		if (!huge_pte_write(vmf.orig_pte)) {
> +			/*
> +			 * Anonymous folios need to be lock since hugetlb_wp()
> +			 * checks whether we can re-use the folio exclusively
> +			 * for us in case we are the only user of it.
> +			 */

Should we move that comment to hugetlb_wp() instead? And if we are 
already doing this PTL unlock dance now, why not do it in hugetlb_wp() 
instead so we can simplify this code?

-- 
Cheers,

David / dhildenb

