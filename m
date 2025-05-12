Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0581AA1E0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063583; cv=none; b=U/jdUf2lMa8IJnx3CkLNuO9mkiCnX2hFrjn42fEmrvo2BsUUziS9xa3RfJV050Csa1K4BOBOS0a2RERisV6P33DQFBWlAbvvokbb2d8TweoMou2iZKgC8SaKy7/QdEpGb/d4nuP9rSn7jyqVWX7J4MS8qKCr+l7kK/tFGMvxsdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063583; c=relaxed/simple;
	bh=pA0ZG+zMDkePkd5inej7Sm0/oAMcF9hcpf+JeNoh9PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=te7JlyEGTmGM24IRKIt7u1URvYMtvPM4CzxLgMvS83e0KIjQ90VzPxNS9TjePOuD4BuGjWO95Gt4YqpoYK5jvIrT/6g63Vh2vIvAX42M/+Qv818IGZNw8W9lOrKw/KutZm0a8DLK3pee3pCjwmGUVWHNdJ8fJ40//hjvz8c0VKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LT7z55GV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LT7z55GV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17310C4CEE7;
	Mon, 12 May 2025 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747063583;
	bh=pA0ZG+zMDkePkd5inej7Sm0/oAMcF9hcpf+JeNoh9PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LT7z55GVIECZDNL37DY79rQa1ewwJDH/PViw+7T4GWdVpfmcHO65Bj4WVsK+GVXya
	 GIkaYlr9QnFVkZ4gCFN5vb03P8oAgZgzwgCtc3Tp2hHqTPbFT8FCg/1stEv74MASLY
	 BkCa4GbffdLUGtt/GKXFOyxMYlSLZFiaQ0y+N/Uocpjw0+iG69sPKTE+4oZd4eGqMK
	 jmLe5vwdaQwix0XDXawQmbM8GZpOIajkZtDnFsjZQorsDFSmH+Bu+KC9bvPuZ+zayF
	 6t4DFFllQPm5Bk75iHMvQvivcktkr0GMdUysC08zFz2YuUbApNPeYG0ykvpijBnFMt
	 UUExfzp6QIjaw==
Date: Mon, 12 May 2025 15:26:21 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>, g@google.com
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] f2fs: add f2fs_bug_on() to detect potential bug
Message-ID: <aCITHczkYs49uBSc@google.com>
References: <20250512115442.2640895-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>

On 05/12, Chao Yu wrote:
> Add f2fs_bug_on() to check whether memory preallocation will fail or
> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).

Are we getting a bug?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 4 +++-
>  fs/f2fs/node.c       | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index e7907858eb70..3f223bade520 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>  {
>  	struct inode_management *im = &sbi->im[type];
>  	struct ino_entry *e = NULL, *new = NULL;
> +	int ret;
>  
>  	if (type == FLUSH_INO) {
>  		rcu_read_lock();
> @@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>  		new = f2fs_kmem_cache_alloc(ino_entry_slab,
>  						GFP_NOFS, true, NULL);
>  
> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	f2fs_bug_on(sbi, ret);
>  
>  	spin_lock(&im->ino_lock);
>  	e = radix_tree_lookup(&im->ino_root, ino);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 3f6b8037d25f..88d3032236cb 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>  	struct free_nid *i, *e;
>  	struct nat_entry *ne;
> -	int err = -EINVAL;
> +	int err;
>  	bool ret = false;
>  
>  	/* 0 nid should not be used */
> @@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>  	i->nid = nid;
>  	i->state = FREE_NID;
>  
> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
> +	f2fs_bug_on(sbi, err);
> +
> +	err = -EINVAL;
>  
>  	spin_lock(&nm_i->nid_list_lock);
>  
> -- 
> 2.49.0
