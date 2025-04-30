Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74A145A03
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746049868; cv=none; b=t78/hSpWvmsaEcw+SBTcIwsHZu35ws9qSpfIf/UvCiDiAgUuvAhg0m5KcC54azq54h5KLL3HAB+ljPKyp2Xu2HVhtRFzx7wwHvOox5YLzNN9CTt8Ac/HohsqQ2mHIG97U7eC6SiPawGxYMtxQmE4TWQ04NrgkQbme2+gcf5iYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746049868; c=relaxed/simple;
	bh=5u/M4235ZhIaoydVPyaBH4cYCvqZf2avpMDKQWTlaWo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HVOmA6tmmxz4ZyMsfqlsOEik0mEE5+lPpprXL8YKY8VTdWorGdMf0SiPVx6rrci88QceMd7D6zbdotJP36Fq/FQ/XXy+tsOcJPoGIlVWi6vDAYcVnipcocSo76As8k5wMe4bnIAyhND/NGql08YzIvoOC4oFUzpj14koKl8buPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RndfgxAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RndfgxAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C5EC4CEE7;
	Wed, 30 Apr 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746049867;
	bh=5u/M4235ZhIaoydVPyaBH4cYCvqZf2avpMDKQWTlaWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RndfgxAr+7rzrSzhRqUo3Hdh8cOk1RR+5tdnl4wEyYYGeBTuUq2adD0CtwrTvKC8+
	 dCPYZldY4E2o0iBRPOHrpSYjq8fGDoceEbNX1cS2VvMPrZM1ARHA6ddt6i14worw86
	 Ftug5mszCLdfxUuQBPRg3hOiMYU/LpCr0zRhkqrk=
Date: Wed, 30 Apr 2025 14:51:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Mike Rapoport <rppt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Nhat Pham <nphamcs@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim
 <minchan@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Casper Li <casper.li@mediatek.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>, Barry Song
 <21cnbao@gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Message-Id: <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.com> wrote:

> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
> 
> Problem:
>   In the current system, the kswapd thread is responsible for both scanning
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lead
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causing
>   delays in memory reclaiming and overall system performance degradation.
> 
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
> 
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per second
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memory
> pressure and improving system responsiveness.

It's a significant change and I'm thinking that broader performance
testing across a broader range of machines is needed before we can
confidently upstream such a change.

Also, it's presumably a small net loss on single-CPU machines (do these
exist any more?).  Is it hard to disable this feature on such machines?

>  
> +static bool swap_sched_async_compress(struct folio *folio)
> +{
> +	struct swap_info_struct *sis = swp_swap_info(folio->swap);
> +	int nid = numa_node_id();
> +	pg_data_t *pgdat = NODE_DATA(nid);
> +
> +	if (unlikely(!pgdat->kcompressd))
> +		return false;
> +
> +	if (!current_is_kswapd())
> +		return false;
> +
> +	if (!folio_test_anon(folio))
> +		return false;

Are you sure the above three tests are really needed?


