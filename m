Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BC2356C3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798185; cv=none; b=XOuQ6z6ceNP1266ZTHMg2zT4WGw6lJGL1xto4V+jcdBBwwe3qZD/X1WEtIoudDXw0jAd8xwUskuqMotgYxcbA/fGMiS9ld1spaECOTgcL8UziBATF9QHd2PdkDfrozgVPLi1SGCPZda+N4Rcb7Zv8FOUN+njTL4ZU6ZSilSYI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798185; c=relaxed/simple;
	bh=7F3RTIY0HnFFVdJogRDV6fzFIiE9f8lOEJ5iXhX4fnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBRg/I658FgNOxIFxK8hojuXLDnl9iSuZOrSgUJ30hbzfH8hy09b1g9hPSaTGYtNleA6TacN1hd0nDD3cEddBUUW0zSdyhfg1ndmlw4Imy7b+XJCb6f74htht3rRZhtFLS07Iz+flbNVjN/QOsOZtv+tTQL29W1/oR0dZjCoUaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9D0C4CEE2;
	Wed, 16 Apr 2025 10:09:43 +0000 (UTC)
Date: Wed, 16 Apr 2025 11:09:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Mike Rapoport <rppt@linux.ibm.com>, ross.sweng@gmail.com,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z_-B5fAhZzShX34I@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414142140.131756-1-ross.stutterheim@garmin.com>

On Mon, Apr 14, 2025 at 09:21:40AM -0500, Ross Stutterheim wrote:
> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address for arm,
> not a pfn.
> 
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
> 
> Fix this by removing the address to pfn translation and pass the
> address directly.
> 
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>

I think you could also add:

Cc: <stable@vger.kernel.org>

> ---
>  arch/arm/mm/ioremap.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
> index 748698e91a4b..27e64f782cb3 100644
> --- a/arch/arm/mm/ioremap.c
> +++ b/arch/arm/mm/ioremap.c
> @@ -515,7 +515,5 @@ void __init early_ioremap_init(void)
>  bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  				 unsigned long flags)
>  {
> -	unsigned long pfn = PHYS_PFN(offset);
> -
> -	return memblock_is_map_memory(pfn);
> +	return memblock_is_map_memory(offset);
>  }

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Not sure how Russell picks patches up these days (I used to send them to
the patch system -
https://www.arm.linux.org.uk/developer/patches/info.php).

It might be simpler with git send-email (that's the alias I had):

  git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"

-- 
Catalin
