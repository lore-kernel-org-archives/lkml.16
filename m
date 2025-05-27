Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7F280032
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373958; cv=none; b=m3aQV+WJ89x+fDAfIR+Rs1elF9VAWVQ38h+LkTeLEq5cuVTnjyucGrmu8DXWbC84WhXvBkEtiHAjpjaLh3sl6lxsHLvv/7Ezv38qnNi/XXTFFW4TXsJTTDNw+yvgxdCu1QJbIHB4c7WDmCOPl56KkFNC2WhxVhfUv7PFqFT/0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373958; c=relaxed/simple;
	bh=ERQGBxfREhehbTHn9S6ckLVE4roOGQySAqtM4e0+RwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fLzzSl06rN/2n12ec5/fIXZlTX3EajhHJYbFxVKs2mBcnNFz6atOV8nmT34AD8Cwz9wLcPTJxLk07Go++pBQmMr5ZoypNQMKsbrejHSJpe5o08/VOVmuSGPX674ILPdcrNZSz4I0sWNzZ5eyoZzF6wrgpJBqaLC2MNO/QLeFyfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edYTmbc6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edYTmbc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBB1C4CEE9;
	Tue, 27 May 2025 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748373957;
	bh=ERQGBxfREhehbTHn9S6ckLVE4roOGQySAqtM4e0+RwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=edYTmbc6yots7d1MpDd90TgP/YEipvQ1EZRV6+QhTPE9ReH1dTfzCqhS6hh0fSP4M
	 H9j7wZfWxwtvBc+sCgw4jAEusxZrT5V0sPB1oxGeaTwbTi55VV+k3YbWs2wHxB6cMe
	 qpz4VZGkqE36bFbPio6C7GYZM84jaBAPZ35HTnpYS4bPdazxcUh0Tnsvohi7XQvRJq
	 j3hq+zfihH7GyOfjiyRx3UxG/9QgtA+ylU18Bx4OMG26HwuZNGYDGDxRipZe/5BQs9
	 XOOk+UtWgfJtNQtosuyneNvvohr3ohy8dhDMCooyJT4iqcfkHgNBsXbd95HQg1HjJ4
	 1Rvz3HFTnGgBg==
From: SeongJae Park <sj@kernel.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] mm, list_lru: refactor the locking code
Date: Tue, 27 May 2025 12:25:55 -0700
Message-Id: <20250527192555.12838-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250526180638.14609-1-ryncsn@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kairui,

On Tue, 27 May 2025 02:06:38 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> From: Kairui Song <kasong@tencent.com>
> 
> Cocci is confused by the try lock then release RCU and return logic
> here. So separate the try lock part out into a standalone helper. The
> code is easier to follow too.
> 
> No feature change, fixes:
> 
> cocci warnings: (new ones prefixed by >>)
> >> mm/list_lru.c:82:3-9: preceding lock on line 77
> >> mm/list_lru.c:82:3-9: preceding lock on line 77
>    mm/list_lru.c:82:3-9: preceding lock on line 75
>    mm/list_lru.c:82:3-9: preceding lock on line 75
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202505252043.pbT1tBHJ-lkp@intel.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: SeongJae Park <sj@kernel.org>

> ---
>  mm/list_lru.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index 490473af3122..ec48b5dadf51 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -60,30 +60,34 @@ list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
>  	return &lru->node[nid].lru;
>  }
>  
> +static inline bool lock_list_lru(struct list_lru_one *l, bool irq)
> +{
> +	if (irq)
> +		spin_lock_irq(&l->lock);
> +	else
> +		spin_lock(&l->lock);
> +	if (unlikely(READ_ONCE(l->nr_items) == LONG_MIN)) {
> +		if (irq)
> +			spin_unlock_irq(&l->lock);
> +		else
> +			spin_unlock(&l->lock);
> +		return false;
> +	}

I'd prefer 'if (likely(...)) return true;' to reduce indentation and stop
wondering what goes to the likely case earlier.  But that's my personal
preferrence that shouldn't block this.

> +	return true;
> +}
> +
>  static inline struct list_lru_one *
>  lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
>  		       bool irq, bool skip_empty)
>  {
>  	struct list_lru_one *l;
> -	long nr_items;
>  
>  	rcu_read_lock();
>  again:
>  	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> -	if (likely(l)) {
> -		if (irq)
> -			spin_lock_irq(&l->lock);
> -		else
> -			spin_lock(&l->lock);
> -		nr_items = READ_ONCE(l->nr_items);
> -		if (likely(nr_items != LONG_MIN)) {
> -			rcu_read_unlock();
> -			return l;
> -		}
> -		if (irq)
> -			spin_unlock_irq(&l->lock);
> -		else
> -			spin_unlock(&l->lock);
> +	if (likely(l) && lock_list_lru(l, irq)) {
> +		rcu_read_unlock();
> +		return l;
>  	}

Much easier to read, indeed :)

>  	/*
>  	 * Caller may simply bail out if raced with reparenting or
> -- 
> 2.49.0


Thanks,
SJ

[...]
