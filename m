Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C791FE475
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 22:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738537089; cv=none; b=kfbId+M9BzY230yYnKjMjr5nPG3G+0KKE6GKfSCOeZyM9I7nXAjuNN33if5r3pKnvcvzN5pPsmMaNztu1kpWWr2ZaqaD6Bwf3NrvUo9HOR55nwHrZ79FcGp3M/0VBjpADCVy/8teDoq7gPIP1FXjir6NNRxD1vXCGr4ueXEfdy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738537089; c=relaxed/simple;
	bh=+mx1gFTM9g9PypsDriE99fuJEEYlW+4UnKTfCn75ajQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgSDTMB1gMD2aUu+uAfyRiDp3tMIRrVUgw5phcFFcRrBIdWe4Hxq4c8JEVGCTgS05zotmMoLTtN0V3szW4BU2g/hAJS1zu3fuG0KGraG8KNbyrplf7pBDb4FDOq3FjTzaUZK9CH3sE4jTfXZ0zZbvhM0T8QBsLv0tFDduMRG+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1teiuQ-000000004XM-0XXF;
	Sun, 02 Feb 2025 22:57:46 +0000
Date: Sun, 2 Feb 2025 22:57:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Will McVicker <willmcvicker@google.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Nishanth Menon <nm@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
Message-ID: <Z5_4Zh7vbB2ku5so@makrotopia.org>
References: <20250124191644.2309790-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>

On Fri, Jan 24, 2025 at 01:16:44PM -0600, Rob Herring (Arm) wrote:
> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Nishanth Menon <nm@ti.com>
> Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Texted-by: Daniel Golle <daniel@makrotopia.org>

This fix is required to un-break various Mediatek clock drivers as
device_node_to_regmap() is used all over the place there (in
reset.c, clk-gate.c, clk-cpumux.c, clk-mux.c) and commit
3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
has droped all those unneeded "syscon"s.

>  drivers/mfd/syscon.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 226915ca3c93..aa4a9940b569 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -159,6 +159,7 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  }
>  
>  static struct regmap *device_node_get_regmap(struct device_node *np,
> +					     bool create_regmap,
>  					     bool check_res)
>  {
>  	struct syscon *entry, *syscon = NULL;
> @@ -172,7 +173,7 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
>  		}
>  
>  	if (!syscon) {
> -		if (of_device_is_compatible(np, "syscon"))
> +		if (create_regmap)
>  			syscon = of_syscon_register(np, check_res);
>  		else
>  			syscon = ERR_PTR(-EINVAL);
> @@ -233,15 +234,37 @@ int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
>  }
>  EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
>  
> +/**
> + * device_node_to_regmap() - Get or create a regmap for specified device node
> + * @np: Device tree node
> + *
> + * Get a regmap for the specified device node. If there's not an existing
> + * regmap, then one is instantiated. This function should not be used if the
> + * device node has a custom regmap driver or has resources (clocks, resets) to
> + * be managed. Use syscon_node_to_regmap() instead for those cases.
> + *
> + * Return: regmap ptr on success, negative error code on failure.
> + */
>  struct regmap *device_node_to_regmap(struct device_node *np)
>  {
> -	return device_node_get_regmap(np, false);
> +	return device_node_get_regmap(np, true, false);
>  }
>  EXPORT_SYMBOL_GPL(device_node_to_regmap);
>  
> +/**
> + * syscon_node_to_regmap() - Get or create a regmap for specified syscon device node
> + * @np: Device tree node
> + *
> + * Get a regmap for the specified device node. If there's not an existing
> + * regmap, then one is instantiated if the node is a generic "syscon". This
> + * function is safe to use for a syscon registered with
> + * of_syscon_register_regmap().
> + *
> + * Return: regmap ptr on success, negative error code on failure.
> + */
>  struct regmap *syscon_node_to_regmap(struct device_node *np)
>  {
> -	return device_node_get_regmap(np, true);
> +	return device_node_get_regmap(np, of_device_is_compatible(np, "syscon"), true);
>  }
>  EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
>  
> -- 
> 2.45.2
> 
