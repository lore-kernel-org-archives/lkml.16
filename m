Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79986349
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849098; cv=none; b=uc7rXmOYyxez/X1/93NIwlvciYOFj2/F2BMW5nodF9ilQqyrYPSb9vJYxuCgrPcUhz9/oOaYTqv3zbbgjYAm9eVXcFh5e/+ZGXhKb4118OB0CESVJI5Vua+7UBJjxr4p0hewHQXL16DUd8mKeIplEVrMPfsxbucIXx5wyN0QOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849098; c=relaxed/simple;
	bh=Bd+7/nIAeYuUyStSOhPWyB1pzbUK7MNNUkAjFiqyxS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RX/BvnqqkCLVBhLnI21OJ7RoVmA/+P1yqd57XNjZMCxpS7Wn7oMyfFXjaSyit7eNefb+QtRoOfAYiYmLRrKagttzwUP02mEHn6BkyjzD0nLSwuP/BzFbBwFWerSLFEoJKv8R/5doF5RqV9GXI58iIpe+fCMMrW8g4yiWaaLYW6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWX2jE4X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWX2jE4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LCPqXznOEi2VAzafxyWUGGwRnIkn4pZb5EHsf0ONcRo=;
	b=fWX2jE4X+OZhQ18YEGMmVX0whQijhO7GWNkONsIquPOW9I3sgAcjWAWFj/y0a9tQBuLBcU
	KSmYdukVFFTcsNlvUn8XSMQbSA4SDXnZ1z88Ko70i2l4tmj/H1O9mzdq0yjJh5ULZv3/Ed
	WyB2HLSkuDIwG6CuSPYRiwuPKl+pa5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-Hei46adYP0e-lZAIUhjmxg-1; Mon, 28 Apr 2025 10:04:54 -0400
X-MC-Unique: Hei46adYP0e-lZAIUhjmxg-1
X-Mimecast-MFC-AGG-ID: Hei46adYP0e-lZAIUhjmxg_1745849093
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so23070205e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849093; x=1746453893;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LCPqXznOEi2VAzafxyWUGGwRnIkn4pZb5EHsf0ONcRo=;
        b=Xz/vDHQ0OVFLRtBx/GTNqg5c4MCAO4Z4jpT7zS/bkT4fdNylz9he0IZe+xp9GY78Za
         c8XTBxAZkEiOqHytiQLSeQJ/IPv4ErGsIhUTEz9wINNg3c2pZObjtp+UcduQLtx7hASL
         tw8fASoiX4/O6WQlkKGPsVjzUFpeN9wm2dbcKT4eemtUlyjiSeDkOPDBElAVEiPdL+Z+
         +FXPrIkU9I03hLgxlvynCcHMGlxfgkERnMi/gmZ2HSzdkQIFAQbEbaXsKmX2yYGB10a+
         4XE0kEpXUPALvAFyPjVh3DjLdPWy2N2I0yoUia7VHKKTCrZEnVJ0mG9gKC5ejvBsJ0lQ
         /B4A==
X-Forwarded-Encrypted: i=1; AJvYcCXZpvENr5MQsB9ui5nNp8d5qSsC96Oq9k5jgRg7vORV+q2ecGveIgCEDJGvOUXuCrS1BNvU/V+syCMPnOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEipT0UF4F+SwYu7oCpl0UgvJNXQJc3sILa0zrxuTseIX4ri4w
	yFOLB2AybGkDfJJYTSNlkuw1bUwIJK+z+RleX0PJfnYwwYnG75O7Pwr+OyiN3tS2SI2dLm/JB6I
	786kZLEEj4Cpc7KiETOegStRNbuRVpqBzYYspSwpWYxQMlWmQJrZUCr46/hVyJw==
X-Gm-Gg: ASbGncslT+gj3KU1YfH80r2EMbiPbAjwqAIChUxY76v+188Ib8EOZDFeza32MQCIqs6
	0gQVnpcZK9+VrDO7qbrVei/HhjAHeVtpn2Qu7nf2fSt+8XknXpvL35/boPzMXDhLXPzRq4bZ70Z
	GV0SnZSEJX/+6hE2IuQpQ7O49CmVuXNjTi2HSe6Lf+jT09t6eJuE9XvpdRtoLJrc8+B6AzO52o6
	OD9vMvawav2PJO+O707vczQrfzowk0Q2AqsXAyIzBPjvvEvAKtcjd2svRSWUXzYyDaGdSDuzrxf
	4SRApJOgcUAg6Kvnl8/Ej3CVIkdfIXyK4aAgyhJR+VocjdNb5aYhVI04UL73JPFmTvS2dKb8x9E
	uUkSxV4+eKAf7HmLHujSgAaqtLVTuqadTZ8kxtNc=
X-Received: by 2002:a05:600c:3b9d:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-440a66b08a0mr102610395e9.31.1745849092829;
        Mon, 28 Apr 2025 07:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJK4O2qWL0SIQ2GwqZNkaVAJoiBY3Z6hHfmUxMrilkaARu1MUCIpMtD7Rr7FPbch96+oAUlQ==
X-Received: by 2002:a05:600c:3b9d:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-440a66b08a0mr102609685e9.31.1745849092294;
        Mon, 28 Apr 2025 07:04:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740? (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de. [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5394bfasm126622875e9.40.2025.04.28.07.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:04:51 -0700 (PDT)
Message-ID: <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
Date: Mon, 28 Apr 2025 16:04:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SNP guest crash in memblock with unaccepted memory
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mel Gorman <mgorman@techsingularity.net>,
 "Kalra, Ashish" <ashish.kalra@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.25 17:01, Tom Lendacky wrote:
> Hi Kirill,
> 
> Every now and then I experience an SNP guest boot failure for accessing
> memory that hasn't been accepted. I managed to get a back trace:
> 
>    RIP: 0010:memcpy_orig+0x68/0x130
>    Code: ...
>    RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
>    RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
>    RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
>    RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
>    R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
>    R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
>    memblock_double_array+0xff/0x310
>    memblock_add_range+0x1fb/0x2f0
>    memblock_reserve+0x4f/0xa0
>    memblock_alloc_range_nid+0xac/0x130
>    memblock_alloc_internal+0x53/0xc0
>    memblock_alloc_try_nid+0x3d/0xa0
>    swiotlb_init_remap+0x149/0x2f0
>    mem_init+0xb/0xb0
>    mm_core_init+0x8f/0x350
>    start_kernel+0x17e/0x5d0
>    x86_64_start_reservations+0x14/0x30
>    x86_64_start_kernel+0x92/0xa0
>    secondary_startup_64_no_verify+0x194/0x19b
> 
> I don't know a lot about memblock, but it appears that it needs to
> allocate more memory for it's regions array and returns a range of memory
> that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
> #VC 0x404 because of this.
> 
> Do you think it is as simple as calling accept_memory() on the memory
> range returned from memblock_find_in_range() in memblock_double_array()?

(not Kirill, but replying :) )

Yeah, we seem to be effectively allocating memory from memblock ("from 
ourselves") without considering that memory must be accepted first.

accept_memory() on the new memory (in case of !slab) should be the right 
thing to do.

-- 
Cheers,

David / dhildenb

