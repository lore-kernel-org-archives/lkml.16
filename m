Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A5231A24;
	Tue,  1 Jul 2025 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367715; cv=none; b=AaAaL8H5KPS178TG1ouIm6ZrDssQt6y4GwQBYvW9M0oTgQ4pIIEwzVmr+xp6hGcBpaQdny7IQLBG/2f7/m2/WGO/4/+csxhofKtIe3JXIDDGlUivr7pIU7x5rlfmZ5sj9miFJXPgmRToLZY8aG413Z2P6X9LP9JEGyQ9s6M5j3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367715; c=relaxed/simple;
	bh=x+/jfhbvrQZRQ7RfI+BdPxv9r5V+E7gboa1JLBgD3lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHLNR7qee+WM0+GAbYeAVgBBX+mmpFMk9a8OXtaclFV1sRe6j5yJMCY94DuvuoTK1DdZMezGb6hHi+5gEl7cN+yrZQlQvI7bFh9EeBNoCl4WhUIYNl8i5ub4/oc84WOVlcO+rG/eBCSirMAKWTChoxvFEa6zVPMlI3Nk/8YFEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqm81N8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqm81N8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B1EC4CEEE;
	Tue,  1 Jul 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751367715;
	bh=x+/jfhbvrQZRQ7RfI+BdPxv9r5V+E7gboa1JLBgD3lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqm81N8lvDX7N/u3xjG7hXMTvGqO54jyHyE2S26wmNaQflgz/pCQwdOLBaUoGESOT
	 UDXcnu+0St+FBVUhbE1ZXYHxCq1/aaIDgs25i4S+Nc3HZmf5pEw4B6Wlce9mnI6v5d
	 PHyKnIjNkUQ5a7JeexhNEKCoCAqOTReLXzznchKJsbh0ArjuB6dDOeklRvElOW7AFX
	 galPphzb0O/qlHWhDUhq0t4Wjf6tkO23p2hh+XiRWqq2tDgHMkURWqVv9jU4GPAXV9
	 JsMhrCDq9SWqebzlQ0d1d2As2JL+n19bD8ySqDEg8+KiH8KsqIkmfFm1TMKyCdw7m1
	 ifQtrqKbZYV6A==
Date: Tue, 1 Jul 2025 12:01:50 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt
 line is available
Message-ID: <20250701110150.GJ10134@google.com>
References: <20250630135249.3961621-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630135249.3961621-1-wens@kernel.org>

On Mon, 30 Jun 2025, Chen-Yu Tsai wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Originally an explicit ID for the AXP313/AXP323 regulator was set to
> avoid a conflict with the primary AXP717 PMIC on Allwinner A523 family
> boards.
> 
> This didn't entirely work since on some or all of these boards, the
> interrupt line on this secondary PMIC was left unconnected, and thus
> the driver would fall back to the generic "no interrupt; only regulators"
> case, which didn't have the explicit ID set, thus undoing the intended
> fix.
> 
> Explicitly exclude the PEK cell in the no IRQ case for the
> AXP313/AXP323, instead of using the generic fallback.
> 
> Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> The other option would be to move the explicit ID to the generic
> fallback case instead. This is really only visible in sysfs and the
> kernel logs, so probably not that important.
> ---
>  drivers/mfd/axp20x.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 25c639b348cd..8877482a95a1 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1055,6 +1055,7 @@ static const struct mfd_cell axp152_cells[] = {
>  static struct mfd_cell axp313a_cells[] = {
>  	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
>  	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
> +	/* Keep PEK as last entry for exclusion in no-irq cases */
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
>  
> @@ -1306,12 +1307,18 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->irq_flags = IRQF_TRIGGER_LOW;
>  		break;
>  	case AXP313A_ID:
> +		/* Exclude PEK if no IRQ is available */
> +		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;

This is too fragile.  Please fine another way to achieve your goal.

> +		cells_no_irq = axp313a_cells;
>  		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
>  		axp20x->cells = axp313a_cells;
>  		axp20x->regmap_cfg = &axp313a_regmap_config;
>  		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
>  		break;
>  	case AXP323_ID:
> +		/* Exclude PEK if no IRQ is available */
> +		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
> +		cells_no_irq = axp313a_cells;
>  		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
>  		axp20x->cells = axp313a_cells;
>  		axp20x->regmap_cfg = &axp323_regmap_config;
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]
