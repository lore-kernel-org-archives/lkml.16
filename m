Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B02286D60
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716817; cv=none; b=QJjsC1s6WApKoLbXydnk6xv+hbkPeC5MuHvYIlvSL3kQ0THNjMW54GZPpaPxmImNyFY1x9/iUIvnOcc4Lh0v7O1NYzbKkMk+slPVJIyDqoWgTTw+Z7nrzUhO28iknFIvOWPXRddJjLxKEq9LYNcW9vcOr6P8Jc1uyB6LziFF0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716817; c=relaxed/simple;
	bh=yUnRA1M7DaalhrzsVzYmdLzgRx9embekTUKlz6SrvT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2gwMuKX29wzeaFIt5PzHZs9vsZ1vTzIixxiQUJza9bXVKV4eOqIc984fIx/+tNhWY83eA7LtrFJm2JrqmmRmMWsXpMoX4TZ6E/Tr6e0qKVyqhD+1HW19+eWYJt0nfLPtUCsUmeNsw/WwRdPYYceUnjkT+CySNXRa1xc2s734rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+hwtsmP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+hwtsmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WojHMjyPBrrPO+Jk8CPiqCE+pjkpTeWIKKEKQdKl8Bk=;
	b=Q+hwtsmPmMKvS9ybnwEgUrSXA9ZZurAmIJ2iXWEAxFhpylFlvz2LsbEy8vweXuW0KJ3Puh
	F7RNZxOmIrBKUEd1KzNVL8YZEe6hWwMSfOVz0kCa04N4gS9mEg0ByTl79sGp2lg5fPSaU8
	hZIJ8R9bqqANHEJ6zJJ45lnyCgC5TYM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-tkPE4HgePzySrRUST6UWVw-1; Thu, 08 May 2025 11:06:50 -0400
X-MC-Unique: tkPE4HgePzySrRUST6UWVw-1
X-Mimecast-MFC-AGG-ID: tkPE4HgePzySrRUST6UWVw_1746716809
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so8663625e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716809; x=1747321609;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WojHMjyPBrrPO+Jk8CPiqCE+pjkpTeWIKKEKQdKl8Bk=;
        b=UijVH1+LE8+f9C7hjYp44hS5zTrbeO1+YqcEZWx81biyjqZZmBk8cTtU8Ru9egqJkM
         4IpGP/UezIQ7Y3c0dgd004zH1K54guibCfwmUGxs02V9LPmbJ2UsTdUSsWX1XGR6VJRa
         U25H33cnxZYpI/JYA72UfMUlrR7SoJJZ2egyL2oUxR+nwnZRlT1G8DRqrzSAsTBFR6ah
         j58VoXb6gTR4nxbXFEaASEDL/p+1XGdOaQ3lJU60N9xKRXx190TzYU/EgIvCDLwvgsmO
         pHNlHcsSpvaQmYXZmPCIlWtcSgTM5Mu24BAtucACiEEY/79qandIOmzXq+j5U2x9tuC6
         90uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6kSfCKzB9zdZxDywDbg00vRIxhIpJ3Gx7Fc+vbQ9jC/HWbBMbc+sL/pXry79wqmDYItfC3zid66XHUBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3mtMgzO0p2V3ppkWhG5geukaoQCix+yHgaw3EUwk8BqzdZeJ
	1v2h80RIQr5AI2hAWCJMpzf8Dzh9BI1FZZZDxlxOWrYLCxNl/771CCN1npYq16fSoUB6QxKiANe
	AncTRIqkfYm8vHoyLfMAkYsQgqJjhy36NHRlM3Py3gwGlj4TIONkUCn0xuObr8w==
X-Gm-Gg: ASbGncsaCAEMRTISgCxt+LFWwr6n+5+sMggNHLcARSY27gwhnIeF7NHVEZiHnkB64q1
	H7WgO9yJNJpS9768Z3ifbBYfgZFUUR1kexY0kYBDyD6/cMycLCZ/W4eRTgRkyy9nM84ENwZ8dAR
	uGKPef4wbkclkZ3i2EQxj3ZZkMwhqO5hWY3K4PNdak7wd5aWCioV8hJ8fcr42oHFTEeD9Q7Bl/5
	E8DoYZXhBaiMFq5bIbEkc8qGbe8BG6qft7RpX/wZxApOwNUMX3HgTzBObXonAeN3dHM1OwPMiRP
	KD7xYIbae0+ipz1RdPkAewMwrJqpqJgvXOInfB/18Sd4r+iCSrpmgxF0sUiKMtboqcpHWJ+Faka
	EprX0F04uo8Z5s4zydY1ec/pEW0NhMhRylgtdKHs=
X-Received: by 2002:a05:600c:190d:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442d02eca3fmr38304655e9.10.1746716809257;
        Thu, 08 May 2025 08:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF143S986Zr+zy6TZomrZa18YRN14BhDxvHl61b2vWZ60lgG1PwAE+taz59cOILHyClnvuF2w==
X-Received: by 2002:a05:600c:190d:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442d02eca3fmr38303945e9.10.1746716808542;
        Thu, 08 May 2025 08:06:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285f9sm40935875e9.8.2025.05.08.08.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:06:47 -0700 (PDT)
Message-ID: <54385633-b320-4586-b5bc-dffbd2ce3b03@redhat.com>
Date: Thu, 8 May 2025 17:06:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Ignacio.MorenoGonzalez@kuka.com, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 12:20, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> 
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
> 
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
> 
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.
> ---
>   include/linux/huge_mm.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>   
>   #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +#include <uapi/asm/mman.h>
> +
>   static inline bool folio_test_pmd_mappable(struct folio *folio)
>   {
>   	return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>   static inline int hugepage_madvise(struct vm_area_struct *vma,
>   				   unsigned long *vm_flags, int advice)
>   {
> +	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>   	return -EINVAL;
>   }

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

