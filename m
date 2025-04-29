Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE1514EC5B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908353; cv=none; b=FeYAornRZfXalJ13GbHWvuTRjfR917da12N62BMXEAqa76APH4cl77xF0cJutatZG8bW68rRosAySRPZm4FjADJ4AE0I/tbE8SpW3qiwgle7Y77YktIXIztHytgWFWba+Nix7kXdMpZadTqe130RqQTCZew2b7u0e6aFDfx8nvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908353; c=relaxed/simple;
	bh=Vkza2O6+dGm8gXRPylVtJ0daXTiMNkYHqq4Fd861PQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daWH5RvUR0tTdwzwjXvzlSS/MXQDVtlWXhWrL8EISRVze4d99R15sTs3zFimFjoXbfLQoJ8u+52NdcaDmOpc2W4Lp1wh/Xs2LQcSmOKKe2iXxaEJm900urN3W5H2uwHUPMs0uFAwypp0pBAkOIWnfIV2hQCkZVEVmzaUAUAheBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAC1GI1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAC1GI1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5D1C4CEE3;
	Tue, 29 Apr 2025 06:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745908352;
	bh=Vkza2O6+dGm8gXRPylVtJ0daXTiMNkYHqq4Fd861PQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAC1GI1EUbJ0bj0WQFTmDYTXyhM2mYU4X0xXAt/1c4Yb/6dZgS4DZ1dZE/unvU0y0
	 YsVZOMT78CTtPglJ3VbHzoxxrAHhfPEONSrncMGnYGaJ7D1q6vTtS41sW0friv/YaC
	 pKVc7BZLoEdASOk1EYXDcPJ8a4SXJnfgCWkxLDtQVOsvOkkM6DMwr4eeJmcsLkIbla
	 tFOLp6MI1dGEarQ1UWVNGxSmS5j9DiPQvF3Z2B5bMAvaBeAlX/ratPYBlYOSboESNh
	 8s8jG8Vbb4xJit4EeuJc9swz1jYl0iO1FE0o8571X5590mWSM2BjcIDKTyzOWA65u6
	 bDZ0bkdq2TV9w==
Date: Tue, 29 Apr 2025 09:32:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, david@redhat.com, harry.yoo@oracle.com,
	riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
Subject: Re: [PATCH 3/3] mm/numa: remove unnecessary local variable in
 alloc_node_data()
Message-ID: <aBByeY7ck9H4YOaE@kernel.org>
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-4-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427100442.958352-4-ye.liu@linux.dev>

On Sun, Apr 27, 2025 at 06:04:42PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The temporary local variable 'nd' is redundant. Directly assign the
> virtual address to node_data[nid] to simplify the code.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/numa.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/numa.c b/mm/numa.c
> index f1787d7713a6..7d5e06fe5bd4 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
> @@ -13,7 +13,6 @@ void __init alloc_node_data(int nid)
>  {
>  	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
>  	u64 nd_pa;
> -	void *nd;
>  	int tnid;
>  
>  	/* Allocate node data.  Try node-local memory and then any node. */
> @@ -21,7 +20,6 @@ void __init alloc_node_data(int nid)
>  	if (!nd_pa)
>  		panic("Cannot allocate %zu bytes for node %d data\n",
>  		      nd_size, nid);
> -	nd = __va(nd_pa);
>  
>  	/* report and initialize */
>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> @@ -30,7 +28,7 @@ void __init alloc_node_data(int nid)
>  	if (tnid != nid)
>  		pr_info("    NODE_DATA(%d) on node %d\n", nid, tnid);
>  
> -	node_data[nid] = nd;
> +	node_data[nid] = __va(nd_pa);
>  	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
>  }
>  
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
