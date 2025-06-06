Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D0283FF1
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197563; cv=none; b=Hgocf3nX9QkTDYh2lqMjRfSa0vtWdjv8GWiM+03xeW2IuOloIGZE693nBwvnTeRV1qH/bZWwv4o9uYfkxKzbQPGqC5TlLiqpR8DzP4H4+z59daV+vyWXWxb64R/zt6bIPx+bE+5mzhP7B5AOaykkkWLCp6mtH9txgfPdb9UJKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197563; c=relaxed/simple;
	bh=0RHUkzzOsxuiXw8QdZXtUXPvGUpo/G0Xi9x6XtDeUAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYPGmcIQmvlDpTLlMQV9ayzwm32BH2VH/25qECD0iWWOXVas9ZHE7yCCj3kJsqebNKUo1/dnTwut7Qy9Fj/AH1PQCrHd1ow78zMwopKeSpOJx6ifoy0mc+naSzogeYpmxd572btZWnlDsUe7k6qP966Zw2oNikm0cs0Yav5D3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbdoSZtn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbdoSZtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749197557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=89aUmnValRJC+SsuSllNNBy7wtd5PwsyNTSn/w3YVNk=;
	b=bbdoSZtniVyCXd6iQcB2BQWDTuFSXbZn2jJAfIPdDsDioZ4LIIHDiC9xKVxXqLMDOncZEZ
	GQbtEcU8VcvcLTBGuaZnD1gcOl+qTv/0MwrL6vhxatyQ4NRwY0JSc4XRlBNkqvaWLbMZ9e
	1XWXLFZ15cyVdDccMbMGJLU3caD7lrE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-mFAeIfcfOuWPYrCz4clcDg-1; Fri, 06 Jun 2025 04:12:36 -0400
X-MC-Unique: mFAeIfcfOuWPYrCz4clcDg-1
X-Mimecast-MFC-AGG-ID: mFAeIfcfOuWPYrCz4clcDg_1749197555
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d021b9b1so8172825e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749197555; x=1749802355;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89aUmnValRJC+SsuSllNNBy7wtd5PwsyNTSn/w3YVNk=;
        b=YlDu1G/SGg1RPz3GA/ZFWFRt4NRCY7r1bN1bthv/Zk4COtOb/ec9yEJo+trCWi4imH
         1GIfHMnAoprbfbf3Kv4hiWmK54tIFyzl4yW4opFlsLJotkpbMdHg7a9AWQuq1VGXkxKa
         HUxh3ssLa38u4JFTjFRYDKOEtd1hB/8g+m35/Mwjl4uGzYpY5nW/LZ6fnZWl11SH5DxX
         rWw2Jn0CXX2FP4UeYG9Po1dfXgqa8mrWb2qNqbWcDv1Es+DeadSe7ksTPN3gOpdDkjAe
         FWIShAWIPRvdzct3XMYDEXTQi8M2a4VapGW53oXXERkZzEqN+ZoSVGsBtGllEDzmjNFc
         rcGA==
X-Gm-Message-State: AOJu0YxYlbcpwv7MTSxpPNAHJvVCk72qGlNvsG4+7ZKIKQmmYwF7ywph
	iglU4B1Q5waK8HcUMyyp24x7Gs5SXel53x26o2cImG46QCkdCeJP9II8/F4fpNif/gPVFXEn1kk
	sOTFwxE6w76gu+yFG0iM1m0eka4zNW8qTF82In3EHE1VJhxlVXEPZRxXylnEEGJgTSVCpVUm5zZ
	yeq/EQZS2FmE6R1slj2s8MkdkmKYjwYpNT9IXb3USfppmhTw==
X-Gm-Gg: ASbGncu84B2EaIskAIvVJ8AnQedXHiiIDcvHIgiGbXHprXuZ7rX+XbGy7es7eV4hp4P
	Tk7O38rP5OZ+hBSjGnQi7i7Moa2uG99QU/Y/kdRqLBsr+JFPmiKFjOzfteF1VsO8vMxQvNF/YJ9
	AGU7r8rL4aRBX9ZITmvjLHooPLd0tGcNXPsFemSr2Njcdo80QXwoTAyDtI+DmZGUaJFzbx0KSPN
	e9Z2XIWr1YvvC63TtlZfrIgz7bSkXC4c5yRUPKAtMQ7d5pWKW/iyKlDYn1MKuxl9Kt35ga6qML0
	CjqkL+kI1Y3QpeqHpiVGv+kA0ZdPlm5n9uH0XD+MoxJF2yYnboswJso1TZBayg2KQ+pmWse46/C
	rVc+hdJoz+Vc2AtVRqGDlo+K86eweK+4=
X-Received: by 2002:a05:600c:3849:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-452013ec612mr29835545e9.30.1749197555044;
        Fri, 06 Jun 2025 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ4e1UBXnw/ZTQoqzz71972M+N/qVO7drBpWKiotaj6UTqjejCN3L70KnC5SyGh2r8ySbUMA==
X-Received: by 2002:a05:600c:3849:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-452013ec612mr29835155e9.30.1749197554527;
        Fri, 06 Jun 2025 01:12:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce132csm15938315e9.12.2025.06.06.01.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:12:34 -0700 (PDT)
Message-ID: <844bd929-a551-48e3-a12e-285cd65ba580@redhat.com>
Date: Fri, 6 Jun 2025 10:12:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 16:05, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Based on mm/mm-unstable

Thanks everybody for the review -- that must be one of my patches with
most RB's/ACK's/feedback :)

The following fixup on top to use the _FOLIO variant where possible
(thanks Lorenzo).

 From c3b2567f169f10f96b94d61369d8492e3095f187 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Fri, 6 Jun 2025 10:08:20 +0200
Subject: [PATCH] fixup

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/gup.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3c3931fcdd820..25fd0d895e453 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -64,7 +64,7 @@ static inline void sanity_check_pinned_pages(struct page **pages,
  		    !folio_test_anon(folio))
  			continue;
  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
-			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
+			VM_WARN_ON_ONCE_FOLIO(!PageAnonExclusive(&folio->page), folio);
  		else
  			/* Either a PTE-mapped or a PMD-mapped THP. */
  			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
-- 
2.49.0


-- 
Cheers,

David / dhildenb

