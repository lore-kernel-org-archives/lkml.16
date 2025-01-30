Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED81509BF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216638; cv=none; b=OxapaduUVUTIMZr2vL6UsErgRdoRGfseBO6sK5iBMW9tonCTj0YRYU1kBcCP1oq8POp2aYwBWUhnwyE3EGvJ52TYTTzY2UVspgZWsRKIIbyb5FnGlyNOHWpRxOMSmC8Av3kK+tib6+Q5BpgecDiSVCqWD3VRFrk5PR46wARSUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216638; c=relaxed/simple;
	bh=X24abUTAXgnJswQt6X0FZ/AXysH3Yn5qu50j+vpQ5ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCsMHVsl8AiztvLpOhsVcELBBNRpHQhPuS8VK00Ih13pf9ZAn7IXuWRKfO/dccI449gU7Zj0+6xeQEYQ+JoeR0Oa7bxu+G2Q50ofJvpJjctEIK6Md0ITmPFCBovUx77IJSBl6b5WHJ8uQw+9Ca0DmEvl78dAVNHrimdNO8PnU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XColdkuq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XColdkuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934ADC4CED2;
	Thu, 30 Jan 2025 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738216638;
	bh=X24abUTAXgnJswQt6X0FZ/AXysH3Yn5qu50j+vpQ5ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XColdkuq70vFUPrtL8XBLp63hdV3wQvuWauVI4Q0yd6laj8xR6A9H5DkHEPYEb8FL
	 Pcb5At1PLJ62NSqaUzn3ChTCFdypcHF+lSVywHGYz9bMFUGqC8J8kY1hb5+ImaqUb6
	 KLZzecYOE/dx70u2lAFJm5vyvgQKjvaS/RxzwZHaC/PvR2XdKwdBS1wa8KjRJFTBW0
	 bh+yZ/wofDtYsEz9KfVJIYQuCAVLuOxYtgOnmtnaadts1A+7F4zgGNMRJ+uvTpNbp9
	 htgWVAlJu5nfgv1/dvz4ojg2PihPtDa1GAjwVc3ZFn1Dnzg7y6PqohU9E5ZyPl6Ri7
	 CDOW5i8v+Q8OQ==
Date: Thu, 30 Jan 2025 11:27:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
Message-ID: <Z5sUusWDCfFFeh0f@vaman>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <20250106100001.1344418-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106100001.1344418-2-amadeus@jmu.edu.cn>

On 06-01-25, 18:00, Chukun Pan wrote:
> The device tree of RK3568 did not specify reset-names before.
> So add fallback to old behaviour to be compatible with old DT.
> 
> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a1532ef8bbe9..8c3ce57f8915 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>  
>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>  
> -	priv->phy_rst = devm_reset_control_get(dev, "phy");
> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
> +	/* fallback to old behaviour */
> +	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> +		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);

That is not *same* behaviour on fallback, why _exclusive() for the
fallback?

>  	if (IS_ERR(priv->phy_rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>  
> -- 
> 2.25.1

-- 
~Vinod
