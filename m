Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB7215F6E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046738; cv=none; b=ax5FyzMsqTFTjH9VAVC+d3Fc9oDAteNXiq/3PDw5D/E9b6Kd0Avthg+DHICanHQdm4su088RamgfWr5g7myarpyTL1xjOgzK72InE3/yP14o9XvolVqx1ZcEuqnLM+6jLtF2RYdUtRvjDxMpQ4vgjjVmsPbCoTn8bpS4ahbmCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046738; c=relaxed/simple;
	bh=FVsYEchzozklcuQuYPYkgMCg7eT9xxMJKPxvoI3GI60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0M/9U7Fm5QuyaCjBXjhphaytAVNFNmh6+M+fa3vBA05aK6uN9KE9FWtuFqeWu6GSt34TDUaCxo5pxQ0KO9HTrsmOPFN+aa1vEYgby1E/lAE+2PSGynYiUEu4ih/3PyRHRVe8cJ8A9pbOP/TNHVRSCKqH2x50xvVdO4cglJjVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oFbmJpme; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oFbmJpme"
Message-ID: <874b566f-8e19-4af8-bb6b-e0e5eff7b5f5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744046734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHM7lHGP8muDGkPak7XcuoIV5Sq2eECb4HN6J4ncuwY=;
	b=oFbmJpme/vhWb25/PtxCTNlmlE6Hk9GVpsnEPaiQJLu8+l+zEXJJylVSYilpIDBtgvKrJL
	zqA5IYo0qDxuil41M7QAZv6h0NLWQVwBZEPcTJPyktDGGmv2QAVAAY5/ncNBe+XlGQ6YHO
	OANqbYgjV/bFKBPaC9OlMrhqhjy8dUQ=
Date: Mon, 7 Apr 2025 22:54:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 05/18] phy: cdns-dphy: Remove leftover code
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
 <20250402-cdns-dsi-impro-v2-5-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-5-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Tomi,

Thank you for the patches!

On 02/04/25 19:00, Tomi Valkeinen wrote:
> The code in cdns-dphy has probably been part of a DSI driver in the
> past. Remove DSI defines and variables which are not used or do not
> actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
> cdns_get_dphy_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/phy/cadence/cdns-dphy.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
> index f79ec4fab409..7f8b70ec10c5 100644
> --- a/drivers/phy/cadence/cdns-dphy.c
> +++ b/drivers/phy/cadence/cdns-dphy.c
> @@ -55,14 +55,6 @@
>  #define DPHY_PSM_CFG_FROM_REG		BIT(0)
>  #define DPHY_PSM_CLK_DIV(x)		((x) << 1)
>  
> -#define DSI_HBP_FRAME_OVERHEAD		12
> -#define DSI_HSA_FRAME_OVERHEAD		14
> -#define DSI_HFP_FRAME_OVERHEAD		6
> -#define DSI_HSS_VSS_VSE_FRAME_OVERHEAD	4
> -#define DSI_BLANKING_FRAME_OVERHEAD	6
> -#define DSI_NULL_FRAME_OVERHEAD		6
> -#define DSI_EOT_PKT_SIZE		4
> -
>  #define DPHY_TX_J721E_WIZ_PLL_CTRL	0xF04
>  #define DPHY_TX_J721E_WIZ_STATUS	0xF08
>  #define DPHY_TX_J721E_WIZ_RST_CTRL	0xF0C
> @@ -117,10 +109,9 @@ static const unsigned int tx_bands[] = {
>  	870, 950, 1000, 1200, 1400, 1600, 1800, 2000, 2200, 2500
>  };
>  
> -static int cdns_dsi_get_dphy_pll_cfg(struct cdns_dphy *dphy,
> -				     struct cdns_dphy_cfg *cfg,
> -				     struct phy_configure_opts_mipi_dphy *opts,
> -				     unsigned int *dsi_hfp_ext)
> +static int cdns_get_dphy_pll_cfg(struct cdns_dphy *dphy,

nit: cdns_dphy_get_pll_cfg seems more appropriate. We even have a
cdns_dphy_set_pll_cfg.

> +				 struct cdns_dphy_cfg *cfg,
> +				 struct phy_configure_opts_mipi_dphy *opts)
>  {
>  	unsigned long pll_ref_hz = clk_get_rate(dphy->pll_ref_clk);
>  	u64 dlane_bps;
> @@ -289,15 +280,13 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
>  				      struct cdns_dphy_cfg *cfg)
>  {
>  	struct cdns_dphy *dphy = phy_get_drvdata(phy);
> -	unsigned int dsi_hfp_ext = 0;
>  	int ret;
>  
>  	ret = phy_mipi_dphy_config_validate(opts);
>  	if (ret)
>  		return ret;
>  
> -	ret = cdns_dsi_get_dphy_pll_cfg(dphy, cfg,
> -					opts, &dsi_hfp_ext);
> +	ret = cdns_get_dphy_pll_cfg(dphy, cfg, opts);
>  	if (ret)
>  		return ret;
>  
> 

Apart from the small comment above,

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

