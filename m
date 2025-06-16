Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB617A2F7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084887; cv=none; b=hsJ68lZWPtmkeMk6pWQZ+LBMGf/q7qHQXBl/4HlUdsHtfCl9l4n/XuXL2kyQfwfKNh+c41D3Hu7oy8vwI85+8gbtiV9LTYEoR1KUaLsMW5AZbwBLcffPEFVlo2j68nZubkH3Hd9eTVps0GKn/RKrCj5hpTafYPEHFmOCZF4LM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084887; c=relaxed/simple;
	bh=oo9vBL1fXHikeywPnIQDEh+Bd+eMyCeWbNKax8c4hZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2hpO0mk5z01Fc37b2czafhZfqy83SwSDIP6L+jBxtzWKtLu+JyGp9FAmZaGd56fIHlpD1JN5G5d6vDk5/dJ5wQ5A/n8tU0pRXWtxjru70DsTzEX/BmUZqzVLzJ5yXQDG8oPNKF984R6Va/HwRHuTVaS64AK8nf+f+oiiSOQQPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VFIfo5q+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VFIfo5q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HuPaBewR6IGujZqKjcgh9uYB1jgNuOkjXD0O2cZFj2E=;
	b=VFIfo5q+t6rNDg0ZGTSM0XCc4iE9+nOwvX3rILPA/ZKi4Z/8x6n2oORnln1QXlv7r5HzsG
	5AlmTPBYPDGYP0uaiLMQsznsGrPTS4r7fR0bxU1JVNFAb3f7hh5icD5JwDd9Rgigf5typZ
	zRA/ARXH9nu4im3xxyqhfVVwpmE/0XM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-czi6FbdxON6awaJfvBnRXQ-1; Mon, 16 Jun 2025 10:41:23 -0400
X-MC-Unique: czi6FbdxON6awaJfvBnRXQ-1
X-Mimecast-MFC-AGG-ID: czi6FbdxON6awaJfvBnRXQ_1750084882
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so20133095e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084882; x=1750689682;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HuPaBewR6IGujZqKjcgh9uYB1jgNuOkjXD0O2cZFj2E=;
        b=xTFyD+iCGomBokUR7sslrY1Y3tQgjsEnBVVcjtERbh08sIQNZQZGPK7nXLYTJY2AE3
         eM36LoZJx5lZPdoCN81coH+yFrBvnqZT5uKQUsC4w53ClQLXWg4qv68GcPT3APXxplg2
         qm0MtNF4clP6fylgc3jgtvgIGueqx+R6GG+aqTVljkvFFCdUUvNLl3NDVU8+5BNdaaaJ
         HPL6oFaKjFvx1Ym0XHepRFzr+2WD5apvhvWeF0Sof/e0xUt8vqBk6xwGgap/gGmrVLk9
         Dy0us/616qEHsgnnZxQTIM+udjryvygSdOo+504GCmzKaTDOshPmh6zZuLLq6LuDjevR
         keLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiXQoIIdlWwrtP3OTkloTvi0VgOkiFwfAkQOw68h8emgXLSYgS8RQ/4Ny6MY23jQg5gspJp5BnDzZ7lT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7zGjXeZsqTlQjCC9Erk1GKiDinFBge1aszeXHASJVfQTGGMJ
	J5+5zyqVRxg2QyWYPP+VUVXriwOlH6UF4RccznJMEqGFDXycIwBsoI7j/jYjnRk0wChlssteRBZ
	u2p1lAZuadBr+F7cEEixk0qnlW6jcpkD9sZpK9i6/aQWAh2B66WGRa2+17rGr5LR3EQ==
X-Gm-Gg: ASbGnctqxXrrhpeWuhismPGZ/XAfwoNXMA+rTZAor0YpLQT0OFkHCpgPKGv4U2hURmg
	7dbwAg/bkF9fIS9h6VbDHV75dvrXQNDbWNwL+nlwccabSOMBsj8DrJFrO3NqEcmZPXp1CM5SJl7
	yFnkz+E7hyV7F6sR9g/Q4CU3FpegGG6V/k4NsZ7wV/a4V9b8mHhuCdIj+c8sUk5V8kEZfSu7zIV
	LbsYXfJ6/NZKF+zh7/GZ9C5eIlkyV3RKyWciRsp/JxQNBA+Jp0ifQME320JlHv4k2qLvHTmxJUW
	JH9NkVO6J2uvhVT2AsUA7x8QjzvPRDgilwVlTp3a4xohVj32f/LWZMUdnD/diwPXw5manhPewlg
	BiTlTcayJY1K/XQyDrLe9Yl74ijy3y3P1oX0NYC1cc4vJW2o=
X-Received: by 2002:a05:600c:5396:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-4533cad1d17mr87624815e9.5.1750084881761;
        Mon, 16 Jun 2025 07:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/TH81Jq4bCi5rpRen0imaHPnFkwEt7FRSFBId1oCALIeBJAOFYuov/AeYuoGQKk7B75lodA==
X-Received: by 2002:a05:600c:5396:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-4533cad1d17mr87624555e9.5.1750084881282;
        Mon, 16 Jun 2025 07:41:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14fc8bsm146873965e9.28.2025.06.16.07.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:41:20 -0700 (PDT)
Message-ID: <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
Date: Mon, 16 Jun 2025 16:41:20 +0200
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFAlupvoJ_w7jCIU@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 16:10, Oscar Salvador wrote:
> On Mon, Jun 16, 2025 at 11:22:43AM +0200, David Hildenbrand wrote:
>   
>> hugetlb_fault->hugetlb_no_page->hugetlb_wp
>>
>> already *mapped* the pagecache page into the page table.
>>
>> See
>> 	if (anon_rmap)
>> 		hugetlb_add_new_anon_rmap(folio, vma, vmf->address);
>> 	else
>> 		hugetlb_add_file_rmap(folio);
>>
>> So at that point it would be "stable" unless I am missing something?
>>
>> So once we are in hugetlb_wp(), that path much rather corresponds to
>> do_wp_page()->wp_page_copy.
> 
> Yes, that's right.
> That's something I've been thinking over the weekend.
> 
> E.g: do_cow_fault, first copies the page from the pagecache to a new one
> and __then__ maps the that page into the page tables.
> While in hugetlb_no_page->hugetlb_wp, the workflow is a bit different.
> 
> We first map it and then we copy it if we need to.
> 
> What do you mean by stable?

The same "stable" you used in the doc, that I complained about ;)

> In the generic faulting path, we're not worried about the page going away
> because we hold a reference, so I guess the lock must be to keep content stable?

What you want to avoid is IIRC, is someone doing a truncation/reclaim on 
the folio while you are mapping it.

Take a look at truncate_inode_pages_range() where we do a folio_lock() 
around truncate_inode_folio().

In other words, while you hold the folio lock (and verified that the 
folio was not truncated yet: for example, that folio->mapping is still 
set), you know that it cannot get truncated concurrently -- without 
holding other expensive locks.

Observe how truncate_cleanup_folio() calls

	if (folio_mapped(folio))
		unmap_mapping_folio(folio);

To remove all page table mappings.

So while holding the folio lock, new page table mappings are not 
expected to appear (IIRC).

> 
> I mean, yes, after we have mapped the page privately into the pagetables,
> we don't have business about content-integrity anymore, so given this rule, yes,
> I guess hugetlb_wp() wouldn't need the lock (for !anonymous) because we already
> have mapped it privately at that point.

That's my understanding. And while holding the PTL it cannot get 
unmapped. Whenever you temporarily drop the PTL, you have to do a 
pte_same() check to make sure concurrent truncation didn't happen.

So far my understanding at least of common filemap code.

> 
> But there's something I don't fully understand and makes me feel uneasy.
> If the lock in the generic faultin path is to keep content stable till we
> have mapped it privately, wouldn't be more correct to also hold it
> during the copy in hugetlb_wp, to kinda emulate that?
As long there us a page table mapping, it cannot get truncated. So if 
you find a PTE under PTL that maps that folio, truncation could not have 
happened.

-- 
Cheers,

David / dhildenb

