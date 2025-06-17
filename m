Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0A5C96
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159647; cv=none; b=e6Uh4dOM/UqPtKAPyeZTVo8fj6xCeD8Ac/fnKshTmFsDRKagyu024GYNHEwRiTH5pF3y/USNjhZ9nErF6acYfd5SnyhAkgXqGEDEQyzclOq8Dt7DbfjtRjaAMyjXtdugaZGbGWKZJLnFGrwp10W+6bl/xgc9JOgEl8L8HeXcmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159647; c=relaxed/simple;
	bh=VG2wYyYj2uw3wnuUOEMeVxQ+4NFB5RphyoGzGCkL4mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgsNNDao7CnJ9QcMqloDZpBzIl3zT8TwHUTdsiSQbEaNF4WCQS5lU7EmsgjijcKwGXM/EwArNjS4aDo8HdLcKyNuLL2mk8CbJwiar0HwnZR9NOVWb8kTMTIHabBIDiJExVSwlLzgfhMTIy4svgex1gTQkXTkhdmVlG/XE9T6X8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EHgnbGY3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EHgnbGY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750159644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cBv04AzRYwR2RH99FDKl6zOhUz1eEJZnFDjDjLqLuvY=;
	b=EHgnbGY3KgWyRE9AU/G76TIo/Qn1UrUldHr4b765YpBiVybmGMB8i7ZwYc4xcutAyG3vAr
	KFb1h3h6RdCgbrul61ODX1RmZwEfY5f/HlFHH1NGg5E0CsBZviIqA3s8LMl+FfmUoyjDju
	Wlb+Is+bfM5zgH3nhQe4P3ycdL2xAO4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-QqQnGLNnOO675RPJN6ojHA-1; Tue, 17 Jun 2025 07:27:22 -0400
X-MC-Unique: QqQnGLNnOO675RPJN6ojHA-1
X-Mimecast-MFC-AGG-ID: QqQnGLNnOO675RPJN6ojHA_1750159641
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532514dee8so46861585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750159641; x=1750764441;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cBv04AzRYwR2RH99FDKl6zOhUz1eEJZnFDjDjLqLuvY=;
        b=slSzVUECILTTNVBSbRZfDssScfW0U9BI6mp95R3syJycSn3DzWo+IIksuirJKsHcCS
         qfH4uMrQgNPoMUbmZS84sCfHyybUVNVaTJTwxXecdQs5BrtOMDjCvxmSxEZQyMuRmNXf
         3XYzgefHor2CgMTW7LSS+k6nW7pZtIu/yVGZQGPODLn9MKNT6XmRvk91H8tfsgkANW5Z
         P13njqjL04rSYdY1NTl9X4L8xTS8dZAtND4iAibU75W0Y4Trfy2zBVLHhljGQQFarjuA
         Luov3KohJRJJ79XVxpqQPKeBSQVXYdVFcju/RULqG0NOx5w0kx9w4maw4N6Zky9sA1/Y
         Xe3g==
X-Forwarded-Encrypted: i=1; AJvYcCUqOc00TJWbduHrPq9giE0iZhlI29zXYzpg2ZtsbFmuUrM8DBhVVY+il25syQQHWXX8jANUOUZAO23j8Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnJuMk0GfMPtY86yy6ekl8mBoE/EOmucX77y1P5TiERjapFKv
	VCRm5uh3DSfy865mBcwMDutaoAvmDvE2mgUGz99tuWkCTQFPwadCVh6TzFv8kqmpodIr+rN2JTA
	w3h+Y75KRYdGtpWheAsFFI6CJyanhWYdl3XZhpvV1KIfguCAi6sjOT3GksAlAj3uUXQ==
X-Gm-Gg: ASbGncsXPj4ejrwOVfb0nRUGKv5iTR8vbrsc9zzXV4rz7kfW5Oe+Pn9SKHsBxSR4TnE
	vLwVO342RL78svL3ttrV16QHJkYUbHM8UjzCBvh1UBoZOqBc/Gw1Km/fN9PnwXERZQoZUpzlmYg
	da23QwJHSQwefQFcX1J4stbmC4nkMMtv82QoWgUbzRA+1F7ZHIzOC3rZGixgGr4yXzKgl3AAC94
	QDlb555LiAAIzoolpv3mNhXjaNT8KDyEL+whXTyCBU7I1Dnmhz9VrbKDzLY+AvY5F57p+R8c8r0
	Cz1iMI3yWuLje1YWDttwaeADUWs3PmGnqqY8kAyjigLMUtwgidSokBku6hGqTZBSbdnda7x6GWc
	BrTWIfdw5QdvkIGzXrmcW6FHjlAKlCqtcc23E/S+t4FZZ3gE=
X-Received: by 2002:a05:600c:c16a:b0:450:d614:cb with SMTP id 5b1f17b1804b1-4533cacab63mr109784215e9.33.1750159640413;
        Tue, 17 Jun 2025 04:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4nTkxALRXp8tpUHinMo02ZnDSVCD/WKB2nv0p0hL3MZb2bfGKStHwvst0rB5V378o7CAU6w==
X-Received: by 2002:a05:600c:c16a:b0:450:d614:cb with SMTP id 5b1f17b1804b1-4533cacab63mr109783975e9.33.1750159640056;
        Tue, 17 Jun 2025 04:27:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e09c2ffsm171012335e9.18.2025.06.17.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:27:19 -0700 (PDT)
Message-ID: <11a1d0f7-ef4e-4836-9bde-d7651eebcd03@redhat.com>
Date: Tue, 17 Jun 2025 13:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
 <aFE9YTNcCHAGBtKi@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFE9YTNcCHAGBtKi@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> 
> I see, this makes a lot of sense, thanks for walking me through David!

Well, I hope the same logic applies to hugetlb :D

> Alright, then, with all this clear now we should:
> 
> - Not take any locks on hugetlb_fault()->hugetlb_wp(), hugetlb_wp() will take it
>    if it's an anonymous folio (re-use check)
> - Drop the lock in hugetlb_no_page() after we have mapped the page in
>    the pagetables
> - hugetlb_wp() will take the lock IFF the folio is anonymous
> 
> This will lead to something like the following:
> 
>   diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>   index dfa09fc3b2c6..4d48cda8a56d 100644
>   --- a/mm/hugetlb.c
>   +++ b/mm/hugetlb.c
>   @@ -6198,6 +6198,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>    	 * in scenarios that used to work. As a side effect, there can still
>    	 * be leaks between processes, for example, with FOLL_GET users.
>    	 */
>   +	if (folio_test_anon(old_folio))
>   +		folio_lock(old_folio);

If holding the PTL, this would not work. You'd have to unlock PTL, lock 
folio, retake PTL, check pte_same.

>    	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
>    		if (!PageAnonExclusive(&old_folio->page)) {
>    			folio_move_anon_rmap(old_folio, vma);
>   @@ -6212,6 +6214,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
>    	}
>    	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
>    		       PageAnonExclusive(&old_folio->page), &old_folio->page);
>   +	if (folio_test_anon(old_folio))
>   +		folio_unlock(old_folio);

[...]

>    
> This should be patch#2 with something like "Sorting out locking" per
> title, and maybe explaining a bit more why the lock in hugelb_wp for
> anonymous folios.

Jup.


-- 
Cheers,

David / dhildenb

