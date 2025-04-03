Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE87F7FC;
	Thu,  3 Apr 2025 14:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689684; cv=none; b=SX833NlXgJd/qCoXybjqbWqntcYoXRkMQS5r3o1Z0aQ9pBjE97EwLPiUwB14Xo7f4joC7ReNED1WuL3ozbIs6LGIH7jyWYC+YZuJLv3HgDDI50UbE05PETfjbnYX3obvSV/fXm3ty6M366DCyt2D4URwvyPS/C7uZcfv4eQAX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689684; c=relaxed/simple;
	bh=NKrPEBOALWKkh2iWielUzuS9aay0wqc4xt9i2j2zP5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIcejuqv9cV2OsDv8ne13kRrmb3pFJ8b5H3RDm2XSZxCHDbi4oJqExnS5LAo0aMgQcxywY7g0vSkhgU7XT4Yx+HtFKAXjURhp0OaK7sg+TZpsQI3qV3pcvY6UOfDwhEB2kv9h+opedUG77/gkV0YhTcwUexqz2/J03VpVg9vOdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJZbCgxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJZbCgxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D20C4CEE3;
	Thu,  3 Apr 2025 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689683;
	bh=NKrPEBOALWKkh2iWielUzuS9aay0wqc4xt9i2j2zP5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJZbCgxVwmEf9qNqYxKwuoXWcuCaqgucfZZNBAsZLjohKCgN+BiSq/2ZY8EGdGXJv
	 5Xmahiw9wygnNv8LWl/CN3EQWu7wi7B47/t+Def0t42SLiRAjUUTZRtcYgQg15quv8
	 GtIGteAHHaWc6GELIkllK98hcgEgd34qIzV1H/A76DAXQkVSeecbBH8AQloNfNmHCM
	 3QWWu8OJRvFZQAZv8O8XjfJ6tGw1tJE1mT/5CMfTZUSzIm3SOYXD0GNt+RC5avJVKk
	 appw42qBAAowPMY87If8laT4uqtK2nIASxNXJsRQvsmETe1wGA7lJtGLHGXKUrgK2q
	 +JrbtAZFTXlmg==
Date: Thu, 3 Apr 2025 17:14:36 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Remove a bogus reference to ZONE_DMA
Message-ID: <Z-6XzG8En35-vg-H@kernel.org>
References: <20250403141125.271047-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403141125.271047-1-ptesarik@suse.com>

On Thu, Apr 03, 2025 at 04:11:25PM +0200, Petr Tesarik wrote:
> Remove dead code. LoongArch does not have a DMA memory zone. The
> architecture does not even define MAX_DMA_PFN.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/loongarch/mm/init.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index ca5aa5f46a9f..7fab370efa74 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -65,9 +65,6 @@ void __init paging_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES];
>  
> -#ifdef CONFIG_ZONE_DMA
> -	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
> -#endif
>  #ifdef CONFIG_ZONE_DMA32
>  	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
>  #endif
> -- 
> 2.48.1
> 

-- 
Sincerely yours,
Mike.
