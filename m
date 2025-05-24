Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED9C3595E
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 21:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123154; cv=none; b=Pc7zpLEYyUtFFUpCzwE1wBvBoejP1EgWoCKk5BwPu3ait+B7Vk3YDGPB3LGmx7Myv17v+eQSEzNTqJrW21thar4Pfyub5yzOOH1VV+VTu0fpVmqtAQZXG6Pp3Oi40pl53An9vU42ZDpUgJds0oiEiKBpxSclDOHbIGNQZXNSvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123154; c=relaxed/simple;
	bh=Podk3V7hcIlk3gk/HYNo637BGRvHORddtAxtebFTszs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uItn5ymsxRVGP/0Mr0/0w6dCyJXqK59u30JKuXRY7J0EQBqN/KxoVJbkuc+IhWk161teaHNRPzLTliIpWt2QD3f7bha3jcPtpMaUW1NvRmJTPViY9X8Goi8ZCmDroIEwe9whhOtkJGg+um+oqFKtlaNjleJDQcA+SXx8bO0OeVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPjwgJN+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPjwgJN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748123151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3f0POsuaZwbMCUgkWn24uYMKYFlgMDPWNaKoICRP4SY=;
	b=EPjwgJN+8mctMXoXLL50lWKjPEbdTdiBFGUAT4/KbPnqD4IgQtOiB9Qv+ZWUS8ZwG5P0Oz
	2Q9mA75Zsyr80Qyu8nF/YXeO7qT2VurcCW41Ejnu72tvB0PJlTsgIoTb1FVOhNFbnyXkIQ
	/sOhApf9Fh/sbp9ynLoG+mO+kDjdLuE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-BWJYVWOiM4mgyVl4Umj7Yw-1; Sat, 24 May 2025 17:45:50 -0400
X-MC-Unique: BWJYVWOiM4mgyVl4Umj7Yw-1
X-Mimecast-MFC-AGG-ID: BWJYVWOiM4mgyVl4Umj7Yw_1748123149
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so4047925e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 14:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748123149; x=1748727949;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3f0POsuaZwbMCUgkWn24uYMKYFlgMDPWNaKoICRP4SY=;
        b=Hh0f8fdQBHU37Wfl5VCvIDCKKRYbLLgS5Qj8Jv3IoKeESjmHu7u4gZ7S5c6WsjmDrb
         GUQHNRNyEz0a9HIPxMeA2nBWJh2HlX8A+fhC5iC2UCLSG7uIyvc9/GRFeaTqGy016S+W
         NZAQ5y9HABUy5d1k6wbPgCnyS0sR/rsRm4etwfYOUscQKdFPns4Bf0ob+QlgEh9edfJI
         PSwNPgJBmyCDVwOJgAX7lHxIeppet49WVO7vOWrmp8YEchGSNjWJDNp2jp7y07IplDHU
         zDNxnTaIICb2OqIRXTv5s0v3dsVX9OoiyZqjWXmAUaETZ++D/fbpPc7sd1GLfICGvsQc
         CPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR9Kfe737BLnljVO/xU3lRhjL5nJnse6Q0zc8sGdCArmD3xVNJnRRpee/0ll9UBsb9KVbJK3ahNzB4Dhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84X+POjg/UyBKqWSFGiaRHGLmro7AOhMoTYB0he/vgWTNKGgd
	HZWeB+itSDAtI/NhR5TI8TIWz2AYI3TU71+lRLQBJJQSneOCzj1nA8Qce1TlS8MYL5CinX/XqSp
	EwgmGy3RmX1rRxKVyZoYd8kaGzo4MSI68HJAczJWu8qSGQ8R3g/hrgdviQAzgu1/XkQ==
X-Gm-Gg: ASbGncvfU1Vh5HgJfp+tgiFQruQIz+o8tmUAZ1uqWkf1scj2KnFmtvgjfS/Le7jt7W0
	tD/axwvbWIs2HONnPg7aCnUhlxFz4PO7ksfdr4yt4LtZdEMEqv0qQUZJwgUmvKzARPnOnAocKaf
	dhoGBWK7Gn5fiJTNqHKfc18ZDBpWq9Bz9sm+7TK9GG90SGLlBsQh1IMWRjHY2e7DZudedB1XcVY
	bWeunkHZHurPYqw/AQjs5Amdumsb/5cQ9OhpQ198lnfy35w50hbLsKAHDN/TRuPcUo4vC4FyfQy
	mLxUeVGt7R5fQOAKi/od3DmfOs+Pp0oXRUYsaLoUlzfhYwInPL0dOuTZ8kogGC5EHID/BJ9t5ZO
	gczj7mvOJin85li8mi7Bp/rp6nkzl3pX8olhHask=
X-Received: by 2002:a05:6000:3103:b0:3a3:64b8:84de with SMTP id ffacd0b85a97d-3a4cb445221mr2819786f8f.1.1748123148800;
        Sat, 24 May 2025 14:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/kZfall6GGwVvQtttxy1WCaTjOisnJJX+Hz6av+6a281Q+zZAWkFkgOqElGaB9F++e4CMLQ==
X-Received: by 2002:a05:6000:3103:b0:3a3:64b8:84de with SMTP id ffacd0b85a97d-3a4cb445221mr2819767f8f.1.1748123148383;
        Sat, 24 May 2025 14:45:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:b600:7d6d:5e38:70ec:12c6? (p200300d82f38b6007d6d5e3870ec12c6.dip0.t-ipconnect.de. [2003:d8:2f38:b600:7d6d:5e38:70ec:12c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm191115745e9.23.2025.05.24.14.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 14:45:47 -0700 (PDT)
Message-ID: <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
Date: Sat, 24 May 2025 23:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Oleg Nesterov <oleg@redhat.com>, Pu Lehui <pulehui@huaweicloud.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com,
 Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <20250524164516.GA11642@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250524164516.GA11642@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.05.25 18:45, Oleg Nesterov wrote:
> I am very glad that mm experts are already looking into this problem ;)
> I can't help, today I don't understand mm/vma.c even remotely. But let
> me ask a couple of stupid questions.
> 
>> However, the
>> upcomming move_page_tables step, which use set_pte_at to remap the vma2
>> uprobe anon page to the merged vma, will over map the old uprobe anon
>> page in the merged vma, and lead the old uprobe anon page to be orphan.
> 
> To be honest, I can't even understand this part due to my ignorance.
> What does "the old uprobe anon page to be orphan" actually mean?
> How can the unnecessary uprobe_mmap() lead to an "unbalanced"
> inc_mm_counter(MM_ANONPAGES) ? Or what else can explain the
> "BUG: Bad rss-counter state" from check_mm() ? Or there are more problems?

Essentially, we end up mapping an anonymous page (when install the 
uprobe) after preparing the new VMA, but before moving over the pages 
from the old VMA.

So when we then move over the pages from the old VMA, we overwrite the 
PTE mapping an anonymous page (due to uprobe).

As we simply overwrite the PTE that is mapping an anonymous page, we run 
into inconsistency later: RSS counter mismatch, memory leak, etc.

We should never be installing an anonymous page (due to uprobe) into a 
VMA during mremap() before moving over the pages from the old VMA.

-- 
Cheers,

David / dhildenb

