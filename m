Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F97252288
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638594; cv=none; b=eZ+/EgSReffkNLdyP1OIz+ZrwTINGBOsp+tA+JN5Pkz/+p9pYLaySk0ryGV9BTMWcbjgV/IcBIlzoXO4xynLnccYO/N8kgGXSmbwUQoL9TXlBWddFPGbhFUwBIrWrt9k3FV3vySHnMqmFIiaZuByjLoI0CUoHBWmkyHzNJdcHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638594; c=relaxed/simple;
	bh=zVAXMbiliQoKMwfqMTirGNwxtHFwB03efGSbTMkE0Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwBmx7jO/4P0QDIt2XZ1bHbotlJSrLC44pK82JcyXYzQkTcxGZjm8/MlLH3MpImFbM12i1+FhjCeufeGScUunB9o/BziuxnV1eTqAxkOi72tpNd4kwGzHdpYAHnVyqOAQESrsBcUOAASyugP39skY14hLOgWzrHpN6+A7NndDlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B4C4CEE2;
	Mon, 14 Apr 2025 13:49:52 +0000 (UTC)
Date: Mon, 14 Apr 2025 14:49:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ross.sweng@gmail.com, Mike Rapoport <rppt@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] arm[64]/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z_0SfqQHsKs3S1cn@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414133219.107455-1-ross.stutterheim@garmin.com>

Please cc the maintainers and the original contributor of the commit you
are fixing, otherwise the patch may not be noticed.

On Mon, Apr 14, 2025 at 08:32:19AM -0500, Ross Stutterheim wrote:
> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address, not a
> pfn.
> 
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
> 
> Fix this by removing the address to pfn translation and pass the
> address directly.
> 
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> ---
>  arch/arm/mm/ioremap.c   | 4 +---
>  arch/arm64/mm/ioremap.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
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

This indeed needs fixing.

> diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
> index 10e246f11271..48c38c986b95 100644
> --- a/arch/arm64/mm/ioremap.c
> +++ b/arch/arm64/mm/ioremap.c
> @@ -51,7 +51,5 @@ void __init early_ioremap_init(void)
>  bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  				 unsigned long flags)
>  {
> -	unsigned long pfn = PHYS_PFN(offset);
> -
> -	return pfn_is_map_memory(pfn);
> +	return pfn_is_map_memory(offset);

This is already correct.

-- 
Catalin
