Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB2535950;
	Fri, 20 Jun 2025 01:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382872; cv=none; b=RPgKAdkRBYQJLDQ48llv3EcbYgg2BBoZs7KkhJfsoLL3DmAMSxLHu1O2tdPBSi2c1mKgCUe/dkwLusO89WmJrfJjb15Z3uzrGAVkyaqS9zgDoaCHDV88A0ErsASXTJX78rOP652j7V2I/XkJ5y7bVjHDY8u+UwyTaMbbtDXkf8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382872; c=relaxed/simple;
	bh=Zd92iYIzE2QZV6mmjP9DmFBsZ0UtcOy6Na1HkdFSCpM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3bAFVfbF+el40SWNAte3vKbaE1vXjXvTUSPhXJmaAkQE+dBB1KLXIq0JHZgFqX/v9luJhDCBOaOVsLK/QFMSHWkECXNk7s5xLILUSDdwSGk+YAe2U7pKHqAy8zAYZtx5+BpO6EjRyBqMIU4GgfU2jjrRzcqdk50mO1jZ49K77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7AB9113E;
	Thu, 19 Jun 2025 18:27:29 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92CF33F673;
	Thu, 19 Jun 2025 18:27:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:26:30 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0
 reset
Message-ID: <20250620022548.2f589c26@minigeek.lan>
In-Reply-To: <20250619171025.3359384-3-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
	<20250619171025.3359384-3-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:10:25 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
> 
> Add a reset entry for it at the end of the existing ones.

Right, just this one bit is not mentioned in the manuals (both A523 and
T527), even though the PPU1 reset bit and the PPU0 clock gate bit are,
so it's clearly a manual bug. I can also confirm that both bit 16 and 17
(and none above that) are writable, and both bit 16 (reset) and bit 0
(clock gate) are required to access the PCK-600 PPU (as per: sunxi-fel
readl 0x7060fc8).
 
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for spotting this!

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> index b5464d8083c8..70ce0ca0cb7d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -204,6 +204,7 @@ static struct ccu_reset_map sun55i_a523_r_ccu_resets[] = {
>  	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
>  	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
>  	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
> +	[RST_BUS_R_PPU0]	= { 0x1ac, BIT(16) },
>  };
>  
>  static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc = {

