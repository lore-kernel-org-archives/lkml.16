Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12B1A00ED;
	Thu, 15 May 2025 07:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294367; cv=none; b=nh8qLdEcTWxkAViDNkjPlqslVbC+ia+i65fuZk43ZxY+24CyIt3PQXXOnuAg3doRVSOIkX3ohr/ogN6PV6Zn+/mnV5oyDrEDj7lataWLvDrwY1MWtTevfi/4FU2KBC7j0/cCjI65wp1Q7XGrPy7LoD1Msq7ZOCle43FbXeeX7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294367; c=relaxed/simple;
	bh=cybRQ+Wx91KXl/of7OapnUi16eL4POqwhKNkGSrkn1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=se/Lc2JbXvN6Ji/PpZqjlbz13/wpAR8CcetcrO4txUSJF/qZsT/q4/b9fMbsx9VAmKQsYRymW6iCNLwNeJH7J9+IRnYU10CBNuBl5zvDyiD6zNdVrmb4GSFeV5eOdttyKr1AiRxoffqWjE91EpnIPRttKMOQe07++MLt24Li5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tH+g9LS4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tH+g9LS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE968C4CEE7;
	Thu, 15 May 2025 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747294367;
	bh=cybRQ+Wx91KXl/of7OapnUi16eL4POqwhKNkGSrkn1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tH+g9LS4UwdaxaMmWSEOBnroWcK5n2FjHOFkMaqgOGM/0FVplw/rjur3yX9DnRiLp
	 LGRSihQPSs4wHwdaW3RGHL0BaGfpIFiqXBw94hVNy229zZ2doQRjkBZtVFMPm9cBgG
	 GdAwz6rw2K05zv3cP/1VA2nT5gz4djUmMvUC27o8=
Date: Thu, 15 May 2025 09:30:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: mathias.nyman@intel.com, quic_ugoswami@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] xhci: Add a quirk for full reset on removal
Message-ID: <2025051547-colossal-dismount-ee4d@gregkh>
References: <20250515040207.1253690-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515040207.1253690-1-royluo@google.com>

On Thu, May 15, 2025 at 04:02:07AM +0000, Roy Luo wrote:
> Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
> helper") introduced an optimization to xhci_reset() during xhci removal,
> allowing it to bail out early without waiting for the reset to complete.
> 
> This behavior can cause issues on SNPS DWC3 USB controller with dual-role
> capability. When the DWC3 controller exits host mode and removes xhci
> while a reset is still in progress, and then tries to configure its
> hardware for device mode, the ongoing reset leads to register access
> issues; specifically, all register reads returns 0. These issues extend
> beyond the xhci register space (which is expected during a reset) and
> affect the entire DWC3 IP block, causing the DWC3 device mode to
> malfunction.
> 
> To address this, introduce the `XHCI_FULL_RESET_ON_REMOVE` quirk. When this
> quirk is set, xhci_reset() always completes its reset handshake, ensuring
> the controller is in a fully reset state before proceeding.
> 
> Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  drivers/usb/host/xhci.c      | 8 +++++++-
>  drivers/usb/host/xhci.h      | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 3155e3a842da..19c5c26a8e63 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -265,6 +265,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
>  			xhci->quirks |= XHCI_SKIP_PHY_INIT;
>  
> +		if (device_property_read_bool(tmpdev, "xhci-full-reset-on-remove-quirk"))
> +			xhci->quirks |= XHCI_FULL_RESET_ON_REMOVE;
> +
>  		device_property_read_u32(tmpdev, "imod-interval-ns",
>  					 &xhci->imod_interval);
>  	}
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 90eb491267b5..4f091d618c01 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -198,6 +198,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>  	u32 command;
>  	u32 state;
>  	int ret;
> +	unsigned int exit_state;
>  
>  	state = readl(&xhci->op_regs->status);
>  
> @@ -226,8 +227,13 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
>  	if (xhci->quirks & XHCI_INTEL_HOST)
>  		udelay(1000);
>  
> +	if (xhci->quirks & XHCI_FULL_RESET_ON_REMOVE)
> +		exit_state = 0;
> +	else
> +		exit_state = XHCI_STATE_REMOVING;
> +
>  	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->command,
> -				CMD_RESET, 0, timeout_us, XHCI_STATE_REMOVING);
> +				CMD_RESET, 0, timeout_us, exit_state);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 242ab9fbc8ae..ac65af788298 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1637,6 +1637,7 @@ struct xhci_hcd {
>  #define XHCI_WRITE_64_HI_LO	BIT_ULL(47)
>  #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
>  #define XHCI_ETRON_HOST	BIT_ULL(49)
> +#define XHCI_FULL_RESET_ON_REMOVE	BIT_ULL(50)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> 
> base-commit: c94d59a126cb9a8d1f71e3e044363d654dcd7af8
> -- 
> 2.49.0.1045.g170613ef41-goog
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
