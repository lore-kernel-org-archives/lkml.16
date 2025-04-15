Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6212DFA51;
	Tue, 15 Apr 2025 04:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690718; cv=none; b=YQ9TuIwSUJIiTBLOK8TbtrQZmTJg4EFoEe1Si5LzPS1ZXDLzleCfl3px9vALVpzIhwtyk4O/4FduXuz45F4XMUHzLuQHvkk8+TfOFzmCKVAFGr72k9jm8wcaK+vi5W/d1MmIWCoOesK+hIXGALLTlJdd9KihhhZ2c+XbAvT+gFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690718; c=relaxed/simple;
	bh=TDeHh2JSFt6MEQZxnJI2IRXRZvejReOK447qRDNW6iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtPBGEqodO/FbkUKmd0TK4yjLIwbfSwPYQxyr8sHTFDMllPpldUN69cOfq8hT4aE4NSvt1oRES2xmAF4VOIKlVU50LDMVlrJuwOIyJrrCStGDae+N2okMqRxB1varRgPK+FCRMm1W9HGr3++ND9jpYK1i9DQtcL7jnoS97pvljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=wjs57W1t; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=myfhKdLa; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="wjs57W1t";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="myfhKdLa"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 3C72912FB450;
	Mon, 14 Apr 2025 21:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744690708; bh=TDeHh2JSFt6MEQZxnJI2IRXRZvejReOK447qRDNW6iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wjs57W1tjaXVmsESwCjIK8NREbtHC/9TrdkRIbwE4mH79A8bdAsVzli1zBNdXkyE5
	 Ta4R7pWX3tLHk7QRaTkJNhLGx0Qt/FXWROpk/R8LhIK4q4QNkl6ry9khuvbDv6Kcjf
	 uzBUxghvQx458VKMexNT1JmO4UPbskk1V6r/xrWZ3sOKgEm/8JD/6b4IvawIgHJgpf
	 NgqWvGlhSRBG4QrOtTA3N6JDrnJ08Ktdevx8lXAAmtRWf9//d+8Y3w0P+ow2G5kXWd
	 o15WDmOXHsAmt4Wn/amsVxJutdtdnl32FYrwlvfm4G//tZnsWg7eZibXC/rhStL1mH
	 C1WF1c+vsMt4g==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7BIZzpgvdqr; Mon, 14 Apr 2025 21:18:23 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7475512FB435;
	Mon, 14 Apr 2025 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744690703; bh=TDeHh2JSFt6MEQZxnJI2IRXRZvejReOK447qRDNW6iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myfhKdLaoMsUau7EDgnyILiXRboxXeqVE6R3kjSTbGRL3L8TRaga3togeTnOtrySp
	 YcZqRmwST0ku7jtqnrjGVW+VnvnUz+3t8fHXPypkxTIs/pFDakD0g0UG8YuvGMbw2J
	 AxsSBxTTA7eERGNKB3zlxBTNq7g1G/xLt4yWsvwtBIFE3w1gl2J0TzY5ky1HSntTNn
	 uHTRpSQamGepVW2zKtbaGV8X8BDPlkPa4hrwhHjT0cgVGMD+Pha6vS+tJG7VxTkX8+
	 9BgiNdmTV8Wxmrwwn7X4Rs7+HorIyI61doDKOEuEoOOwl+WqO1AZJpxow1qiXfk2RY
	 hEe2BfmlTiYVg==
Date: Tue, 15 Apr 2025 04:18:16 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, guodong@riscstar.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] clk: spacemit: rename spacemit_ccu_data fields
Message-ID: <Z_3eCDmh_vnkpcFC@ketchup>
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414191715.2264758-3-elder@riscstar.com>

On Mon, Apr 14, 2025 at 02:17:09PM -0500, Alex Elder wrote:
> Add "clk_" to the names of the fields in the spacemit_ccu_data structure
> type.  This prepares it for the addition of two similar fields dedicated
> to resets.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Haylen Chu <heylenay@4d2.org>

> ---
>  drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index a55957806db31..4db91c1b1d280 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -130,8 +130,8 @@
>  #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>  
>  struct spacemit_ccu_data {
> -	struct clk_hw **hws;
> -	size_t num;
> +	struct clk_hw **clk_hws;
> +	size_t clk_num;
>  };
>  
>  /* APBS clocks start, APBS region contains and only contains all PLL clocks */
> @@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_pll_data = {
> -	.hws	= k1_ccu_pll_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
> +	.clk_hws	= k1_ccu_pll_hws,
> +	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_mpmu_hws[] = {
> @@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.hws	= k1_ccu_mpmu_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
> +	.clk_hws	= k1_ccu_mpmu_hws,
> +	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_apbc_hws[] = {
> @@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.hws	= k1_ccu_apbc_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
> +	.clk_hws	= k1_ccu_apbc_hws,
> +	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
>  };
>  
>  static struct clk_hw *k1_ccu_apmu_hws[] = {
> @@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>  };
>  
>  static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.hws	= k1_ccu_apmu_hws,
> -	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
> +	.clk_hws	= k1_ccu_apmu_hws,
> +	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
>  
>  static int spacemit_ccu_register(struct device *dev,
> @@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
>  	struct clk_hw_onecell_data *clk_data;
>  	int i, ret;
>  
> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
>  				GFP_KERNEL);
>  	if (!clk_data)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < data->num; i++) {
> -		struct clk_hw *hw = data->hws[i];
> +	for (i = 0; i < data->clk_num; i++) {
> +		struct clk_hw *hw = data->clk_hws[i];
>  		struct ccu_common *common;
>  		const char *name;
>  
> @@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
>  		clk_data->hws[i] = hw;
>  	}
>  
> -	clk_data->num = data->num;
> +	clk_data->num = data->clk_num;
>  
>  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>  	if (ret)
> -- 
> 2.45.2
> 
