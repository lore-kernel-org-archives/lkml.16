Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB64189BB0;
	Thu, 12 Jun 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716759; cv=none; b=hkTLBKw4LuTR6EnR9jDuwwtW7YS1VG/Fi+Ma6cBmdG6LV9bqvNtTqa4HAl1H58xm4Xgv/DSbcWFz7dqNNow8wrvh6h0LjKt5HITAo/ip3PBslGEnTMchrAc/z2BkRLjL9zqERIUUFkpufXYz4xNmEpo3HWF9aTT4c35AYIhMQvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716759; c=relaxed/simple;
	bh=q0+fYfF97FI9aDDTnIU+4LmdN8vqnGfbcenWAJ4Aa74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7sJJ1f7HJEUJbgJvTLmLWZs4TQE/75AHxrF766U1d9HonYY+2ynRhU5m/KozkNnFN5VNDUOZN5LqXs79UKWuesHIFEsh3D1w3/f8T0jFYKwfIhZrRVm03q94zy+kXtFh53ZMFq6Qs/WHLB3Irzd8uJSAB8VdBWFr6swjfX20Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C3F4339;
	Thu, 12 Jun 2025 01:25:37 -0700 (PDT)
Received: from [10.1.32.165] (e134369.arm.com [10.1.32.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6393F59E;
	Thu, 12 Jun 2025 01:25:55 -0700 (PDT)
Message-ID: <4383f1ad-2782-4cd9-b21e-55d3a1500e65@arm.com>
Date: Thu, 12 Jun 2025 09:25:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
To: Chen-Yu Tsai <wens@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250607135029.2085140-1-wens@kernel.org>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250607135029.2085140-1-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen-Yu,

thanks for your research on this!

On 07/06/2025 14:50, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The MBUS serves as the main data bus for various DMA masters in the
> system. If its clock is not enabled, the DMA operations will stall,
> leading to the peripherals stalling or timing out. This has been
> observed as USB or MMC hosts timing out waiting for transactions
> when the clock is automatically disabled by the CCF due to it not
> being used.
> 
> Mark the clock as critical so that it never gets disabled.

Yes, we do this for all the other SoCs, and I somehow missed that for 
the A523.
I am still scratching my head how this worked for me, though, but the 
patch is pretty surely correct:

> Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> index 9efb9fd24b42..1a9a1cb869e2 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -385,7 +385,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
>   					    0, 0,		/* no P */
>   					    24, 3,	/* mux */
>   					    BIT(31),	/* gate */
> -					    0, CCU_FEATURE_UPDATE_BIT);
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);
>   
>   static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
>   

