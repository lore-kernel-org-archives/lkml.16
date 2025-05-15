Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A826ACC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747280475; cv=none; b=iWf0KE2s8GFO+heN06oqr/4YD84YTUX+pXB22PAMQ3iiy2MPC6ZLHt0s7DlKTVzIhCHnTEJHsaKhUlORpmTpm8Maa2ajSnFfU+HzCGnT8fM79/wa+qItHtmFZ32Ptd6pYDazETWcOeSOf2ppckuywOo3F9NYeqd1/i4t8OXp46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747280475; c=relaxed/simple;
	bh=wILSGy5886tWI0HRy51lUpPDqbSaBc1fbaonwNrEmXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/WsUqMaE0e9Oy6bAT2iQ0Cxr2jrS7CAcGEatk61wsv4RSWOcfi8I4G6PUUaXUFpZX+5dGvzjWIGfGDb1dd7T6pRoDr3gRLEnnLsA+x00lXCOWeAhvvF8EvR5+WC/vloK99H8eXFwqnPX6MZXuyNp5JVzxG0V9IBh5EPuriAB8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YT/EyHu5; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YT/EyHu5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747280462; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=utrn866EA563qPPDBDN5+mo/2vugsVwpDaeN4GcFtM8=;
	b=YT/EyHu5arajpa6AVdzJygwESVj1gaJpDIHIPFIFuFk9wEN0twxUVWrnXg1OkJ+YvIwk2ENgIY+33H+fspTdvAHtuhEJFD2aQkUsEGZ2mwEnUGHKycD6FQ20Dr4UKKbJH2UcZbKraafP13K0sw6f0OxG0HNoKssf3lui4/ZKElI=
Received: from 30.74.144.114(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wap3lOb_1747280460 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 May 2025 11:41:00 +0800
Message-ID: <1a985416-c8c5-429f-a83a-3c66be939439@linux.alibaba.com>
Date: Thu, 15 May 2025 11:40:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: make try_to_unmap_one support batched unmap for
 anon large folios
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>,
 Baoquan He <bhe@redhat.com>, Dan Schatzberg <schatzberg.dan@gmail.com>,
 Kaixiong Yu <yukaixiong@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250513084620.58231-1-21cnbao@gmail.com>
 <dfdf06eb-faf5-487a-b0e6-57c1ceb58fcc@linux.alibaba.com>
 <CAGsJ_4yF-evyWCvF=aO_Y2UzpPMAb4zdOe3i5AtR_RBVDbuUZA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4yF-evyWCvF=aO_Y2UzpPMAb4zdOe3i5AtR_RBVDbuUZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/15 09:35, Barry Song wrote:
> On Wed, May 14, 2025 at 8:11 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 2025/5/13 16:46, Barry Song wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> My commit 354dffd29575c ("mm: support batched unmap for lazyfree large
>>> folios during reclamation") introduced support for unmapping entire
>>> lazyfree anonymous large folios at once, instead of one page at a time.
>>> This patch extends that support to generic (non-lazyfree) anonymous
>>> large folios.
>>>
>>> Handling __folio_try_share_anon_rmap() and swap_duplicate() becomes
>>> extremely complex—if not outright impractical—for non-exclusive
>>> anonymous folios. As a result, this patch limits support to exclusive
>>> large folios. Fortunately, most anonymous folios are exclusive in
>>> practice, so this restriction should be acceptable in the majority of
>>> cases.
>>>
>>> SPARC is currently the only architecture that implements
>>> arch_unmap_one(), which also needs to be batched for consistency.
>>> However, this is not yet supported, so the platform is excluded for
>>> now.
>>>
>>> Using the following micro-benchmark to measure the time taken to perform
>>> PAGEOUT on 256MB of 64KiB anonymous large folios.
>>>
>>>    #define _GNU_SOURCE
>>>    #include <stdio.h>
>>>    #include <stdlib.h>
>>>    #include <sys/mman.h>
>>>    #include <string.h>
>>>    #include <time.h>
>>>    #include <unistd.h>
>>>    #include <errno.h>
>>>
>>>    #define SIZE_MB 256
>>>    #define SIZE_BYTES (SIZE_MB * 1024 * 1024)
>>>
>>>    int main() {
>>>        void *addr = mmap(NULL, SIZE_BYTES, PROT_READ | PROT_WRITE,
>>>                          MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>        if (addr == MAP_FAILED) {
>>>            perror("mmap failed");
>>>            return 1;
>>>        }
>>>
>>>        memset(addr, 0, SIZE_BYTES);
>>>
>>>        struct timespec start, end;
>>>        clock_gettime(CLOCK_MONOTONIC, &start);
>>>
>>>        if (madvise(addr, SIZE_BYTES, MADV_PAGEOUT) != 0) {
>>>            perror("madvise(MADV_PAGEOUT) failed");
>>>            munmap(addr, SIZE_BYTES);
>>>            return 1;
>>>        }
>>>
>>>        clock_gettime(CLOCK_MONOTONIC, &end);
>>>
>>>        long duration_ns = (end.tv_sec - start.tv_sec) * 1e9 +
>>>                           (end.tv_nsec - start.tv_nsec);
>>>        printf("madvise(MADV_PAGEOUT) took %ld ns (%.3f ms)\n",
>>>               duration_ns, duration_ns / 1e6);
>>>
>>>        munmap(addr, SIZE_BYTES);
>>>        return 0;
>>>    }
>>>
>>> w/o patch:
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 1337334000 ns (1337.334 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 1340471008 ns (1340.471 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 1385718992 ns (1385.719 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 1366070000 ns (1366.070 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 1347834992 ns (1347.835 ms)
>>>
>>> w/patch:
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 698178000 ns (698.178 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 708570000 ns (708.570 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 693884000 ns (693.884 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 693366000 ns (693.366 ms)
>>> ~ # ./a.out
>>> madvise(MADV_PAGEOUT) took 690790000 ns (690.790 ms)
>>>
>>> We found that the time to reclaim this memory was reduced by half.
>>
>> Do you have some performance numbers for the base page?
> 
> We verified that folio_test_large(folio) needs to run in a batched context;
> otherwise, nr_pages remains 1 for each folio.
> 
>                          if (folio_test_large(folio) && !(flags &
> TTU_HWPOISON) &&
>                              can_batch_unmap_folio_ptes(address, folio, pvmw.pte,
>                              anon_exclusive))
>                                  nr_pages = folio_nr_pages(folio);
> 
> I didn't expect any noticeable performance change for base pages, but testing
> shows the patch appears to make them slightly faster—likely due to test noise or
> jitter.
> 
> W/o patch:
> 
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5686488000 ns (5686.488 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5628330992 ns (5628.331 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5771742992 ns (5771.743 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5672108000 ns (5672.108 ms)
> 
> 
> W/ patch:
> 
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5481578000 ns (5481.578 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5425394992 ns (5425.395 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5522109008 ns (5522.109 ms)
> ~ # ./a.out
> madvise(MADV_PAGEOUT) took 5506832000 ns (5506.832 ms)

Thanks. My expectation is also that the batch processing of large folios 
should not have a performance impact on the base pages, but it would be 
best to clearly state this in the commit message.
