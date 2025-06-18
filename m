Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490A27E046
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750290215; cv=none; b=ep6LSweVGogaBXM5DAwlvrvu8BCMe88v3W9tAYR3P0CM4mhmdc78LadKrw4SmlgyPWmp2FHbGDRFFEXRh3AHXCEOb0+99RxE3f4EszLj7pSyLDdowpcorNmD53iZQlni7HQrEUZsGnvMJHel1KCkbncq522f9uZJ3aj2Sb1Z7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750290215; c=relaxed/simple;
	bh=kjolxyeR6uYiKLj+UphTP3FPE1jfe9eMmKX+xYpXrfA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NNTUyNprbiE7xzlvVsd83P/UytzLTXA8dMn0WjG5QT0Yc9oKAafKFLmRVHpTqYczrUcNGx2W4WFHGdaDuTtoIRxJqOB+dJd3Y7LshRBKW2EHzcBSWy6U4VlZTXGnzp5c2IFeoLgModcQJxQ9dINwFI25FWPNxmK19/qe5ixcQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NCuGKisd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NCuGKisd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFF8C4CEE7;
	Wed, 18 Jun 2025 23:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750290215;
	bh=kjolxyeR6uYiKLj+UphTP3FPE1jfe9eMmKX+xYpXrfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NCuGKisdUUBMLRMCy31Zvp+2t1QwaN7ATSS53e+cjr9BcGUcgkaKeejqH860ShP75
	 5NWuzA2y5Hj6POaK0Hp/q4xl3MP3ey5N3AYpajp1bSa5ykwnY0RHLGrlItH5TVzePe
	 j7rONLLwd5Xl/dhCDMvJrCMu3xUMTaY9aqdQMozQ=
Date: Wed, 18 Jun 2025 16:43:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Kent
 Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH] mm: rename the oldflags and parameter in
 memalloc_flags_*()
Message-Id: <20250618164334.54616cb2d70a1ee3c1f28a81@linux-foundation.org>
In-Reply-To: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
References: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 15:03:28 +0800 Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:

> The variable name oldflags can indeed be misleading, because
> it does not store the complete original value of flags.
> Instead, it records which flags from the given set are not
> currently set. So rename it.
> 

Your email client is mangling the patches in strange ways.  Please send
yourself a patch, figure out why it didn't apply?

> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
>  }
>  
>  /**
> - * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
> + * memalloc_flags_save - Add a PF_* flag to current->flags, return saved flags mask
>   *
>   * This allows PF_* flags to be conveniently added, irrespective of current
>   * value, and then the old version restored with memalloc_flags_restore().
>   */
> -static inline unsigned memalloc_flags_save(unsigned flags)
> +static inline unsigned int memalloc_flags_save(unsigned int flags_mask)
>  {
> -	unsigned oldflags = ~current->flags & flags;
> -	current->flags |= flags;
> -	return oldflags;
> +	unsigned int saved_flags_mask = ~current->flags & flags_mask;
> +
> +	current->flags |= flags_mask;
> +	return saved_flags_mask;
>  }
>  
> -static inline void memalloc_flags_restore(unsigned flags)
> +static inline void memalloc_flags_restore(unsigned int flags_mask)
>  {
> -	current->flags &= ~flags;
> +	current->flags &= ~flags_mask;
>  }

I guess so.  Maybe.  A bit.  Kent, what do you think?
