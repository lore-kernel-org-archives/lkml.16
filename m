Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F46268FCD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748935478; cv=none; b=r+4eJdSoy7EuQldqiAoU/MeVMlqU1VXmBb8LerGiA1lmEbH6MoONcqiFT9zTDvOMxuAcIbqTJPVM714PnfMIc4VdzsB0uMAuwgksb63AbcFXZNDnUj0ZGfp+EwaM0+h2rvFv0Ae5Cqfi4yDvUJ3GqJK2F70jHgRnCkVGBmlDJa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748935478; c=relaxed/simple;
	bh=d4cg0UAlhJ6Jy2bkt4S1Oo1nPPvgRNoMfLGPoNbsnWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqTPZlXLAYXbasegY1JKztHjef3xzhW9HAGuRR7fnDR22q1EqHgWqGChzq8jz98lK5qAB/Vwnylvw4eZWNywoiMZhfpBDXWfgZ8MIa01FBuabCDnxzum0lsYX7bsJ3PmxD1aoklM/EhynrsXBt0F6ciiX7n4mgjCZFkOc3uEsS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ivZiFPar; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ivZiFPar"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3956382b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748935475; x=1749540275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSREP8nY0PkjSCLK7bLXqZ21Ej448bSXQyKUUXBbiI0=;
        b=ivZiFParBgiqh9JfBeGsWO5Sk8HoisSJm/ndlpVr6xmw+enkg66DQxEioQBlcgZsL2
         l3VkW8OcjD6y1xgkz7J34GS3rls84nqR1+1jaT4uN0kZMR6kLJEOIXk1jVlDR2l70E36
         ka1j7FpSVW0ri4xx8F/le7D4lwlxu65AXHeac758VVVA3olsF09g/H4XzAmK1w4CcUHV
         dTzbB6aaAAjy4l/ZZUZBvmN1tYynqLSX7ln8stuj9ao0Anb36Xz7O79yuVO/Ounim3YS
         vSpiWeYG3W9cvGWD+DvSmqQ1mDCYdMP19kBLjRR6ZXAkPXBIxdlX/ksiIoBqs2P+1LBa
         0YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748935475; x=1749540275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lSREP8nY0PkjSCLK7bLXqZ21Ej448bSXQyKUUXBbiI0=;
        b=cIA0BJQHXJWFlOMoLqEBIXvcPoSmB872ByJNMyARsZtOxDaIgdQm51c60T0sxOfnnh
         TjxUmAiGgZAlB1662iIRRv4WXlddPDIUe7uQLSnDVdJiEWaGegauNGBh7othlOvGsqFl
         yObfdPuvNjTxBKLm3XIstEgWLJgixTRehr6JQYWyMQBMoEPNy3kFE2Va1BRBzeHzgNzs
         KO0vmm0R85g66me4aBqcvslF4hV43lKF9/JOfSE81OsjYLgMrSki7oRBxFVSs4Zl5f/U
         RO9bMB2ajRY1jVUd4fWkOomKJpl4WYQPykoP0dGzemvzApIYcDb//iR+2c4Jwb+i8+Is
         gufQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8yC7OmC/JKfGWu84NflhAoPJGy8eMLvW3ilb7DYmXuGqbtnI7raX2OBepV8ZYuA9utZD+jCV3WwvCEeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdEI9LOqs25nHnthxhKwke+Rashz76Ipijvhpsjkrr+p/bAQ3
	ScY/7Lh41LZ0wH0Gu2ZADTaPZHynvG0jdtSSlPvfQhK88kR44iNa0XjJw8rUtqGO+rg=
X-Gm-Gg: ASbGnculZtJYj7cI020nA46MhKvuQQH2tRetAmGIWBc33zv2UiAm+3TZrqGV1Jf6Jg1
	ZMKwoPyFtbTk9qnTZtB0N+OLZWe+tmTOcFUXTl0ZRL/sh4cNTzFLC2depMe8q3mKVl2CLJ+yRMo
	cp6iQEIvUeoHlBqawGV7vwj7uolptPyFIg4Hbfw4QLbaVXyzhkLuCvWA0ZBmrsbUqYspc+hDvpy
	zPMLNXRfkJfss2d0GiOByQDLZZu3DPs+5PtA0R4VZo1SjvMcJPhhyb1GuFNuRuHsiafIqc2ryxF
	0gRaL5aoR9hqgPQVJEUtzntDFLJyNGWrOCok+tkWJkPXz21uBSUDPA1F998lhXfPXKPjpjP4gTb
	kSUzZ6NNaQV+6x75yqu7T
X-Google-Smtp-Source: AGHT+IH2/zCSj+QE5Q8rOiIuxOj68PHcnQTYqGhZzWGh+2jOH1jtF3REXGR+Y3Jw498qJ7aqDfEfRQ==
X-Received: by 2002:a05:6a00:178b:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-747c1a8610fmr19584669b3a.10.1748935475607;
        Tue, 03 Jun 2025 00:24:35 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff725asm9062249b3a.172.2025.06.03.00.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:24:35 -0700 (PDT)
Message-ID: <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
Date: Tue, 3 Jun 2025 15:24:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jann,

On 5/30/25 10:06 PM, Jann Horn wrote:
> On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>> frequently than other madvise options, particularly in native and Java
>> heaps for dynamic memory management.
>>
>> Currently, the mmap_lock is always held during these operations, even when
>> unnecessary. This causes lock contention and can lead to severe priority
>> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
>> hold the lock and block higher-priority threads.
>>
>> This patch enables the use of per-VMA locks when the advised range lies
>> entirely within a single VMA, avoiding the need for full VMA traversal. In
>> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>>
>> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
>> benefits from this per-VMA lock optimization. After extended runtime,
>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>> only 1,231 fell back to mmap_lock.
>>
>> To simplify handling, the implementation falls back to the standard
>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
>> userfaultfd_remove().
> 
> One important quirk of this is that it can, from what I can see, cause
> freeing of page tables (through pt_reclaim) without holding the mmap
> lock at all:
> 
> do_madvise [behavior=MADV_DONTNEED]
>    madvise_lock
>      lock_vma_under_rcu
>    madvise_do_behavior
>      madvise_single_locked_vma
>        madvise_vma_behavior
>          madvise_dontneed_free
>            madvise_dontneed_single_vma
>              zap_page_range_single_batched [.reclaim_pt = true]
>                unmap_single_vma
>                  unmap_page_range
>                    zap_p4d_range
>                      zap_pud_range
>                        zap_pmd_range
>                          zap_pte_range
>                            try_get_and_clear_pmd
>                            free_pte
> 
> This clashes with the assumption in walk_page_range_novma() that
> holding the mmap lock in write mode is sufficient to prevent
> concurrent page table freeing, so it can probably lead to page table
> UAF through the ptdump interface (see ptdump_walk_pgd()).

Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
following case:

cpu 0				cpu 1

ptdump_walk_pgd
--> walk_pte_range
     --> pte_offset_map (hold RCU read lock)
				zap_pte_range
				--> free_pte (via RCU)
         walk_pte_range_inner
         --> ptdump_pte_entry (the PTE page is not freed at this time)

IIUC, there is no UAF issue here?

If I missed anything please let me know.

Thanks,
Qi


