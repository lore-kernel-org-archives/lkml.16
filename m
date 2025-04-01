Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E61FAC5F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507495; cv=none; b=H3kW4R14XWglsqEijQPQWBlz5cfKAZycM8D2siOgrFRAQVCnf8rvN/ghLniDh80zM5A6LHVOhkL4N/9VhJ6cyI5igVtHQy0V0q8gxIZCAbSyzl0BUbN6gxhjojHG2OVxN+ctc5/isfh7Cjkp+wz3e0fWM8dQQ8zgx6Xv3bCFFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507495; c=relaxed/simple;
	bh=5ewUIkcDYDp5CI8gkXADDwYJIM1RS38PD14UJnHj13U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7L7bN3HEqVrbahjGsVOHZhtvFyD3+Cd5hhKbUl/EF/9t3L1h+emsz8I7I2Ji+9/J/p8znpMh3cAYvpshix07tlxD+eBiMsA9/+fzzLnYtUc6Nmv5yLw7dfqoIKhTc8i2S3LyOOc8Rq9XvKCodh+Ey8gc+Gv//5+QdDKZAoeiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=be2L2WzG; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="be2L2WzG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743507489; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dPsW6zzNsJ8iBAR6uGrinqus+uX+vXrhwBfcxZTSSyE=;
	b=be2L2WzGFT9HVNS9qtNj6+ldb0AgRPjgQACc5sed6xmxdtfi/uCRm9JOR38pf4tlb3T7fKc5yszDK+PFOqz3AVpzKvLpcYkRaCTp2YQRJktMTsrrVRE5eCd7XqtG4scjANUQ4O66SwWmJuyudqRVOA/naTMi4ZLeawKIuTBhfuQ=
Received: from 30.221.147.144(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WU041zZ_1743507487 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Apr 2025 19:38:07 +0800
Message-ID: <e1014674-51a4-4d40-9bc9-0906ffbeadac@linux.alibaba.com>
Date: Tue, 1 Apr 2025 19:38:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: fixing global bitmap allocating failure for
 discontig type
To: Heming Zhao <heming.zhao@suse.com>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 gautham.ananthakrishna@oracle.com
References: <20250327062209.19201-1-heming.zhao@suse.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20250327062209.19201-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/3/27 14:22, Heming Zhao wrote:
> The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
> fragmentation is high") introduced a regression. In the discontiguous
> extent allocation case, ocfs2_cluster_group_search() is comparing with
> the wrong target length, which causes allocation failure.
> 
> Call stack:
> ocfs2_mkdir()
>  ocfs2_reserve_new_inode()
>   ocfs2_reserve_suballoc_bits()
>    ocfs2_block_group_alloc()
>     ocfs2_block_group_alloc_discontig()
>      __ocfs2_claim_clusters()
>       ocfs2_claim_suballoc_bits()
>        ocfs2_search_chain()
>         ocfs2_cluster_group_search()
> 
> Reported-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
> Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/suballoc.c | 14 +++++++++++---
>  fs/ocfs2/suballoc.h |  1 +
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
> index f7b483f0de2a..3dea082f6e91 100644
> --- a/fs/ocfs2/suballoc.c
> +++ b/fs/ocfs2/suballoc.c
> @@ -698,10 +698,12 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
>  
>  	bg_bh = ocfs2_block_group_alloc_contig(osb, handle, alloc_inode,
>  					       ac, cl);
> -	if (PTR_ERR(bg_bh) == -ENOSPC)
> +	if (PTR_ERR(bg_bh) == -ENOSPC) {
> +		ac->ac_which = OCFS2_AC_USE_MAIN_DISCONTIG;
>  		bg_bh = ocfs2_block_group_alloc_discontig(handle,
>  							  alloc_inode,
>  							  ac, cl);
> +	}
>  	if (IS_ERR(bg_bh)) {
>  		status = PTR_ERR(bg_bh);
>  		bg_bh = NULL;
> @@ -2365,7 +2367,8 @@ int __ocfs2_claim_clusters(handle_t *handle,
>  	BUG_ON(ac->ac_bits_given >= ac->ac_bits_wanted);
>  
>  	BUG_ON(ac->ac_which != OCFS2_AC_USE_LOCAL
> -	       && ac->ac_which != OCFS2_AC_USE_MAIN);
> +	       && ac->ac_which != OCFS2_AC_USE_MAIN
> +	       && ac->ac_which != OCFS2_AC_USE_MAIN_DISCONTIG);
>  
>  	if (ac->ac_which == OCFS2_AC_USE_LOCAL) {
>  		WARN_ON(min_clusters > 1);
> @@ -2427,7 +2430,12 @@ int ocfs2_claim_clusters(handle_t *handle,
>  			 u32 *cluster_start,
>  			 u32 *num_clusters)
>  {
> -	unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
> +	unsigned int bits_wanted;
> +
> +	if (ac->ac_which == OCFS2_AC_USE_MAIN)
> +		bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
> +	else /* ac_which == OCFS2_AC_USE_MAIN_DISCONTIG */
> +		bits_wanted = min_clusters;

This looks wried. Why can not be other alloc type?

Or it seems you intend to:

unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;

if (ac->ac_which == OCFS2_AC_USE_MAIN_DISCONTIG)
	bits_wanted = min_clusters;

Thanks,
Joseph

>  
>  	return __ocfs2_claim_clusters(handle, ac, min_clusters,
>  				      bits_wanted, cluster_start, num_clusters);
> diff --git a/fs/ocfs2/suballoc.h b/fs/ocfs2/suballoc.h
> index b481b834857d..bcf2ed4a8631 100644
> --- a/fs/ocfs2/suballoc.h
> +++ b/fs/ocfs2/suballoc.h
> @@ -29,6 +29,7 @@ struct ocfs2_alloc_context {
>  #define OCFS2_AC_USE_MAIN  2
>  #define OCFS2_AC_USE_INODE 3
>  #define OCFS2_AC_USE_META  4
> +#define OCFS2_AC_USE_MAIN_DISCONTIG  5
>  	u32    ac_which;
>  
>  	/* these are used by the chain search */

