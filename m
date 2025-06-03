Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4631991B2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971229; cv=none; b=IqWSeNwbd6KTwM+IyORvaHQ8IDfOtc3sZEeDwVEjbOs9KiDqvR4BgoejymCyWIYqZU7JU6YcO3nkT17W6aeORXtn0GiNh7sUbHSN+jq95TzYQ4ShPy82TP7EaWS6i+S7KfnCdXdkn5s8ORWQEYH7lMrdAw/FtUlh9LCBnfR/8Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971229; c=relaxed/simple;
	bh=CFBfoh5wNsEiCsgkVQYLfPpafMury/KyY0c3wv/BjSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t9CDX4ob9SmiAGENfEyWEKZLZBTwMtTPNAhwUZ+U1hWWhYpuFHl6w9xgPQFyM/Nd6F75kb5iFd2b7rauWVDN1Prbb0vsXtKfg0LIRXHowu+4jtCjnvcdk+AczYK61Tf6qD9gQgviuIyp/syvL2rPBIMuku26UsPYHlPx2nDUUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=vGaJcKQ8; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="vGaJcKQ8"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40656384d30so3684897b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748971224; x=1749576024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSSfYehOKDI+ybIJ7s0ERtfUjRzm93GR1fou52nUJzE=;
        b=vGaJcKQ8405aVmUeqRO0ZKOAeKSoK5d3kE9x+gZQ1B8duozrXNP6ilYpjQgwRwBnMA
         nbOEWlUI81V1H8tPZsuy0cSEHYBIioY8UurMHb9/GQbhh/61fmuQIxOc/hTAbXVk6AIo
         4jw2tqfiJ0Udog3XOIhpa33mOgG2SbBD+GNxQvleO0/VcvFtAJwLWXgk35T8rNYqJfBM
         ADRdL8kKBe4b3G0GEuTzV+xLUutyRoDSFY3QhX+uzRZpzjPa72M54GIlpDLjnP8hxFzA
         A2etQpyrZ6ab0i+FigwHkgSN6+B2mpqHpWkns4IfLibvYHqlABqQmRa1NsaomeZ8/OMh
         husg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971224; x=1749576024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSSfYehOKDI+ybIJ7s0ERtfUjRzm93GR1fou52nUJzE=;
        b=pymKIuSgIoIsG6NYEoJqTxETJLFhNlOFT8OwD5uiSvdz+b71B27EZSbV7fCHvAgKwk
         uUmaOEqND+S8sCIhbIaiCefehfocvAI/oFr/FBKZ8UZqzAufNFPb5lruPKmXoD3VJeUk
         GtviHTzjTO6wG1i/5jrx7Y0Ca/EGaEBPdBrJJAwinRYALJMUIfcaYW5b4PqxKmTCrSV/
         smblVdfK5LdT8k35gthMe29gMnNb5nIxLW0ojWXNIWCe+eF1pjmW9ebAtx3KNZliWb7S
         GQAowj7kHEtNeIfdsAXTQqmApahQ5+rxboIAPdNHwtackZFzauwTexLp3az6Kmrr6deE
         4HYg==
X-Forwarded-Encrypted: i=1; AJvYcCUZk62eIdHcwx5aPD4ItCmtmeUKUasULDpjwOtOETjveZDB0euTW9bkyTnkUhOMAV7sEnxcf2JRbL3NxOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8d5WGBCygMGqLTw8AWNMR2GoZJeNosXfnjMM7DAt3YWYZNbBd
	5TYvLmEYuz5olY6TVy4BaktRSYqoezBei++Bqplq5s9/GZzdpr+CEUWYfNJ7Zt98EPs=
X-Gm-Gg: ASbGnctLkCqvQCFzmVTIyPZ/b8laG1rR4JwlCrdQ/+PcQ1fPi+qdDBH+yt247p/6+cq
	711vEwDy8Fa6LST3ApRMpuL0P4BaO0mvKAx1ccLydUhvauOThY8RKc9T0sWypEANSjjKrnHIPIs
	D457e6fsVXz7vWssinIwwHqOEMyypzyKPgOwP5e2eOignpQ3+HFN5gGVlV2IC4INZrjoUbcYJod
	zeKxcBD6CKyTg9ZEyZ7g/frFJqyJZI4KSRlBVdaqjAdJZCpRFFZxp/xapy9FrJ5lKoqby5KFNnP
	83VpiypqFWy1xBlHlVY8gr+JJYmKnt6tkQ+314eeFCFjbIU=
X-Google-Smtp-Source: AGHT+IECa0Z+0O4h7VCIhY3gU2RXBqAflFUjF2aWRPf1NSdqzw3nFEv+7mXuPApUrSjiokakH0NxYA==
X-Received: by 2002:a05:6870:2107:b0:2d5:25b6:ec14 with SMTP id 586e51a60fabf-2e9212b1d72mr10552894fac.15.1748971224470;
        Tue, 03 Jun 2025 10:20:24 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7f24b74sm2292060173.143.2025.06.03.10.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:20:23 -0700 (PDT)
Message-ID: <f031d35b-13e3-4dec-a89c-f221331be735@kernel.dk>
Date: Tue, 3 Jun 2025 11:20:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: David Hildenbrand <david@redhat.com>,
 syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, peterx@redhat.com,
 syzkaller-bugs@googlegroups.com
References: <683f1551.050a0220.55ceb.0017.GAE@google.com>
 <d072f05e-576e-466d-89df-d69103074bb1@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <d072f05e-576e-466d-89df-d69103074bb1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 10:22 AM, David Hildenbrand wrote:
> On 03.06.25 17:31, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1457d80c580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
>> dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>> userspace arch: arm64
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+1d335893772467199ab6@syzkaller.appspotmail.com
>>
>> head: ffffffff000001fe 0000000000000028 0000000000000000 0000000000000200
>> page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
>> ------------[ cut here ]------------
>> kernel BUG at mm/gup.c:70!
>> Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>> Modules linked in:
>>
>> CPU: 1 UID: 0 PID: 115 Comm: kworker/u8:4 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>> Workqueue: iou_exit io_ring_exit_work
>> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
>> lr : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
>> sp : ffff800097f17640
>> x29: ffff800097f17660 x28: dfff800000000000 x27: 1fffffbff87da000
>> x26: 05ffc0000002107c x25: 05ffc0000002107c x24: fffffdffc3ed0000
>> x23: fffffdffc3ed0000 x22: ffff800097f176e0 x21: 05ffc0000002107c
>> x20: 0000000000000000 x19: ffff800097f176e0 x18: 1fffe0003386f276
>> x17: 703e2d6f696c6f66 x16: ffff80008adbe9e4 x15: 0000000000000001
>> x14: 1fffe0003386f2e2 x13: 0000000000000000 x12: 0000000000000000
>> x11: ffff60003386f2e3 x10: 0000000000ff0100 x9 : c8ccd30be98f3f00
>> x8 : c8ccd30be98f3f00 x7 : 0000000000000001 x6 : 0000000000000001
>> x5 : ffff800097f16d58 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
>> x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000061
>> Call trace:
>>   sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69 (P)
>>   unpin_user_page+0x80/0x10c mm/gup.c:191
>>   io_release_ubuf+0x84/0xf8 io_uring/rsrc.c:113
>>   io_buffer_unmap io_uring/rsrc.c:140 [inline]
>>   io_free_rsrc_node+0x250/0x57c io_uring/rsrc.c:513
>>   io_put_rsrc_node io_uring/rsrc.h:103 [inline]
>>   io_rsrc_data_free+0x148/0x298 io_uring/rsrc.c:197
>>   io_sqe_buffers_unregister+0x84/0xa0 io_uring/rsrc.c:607
>>   io_ring_ctx_free+0x48/0x430 io_uring/io_uring.c:2723
>>   io_ring_exit_work+0x6c4/0x73c io_uring/io_uring.c:2962
>>   process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
>>   process_scheduled_works kernel/workqueue.c:3319 [inline]
>>   worker_thread+0x958/0xed8 kernel/workqueue.c:3400
>>   kthread+0x5fc/0x75c kernel/kthread.c:464
>>   ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>> Code: 900523a1 910e0021 aa1703e0 97fff8a9 (d4210000)
>> ---[ end trace 0000000000000000 ]---
> 
> So we lost a PAE bit for a pinned folio.
> 
> [   97.640225][  T115] page: refcount:512 mapcount:0 mapping:0000000000000000 index:0x20000 pfn:0x13b400
> [   97.640378][  T115] head: order:9 mapcount:511 entire_mapcount:0 nr_pages_mapped:511 pincount:1
> 
> The folio is indeed pinned, and it is PTE-mapped (511 PTEs are mapped).
> 
> The page we are using for unpinning is not mapped (mapcount:0).
> 
> pfn:0x13b400 indicates that the page we are provided is actually the head page (folio->page).
> 
> 
> [   97.640414][  T115] memcg:ffff0000f36b6000
> [   97.640435][  T115] anon flags: 0x5ffc0000002107c(referenced|uptodate|dirty|lru|arch_1|head|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
> [   97.640468][  T115] raw: 05ffc0000002107c fffffdffc37be1c8 fffffdffc3d75f08 ffff0000d50c0ee1
> [   97.640490][  T115] raw: 0000000000020000 0000000000000000 00000200ffffffff ffff0000f36b6000
> [   97.640514][  T115] head: 05ffc0000002107c fffffdffc37be1c8 fffffdffc3d75f08 ffff0000d50c0ee1
> [   97.640536][  T115] head: 0000000000020000 0000000000000000 00000200ffffffff ffff0000f36b6000
> [   97.640559][  T115] head: 05ffc00000010a09 fffffdffc3ed0001 000001ff000001fe 00000001ffffffff
> [   97.640581][  T115] head: ffffffff000001fe 0000000000000028 0000000000000000 0000000000000200
> [   97.640600][  T115] page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
> 
> So we effectively only test the head page. Here we don't have the bit
> set for that page.
> 
> 
> In gup_fast() we perform a similar sanity check, which didn't trigger
> at the time we pinned the folio. io_uring ends up calling
> io_pin_pages() where we call pin_user_pages_fast(), so GUP-fast might
> indeed trigger.
> 
> 
> What could trigger this (in weird scenarios, though) is if we used
> pin_user_page() to obtain a page, then did folio = page_folio(page)
> and called unpin_user_page(&folio->page) instead of using
> unpin_folio(). Or using any other page that we didn't pin. It would be
> a corner case, though.
> 
> Staring at io_release_ubuf(), that's also not immediately what's
> happening.
> 
> There is this coalescing code in
> io_sqe_buffer_register()->io_check_coalesce_buffer(), maybe ...
> something is going wrong there?
> 
> 
> 
> Otherwise, I could only envision (a) some random memory overwrite
> clearing the bit or (b) some weird race between GUP-fast and PAE
> clearing that we didn't run into so far. But these sanity checks have
> been around for a loooong time at this point.
> 
> Unfortunately, no reproducer :(

Too bad there's no reproducer... Since this looks recent, I'd suspect
the recent changes there. Most notably:

commit f446c6311e86618a1f81eb576b56a6266307238f
Author: Jens Axboe <axboe@kernel.dk>
Date:   Mon May 12 09:06:06 2025 -0600

    io_uring/memmap: don't use page_address() on a highmem page

which seems a bit odd, as this is arm64 and there'd be no highmem. This
went into the 6.15 kernel release. Let's hope a reproducer is
forthcoming.

-- 
Jens Axboe
