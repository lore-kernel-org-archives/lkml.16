Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C76021CA08
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086023; cv=none; b=Kqzy9BItrNqAHk5nq6cHysCrhl4MKtJBXKag/BUMZhUuob9ujnhVlcL7tIxaVIGhmXuBG1OGt8SAjoC6vYdtJwAUfyBJ6HlngNbWT7UvRe9UNO98TGj86f6hnUhLFY/2WRz8PIvQws51zCAkc0aajzVIz+oZiVYP0IJA37Q03Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086023; c=relaxed/simple;
	bh=BYX/zclVmxImPN6qNdeFXkdnxeNhsIDXC2rchktp9BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJFCl3Lru3TCKUZGYVxPNQSbpOfKt+6UWLCufCQKlXVxErgnWXIlFyta9Dr6Cr7BuPSo+dZpFX53oh0XEIjWWaqD9wvBMfweHMDLKAT3MHiCN/GrqizEyWsjF9EXncuero7YKdPEnzFGvjPxqzFwPw26qwR8M9ERMfasnmh6CEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jF/SrK4g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jF/SrK4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750086020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MblsDYTOzgLu/9U4Wm0K3LDmwhpLBb+6dKjuJ+bGvVw=;
	b=jF/SrK4gIZJJDAnipUb6W708KNJv2IFQQ8OO8qcSjaCA6ZAN8TwMMzHbKg3/V7yuOXWEav
	XXR4/OLntOrsmCkCmm5ta4VWqLzg9iirURjDormXf7To3nhjZ3cMLpehOOuZ7M3npO0sYu
	0gsosML4ECjHThLxvS40q8fSGzVOQEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-bN_ntfldPcK6dFpQH01aIA-1; Mon, 16 Jun 2025 11:00:18 -0400
X-MC-Unique: bN_ntfldPcK6dFpQH01aIA-1
X-Mimecast-MFC-AGG-ID: bN_ntfldPcK6dFpQH01aIA_1750086017
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450db029f2aso21827535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086017; x=1750690817;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MblsDYTOzgLu/9U4Wm0K3LDmwhpLBb+6dKjuJ+bGvVw=;
        b=JgnZ2OGk8T52VpZYscfqHukoIabhnEZEw9hI/9lsUL6FDTK4rABzQivAcD/RQQv8BP
         YSZuEfSTczpk0YHP8pHK2PDT8mdsvPTA1u9oojncMOB7gvA2gJaJQwZgCBj8SVA8I16h
         t1bd2G6JsCxvFoNFSbof+2I89Iq/FVep1rHDYXpTuP5PwOfmMvqtbVXSWAuJtkgQsOEm
         JfDW6vwjZKLdwuEONZxyKPKksW+rfc+PcZyAIjzC3qyVDAqhAFBKGI4KCZiG5zfkLiFA
         ApQ66WmaXOy5reWK59l6W6kHwrw0aQ1BHF0iiSichayb/fuXJJqRxDf0tWPWCspRy5mo
         lefQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1Nt7mnR7dpCcJ+ID6JITIBEqypE9ki5zg1A0GyVSgp0v4AzcqiwgNd2sfz9mvHefMdLyNh0slDZSLIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WdlwzeqR/12BIUK1IWQFn44Ddi+yUn1FuKpTjGXZslqzNijk
	SFL/tHxPnkPlYyuNBDfLiNt70faGeGL5eUiaNRG8sbXA2XvfdIe9sBMNkdznbxvqWRDGZLEOiNY
	1cni9aVk5O9BP3Y9AGkaQbQn8SGaWRAvZyCFGgz8NRch5463n7eYDwVfNKGHunPgsdw==
X-Gm-Gg: ASbGncu6q25uOaxzau0d7FOZt0LRIjIiL9PLJv1RRk2lQIQSqjtuFekxmQmCpHLvYdi
	H15A3CKNpPadIUKB/EQ9W76HRz4TK91Enw6gU6j3H9Cv6UDk1loXjzcyjhtmqVXz7rRLjQH3TeE
	HmxumHDDhWvBkfZkop6bClBKD0WoJTfVtMfTXVkpJxReZFYVYRcCDdTW7AcXo3zXoZS/3dh8zdQ
	BHXKWDvAjfsYTVClZz6KDWJicS4Lkfa9zRQacihvxk0jYIxkDK5jZffpRTbhG/F/qqFniKCzJSK
	dUlQSRjBhGR3OVR9iVE4NZ+MKRFqqyccfeyIAK/Lu74PSdSO5KCHHiDU73vZ4b6LiA/E5T8Tpeq
	0HFvdegKdMkvgxTCsK1JMSEPEhBxXoe8MAtZ/G3nB8XygBPE=
X-Received: by 2002:a05:600c:4fc3:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4533caecdb4mr83888705e9.26.1750086016792;
        Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnFzhqwlFGMFEPfwXZcgSbuKx4tA+r2jOTPmCmb63LqsrLK2Arxoh+vvMh/1hpPH0j9GhIeQ==
X-Received: by 2002:a05:600c:4fc3:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-4533caecdb4mr83888345e9.26.1750086016325;
        Mon, 16 Jun 2025 08:00:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e243e59sm145543385e9.19.2025.06.16.08.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:00:15 -0700 (PDT)
Message-ID: <4a90e7b1-7592-4dea-9225-40c8e3b597d8@redhat.com>
Date: Mon, 16 Jun 2025 17:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250616103310.17625-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616103310.17625-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 12:33, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race.
> 
> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> 512 times again via pmd_free_pte_page().
> 
> We implement the locking mechanism using static keys, since the chance
> of a race is very small. Observe that the synchronization is needed
> to avoid the following race:
> 
> CPU1							CPU2
> 						take reference of PMD table
> pud_clear()
> pte_free_kernel()
> 						walk freed PMD table
> 
> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> 
> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> we are safe. If not, then the patched-in read and write locks help us
> avoid the race.
> 
> To implement the mechanism, we need the static key access from mmu.c and
> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> target in the Makefile, therefore we cannot initialize the key there, as
> is being done, for example, in the static key implementation of
> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> the jump_label mechanism. Declare the key there and define the key to false
> in mmu.c.
> 
> No issues were observed with mm-selftests. No issues were observed while
> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> sysfs in a loop.
> 
> v2->v3:
>   - Use static key mechanism
> 
> v1->v2:
>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>     the lock 512 times again via pmd_free_pte_page()
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   arch/arm64/include/asm/cpufeature.h |  1 +
>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>   arch/arm64/mm/ptdump.c              |  5 +++
>   3 files changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index c4326f1cb917..3e386563b587 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -26,6 +26,7 @@
>   #include <linux/kernel.h>
>   #include <linux/cpumask.h>
>   
> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>   /*
>    * CPU feature register tracking
>    *
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..e242ba428820 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -41,11 +41,14 @@
>   #include <asm/tlbflush.h>
>   #include <asm/pgalloc.h>
>   #include <asm/kfence.h>
> +#include <asm/cpufeature.h>
>   
>   #define NO_BLOCK_MAPPINGS	BIT(0)
>   #define NO_CONT_MAPPINGS	BIT(1)
>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>   
> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> +
>   enum pgtable_type {
>   	TABLE_PTE,
>   	TABLE_PMD,
> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>   	return 1;
>   }
>   
> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>   {
> +	bool lock_taken = false;
>   	pte_t *table;
>   	pmd_t pmd;
>   
> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>   		return 1;
>   	}
>   
> +	/* See comment in pud_free_pmd_page for static key logic */
>   	table = pte_offset_kernel(pmdp, addr);
>   	pmd_clear(pmdp);
>   	__flush_tlb_kernel_pgtable(addr);
> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> +		mmap_read_lock(&init_mm);
> +		lock_taken = true;
> +	}
> +	if (unlikely(lock_taken))
> +		mmap_read_unlock(&init_mm);
> +

I'm missing something important: why not

if (static_branch_unlikely(&ptdump_lock_key) && lock) {
	mmap_read_lock(&init_mm);
	mmap_read_unlock(&init_mm);
}

-- 
Cheers,

David / dhildenb

