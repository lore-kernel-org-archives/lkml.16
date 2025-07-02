Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD1C2DCF7A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475839; cv=none; b=tW9LBoOF53MmoH8saFNTSTdelYAGOHe7MMKrZt1/9ksNnyIp6zh0kvZ5uOY+glKkDcB7spvqix/Ki8IIKsQikXxgPFKXG7oPeEXtvLg/XuJd+ngM3nGqCz22cjaJ5iSzUXO6SCeFrx8ErtdssObFX129lRYv2ZPdqCzhFGnBmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475839; c=relaxed/simple;
	bh=Nnu4UM2wF9yPyGWNnFm5eWQQBkSGwscmfv2Tc/Oakvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTgfxClRUKuE9MFRQY3Jgs2VyS3ulGnOgEBmYjRDEFORfnsJR6wgntoaFH6NEi5n+dv15jsj9fa4kkn3UXiasMgsIy55Hhlbm1A17LfUXD+SLexwsXzBrrt2E3/mE7uxpleOQwMUVg2nyvY9GQD7L9ynpBJ2lqDemQz/irKiRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aMGrLAFt; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aMGrLAFt"
Date: Wed, 2 Jul 2025 10:03:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751475835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uMdGRf1a4Lv2dz46lGK5SBnMPQts8Ar2rsdWDu30A8=;
	b=aMGrLAFt6ceIRFGFSncF4/vJYWUGhG7ArJMoXr5qvUM2THgzz79pkNHVcUHELipMDLTUpO
	7WzM/01L8XH3RiVvOjz0nD4ToyeYY8XKavZBxY0RQkc9w1iwuuDdGQ76fwzw54MGXQD8jx
	9ucUwVBWtHfYgGoaJmYnuU2+x+VofZI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jeongjun Park <aha310510@gmail.com>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, 
	akpm@linux-foundation.org, vbabka@suse.cz, rientjes@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
Message-ID: <zvczeiqk535pvryfae4lta5ezvqks6knhugnzgyq6gu634gn4c@av5hhiabqmzf>
References: <20250702082749.141616-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702082749.141616-1-aha310510@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 02, 2025 at 05:27:49PM +0900, Jeongjun Park wrote:
> Read/Write to pcpu_nr_populated should be performed while protected
> by pcpu_lock. However, pcpu_nr_pages() reads pcpu_nr_populated without any
> protection, which causes a data race between read/write.
> 
> Therefore, when reading pcpu_nr_populated in pcpu_nr_pages(), it should be
> modified to be protected by pcpu_lock.
> 
> Reported-by: syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
> Fixes: 7e8a6304d541 ("/proc/meminfo: add percpu populated pages count")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  mm/percpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/percpu.c b/mm/percpu.c
> index b35494c8ede2..0f98b857fb36 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
>   */
>  unsigned long pcpu_nr_pages(void)
>  {
> -	return pcpu_nr_populated * pcpu_nr_units;

No need for the lock as I think race is fine here. Use something like
the following and add a comment.

	data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;

