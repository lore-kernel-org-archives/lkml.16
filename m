Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E3A2BAF7;
	Wed, 23 Apr 2025 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405981; cv=none; b=dkMNK4QDhrtGDuhOd4b+hbCylkuZcmUxnW/EM6z50haC2RHAr1T/yUvSfk8cSAq6Q/7J8rsg1On00WVrU/JKMlHZN42G0QNSVKM9GG+DTF0wl7LGvilOFAwuTJIQXC4w8QaPdVjTiAzU7uSbFy374R4AYIDT7m5+feu1wwm/L7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405981; c=relaxed/simple;
	bh=DfkwY1BrnUlEiUXwYVr9dlLJB6/DDaxbV68j52lv+4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnOK3lWvmzWywIrUcwrtyL46HwwMuNDRf5MBzRLrT3rgJBQ3KrdIY7OtQB01cic47JxdE5fjneVtbK4SBFwjft/T9LB9SpOpJZOHRfOH8nrQ2W8+z5vHyzcbBLxz87WP7YIH02f6c8ydlvH9URJb6E9Ns/kXZBEQ3J+aPV0WzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C11EF1063;
	Wed, 23 Apr 2025 03:59:32 -0700 (PDT)
Received: from [10.57.74.63] (unknown [10.57.74.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C64E3F66E;
	Wed, 23 Apr 2025 03:59:36 -0700 (PDT)
Message-ID: <b1f19b31-3535-4bb5-bcef-6f17ad2a0ee6@arm.com>
Date: Wed, 23 Apr 2025 11:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: ARM_DMA350 should depend on ARM/ARM64
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <50dbaf4ce962fa7ed0208150ca987e3083da39ec.1745345400.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-22 7:11 pm, Geert Uytterhoeven wrote:
> The Arm DMA-350 controller is only present on Arm-based SoCs.

Do you know that for sure? I certainly don't. This is a licensable, 
self-contained DMA controller IP with no relationship whatsoever to any 
particular CPU ISA - our other system IP products have turned up in the 
wild paired with non-Arm CPUs, so I don't see any reason that DMA-350 
wouldn't either.

Would you propose making all the DesignWare drivers depend on ARC 
because those happen to come from the same company too? ;)

Thanks,
Robin.

>  Hence add
> dependencies on ARM and ARM64, to prevent asking the user about this
> driver when configuring a kernel for a non-Arm architecture.
> 
> Fixes: 5d099706449d54b4 ("dmaengine: Add Arm DMA-350 driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/dma/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 8109f73baf10fc3b..db87dd2a07f7606e 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -95,6 +95,7 @@ config APPLE_ADMAC
>   
>   config ARM_DMA350
>   	tristate "Arm DMA-350 support"
> +	depends on ARM || ARM64 || COMPILE_TEST
>   	select DMA_ENGINE
>   	select DMA_VIRTUAL_CHANNELS
>   	help

