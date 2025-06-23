Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA146BF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700189; cv=none; b=DIDbx8Lq029Ej5g1cLYtKLejnpkWy60feZBrPiJDf6K99J1dQZnaHQPFf/LJ9HcfSwPIiqcgatScfr+0Qq98W/XodhZU3m5gUcHL01DJdTGWRxg0XNMr5bDphmM9A9b+wPH5oPTtDFTekvPjxhEd0yoUlNn/9QOaK7UmazWmAF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700189; c=relaxed/simple;
	bh=5EiHAIpt9ytx86ZHdOvTn9Bk0ltpSGKFOhOUPYrT1cQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G/fDLTWLb0FUKFgLeBIGZZWp3fvoM34yaRZGxT6m6U2BVKcPOfihqBlZmpkOwCMUNQ6brb6fk5/PVVMgQ/ifi3vCEAhoKiMoZ5WNC5FWrxv4SFU1fNEluT4xXoTz9kNt7i4LAZOKjq+90n0iPO6Kohospj9Piqw+Uf6LjhEqhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XdPZYLje; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XdPZYLje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750700186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ThoF8SlVL8vY/LxIVqZjBnwKGAh9qyxy6Gs8zmeDZTs=;
	b=XdPZYLje4jYhSZsSPUlrwzFJVeMaT8bM4f0QOy89fpkmyqn+FX8T04a4IR5ly02a1ZxcSY
	BGeDByayrAePcwQByF6pkFPuq664UXG0RI7VDbQlJmSABf/VCB54NToNo+Lqy50vAiTF/S
	845ot0fp2drx6+i8iJ4f4kzGjvMpwbk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-PqPI_xceMgmZpQJD4aqAgQ-1; Mon, 23 Jun 2025 13:36:24 -0400
X-MC-Unique: PqPI_xceMgmZpQJD4aqAgQ-1
X-Mimecast-MFC-AGG-ID: PqPI_xceMgmZpQJD4aqAgQ_1750700183
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so33468045e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750700183; x=1751304983;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ThoF8SlVL8vY/LxIVqZjBnwKGAh9qyxy6Gs8zmeDZTs=;
        b=tKoGMcYr7JiVAlhaI7x610zQb4QnUTZGRx+IolRl1LfC3dLTl63uMmfBVUvilgWlqM
         LphIFDuzf0JSpnselKHyjvo3nFHP6OBOfuu998DNAy0D/qPn7R5lUDKVuUAaxEIV7PmJ
         TW5+H19ouHfycLPPDVfUFNJkizrGRXWW6LjyABLei7yca4rUcLwtZsIZTB/wnkXBee55
         KO7FPglyM181UKjH9WNe4Nxt9VqsEHGMQlkNwJE2GgvMrQMRv0VQrQHKLNsh00OJQBTY
         3zJVyz7MwbUMwZQC+RBGhBhKMvwf6CUC/LHbRIYGhXd4ohYBxGsTxWZMFuslOfsWG0YB
         5zgw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Zh2D6L3viWR9a+pfvZIvYylKZuUL5/Ow7LzBSqijgpc2ZhNBHR+w+D+ZXrXpSuA2JGbjZbcrrrSE9zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMiS2/g/3o43f9qGvjKZue90DZgNugiLmJQn3SCGndtfwZSH9F
	DjC2esv5QkX2eTqHqZGGbWoGrTGzUbtX5Z56//DuttuGWXPxgowzu2VkO/yb0lGfxPs8bDVyMj4
	qwL3BwcDM/mvEV9iBmzpkSALnwU0hJ+LcgPs31FPsnnpOslH7YrIP0v1Tas/8nY46RA==
X-Gm-Gg: ASbGnctyBgcrqDM39bL2rkmGIuaCDc1oV8NYWyCn8aaESbSkF+zm4srDIpfRaFcdfVf
	6aYFNhY81jITgxFUoecvSbJzZfSq56zkA9LdzUMixO2UN6svk6Zr/8dpKB5aY8MpROIC06FrT4C
	sj21HUeMyAT6ElmZP6Zn0dL1b1Raq7ZEORldEy+2raMRFXqmbDBnO4gCvIrQNjfkh2EsA4Vqltq
	sp7o9pyJ6YvDr1SZ4a4ibgn/kfsoveoyEGExOyAM2viFlzVWtNnLLTrUejYlBk9DwOZ/8GgEheV
	48C2ZOTdW9vJRV3mgS2ZA+AbGCSNy1um4SJrFHz5SxmhsjnW/7BPgEGXFyv/YzFYF4yrbi/lnev
	xcKhvlU7GTHcfT7u9xIry5xyRFQoz8/WvfielhazhM5TVvY6ciw==
X-Received: by 2002:a05:600c:5285:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-453659ca69fmr111202515e9.11.1750700183365;
        Mon, 23 Jun 2025 10:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYsXgfNg9Bu/MmTqCsLUfZT0mheaud+lHsIyFS+O05I8KNj1jskn+nDk3sYAhZohvzO5nzYg==
X-Received: by 2002:a05:600c:5285:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-453659ca69fmr111202185e9.11.1750700182897;
        Mon, 23 Jun 2025 10:36:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d145e520sm9837115f8f.20.2025.06.23.10.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 10:36:22 -0700 (PDT)
Message-ID: <aef06093-6081-460e-8452-87b522b06050@redhat.com>
Date: Mon, 23 Jun 2025 19:36:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
From: David Hildenbrand <david@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Potapenko <glider@google.com>
Cc: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, catalin.marinas@arm.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 peterx@redhat.com, syzkaller-bugs@googlegroups.com
References: <6857299a.a00a0220.137b3.0085.GAE@google.com>
 <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
 <CAG_fn=WBBwkZZZzBMp0SO3=POgKzNaJGkU_YJKcAKRVQdEYPqw@mail.gmail.com>
 <56862a1d-71c0-4f07-9c1a-9d70069b4d9e@redhat.com>
 <b79acb4e-8a50-4d72-9aaa-0ec5dba25678@redhat.com>
 <014a3820-8082-43a6-8bb2-70859cabdbc0@kernel.dk>
 <a72fe0ba-b022-4f6e-b401-78e93aadc5ce@redhat.com>
 <ea748461-2059-4aca-81a0-4d01c34926da@gmail.com>
 <6f92b7d6-7d3c-4830-a591-75dc4d55c46c@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6f92b7d6-7d3c-4830-a591-75dc4d55c46c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.06.25 18:59, David Hildenbrand wrote:
> On 23.06.25 18:48, Pavel Begunkov wrote:
>> On 6/23/25 16:11, David Hildenbrand wrote:
>>> On 23.06.25 16:58, Jens Axboe wrote:
>>>> On 6/23/25 6:22 AM, David Hildenbrand wrote:
>>>>> On 23.06.25 12:10, David Hildenbrand wrote:
>>>>>> On 23.06.25 11:53, Alexander Potapenko wrote:
>>>>>>> On Mon, Jun 23, 2025 at 11:29?AM 'David Hildenbrand' via
>>>>>>> syzkaller-bugs <syzkaller-bugs@googlegroups.com> wrote:
>>>>>>>>
>> ...>>> When only pinning a single tail page (iovec.iov_len = pagesize), it works as expected.
>>>>>
>>>>> So, if we pinned two tail pages but end up calling io_release_ubuf()->unpin_user_page()
>>>>> on the head page, meaning that "imu->bvec[i].bv_page" points at the wrong folio page
>>>>> (IOW, one we never pinned).
>>>>>
>>>>> So it's related to the io_coalesce_buffer() machinery.
>>>>>
>>>>> And in fact, in there, we have this weird logic:
>>>>>
>>>>> /* Store head pages only*/
>>>>> new_array = kvmalloc_array(nr_folios, sizeof(struct page *), GFP_KERNEL);
>>>>> ...
>>>>>
>>>>>
>>>>> Essentially discarding the subpage information when coalescing tail pages.
>>>>>
>>>>>
>>>>> I am afraid the whole io_check_coalesce_buffer + io_coalesce_buffer() logic might be
>>>>> flawed (we can -- in theory -- coalesc different folio page ranges in
>>>>> a GUP result?).
>>>>>
>>>>> @Jens, not sure if this only triggers a warning when unpinning or if we actually mess up
>>>>> imu->bvec[i].bv_page, to end up pointing at (reading/writing) pages we didn't even pin in the first
>>>>> place.
>>>>>
>>>>> Can you look into that, as you are more familiar with the logic?
>>>>
>>>> Leaving this all quoted and adding Pavel, who wrote that code. I'm
>>>> currently away, so can't look into this right now.
>>
>> Chenliang Li did, but not like it matters
>>
>>> I did some more digging, but ended up being all confused about io_check_coalesce_buffer() and io_imu_folio_data().
>>>
>>> Assuming we pass a bunch of consecutive tail pages that all belong to the same folio, then the loop in io_check_coalesce_buffer() will always
>>> run into the
>>>
>>> if (page_folio(page_array[i]) == folio &&
>>>        page_array[i] == page_array[i-1] + 1) {
>>>        count++;
>>>        continue;
>>> }
>>>
>>> case, making the function return "true" ... in io_coalesce_buffer(), we then store the head page ... which seems very wrong.
>>>
>>> In general, storing head pages when they are not the first page to be coalesced seems wrong.
>>
>> Yes, it stores the head page even if the range passed to
>> pin_user_pages() doesn't cover the head page.
>   > > It should be converted to unpin_user_folio(), which doesn't seem
>> to do sanity_check_pinned_pages(). Do you think that'll be enough
>> (conceptually)? Nobody is actually touching the head page in those
>> cases apart from the final unpin, and storing the head page is
>> more convenient than keeping folios. I'll take a look if it can
>> be fully converted to folios w/o extra overhead.
> 
> Assuming we had from GUP
> 
> nr_pages = 2
> pages[0] = folio_page(folio, 1)
> pages[1] = folio_page(folio, 2)
> 
> After io_coalesce_buffer() we have
> 
> nr_pages = 1
> pages[0] = folio_page(folio, 0)
> 
> 
> Using unpin_user_folio() in all places where we could see something like
> that would be the right thing to do. The sanity checks are not in
> unpin_user_folio() for exactly that reason: we don't know which folio
> pages we pinned.
> 
> But now I wonder where you make sure that "Nobody is actually touching
> the head page"?
> 
> How do you get back the "which folio range" information after
> io_coalesce_buffer() ?
> 
> 
> If you rely on alignment in virtual address space for you, combined with
> imu->folio_shift, that might not work reliably ...

FWIW, applying the following on top of origin/master:

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index dbbcc5eb3dce5..e62a284dcf906 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -946,6 +946,7 @@ static void do_run_with_thp(test_fn fn, enum thp_run thp_run, size_t thpsize)
                         log_test_result(KSFT_FAIL);
                         goto munmap;
                 }
+               mem = mremap_mem;
                 size = mremap_size;
                 break;
         case THP_RUN_PARTIAL_SHARED:


and then running the selftest, something is not happy:

...
# [RUN] R/O-mapping a page registered as iouring fixed buffer ... with partially mremap()'ed THP (512 kB)
[34272.021973] Oops: general protection fault, maybe for address 0xffff8bab09d5b000: 0000 [#1] PREEMPT SMP NOPTI
[34272.021980] CPU: 3 UID: 0 PID: 1048307 Comm: iou-wrk-1047940 Not tainted 6.14.9-300.fc42.x86_64 #1
[34272.021983] Hardware name: LENOVO 20WNS1F81N/20WNS1F81N, BIOS N35ET53W (1.53 ) 03/22/2023
[34272.021984] RIP: 0010:memcpy+0xc/0x20
[34272.021989] Code: cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 48 89 f8 48 89 d1 <f3> a4 e9 4d f9 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90
[34272.021991] RSP: 0018:ffffcff459183c20 EFLAGS: 00010206
[34272.021993] RAX: ffff8bab09d5b000 RBX: 0000000000000fff RCX: 0000000000000fff
[34272.021994] RDX: 0000000000000fff RSI: 0021461670800001 RDI: ffff8bab09d5b000
[34272.021995] RBP: ffff8ba794866c40 R08: ffff8bab09d5b000 R09: 0000000000001000
[34272.021996] R10: ffff8ba7a316f9d0 R11: ffff8ba92f133080 R12: 0000000000000fff
[34272.021997] R13: ffff8baa85d5b6a0 R14: 0000000000000fff R15: 0000000000001000
[34272.021998] FS:  00007f16c568a740(0000) GS:ffff8baebf580000(0000) knlGS:0000000000000000
[34272.021999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[34272.022000] CR2: 00007fffb6a10b00 CR3: 00000003df9eb006 CR4: 0000000000f72ef0
[34272.022001] PKRU: 55555554
[34272.022002] Call Trace:
[34272.022004]  <TASK>
[34272.022005]  copy_page_from_iter_atomic+0x36f/0x7e0
[34272.022009]  ? simple_xattr_get+0x59/0xa0
[34272.022012]  generic_perform_write+0x86/0x2e0
[34272.022016]  shmem_file_write_iter+0x86/0x90
[34272.022019]  io_write+0xe4/0x390
[34272.022023]  io_issue_sqe+0x65/0x4f0
[34272.022024]  ? lock_timer_base+0x7d/0xc0
[34272.022027]  io_wq_submit_work+0xb8/0x320
[34272.022029]  io_worker_handle_work+0xd5/0x300
[34272.022032]  io_wq_worker+0xda/0x300
[34272.022034]  ? finish_task_switch.isra.0+0x99/0x2c0
[34272.022037]  ? __pfx_io_wq_worker+0x10/0x10
[34272.022039]  ret_from_fork+0x34/0x50
[34272.022042]  ? __pfx_io_wq_worker+0x10/0x10
[34272.022044]  ret_from_fork_asm+0x1a/0x30
[34272.022047]  </TASK>


There, we essentially mremap a THP to not be aligned in VA space, and then register half the
THP as a fixed buffer.

So ... my suspicion that this is all rather broken grows :)

-- 
Cheers,

David / dhildenb

