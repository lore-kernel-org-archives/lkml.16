Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84EF1684A4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705728; cv=none; b=E95bqCnPx6DZWhVF0xJjA7Z6rFQqrEkU+0+VnRrj58vRE/qo6gcykePmVcUySEUbZsiHkCI8jJHhs8v44Tx+qmJFdbzWdG5gmSB7pX+GLEMSb1pQFfDDC4RAmKNJP3YM7W383AeHFHnNF8+C5jJ3UJk9PakHCU25Bn5O/ibrWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705728; c=relaxed/simple;
	bh=4PkaKXGnkG4HBrKYs5ozBct9kCVBqD9BXHtT7RfXMXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEDTWxZwOnO3KnIfaT0yVQeD/APLzSDqQXXNBkRZ1ZciMJ3pNLwUkqpvzzdAawLSdpXvIFj3uVGWF5aGjOwb/G5OwQj8Pn8ictd/ofit7Y0Bhvh6uEhjdUM+LXw8eGezqq6p6WsUAhw4+SnOrbNiQvcAsIAjDfvEY5InojdT8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ngg++/pI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ngg++/pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750705725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v6+xsrJx+U/L1M0U5bQLUpjYxTAKwKf8kRtHgQOrM20=;
	b=Ngg++/pIasuUR+pT7i/vtT0wM7OA2yw9OzcJqtWTxunBSUswFxVyvUFQUxXzuASFyxPz00
	8/NwqH+MkVaVtEsogdfRweMsDsb/ck1aU0RySmQb2aDaJI9S9fz9c8uo/KaZfTGtDlWhPo
	5XbrmYRZGUv76dH/1Ir77CLF4KaQzx4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-shqCVs0hMwe_3bNFzcVWIQ-1; Mon, 23 Jun 2025 15:06:55 -0400
X-MC-Unique: shqCVs0hMwe_3bNFzcVWIQ-1
X-Mimecast-MFC-AGG-ID: shqCVs0hMwe_3bNFzcVWIQ_1750705614
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so21571645e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705614; x=1751310414;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6+xsrJx+U/L1M0U5bQLUpjYxTAKwKf8kRtHgQOrM20=;
        b=E+n0f8EJOU1NnwZGzVC9o8hUPrQ6X73sllqr8hmy3L/bbwWxyGKUW6hOOoghv9tKzr
         PxnoI4TZMpLHOQoGXviXnUH+xOjs0rhG3NtQjzZwQUZz8JRPf+I6G7R17qnZI4tpxS7w
         sB0Um6h4NmDnrR10nZKcUr6a8dsdQzCaLRqkU2y/tY4OnvRunLGa0+QhjHjwjTWrqgbf
         lqc0zIMDuzNRBCPEQIa1xctMTwbftIj14ThLDv9+sC1eWZ7fwPpnJPOyi1MTev+eO8+z
         EloK4SVe5m8Jv/izvRG5Iw+CKVPYWDOtfeFCY076BRMEL+4vy6+gTvWF5cBe8Dz65VGD
         utkA==
X-Forwarded-Encrypted: i=1; AJvYcCUaYzD4H/Rm7yoHJwMWRVDquaxG/M74/2dpecuHMZunSiAUD6NS1quHGZd6nvsAhZ5M1jfnUrKs28xQsNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxc55KIzzQdCWlCHZ+cZcUkXQxDdHoHj6U78lhflPf8RjI7hh9
	PMG0ba5mJYLXMvkLQxSpGVcw5p7OEA+x5QiGEd+UypVt6QwdN2koHEvBAE62pXr5k2gah864CnL
	1yKqyqBWgVDgP9lME3RkSp4l0/MPjdU34xHNFGfeFB8nNXw/JFiMMAIDh0hzK5+fko18W91zzwh
	Zp
X-Gm-Gg: ASbGncvha0EaQX/MT2UuAxTzz3lDnkN0P1SRd5emozl+ciO31LeEzJjcxJ1cALMxxdt
	vidZkfm1siF3QlFlMCw9Rg/pyD+8Yy2JvjM2saYpmHxfj8G9IsUfjU1CnHjVrikyAGdXwnblXFY
	yWbsADe+xam4HLuWbD/ic6Lf8PTkYGZJ3ui0O6P9VNCYmiznxrofdSFd9HC5okLW3a3vgJdC0Gr
	llAsf4jPe2ik1hdV57/xsUT9gDiAepOHFRMWZ5dWu0cCJmNkiYpGRfsoKrKDNSgLySdouHSkOms
	OTzhyIE3ZpCE+HBfPEpeDjZzI0i2Zy8VTc2p0BPJwkRiX0qAdsuhO0XMRfVbSg/nZbNsSq/KuYC
	3c+SdkiTuPSR31SqbfQXeaXA9gOWkNHrxYBPp+PPWM2UnnAFi
X-Received: by 2002:a05:600c:3ac7:b0:450:d019:263 with SMTP id 5b1f17b1804b1-453659aef70mr135344245e9.18.1750705613863;
        Mon, 23 Jun 2025 12:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVg8x6pzMvuJ6hzMYvpzDFMyHeNwgxpx68avx7puQNXKvlynoH4pWU7K0OzT7U2DDNVNIJpw==
X-Received: by 2002:a05:600c:3ac7:b0:450:d019:263 with SMTP id 5b1f17b1804b1-453659aef70mr135344055e9.18.1750705613431;
        Mon, 23 Jun 2025 12:06:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364703f1esm119167505e9.32.2025.06.23.12.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:06:52 -0700 (PDT)
Message-ID: <15891cf8-4866-476c-867f-8027693cacfb@redhat.com>
Date: Mon, 23 Jun 2025 21:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] mm/debug_vm_pgtable: Use a swp_entry_t input
 value for swap tests
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
References: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250623184321.927418-1-gerald.schaefer@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 20:43, Gerald Schaefer wrote:
> Hi,
> 
> currently working on enabling THP_SWAP and THP_MIGRATION support for s390,
> and stumbling over the WARN_ON(args->fixed_pmd_pfn != pmd_pfn(pmd)) in
> debug_vm_pgtable pmd_swap_tests(). The problem is that pmd_pfn() on s390
> will use different shift values for leaf (large) and non-leaf PMDs. And
> when used on swapped PMDs, for which pmd_leaf() will always return false
> because !pmd_present(), the result is not really well defined.
> 
> I think that pmd_pfn() is not safe or ever meant to be called on swapped
> PMD entries,

Exactly that. Just like pte_pfn() on a swap entry is bogus.

Instead, we can test for is_pfn_swap_entry() and then use 
swp_offset_pfn/pfn_swap_entry_to_page/pfn_swap_entry_folio.

Code in task_mmu.c uses something like

	swp_entry_t entry = pmd_to_swp_entry(*pmd);

	if (is_pfn_swap_entry(entry))
		page = pfn_swap_entry_to_page(entry);

and it doesn't seem to be used in that way anywhere else but
> debug_vm_pgtable. Also, the whole logic to test the various swap helpers
> on normal PTE/PMD entries seems wrong to me. It just works by chance,
> because e.g. __pmd_to_swp_entry() and __swp_entry_to_pmd() are just no-ops
> on other architectures (also on s390, but only for PTEs), and also
> pmd_pfn() does not have any dependency on leaf/non-leaf entries there.
> 
> So, I started with a small patch to make pmd_swap_tests() use a proper
> swapped PMD entry as input value, similar to how it is already done in
> pte_swap_exclusive_tests(), and not use pmd_pfn() for compare but rather
> compare the whole entries, again similar to pte_swap_exclusive_tests().
> 
> But then I noticed that such a change would probably also make sense for
> the other swap tests, and also a small inconsistency in Documentation,
> where it says e.g.
> 
> __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE
> 
> I think this is wrong, those helpers should never operate on present and
> mapped PTEs, and they certainly don't create any swapped entry from a
> mapped entry, given that they are just no-ops on most architectures.

"mapped" is probably misleading. Probably "mapped" as in "this PTE is in 
the page tables", not "mapped" as in "maps a present page".

In any case, it should be clarified.

-- 
Cheers,

David / dhildenb

