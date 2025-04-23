Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5980B191F6D;
	Wed, 23 Apr 2025 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439810; cv=none; b=jFvxIBoBJ23DHamsYGDhAeq2yjwKoaHpZE5WZoOiPeUEAjTCEXddfEAUh8nJ1/wCD1OBzwYzjKO0Yi9BegfuKWiQqGrwS5yBkqZZN1GW/I4hOz3B5+wSZBs/paG12kEb0TK8v6sPPRmHcNQFj8H3t0AWX0U5KWvSb9eY5Jwp9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439810; c=relaxed/simple;
	bh=2xy5f8GYxsUlqbYSP/km4q6c6Yl2NXnT5erRgySRqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhoMnH4s0vg3n2CZLnLFiLhLO/1bQXcGfQTL6GSq48qHr/pqKfcsCivoZbgPNIuQRFVVih0/lA1QrJeOZiQ7dLLEFacQ8UjrLL3l+x15ye9mU6GMkF+7BGKr5qPttU5BlgPDX5pO4G7STDWVLoxO24BNdyM+Azpqfb1xp0wZE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG0dgRVL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG0dgRVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A379FC4CEE2;
	Wed, 23 Apr 2025 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745439807;
	bh=2xy5f8GYxsUlqbYSP/km4q6c6Yl2NXnT5erRgySRqZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG0dgRVLwlDgdHJMYZpT5sve3BVuSnGdZ85VR45mSFiIg7+MPHQBJJKLlPVvt/tle
	 RWNKP76e8sRmFYVpzOk8exTQoXaZvIJI0tjacXp+ibZ/RXix433kTz5Z8gb+kDztVm
	 iYhnNP55bqsw34wCDRZPHGwIYO9DTAuh7TGIWhI7uf+LdqWKmlYuSGCUty6pY8Ku6f
	 kprr+efhThbotBlCyfcbGNWf8dMtt2uLMMvOQDCkR4qqJF7VXdtQKm0TX1n2FPwx2q
	 zbTDjP8aq/Cq3tPVA3uanbQxpNvCRES0S5XHyejIiKMwXht8mSWzyrDdhu7Qr551nn
	 aWhvna8rStb3A==
Date: Wed, 23 Apr 2025 15:23:26 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Szczepanek <bsz@amazon.de>
Cc: Saravana Kannan <saravanak@google.com>, nh-open-source@amazon.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fdt: Extend warnings on error paths
Message-ID: <20250423202326.GA1025526-robh@kernel.org>
References: <20250423091018.51831-1-bsz@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423091018.51831-1-bsz@amazon.de>

On Wed, Apr 23, 2025 at 09:10:17AM +0000, Bartosz Szczepanek wrote:
> Print out adress and size if elfcorehdr is overlapped. Be more verbose
> about what went wrong in case early_init_dt_verify fails. Other than
> improving logging, no functional change is intended in this commit.
> 
> Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
> ---
>  drivers/of/fdt.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index aedd0e2dcd89..c9b5e056b713 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -469,21 +469,22 @@ static u32 of_fdt_crc32;
>   * described in the device tree. This region contains all the
>   * information about primary kernel's core image and is used by a dump
>   * capture kernel to access the system memory on primary kernel.
>   */
>  static void __init fdt_reserve_elfcorehdr(void)
>  {
>  	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
>  		return;
>  
>  	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
> -		pr_warn("elfcorehdr is overlapped\n");
> +		pr_warn("elfcorehdr is overlapped (addr=0x%llx, size=%llu)\n",
> +			elfcorehdr_addr, elfcorehdr_size);
>  		return;
>  	}
>  
>  	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  
>  	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
>  		elfcorehdr_size >> 10, elfcorehdr_addr);
>  }
>  
>  /**
> @@ -1128,26 +1129,33 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>  	memblock_add(base, size);
>  }
>  
>  static void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>  {
>  	return memblock_alloc_or_panic(size, align);
>  }
>  
>  bool __init early_init_dt_verify(void *dt_virt, phys_addr_t dt_phys)
>  {
> -	if (!dt_virt)
> +	int rc;
> +
> +	if (!dt_virt) {
> +		pr_warn("FDT wasn't correctly mapped");

You need a '\n' here. Technically, it doesn't, but IIRC it won't get 
flushed out immediately without. Of course, this runs too early to see 
the message typically.

It's possible some arch has a fallback if this function fails and 
doesn't want the warning, but we can apply and see.

>  		return false;
> +	}
>  
>  	/* check device tree validity */
> -	if (fdt_check_header(dt_virt))
> +	rc = fdt_check_header(dt_virt);
> +	if (rc) {
> +		pr_warn("FDT header is invalid: status=%d", rc);
>  		return false;
> +	}
>  
>  	/* Setup flat device-tree pointer */
>  	initial_boot_params = dt_virt;
>  	initial_boot_params_pa = dt_phys;
>  	of_fdt_crc32 = crc32_be(~0, initial_boot_params,
>  				fdt_totalsize(initial_boot_params));
>  
>  	/* Initialize {size,address}-cells info */
>  	early_init_dt_scan_root();

Normal context is 3 lines. Please send patches that way.

Rob
