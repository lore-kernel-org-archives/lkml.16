Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501A18A6DB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751108912; cv=none; b=l7j8DusGC4+1A00ohMpmNKUVOgSY1U8E8BJbk11Xe/7Eke6Yv5fnjzeb3gZBR0P6TXIT04hbuKNoRUvfzfRLLV+rwTadJvAKzuXuykuV0BoZjqbfxXTPnKbxgAp/wHvHSUq1KNTiNG4B9uuTIPP61dBytF3OAC0EVPTYjUUnntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751108912; c=relaxed/simple;
	bh=Xk2DNVTvstpTZUvZ143MiQn1hd5pYDSGlzYor6sLCeg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Wf2+PGVybZHlCk4TMcWJjCZEgWqKblszv0bpbIarP4uRD2fNPH4p6GFVn5kgrVv8vOavPoYKfSFvTGtfrFzuD0pION2ZW0P9P31aVD40evBzsZ6ysGh00d0P9mcPJoTs0wvOLrpXc+Frkjjg2ZrWxkl7fQ9qXMcGKsoGk6mnth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55SB3Anu071048;
	Sat, 28 Jun 2025 20:03:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55SB3AYK071043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 28 Jun 2025 20:03:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3ce1940c-f79e-4cb9-8f5f-d457ee0daa03@I-love.SAKURA.ne.jp>
Date: Sat, 28 Jun 2025 20:03:11 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brd: fix sleeping memory allocation in brd_insert_page()
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>,
        Christoph Hellwig <hch@lst.de>, LKML <linux-kernel@vger.kernel.org>
References: <685ec4c9.a00a0220.129264.000c.GAE@google.com>
 <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
 <24a7fc31-c54f-4ef3-a76f-7d844a398720@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <24a7fc31-c54f-4ef3-a76f-7d844a398720@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp

On 2025/06/28 18:39, Tetsuo Handa wrote:
> On 2025/06/28 17:36, Tetsuo Handa wrote:
>> syzbot is reporting that brd_insert_page() is calling
>> __xa_cmpxchg(__GFP_DIRECT_RECLAIM) with spinlock and RCU lock held.
> 
> Hmm. Holding spinlock itself is OK because xa_lock() is a requirement.
> 
>> Change __xa_cmpxchg() to use GFP_NOWAIT | __GFP_NOWARN, for it is likely
>> that __xa_cmpxchg() succeeds because of preceding alloc_page().
> 
> Since this gfp flag is for allocating index array, it should use
> __GFP_DIRECT_RECLAIM if possible. Then, deferring RCU lock if possible
> makes sense. Then, I wonder what this RCU lock is protecting...
> 

OK. I assume that the "concurrent discard" in
https://lkml.kernel.org/20250628011459.832760-1-yukuai1@huaweicloud.com means
brd_do_discard().

Calling rcu_read_lock() from brd_insert_page() before xa_unlock() is called prevents
__free_page() from brd_free_one_page() from call_rcu() from brd_do_discard(), even if
the page allocated by alloc_page() and stored into brd->brd_pages by __xa_cmpxchg() is
removed by __xa_erase() before brd_rw_bvec() calls memcpy_{to,from}_page()/memset();
allowing brd_rw_bvec() to continue using the page returned by brd_insert_page().

I came to worry one possibility about the above expectation, for I don't know
details of xarray.

__xa_cmpxchg() calls __xa_cmpxchg_raw() with xa_lock already held.
__xa_cmpxchg_raw() always calls __xas_nomem() with xa_lock already held.
__xas_nomem() might temporarily release xa_lock for allocating memory if
__GFP_DIRECT_RECLAIM is specified.
__xa_cmpxchg_raw() might store "entry" at xas_store() before calling __xas_nomem().

Then, is there a possibility that __xas_nomem() temporarily releases xa_lock for
allocating memory after__xa_cmpxchg_raw() already called xas_store() ?
Unless there is a guarantee that __xas_nomem() never releases xa_lock if
__xa_cmpxchg_raw() called xa_store(), there will be a race window that
the page allocated by alloc_page() and stored into brd->brd_pages by __xa_cmpxchg() is
removed by __xa_erase() from brd_do_discard() and __free_page() from brd_free_one_page()
 from call_rcu() from brd_do_discard() is fired before brd_insert_page() calls rcu_lock()
immediately after returning from __xa_cmpxchg().

Also, what serializes concurrent brd_insert_page(), for when __xas_nomem() temporarily
released xa_lock for allocating memory, two threads might concurrently call
kmem_cache_alloc_lru() from __xas_nomem() ?

