Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E51EE7A3;
	Wed,  2 Apr 2025 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594708; cv=none; b=Wo3FD+f7p8dKvU4suB61/Nmbw+nC4Wgkz4ugwM56I4ES1u/YFLGseVSoZovO8zlG0dxn7e3YwOdNaSIYn1IGEVrFxxkMjEDCld+0VkvlYhSHUFwJzykyadT3qxeNqUvacLteylHQ74ERCqHENYOdZNsx1x5vLrjgPsZeFg3EVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594708; c=relaxed/simple;
	bh=w+yeqK9xClWsAgmQxezJUwFOPYFu0MMYZog6QLurXKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8cdRaZ1ecuLTH45P6PCNfuNm7bQsLBDbtcvNKsmWEKVsRsJezMEhziNsbxlppFeC05vyEqVxIGdiH7mzHL+Jhe/jHz26w/f57TD5mh6DV2rmUYMxpeqsJ8tDxW/WwyNtRLOfqOMzk1fy4jZ499fpEzMLPCrH+xLYXDnLr/X+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tRwAVBQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tRwAVBQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CC2C4CEDD;
	Wed,  2 Apr 2025 11:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743594708;
	bh=w+yeqK9xClWsAgmQxezJUwFOPYFu0MMYZog6QLurXKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRwAVBQR2zD4PYGnxqdN8X6pyHwCLTPM8sN8iQf8CjB26EfJfUGwwMrI3/QPee7Ak
	 YEZLRID+KHvGquG4BsBR9V8PXyJVw0pjntqFR+8kmvRSZ3Qql/r4dA56whmTwmxqhp
	 A+p/AIpKHUwptEfoc9cZEicvnIqFeonx34IJvZ+w=
Date: Wed, 2 Apr 2025 12:50:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	eamanu@riseup.net, linux-kernel@vger.kernel.org,
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
Message-ID: <2025040206-spearfish-haggler-efed@gregkh>
References: <20250402113158.45760-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402113158.45760-1-gshahrouzi@gmail.com>

On Wed, Apr 02, 2025 at 07:31:58AM -0400, Gabriel Shahrouzi wrote:
> Remove trailing whitespace to comply with kernel coding style.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> index b93d74a5b9a5..48bf7f66a06e 100644
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> @@ -209,7 +209,7 @@
>  #define RTL8723B_TRANS_END															\
>  	/* format */																\
>  	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
> -	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
> +	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
>  
>  
>  extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
