Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4A257451
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312182; cv=none; b=Px5dJNm7B4hjYUwCsVZyALWGioqa6yHS2/pVr//9qqMZM48hbKaDSl9q+Hb2dvnus8k5bAl5TK0XDXVRb63NzuOXTZQ29KFjgqSmXr/GIGWRBYRWZHoSfAoZ5SFlAxS+RyffsrR/Y15mgfQl/ljy6hQeop05DOga/UIj0gdspLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312182; c=relaxed/simple;
	bh=/33JcMHExY5cnrs/9nlLApZ1Sp5kMqM6piEwxttGyAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UL8RdSRuw+TP+bqileB0Y4ToSiZrt6x1StbWSds0Z+gchJD8JfS+T5p0G5OEsdyfzy91VZkmT7Ow1krXvpd5CFUzqd8uw1Gevk95XFkBm6/F5JvGh5a/5DWlIIEcyycqsT+W/f1k4xx1Pa+XixW8Ag6AVWUDV14ZbzRzVEo8Zl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LzPiCFAa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LzPiCFAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745312179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t/fkliyhwjYo/6vzpuyau7iSBw7U5UuvVDDapw9CN3A=;
	b=LzPiCFAayElQuzmpjEBKlON6b+A+yqtRQ+ZaHmmwemkPVLoNtiEDsrCiQsu1J7uvpEY3o5
	I6odMiBeSFqy421k/jEYWSyx/0O6fdsBh2CS7z+I/c9X6zZXa/mHyaEa0ZHTVXdZA8e5mU
	A+Iyz3ekBRQ01Y0eJPKzv0NQrO0BPwM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-b9AQLJ75NGaAAE-8t05Jmg-1; Tue, 22 Apr 2025 04:56:17 -0400
X-MC-Unique: b9AQLJ75NGaAAE-8t05Jmg-1
X-Mimecast-MFC-AGG-ID: b9AQLJ75NGaAAE-8t05Jmg_1745312176
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so36632455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312176; x=1745916976;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t/fkliyhwjYo/6vzpuyau7iSBw7U5UuvVDDapw9CN3A=;
        b=mvh+1b9VBXeLAQwENjEoe81S0eyvZQHraFxPK8BzE07V1ZgULVkGmk+C+CcYF/VKWg
         JNaaWCEbIDoNR80a+NswRpYZ7cc0gwLtqtyZ6gX6laD0hyUueKJeGx1HKvw+lRGJ4Oix
         ydxCuHk3y2poZ/r8Xp3gZ1DzDDL0HAsfF9ioHS0nwuocbomy/MoTShbIDoU4mreaMRks
         uQR26dQYCBv8eh2t+UqsrDo3p+m3XTp2gG0LXBgVafuU6utJ55mvo0oSIVgLfVhEk05r
         hl9skFkuMwLkIxeeHcezNDN4yJHduvfn3TVcTTepa+js9EXLQm2Zjk6gIj+BQdCBBT3X
         O4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcRVkL5S78K05JF/w2FxSWuoN8/n7NZXzLJTD9PTYtFo3zQrbihi4uODVnaojW9OUoCMezeWKEiCZUDfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7X4hp4/v0rIRkGi9GtGRi/97rFVTY+hbEZUQscUssYg5RjIO
	QBRLoO5IyNiOSaml/HiSg2l46s8UNb3YKHAojZk1ZDrrXIDVCyEZ5q7r39czS3Z00bwq5+tzKyk
	mCaE7XW40tm0YuD7AgsoCeHzG+HR9tZj8m+lMPFhbdG1jZcCPtTHLpgNfI6ZenQ==
X-Gm-Gg: ASbGnctwsz1d9Cnqft9Hhor9GeSTx3/32F+EbB1h6eVVA8vmKqWGT32lalp/YjljrA6
	7sn05dLvS1lazlSAyYI7YioEPH50JiEA3RWh3KESU09p00k2qlizan9kf3k1zbOiTLtAJbwlNXU
	SR612GpJCONkmvKfKBU5mEAUIM3nZzCvoNMsUZk+CEeYhQ+Ae2t6qm49zzjFSZAObkAVkR7dixP
	Zj6OjkonNxJn63jCE8GXGrw33miUZxJlSzX8ZDd5YDRvdJvJlg0ecPw+tLmwQ68SjRh6SkHNLHe
	ThhTAkhUWZjGZaax+LBZ98AKo0sjnCNk0H+35LOHJETE+bm+9i9emuwN6+8bPC19WAzPZLdUaqL
	1ceFiLlcCSJ40OMHda5qspJ0jTdG1oRPPR49t
X-Received: by 2002:a05:600c:3b9b:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4406aa872fdmr143677685e9.0.1745312176219;
        Tue, 22 Apr 2025 01:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqPiQQsO1+6ekL/9r9ho28+iwatEw09L7oTisyx+CF6U4CL3jK44kFhlTXxgS0d9SPSnjk0w==
X-Received: by 2002:a05:600c:3b9b:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4406aa872fdmr143677415e9.0.1745312175858;
        Tue, 22 Apr 2025 01:56:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433303sm14301077f8f.24.2025.04.22.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:56:15 -0700 (PDT)
Message-ID: <b23ef51b-1284-4168-8157-432c3e045788@redhat.com>
Date: Tue, 22 Apr 2025 10:56:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-4-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418170834.248318-4-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 18:57, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function __unmap_hugepage_range() has two kinds of users:
> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>     Since unmap_hugepage_range() already takes folio and there are no other
>     uses of the folio struct in the function, it is natural for
>     __unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
> v2: fixed issue mentioned here:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m2b9cc1743e1907e52658815b297b9d249474f387
> 
> v1:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m738e9e7f7d7fe4aab6b21782b4658dd65abf8fc4
> ---
> 
>   include/linux/hugetlb.h |  4 ++--
>   mm/hugetlb.c            | 10 +++++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index b7699f35c87f..ebaf95231934 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -133,7 +133,7 @@ void unmap_hugepage_range(struct vm_area_struct *,
>   void __unmap_hugepage_range(struct mmu_gather *tlb,
>   			  struct vm_area_struct *vma,
>   			  unsigned long start, unsigned long end,
> -			  struct page *ref_page, zap_flags_t zap_flags);
> +			  struct folio *ref_folio, zap_flags_t zap_flags);
>   void hugetlb_report_meminfo(struct seq_file *);
>   int hugetlb_report_node_meminfo(char *buf, int len, int nid);
>   void hugetlb_show_meminfo_node(int nid);
> @@ -452,7 +452,7 @@ static inline long hugetlb_change_protection(
>   
>   static inline void __unmap_hugepage_range(struct mmu_gather *tlb,
>   			struct vm_area_struct *vma, unsigned long start,
> -			unsigned long end, struct page *ref_page,
> +			unsigned long end, struct folio *ref_folio,
>   			zap_flags_t zap_flags)
>   {

Same comment as for the previous patch, can we just call this "folio" 
instead of "ref_folio" if we are already touching it?


-- 
Cheers,

David / dhildenb

