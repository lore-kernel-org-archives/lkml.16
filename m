Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4F1FA85A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527461; cv=none; b=tq2ZjmRz0CxPHfxD+AgoHW3XWhSXCkkWUHU/8kgmO0L2EuxTh2Qem7A2RaSmgVrtsfxNKj3WqW1FVM/vnZNpJ6qJPrNpPzgxJn1WcVBmREsWxxjxPDqSjHSOFXdvTfcyC9XFZn8czKqM2vf+RON0igd5PvUAcT0e0ImP3o9W8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527461; c=relaxed/simple;
	bh=+FLmkEJLxnn0t1SFKH2SYhc23RmecfOC5AGU1/q3Sww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMruW0/Q1kOIqzEJqNtLLGpEfRQR2M1zpyk5ZDttN2Z2r+kr2eVPSoANeqAcmT2VZq9kwI3iKyyBLieinlj3vCfguOS3MeftNDLpp9ad/0bXyUS2fwg/qUarN8zftRlAIEQph5AGUVIYjG/zVRyc383svcgZtaHF3uOS0FueTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrqDkYrs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrqDkYrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745527457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VlD1UGLoKaM4/OKY+RkJv+zy78b7qBx3xfOdszuQHZU=;
	b=TrqDkYrsfI8U51TvxYQgb7tcLozXGPuWG6k2cioNa3qSUajGoIKvZnzpme2GjnrrLBhKV9
	wSwP0aFRWXgMYoUIeu0FLSL7R5IneQiVg09QgX7N2NDxCvFjy61AdUDuKR8kE+QRK0jK/0
	u/Pb8a2U3JCt6j/F7xRvAVoAtjYqtPs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-7j0X9yZiPqOf5H9LypYSow-1; Thu, 24 Apr 2025 16:44:15 -0400
X-MC-Unique: 7j0X9yZiPqOf5H9LypYSow-1
X-Mimecast-MFC-AGG-ID: 7j0X9yZiPqOf5H9LypYSow_1745527454
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so10889715e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745527454; x=1746132254;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VlD1UGLoKaM4/OKY+RkJv+zy78b7qBx3xfOdszuQHZU=;
        b=UlpoyUzbdNiDRgnNJVYkkqUgKApJOWx1M/3+q1/UpQ1bHNRDShI5Q8aoH2rA0FE5JE
         xTe9LoaPy8B1IRV59c2oVzto8+CK3AdWyEg3ADnW7p5TaH9PV8GlVC7Y2qxgRtMNNOMf
         H8b3hGJPCnHvoaj4gKUi5+gliKCpFcjGJBZN2hXRvCZsNjVNa3PA0vrvroaxFco0eEdW
         iJ2KRh918ar5l9C41ZUNsR3NMgk6+3BtXK291Ty53o3O7V8wDtZpIH2saKnzLyEPEWiP
         yD4h87O40ko8cG3J39+hYeRVJHBNjDMMSwAWDgDZ6nbI2FAQa7a53DeECstkhe/LEHUU
         A6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV3zUBF+Dw2cC2xP9TwIBPayUJZqnSfGy1jgWkWbxT66EMS3qTkDuaIezAXrwh/ycyCh8xUZqJ0d/baOM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rg11OZc+2BfYpC7oI2OBVuV3lnRpriJoCvLIH7fv22h3AQ1N
	RDn+ROBp+p/DrM9klNMFgtAdwbf+4XdXU7zZz2nHWOi6hXx2zX1shVjlkepusTkO75mlchOkqk2
	Ijrly7g55hhLUgSCPn+614apBf0XFsOmpTIRlJjiWfWiZ36b/VXDTJ9zLyWWhXA==
X-Gm-Gg: ASbGncswPRXuOsnZRgvp+f3BaU7FLEEFb4gDO3TYfPpG0fLjIOQ4iiptEpiM4cU77zB
	RLumws7jOGMV7rkIb0SwjBcWKizg+1NrDZkEvrx5JeLK0rXCDlDVLra92vSdTr3ieMmjdn/vbHo
	qqbs/9S5j2AELas1+D2ORcMLP/qxMmRXwOLajz1APyKIpWNTxtrNK2mtpJ4F/IchOEBVxy4xNgq
	FjiFojT4gj0qxbIBkjsDVKoDDp9lCzZwbwiwhp1MPF3D5kG2CuWzGI2Mis7Bd1/AdTbvJeDkm3O
	jZWm546T/vhzv1Xp9VacvYIlpdFe++Uw2Cpm1dFYmDbS52l+4F9v9/vNIskq9AsVumWdbTLRB83
	Zm9qcCjM3BrP/hvHh/fWRRhdjg7J/61Kv8SuZ
X-Received: by 2002:a05:600c:4686:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-440a3184289mr5862815e9.20.1745527454457;
        Thu, 24 Apr 2025 13:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuvMOxIiGUybGHWKbwIo/FIH0wI+U9qfUlAVQAatwRULBMrpl/Wn1QpeuGCkWGKV8YrG0L+w==
X-Received: by 2002:a05:600c:4686:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-440a3184289mr5862685e9.20.1745527454082;
        Thu, 24 Apr 2025 13:44:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm277581f8f.94.2025.04.24.13.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:44:13 -0700 (PDT)
Message-ID: <91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com>
Date: Thu, 24 Apr 2025 22:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: Simplify the split_huge_pmd_locked
 function
To: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: gshan@redhat.com, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, hughd@google.com, revest@google.com,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250424105012.427390-1-gavinguo@igalia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250424105012.427390-1-gavinguo@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 12:50, Gavin Guo wrote:
> The split_huge_pmd_locked function currently performs redundant checks
> for migration entries and folio validation that are already handled by
> the page_vma_mapped_walk mechanism in try_to_migrate_one.
> 
> Specifically, page_vma_mapped_walk already ensures that:
> - The folio is properly mapped in the given VMA area
> - pmd_trans_huge, pmd_devmap, and migration entry validation are
>    performed
> 
> To leverage page_vma_mapped_walk's work, moving TTU_SPLIT_HUGE_PMD
> handling to the while loop checking, removing these duplicate checks
> from split_huge_pmd_locked and also removing the unnecessary folio
> argument since it's no longer needed for the validation.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
> Signed-off-by: Gavin Guo <gavinguo@igalia.com>
 > ---

One could maybe split up the patch into a

a) Adjust try_to_migrate_one() + split_huge_pmd_locked() internals
b) Remove all the useless folio pointers we pass then around

[...]

>   
>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
> -			   pmd_t *pmd, bool freeze, struct folio *folio)
> +			   pmd_t *pmd, bool freeze)
>   {
> -	bool pmd_migration = is_pmd_migration_entry(*pmd);
> -
> -	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>   	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> -	VM_BUG_ON(freeze && !folio);
> -
> -	/*
> -	 * When the caller requests to set up a migration entry, we
> -	 * require a folio to check the PMD against. Otherwise, there
> -	 * is a risk of replacing the wrong folio.
> -	 */
> -	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) || pmd_migration) {
> -		/*
> -		 * Do not apply pmd_folio() to a migration entry; and folio lock
> -		 * guarantees that it must be of the wrong folio anyway.
> -		 */
> -		if (folio && (pmd_migration || folio != pmd_folio(*pmd)))
> -			return;
> +	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
> +	    is_pmd_migration_entry(*pmd)) {
>   		__split_huge_pmd_locked(vma, pmd, address, freeze);

Can drop the {}

>   	}
>   }
>   
>   void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,


[...]

> @@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   	if (flags & TTU_SYNC)
>   		pvmw.flags = PVMW_SYNC;
>   
> -	/*
> -	 * unmap_page() in mm/huge_memory.c is the only user of migration with
> -	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
> -	 */
> -	if (flags & TTU_SPLIT_HUGE_PMD)
> -		split_huge_pmd_address(vma, address, true, folio);
> -
>   	/*
>   	 * For THP, we have to assume the worse case ie pmd for invalidation.
>   	 * For hugetlb, it could be much worse if we need to do pud
> @@ -2323,9 +2316,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   	mmu_notifier_invalidate_range_start(&range);
>   
>   	while (page_vma_mapped_walk(&pvmw)) {
> -#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>   		/* PMD-mapped THP migration entry */
>   		if (!pvmw.pte) {
> +			/*
> +			 * unmap_folio() in mm/huge_memory.c is the only user of
> +			 * migration with TTU_SPLIT_HUGE_PMD and it wants to
> +			 * freeze.
> +			 */

I think we drop that comment. Freezing is really the only reasonable 
thing to do here, because freezing is unmapping a PMD-mapped THP and 
installing a PTE table with PTE migration entries.

(the term freezing is misleading ...)


There is one case where "freezing" might fail (if the THP is exclusive 
and pinned), and that should be handled as expected I think: the caller
must check folio_mapped() either way to make sure everything is really
unmapped.

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

