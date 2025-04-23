Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2C10957
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435952; cv=none; b=eG7okdsLB8mF2nIGfR0I2yA7cp3bcmusbUjNfoiIhbauQsxqRbx9z2H/f7E3smgxmQ2bm3EffciWR7tMZ4qo6jnpdBI2MoitRI5Z0jMpUKUBwuMlUvFggHCBHkIPlQXivyFJC29nZuk+9DsypW6KFc82CttkVPzIHjUqQQElmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435952; c=relaxed/simple;
	bh=SldDSJRHrLfYq28NwY6a3qxK/AQSpH282D+uDY8yzbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyzNm8FmEpsg9fcQVqtqIE/3DvlXHxADTzlu36vpAEmWJlrlKcOuGTBtW7wBy2s+H3JPCLgwHCr79x+zxPiuAAzOmh3SjETdoQT8W0IiNwsuOeAA3mSWT9I5BKfI7+SRp0C3i6e/0AsUwv5AYyWzOZNDd6W19qdoz8RX+F70GSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WD5aACeZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WD5aACeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745435949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAHGe4zE8gnERUqvBrhdXOuLfdZN+3XixHIZALCJ1W8=;
	b=WD5aACeZyBsgDiv+5Kqn8swXofPaa0CLuw0T8ldwKNOjWxMrkRvGx5QE3KySdhLPNU6tsk
	Mt21YlH1dQxI+yg+jubq2QX9/WO6gOXGxIqDrwxhDTAyvYxaQpa8xLN2ng0Y1Y7poirbG2
	cTCM+C2Od6JluyGfJD3RHCEkPuUucrw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-gv-SlyYUNNOsbv7YfARzOg-1; Wed, 23 Apr 2025 15:19:07 -0400
X-MC-Unique: gv-SlyYUNNOsbv7YfARzOg-1
X-Mimecast-MFC-AGG-ID: gv-SlyYUNNOsbv7YfARzOg_1745435947
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47689dc0f6dso3275711cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435946; x=1746040746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHGe4zE8gnERUqvBrhdXOuLfdZN+3XixHIZALCJ1W8=;
        b=kj9qcsT6pJeRQ8lrYX+/pkFo8ST4BpPQPDrdNonrQfU96I3jHx5J/TCdtU9QDWJhNF
         uGmYA0WGFOdY/IbRv3jolDMyPpJaQHUnHmYEOCFkqRZZ+7ciK7n8A6d6M0gpvjh1sMXq
         1e75PLWN72s0qThX2wv/eGmU2gsBhsMvvRoklo62rtD+nkBlLRrwfXDGN5sHDY/jfjSC
         8kGfMMRqaLt8CRhpmatcmBlYDwgsTga7T8Yq4gjswR256t9yPPsWocmWb+o6TQQ2ZY7G
         ZGLnT7MPEri+DBVI+D4WlhqovUJnE5MfZq1ex9ZAiLDtUcZcmncwexhXGSzt2t2f2yfa
         2jmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJMZMOJdP45Imlp9Ty5WYSzZHhHSOKgSawC//g+Gq8DJ0VfGqn6F6+XskkTtK2BsVlEhSeVzDu+z9mGMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvI/9plOwya58fj1pkp4u1eWuDzQoIQxWak6iRk6pF0Pi7iD+
	yuRPcR9a58hV+NUEn+kzfAybjc9QFfMAOPLLtPW8uBmrg5XmzN2BU3FY0VrLGu7PVHFup9NxDBI
	uAby/rKl0Sy9QmZIRIn53r8KakqXPhyD+PNDWmt7jC+whUpUUb0RKMtDoho5H5GIbihTpJtAX
X-Gm-Gg: ASbGncvvq5UnJQScd2L4qoeo7RzrAasqHIHzCbPsjulGI6P5sJMUWt4EWJvuS0MnfYG
	KaVMSbpWLPX9T2ShrNdZti9CoAall+xlL8K7sYy3dV21St7R+VXBKhmAWK9bGiCimlHz+Ws/RWk
	t7hk6O7YcMnbzHJDTljV8b6RLdjRBudG0Q0vS8d/aN9QgKpoK9GVJoVzbfgW5+QIkGDbjSQXuWq
	pgX/UW85Tfgv4meJjLBiShkiRsFWF9j7K00yw+xWqAeE2htwbOxL3EUdcciiKS664qvvbZQYjg9
	DP+yCHrslq9HIQ==
X-Received: by 2002:a05:622a:1802:b0:476:7ff5:cc27 with SMTP id d75a77b69052e-47aec4dcc0dmr256540401cf.51.1745435946218;
        Wed, 23 Apr 2025 12:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYZnsrqVQFMmxCCRWBHo6cgTz6A3ekouceyIUYb+WLWz7C/tNEfgqMMuRkHi33l8+eZSJ1kA==
X-Received: by 2002:a05:622a:1802:b0:476:7ff5:cc27 with SMTP id d75a77b69052e-47aec4dcc0dmr256539801cf.51.1745435945812;
        Wed, 23 Apr 2025 12:19:05 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.200.211])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9a8dsm71719371cf.70.2025.04.23.12.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 12:19:05 -0700 (PDT)
Message-ID: <4d18462f-8bc6-459e-9eeb-09e63559d854@redhat.com>
Date: Wed, 23 Apr 2025 15:18:54 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Perf improvements for hugetlb and vmalloc on
 arm64
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-22 04:18, Ryan Roberts wrote:
> Hi All,
> 
> This is v4 of a series to improve performance for hugetlb and vmalloc on arm64.
> Although some of these patches are core-mm, advice from Andrew was to go via the
> arm64 tree. All patches are now acked/reviewed by relevant maintainers so I
> believe this should be good-to-go.
> 
> The 2 key performance improvements are 1) enabling the use of contpte-mapped
> blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
> were already hooks for this (used by powerpc) but they required some tidying and
> extending for arm64. And 2) batching up barriers when modifying the vmalloc
> address space for upto 30% reduction in time taken in vmalloc().
> 
> vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
> Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
> test was repeated 10 times.
> 
> legend:
>    - p: nr_pages (pages to allocate)
>    - h: use_huge (vmalloc() vs vmalloc_huge())
>    - (I): statistically significant improvement (95% CI does not overlap)
>    - (R): statistically significant regression (95% CI does not overlap)
>    - measurements are times; smaller is better
> 
> +--------------------------------------------------+-------------+-------------+
> | Benchmark                                        |             |             |
> |   Result Class                                   |    Apple M2 | Ampere Alta |
> +==================================================+=============+=============+
> | micromm/vmalloc                                  |             |             |
> |   fix_align_alloc_test: p:1, h:0 (usec)          | (I) -11.53% |      -2.57% |
> |   fix_size_alloc_test: p:1, h:0 (usec)           |       2.14% |       1.79% |
> |   fix_size_alloc_test: p:4, h:0 (usec)           |  (I) -9.93% |  (I) -4.80% |
> |   fix_size_alloc_test: p:16, h:0 (usec)          | (I) -25.07% | (I) -14.24% |
> |   fix_size_alloc_test: p:16, h:1 (usec)          | (I) -14.07% |   (R) 7.93% |
> |   fix_size_alloc_test: p:64, h:0 (usec)          | (I) -29.43% | (I) -19.30% |
> |   fix_size_alloc_test: p:64, h:1 (usec)          | (I) -16.39% |   (R) 6.71% |
> |   fix_size_alloc_test: p:256, h:0 (usec)         | (I) -31.46% | (I) -20.60% |
> |   fix_size_alloc_test: p:256, h:1 (usec)         | (I) -16.58% |   (R) 6.70% |
> |   fix_size_alloc_test: p:512, h:0 (usec)         | (I) -31.96% | (I) -20.04% |
> |   fix_size_alloc_test: p:512, h:1 (usec)         |       2.30% |       0.71% |
> |   full_fit_alloc_test: p:1, h:0 (usec)           |      -2.94% |       1.77% |
> |   kvfree_rcu_1_arg_vmalloc_test: p:1, h:0 (usec) |      -7.75% |       1.71% |
> |   kvfree_rcu_2_arg_vmalloc_test: p:1, h:0 (usec) |      -9.07% |   (R) 2.34% |
> |   long_busy_list_alloc_test: p:1, h:0 (usec)     | (I) -29.18% | (I) -17.91% |
> |   pcpu_alloc_test: p:1, h:0 (usec)               |     -14.71% |      -3.14% |
> |   random_size_align_alloc_test: p:1, h:0 (usec)  | (I) -11.08% |  (I) -4.62% |
> |   random_size_alloc_test: p:1, h:0 (usec)        | (I) -30.25% | (I) -17.95% |
> |   vm_map_ram_test: p:1, h:0 (usec)               |       5.06% |   (R) 6.63% |
> +--------------------------------------------------+-------------+-------------+
> 
> So there are some nice improvements but also some regressions to explain:
> 
> fix_size_alloc_test with h:1 and p:16,64,256 regress by ~6% on Altra. The
> regression is actually introduced by enabling contpte-mapped 64K blocks in these
> tests, and that regression is reduced (from about 8% if memory serves) by doing
> the barrier batching. I don't have a definite conclusion on the root cause, but
> I've ruled out the differences in the mapping paths in vmalloc. I strongly
> believe this is likely due to the difference in the allocation path; 64K blocks
> are not cached per-cpu so we have to go all the way to the buddy. I'm not sure
> why this doesn't show up on M2 though. Regardless, I'm going to assert that it's
> better to choose 16x reduction in TLB pressure vs 6% on the vmalloc allocation
> call duration.

I ran a couple of basic functional tests for HugeTLB for 1G, 2M, 32M and 64k
pages on an Ampere Mt. Jade and a Jetson AGX Orin systems and didn't
get any issues, so:

Tested-by: Luiz Capitulino <luizcap@redhat.com>

> 
> Changes since v3 [3]
> ====================
> - Applied R-bs (thanks all!)
> - Renamed set_ptes_anysz() -> __set_ptes_anysz() (Catalin)
> - Renamed ptep_get_and_clear_anysz() -> __ptep_get_and_clear_anysz() (Catalin)
> - Only set TIF_LAZY_MMU_PENDING if not already set to avoid atomic ops (Catalin)
> - Fix commet typos (Anshuman)
> - Fix build warnings when PMD is folded (buildbot)
> - Reverse xmas tree for variables in __page_table_check_p[mu]ds_set() (Pasha)
> 
> Changes since v2 [2]
> ====================
> - Removed the new arch_update_kernel_mappings_[begin|end]() API
> - Switches to arch_[enter|leave]_lazy_mmu_mode() instead for barrier batching
> - Removed clean up to avoid barriers for invalid or user mappings
> 
> Changes since v1 [1]
> ====================
> - Split out the fixes into their own series
> - Added Rbs from Anshuman - Thanks!
> - Added patch to clean up the methods by which huge_pte size is determined
> - Added "#ifndef __PAGETABLE_PMD_FOLDED" around PUD_SIZE in
>    flush_hugetlb_tlb_range()
> - Renamed ___set_ptes() -> set_ptes_anysz()
> - Renamed ___ptep_get_and_clear() -> ptep_get_and_clear_anysz()
> - Fixed typos in commit logs
> - Refactored pXd_valid_not_user() for better reuse
> - Removed TIF_KMAP_UPDATE_PENDING after concluding that single flag is sufficent
> - Concluded the extra isb() in __switch_to() is not required
> - Only call arch_update_kernel_mappings_[begin|end]() for kernel mappings
> 
> Applies on top of v6.15-rc3. All mm selftests run and no regressions observed.
> 
> [1] https://lore.kernel.org/all/20250205151003.88959-1-ryan.roberts@arm.com/
> [2] https://lore.kernel.org/all/20250217140809.1702789-1-ryan.roberts@arm.com/
> [3] https://lore.kernel.org/all/20250304150444.3788920-1-ryan.roberts@arm.com/
> 
> Thanks,
> Ryan
> 
> Ryan Roberts (11):
>    arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
>    arm64: hugetlb: Refine tlb maintenance scope
>    mm/page_table_check: Batch-check pmds/puds just like ptes
>    arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
>    arm64: hugetlb: Use __set_ptes_anysz() and
>      __ptep_get_and_clear_anysz()
>    arm64/mm: Hoist barriers out of set_ptes_anysz() loop
>    mm/vmalloc: Warn on improper use of vunmap_range()
>    mm/vmalloc: Gracefully unmap huge ptes
>    arm64/mm: Support huge pte-mapped pages in vmap
>    mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
>    arm64/mm: Batch barriers when updating kernel mappings
> 
>   arch/arm64/include/asm/hugetlb.h     |  29 ++--
>   arch/arm64/include/asm/pgtable.h     | 209 +++++++++++++++++++--------
>   arch/arm64/include/asm/thread_info.h |   2 +
>   arch/arm64/include/asm/vmalloc.h     |  45 ++++++
>   arch/arm64/kernel/process.c          |   9 +-
>   arch/arm64/mm/hugetlbpage.c          |  73 ++++------
>   include/linux/page_table_check.h     |  30 ++--
>   include/linux/vmalloc.h              |   8 +
>   mm/page_table_check.c                |  34 +++--
>   mm/vmalloc.c                         |  40 ++++-
>   10 files changed, 329 insertions(+), 150 deletions(-)
> 
> --
> 2.43.0
> 
> 

