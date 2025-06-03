Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F31DF27E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971519; cv=none; b=Kbi8yU6VUlLdciEzWK7jjyfjwS8OtcjCpM7tSqIaLoETeNyXNymB9L18wn1/P3fKV+Twdf1U2hNo5bGUXwXBj8rBJgDN9UEvZchuqAOFgDJdrDZPrlU7NwosZR2mjSMuv3Qo1KuxwoSw6jSp1kvfxPY3lJyDA8p5xIzH4fGRFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971519; c=relaxed/simple;
	bh=DWQoWHkrbiXZJdZKUxOs5/2E3Tidd2/m0zWUUDqmAns=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PecZkVrRUA6JAmH2FFGh7BDnvNgGUB7pkekMWgr3depr6lu3hapknvZhoCZtlZq+t4BhxEuBaHXPLYWvVqtN4/rRDpxUVnJDsFAfaKK/XVZjqwY9cMKmqX8hTg/e+LWEDozaadrnk/5E4Cx/cSoDGl7xKfEB++bjAOxL9J1vpD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvqQh8vu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvqQh8vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748971515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R2dG1+rfviJFOUiQdv4dBF4ryWMEOV44pR4uWLeRbiM=;
	b=ZvqQh8vurxkWRcySnlSehgSc16yMzs02DxeuuC8+yhDN9F7giaPlLfJpChyMrbS1T/kI+J
	Og7bHz+g2YPn1cUXS+AiTEbF7BPsxDQr9Eot6XYn0GPyqh3YoeMESanKqOI9M7By+tKlvw
	ehN/FDDvxX6L0nFFttP3FjkvhJi/m84=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-nwiwP01DNJWhIBf4xlWMXQ-1; Tue, 03 Jun 2025 13:25:14 -0400
X-MC-Unique: nwiwP01DNJWhIBf4xlWMXQ-1
X-Mimecast-MFC-AGG-ID: nwiwP01DNJWhIBf4xlWMXQ_1748971513
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so18505835e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971513; x=1749576313;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2dG1+rfviJFOUiQdv4dBF4ryWMEOV44pR4uWLeRbiM=;
        b=Sw21ZAGlkVkX16xseDtMvdtmCVYxgOrr/wMTPRsAOEv3yDqu2p2EMfNV0hDxM/wsAe
         u/m0BiZdYVUz2zkp/8IQe1dmmnc0SxFeOg9E74tI9Dn7hcv3q96iV69Hy3s4YI37Drkp
         xOmNH09oJU/C/lmr4w+lUaTGi5/E+EfMHHbDjnEI5wPQlYJt8hYIhTD0fpyQ2gM3RkXj
         tsWyaj7u3YXp0slqea7CRN7isHRNueyKTwFIpSRQaHOQOGNhKQvizrT3o2UyCKLhIqdd
         s1J5DChooD25BcjzYptjGY1v65bZps2hIm4wSik2UsN2DH88sGdXqsyKzhGqoemznQgN
         O+0w==
X-Forwarded-Encrypted: i=1; AJvYcCX2DTj2BjJQqyEeNkR9n2GD543vMwXeJIR7ZA/lOw1BDL0Q7fLVxGPP4EgwO6V4TBNlpe/fpsaKPqIPnZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytFQ7LNSAhM0636ZrQ/6vLmMiPlTPCNt9cq9R4sAH1WnrGpc2h
	vaBi2q66F0d1TFKK3TdwK3K0TDf70bCSOd72rg+s+FzF5gCEnj5KZYfwru7+0cAbaghQP/XddD9
	IqIR6cw9bRN0nsBaxZL8+Tr/+9UUzJMhm9OTDYRxwhveLcC5ZGydh1GEVkRaEju51RA==
X-Gm-Gg: ASbGncuGLj2Hk8CF3puIHwiMIQ8X86zksALaxXy98FuDk7nBq9tDMu65c6eqOFeGoUG
	m990MR8zdM7td6pewn4urjxrUZxqAE2xVbD8/5QXPfoEXNjklVqe1l+sPeAhLNpMJWJIwr3GxyV
	L5Fp6jAQEm7Qyd5LAR8vJPcicMo/bLrvL941JA3GnIwpWJcqrq1Ff/ul3RCCLmYth6+1ZzfU5WZ
	vYn2tpLr1TKQ8Zxtbvf+AFEEkCU+Q4ymIjw/Q8vcd9nOO0ZGf9dQLN9/8JmCN16fUMBvLlLBoWU
	3j7trOMU8E2f+1peCQ7Moiy9GurrOs8t9GLKdjqOV9EXIecqe2xsm0VtnpD5w3OwQnTbotLBLK9
	gip6pIHCY/Ad98ew2R0Ejx08yYtrQsxTeWZhQqNo=
X-Received: by 2002:a05:600c:1c13:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-451e3948937mr42812885e9.27.1748971513142;
        Tue, 03 Jun 2025 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkF8mAkoY3/2FqXABQfxhUjlX2uwBrnC0XZwJiKKEe6+DHRdMQzxuN2i9mZdj5RCRcIzaU8A==
X-Received: by 2002:a05:600c:1c13:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-451e3948937mr42812705e9.27.1748971512654;
        Tue, 03 Jun 2025 10:25:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7dafsm166214765e9.25.2025.06.03.10.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:25:12 -0700 (PDT)
Message-ID: <0859bb24-2d98-4420-b0bc-e5a60ba0dedd@redhat.com>
Date: Tue, 3 Jun 2025 19:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: Jens Axboe <axboe@kernel.dk>,
 syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, peterx@redhat.com,
 syzkaller-bugs@googlegroups.com, Catalin Marinas <catalin.marinas@arm.com>
References: <683f1551.050a0220.55ceb.0017.GAE@google.com>
 <d072f05e-576e-466d-89df-d69103074bb1@redhat.com>
 <f031d35b-13e3-4dec-a89c-f221331be735@kernel.dk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f031d35b-13e3-4dec-a89c-f221331be735@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 19:20, Jens Axboe wrote:
> On 6/3/25 10:22 AM, David Hildenbrand wrote:
>> On 03.06.25 17:31, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1457d80c580000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>> userspace arch: arm64
>>>
>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+1d335893772467199ab6@syzkaller.appspotmail.com
>>>
>>> head: ffffffff000001fe 0000000000000028 0000000000000000 0000000000000200
>>> page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
>>> ------------[ cut here ]------------
>>> kernel BUG at mm/gup.c:70!
>>> Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>>> Modules linked in:
>>>
>>> CPU: 1 UID: 0 PID: 115 Comm: kworker/u8:4 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>>> Workqueue: iou_exit io_ring_exit_work
>>> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> pc : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
>>> lr : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
>>> sp : ffff800097f17640
>>> x29: ffff800097f17660 x28: dfff800000000000 x27: 1fffffbff87da000
>>> x26: 05ffc0000002107c x25: 05ffc0000002107c x24: fffffdffc3ed0000
>>> x23: fffffdffc3ed0000 x22: ffff800097f176e0 x21: 05ffc0000002107c
>>> x20: 0000000000000000 x19: ffff800097f176e0 x18: 1fffe0003386f276
>>> x17: 703e2d6f696c6f66 x16: ffff80008adbe9e4 x15: 0000000000000001
>>> x14: 1fffe0003386f2e2 x13: 0000000000000000 x12: 0000000000000000
>>> x11: ffff60003386f2e3 x10: 0000000000ff0100 x9 : c8ccd30be98f3f00
>>> x8 : c8ccd30be98f3f00 x7 : 0000000000000001 x6 : 0000000000000001
>>> x5 : ffff800097f16d58 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
>>> x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000061
>>> Call trace:
>>>    sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69 (P)
>>>    unpin_user_page+0x80/0x10c mm/gup.c:191
>>>    io_release_ubuf+0x84/0xf8 io_uring/rsrc.c:113
>>>    io_buffer_unmap io_uring/rsrc.c:140 [inline]
>>>    io_free_rsrc_node+0x250/0x57c io_uring/rsrc.c:513
>>>    io_put_rsrc_node io_uring/rsrc.h:103 [inline]
>>>    io_rsrc_data_free+0x148/0x298 io_uring/rsrc.c:197
>>>    io_sqe_buffers_unregister+0x84/0xa0 io_uring/rsrc.c:607
>>>    io_ring_ctx_free+0x48/0x430 io_uring/io_uring.c:2723
>>>    io_ring_exit_work+0x6c4/0x73c io_uring/io_uring.c:2962
>>>    process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
>>>    process_scheduled_works kernel/workqueue.c:3319 [inline]
>>>    worker_thread+0x958/0xed8 kernel/workqueue.c:3400
>>>    kthread+0x5fc/0x75c kernel/kthread.c:464
>>>    ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>>> Code: 900523a1 910e0021 aa1703e0 97fff8a9 (d4210000)
>>> ---[ end trace 0000000000000000 ]---
>>
>> So we lost a PAE bit for a pinned folio.
>>
>> [   97.640225][  T115] page: refcount:512 mapcount:0 mapping:0000000000000000 index:0x20000 pfn:0x13b400
>> [   97.640378][  T115] head: order:9 mapcount:511 entire_mapcount:0 nr_pages_mapped:511 pincount:1
>>
>> The folio is indeed pinned, and it is PTE-mapped (511 PTEs are mapped).
>>
>> The page we are using for unpinning is not mapped (mapcount:0).
>>
>> pfn:0x13b400 indicates that the page we are provided is actually the head page (folio->page).
>>
>>
>> [   97.640414][  T115] memcg:ffff0000f36b6000
>> [   97.640435][  T115] anon flags: 0x5ffc0000002107c(referenced|uptodate|dirty|lru|arch_1|head|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
>> [   97.640468][  T115] raw: 05ffc0000002107c fffffdffc37be1c8 fffffdffc3d75f08 ffff0000d50c0ee1
>> [   97.640490][  T115] raw: 0000000000020000 0000000000000000 00000200ffffffff ffff0000f36b6000
>> [   97.640514][  T115] head: 05ffc0000002107c fffffdffc37be1c8 fffffdffc3d75f08 ffff0000d50c0ee1
>> [   97.640536][  T115] head: 0000000000020000 0000000000000000 00000200ffffffff ffff0000f36b6000
>> [   97.640559][  T115] head: 05ffc00000010a09 fffffdffc3ed0001 000001ff000001fe 00000001ffffffff
>> [   97.640581][  T115] head: ffffffff000001fe 0000000000000028 0000000000000000 0000000000000200
>> [   97.640600][  T115] page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
>>
>> So we effectively only test the head page. Here we don't have the bit
>> set for that page.
>>
>>
>> In gup_fast() we perform a similar sanity check, which didn't trigger
>> at the time we pinned the folio. io_uring ends up calling
>> io_pin_pages() where we call pin_user_pages_fast(), so GUP-fast might
>> indeed trigger.
>>
>>
>> What could trigger this (in weird scenarios, though) is if we used
>> pin_user_page() to obtain a page, then did folio = page_folio(page)
>> and called unpin_user_page(&folio->page) instead of using
>> unpin_folio(). Or using any other page that we didn't pin. It would be
>> a corner case, though.
>>
>> Staring at io_release_ubuf(), that's also not immediately what's
>> happening.
>>
>> There is this coalescing code in
>> io_sqe_buffer_register()->io_check_coalesce_buffer(), maybe ...
>> something is going wrong there?
>>
>>
>>
>> Otherwise, I could only envision (a) some random memory overwrite
>> clearing the bit or (b) some weird race between GUP-fast and PAE
>> clearing that we didn't run into so far. But these sanity checks have
>> been around for a loooong time at this point.
>>
>> Unfortunately, no reproducer :(
> 
> Too bad there's no reproducer... Since this looks recent, I'd suspect
> the recent changes there. Most notably:
> 
> commit f446c6311e86618a1f81eb576b56a6266307238f
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Mon May 12 09:06:06 2025 -0600
> 
>      io_uring/memmap: don't use page_address() on a highmem page
> 
> which seems a bit odd, as this is arm64 and there'd be no highmem. This
> went into the 6.15 kernel release. Let's hope a reproducer is
> forthcoming.

Yeah, that does not really look problematic.

Interestingly, this was found in

	git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci

Hm.

Let me dig a bit, but if it's some corner case race, it's weird that we didn't
find it earlier.

-- 
Cheers,

David / dhildenb

