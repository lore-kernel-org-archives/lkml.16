Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0477FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749195632; cv=none; b=Ju5GvioM8AVLqEaZJF3QJsMX287h8tf+iQlGO6Oq5kXufNYxPhDY+mD/LoC4DKDten9ZPNtf5bzToZcIGLM5GPiyXbOdNspIRV3Bqx+dxVj0m4OQl9S3KqRM12wndL4RQC5ZwLER259Bm8boP9+Qyh+0VekSAyE1MFZPS7fsC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749195632; c=relaxed/simple;
	bh=htfHA8imEknZwM/lOYfRRwySwn8+TiThJS+ASnJ+2XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Au6zoP1OtsTW7VeWyWIVKtdDYqX2gVHGFcXduSnPqsHa1wS6OTPa/vTgyvpxA1a2KN3NcQlSldeA8Hg87BditRokThRXc1UGQVbA3u42CbkXWKqhfX37bFQzGDZYY9hXuEFY26O/fl9tVm+UDq+T2kHs2SKnnov22kobpudOh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4Zm32OY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4Zm32OY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749195629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9c2gsmYq2Jmi7oxccIpF5lrsaMiGoQHkxwe49tMmhQ=;
	b=F4Zm32OYYcdY2GhhLBQJu2LOjGWX9zCNLaST+lv5x0athUMjIS6e5hu+FZJoSDEup0ZuoC
	wkmPVBBuaUCGa2/x2ssiBiFVCZgtyjZqucNyPrCQb+TDQSx30Qy//EtGAfAzSqL3ZGAhXo
	zlQ6iQ9K9T4m96AYzRFdAnMtX3Wn9hI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-__Z_TC9iP-aA5qr5a05QLw-1; Fri, 06 Jun 2025 03:40:28 -0400
X-MC-Unique: __Z_TC9iP-aA5qr5a05QLw-1
X-Mimecast-MFC-AGG-ID: __Z_TC9iP-aA5qr5a05QLw_1749195627
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1400653f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749195627; x=1749800427;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9c2gsmYq2Jmi7oxccIpF5lrsaMiGoQHkxwe49tMmhQ=;
        b=BVx2uq6EbmI7Og1VpS0BA4cf8XUTFljf2jOO0vaCLnmbc+K665HSd9enfArLTGYqry
         FhIRU7K5tYFxiGLZuSYMmYSbkVMkSy71t9ieskpE/82Z/C/GVz4VfcOuHKfK4gi+jxxE
         e3tAbBCxcEt8Ew1GnO32OAUz/DCNSaXFIKlF17nJ2noEnPqVuXqLUyfwWDPvHOsdL2A8
         E+Qo6RbG48mwTxRUW0PcwGEoh4gMejpFAS2Nf/xUtxlqTPozAd5pWfNT8o35zmxHvKGR
         PlEx+dAA56mLN6Kj2hy8fDGKoTYn3/vtZTw39146F5RZOeXV+JoysbxovouwYqDd4Tyy
         sVFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnfQeE32hNSYWWlhQIHn+8yFhTBfLSE8vfdSRARQkUf/GVafS37f3OyRstb7q2oXpg7a0xaQdXT7NxDyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSa97/ySVf+6+wg9lobYBtoa3B4URwMs0Jbq2O99YNOtkykoI
	vkWaScXD6yxw25N8IhuFxNvaapG9l0s1dxwAmw5APO+z/SduiRNtwh2E1/tOm0afvfI0/VLJOzK
	1HyemflaH7/Dg0AQJcYEC9dq7mCphSdp7IBAnNSt3fjXTOvEy87TsGRUYLrjwBluANg==
X-Gm-Gg: ASbGnctMM9ZdXh6QSBbrapBv1h8twF/R/rOGk4Fb+M4uhQo23QBUStXE9a6EJe6Kyh2
	1R/oPwkzfp6oVZG6YmjjXbkWI+UbhXW8IEKUmzOkmaSHLH05Em6In+a++IlWob9xS1iOXJldEqu
	eHVs29/Tl+xycftxTePawlWVmtSmrX2eDXJfIxocn3Z4wro1Lk2eU3cakeWEz7Vb7bkNJfUOcNU
	k0QFdWeyrcKFf7M2Vzhj2cdx33C+KVBNz8oA8NxRpUDQuMNqhJjykO5aaKlbLb0jdbI7iRl9FxC
	AaLs96CNmBngeu5C1BA/+7FIF4+rlIutVsVie30NbwNeF6DKFQVquQ==
X-Received: by 2002:a05:6000:2913:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a5319b18f7mr1892350f8f.4.1749195627270;
        Fri, 06 Jun 2025 00:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwBe2kBJP+NKllERR0xfX73Egd9sD4ST0tOY6eSfKaEu0pcjexHPFmcKUKkAi7vL+CW7MMEA==
X-Received: by 2002:a05:6000:2913:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3a5319b18f7mr1892324f8f.4.1749195626847;
        Fri, 06 Jun 2025 00:40:26 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9ddsm1084220f8f.4.2025.06.06.00.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:40:26 -0700 (PDT)
Message-ID: <bf1d8531-983d-46d5-87b8-fba46e66c2e6@redhat.com>
Date: Fri, 6 Jun 2025 09:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
To: Jinjiang Tu <tujinjiang@huawei.com>,
 syzbot <syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, riel@surriel.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz, Jens Axboe
 <axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
 <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
 <b9a43f6d-1865-4074-b91c-a5bd7e10f2a9@redhat.com>
 <37e77dc4-bc73-2710-088f-f7ec0c787caf@huawei.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <37e77dc4-bc73-2710-088f-f7ec0c787caf@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.06.25 09:37, Jinjiang Tu wrote:
> 
> 在 2025/6/5 14:37, David Hildenbrand 写道:
>> On 05.06.25 08:27, David Hildenbrand wrote:
>>> On 05.06.25 08:11, David Hildenbrand wrote:
>>>> On 05.06.25 07:38, syzbot wrote:
>>>>> Hello,
>>>>>
>>>>> syzbot found the following issue on:
>>>>>
>>>>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into
>>>>> for-kernelci
>>>>
>>>> Hmmm, another very odd page-table mapping related problem on that tree
>>>> found on arm64 only:
>>>
>>> In this particular reproducer we seem to be having MADV_HUGEPAGE and
>>> io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and
>>> io_uring_register(IORING_REGISTER_BUFFERS).
>>>
>>> I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and
>>> io_uring_register racing, only. I suspect MADV_HWPOISON is trying to
>>> split a THP, while MADV_PAGEOUT tries paging it out.
>>>
>>> IORING_REGISTER_BUFFERS ends up in
>>> io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and
>>> try coalescing buffers.
>>>
>>> And something about THPs is not particularly happy :)
>>>
>>
>> Not sure if realted to io_uring.
>>
>> unmap_poisoned_folio() calls try_to_unmap() without TTU_SPLIT_HUGE_PMD.
>>
>> When called from memory_failure(), we make sure to never call it on a
>> large folio: WARN_ON(folio_test_large(folio));
>>
>> However, from shrink_folio_list() we might call unmap_poisoned_folio()
>> on a large folio, which doesn't work if it is still PMD-mapped. Maybe
>> passing TTU_SPLIT_HUGE_PMD would fix it.
>>
>>
>> Likely the relevant commit is:
>>
>> commit 1b0449544c6482179ac84530b61fc192a6527bfd
>> Author: Jinjiang Tu <tujinjiang@huawei.com>
>> Date:   Tue Mar 18 16:39:39 2025 +0800
>>
>>      mm/vmscan: don't try to reclaim hwpoison folio
>>          Syzkaller reports a bug as follows:
>>          Injecting memory failure for pfn 0x18b00e at process virtual
>> address 0x20ffd000
>>      Memory failure: 0x18b00e: dirty swapcache page still referenced by
>> 2 users
>>      Memory failure: 0x18b00e: recovery action for dirty swapcache
>> page: Failed
>>      page: refcount:2 mapcount:0 mapping:0000000000000000 index:0x20ffd
>> pfn:0x18b00e
>>      memcg:ffff0000dd6d9000
>>      anon flags:
>> 0x5ffffe00482011(locked|dirty|arch_1|swapbacked|hwpoison|node=0|zone=2|lastcpupid=0xfffff)
>>      raw: 005ffffe00482011 dead000000000100 dead000000000122
>> ffff0000e232a7c9
>>      raw: 0000000000020ffd 0000000000000000 00000002ffffffff
>> ffff0000dd6d9000
>>      page dumped because: VM_BUG_ON_FOLIO(!folio_test_uptodate(folio))
>>
>> CCing Jinjiang Tu
> 
> By the way, unmap_poisoned_folio() is called in do_migrate_range() too. the folio may be in lru and is a large folio.

Indeed.

-- 
Cheers,

David / dhildenb

