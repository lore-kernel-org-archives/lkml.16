Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D421288537
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213846; cv=none; b=LDeAmCJJOFjztykEt135aq9Fkyw9rVOcOgnQGt3aprOMtPL+unbIYZKdx8O85pNreXEQLEuat8jldr7A9AtxvuxeFR518PfK5FQwMy+wN/sZxLCNYlCEyc2InlA8h5uIr+yjVZ2gQcR96ADhdcHmwD1FC8+r+pUYK5farXKDmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213846; c=relaxed/simple;
	bh=K+fyfi/7cEPPZS+4gqzT7NBL7maJ3CTpPImf2Tt/67o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItiXy9I3RTv4AlFir7VrJcSACGNuMzYTIHmrKqKhMyQ46YBd7n1BugFOLY7iQenbgLKlH44OzRPHjiCz/6fPsPRvJTE/pc87U1neYt5j3BEy+Up/HK+5x9S8bWbNmk0B0A2rG6aOOgp16mJClxVmF/5f9M+8nN3WQrtYbZQFuho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CLtUpVPe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CLtUpVPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749213843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ar6SpSKanTLEMwpjfI2VMVmh2BTyW0PkU6fFk/apfzs=;
	b=CLtUpVPe6YNNy1+dniK4aD9AED0jOD2j4rFimxjhk7TL/pqrGnU5Ul6AMM5Pg3/WOItOIc
	6dtaNK/mV9aayXF65fYST4jGYc+r1fT0HBwnlR8BUJIipsLQLi4X8P7yImGfeIEQhFN4qp
	jlyJKx2NKFeli0g0Wm0fdXG/KVf43JE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-yJN-tPeqMtqBrlcMPS8-Xg-1; Fri, 06 Jun 2025 08:44:02 -0400
X-MC-Unique: yJN-tPeqMtqBrlcMPS8-Xg-1
X-Mimecast-MFC-AGG-ID: yJN-tPeqMtqBrlcMPS8-Xg_1749213841
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d5600a54so16438635e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749213841; x=1749818641;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ar6SpSKanTLEMwpjfI2VMVmh2BTyW0PkU6fFk/apfzs=;
        b=oZ9xhbSK+QfHOZrVSDPYZoSCOJ27nIUQyK8pt0DvbB4zBaYae7JG/ULeAin9BV8Se8
         W8PhzO3ITJvpLsLgux7krYHK0dlaOjzjAAqv/Pa3k//PO13kNxlbPnTfaWrs9ol6gPVe
         FdLt46pjszZ3HmxUEDgNkVJd7yyfY/G4dCroAs+kUCAxQU07aFl4Cmzi8prMSHoPqRaR
         Kp1R6eQ+yH9NehhJstfRx4UEswxP4TmSkbhrRpoxHsi94XunUlh9DACcyMMxG4emnM3q
         KIDQ8Etimra6Ug6Aad+TtihEWUdXqgsNNC6GqJxO4QhpO6w45YulJ9epbKlTBvJ4BmlH
         z+xA==
X-Forwarded-Encrypted: i=1; AJvYcCVFm8qXFWR3t0tq+T5r8I/vRcdVzkHCpNTiuE460W2s2khYuuJn6cfoFdDLpDELWPYGw3F+juuHLEP39Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZOsrn+qk7B4dpMcx2eaoUpwHPcMFwd6D2vCqjKj3wU4y4lWJ
	UfdumeyRv5rYMHtXvSdQNAkW9Ne+ex4bjHp84lKOFYcA6mwaaD/ZjFYE9Xd5PTfTfZwEjJQrn+Q
	Zej44Kt2RMFNb7nYCT9621vDhcTta8z0yuPYoJoMxJUOMNHNfqyr49oGvYlRYPwMaNA==
X-Gm-Gg: ASbGncvQ3zSM3jMPjY1ERfHm3saHJ8wjC+y6mLayIZ8BPBtPCff19jKQEkzlYhqFLbp
	z2vGtMyYJeFHdPr223QUqh9Q+IZoUX8B/QcUmPW1IJb1O0OSYxOezdPu2z64hVQ/7FPcv27dXs4
	9yErPtYL8iW2n+kNXlRuu+//7D9BLeu+0FuYxmoCvytrj04kXPGIjIZkOvacSKP6jsds7WPwwoS
	ZsV43QOw1aU/VAwUBu/honKBwUavSYhB3eGezT2vSTaQnsxaW8M+KAbon018NCG99kdZR4OKV0O
	aNcBA7ovMqk6s5FXXGtw8fgpf2SlnYZ6ohHM23hZpG15/ipYp6jAfAzE3n8AB0uTTgpLMkTkczf
	YFWoK+sZUQGaO1bkd2FRrzcl+luoWjb3H3IjJqow5XQ==
X-Received: by 2002:a05:600c:1c83:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-4520136a9f3mr33012215e9.5.1749213840975;
        Fri, 06 Jun 2025 05:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU8HkkhEPbHgrJMNZ4OfhFtq64ki74ST8iAN9Am0Inv9D8PpEDiwbPnzWb3zxKPDvGBs9jCA==
X-Received: by 2002:a05:600c:1c83:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-4520136a9f3mr33011955e9.5.1749213840553;
        Fri, 06 Jun 2025 05:44:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm20040765e9.16.2025.06.06.05.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:44:00 -0700 (PDT)
Message-ID: <4f4fab59-abc2-4700-8477-edcb68d633df@redhat.com>
Date: Fri, 6 Jun 2025 14:43:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: Close theoretical race where stale TLB entries
 could linger
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mel Gorman <mgorman@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250606092809.4194056-1-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606092809.4194056-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 11:28, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") described a theoretical
> race as such:
> 
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
> 
> He described the race as follows:
> 
> 	CPU0                            CPU1
> 	----                            ----
> 					user accesses memory using RW PTE
> 					[PTE now cached in TLB]
> 	try_to_unmap_one()
> 	==> ptep_get_and_clear()
> 	==> set_tlb_ubc_flush_pending()
> 					mprotect(addr, PROT_READ)
> 					==> change_pte_range()
> 					==> [ PTE non-present - no flush ]
> 
> 					user writes using cached RW PTE
> 	...
> 
> 	try_to_unmap_flush()
> 
> The same type of race exists for reads when protecting for PROT_NONE and
> also exists for operations that can leave an old TLB entry behind such
> as munmap, mremap and madvise.
> """
> 
> The solution was to introduce flush_tlb_batched_pending() and call it
> under the PTL from mprotect/madvise/munmap/mremap to complete any
> pending tlb flushes.
> 
> However, while madvise_free_pte_range() and
> madvise_cold_or_pageout_pte_range() were both retro-fitted to call
> flush_tlb_batched_pending() immediately after initially acquiring the
> PTL, they both temporarily release the PTL to split a large folio if
> they stumble upon one. In this case, where re-acquiring the PTL
> flush_tlb_batched_pending() must be called again, but it previously was
> not. Let's fix that.
> 
> There are 2 Fixes: tags here: the first is the commit that fixed
> madvise_free_pte_range(). The second is the commit that added
> madvise_cold_or_pageout_pte_range(), which looks like it copy/pasted the
> faulty pattern from madvise_free_pte_range().
> 
> This is a theoretical bug discovered during code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with a parallel reclaim leaving stale TLB entries")
> Fixes: 9c276cc65a58 ("mm: introduce MADV_COLD")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
> 
> Applies on today's mm-unstable (3f676fe5c7a0). All mm selftests continue to
> pass.
> 
> Thanks,
> Ryan

LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

