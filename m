Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52FF23817A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016941; cv=none; b=dl5NLHIsi2vZIhtGzsp0glV8fhZmEKJHXvMjx6pbbQtBPJCkh4H482n7+zpMZSf9IkY7u0R0Zb/UnYg4/utzRy/HGcAQRdBkGrYSMcG75ebutaYATIOQbVCyx26VkY0cWKWNbarhTcyjigS9L1Dy33nnaTUJWww7blhlwYxhqDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016941; c=relaxed/simple;
	bh=XNgksP9cTrQPB2eAtMc1B4b/7rRPsVq14ATFR/W3/KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKESbYT1ygsemJyHc78fwo5Mu5ui06ln9Tj7ZfNL/J8rYod6zxwKtbp6P0sYSSIH3HOvTZrEAQwnAQF7cKujOOEXmNNyw/v1j56dKO/jNyEEaTEH/mMSYeomZYfC4DZNQ/Fr8Xxla4kmpZLDyQghW2A7bk29u1Z4fVGRT0fAGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dL2Pe2Lw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dL2Pe2Lw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231e98e46c0so57871635ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749016939; x=1749621739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWMI+lg2sQ5ZZTLgrFyqGIyNwAQkPx/wpdd9hQyCRaM=;
        b=dL2Pe2LwKPy2WTZ3As1jz6eAlvAu3wbOGhfn7lyjeYprE8gTcQBBc+HunTRy42Ypdy
         AYmOeO9vgBmu2y/Y8hR6iWDtZ/6p8uWqD80sFEO+LQ5cXfGUIeI7vGp2ttp6MNwaoLVX
         eXTlBalW6Gu3UOdhdAQNOUKeqYPid1/CJu158L1uNqw4HtwVkkuDdMFb6HuilM8bjgfG
         hkQ/65/4sauY7+5SWBqvPPGqTW00fDioW0z3rFfS1DayCY1mfnO0Lzf+HSIWEXHKhpcv
         tnzzp8dUnsd8WynaAm8W3RiTyVe0c0fEiSE7o3+5tnKJfBoM7TPJIC862ZiryCdUoI1N
         KZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016939; x=1749621739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dWMI+lg2sQ5ZZTLgrFyqGIyNwAQkPx/wpdd9hQyCRaM=;
        b=SErbUVI/rPShyrlrAHJy8n8ZQxN/td5/11wqeHxaPXCFlFtu35GEoSeN5yD3FOK+Ix
         ZxoTZ7q0xatn0X9bCAsi9845iZctVUKUIjMrce9DzdFClEhFDZ+l3TD6CL+PqcSdr2py
         qaRG9zW6/Cg+mPXwO+pk4HxoU4rjApf31WtaMZhfilhm8IhM/ug9W1TigmHbCLINF5SK
         5hcLHGNfIkoB6MHFymgOGX+DKmKghtIDoog3rxv9uFV1o2NSqNZ7/kDu2m85IlCBSZyB
         1AigPLd212bmrHI6CuSQLTP02qAO6WO33MnLyAnN46k2dUt0I1xGLN0DsnEL8zCOyGoR
         oUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHJsTs/RKagekgVhNYzcumU7Q8F8YNpHQIMoWImjk4j3GGezJhmU7NyQSXjmzfP0tZ6bnvyki1mXlfBvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrstsnbCpdoamF63cxVZtZBQV9B6860wL3irGgGuStwZRyhV3
	+ox5j26K6WvlALr7lGgkqKb8lVvgwSDb74TL0sXma0Jgy8JdbJFFFrEYfvLjW28LWJ8=
X-Gm-Gg: ASbGncuF0sp0s1qfzbg2A80YXl9F2Z0VpyjybpVXXTQErj4bz3sR89S1BnHAu+lt3Hc
	5vAI5MbONRDERvi9AgncwHdHbq4iAhA37OG6xUwjwABjfRyYxWg7Zy0dFjqS8AyrCfZDXwhbGXq
	ohaQC2uSo59zTlf/u9yYhhc/Z2+dGMWY7/GD0eZe8TXZlg3IeE3uo/wYShtIEjjfN3Aqjjn7E1b
	3Fk2/b84a/cJpKuc0pLmMlk+mu2fNmN00E6l6myhMMRjGj2YyRfvGH67NfSY1DScH0pYYpG5AN3
	3Uxg0ldVdN3EVb8V7qP/RFnd049N82t2BNW0xXwgakT7niKO3nmcXMbR7QcV7LGCTAZ7WOVHGlk
	=
X-Google-Smtp-Source: AGHT+IGKgZq58uZhUXOwOyeVQ5leksbeKUkW3IJBfiuvTb4m+TsV0F6pnMsQZxZmiOqt/yU7cuW4oA==
X-Received: by 2002:a17:902:ec92:b0:234:a734:4ab1 with SMTP id d9443c01a7336-235e1013722mr19350555ad.3.1749016938952;
        Tue, 03 Jun 2025 23:02:18 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d19bfesm96672215ad.253.2025.06.03.23.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 23:02:18 -0700 (PDT)
Message-ID: <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
Date: Wed, 4 Jun 2025 14:02:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
> On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
>> Hi Jann,
>>
>> On 5/30/25 10:06 PM, Jann Horn wrote:
>>> On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>> frequently than other madvise options, particularly in native and Java
>>>> heaps for dynamic memory management.
>>>>
>>>> Currently, the mmap_lock is always held during these operations, even when
>>>> unnecessary. This causes lock contention and can lead to severe priority
>>>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>>>> hold the lock and block higher-priority threads.
>>>>
>>>> This patch enables the use of per-VMA locks when the advised range lies
>>>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>>>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>>>
>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>> only 1,231 fell back to mmap_lock.
>>>>
>>>> To simplify handling, the implementation falls back to the standard
>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>>>> userfaultfd_remove().
>>>
>>> One important quirk of this is that it can, from what I can see, cause
>>> freeing of page tables (through pt_reclaim) without holding the mmap
>>> lock at all:
>>>
>>> do_madvise [behavior=MADV_DONTNEED]
>>>     madvise_lock
>>>       lock_vma_under_rcu
>>>     madvise_do_behavior
>>>       madvise_single_locked_vma
>>>         madvise_vma_behavior
>>>           madvise_dontneed_free
>>>             madvise_dontneed_single_vma
>>>               zap_page_range_single_batched [.reclaim_pt = true]
>>>                 unmap_single_vma
>>>                   unmap_page_range
>>>                     zap_p4d_range
>>>                       zap_pud_range
>>>                         zap_pmd_range
>>>                           zap_pte_range
>>>                             try_get_and_clear_pmd
>>>                             free_pte
>>>
>>> This clashes with the assumption in walk_page_range_novma() that
>>> holding the mmap lock in write mode is sufficient to prevent
>>> concurrent page table freeing, so it can probably lead to page table
>>> UAF through the ptdump interface (see ptdump_walk_pgd()).
>>
>> Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
>> following case:
>>
>> cpu 0				cpu 1
>>
>> ptdump_walk_pgd
>> --> walk_pte_range
>>      --> pte_offset_map (hold RCU read lock)
>> 				zap_pte_range
>> 				--> free_pte (via RCU)
>>          walk_pte_range_inner
>>          --> ptdump_pte_entry (the PTE page is not freed at this time)
>>
>> IIUC, there is no UAF issue here?
>>
>> If I missed anything please let me know.
>>
>> Thanks,
>> Qi
>>
>>
> 
> I forgot about that interesting placement of RCU lock acquisition :) I will
> obviously let Jann come back to you on this, but I wonder if I need to
> update the doc to reflect this actually.

I saw that there is already a relevant description in process_addrs.rst:


```
So accessing PTE-level page tables requires at least holding an RCU read 
lock;
   but that only suffices for readers that can tolerate racing with 
concurrent
   page table updates such that an empty PTE is observed (in a page 
table that
   has actually already been detached and marked for RCU freeing) while 
another
   new page table has been installed in the same location and filled with
   entries. Writers normally need to take the PTE lock and revalidate 
that the
   PMD entry still refers to the same PTE-level page table.
   If the writer does not care whether it is the same PTE-level page 
table, it
   can take the PMD lock and revalidate that the contents of pmd entry 
still meet
   the requirements. In particular, this also happens in 
:c:func:`!retract_page_tables`
   when handling :c:macro:`!MADV_COLLAPSE`.
```

Thanks!


