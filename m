Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA8C22CBE5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877271; cv=none; b=PRjs2UlcGNeQRyk5Tyay9GlxKXPBFuS+qjwtWhMwPWgaSJyYDyHfscF1mkQmLPRUFxsKVq2HjRNCRecu9Hbjjq9ISDRPYsaT6El6uxPN4fF7OnuuuY2bZJch+nVkrKo9n69DEHclLakiFoL/YUqyMYvqdty3we+haSIQqYd777M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877271; c=relaxed/simple;
	bh=Uv3+/U+zgM+1vhTkyy5BBlZt1/QMWw8NU5zupES/zhk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OOQJGwSzZuo0k6oMMySRjQamkEnjuWy//I3XLtgdBNLpFRemvrq3XKJKICbW059QGLpM8R33E7yC/5WTiiWY/HoIvggBp0R9B2NZ4y7HU/h1K48nTE0nDikkhiYmSl90yhEUICx5dWBZlhlFjdSbdlaqLJRyEVVX/eLp5BFwz1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZnYlSfTV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZnYlSfTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744877268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E71bq0dhR32hl/ortlYo/WWbTXVib2v2Z050kFfWZxY=;
	b=ZnYlSfTVRcNG9BSdM3p4VNpfg7mJXzp1Od2B31usVU8S4SjTbJZZMLFlNYyscMK1uSikyw
	9ol+NIuNI5iy1rrjmryS0zFaMZNHrwy67bjL6OJU9ZXs+vjJTPD5dlHM6oI2YbOJ+9l0i/
	ngYrn4sUU5VqBrOUwkNkQmL4chAZ1aE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-bxwGm4UTNgWdSmWLKcnFHA-1; Thu, 17 Apr 2025 04:07:46 -0400
X-MC-Unique: bxwGm4UTNgWdSmWLKcnFHA-1
X-Mimecast-MFC-AGG-ID: bxwGm4UTNgWdSmWLKcnFHA_1744877265
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so2666275e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877265; x=1745482065;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E71bq0dhR32hl/ortlYo/WWbTXVib2v2Z050kFfWZxY=;
        b=m2xRDUmy5xqBSTE3ob4GwZqQcfHFS0BD7puwrB7jKhIAT6l/IE9G5YaLqcfol8RJtj
         y9WJ9lDGHcp+r92Bgzr312QBSpMZNnARbFzpYRQsfl6SBn9/ALtcV8xd08wIVM/vqezg
         YLGnsgc4EjZJMEUKI120lcMhCy4mtIYbBMJ5HUenCDwWXrjn72Hdgds2JoHA/+MqJNje
         JFElHvqZZpbJ1EgkKjs4k6yFhJti5q+l+4hYKL6zdKTyFGoHAey41Fb8oitMos1C29FR
         VvZty95N0fu2rKJObb34yTJGOubpztSc0XZkXDntz9aRDBshrQRnRuNzg/RtINTMKVOh
         gQHg==
X-Forwarded-Encrypted: i=1; AJvYcCXJJZy6fDwZ2tQ7U+mw7vWiM6RX++YL3aYyyVZF+8R03AIohYI81NMTLjO6zpNgsHiBvJAfjlHm056Y2QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2K2EKsKadhx5ChS98Z3o+vk9QNerM55j+2xbuJvWfdXX1hDkK
	5asFNTe9nDKUIFl1qS6o94aTyQMqylF+zgqJ7xLt45uGbmwnqH2V5ZPlf3Ag2pUvxkSyPzj1TYF
	nngL6rxNO4xeXgcN3GodYZWCDuBQVAMZB6ECuVDvqY0QTb5d8NdivvcBsf0sY+UhnUbLnEN+w63
	s=
X-Gm-Gg: ASbGncuHKBrX+xx+qC7BKu7/bLG6pwTxbtNGzSaIrhKfHsx2abTq6jeXXcKdwum3k1n
	W8E/KzqAAle8bah8Nc/egOf0f2zIgE+hMRD5MJ9UMLzMqtrPtTYp0gh5HkbIfp4S7k2I1hRP6tB
	tm07uNM9sBLivkKlaHb1G5bYlze6SOZcz28/vxF48hzQLfwt8ksdCU9hTZCE8wSReknfLiMhT5e
	mQ2avC5Q0T+x1YJNvlG3W8xmVQLUs5HbCiLPHQ0qO7IZFHPH2EJg39vt+MABM1CJmIGwtBzwGXl
	nQ6lOonYD0x/T6dl7M/R0/iHCWcFoVfNq5TYH/5Gb0oC2CC+HoXQhFDZNZ2vbGbIlq8Ax99WHDO
	Vln3fEHzk8ti26Qro+BAMrwSMw9M7BHW35YSlEdI=
X-Received: by 2002:a05:600c:82c3:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-4405d61c972mr48948965e9.14.1744877265406;
        Thu, 17 Apr 2025 01:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEycvgzO+M7Txk6nyRM1nTm7eGATXC/8f4oBFgxGlzjLxZUtcuxk1/4Y0uh2C6NF0qb3nNXEA==
X-Received: by 2002:a05:600c:82c3:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-4405d61c972mr48948745e9.14.1744877265022;
        Thu, 17 Apr 2025 01:07:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm18931460f8f.88.2025.04.17.01.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:07:44 -0700 (PDT)
Message-ID: <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
Date: Thu, 17 Apr 2025 10:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
From: David Hildenbrand <david@redhat.com>
To: Hugh Dickins <hughd@google.com>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, willy@infradead.org, ziy@nvidia.com,
 linmiaohe@huawei.com, revest@google.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
 <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 09:18, David Hildenbrand wrote:
> On 17.04.25 07:36, Hugh Dickins wrote:
>> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>>
>>> Why not something like
>>>
>>> struct folio *entry_folio;
>>>
>>> if (folio) {	
>>> 	if (is_pmd_migration_entry(*pmd))
>>> 		entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
>>> 	else
>>> 		entry_folio = pmd_folio(*pmd));
>>>
>>> 	if (folio != entry_folio)
>>> 		return;
>>> }
>>
>> My own preference is to not add unnecessary code:
>> if folio and pmd_migration entry, we're not interested in entry_folio.
>> But yes it could be written in lots of other ways.
> 
> While I don't disagree about "not adding unnecessary code" in general,
> in this particular case just looking the folio up properly might be the
> better alternative to reasoning about locking rules with conditional
> input parameters :)
> 

FWIW, I was wondering if we can rework that code, letting the caller to the
checking and getting rid of the folio parameter. Something like this (incomplete, just to
discuss if we could move the TTU_SPLIT_HUGE_PMD handling).

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2a47682d1ab77..754aa3103e8bf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3075,22 +3075,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
                            pmd_t *pmd, bool freeze, struct folio *folio)
  {
-       VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
         VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-       VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
-       VM_BUG_ON(freeze && !folio);
  
-       /*
-        * When the caller requests to set up a migration entry, we
-        * require a folio to check the PMD against. Otherwise, there
-        * is a risk of replacing the wrong folio.
-        */
         if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
-           is_pmd_migration_entry(*pmd)) {
-               if (folio && folio != pmd_folio(*pmd))
-                       return;
+           is_pmd_migration_entry(*pmd))
                 __split_huge_pmd_locked(vma, pmd, address, freeze);
-       }
  }
  
  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80d..bf0320b03d615 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2291,13 +2291,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
         if (flags & TTU_SYNC)
                 pvmw.flags = PVMW_SYNC;
  
-       /*
-        * unmap_page() in mm/huge_memory.c is the only user of migration with
-        * TTU_SPLIT_HUGE_PMD and it wants to freeze.
-        */
-       if (flags & TTU_SPLIT_HUGE_PMD)
-               split_huge_pmd_address(vma, address, true, folio);
-
         /*
          * For THP, we have to assume the worse case ie pmd for invalidation.
          * For hugetlb, it could be much worse if we need to do pud
@@ -2326,6 +2319,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
                 /* PMD-mapped THP migration entry */
                 if (!pvmw.pte) {
+                       if (flags & TTU_SPLIT_HUGE_PMD) {
+                               split_huge_pmd_locked(vma, pmvw.address, pvmw.pmd,
+                                                     true, NULL);
+                               ret = false;
+                               page_vma_mapped_walk_done(&pvmw);
+                               break;
+                       }
+
                         subpage = folio_page(folio,
                                 pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
                         VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||


-- 
Cheers,

David / dhildenb

