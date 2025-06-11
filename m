Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F11E485
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648200; cv=none; b=VfU4UDxNqnGDzsSbfL1BO3ZW42JH+HZIbCkNZ1d6xpRbk6S58A5+YWrWK4HPnBC0ATZ0NCCgofkxrdg0XI15NURaT9jWXtGlZWK9PkZ41SfdYgdNsnxkyqq7/A3SbrJ6S0ni5piwFZyCngpqZ3DOwrjmCCwqY9XOa4O2uFR8U5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648200; c=relaxed/simple;
	bh=+WY6d4RkhpBK3ina3UwS+8YK6EUelz1vyfIQm/cWCzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFc/ZyqJgO3vG5Xu0YKG+GTjukgnwGRDoJuD9eVVWZgdtpFlGxgQykngU/FuhkbwMQWjbrrUUFuCDc/5YpWLuKkeJMpkvVCmW5eI+wd1pbFIY2EgrD3tiauMczkiPhH38wpBhewsbH0X7ndaQ9GChwfQcxfR85Xb+lz84G+1Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gddAmhxg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gddAmhxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749648197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TEvxPuNOHf5lmtmN139ydl7Urk56yLoW5VCpac9a6oM=;
	b=gddAmhxg9Nhvw4Ts4HeNBVUQ5qG3hxHFILEbF2RpZvFjxRaQfTwXWfhgdw+L81/DvUwagL
	f/vfF0bD5Rt4pJ58z6b5h6N/PPLQbWDWSmx1WfVR5HYtNl7JFzrsqTPMSwqCUOQgxpc32B
	xpxUhL9EGHjpTbLn5cjsmGmUNVtUvOk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-ud4L29_INc2ejtDPmjFQFQ-1; Wed, 11 Jun 2025 09:23:16 -0400
X-MC-Unique: ud4L29_INc2ejtDPmjFQFQ-1
X-Mimecast-MFC-AGG-ID: ud4L29_INc2ejtDPmjFQFQ_1749648196
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad4f82182so100404206d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648196; x=1750252996;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TEvxPuNOHf5lmtmN139ydl7Urk56yLoW5VCpac9a6oM=;
        b=Nil0zrG6QWcvRFf/Z5VNGzWAfSlPRLJrX8lCGFdLJIcJrU4qvaK1zLW5NsqxrO66bG
         arLr+hAF+NSlPSgHn/3MueE/bT8gAaJz1tV8qnTYdMfdwuBbZe+ZA+G90fGIvnUC2EZL
         kg6qaA0a//Y2+q1GZTFYbpsiWdUXINYqFEa09vmig7xRfyGh03tep9jCsT0zEgvE4W4+
         j8tqSfhOMZyCUO09JYyVL79BBqdCksRlT/nlNoYBrwXyawZ01PWPOtuPOoN51oDk5xDI
         14zu5LqLXnEOC3Y2BIIAZnU5ZacNs3/s+6sm2wWhSbUXTH9HynL3qJxpOYXdFS5etOJN
         RXpw==
X-Forwarded-Encrypted: i=1; AJvYcCWRTk3YPqbbNEErylYnKSK/JZsi32mMEIHuBtb0zQoLbdONWl3VGNh77DxYdVtoecqokDxLWyaMW37epiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynxtA41xcZdgO7LEWkyedmmBdjCv7qVdvPUDGR/wJQ8JF47JIW
	foeLRCuZbp+QciUHMdQaXXhQIMxOv30Fj+lb8cNc+nU9pEUyq2Nfz3xtleVYBk9lctLDQVSx/fq
	it1mbCs5++G68TwZIACRm8z/ykEdkQdOKluR4btVjEVrVyb3wh7hYxqKbim5Jant3uQ==
X-Gm-Gg: ASbGncuGuKbrPiZJa3LafY0NA/wXH7I/D/9Je0XKSrvX7H2gq7cUSfYi0RDMUitKsBH
	HBK1vHoWinUC699/qHf9DsQxvQRtJHvSiJpxZSLJH9NvEkGfyRxp3zlNbQhJINzwFEDRML3BiC2
	1lyB3maR31pqQnIYU4t7hZg/ZXcASWjlxE/cllqz6PVnNdmXNUR4GcdQKg3UCn8Rc/m+/JNn5+M
	fhZJiupY2z6MZOHGo1124PhKeSTJRyuPkW0bRhQkvckbLETstsFT7A3gXVQDOuVmIorMim6yNYl
	z21JWq3lHBnVbWihsRzjrK0Z0noiO1eEsYT3lkmULhoc
X-Received: by 2002:a05:6214:1d02:b0:6fb:414:77af with SMTP id 6a1803df08f44-6fb2c32437fmr58536356d6.7.1749648196229;
        Wed, 11 Jun 2025 06:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ+h3Gv2tY1tBazm9JA5l/Qs3JTuvtr1r3hhuMIZ5K7Qp3XUtLczCFRUTUoyXFQ+y+SFbWYA==
X-Received: by 2002:a05:6214:1d02:b0:6fb:414:77af with SMTP id 6a1803df08f44-6fb2c32437fmr58535946d6.7.1749648195855;
        Wed, 11 Jun 2025 06:23:15 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a1c1sm81085646d6.92.2025.06.11.06.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:23:15 -0700 (PDT)
Message-ID: <9cbaf817-7a33-42d8-ba39-fa1b448266f6@redhat.com>
Date: Wed, 11 Jun 2025 15:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm: Call pointers to ptes as ptep
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250610035043.75448-1-dev.jain@arm.com>
 <20250610035043.75448-2-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250610035043.75448-2-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 05:50, Dev Jain wrote:
> Avoid confusion between pte_t* and pte_t data types by suffixing pointer
> type variables with p. No functional change.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/mremap.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 60f6b8d0d5f0..180b12225368 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   	struct vm_area_struct *vma = pmc->old;
>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>   	struct mm_struct *mm = vma->vm_mm;
> -	pte_t *old_pte, *new_pte, pte;
> +	pte_t *old_ptep, *new_ptep;
> +	pte_t pte;

Could have left that on the same line ...

>   	pmd_t dummy_pmdval;
>   	spinlock_t *old_ptl, *new_ptl;
>   	bool force_flush = false;
> @@ -211,8 +212,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>   	 * We don't have to worry about the ordering of src and dst
>   	 * pte locks because exclusive mmap_lock prevents deadlock.
>   	 */
> -	old_pte = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> -	if (!old_pte) {
> +	old_ptep = pte_offset_map_lock(mm, old_pmd, old_addr, &old_ptl);
> +	if (!old_ptep) {
>   		err = -EAGAIN;

One of those things that's completely inconsistent all over the place.

But yeah, I agree that ptep is much better for a PTE pointer.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

