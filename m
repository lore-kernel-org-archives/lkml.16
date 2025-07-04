Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4562DA77B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751626045; cv=none; b=uu1b0gyrChdbd61MytpLu+ijy0kHDJMODPpM2I5xcde0pseLSnbQgwRvD1giehaurvzhr/LDIR0urajEEt/9gSCo/NignvWa0oHkxczTF8oyrHSKpbxHoA8YUm0Y4JXZebiuQNKx2fRTYUVYw/krFMNTpA4yhS0Q51L8lXZ/ee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751626045; c=relaxed/simple;
	bh=ZfzHSR/pm+cc1OErmwUbAJJI9xphNoHVnSltDbkM+pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3Byea/aHa/3UbZFLdWeB1RFqsxtSlanPsyTtHJt/SOwrj7qiaTmF/eQEUiITbS4iryuQz9OS/W7mKpjyKxXHakRinw8Ypfs0XmwHmOwtgLt1DltfTI6gTDEq7DaM21VWX/Tpqs5k+DL24r15a/vDcw67ZtXBAxRpJTraVM4qEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHcSmheh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHcSmheh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751626042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EanUAC63JHnx0F00R/Vd8sQinADxJHPTAwx399RRfUY=;
	b=eHcSmhehIZkjmfxOqgMZvkpZXt61/hc4TzPn7CxaGnoJNcKphSUIFdZvT8MQh7z+5D0THq
	VAqNuSy+fKzcHRGOBN/icElZtk3s2ntZtQD0NLGzmWCq2bfSjU/+sFUEQ7bzhLWLc0lNIA
	zB610z0gYMd8X0w/DMy+cHXQFcTqpl4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-edXFN07AO468F0x7PSlxWA-1; Fri, 04 Jul 2025 06:47:21 -0400
X-MC-Unique: edXFN07AO468F0x7PSlxWA-1
X-Mimecast-MFC-AGG-ID: edXFN07AO468F0x7PSlxWA_1751626040
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so399550f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626040; x=1752230840;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EanUAC63JHnx0F00R/Vd8sQinADxJHPTAwx399RRfUY=;
        b=rEWgppHYtj3rmApl/f+gjbbEIBlQ42s0ApIUXvOnz6hsprHZRdKFyizmS+b6Ow6jP6
         efTIBP9FUzyqZdMRJwzyD4nFu3BNfUzEJCGnZAmiM9KsJWbBCSbaSLW8E6oJIyGrPuP2
         nznK/1YHe+sD1zsrFcSBBfEusrvez9qF2bTXIbmTFrJN+mglAAzVz0DHIFYUbb5J7iLJ
         7G5WRrFyexcu1pNjr+QHqgMAJgIAdg+0DbLkpru1e/XjM09SlfGPiMcL3ygIgWr5n6g6
         oUHvDuEIHRHXg6/SeHK0xcWB9ptcMPwVAcNdcAfkFT0x/fY57oihF0uNYdKEYgiQnF5x
         o5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQWiOALsxKCmeIrUQ+tMMrV+orkU9i+HrBrnEuxpDgZQsUiZpbi0S+FzLKJMSkLXS8T4bGWDQq7f7PxC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyMisy9rVmG25KgBK/5+ORV9EkYwpHhElM4gJrJGKK2ZTFJywu
	B0Ub20euf2GrmHDV6nIw3BWAHqh/RwYg3kUAn4JgHD+uBzTEgrwIbDiTHxgW4Am8OnZLR4wq0O9
	XPtyBeiq0OlmzQ5OsNP+6ymee9pB1akYvj7+QFjnOe38vy79Q6dZMWRW/feoFMOVfkQ==
X-Gm-Gg: ASbGnct1BuEAhAY7OQLeMbU9Bq7NJDlq1OnvQifD5lC7JCnpO+yPQGk7SjVCoB4Rm52
	EinrqhmynaHUkhdh1s7UvyvjAP2LAAFHQzbHnlsjM0OquGMppRFxTGgJKXTYle2YM6nvyrjbymD
	d+iGWwLTaVGiFRkUWs0mNkSv4dBLwuhcVU06n07tEkibIXxczWtxUZF/y/c2SOLkvt9rpkuNcb2
	kGBChZEVl42hOPprEeoQhgMHp2Eemvn2oYPOcnR4MJ5MgQw3Ad7tT3a8PmZXudQWthc7zz9v1gy
	yD73qRI9+WVoPPbwzB7gdJB8UrwVYyAGmwgUreTud1N/WoUE5Sef61G7LWKQ+ko6gEoIiYaUaBQ
	XwgSZ8U6JCzmT3xELM6hmAHCmtxxAKpMQJBp8PRtrfato8nE=
X-Received: by 2002:adf:9d85:0:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b4936d6989mr1715483f8f.12.1751626040066;
        Fri, 04 Jul 2025 03:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrDhWSJ8OsAFqya5CuQkYJgLqqPE8OtJ1QKP9AddFcgptaJBHZm+3R8G0yJLcRjSogg/9n0Q==
X-Received: by 2002:adf:9d85:0:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b4936d6989mr1715453f8f.12.1751626039587;
        Fri, 04 Jul 2025 03:47:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168673asm23050705e9.26.2025.07.04.03.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:47:19 -0700 (PDT)
Message-ID: <7a6903d0-0ba1-4536-aea0-08ff511f5149@redhat.com>
Date: Fri, 4 Jul 2025 12:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mm,hugetlb: drop obsolete comment about
 non-present pte and second faults
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630144212.156938-1-osalvador@suse.de>
 <20250630144212.156938-5-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630144212.156938-5-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 16:42, Oscar Salvador wrote:
> There is a comment in hugetlb_fault() that does not hold anymore.  This
> one:
> 
>   /*
>    * vmf.orig_pte could be a migration/hwpoison vmf.orig_pte at this
>    * point, so this check prevents the kernel from going below assuming
>    * that we have an active hugepage in pagecache. This goto expects
>    * the 2nd page fault, and is_hugetlb_entry_(migration|hwpoisoned)
>    * check will properly handle it.
>    */
> 
> This was written because back in the day we used to do:
> 
>   hugetlb_fault () {
>    ptep = huge_pte_offset(...)
>    if (ptep) {
>      entry = huge_ptep_get(ptep)
>      if (unlikely(is_hugetlb_entry_migration(entry))
>          ...
>      else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
>          ...
>    }
> 
>    ...
>    ...
> 
>    /*
>     * entry could be a migration/hwpoison entry at this point, so this
>     * check prevents the kernel from going below assuming that we have
>     * a active hugepage in pagecache. This goto expects the 2nd page fault,
>     * and is_hugetlb_entry_(migration|hwpoisoned) check will properly
>     * handle it.
>     */
>    if (!pte_present(entry))
>            goto out_mutex;
>    ...
>   }
> 
> The code was designed to check for hwpoisoned/migration entries upfront,
> and then bail out if further down the pte was not present anymore, relying
> on the second fault to properly handle migration/hwpoison entries that
> time around.
> 
> The way we handle this is different nowadays, so drop the misleading
> comment.
> 
> Link: https://lkml.kernel.org/r/20250627102904.107202-5-osalvador@suse.de
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gavin Guo <gavinguo@igalia.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

