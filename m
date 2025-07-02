Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA158225D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420472; cv=none; b=Jvi/93TBz0TdNrPJLJNtoskTGoCP8WSOuiHckr0+eBQzfptym9bMHsubWI1bmoe0NmpXy1GhR0xD7wsj2KVFBsDd/fFRu7AWb4ONJT3OpBu95PySlMYkeFXEe/el7dyVCs2Wko16EUhz/T6TAFXUVjOdDd3Xu3RALttH1+2TOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420472; c=relaxed/simple;
	bh=Z17D8hbRXfXhqlBIMcMhJaRdJOWdZJdkKbrUsOxGlfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qglIZXaCaSdXmQ9AOLSkk7xDr+yiFVbd+puLACKYOQvJYA0vmqSO6Ae2K3/++2bWMaOkIuQrZh0kbznirGo7KLyytSm0N5emKhGdbFnP/RhLMXgTtaJvgUZdJhSRBzZaAKZIOs8QIQHcBIGgTT10gP3LIEuLaPmJ6clExz1Aqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5621f8D6010583;
	Wed, 2 Jul 2025 10:41:08 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5621f7NX010579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Jul 2025 10:41:07 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <1921ec99-7abb-42f1-a56b-d1f0f5bc1377@I-love.SAKURA.ne.jp>
Date: Wed, 2 Jul 2025 10:41:07 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in xfs_init_fs_context
To: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
        Barry Song <baohua@kernel.org>
Cc: syzbot <syzbot+359a67b608de1ef72f65@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com,
        david@redhat.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        matthew.brost@intel.com, rakie.kim@sk.com,
        syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com
References: <6861c281.a70a0220.3b7e22.0ab8.GAE@google.com>
 <DDD5FAAF-F698-4FC8-B49C-FD1D3B283A8E@nvidia.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <DDD5FAAF-F698-4FC8-B49C-FD1D3B283A8E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/02 0:01, Zi Yan wrote:
>>  __alloc_frozen_pages_noprof+0x319/0x370 mm/page_alloc.c:4972
>>  alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
>>  alloc_slab_page mm/slub.c:2451 [inline]
>>  allocate_slab+0xe2/0x3b0 mm/slub.c:2627
>>  new_slab mm/slub.c:2673 [inline]
> 
> new_slab() allows __GFP_NOFAIL, since GFP_RECLAIM_MASK has it.
> In allocate_slab(), the first allocation without __GFP_NOFAIL
> failed, the retry used __GFP_NOFAIL but kmem_cache order
> was greater than 1, which led to the warning above.
> 
> Maybe allocate_slab() should just fail when kmem_cache
> order is too big and first trial fails? I am no expert,
> so add Vlastimil for help. Barry, who added the nofail
> warning is cc’d.

Indeed. In allocate_slab(struct kmem_cache *s, gfp_t flags, int node),

	/*
	 * Let the initial higher-order allocation fail under memory pressure
	 * so we fall-back to the minimum order allocation.
	 */
	alloc_gfp = (flags | __GFP_NOWARN | __GFP_NORETRY) & ~__GFP_NOFAIL;
	if ((alloc_gfp & __GFP_DIRECT_RECLAIM) && oo_order(oo) > oo_order(s->min))
		alloc_gfp = (alloc_gfp | __GFP_NOMEMALLOC) & ~__GFP_RECLAIM;

	slab = alloc_slab_page(alloc_gfp, node, oo);
	if (unlikely(!slab)) {
		oo = s->min;
		alloc_gfp = flags;
		/*
		 * Allocation may have failed due to fragmentation.
		 * Try a lower order alloc if possible
		 */
		slab = alloc_slab_page(alloc_gfp, node, oo);

__GFP_NOFAIL needs to be dropped unless s->min is either 0 or 1.

		if (unlikely(!slab))
			return NULL;
		stat(s, ORDER_FALLBACK);
	}



By the way, why is xfs_init_fs_context() using __GFP_NOFAIL ?

	mp = kzalloc(sizeof(struct xfs_mount), GFP_KERNEL | __GFP_NOFAIL);
	if (!mp)
		return -ENOMEM;

This looks an allocation attempt which can fail safely.

