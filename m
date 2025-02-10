Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F78256C99
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208842; cv=none; b=dAT7fNXWArldsQnZhwkWxzhil52sFDbNrUw4JpI4w87B1uvBVFz3A5vYZkaTAwi38tbpFSY1G2XdD5At3VzqJyDOvISZye4K18nmwL+jg7LarNDpHMyGseNZfL3h4tghziU0YEuwjfiHA851LtH5lNPK49ZBfIHagXoHO0Yp6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208842; c=relaxed/simple;
	bh=Dwz4xCakIkAuh4e1iV5qPtqFU/VlMOx4YqQ1IKXKAQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt9a9Iqpel60bmZk6h+yT6z8WE2qzqxEuEsk8fpwNsKR3Od9MydhPuWpo+6R7mEBG6pIRgCIcENeB+loANoUXC2B6ckM4x15m3GP9YBXC30UYTl4jhvWZ4TrHufGjgkJf8nSIlEKXpVBVTjk5GFFDnsY9VN8qx+MmCghlxilFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phEDPBmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phEDPBmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0377DC4CED1;
	Mon, 10 Feb 2025 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208842;
	bh=Dwz4xCakIkAuh4e1iV5qPtqFU/VlMOx4YqQ1IKXKAQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phEDPBmuq0dZLsodIoSpvEck6PCcnG4upanoXbIuwvJLbYu1v+hlJvSQU0WlHzB3z
	 yBwahYAMZGFEqnNVr+9h4PMaIkSNPSy9UfNSGDSSrrnAQz1XSFxwEVaYCO2KAohH0+
	 mP8cPTPOZxPkQcgnFMn17Tg3/eFeK/ma6bmUtGTJwCELQ8cJ3AsxLivC4LwFrfiY2y
	 KzUcpeBEr2+Osy2xeE+XoThqEp7AIlTjC3DHcMcvB/qE7rlV/yaXj8GRsem09kucIH
	 3i75EruPXQe12eDUwgTyF+7iy+GjGfkGezV8X7mH2F3bV//dXWX295PwrNwdiFdOTT
	 h9EiOKmnGnvAA==
Date: Mon, 10 Feb 2025 17:33:58 +0000
From: Lee Jones <lee@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: lkundrak@v3.sk, linux-kernel@vger.kernel.org, zijie98@gmail.com
Subject: Re: [PATCH] mfd: ene-kb3930: Fix potential NULL pointer dereference
Message-ID: <20250210173358.GI1868108@google.com>
References: <20250120190720.322926-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120190720.322926-1-chenyuan0y@gmail.com>

On Mon, 20 Jan 2025, Chenyuan Yang wrote:

> The off_gpios could be NULL. Add missing check in the kb3930_probe().
> This is similar to the issue fixed in commit
> b1ba8bcb2d1ffce11b308ce166c9cc28d989e3b9 ("backlight: hx8357:Fix potential NULL pointer dereference").
> 
> Fixes: ede6b2d1dfc0 ("mfd: ene-kb3930: Add driver for ENE KB3930 Embedded Controller")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/mfd/ene-kb3930.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
> index fa0ad2f14a39..60824d847bf0 100644
> --- a/drivers/mfd/ene-kb3930.c
> +++ b/drivers/mfd/ene-kb3930.c
> @@ -162,6 +162,8 @@ static int kb3930_probe(struct i2c_client *client)
>  			devm_gpiod_get_array_optional(dev, "off", GPIOD_IN);
>  		if (IS_ERR(ddata->off_gpios))
>  			return PTR_ERR(ddata->off_gpios);
> +		if (!ddata->off_gpios)
> +			return -ENOMEM;

I don't see many other call sites checking for NULL - why is this
different?

What about IS_ERR_OR_NULL() instead?

>  		if (ddata->off_gpios->ndescs < 2) {
>  			dev_err(dev, "invalid off-gpios property\n");
>  			return -EINVAL;
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
