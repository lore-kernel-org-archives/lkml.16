Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4640855
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749093807; cv=none; b=hi+IQjO8LzYg5FCGa7/lkiiNfSeHFrctiZKGAXCCwmYYohB+Awlgsw5G0W0S11jXcXOPfUZP090yYjeiGVQJmbrRS8+hfheGTxDLEOqbwR8nwEjZJX9S1DKaGM1mcGNe2ba361CcM+qSgrYSSTKz6mSMPgOavTzw79YdDt5ruRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749093807; c=relaxed/simple;
	bh=EEPX2e16FfTRhVu6g8ijXd9jW/sotTO6EL5btlEu22Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBavJCj5nk2HT7WEiy8kdT01++n7I1W+s90gyE9qYNCA1YDB3N8FyD2mln3Ln2FGezaWT4GalZRrbyBXi9C5MhlJoEONN9qeneprMSBCvtDnq/BWEEVlLXOEibIr1yCzOqvzzE5XJMZxTS5ephWEFvJ3PM8PAudDYj2/1qR6R4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TOP97t3l; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TOP97t3l"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231e8553248so5317485ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749093804; x=1749698604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM3/Mfadr0ILRuZgl1am16zEWMa0SGHgSc/04/smS/E=;
        b=TOP97t3lkI6CQ1MRZf/Ctw/9THhxVCn+NzUmLDDheo3+T65jdE3UEmDvVcQxHroKM2
         5k6dKvqC4aZIBr6sVZqqCypRmpMJnwu3u3u/KaMSHpUh2pLfmaAFDYny3t5jkQ406osq
         84i25IACM4dZVQw3MqY5pWp2F4PriBPQuQdlSA8Hjtzz2m5zdcKM/GNJEjEIHjBA7Crr
         vOGsLax94ghdIieYgjtlXwBjHB1L63vFueUV/KvlTUIulC2tlEIOx7Pm/INhjmOe8FkT
         sPm3o/hcDsUR6gfE4uAOEdjBGD+VQC5HL1TgPs8IpQkyeurjbakD+NU3rJ49Egb6NKjJ
         jUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749093804; x=1749698604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KM3/Mfadr0ILRuZgl1am16zEWMa0SGHgSc/04/smS/E=;
        b=XQl08628mQjXd7cTfXq/LkIMULZE38tHs7K46THa9v7mZyLcDgTMYLpMxTdRkEc1dL
         QpNBivIiQ0mspKi4WyXbpw3N6svlIlqUXC5QZ+Io4NV1hdzNyg0jpYKx1pYVDIfOavXH
         5gwGhE7EzfLHetvmUTdY3Vhi4ODWq6fZVGQpfkDP9c/MUVQewsNyRTwylLDed8QCeY9M
         KqZefc5uSExLsqeg6+VE59XmokNZDzY4D1iqf8O/2Uk80MCAnZ6qUekRFDiLujy/wJ93
         TEiMQoBEqQUyPe1uuLmmTHTQRi/VZZcI809pEAGUVybbOpjlKe++6UZN6fIy07HylEbT
         9fjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9FAMBna5Tpn+kG6wr3TDc2wIbZo5pa1nXmV0xHIW/g7suF+7kIq1xqNOaEeIKBReKHbg1k7BBcZAlh/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfuJnsGJ2CYeX2Wtljrb9OXHuHUNVq615npATfimsbbEb757h
	mS30JvJEOUuL4dEN9qoxW4L1bfCG5ZB4VsDBwL7j+0eGIaOSLCuLGRDYrEgxr0Y/43M=
X-Gm-Gg: ASbGncsRaYxcn3ds/SaA96w9I6hASfc7WZ7rrMUa8+qhe/GY+Jsum2n4y5V/aSMz3mm
	cM4coHyS7XFDdb5Lutt5Hz76lASdOC/FXAJT9qbRVyyp/FQEJI3WY0o92nyh3HTtH7Yx2VoyoGq
	32OhgC9S9MQgT6VLkazAJcM7jmcTwjM9T5czaFxSEyUVew1BnEhgur+16RgnYtkVZ+k9ixizlaS
	W+Q2YWGBqpQvZG+z+xaY4yxXpoDtxlWOR6wau1Wgs7P5uneO18a890ZRzgZYu8sQfxDyFvYbyhn
	OReRawHn+PeY9cliZenLC8sdngprykO7aPysVYFrz/Ce/V82jHfoXFkFwlSYlMWsli+aisTOqCq
	+Kdxj
X-Google-Smtp-Source: AGHT+IHPyZzSAZ7JcT87t5j2427jPh6+MmtdwNftpdDiPn5eutqHeiOyPcHZ7I8LHFMSzt/syqKWUg==
X-Received: by 2002:a17:902:cf0d:b0:234:ef42:5d48 with SMTP id d9443c01a7336-235e1205974mr79340365ad.38.1749093804466;
        Wed, 04 Jun 2025 20:23:24 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8d6dsm110352515ad.119.2025.06.04.20.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 20:23:23 -0700 (PDT)
Message-ID: <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
Date: Thu, 5 Jun 2025 11:23:18 +0800
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
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/5/25 1:50 AM, Lorenzo Stoakes wrote:
> On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
>> Hi Lorenzo,
>>
>> On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
>>> On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
>>>> Hi Jann,
>>>>
>>>> On 5/30/25 10:06 PM, Jann Horn wrote:
>>>>> On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>>>> frequently than other madvise options, particularly in native and Java
>>>>>> heaps for dynamic memory management.
>>>>>>
>>>>>> Currently, the mmap_lock is always held during these operations, even when
>>>>>> unnecessary. This causes lock contention and can lead to severe priority
>>>>>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>>>>>> hold the lock and block higher-priority threads.
>>>>>>
>>>>>> This patch enables the use of per-VMA locks when the advised range lies
>>>>>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>>>>>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>>>>>
>>>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>>>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>>>> only 1,231 fell back to mmap_lock.
>>>>>>
>>>>>> To simplify handling, the implementation falls back to the standard
>>>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>>>>>> userfaultfd_remove().
>>>>>
>>>>> One important quirk of this is that it can, from what I can see, cause
>>>>> freeing of page tables (through pt_reclaim) without holding the mmap
>>>>> lock at all:
>>>>>
>>>>> do_madvise [behavior=MADV_DONTNEED]
>>>>>      madvise_lock
>>>>>        lock_vma_under_rcu
>>>>>      madvise_do_behavior
>>>>>        madvise_single_locked_vma
>>>>>          madvise_vma_behavior
>>>>>            madvise_dontneed_free
>>>>>              madvise_dontneed_single_vma
>>>>>                zap_page_range_single_batched [.reclaim_pt = true]
>>>>>                  unmap_single_vma
>>>>>                    unmap_page_range
>>>>>                      zap_p4d_range
>>>>>                        zap_pud_range
>>>>>                          zap_pmd_range
>>>>>                            zap_pte_range
>>>>>                              try_get_and_clear_pmd
>>>>>                              free_pte
>>>>>
>>>>> This clashes with the assumption in walk_page_range_novma() that
>>>>> holding the mmap lock in write mode is sufficient to prevent
>>>>> concurrent page table freeing, so it can probably lead to page table
>>>>> UAF through the ptdump interface (see ptdump_walk_pgd()).
>>>>
>>>> Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
>>>> following case:
>>>>
>>>> cpu 0				cpu 1
>>>>
>>>> ptdump_walk_pgd
>>>> --> walk_pte_range
>>>>       --> pte_offset_map (hold RCU read lock)
>>>> 				zap_pte_range
>>>> 				--> free_pte (via RCU)
>>>>           walk_pte_range_inner
>>>>           --> ptdump_pte_entry (the PTE page is not freed at this time)
>>>>
>>>> IIUC, there is no UAF issue here?
>>>>
>>>> If I missed anything please let me know.
> 
> Seems to me that we don't need the VMA locks then unless I'm missing
> something? :) Jann?
> 
> Would this RCU-lock-acquired-by-pte_offset_map also save us from the
> munmap() downgraded read lock scenario also? Or is the problem there
> intermediate page table teardown I guess?
> 

Right. Currently, page table pages other than PTE pages are not
protected by RCU, so mmap write lock still needed in the munmap path
to wait for all readers of the page table pages to exit the critical
section.

In other words, once we have achieved that all page table pages are
protected by RCU, we can completely remove the page table pages from
the protection of mmap locks.

Here are some of my previous thoughts:

```
Another plan
============

Currently, page table modification are protected by page table locks
(page_table_lock or split pmd/pte lock), but the life cycle of page
table pages are protected by mmap_lock (and vma lock). For more details,
please refer to the latest added Documentation/mm/process_addrs.rst file.

Currently we try to free the PTE pages through RCU when
CONFIG_PT_RECLAIM is turned on. In this case, we will no longer
need to hold mmap_lock for the read/write op on the PTE pages.

So maybe we can remove the page table from the protection of the mmap
lock (which is too big), like this:

1. free all levels of page table pages by RCU, not just PTE pages, but
    also pmd, pud, etc.
2. similar to pte_offset_map/pte_unmap, add
    [pmd|pud]_offset_map/[pmd|pud]_unmap, and make them all contain
    rcu_read_lock/rcu_read_unlcok, and make them accept failure.

In this way, we no longer need the mmap lock. For readers, such as page
table wallers, we are already in the critical section of RCU. For
writers, we only need to hold the page table lock.

But there is a difficulty here, that is, the RCU critical section is not
allowed to sleep, but it is possible to sleep in the callback function
of .pmd_entry, such as mmu_notifier_invalidate_range_start().

Use SRCU instead? Or use RCU + refcount method? Not sure. But I think
it's an interesting thing to try.
```

Thanks!


