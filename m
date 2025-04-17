Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEA218845;
	Thu, 17 Apr 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878127; cv=none; b=c6EDx1CtCjYGlTurA7pYgDYGaYv+73Qkon1dfHzVP0iUVbujPXqJ0p5F7YpH4xlj/Jex+sjryo0rKy5x5VPmi1mxzHW3+V4LFafZWdiMTKGOZLrMC8RO+WxBOJjpK6BO7w+qd3h6Sxhr2sW3mF1EWorPYLj1TXh9+TA+gQa9xxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878127; c=relaxed/simple;
	bh=3Guob2VmuutBCBMwoD8YsabQN8PE9ZpuNHgFAtmcvHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PevAzM5EaI0T54yf/LiSt+Itvv0YdTDhmDrOWbqBtydq2cXL38M6fUZIjX7R3ETH0LmJzMvGxupea4bix7YP6xBHKmchXHH+NgiGOCASHlxVdGhup7dhShpCBJnl6vzMx6FQ+r1BMxnim32DklavwvIDYcxFD/soOPQ6se/Hebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0GnlhWlM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0GnlhWlM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFF4C4CEE4;
	Thu, 17 Apr 2025 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744878125;
	bh=3Guob2VmuutBCBMwoD8YsabQN8PE9ZpuNHgFAtmcvHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0GnlhWlMg/eGs9SsDusivpz6SHlV0uSXsb3EpZ8awKET5op16AG1G4ao7jWnp4LcQ
	 /q8esY4qJLQIfALJdKPGtamVIyjA05SPRF6LW33tvl4qOmhABASbYYf42/c6qrlqtO
	 EQ0UNmiPRC1qEH9sSCDzydA8FYYEtMXvh9SIbzd4=
Date: Thu, 17 Apr 2025 10:22:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: host: omap: Do not enable by default during compile
 testing
Message-ID: <2025041747-cruncher-exposure-590c@gregkh>
References: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417074634.81295-1-krzysztof.kozlowski@linaro.org>

On Thu, Apr 17, 2025 at 09:46:34AM +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> For longer rationale:
> https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
> ---
>  drivers/usb/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d011d6c753ed..6dedacba94b3 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -225,7 +225,7 @@ config USB_EHCI_HCD_OMAP
>  	tristate "EHCI support for OMAP3 and later chips"
>  	depends on ARCH_OMAP || COMPILE_TEST
>  	depends on NOP_USB_XCEIV
> -	default y
> +	default ARCH_OMAP

Should this get a "Fixes:" tag as well?

thanks,

greg k-h
