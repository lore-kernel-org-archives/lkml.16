Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123F12F3B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743202211; cv=none; b=tESVc6w7nUcRYquKj36+EgLCzf/6xmmNn3s03lEcWrIzxsJQ7T/4YIhu16gBYTQMbcpEFqlYpTfvG/e5aqQT5ew3zMgT8T2TpRb/yaQswtfy2yB3yrdvsEKSdI8pZXjPigjepdsaWa/51ZB78YV4z3rS1VlzxoLI02hTKrFcIHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743202211; c=relaxed/simple;
	bh=pIhGQE/1P2w/Z6ls3ujHTWGCRkN+4MM0yocX26uPY40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAJ7uyx4g9Pnk+qy+dP8kFNO55JGcNHVzl5/5IEOXeR3d/CbWXij0/8hcEnsaMuhPQUuh2gHr97eSR4SSAVucg9dwVjEIHchiX0WggfQ70bOABiv9OguDDroOMTpeaF/eoRFpqWYMD7YnaO8WDHnjjqyzwHCzBm0Qbx2wpSFrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJ3f5Km6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJ3f5Km6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C00BC4CEE5;
	Fri, 28 Mar 2025 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743202210;
	bh=pIhGQE/1P2w/Z6ls3ujHTWGCRkN+4MM0yocX26uPY40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ3f5Km6mArkj8v01eNpCYx7SZ40tboCBXWtdtmqATSFapWM1xgUuCuACHaSmbHrs
	 lD+Ix4vvP0uZAW/7qXQM2aK4fFMJDX0pYiqxyYTNeIWLJfxnvr3WFi806A3XtkWIEr
	 oFdnRYIRlphqA5hM5W6nFw3/eO+eak625GqZ/etC7BFxtPIOtTpSYTwxw4MR0KSJxI
	 b1i8Y2bvPUQKBhleqQWokXdfbePYoU2qW4J9DuA/gebeqg5CJ9WMkTDJB6Zxqr+aP1
	 /1xgWGriqqsBNYs6/fLHFoZD9Pn7Vg6CrjCChlMgfWhv3CEYjN7+p+nCB5rj8pqcwh
	 RKerLvIYlyO6w==
Date: Sat, 29 Mar 2025 01:50:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
	steven.price@arm.com, suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
	ryan.roberts@arm.com, urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-cnmklGUojMzsUF@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328062103.79462-1-dev.jain@arm.com>

On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,

                                                     for vmalloc mappings ^

arm64 does not allow changing permissions to any VA address right now.

> which does not support changing permissions for leaf mappings. This function
> will change permissions until it encounters a leaf mapping, and will bail
> out. To avoid this partial change, explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..8337c88eec69 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that

I'd keep mention of page mappings in the comment, e.g

	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
	* mappings are updated and splitting is never needed.

With this and changelog updates Ryan asked for

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>


>  	 * splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
