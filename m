Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7251F91F6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105447; cv=none; b=a148rdOrkjBTOkOKPBTyiizZ6G/USl+wFI7cXMHuItvtYJijO3mPptAj8KQf7H3SRokn4WW5657NeCq4d3BM1Q21OyjfQGG2J84AZL0UaNaqT6XnOMdQR1oaG6Okn6h1wMH4pye16beG+HQFUp70CClxJIQyDZuWuM4RZFUBGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105447; c=relaxed/simple;
	bh=rDyOKtCQS8e7aGXgxvChEYdJZqGjA66bV7YpMtMh6dc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Huj6Kgsnaq2s8uHrqtQ8UiDAr1gFSMvZKqJDcclhPsLrWUFy5+wwMxEX5YzHPBycqKovAddNAT9Gc0bDsgzANtRIt3nTTegmECaevQsAT+H/OSCGag0pL3sCN+yQKZMjAkmqyrJc21BRK5cVUsyhdtTJP/U2oFNGrABqnBm49DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StpzOx/L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StpzOx/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749105444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qUNsKL2WG//LWRyl0dxuNhJtaytSDeJbo81cMVktrmg=;
	b=StpzOx/L6dOIWaGYUhrDWtrU/OESGNrt8p8lGXUVMl6PIhdIcLVlyiGWT847MUq4GkmVqU
	zXWbE1BssilOXbqU7YYf8OCnpg0+7yVD7pLMzvbZCUMdirK/LUFeSmcvg8Rm241UMdQVs7
	378hBPgQHECP9/c4GZYVACCHjQpczEw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-zsS_2yq-NcKggsOKgLqsbg-1; Thu, 05 Jun 2025 02:37:23 -0400
X-MC-Unique: zsS_2yq-NcKggsOKgLqsbg-1
X-Mimecast-MFC-AGG-ID: zsS_2yq-NcKggsOKgLqsbg_1749105442
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso2747655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105442; x=1749710242;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUNsKL2WG//LWRyl0dxuNhJtaytSDeJbo81cMVktrmg=;
        b=HtdpgTYpARORO5YyqtUUUUX69hlIKml30TJoy5gwGG4mAPnKGvp//vQWxEv9vCjmeV
         BzrvW90RsNCBWBFwan55B6NXsntgwJIEKx8bKp5bLG0rk+9KRMFKk4yulkK2QkjDVQX5
         f+Vq3EbhMKWZm4+WHlmGqwYtgO7OBtJzSKE3I7ML/MLyoDaU+ONjBOnjnKtLbD7vvQdK
         3mnUg5QiK85w7R8kOsutnLE4EoRhVKhHXbco0nOAbDKWvcppDHRaEdetuutLNEvP51ln
         cEltxyW3KSiePWb5nwC1kX7pypvO72ag/SoJiVUnoq2Mup2ZNY4IqAEn5q8I3NuEpx+T
         3LxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmC6SPg1O+nxJ/Z5yCt7ikrfHKuyh2u0uqMBQX5eCGCvXCD8S3lgduJSoCpHYpZ9LQuuAZ21KaOoU5aJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrDXg6b52oof5XSfLl/WPpZjamRFpL2CkgzOa35mu1V4xdnEL
	9Uj4DBciW6SzhoTf2n3PC48DKIV3vcEc4ibzXtFd0UlMvOc6QfLnL+AHP6avT9a2XHL6DkiHdiS
	//u7sWrXdXPaGm756Jx1IkBLVHkY9m8LR1BetKddhaQTZKKOKcgDRJKNUp6Vv4ve6jg==
X-Gm-Gg: ASbGncsZyzKKuh5W15u2aDhI/2shMovJPSQWN6VBhzANyeIg5FUR9MdPAppeLpc8dAV
	ZArtBCoRaLYtGxO88kR9omYCVpFuAHNc+95kQPRV8+KYUL55IKKaGLwY8TP9PHol/mMTLmc/JR9
	JXwawIaLgob6LkjLL73YiOH8U/mCZc6FNokKnAa7RKn3gVUBrNH/rxql4Szl7s14b9+6JuUFKbC
	pwxnHwj5hgVshhBXCTaDA71yFoE9nmmjZqAFFvTCUBvw9kffK/xiFHiFGfpV2SRV4B8c7kG+hws
	7pOzd2fzyH/HAgZpO7O8c04SS3X1dVn16yOybCu99/tBPayP1sbqK3vHQt134fEJA0ApWCYGWKf
	REv7jjE1EyTyELPckAMsAiICHBE6AxUj1hIg2
X-Received: by 2002:a05:600c:8b53:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-451f0a77343mr52623635e9.9.1749105441990;
        Wed, 04 Jun 2025 23:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+f1lvX+Z3d8WumrJl3Iyi8gGNCfiBGN2gsZh5A6452LXk2A+DQXyVzXvsRVFg/Tior3zQjA==
X-Received: by 2002:a05:600c:8b53:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-451f0a77343mr52623295e9.9.1749105441591;
        Wed, 04 Jun 2025 23:37:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb1861d5sm7633885e9.17.2025.06.04.23.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:37:21 -0700 (PDT)
Message-ID: <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
Date: Thu, 5 Jun 2025 08:37:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
From: David Hildenbrand <david@redhat.com>
To: syzbot <syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, riel@surriel.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz, Jens Axboe
 <axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
 <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 08:27, David Hildenbrand wrote:
> On 05.06.25 08:11, David Hildenbrand wrote:
>> On 05.06.25 07:38, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
>>
>> Hmmm, another very odd page-table mapping related problem on that tree
>> found on arm64 only:
> 
> In this particular reproducer we seem to be having MADV_HUGEPAGE and
> io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and
> io_uring_register(IORING_REGISTER_BUFFERS).
> 
> I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and
> io_uring_register racing, only. I suspect MADV_HWPOISON is trying to
> split a THP, while MADV_PAGEOUT tries paging it out.
> 
> IORING_REGISTER_BUFFERS ends up in
> io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and
> try coalescing buffers.
> 
> And something about THPs is not particularly happy :)
> 

Not sure if realted to io_uring.

unmap_poisoned_folio() calls try_to_unmap() without TTU_SPLIT_HUGE_PMD.

When called from memory_failure(), we make sure to never call it on a large folio: WARN_ON(folio_test_large(folio));

However, from shrink_folio_list() we might call unmap_poisoned_folio() on a large folio, which doesn't work if it is still PMD-mapped. Maybe passing TTU_SPLIT_HUGE_PMD would fix it.


Likely the relevant commit is:

commit 1b0449544c6482179ac84530b61fc192a6527bfd
Author: Jinjiang Tu <tujinjiang@huawei.com>
Date:   Tue Mar 18 16:39:39 2025 +0800

     mm/vmscan: don't try to reclaim hwpoison folio
     
     Syzkaller reports a bug as follows:
     
     Injecting memory failure for pfn 0x18b00e at process virtual address 0x20ffd000
     Memory failure: 0x18b00e: dirty swapcache page still referenced by 2 users
     Memory failure: 0x18b00e: recovery action for dirty swapcache page: Failed
     page: refcount:2 mapcount:0 mapping:0000000000000000 index:0x20ffd pfn:0x18b00e
     memcg:ffff0000dd6d9000
     anon flags: 0x5ffffe00482011(locked|dirty|arch_1|swapbacked|hwpoison|node=0|zone=2|lastcpupid=0xfffff)
     raw: 005ffffe00482011 dead000000000100 dead000000000122 ffff0000e232a7c9
     raw: 0000000000020ffd 0000000000000000 00000002ffffffff ffff0000dd6d9000
     page dumped because: VM_BUG_ON_FOLIO(!folio_test_uptodate(folio))

CCing Jinjiang Tu

-- 
Cheers,

David / dhildenb

