Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038C22D4CB;
	Wed,  5 Feb 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758345; cv=none; b=G5Myn47SO2m+qe6Ng8yrUzJzn/e+J/m+yxYvj4H8smIqMUX/Q8VltwJoIzV/N+edK8Epq+3BuhZVcPJVs66ewAA6fAuGLTqJ+VBcS8H7oKby5TXZmVpAYbSDEeWLImEoWvCHqGq5IAkOgGzUUMiSh2EIxUjaLLu/5BkAr+WLu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758345; c=relaxed/simple;
	bh=Yw42UYrTyinasU5Qu2fQg6mCOFtop1VHNJFftU7VMTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at8Lm2/IU0i1I68GEGhGxfaS9Kze5M1s7u7bAvpQxnRGjkVXYjZlCVWSBaMhnLRpgMKxcQqkmCQT3cmHbHILj9pGwO8IP8+znhUGvSOvvZRqnLO/SWFjCZUj1A1DRi8iBdR5a4ZPI1rqXI02NRP0vYPPhXHDZHKUq2ieU4h8oAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b/SsaiqP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b/SsaiqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A5C4CEE3;
	Wed,  5 Feb 2025 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738758344;
	bh=Yw42UYrTyinasU5Qu2fQg6mCOFtop1VHNJFftU7VMTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/SsaiqPMMxvm0kNuHggp7/30o+JNHYoncM158ZEK/yUUuEjI8X9l0IqfHNx94iko
	 vizTEO94hFx1Tdq1PCUg3rw04ol5rEU35FlN8Tsp5/+1PFF9W3L1XMIwg9EXfmcwjs
	 9TSPHEA2nw1YFpBUCoR5IUEO5ffZufUMiN+KcOaU=
Date: Wed, 5 Feb 2025 13:25:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dave Penkler <dpenkler@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nihar Chaithanya <niharchaithanya@gmail.com>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpib: mark pnp_device_id tables as __maybe_unused
Message-ID: <2025020532-roast-shortage-4086@gregkh>
References: <20250205121244.322054-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205121244.322054-1-arnd@kernel.org>

On Wed, Feb 05, 2025 at 01:12:26PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This variable is not referenced in either of these two drivers driver,
> causing a warning when they are built-in and W=1 warnings are enabled
> with gcc:
> 
> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: error: 'tnt4882_pnp_table' defined but not used [-Werror=unused-const-variable=]
>  1507 | static const struct pnp_device_id tnt4882_pnp_table[] = {
>       |                                   ^~~~~~~~~~~~~~~~~
> drivers/staging/gpib/hp_82341/hp_82341.c:811:35: error: 'hp_82341_pnp_table' defined but not used [-Werror=unused-const-variable=]
>   811 | static const struct pnp_device_id hp_82341_pnp_table[] = {
> 
> The MODULE_DEVICE_TABLE() entry does have the effect of loading
> the module when the PNP device is detected, so it is still needed
> for the modular case.
> 
> Ideally the drivers should be converted to pnp_register_driver(),
> which would lead to the ID table actually being used.
> 
> As a simpler workaround, add a __maybe_unused annotation to shut
> up the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/gpib/hp_82341/hp_82341.c    | 2 +-
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
> index 800f99c05566..7284311e04e2 100644
> --- a/drivers/staging/gpib/hp_82341/hp_82341.c
> +++ b/drivers/staging/gpib/hp_82341/hp_82341.c
> @@ -808,7 +808,7 @@ static void hp_82341_detach(gpib_board_t *board)
>  	hp_82341_free_private(board);
>  }
>  
> -static const struct pnp_device_id hp_82341_pnp_table[] = {
> +static __maybe_unused const struct pnp_device_id hp_82341_pnp_table[] = {
>  	{.id = "HWP1411"},
>  	{.id = ""}
>  };
> diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> index 2e1c3cbebaca..cf3b2a0eb93d 100644
> --- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> +++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> @@ -1390,7 +1390,7 @@ static struct pci_driver tnt4882_pci_driver = {
>  	.probe = &tnt4882_pci_probe
>  };
>  
> -static const struct pnp_device_id tnt4882_pnp_table[] = {
> +static __maybe_unused const struct pnp_device_id tnt4882_pnp_table[] = {

I see this happening in many different drivers right now, what is so
unique about pnp that causes this?  Shouldn't we fix up the
MODULE_DEVICE_TABLE() macro to not require stuff like this instead?

thanks,

greg k-h
